---
# required metadata

title: Migrate AD RMS-Azure Information Protection
description: Instructions to migrate your Active Directory Rights Management Services (AD RMS) deployment to Azure Information Protection. After the migration, users will still have access to documents and email messages that your organization protected by using AD RMS, and newly protected content will use Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 07/11/2018
ms.topic: conceptual
ms.service: information-protection
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

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](http://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

Use the following set of instructions to migrate your Active Directory Rights Management Services (AD RMS) deployment to Azure Information Protection. 

After the migration, your AD RMS servers are no longer in use but users still have access to documents and email messages that your organization protected by using AD RMS. Newly protected content will use the Azure Rights Management service (Azure RMS) from Azure Information Protection.

Not sure whether this AD RMS migration is right for your organization?

- For an introduction to Azure Information Protection, see [What is Azure Information Protection?](./what-is-information-protection.md)

- For a comparison of Azure Information Protection with AD RMS, see [Comparing Azure Information Protection and AD RMS](./compare-on-premise.md).

## Recommended reading before you migrate to Azure Information Protection

Although not required, you might find it useful to read the following documentation before you start the migration. This knowledge provides you with a better understanding of how the technology works when it is relevant to your migration step.

- [Planning and implementing your Azure Information Protection tenant key](./plan-implement-tenant-key.md): Understand the key management options that you have for your Azure Information Protection tenant where your SLC key equivalent in the cloud is either managed by Microsoft (the default) or managed by you (the "bring your own key", or BYOK configuration). 

- [RMS service discovery](./rms-client/client-deployment-notes.md#rms-service-discovery): This section of the RMS client deployment notes explains that the order for service discovery is **registry**, then **SCP**, then **cloud**. During the migration process when the SCP is still installed, you configure clients with registry settings for your Azure Information Protection tenant so that they do not use the AD RMS cluster returned from the SCP.

- [Overview of the Microsoft Rights Management connector](./deploy-rms-connector.md#overview-of-the-microsoft-rights-management-connector): This section from the RMS connector documentation explains how your on-premises servers can connect to the Azure Rights Management service to protect documents and emails.

In addition, if you are familiar with how AD RMS works, you might find it useful to read [How does Azure RMS work? Under the hood](./how-does-it-work.md) to help you identify which technology processes are the same or different for the cloud version.

## Prerequisites for migrating AD RMS to Azure Information Protection

Before you start the migration to Azure Information Protection, make sure that the following prerequisites are in place and that you understand any limitations.

- **A supported RMS deployment:**
    
    - The following releases of AD RMS support a migration to Azure Information Protection:
    
        - Windows Server 2008 R2 (x64)
        
        - Windows Server 2012 (x64)
        
        - Windows Server 2012 R2 (x64)
        
        - Windows Server 2016 (x64)
        
    - All valid AD RMS topologies are supported:
    
        - Single forest, single RMS cluster
        
        - Single forest, multiple licensing-only RMS clusters
        
        - Multiple forests, multiple RMS clusters
        
    Note: By default, multiple AD RMS clusters migrate to a single tenant for Azure Information Protection. If you want separate tenants for Azure Information Protection, you must treat them as different migrations. A key from one RMS cluster cannot be imported to more than one tenant.

- **All requirements to run Azure Information Protection, including a subscription for Azure Information Protection (the Azure Rights Management service is not activated):**

	See [Requirements for Azure Information Protection](./requirements.md).

    Note that if you have computers that run Office 2010, you must install the Azure Information Protection client, because this client provides the ability to authenticate users to cloud services. For later versions of Office, the Azure Information Protection client is required for classification and labeling, and is optional but recommended if you want to only protect data. For more information, see the [Azure Information Protection client admin guide](./rms-client/client-admin-guide.md).

	Although you must have a subscription for Azure Information Protection before you can migrate from AD RMS, we recommend that the Rights Management service for your tenant is not activated before you start the migration. The migration process includes this activation step after you have exported keys and templates from AD RMS and imported them to your tenant for Azure Information Protection. However, if the Rights Management service is already activated, you can still migrate from AD RMS with some additional steps.


- **Preparation for Azure Information Protection:**

	- Directory synchronization between your on-premises directory and Azure Active Directory

	- Mail-enabled groups in Azure Active Directory

	See [Preparing users and groups for Azure Information Protection](prepare.md).

- **If you have used the Information Rights Management (IRM) functionality of Exchange Server** (for example, transport rules and Outlook Web Access) or SharePoint Server with AD RMS:

	- Plan for a short period of time when IRM will not be available on these servers
 
	You can continue to use IRM on these servers after the migration. However, one of the migration steps is to temporarily disable the IRM service, install and configure a connector, reconfigure the servers, and then re-enable IRM.

	This is the only interruption to service during the migration process.

- **If you want to manage your own Azure Information Protection tenant key by using an HSM-protected key**:

	- This optional configuration requires Azure Key Vault and an Azure subscription that supports Key Vault with HSM-protected keys. For more information, see the [Azure Key Vault Pricing page](https://azure.microsoft.com/pricing/details/key-vault/). 


### Cryptographic mode considerations

If your AD RMS cluster is currently in Cryptographic Mode 1, do not upgrade the cluster to Cryptographic Mode 2 before you start the migration. Instead, migrate using Cryptographic Mode 1 and you can rekey your tenant key at the end of the migration, as one of the post migration tasks.

To confirm the AD RMS cryptographic mode:
 
- For Windows Server 2012 R2 and Windows 2012: AD RMS cluster properties > **General** tab. 

- For Windows Server 2008 R2: Check whether the [RSA key length is increased to 2048 bits for AD RMS in Windows Server 2008 R2 and in Windows Server 2008](https://support.microsoft.com/help/2627272/rsa-key-length-is-increased-to-2048-bits-for-ad-rms-in-windows-server ) hotfix is installed. If it is not, your AD RMS cluster is running in Cryptographic Mode 1.

### Migration limitations

- If you have software and clients that are not supported by the Rights Management service that is used by Azure Information Protection, they will not be able to protect or consume content that is protected by Azure Rights Management. Be sure to check the supported applications and clients sections from [Requirements for Azure Rights Management](./requirements.md).

- If your AD RMS deployment is configured to collaborate with external partners (for example, by using trusted user domains or federation), they must also migrate to Azure Information Protection either at the same time as your migration, or as soon as possible afterwards. To continue to access content that your organization previously protected by using Azure Information Protection, they must make client configuration changes that are similar to those that you make, and included in this document.
    
    Because of the possible configuration variations that your partners might have, exact instructions for this reconfiguration are out of scope for this document. However, see the next section for planning guidance and for additional help, [contact Microsoft Support](./information-support.md#support-options-and-community-resources).

## Migration planning if you collaborate with external partners

Include your AD RMS partners in your planning phase for migration because they must also migrate to Azure Information Protection. Before you do any of the following migration steps, make sure that the following is in place:

- They have an Azure Active Directory tenant that supports the Azure Rights Management service.  
    
    For example, they have an Office 365 E3 or E5 subscription, or an Enterprise Mobility + Security subscription, or a standalone subscription for Azure Information Protection.

- Their Azure Rights Management service is not yet activated but they know their Azure Rights Management service URL.

    They can get this information by installing the Azure Rights Management Tool, connecting to the service ([Connect-AadrmService](/powershell/aadrm/vlatest/connect-aadrmservice)), and then viewing their tenant information for the Azure Rights Management service ([Get-AadrmConfiguration](/powershell/aadrm/vlatest/get-aadrmconfiguration)).

- They provide you with the URLs for their AD RMS cluster and their Azure Rights Management service URL, so that you can configure your migrated clients to redirect requests for their AD RMS protected content to their tenant's Azure Rights Management service. Instructions for configuring client redirection are in step 7.

- They import their AD RMS cluster root keys (SLC) into their tenant before you start to migrate your users. Similarly, you must import your AD RMS cluster root keys before they start to migrate their users. Instructions for importing the key are covered in this migration process, [Step 4. Export configuration data from AD RMS and import it to Azure Information Protection](migrate-from-ad-rms-phase2.md#step-4-export-configuration-data-from-ad-rms-and-import-it-to-azure-information-protection). 

## Overview of the steps for migrating AD RMS to Azure Information Protection

The migration steps can be divided into five phases that can be done at different times, and by different administrators.

[**PHASE 1: MIGRATION PREPARATION**](migrate-from-ad-rms-phase1.md)

- **Step 1: Install the AADRM PowerShell module and identify your tenant URL**

    The migration process requires you to run one or more of the PowerShell cmdlets from the AADRM module. You will need to know your tenant's Azure Rights Management service URL to complete many of the migration steps, and you can identity this value by using PowerShell.

- **Step 2. Prepare for client migration**

    If you cannot migrate all clients at once and will migrate them in batches, use onboarding controls and deploy a pre-migration script. However, if you will migrate everything at the same time rather than do a phased migration, you can skip this step.

- **Step 3: Prepare your Exchange deployment for migration**

    This step is required if you currently use the IRM feature of Exchange Online or Exchange on-premises to protect emails. However, if you will migrate everything at the same time rather than do a phased migration, you can skip this step.

[**PHASE 2: SERVER-SIDE CONFIGURATION FOR AD RMS**](migrate-from-ad-rms-phase2.md)

- **Step 4. Export configuration data from AD RMS and import it to Azure Information Protection**

    You export the configuration data (keys, templates, URLs) from AD RMS to an XML file, and then upload that file to the Azure Rights Management service from Azure Information Protection, by using the Import-AadrmTpd PowerShell cmdlet. Then, identify which imported Server Licensor Certificate (SLC) key to use as your tenant key for the Azure Rights Management service. Additional steps might be needed, depending on your AD RMS key configuration:

	- **Software-protected key to software-protected key migration**:

	    Centrally managed, password-based keys in AD RMS to Microsoft-managed Azure Information Protection tenant key. This is the simplest migration path and no additional steps are required.

	- **HSM-protected key to HSM-protected key migration**:

	    Keys that are stored by an HSM for AD RMS to customer-managed Azure Information Protection tenant key (the “bring your own key” or BYOK scenario). This requires additional steps to transfer the key from your on-premises Thales HSM to Azure Key Vault and authorize the Azure Rights Management service to use this key. Your existing HSM-protected key must be module-protected; OCS-protected keys are not supported by Rights Management services.

	- **Software-protected key to HSM-protected key migration**:

	    Centrally managed, password-based keys in AD RMS to customer-managed Azure Information Protection tenant key (the “bring your own key” or BYOK scenario). This requires the most configuration because you must first extract your software key and import it to an on-premises HSM, and then do the additional steps to transfer the key from your on-premises Thales HSM to an Azure Key Vault HSM and authorize the Azure Rights Management service to use the key vault that stores the key.

- **Step 5. Activate the Azure Rights Management service**

    If possible, do this step after the import process and not before. Additional steps are required if the service was activated before the import.

- **Step 6. Configure imported templates**

    When you import your rights policy templates, their status is archived. If you want users to be able to see and use them, you must change the template status to be published in the Azure classic portal.


[**PHASE 3: CLIENT-SIDE CONFIGURATION**](migrate-from-ad-rms-phase3.md)

- **Step 7: Reconfigure Windows computers to use Azure Information Protection**

    Existing Windows computers must be reconfigured to use the Azure Rights Management service instead of AD RMS. This step applies to computers in your organization, and to computers in partner organizations if you have collaborated with them while you were running AD RMS.

[**PHASE 4: SUPPORTING SERVICES CONFIGURATION**](migrate-from-ad-rms-phase4.md)

- **Step 8: Configure IRM integration for Exchange Online**

    This step completes the AD RMS migration for Exchange Online to now use the Azure Rights Management service.

- **Step 9: Configure IRM integration for Exchange Server and SharePoint Server**

    This step completes the AD RMS migration for Exchange or SharePoint on-premises to now use the Azure Rights Management service, which requires deploying the Rights Management connector.


[**PHASE 5: POST MIGRATION TASKS**](migrate-from-ad-rms-phase5.md )

- **Step 10: Deprovision AD RMS**

    When you have confirmed that all Windows computers are using the Azure Rights Management service and are no longer accessing your AD RMS servers, you can deprovision your AD RMS deployment.

- **Step 11: Complete client migration tasks**

    If you have deployed the [mobile device extension](http://technet.microsoft.com/library/dn673574.aspx) to support mobile devices such as iOS phones and iPads, Android phones and tablets, Windows phone, and Mac computers, you must remove the SRV records in DNS that redirected these clients to use AD RMS. 
    
    The onboarding controls that you configured during the preparation phase are no longer needed. However, if you did not use onboarding controls because you chose to migrate everything at the same time rather than do a phased migration, you can skip the instructions to remove the onboarding controls.
    
    If your Windows computers are running Office 2010, check whether you need to disable the **AD RMS Rights Policy Template Management (Automated)** task.

- **Step 12: Rekey your Azure Information Protection tenant key**

    This step is recommended if you were not running in Cryptographic Mode 2 before the migration.


## Next steps
To start the migration, go to [Phase 1 - preparation](migrate-from-ad-rms-phase1.md).

