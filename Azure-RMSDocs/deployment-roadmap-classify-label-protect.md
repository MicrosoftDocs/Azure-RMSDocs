---
# required metadata

title: Deploy Azure Information Protection (AIP) for classification, labeling, and protection
description: Use these steps to prepare for, implement, and manage Azure Information Protection (AIP) for your organization, when you want to classify, label, and protect your data.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 11/11/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 086600c2-c5d8-47ec-a4c0-c782e1797486

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# AIP deployment roadmap for classification, labeling, and protection

>***Applies to**: [Azure Information Protection](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection), [Office 365](https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RE4Dz8M)*
>
>***Relevant for**: [AIP unified labeling client and classic client](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

[!INCLUDE [AIP classic client is deprecated](includes/classic-client-deprecation.md)]

Use the following steps as recommendations to help you prepare for, implement, and manage Azure Information Protection for your organization, when you want to classify, label, and protect your data.

This roadmap is recommended for any customers with a supporting subscription. Additional capabilities include both discovering sensitive information and labeling documents and emails for classification. 

Labels can also apply protection, simplifying this step for your users. 

> [!TIP]
> Alternatively, you may be looking for one of the following articles:
> - [AIP roadmap for data protection only](deployment-roadmap-protect-only.md)
> - [How-to guides for common scenarios that use Azure Information Protection](how-to-guides.md)
> - [Azure Information Protection release roadmap](information-support.md#information-about-new-releases-and-updates)

## Deployment process

Perform the following steps:

1. [Confirm your subscription and assign user licenses](#confirm-your-subscription-and-assign-user-licenses)
1. [Prepare your tenant to use Azure Information Protection](#prepare-your-tenant-to-use-azure-information-protection)
1. [Configure and deploy classification and labeling](#configure-and-deploy-classification-and-labeling)
1. [Prepare for data protection](#prepare-for-data-protection)
1. [Configure labels and settings, applications, and services for data protection](#configure-labels-and-settings-applications-and-services-for-data-protection)
1. [Use and monitor your data protection solutions](#use-and-monitor-your-data-protection-solutions)
1. [Administer the protection service for your tenant account as needed](#administer-the-protection-service-for-your-tenant-account-as-needed)

> [!TIP]
> Already using the protection functionality from Azure Information Protection? You can skip many of these steps and focus on steps [3](#configure-and-deploy-classification-and-labeling) and [5.1](#configure-labels-and-settings-applications-and-services-for-data-protection).

## Confirm your subscription and assign user licenses

Confirm that your organization has a subscription that includes the functionality and features you expect. For more information, see the [Microsoft 365 licensing guidance for security & compliance](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection) page.

Then, assign licenses from this subscription to each user in your organization who will classify, label, and protect documents and emails.

> [!IMPORTANT]
> Do not manually assign user licenses from the free RMS for individuals subscription, and do not use this license to administer the Azure Rights Management service for your organization. 
>
> These licenses display as **Rights Management Adhoc** in the Microsoft 365 admin center, and **RIGHTSMANAGEMENT_ADHOC** when you run the Azure AD PowerShell cmdlet, [Get-MsolAccountSku](/previous-versions/azure/dn194118(v=azure.100)). 
>
> For more information, see [RMS for individuals and Azure Information Protection](./rms-for-individuals.md).
> 
## Prepare your tenant to use Azure Information Protection

Before you begin using Azure Information Protection, make sure that you have user accounts and groups in Microsoft 365 or Azure Active Directory that AIP can use to authenticate and authorize your users.

If necessary, create these accounts and groups, or synchronize them from your on-premises directory. 

For more information, see [Preparing users and groups for Azure Information Protection](prepare.md).

## Configure and deploy classification and labeling

Perform the following steps:

1. **Scan your files (optional but recommended)**

    [Deploy the Azure Information Protection client](quickstart-deploy-client.md), and then [install](tutorial-install-scanner.md) and [run the scanner](tutorial-scan-networks-and-content.md) to discover the sensitive information you have on your local data stores. 

    The information that the scanner finds can help you with your classification taxonomy, provide valuable information about what labels you need, and which files need protecting.

    The scanner **discovery** mode doesn't require any label configuration or taxonomy, and is therefore suitable at this early stage of your deployment. You can also use this scanner configuration in parallel with the following deployment steps, until you configure recommended or automatic labeling.

1. **Customize the default AIP policy**.

    If you don't have a classification strategy yet, use a default policy as a basis for determining which labels you'll need for your data. Customize these labels as needed to meet your needs.

    For example, you may want to reconfigure your labels with the following details:

    - Make sure that your labels support your classification decisions.
    - Configure policies for manual labeling by users
    - Write user guidance to help explain which label should be applied in each scenario.
    - If your default policy was created with labels that automatically apply protection, you may want to temporarily remove the protection settings or disable the label while you test your settings. 

    Sensitivity labels and labeling policies for the unified labeling client are configured in the Microsoft 365 compliance center. For more information, see [Learn about sensitivity labels](/microsoft-365/compliance/sensitivity-labels).

1. **Deploy your client for your users**

    Once you have a policy configured, deploy the Azure Information Protection client for your users. Provide user training and specific instructions when to select the labels. 

    For more information, see the [unified labeling client administrator guide](./rms-client/clientv2-admin-guide.md).

1. **Introduce more advanced configurations**

    Wait for your users to become more comfortable with labels on their documents and emails. When you're ready, introduce advanced configurations, such as:

    - Applying default labels
    - Prompting users for justification if they chose a label with a lower classification level or remove a label
    - Mandating that all documents and emails have a label
    - Customizing headers, footers, or watermarks
    - Recommended and automatic labeling

    For more information, see [Admin Guide: Custom configurations](rms-client/client-admin-guide-customizations.md).
     
    > [!TIP]
    > If you've configured labels for automatic labeling, run the [Azure Information Protection scanner](deploy-aip-scanner-manage.md) again on your local data stores in discovery mode and to match your policy. 
    > 
    > Running the scanner in discovery mode tells you which labels would be applied to files, which helps you fine-tune your label configuration and prepares you for classifying and protecting files in bulk. 
    > 

## Prepare for data protection

Introduce data protection for your most sensitive data once users become comfortable labeling documents and emails.

Perform the following steps to prepare for data protection:

1. **Determine how you want to manage your tenant key**.

    Decide whether you want Microsoft to manage your tenant key (the default), or generate and manage your tenant key yourself (known as bring your own key, or BYOK). 
 
    For more information and options for additional, on-premises protection, see [Planning and implementing your Azure Information Protection tenant key](plan-implement-tenant-key.md).

1. **Install PowerShell for AIP**.

    Install the PowerShell module for **AIPService** on at least one computer that has internet access. You can do this step now, or later. 

    For more information, see [Installing the AIPService PowerShell module](./install-powershell.md).

1. **AD RMS only**: Migrate your keys, templates, and URLs to the cloud.

    If you are currently using AD RMS, perform a migration to move the keys, templates, and URLs to the cloud. 
    
    For more information, see [Migrating from AD RMS to Information Protection](migrate-from-ad-rms-to-azure-rms.md).

1. **Activate protection**.

    Make sure that the protection service is activated so that you can begin to protect documents and emails. If you're deploying in multiple phases, configure user onboarding controls to restrict users' ability to apply protection. 

    For more information, see [Activating the protection service from Azure Information Protection](./activate-service.md).

1. **Consider usage logging (optional)**.

    Consider logging usage to monitor how your organization is using the protection service. You can do this step now, or later. 

    For more information, see [Logging and analyzing the protection usage from Azure Information Protection](./log-analyze-usage.md).

## Configure labels and settings, applications, and services for data protection

Perform the following steps:

1. **Update your labels to apply protection**
    
    For more information, see [Restrict access to content by using encryption in sensitivity labels](/microsoft-365/compliance/encryption-sensitivity-labels).

    > [!IMPORTANT]
    > Users can apply labels in Outlook that apply Rights Management protection even if Exchange is not configured for information rights management (IRM). 
    > 
    > However, until Exchange is configured for IRM or [Microsoft 365 Message Encryption with new capabilities](https://support.office.com/article/7ff0c040-b25c-4378-9904-b1b50210d00e), your organization will not get the full functionality of using Azure Rights Management protection with Exchange. This additional configuration is included in the following list (2 for Exchange Online, and 5 for Exchange on-premises). 
    > 
    
1. **Configure Office applications and services**
    
    Configure Office applications and services for the information rights management (IRM) features in Microsoft SharePoint or Exchange Online. 

    For more information, see [Configuring applications for Azure Rights Management](configure-applications.md).

1. **Configure the super user feature for data recovery**
    
    If you have existing IT services that need to inspect files that Azure Information Protection will protect—such as data leak prevention (DLP) solutions, content encryption gateways (CEG), and anti-malware products—configure the service accounts to be super users for Azure Rights Management. 

    For more information, see [Configuring super users for Azure Information Protection and discovery services or data recovery](./configure-super-users.md).

1. **Classify and protect existing files in bulk**
    
    For your on-premises data stores, now run the [Azure Information Protection scanner](deploy-aip-scanner.md) in enforcement mode so that files are automatically labeled.
    
    For files on PCs, use PowerShell cmdlets to classify and protect files. For more information, see [Using PowerShell with the Azure Information Protection unified labeling client](./rms-client/clientv2-admin-guide-powershell.md).

    For cloud-based data stores, use [Microsoft Defender for Cloud Apps](/cloud-app-security). 

    > [!TIP]
    > While classifying and protecting existing files in bulk is not one of the main use cases for Defender for Cloud Apps, [documented workarounds](/cloud-app-security/azip-integration#enable-azure-information-protection) can help you get your files classified and protected.

6. **Deploy the connector for IRM-protected libraries on SharePoint Server, and IRM-protected emails for Exchange on-premises**
    
    If you have SharePoint and Exchange on-premises and want to use their information rights management (IRM) features, install and configure the Rights Management connector. 

    For more information, see [Deploying the Microsoft Rights Management connector](./deploy-rms-connector.md).

## Use and monitor your data protection solutions

You're now ready to monitor how your organization is using the labels that you've configured and confirm that you're protecting sensitive information. 

For more information, see the following pages:

- [Central reporting for Azure Information Protection](reports-aip.md) - currently in preview
- [Logging and analyzing the protection usage from Azure Information Protection](./log-analyze-usage.md)

## Administer the protection service for your tenant account as needed

As you begin to use the protection service, you might find PowerShell useful to help script or automate administrative changes. PowerShell might also be needed for some of the advanced configurations. 

For more information, see [Administering protection from Azure Information Protection by using PowerShell](./administer-powershell.md).

## References for classic client environments

**Relevant for**: AIP classic client only

If you're using the classic client, use the following references instead of those linked above:

- **Deploy and run the scanner** that's provided with the classic client. For more information, see [What is the Azure Information Protection classic scanner?](deploy-aip-scanner-classic.md)

- **Configure your policy in the Azure portal.** For more information, see [Configuring Azure Information Protection policy](./configure-policy.md) and [How to configure a label for Rights Management protection](./configure-policy-protection.md).

- **Deploy your client for users** using the [classic client administrator guide](./rms-client/client-admin-guide.md) and [custom configuration instructions for the classic client](rms-client/client-admin-guide-customizations.md).

- **PowerShell instructions**: [Using PowerShell with the Azure Information Protection client](./rms-client/client-admin-guide-powershell.md)

- **Local monitoring**: [Local usage logging with Windows event monitor](./rms-client/client-admin-guide-files-and-logging.md#usage-logging-for-the-azure-information-protection-classic-client)

> [!TIP]
> You may also be interested in the [Azure Information Protection deployment roadmap for protection only](deployment-roadmap-protect-only.md), which is supported for the classic client only.

## Next steps

As you deploy Azure Information Protection, you might find it helpful to check the [frequently asked questions](faqs.md), [known issues](known-issues.md), and the [information and support](information-support.md) page for additional resources.
