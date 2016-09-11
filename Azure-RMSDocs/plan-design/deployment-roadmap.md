---
# required metadata

title: Azure Information Protection deployment roadmap | Azure Information Protection
description: Use these steps to prepare for, implement, and manage Azure Information Protection for your organization.
author: cabailey
manager: mbaldwin
ms.date: 08/25/2016
ms.topic: article
ms.prod:
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 086600c2-c5d8-47ec-a4c0-c782e1797486

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Azure Information Protection deployment roadmap

>*Applies to: Azure Information Protection, Office 365*

Use the following steps to prepare for, implement, and manage Azure Information Protection for your organization.

However, if you just want to quickly try Azure Information Protection for yourself, rather than roll it out in a production environment, see [Quick start tutorial for Azure Information Protection](../get-started/infoprotect-quick-start-tutorial.md).

> [!IMPORTANT]
> Before you do the following steps, make sure that you have reviewed [Requirements for Azure Information Protection](../get-started/requirements-azure-rms.md).

Choose the deployment roadmap that's applicable for your organization:

- **Your organization has a Premium subscription in addition to Office 365 with Azure Rights Management:**
    
    Your organization has both these subscriptions:
    
        - An Azure Information Protection Premium subscription (P1 or P2) - either standalone subscription or as part of the Enterprise Mobility + Security suite or Secure Productive Enterprise suite.
    
        -  An Office 365 subscription that supports protecting documents and emails with the Azure Rights Management service (Azure RMS).
            
- **Your organization has just Office 365 with Azure Rights Management:**
    
    Your organization does not have a Premium subscription for Azure Information Protection, but  has the following:
    
        -  An Office 365 subscription that supports protecting documents and emails with the Azure Rights Management service (Azure RMS).


## Roadmap for a Premium subscription with Office 365

### Step 1: Confirm your subscription and assign user licenses
Use the subscription information from the marketing site to confirm that your subscription includes the functionality and features that you expect. Then, assign a license from this subscription to each user in your organization who will classify, label, and protect documents and emails.

### Step 2: Prepare your tenant account to use Azure Information Protection
Before you begin using Azure Information Protection, do the following preparation:

1.  Make sure that you have user accounts and groups in Office 365 or Azure Active Directory that will be used by Azure Information Protection to authenticate users from your organization. If necessary, create these account and groups, or synchronize them from your on-premises directory. For more information, see [Preparing for Azure Rights Management](prepare.md).

2.  Decide whether you want Microsoft to manage your tenant key (the default), or generate and manage your tenant key yourself (known as bring your own key, or BYOK). Note that currently, you cannot use BYOK if you use Exchange Online. For more information, see [Planning and implementing your Azure Information Protection tenant key](plan-implement-tenant-key.md).

3.  Install the Windows PowerShell module for [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)] on at least one computer that has Internet access. You can do this step now, or later. For more information, see [Installing Windows PowerShell for Azure Rights Management](../deploy-use/install-powershell.md).

4.  If you are currently using on-premises Rights Management services: Perform a migration to move the keys, templates, and URLs to the cloud. For more information, see [Migrating from AD RMS to Information Protection](migrate-from-ad-rms-to-azure-rms.md).

5.  Activate Rights Management so that you can begin to protect documents and emails. If a phased deployment is required, configure user onboarding controls to restrict usage to specific users. For more information, see [Activating Azure Rights Management](../deploy-use/activate-service.md).

Optionally, consider configuring the following:

-   Custom templates if the default rights policy templates are not sufficient for your organization. You can do this step now, or later. For more information, see [Configuring custom templates for Azure Rights Management](../deploy-use/configure-custom-templates.md).

-   Usage logging so that you can monitor how your organization is using Rights Management. You can do this step now, or later. For more information, see [Logging and analyzing Azure Rights Management usage](../deploy-use/log-analyze-usage.md).

### Step 3: Configure your applications and services for Rights Management
Configuring your applications and services can include installing the Rights Management sharing application and enabling support for information rights management (IRM) features in SharePoint Online or Exchange Online. For more information, see [Configuring applications for Azure Rights Management](../deploy-use/configure-applications.md).

If you have existing IT services that need to inspect files that Azure Rights Management will protect—such as data leak prevention (DLP) solutions, content encryption gateways (CEG), and anti-malware products—configure the service accounts to be super users for Azure Rights Management. For more information, see [Configuring super users for Azure Rights Management and discovery services or data recovery](../deploy-use/configure-super-users.md).

