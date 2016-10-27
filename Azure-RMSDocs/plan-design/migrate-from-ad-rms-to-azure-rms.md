---
# required metadata

title: Migrating from AD RMS to Azure Information Protection | Azure Information Protection
description: Instructions to migrate your Active Directory Rights Management Services (AD RMS) deployment to Azure Information Protection. After the migration, users will still have access to documents and email messages that your organization protected by using AD RMS, and newly protected content will use Azure Information Protection.
author: cabailey
manager: mbaldwin
ms.date: 10/27/2016
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 828cf1f7-d0e7-4edf-8525-91896dbe3172

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Migrating from AD RMS to Azure Information Protection

>*Applies to: Active Directory Rights Management Services, Azure Information Protection, Office 365*

Use the following set of instructions to  migrate your Active Directory Rights Management Services (AD RMS) deployment to Azure Information Protection. After the migration, users will still have access to documents and email messages that your organization protected by using AD RMS, and newly protected content will use the Azure Rights Management service from Azure Information Protection.

Not sure whether this AD RMS migration is right for your organization?

-   For an introduction to Azure Information Protection, see [What is Azure Azure Information Protection?](../understand-explore/what-is-information-protection.md)

-   For a comparison of Azure Information Protection with AD RMS, see [Comparing Azure Information Protection and AD RMS](../understand-explore/compare-azure-rms-ad-rms.md).

## Recommended reading before you migrate to Azure Information Protection

Although not required, you might find it useful to read the following before you start the migration so that you have a better understanding of how the technology works when it is relevant to your migration step:

- [Planning and implementing your Azure Information Protection tenant key](../plan-design/plan-implement-tenant-key.md): Understand the key management options that you have for your Azure Information Protection tenant where your SLC key equivalent in the cloud is either managed by Microsoft (the default) or managed by you (the "bring your own key", or BYOK configuration). 

