---
# required metadata

title: Azure Information Protection deployment roadmap | Azure Information Protection
description: Use these steps to prepare for, implement, and manage Azure Information Protection for your organization.
author: cabailey
manager: mbaldwin
ms.date: 10/04/2016
ms.topic: article
ms.prod:
ms.service: information-protection
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

Choose the deployment roadmap that's applicable for your organization and that matches the [subscriptions](http://go.microsoft.com/fwlink/?LinkId=827589) for the functionality and features that you need:

- [Use classification, labeling, and protection](#deployment-roadmap-for-classification-labeling-and-protection)

- [Use data protection only](#deployment-roadmap-for-data-protection-only)


## Deployment roadmap for classification, labeling, and protection

> [!NOTE]
> Already using the Azure Rights Management service for data protection? You can skip many of these steps and focus on steps 3 and 5.1.

### Step 1: Confirm your subscription and assign user licenses
Confirm that your organization has a subscription that includes the functionality and features that you expect:

- For Azure Information Protection plans: Review the [feature list](https://www.microsoft.com/en-us/cloud-platform/azure-information-protection-features) from the Azure Information Protection site.

- For Office 365 plans that include Rights Management: Download and review the [Azure Information Protection licensing datasheet](http://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf) from the Azure Information Protection site. 

Then, assign a license from this subscription to each user in your organization who will classify, label, and protect documents and emails.

### Step 2: Prepare your tenant account to use Azure Information Protection
Before you begin using Azure Information Protection, do the following preparation:

- Make sure that you have user accounts and groups in Office 365 or Azure Active Directory that will be used by Azure Information Protection to authenticate users from your organization. If necessary, create these account and groups, or synchronize them from your on-premises directory. For more information, see [Preparing for Azure Information Protection](prepare.md).

### Step 3: Configure and deploy classification and labeling

If you do not already have a classification strategy, review the [default Azure Information Protection policy](../deploy-use/configure-policy-default.md) and use this as the basis for deciding what classification labels to assign to your organization data. You can customize these to meet your business requirements. 

Reconfigure the default Azure Information Protection labels to make any changes you need to support your classification decisions. Configure the policy for manual labeling by users, and write user guidance that explains which label to apply and when. For more information about how to configure Azure Information Protection policy, see [Configuring Azure Information Protection policy](../deploy-use/configure-policy.md).

Then deploy the Azure Information Protection client for users, and support it by providing user training and your instructions for when to select the labels. For more information about installing the client, see [Installing the Azure Information Protection client](../rms-client/info-protect-client.md).

After a period of time, when users are comfortable labeling their documents and emails, introduce more advanced configurations. These might include the following:

- Apply a default label

- Prompt users for justification if they chose a label with a lower classification level

- Mandate that all documents and emails have a label

- Customized headers, footers, or watermarks

- Conditions to support recommendations and automatic labeling

At this stage, do not select the option to protect documents and emails.

### Step 4: Prepare for Rights Management data protection

When users are comfortable labeling documents and emails, you're ready to start introducing data protection for your most sensitive data. This stage requires the following preparation for the Azure Rights Management service:

1. Decide whether you want Microsoft to manage your tenant key (the default), or generate and manage your tenant key yourself (known as bring your own key, or BYOK). Note that currently, you cannot use BYOK if you use Exchange Online. For more information, see [Planning and implementing your Azure Information Protection tenant key](plan-implement-tenant-key.md).

2. Install the Windows PowerShell module for [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)] on at least one computer that has Internet access. You can do this step now, or later. For more information, see [Installing Windows PowerShell for the Azure Rights Management service](../deploy-use/install-powershell.md).

3. If you are currently using on-premises Rights Management services: Perform a migration to move the keys, templates, and URLs to the cloud. For more information, see [Migrating from AD RMS to Information Protection](migrate-from-ad-rms-to-azure-rms.md).

4. Activate the Azure Rights Management service so that you can begin to protect documents and emails. If a phased deployment is required, configure user onboarding controls to restrict usage to specific users. For more information, see [Activating Azure Rights Management](../deploy-use/activate-service.md).

Optionally, consider configuring the following:

-   Custom templates if the default rights policy templates are not sufficient for your organization. You can do this step now, or later. For more information, see [Configuring custom templates for Azure Rights Management](../deploy-use/configure-custom-templates.md).

-   Usage logging so that you can monitor how your organization is using Rights Management. You can do this step now, or later. For more information, see [Logging and analyzing Azure Rights Management usage](../deploy-use/log-analyze-usage.md).

### Step 5: Configure your Azure Information Protection policy, applications, and services for Rights Management data protection

1. Update your Azure Information Protection policy to apply data protection
    
    Modify your Azure Information Protection policy so that one or more labels apply Rights Management protection. For more information, see [How to configure a label to apply Rights Management protection](../deploy-use/configure-policy-protection.md).

2. Deploy the Rights Management sharing application
    
    Install the Rights Management sharing application for users, so that they can safely share documents by email, protect files in place, and track their shared documents that they protected. Provide user training for this application. For more information, see [Rights Management Sharing Application for Windows](../rms-client/sharing-app-windows.md).

3. Configure Office applications and services for IRM
    
    Configure Office applications and services for the information rights management (IRM) features in SharePoint Online or Exchange Online. For more information, see [Configuring applications for Azure Rights Management](../deploy-use/configure-applications.md).

4. Configure the super user feature for data recovery
    
    If you have existing IT services that need to inspect files that Azure Rights Management will protect—such as data leak prevention (DLP) solutions, content encryption gateways (CEG), and anti-malware products—configure the service accounts to be super users for Azure Rights Management. For more information, see [Configuring super users for Azure Rights Management and discovery services or data recovery](../deploy-use/configure-super-users.md).

5. Bulk-protect files 
    
    To be able to bulk protect or bulk unprotect all file types, install the RMS Protection Tool, which uses the RMS Protection PowerShell module. For more information, see [RMS Protection Cmdlets](https://msdn.microsoft.com/library/mt433195.aspx).

6. Deploy the connector for on-premises servers
    
    If you have on-premises services that you want to use with the Azure Rights Management service, install and configure the Rights Management connector. For more information, see [Deploying the Azure Rights Management connector](../deploy-use/deploy-rms-connector.md).

### Step 4: Use and monitor your data protection solutions
You’re now ready to protect your data, and log how your company is using Rights Management. For addition information to support this deployment phase, see [Helping users to protect files by using Azure Rights Management](../deploy-use/help-users.md) and [Logging and analyzing Azure Rights Management usage](../deploy-use/log-analyze-usage.md).

If you're interested in automatically protecting files using File Classification Infrastructure on a Windows-based file server, see [RMS protection with Windows Server File Classification Infrastructure (FCI)](../rms-client/configure-fci.md).

### Step 5: Administer the Rights Management service for your tenant account as needed
As you begin to use the Azure Rights Management service, you might find Windows PowerShell useful to help script or automate administrative changes. For more information, see [Administering the Azure Rights Management service by using Windows PowerShell](../deploy-use/administer-powershell.md).


## Deployment roadmap for data protection only

### Step 1: Confirm that you have a subscription that includes Azure Rights Management
Confirm that your organization has a subscription that includes the functionality and features that you expect:

- For Azure Information Protection plans: Review the [feature list](https://www.microsoft.com/en-us/cloud-platform/azure-information-protection-features) from the Azure Information Protection site.

- For Office 365 plans that include Rights Management: Download and review the [Azure Information Protection licensing datasheet](http://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf) from the Azure Information Protection site.

Then, assign a license from this subscription to each user in your organization who will protect documents and emails by using the Azure Rights Management service.

### Step 2: Prepare your tenant account to use the Azure Rights Management service
Before you begin using [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)], do the following preparation:

1.  Make sure that your Office 365 tenant contains the user accounts and groups that will be used by Azure Information Protection to authenticate users from your organization. If necessary, create these account and groups, or synchronize them from your on-premises directory. For more information, see [Preparing for Azure Rights Management](prepare.md).

2. Decide whether you want Microsoft to manage your tenant key (the default), or generate and manage your tenant key yourself (known as bring your own key, or BYOK). Note that currently, you cannot use BYOK if you use Exchange Online. For more information, see [Planning and implementing your Azure Rights Management tenant key](plan-implement-tenant-key.md).

3. Install the Windows PowerShell module for [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)] on at least one computer that has Internet access. You can do this step now, or later. For more information, see [Installing Windows PowerShell for Azure Rights Management](../deploy-use/install-powershell.md).

4. If you are currently using on-premises Rights Management services: Perform a migration to move the keys, templates, and URLs to the cloud. For more information, see [Migrating from AD RMS to Azure Rights Management](migrate-from-ad-rms-to-azure-rms.md).

5. Activate Rights Management so that you can begin to use the service. If a phased deployment is required, configure user onboarding controls to restrict usage to specific users. For more information, see [Activating Azure Rights Management](../deploy-use/activate-service.md).

Optionally, consider configuring the following:

-   Custom templates if the default rights policy templates are not sufficient for your organization. You can do this step now, or later. For more information, see [Configuring custom templates for Azure Rights Management](../deploy-use/configure-custom-templates.md).

-   Usage logging so that you can monitor how your organization is using Rights Management. You can do this step now, or later. For more information, see [Logging and analyzing Azure Rights Management usage](../deploy-use/log-analyze-usage.md).

### Step 3: Configure your applications and services for Rights Management

1. Deploy the Rights Management sharing application
    
    Install the Rights Management sharing application for users, so that they can safely share documents by email and protect files in place, and track their shared documents that they protected. Provide user training for this application. For more information, see [Rights Management Sharing Application for Windows](../rms-client/sharing-app-windows.md).

2. Configure Office applications and services for IRM
    
    Configure Office applications and services for the information rights management (IRM) features in SharePoint Online or Exchange Online. For more information, see [Configuring applications for Azure Rights Management](../deploy-use/configure-applications.md).

3. Configure the super user feature for data recovery
    
    If you have existing IT services that need to inspect files that Azure Rights Management will protect—such as data leak prevention (DLP) solutions, content encryption gateways (CEG), and anti-malware products—configure the service accounts to be super users for Azure Rights Management. For more information, see [Configuring super users for Azure Rights Management and discovery services or data recovery](../deploy-use/configure-super-users.md).

4. Bulk-protect files 
    
    To be able to bulk protect or bulk unprotect all file types, install the RMS Protection Tool, which uses the RMS Protection PowerShell module. For more information, see [RMS Protection Cmdlets](https://msdn.microsoft.com/library/mt433195.aspx).

5. Deploy the connector for on-premises servers
    
    If you have on-premises services that you want to use with the Azure Rights Management service, install and configure the Rights Management connector. For more information, see [Deploying the Azure Rights Management connector](../deploy-use/deploy-rms-connector.md).


### Step 4: Use and monitor your data protection solutions
You’re now ready to protect your data, and log how your company is using Rights Management. For addition information to support this deployment phase, see [Helping users to protect files by using Azure Rights Management](../deploy-use/help-users.md) and [Logging and analyzing Azure Rights Management usage](../deploy-use/log-analyze-usage.md).

If you're interested in automatically protecting files using File Classification Infrastructure on a Windows-based file server, see [RMS protection with Windows Server File Classification Infrastructure (FCI)](../rms-client/configure-fci.md).

### Step 5: Administer the Rights Management service for your tenant account as needed
As you begin to use the Azure Rights Management service, you might find Windows PowerShell useful to help script or automate administrative changes. For more information, see [Administering the Azure Rights Management service by using Windows PowerShell](../deploy-use/administer-powershell.md).


