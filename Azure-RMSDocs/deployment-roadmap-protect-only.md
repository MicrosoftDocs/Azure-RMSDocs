---
# required metadata

title: Azure Information Protection (AIP) deployment roadmap for protection only
description: Use these steps to prepare for, implement, and manage Azure Information Protection (AIP) for your organization, when you want to implement protection only.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 07/23/2020
ms.topic: how-to
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 086600c2-c5d8-47ec-a4c0-c782e1797486
ROBOTS: NOINDEX


# optional metadata

#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Azure Information Protection deployment roadmap for protection only

>***Applies to**: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*
>
>***Relevant for**: [Azure Information Protection classic client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients). For the unified labeling client, see [AIP deployment roadmap for classification, labeling, and protection](deployment-roadmap-classify-label-protect.md).*

> [!NOTE] 
> To provide a unified and streamlined customer experience, **Azure Information Protection classic client** and **Label Management** in the Azure Portal are being **deprecated** as of **March 31, 2021**. This time-frame allows all current Azure Information Protection customers to transition to our unified labeling solution using the Microsoft Information Protection Unified Labeling platform. Learn more in the official [deprecation notice](https://aka.ms/aipclassicsunset).

> [!TIP]
> Alternatively, you may be looking for one of the following articles:
> - [AIP deployment roadmap for classification, labeling, and protection](deployment-roadmap-classify-label-protect.md)
> - [How-to guides for common scenarios that use Azure Information Protection](how-to-guides.md)
> - [Azure Information Protection release roadmap](information-support.md#information-about-new-releases-and-updates)

Use the following steps as recommendations to help you prepare for, implement, and manage Azure Information Protection for your organization, when you want to implement data protection only.

This roadmap is recommended for customers with a subscription that doesn't support both classification and labels, but does support protection without labels. You must have the AIP classic client installed. 

## Deployment process

Perform the following steps:

1. [Confirm that you have a subscription that includes the AIP protection service](#confirm-that-you-have-a-subscription-that-includes-the-aip-protection-service) 
1. [Prepare your tenant to use Azure Information Protection](#prepare-your-tenant-to-use-azure-information-protection)
1. [Install the Azure Information Protection classic and client configure applications and services for Rights Management](#install-the-azure-information-protection-classic-and-client-configure-applications-and-services-for-rights-management)
1. [Use and monitor your data protection solutions](#use-and-monitor-your-data-protection-solutions)
1. [Administer the protection service for your tenant account as needed](#administer-the-protection-service-for-your-tenant-account-as-needed)

## Confirm that you have a subscription that includes the AIP protection service

Verify that your organization has a subscription that includes the functionality and features you expect. You can use the subscription information and feature list on the [Azure Information Protection Pricing](https://azure.microsoft.com/pricing/details/information-protection) page.

Assign a license from this subscription to each user in your organization who will protect documents and emails.

> [!IMPORTANT]
> Do not manually assign user licenses from the free RMS for individuals subscription and do not use this license to administer the Azure Rights Management service for your organization. 
>
> These licenses display as **Rights Management Adhoc** in the Microsoft 365 admin center, and **RIGHTSMANAGEMENT_ADHOC** when you run the Azure AD PowerShell cmdlet, [Get-MsolAccountSku](/previous-versions/azure/dn194118(v=azure.100)). 
>
> For more information about how the RMS for individuals subscription is automatically granted and assigned to users, see [RMS for individuals and Azure Information Protection](./rms-for-individuals.md).

## Prepare your tenant to use Azure Information Protection

Before you begin using the protection service from Azure Information Protection, do the following preparation:

1. **Set up your user accounts and groups for AIP**

    Make sure that your Microsoft 365 tenant contains the user accounts and groups that will be used by Azure Information Protection to authenticate and authorize users from your organization. If necessary, create these accounts and groups, or synchronize them from your on-premises directory. 

    For more information, see [Preparing users and groups for Azure Information Protection](prepare.md).

1. **Decide how you want to manage your tenant key**

    Decide whether you want Microsoft to manage your tenant key (the default), or generate and manage your tenant key yourself (known as bring your own key, or BYOK). For additional security, implement "hold your own key" (HYOK) protection. 

    For more information, see [Planning and implementing your Azure Information Protection tenant key](plan-implement-tenant-key.md).

1. **Install PowerShell for AIP**

    Install the PowerShell module for AIPService on at least one computer that has internet access. You can do this step now, or later. 

    For more information, see [Installing the AIPService PowerShell module](./install-powershell.md).

1. **AD RMS only: Migrate your data to the cloud**

    If you are currently using AD RMS: Perform a migration to move the keys, templates, and URLs to the cloud. 

    For more information, see [Migrating from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md).

1. **Activate protection**

    Make sure that the protection service is activated so that you can begin to protect documents and emails. If you are deploying in phases, configure user onboarding controls to restrict users' ability to apply protection. 

    For more information, see [Activating the protection service from Azure Information Protection](./activate-service.md).

1. **Configure optional features as needed**

    Consider configuring either of the following features, either now or later.
    
    |Feature  |Description  |
    |---------|---------|
    |**Custom templates for protection settings**     |  If the default templates are not sufficient for your organization, configure custom templates. </br>For more information, see [Configuring and managing templates for Azure Information Protection](./configure-policy-templates.md).       |
    |**Usage logging**     | Configure usage logging to monitor how your organization is using the protection service. </br>For more information, see [Logging and analyzing the protection usage from Azure Information Protection](./log-analyze-usage.md).        |
    | | |

## Install the Azure Information Protection classic and client configure applications and services for Rights Management

Perform the following steps:

1. **Deploy the Azure Information Protection classic client**
    
    Install the classic client for users to support Office 2010, to protect files other than Office documents and emails, and to track protected documents, and provide user training for this client. For more information, see [Azure Information Protection classic client for Windows](./rms-client/aip-client.md).

    > [!NOTE]
    > Office 2010 extended support ended on October 13, 2020. For more information, see [AIP and legacy Windows and Office versions](known-issues.md#aip-and-legacy-windows-and-office-versions).
    >
 
2. **Configure Office applications and services**
    
    Configure Office applications and services for the information rights management (IRM) features in SharePoint or Exchange Online. 

    For more information, see [Configuring applications for Azure Rights Management](./configure-applications.md).

3. **Configure the super user feature for data recovery**
    
    If you have existing IT services that need to inspect files that Azure Information Protection will protect—such as data leak prevention (DLP) solutions, content encryption gateways (CEG), and anti-malware products—configure the service accounts to be super users for Azure Rights Management. 

    For more information, see [Configuring super users for Azure Information Protection and discovery services or data recovery](./configure-super-users.md).

4. **Protect existing files in bulk** 
    
    You can use PowerShell cmdlets to bulk-protect or bulk-unprotect multiple file types. 

    For more information, see [Using PowerShell with the Azure Information Protection client](./rms-client/client-admin-guide-powershell.md) from the admin guide.
    
    For files on Windows-based file servers, you can use these cmdlets with a script and Windows Server File Classification Infrastructure. For more information, see [RMS protection with Windows Server File Classification Infrastructure (FCI)](./rms-client/configure-fci.md).

5. **Deploy the connector for on-premises servers**
    
    If you have on-premises services that you want to use with the protection service, install and configure the Rights Management connector. 

    For more information, see [Deploying the Azure Rights Management connector](./deploy-rms-connector.md).

## Use and monitor your data protection solutions

You're now ready to protect your data, and log how your company is using the protection service. 

For more information, see:

- [Helping users to protect files by using the Azure Rights Management service](./help-users.md)
- [Logging and analyzing the protection usage from Azure Information Protection](./log-analyze-usage.md)

## Administer the protection service for your tenant account as needed

As you begin to use the protection service, you might find PowerShell useful to help script or automate administrative changes. PowerShell might also be needed for some of the advanced configurations. 

For more information, see [Administering protection from Azure Information Protection by using PowerShell](./administer-powershell.md).

## Next steps

As you deploy Azure Information Protection, you might find it helpful to check the [frequently asked questions](faqs.md), and the [information and support](information-support.md) page for additional resources.