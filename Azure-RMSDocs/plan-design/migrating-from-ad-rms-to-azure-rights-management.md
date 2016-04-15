---
# required metadata

title: Migrating from AD RMS to Azure Rights Management | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
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

# Migrating from AD RMS to Azure Rights Management
Use the following set of instructions to  migrate your Active Directory Rights Management Services (AD RMS) deployment to Azure Rights Management (Azure RMS). After the migration, users will still have access to documents and email messages that your organization protected by using AD RMS, and newly protected content will use Azure RMS.

Not sure whether this AD RMS migration is right for your organization?

-   For an introduction to Azure RMS,  the business problems that it can solve, what it looks like to administrators and users, and how it works, see [What is Azure Rights Management?](../understand-explore/what-is-azure-rights-management.md)

-   For a comparison of Azure RMS with AD RMS, see [Comparing Azure Rights Management and AD RMS](../understand-explore/comparing-azure-rights-management-and-ad-rms.md).

## Prerequisites for migrating AD RMS to Azure RMS
Before you start the migration to Azure RMS, make sure that the following prerequisites are in place and that you understand any limitations.


- **A supported RMS deployment**

	All releases of AD RMS from Windows Server 2008 through Windows Server 2012 R2 support a migration to Azure RMS:

	- Windows Server 2008 (x86 or x64)

	- Windows Server 2008 R2 (x64)

	- Windows Server 2012 (x64)

	- Windows Server 2012 R2 (x64)

	All valid AD RMS topologies are supported:

	- Single forest, single RMS cluster

	- Single forest, multiple licensing-only RMS clusters

	- Multiple forests, multiple RMS clusters

	**Note**: By default, multiple RMS clusters migrate to a single Azure RMS tenant. If you want different RMS tenants, you must treat them as different migrations. A key from one RMS cluster cannot be imported to more than one Azure RMS tenant.


- **All requirements to run Azure RMS, including an Azure RMS tenant (not activated)**

	See [Requirements for Azure Rights Management](../understand-explore/requirements-for-azure-rights-management.md).

	Although you must have an Azure RMS tenant before you can migrate from AD RMS, we recommend that you do not activate the Rights Management service before the migration. The migration process includes this step after you have exported keys and templates from AD RMS and imported them to Azure RMS. However, if Azure RMS is already activated, you can still migrate from AD RMS.


- **Preparation for Azure RMS:**

	- Directory synchronization between your on-premises directory and Azure Active Directory

	- Mail-enabled groups in Azure Active Directory

	See [Preparing for Azure Rights Management](preparing-for-azure-rights-management.md).


- **If you have used the Information Rights Management (IRM) functionality of Exchange Server** (for example, transport rules and Outlook Web Access) or SharePoint Server with AD RMS:

	- Plan for a short period of time when IRM will not be available on these servers
 
	You can continue to use IRM on these servers with Azure RMS after the migration. However, one of the migration steps is to temporarily disable the IRM service, install and configure a connector, reconfigure the servers, and then re-enable IRM.

	This is the only interruption to service during the migration process.


Limitations:

-   Although the migration process supports migrating your server licensing certificate (SLC) key to a hardware security module (HSM) for Azure RMS, Exchange Online does not currently support this configuration. If you want full IRM functionality with Exchange Online after you migrate to Azure RMS, your Azure RMS tenant key must be [managed by Microsoft](../plan-design/planning-and-implementing-your-azure-rights-management-tenant-key.md#choose-your-tenant-key-topology-managed-by-microsoft-the-default-or-managed-by-you-byok-). Alternatively, you can run IRM with reduced functionality in Exchange Online  when your Azure RMS tenant is managed by you (BYOK). For more information about using Exchange Online with Azure RMS, see [Step 6. Configure IRM integration for Exchange Online](../migrating-from-ad-rms-to-azure-rights-management-phase3.md#step-6-configure-irm-integration-for-exchange-online) from these migration instructions.

-   If you have software and clients that are not supported with Azure RMS, they will not be able to protect or consume content that is protected by Azure RMS. Be sure to check the supported applications and clients sections from the [Requirements for Azure Rights Management](../get-started/requirements-for-azure-rights-management.md) article.

-   If you import your on-premises key to Azure RMS as archived (you do not set the TPD to be the active during the import process) and you migrate users in batches for a phased migration, content that is newly protected by the migrated users will not be accessible to users who remain on AD RMS. In this scenario, whenever  possible, keep the migration time short and migrate users in logical batches such that if they collaborate with one another, they are migrated together.

    This limitation does not apply when you set the TPD to active during the import process, because all users will protect content by using the same key. We recommend this configuration because it lets you migrate all users independently and at your own pace.

-   If you collaborate with external partners (for example, by using trusted user domains or federation), they must also migrate to Azure RMS either at the same time as your migration, or as soon as possible afterwards. To continue to access content that your organization previously protected by using AD RMS, they must make client configuration changes that are similar to those that you make, and included in this document.

    Because of the possible configuration variations that your partners might have, exact instructions for this reconfiguration are out of scope for this document. For help, contact Microsoft Customer Support Services (CSS).

## Overview of the steps for migrating AD RMS to Azure RMS


The 9 migration steps can be divided into 4 phases that can be done at different times, and by different administrators.

[**PHASE 1: SERVER-SIDE CONFIGURATION FOR AD RMS**](migrating-from-ad-rms-to-azure-rights-management-phase1.md)

- **Step 1: Download the Azure RMS Management Administration Tool**

    The migration process requires you to run one or more of the Windows PowerShell cmdlets from the Azure RMS module that is installed with the Azure RMS Management Administration Tool.

- **Step 2. Export configuration data from AD RMS and import it to Azure RMS**

    You export the configuration data (keys, templates, URLs) from AD RMS to an XML file, and then upload that file to Azure RMS by using the Import-AadrmTpd Windows PowerShell cmdlet. Additional steps might be needed, depending your on AD RMS key configuration:

	- **Software-protected key to software-protected key migration**:

	    Centrally managed, password-based keys in AD RMS to Microsoft-managed Azure RMS tenant key. This is the simplest migration path and no additional steps are required.

	- **HSM-protected  key to HSM-protected key migration**:

	    Keys that are stored by an HSM for AD RMS to customer-managed Azure RMS tenant key (the “bring your own key” or BYOK scenario). This requires additional steps to transfer the key from your on-premises Thales HSM to the Azure RMS HSM. Your existing HSM-protected key must be module-protected; OCS-protected keys are not supported by the BYOK toolset.

	- **Software-protected key to HSM-protected key migration**:

	    Centrally managed, password-based keys in AD RMS to customer-managed Azure RMS tenant key (the “bring your own key” or BYOK scenario). This requires the most configuration because you must first extract your software key and import it to an on-premises HSM, and then do the additional steps to transfer the key from your on-premises Thales HSM to the Azure RMS HSM.

- **Step 3. Activate your Azure RMS tenant**

    If possible, do this step after the import process and not before.

- **Step 4. Configure imported templates**

    When you import your rights policy templates, their status is archived. If you want users to be able to see and use them, you must change the template status to published in the Azure classic portal.


[**PHASE 2: CLIENT-SIDE CONFIGURATION**](migrating-from-ad-rms-to-azure-rights-management-phase2.md)


- **Step 5: Reconfigure clients to use Azure RMS**

    Existing Windows computers must be reconfigured to use the Azure RMS service instead of AD RMS. This step applies to computers in your organization, and to computers in partner organizations if you have collaborated with them while you were running AD RMS.

    In addition, if you have deployed the [mobile device extension](http://technet.microsoft.com/library/dn673574.aspx) to support mobile devices such as iOS phones and iPads, Android phones and tablets, Windows phone, and Mac computers, you must remove the SRV records in DNS that redirected these clients to use AD RMS


[**PHASE 3: SUPPORTING SERVICES CONFIGURATION**](migrating-from-ad-rms-to-azure-rights-management-phase3.md)


- **Step 6: Configure IRM integration with Exchange Online**

    This step is required if you want to use Exchange Online with Azure RMS.


- **Step 7: Deploy the RMS connector**

    This step is required if you want to use any of the following on-premises services with Azure RMS:

	- Exchange Server (for example, transport rules and Outlook Web Access)

	- SharePoint Server

	- Windows Server that runs File Classification Infrastructure (FCI)


[**PHASE 4: POST MIGRATION TASKS**](migrating-from-ad-rms-to-azure-rights-management-phase4.md )

- **Step: Decommission AD RMS**

    When you have confirmed that all clients are using Azure RMS and no longer accessing the AD RMS servers, you can decommission your AD RMS deployment.


- **Step 9: Re-key your Azure RMS tenant key**

    This step is required if you were not running in Cryptographic Mode 2 before the migration, and optional but recommended for all migrations to help safeguard the security of your Azure RMS tenant key.


## Next steps
To start the migration, go to [Phase 1 - server-side configuration](migrating-from-ad-rms-to-azure-rights-management-phase1.md).