To be able to bulk protect or bulk unprotect all file types, install the RMS Protection Tool, which uses the RMS Protection PowerShell module. For more information, see [RMS Protection Cmdlets](https://msdn.microsoft.com/library/mt433195.aspx).

If you have on-premises services that you want to use with the Azure Rights Management service, install and configure the Rights Management connector. For more information, see [Deploying the Azure Rights Management connector](../deploy-use/deploy-rms-connector.md).

### Step 4: Publish and consume rights-protected content
You’re now ready to publish and consume protected content, and log how your company is using Rights Management. For more information, see [Helping users to protect files by using Azure Rights Management](../deploy-use/help-users.md) and [Logging and analyzing Azure Rights Management usage](../deploy-use/log-analyze-usage.md).

If you're interested in automatically protecting files using File Classification Infrastructure on a Windows-based file server, see [RMS protection with Windows Server File Classification Infrastructure (FCI)](../rms-client/configure-fci.md).

### Step 5: Administer the Rights Management service for your tenant account as needed
As you begin to use the Azure Rights Management service, you might find Windows PowerShell useful to help script or automate administrative changes. For more information, see [Administering the Azure Rights Management service by using Windows PowerShell](../deploy-use/administer-powershell.md).

## Roadmap for an Office 365 subscription only

### Step 1: Confirm that you have a subscription that includes Azure Rights Management
Use the subscription information from the marketing site to confirm that your subscription includes the functionality and features that you expect. Then, assign a license from this subscription to each user in your organization who will protect documents and emails by using the Azure Rights Management service.

### Step 2: Prepare your tenant account to use the Azure Rights Management service
Before you begin using [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)], do the following preparation:

1.  Make sure that your Office 365 tenant contains the user accounts and groups that will be used by Azure RMS to authenticate users from your organization. If necessary, create these account and groups, or synchronize them from your on-premises directory. For more information, see [Preparing for Azure Rights Management](prepare.md).

2.  Decide whether you want Microsoft to manage your tenant key (the default), or generate and manage your tenant key yourself (known as bring your own key, or BYOK). Note that currently, you cannot use BYOK if you use Exchange Online. For more information, see [Planning and implementing your Azure Rights Management tenant key](plan-implement-tenant-key.md).

3.  Install the Windows PowerShell module for [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)] on at least one computer that has Internet access. You can do this step now, or later. For more information, see [Installing Windows PowerShell for Azure Rights Management](../deploy-use/install-powershell.md).

4.  If you are currently using on-premises Rights Management services: Perform a migration to move the keys, templates, and URLs to the cloud. For more information, see [Migrating from AD RMS to Azure Rights Management](migrate-from-ad-rms-to-azure-rms.md).

5.  Activate Rights Management so that you can begin to use the service. If a phased deployment is required, configure user onboarding controls to restrict usage to specific users. For more information, see [Activating Azure Rights Management](../deploy-use/activate-service.md).

Optionally, consider configuring the following:

-   Custom templates if the default rights policy templates are not sufficient for your organization. You can do this step now, or later. For more information, see [Configuring custom templates for Azure Rights Management](../deploy-use/configure-custom-templates.md).

-   Usage logging so that you can monitor how your organization is using Rights Management. You can do this step now, or later. For more information, see [Logging and analyzing Azure Rights Management usage](../deploy-use/log-analyze-usage.md).

### Step 3: Configure your applications and services for Rights Management
Configuring your applications and services can include installing the Rights Management sharing application and enabling support for information rights management (IRM) features in SharePoint Online or Exchange Online. For more information, see [Configuring applications for Azure Rights Management](../deploy-use/configure-applications.md).

If you have existing IT services that need to inspect files that Azure Rights Management will protect—such as data leak prevention (DLP) solutions, content encryption gateways (CEG), and anti-malware products—configure the service accounts to be super users for Azure Rights Management. For more information, see [Configuring super users for Azure Rights Management and discovery services or data recovery](../deploy-use/configure-super-users.md).

To be able to bulk protect or bulk unprotect all file types, install the RMS Protection Tool, which uses the RMS Protection PowerShell module. For more information, see [RMS Protection Cmdlets](https://msdn.microsoft.com/library/mt433195.aspx).

If you have on-premises services that you want to use with Azure Rights Management, install and configure the Rights Management connector. For more information, see [Deploying the Azure Rights Management connector](../deploy-use/deploy-rms-connector.md).

### Step 4: Publish and consume rights-protected content
You’re now ready to publish and consume protected content, and log how your company is using Rights Management. For more information, see [Helping users to protect files by using Azure Rights Management](../deploy-use/help-users.md) and [Logging and analyzing Azure Rights Management usage](../deploy-use/log-analyze-usage.md).

If you're interested in automatically protecting files using File Classification Infrastructure on a Windows-based file server, see [RMS protection with Windows Server File Classification Infrastructure (FCI)](../rms-client/configure-fci.md).

### Step 5: Administer the Rights Management service for your tenant account as needed
As you begin to use the Azure Rights Management service, you might find Windows PowerShell useful to help script or automate administrative changes. For more information, see [Administering the Azure Rights Management service by using Windows PowerShell](../deploy-use/administer-powershell.md).