- [RMS service discovery](../rms-client/client-deployment-notes.md#rms-service-discovery): This section of the RMS client deployment notes explains that the order for service discovery is **registry** > **SCP** > **cloud**. During the migration process when the SCP is still installed, you configure clients with registry settings for your Azure Information Protection tenant so that they do not use the AD RMS cluster returned from the SCP.

- [Overview of the Microsoft Rights Management connector](../deploy-use/deploy-rms-connector.md#overview-of-the-microsoft-rights-management-connector): This section from the RMS connector documentation explains how your on-premises servers can connect to the Azure Rights Management service to protect documents and emails.

In addition, if you are familiar with how AD RMS works, you might find it useful to read [How does Azure RMS work? Under the hood](../understand-explore/how-does-it-work.md) to help you identify which technology processes are the same or different for the cloud version.

## Prerequisites for migrating AD RMS to Azure Information Protection
Before you start the migration to Azure Information Protection, make sure that the following prerequisites are in place and that you understand any limitations.

- **A supported RMS deployment:**
    
    - The following releases of AD RMS support a migration to Azure Information Protection:
    
        - Windows Server 2008 R2 (x64)
        
        - Windows Server 2012 (x64)
        
        - Windows Server 2012 R2 (x64)
        
        - Windows Server 2016 (x64)
        
    - Cryptographic Mode 2:

        - Your AD RMS servers and clients must be running in Cryptographic Mode 2 before you begin the migration to Azure Information Protection.
        
        Although the current server licensor certificate (SLC) key must be using Cryptographic Mode 2, previous keys that were configured for Cryptographic Mode 1 are supported by Azure Information Protection as archived keys. For more information about the cryptographic modes and how to move to Cryptographic Mode 2, see [AD RMS Cryptographic Modes](https://technet.microsoft.com/library/hh867439(v=ws.10).aspx).
        
    - All valid AD RMS topologies are supported:
    
        - Single forest, single RMS cluster
        
        - Single forest, multiple licensing-only RMS clusters
        
        - Multiple forests, multiple RMS clusters
        
    Note: By default, multiple RMS clusters migrate to a single Azure Information Protection tenant. If you want separate Azure Information Protection tenants, you must treat them as different migrations. A key from one RMS cluster cannot be imported to more than one Azure Information Protection tenant.

- **All requirements to run Azure Information Protection, including an Azure Information Protection tenant (not activated):**

	See [Requirements for Azure Information Protection](../get-started/requirements-azure-rms.md).

	Although you must have an Azure Information Protection tenant before you can migrate from AD RMS, we recommend that the Rights Management service is not activated prior to the migration. The migration process includes this step after you have exported keys and templates from AD RMS and imported them to Azure Information Protection. However, if the Rights Management service is already activated, you can still migrate from AD RMS.


- **Preparation for Azure Information Protection:**

	- Directory synchronization between your on-premises directory and Azure Active Directory

	- Mail-enabled groups in Azure Active Directory

	See [Preparing for Azure Information Protection](prepare.md).


- **If you have used the Information Rights Management (IRM) functionality of Exchange Server** (for example, transport rules and Outlook Web Access) or SharePoint Server with AD RMS:

	- Plan for a short period of time when IRM will not be available on these servers
 
	You can continue to use IRM on these servers with the Azure Rights Management service after the migration. However, one of the migration steps is to temporarily disable the IRM service, install and configure a connector, reconfigure the servers, and then re-enable IRM.

	This is the only interruption to service during the migration process.

- **If you want to manage your own Azure Information Protection tenant key by using an HSM-protected key**:

	- This optional configuration requires Azure Key Vault and an Azure subscription that supports Key Vault with HSM-protected keys. For more information, see the [Azure Key Vault Pricing page](https://azure.microsoft.com/en-us/pricing/details/key-vault/). 


Limitations:

-   Although the migration process supports migrating your server licensing certificate (SLC) key to a hardware security module (HSM) for Azure Information Protection, Exchange Online does not currently support this configuration for the Rights Management service that is used by Azure Information Protection. If you want full IRM functionality with Exchange Online after you migrate to Azure Information Protection, your Azure Information Protection tenant key must be [managed by Microsoft](../plan-design/plan-implement-tenant-key.md#choose-your-tenant-key-topology-managed-by-microsoft-the-default-or-managed-by-you-byok). Alternatively, you can run IRM with reduced functionality in Exchange Online when your Azure Information Protection tenant is managed by you (BYOK). For more information about using Exchange Online with the Azure Rights Management service, see [Step 6. Configure IRM integration for Exchange Online](migrate-from-ad-rms-phase3.md#step-6-configure-irm-integration-for-exchange-online) from these migration instructions.

-   If you have software and clients that are not supported by the Rights Management service that is used by Azure Information Protection, they will not be able to protect or consume content that is protected by Azure Rights Management. Be sure to check the supported applications and clients sections from the [Requirements for Azure Rights Management](../get-started/requirements-azure-rms.md) article.

-   If you import your on-premises key to Azure Information Protection as archived (you do not set the TPD to be the active during the import process) and you migrate users in batches for a phased migration, content that is newly protected by the migrated users will not be accessible to users who remain on AD RMS. In this scenario, whenever  possible, keep the migration time short and migrate users in logical batches such that if they collaborate with one another, they are migrated together.

    This limitation does not apply when you set the TPD to active during the import process, because all users will protect content by using the same key. We recommend this configuration because it lets you migrate all users independently and at your own pace.

-   If you collaborate with external partners (for example, by using trusted user domains or federation), they must also migrate to Azure Information Protection either at the same time as your migration, or as soon as possible afterwards. To continue to access content that your organization previously protected by using Azure Information Protection, they must make client configuration changes that are similar to those that you make, and included in this document.

    Because of the possible configuration variations that your partners might have, exact instructions for this reconfiguration are out of scope for this document. For help, [contact Microsoft Support](../get-started/information-support.md#support-options-and-community-resources).

## Overview of the steps for migrating AD RMS to Azure Information Protection


The migration steps can be divided into 4 phases that can be done at different times, and by different administrators.

[**PHASE 1: SERVER-SIDE CONFIGURATION FOR AD RMS**](migrate-from-ad-rms-phase1.md)

- **Step 1: Download the Azure RMS Management Administration Tool**

    The migration process requires you to run one or more of the Windows PowerShell cmdlets from the Azure RMS module that is installed with the Azure RMS Management Administration Tool.

- **Step 2. Export configuration data from AD RMS and import it to Azure Information Protection**

    You export the configuration data (keys, templates, URLs) from AD RMS to an XML file, and then upload that file to the Azure Rights Management service from Azure Information Protection, by using the Import-AadrmTpd Windows PowerShell cmdlet. Additional steps might be needed, depending your on AD RMS key configuration:

	- **Software-protected key to software-protected key migration**:

	    Centrally managed, password-based keys in AD RMS to Microsoft-managed Azure Information Protection tenant key. This is the simplest migration path and no additional steps are required.

	- **HSM-protected key to HSM-protected key migration**:

	    Keys that are stored by an HSM for AD RMS to customer-managed Azure Information Protection tenant key (the “bring your own key” or BYOK scenario). This requires additional steps to transfer the key from your on-premises Thales HSM to Azure Key Vault and authorize the Azure Rights Management service to use this key. Your existing HSM-protected key must be module-protected; OCS-protected keys are not supported by Rights Management services.

	- **Software-protected key to HSM-protected key migration**:

	    Centrally managed, password-based keys in AD RMS to customer-managed Azure Information Protection tenant key (the “bring your own key” or BYOK scenario). This requires the most configuration because you must first extract your software key and import it to an on-premises HSM, and then do the additional steps to transfer the key from your on-premises Thales HSM to an Azure Key Vault HSM and authorize the Azure Rights Management service to use the key vault that stores the key.

- **Step 3. Activate your Azure Information Protection tenant**

    If possible, do this step after the import process and not before.

- **Step 4. Configure imported templates**

    When you import your rights policy templates, their status is archived. If you want users to be able to see and use them, you must change the template status to published in the Azure classic portal.


[**PHASE 2: CLIENT-SIDE CONFIGURATION**](migrate-from-ad-rms-phase2.md)


- **Step 5: Reconfigure clients to use Azure Information Protection**

    Existing Windows computers must be reconfigured to use the Azure Information Protection service instead of AD RMS. This step applies to computers in your organization, and to computers in partner organizations if you have collaborated with them while you were running AD RMS.

    In addition, if you have deployed the [mobile device extension](http://technet.microsoft.com/library/dn673574.aspx) to support mobile devices such as iOS phones and iPads, Android phones and tablets, Windows phone, and Mac computers, you must remove the SRV records in DNS that redirected these clients to use AD RMS


[**PHASE 3: SUPPORTING SERVICES CONFIGURATION**](migrate-from-ad-rms-phase3.md)


- **Step 6: Configure IRM integration with Exchange Online**

    This step is required if you want to use Exchange Online with the Azure Rights Management service from Azure Information Protection.


- **Step 7: Deploy the RMS connector**

    This step is required if you want to use any of the following on-premises services with the Azure Rights Management service to protect Office documents and emails:

	- Exchange Server (for example, transport rules and Outlook Web Access)

	- SharePoint Server

	- Windows Server that runs File Classification Infrastructure (FCI)


[**PHASE 4: POST MIGRATION TASKS**](migrate-from-ad-rms-phase4.md )

- **Step 8: Decommission AD RMS**

    When you have confirmed that all clients are using Azure Information Protection and no longer accessing the AD RMS servers, you can decommission your AD RMS deployment.


- **Step 9: Re-key your Azure Information Protection tenant key**

    This step is optional but recommended if your chosen Azure Information Protection tenant key topology from step 2 is Microsoft-managed. This step is not applicable if your chosen Azure Information Protection tenant key topology is customer-managed (BYOK).


## Next steps
To start the migration, go to [Phase 1 - server-side configuration](migrate-from-ad-rms-phase1.md).

