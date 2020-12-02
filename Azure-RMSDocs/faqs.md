---
# required metadata

title: FAQs for Azure Information Protection
description: Some frequently asked questions about Azure Information Protection and its protection service, Azure Rights Management (Azure RMS).
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 11/18/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin
search.appverid:
- MET150

---

# Frequently asked questions for Azure Information Protection

>***Applies to**: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*
>
>***Relevant for**: [AIP unified labeling client and classic client](#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

>[!NOTE] 
> To provide a unified and streamlined customer experience, **Azure Information Protection classic client** and **Label Management** in the Azure Portal are being **deprecated** as of **March 31, 2021**. This time-frame allows all current Azure Information Protection customers to transition to our unified labeling solution using the Microsoft Information Protection Unified Labeling platform. Learn more in the official [deprecation notice](https://aka.ms/aipclassicsunset).

Have a question about Azure Information Protection, or about the Azure Rights Management service (Azure RMS)? See if it's answered here.

## What's the difference between Azure Information Protection and Microsoft Information Protection?

Unlike Azure Information Protection, [Microsoft Information Protection](https://www.microsoft.com/security/business/information-protection) isn't a subscription or product that you can buy. Instead, it's a framework for products and integrated capabilities that help you protect your organization's sensitive information.

**Microsoft Information Protection products include:**
- Azure Information Protection
- Microsoft 365 Information Protection, such as Microsoft 365 DLP
- Windows Information Protection
- Microsoft Cloud App Security

**Microsoft Information Protection capabilities include:**
- Unified label management
- End-user labeling experiences built into Office apps
- The ability for Windows to understand unified labels and apply protection to data
- The Microsoft Information Protection SDK
- Functionality in Adobe Acrobat Reader to view labeled and protected PDFs

For more information, see [Information protection capabilities to help protect your sensitive data](https://techcommunity.microsoft.com/t5/Enterprise-Mobility-Security/Announcing-availability-of-information-protection-capabilities/ba-p/261967).

## What's the difference between labels in Microsoft 365 and labels in Azure Information Protection?

Originally, Microsoft 365 had only [retention labels](https://support.office.com/article/af398293-c69d-465e-a249-d74561552d30), which enabled you to classify documents and emails for auditing and retention when that content was stored in Microsoft 365 services. 

In contrast, Azure Information Protection labels, configured at the time using the AIP classic client in the Azure portal, enabled you to apply a consistent classification and protection policy for documents and emails whether they were stored on-premises or in the cloud.

Microsoft 365 now supports [sensitivity labels](/microsoft-365/compliance/sensitivity-labels) in addition to retention labels. Sensitivity labels can be created and configured in the following admin centers:

- Office 365 Security & Compliance Center
- Microsoft 365 security center
- Microsoft 365 compliance center

If you have legacy AIP labels configured in the Azure portal, we recommend migrating them to sensitivity labels and unified labeling client. For more information, see [Tutorial: Migrating from the Azure Information Protection (AIP) classic client to the unified labeling client](tutorial-migrating-to-ul.md).

For more information, see [Announcing availability of information protection capabilities to help protect your sensitive data](https://techcommunity.microsoft.com/t5/Enterprise-Mobility-Security/Announcing-availability-of-information-protection-capabilities/ba-p/261967).

## How can I determine if my tenant is on the unified labeling platform?

When your tenant is on the unified labeling platform, it supports sensitivity labels that can be used by [clients and services that support unified labeling](configure-policy-migrate-labels.md#clients-and-services-that-support-unified-labeling). If you obtained your subscription for Azure Information Protection in June 2019 or later, your tenant is automatically on the unified labeling platform and no further action is needed. Your tenant might also be on this platform because somebody migrated your Azure Information Protection labels.

If your tenant is not on the unified labeling platform, you'll see the following information banner in the Azure portal, on the **Azure Information Protection** panes:

![Migration information banner](media/migration-status-banner.png)

You can also check by going to **Azure Information Protection** > **Manage** > **Unified labeling**, and view the **Unified labeling** status:

|Status |Description  |
|---------|---------|
|**Activated**     |  Your tenant is on the unified labeling platform. <br />You can [create, configure, and publish labels](/microsoft-365/compliance/create-sensitivity-labels) from the Microsoft 365 compliance center.       |
|**Not activated**    |  Your tenant is not on the unified labeling platform. <br />For migration instructions and guidance, see [How to migrate Azure Information Protection labels to unified sensitivity labels](configure-policy-migrate-labels.md).       |
| | |

## What's the difference between the Azure Information Protection classic and unified labeling clients?

The legacy Azure Information Protection client, referred to as the *classic* client, downloads labels and policy settings from Azure and enables you to configure the [AIP policy](overview-policy.md) from the Azure portal.

The *unified labeling client* is the most current client with the most recent updates, and supports the unified labeling platform used by multiple applications and services. The unified labeling client downloads [sensitivity labels](/microsoft-365/compliance/sensitivity-labels) and policy settings from the following admin centers:

- Office 365 Security & Compliance Center
- Microsoft 365 security center
- Microsoft 365 compliance center

If you're an admin, learn more in [Choose your Windows labeling solution](rms-client/use-client.md#choose-your-windows-labeling-solution).

### Classic client deprecation

To provide a unified and streamlined customer experience, the **Azure Information Protection classic client** and **Label Management** in the Azure Portal are being **deprecated** as of **March 31, 2021**. 

After deprecation, the client will continue to work as expected. However, administrators will not be able to update policies on the portal, and no more fixes or changes will be supplied for the classic client.

This time-frame allows all current Azure Information Protection customers to transition to our unified labeling solution using the Microsoft Information Protection Unified Labeling platform. Learn more in the official [deprecation notice](https://aka.ms/aipclassicsunset).

If you currently have the classic client deployed, we recommend that you upgrade to the unified labeling client. For more information, see;

- [Tutorial: Migrating from the classic client to the unified labeling client](tutorial-migrating-to-ul.md)
- [How to migrate Azure Information Protection labels to unified sensitivity labels](configure-policy-migrate-labels.md)
### Identify the client you have installed

If you are a user who wants to understand whether you have the classic or the unified labeling client installed, you can do one of the following:

- In your Office apps, check for the **Sensitivity** or **Protect** toolbar button. The unified labeling client shows the **Sensitivity** :::image type="icon" source="media/i-sensitivity.PNG" border="false"::: button, while the classic client shows the **Protect** button. 

- Check the version number for the Azure Information Protection application you have installed.

    - Versions **1.x** indicate that you have the classic client. Example: **1.54.59.0**
    - Versions **2.x** indicate that you have the unified labeling client. Example: **2.8.85.0**

    For example, in the **Windows Settings > Apps and features** area, scroll down to the **Microsoft Azure Information Protection** application, and check the version number.

    :::image type="content" source="media/client-about.png" alt-text="Check the Azure Information Protection client version":::

## When is the right time to migrate my labels?

We recommend that you migrate your Azure Information Protection labels to the unified labeling platform so that you can use them as sensitivity labels with other [clients and services that support unified labeling](configure-policy-migrate-labels.md#clients-and-services-that-support-unified-labeling).

For more information and instructions, see [How to migrate Azure Information Protection labels to unified sensitivity labels](configure-policy-migrate-labels.md).

## After I've migrated my labels, which management portal do I use?

After you've migrated your labels in the Azure portal, continue managing them in one of the following locations, depending on the clients you have installed:

|Client  |Description  |
|---------|---------|
|[Unified labeling clients and services](configure-policy-migrate-labels.md#clients-and-services-that-support-unified-labeling) only    |  If you only have unified labeling clients installed, manage your labels in one of the admin centers: Office 365 Security & Compliance Center, Microsoft 365 security center, or Microsoft 365 compliance center. Unified labeling clients download the labels and policy settings from these admin centers. <br /><br />For instructions, see [Create and configure sensitivity labels and their policies](/microsoft-365/compliance/create-sensitivity-labels).     |
|[Classic client](./rms-client/aip-client.md) only  | If you've migrated your labels, but still have the classic client installed, continue to use the Azure portal to edit labels and policy settings. The classic client continues to download labels and policy settings from Azure.
|Both the AIP [classic client](./rms-client/aip-client.md) and [unified labeling](configure-policy-migrate-labels.md#clients-and-services-that-support-unified-labeling) clients     | If you have both of the clients installed, use the admin centers or the Azure portal to make label changes. <br /><br />For the classic clients to pick up label changes made in the admin centers, return to the Azure portal to publish them. In the Azure portal > **Azure Information Protection - Unified labeling** pane, select **Publish**.  <br /><br /> Continue to use the Azure portal for [central reporting](reports-aip.md) and the [scanner](deploy-aip-scanner.md).     |
| | |

## Do I need to re-encrypt my files after moving to sensitivity labels and the unified labeling platform?

No, you don’t need to re-encrypt your files after moving to sensitivity labels and the unified labeling platform after migrating from the AIP classic client and the labels managed in the Azure portal.

After migrating, manage your labels and labeling policies from your labeling admin center, including the Microsoft security center, Microsoft compliance center, or the Microsoft Security & Compliance Center. 

For more information, see [Learn about sensitivity labels](/microsoft-365/compliance/sensitivity-labels) in the Microsoft 365 documentation and the [Understanding unified labeling migration](https://techcommunity.microsoft.com/t5/microsoft-security-and/understanding-unified-labeling-migration/ba-p/783185) blog.


## What's the difference between Azure Information Protection and Azure Rights Management?

Azure Information Protection (AIP) provides classification, labeling, and protection for an organization's documents and emails.

Content is protected using the Azure Rights Management service, which is now a component of AIP. 

For more information, see [How AIP protects your data](aip-classification-and-protection.md#how-aip-protects-your-data) and [What is Azure Rights Management?](what-is-azure-rms.md).

## What's the role of identity management for Azure Information Protection?

Identity management is an important component of AIP, as users must have a valid user name and password to access protected content.

To read more about how Azure Information Protection helps to secure your data, see [The role of Azure Information Protection in securing data](/enterprise-mobility-security/solutions/azure-information-protection-securing-data). 

## What subscription do I need for Azure Information Protection and what features are included?

To understand more about AIP subscriptions, see the subscription information and feature list on the [Azure Information Protection pricing](https://azure.microsoft.com/pricing/details/information-protection) page.

If you have a Microsoft 365 subscription that includes Azure Rights Management data protection, download the [Azure Information Protection licensing datasheet](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf) for more details about integrating with AIP.

Still have questions about licensing? See if they are answered in the [frequently asked questions for licensing](https://azure.microsoft.com/pricing/details/information-protection#faq) section.

## Do you need to be a global admin to configure Azure Information Protection, or can I delegate to other administrators?

Global administrators for a Microsoft 365 tenant or Azure AD tenant can obviously run all administrative tasks for Azure Information Protection. 

However, if you want to assign administrative permissions to other users, do so using the following roles:

- [Azure Information Protection administrator](#azure-information-protection-administrator)
- [Compliance administrator or Compliance data administrator](#compliance-administrator-or-compliance-data-administrator)
- [Security reader or Global reader](#security-reader-or-global-reader)
- [Security administrator](#security-administrator)
- [Azure Rights Management Global Administrator and Connector Administrator](#azure-rights-management-global-administrator-and-connector-administrator)

Additionally, note the following when managing administrative tasks and roles:

|Topic  |Details  |
|---------|---------|
|**Supported account types**     | Microsoft accounts are not supported for delegated administration of Azure Information Protection, even if these accounts are assigned to one of the administrative roles listed.         |
|**Onboarding controls**     |If you have configured [onboarding controls](activate-service.md#configuring-onboarding-controls-for-a-phased-deployment), this configuration does not affect the ability to administer Azure Information Protection, except the RMS connector. <br /><br />For example, if you have configured onboarding controls so that the ability to protect content is restricted to the *IT department* group, the account used to install and configure the RMS connector must be a member of that group.          |
|**Removing protection**     |  Administrators cannot automatically remove protection from documents or emails that were protected by Azure Information Protection. <br /><br />Only users who are assigned as super users can do remove protection, and only when the super user feature is enabled. <br /><br />Any user with administrative permissions to Azure Information Protection can enable the super user feature, and assign users as super users, including their own account.<br /><br />These actions are recorded in an administrator log. <br /><br />For more information, see the security best practices section in [Configuring super users for Azure Information Protection and discovery services or data recovery](configure-super-users.md). 
       |
|**Migrating to the unified labeling store**      |  If you are migrating your Azure Information Protection labels to the unified labeling store, be sure to read the following section from the label migration documentation: <br />[Administrative roles that support the unified labeling platform](configure-policy-migrate-labels.md#administrative-roles-that-support-the-unified-labeling-platform).
       |
| | |

### Azure Information Protection administrator

This Azure Active Directory administrator role lets an administrator configure Azure Information Protection but not other services. 

Administrators with this role can:

- Activate and deactivate the Azure Rights Management protection service
- Configure protection settings and labels
- Configure the Azure Information Protection policy
- Run all the PowerShell cmdlets for the [Azure Information Protection client](./rms-client/clientv2-admin-guide-powershell.md) and from the [AIPService module](administer-powershell.md)
    
To assign a user to this administrative role, see [Assign a user to administrator roles in Azure Active Directory](/azure/active-directory/active-directory-users-assign-role-azure-portal).

> [!NOTE]
> This role doesn't support tracking and revoking documents for users, and is not supported in the Azure portal if your tenant is on the [unified labeling platform](#how-can-i-determine-if-my-tenant-is-on-the-unified-labeling-platform).
    
### Compliance administrator or Compliance data administrator

These Azure Active Directory administrator roles enable administrators to:

- Configure Azure Information Protection, including activating and deactivating the Azure Rights Management protection service
- Configure protection settings and labels
- Configure the Azure Information Protection policy
- Run all the PowerShell cmdlets for the [Azure Information Protection client](./rms-client/clientv2-admin-guide-powershell.md) and from the [AIPService module](administer-powershell.md). 

To assign a user to this administrative role, see [Assign a user to administrator roles in Azure Active Directory](/azure/active-directory/active-directory-users-assign-role-azure-portal). 

To see what other permissions a user with these roles have, see the [Available roles](/azure/active-directory/active-directory-assign-admin-roles-azure-portal#available-roles) section from the Azure Active Directory documentation.

> [!NOTE]
> These roles don't support tracking and revoking documents for users.
>     
    
### Security reader or Global reader

These roles are used for [Azure Information Protection analytics](reports-aip.md) only, and enable administrators to:

- View how your labels are being used
- Monitor user access to labeled documents and emails
- View changes made to classification
- Identify documents that contain sensitive information that must be protected 

Because this feature uses Azure Monitor, you must also have a supporting [RBAC role](reports-aip.md#permissions-required-for-azure-information-protection-analytics).

### Security administrator

This Azure Active Directory administrator role enables administrators to configure Azure Information Protection in the Azure portal as well as some aspects of other Azure services. 

Administrators with this role cannot run any of the [PowerShell cmdlets from the AIPService module](administer-powershell.md), or track and revoke documents for users.
    
To assign a user to this administrative role, see [Assign a user to administrator roles in Azure Active Directory](/azure/active-directory/active-directory-users-assign-role-azure-portal). 

To see what other permissions a user with this role has, see the [Available roles](/azure/active-directory/active-directory-assign-admin-roles-azure-portal#available-roles) section from the Azure Active Directory documentation.

### Azure Rights Management Global Administrator and Connector Administrator

The Global Administrator role enables users to run all [PowerShell cmdlets from the AIPService module](administer-powershell.md) without making them a global administrator for other cloud services.

The Connector Administrator role enables users to run only the Rights Management (RMS) connector. 

These administrative roles don't grant permissions to management consoles, or support tracking and revoking documents for users.
    
To assign either of these administrative roles, use the AIPService PowerShell cmdlet, [Add-AipServiceRoleBasedAdministrator](/powershell/module/aipservice/add-aipservicerolebasedadministrator).

## Does Azure Information Protection support on-premises and hybrid scenarios?

Yes. Although Azure Information Protection is a cloud-based solution, it can classify, label, and protect documents and emails that are stored on-premises, as well as in the cloud.

If you have Exchange Server, SharePoint Server, and Windows file servers, use one or both of the following methods:

- Deploy the [Rights Management connector](deploy-rms-connector.md) so that these on-premises servers can use the Azure Rights Management service to protect your emails and documents
- Synchronize and federate your Active Directory domain controllers with Azure AD for a more seamless authentication experience for users. For example, use [Azure AD Connect](/azure/active-directory/hybrid/whatis-azure-ad-connect).

The Azure Rights Management service automatically generates and manages XrML certificates as required, so it doesn't use an on-premises PKI. 

For more information about how Azure Rights Management uses certificates, see the [Walkthrough of how Azure RMS works: First use, content protection, content consumption](./how-does-it-work.md#walkthrough-of-how-azure-rms-works-first-use-content-protection-content-consumption).

## What types of data can Azure Information Protection classify and protect?

Azure Information Protection can classify and protect email messages and documents, whether they are located on-premises or in the cloud. These documents include Word documents, Excel spreadsheets, PowerPoint presentations, PDF documents, text-based files, and image files. 

For more information, see the full list [file types supported](./rms-client/clientv2-admin-guide-file-types.md).

> [!NOTE]
> Azure Information Protection cannot classify and protect structured data such as database files, calendar items, Yammer posts, Sway content, and OneNote notebooks.
> 

> [!TIP]
> Power BI supports classification by using sensitivity labels and can apply protection from those labels to data that is exported to the following file formats: .pdf, .xls, and .ppt. For more information, see [Data protection in Power BI](/power-bi/admin/service-security-data-protection-overview).
> 
## I see Azure Information Protection is listed as an available cloud app for conditional access—how does this work?

Yes, as a preview offering, you can configure Azure AD conditional access for Azure Information Protection.

When a user opens a document that is protected by Azure Information Protection, administrators can now block or grant access to users in their tenant, based on the standard conditional access controls. Requiring multi-factor authentication (MFA) is one of the most commonly requested conditions. Another one is that devices must be [compliant with your Intune policies](/intune/protect/conditional-access-intune-common-ways-use) so that for example, mobile devices meet your password requirements and a minimum operating system version, and computers must be domain-joined.

For more information and some walk-through examples, see the following blog post: [Conditional Access policies for Azure Information Protection](https://cloudblogs.microsoft.com/enterprisemobility/2017/10/17/conditional-access-policies-for-azure-information-protection/).

Additional information:

|Topic  |Details  |
|---------|---------|
|**Evaluation frequency**    | For Windows computers, and the current preview release, the conditional access policies for Azure Information Protection are evaluated when the [user environment is initialized](./how-does-it-work.md#initializing-the-user-environment) (this process is also known as bootstrapping), and then every 30 days.<br /><br />To fine-tune how often your conditional access policies get evaluated, [configure the token lifetime](/azure/active-directory/active-directory-configurable-token-lifetimes).       |
|**Administrator accounts**     |We recommend that you do not add administrator accounts to your conditional access policies because these accounts will not be able to access the Azure Information Protection pane in the Azure portal.         |
|**MFA and B2B collaboration**     | If you use MFA in your conditional access policies for collaborating with other organizations (B2B), you must use [Azure AD B2B collaboration](/azure/active-directory/b2b/what-is-b2b) and create guest accounts for the users you want to share with in the other organization.        |
|**Terms of Use prompts**     |  With the Azure AD December 2018 preview release, you can now [prompt users to accept a terms of use](https://techcommunity.microsoft.com/t5/Azure-Active-Directory-Identity/Updates-to-Azure-AD-Terms-of-Use-functionality-within/ba-p/294822) before they open a protected document for the first time.       |
|**Cloud apps**     |  If you use many cloud apps for conditional access, you might not see **Microsoft Azure Information Protection** displayed in the list to select. <br /><br />In this case, use the search box at the top of the list. Start typing "Microsoft Azure Information Protection" to filter the available apps. Providing you have a supported subscription, you'll then see **Microsoft Azure Information Protection** to select.        |
| | |

> [!NOTE]
> The Azure Information Protection support for conditional access is currently in PREVIEW. The [Azure Preview Supplemental Terms](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) include additional legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability. 
> 

## I see Azure Information Protection is listed as a security provider for Microsoft Graph Security—how does this work and what alerts will I receive?

Yes, as a public preview offering, you can now receive an alert for **Azure Information Protection anomalous data access**. This alert is triggered when there are unusual attempts to access data that is protected by Azure Information Protection. For example, accessing an unusually high volume of data, at an unusual time of day, or access from an unknown location.

Such alerts can help you to detect advanced data-related attacks and insider threats in your environment. These alerts use machine learning to profile the behavior of users who access your protected data. 

The Azure Information Protection alerts can be accessed by [using the Microsoft Graph Security API](/graph/api/resources/security-api-overview), or you can [stream alerts](/graph/security-integration) to SIEM solutions, such as Splunk and IBM Qradar, by using Azure Monitor.

For more information about the Microsoft Graph Security API, see [Microsoft Graph Security API overview](/graph/security-concept-overview).

> [!NOTE]
> The Azure Information Protection support for Microsoft Graph Security is currently in PREVIEW. The [Azure Preview Supplemental Terms](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) include additional legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability. 
> 

## I've heard a new release is going to be available soon, for Azure Information Protection—when will it be released?

The technical documentation does not contain information about upcoming releases. For this type of information, use the [Microsoft 365 Roadmap](https://www.microsoft.com/microsoft-365/roadmap?&filters=Azure%20Information%20Protection%2CO365%20Information%20Protection#owRoadmapMainContent), check the [Enterprise Mobility + Security Blog](https://techcommunity.microsoft.com/t5/Enterprise-Mobility-Security/bg-p/enterprisemobilityandsecurity?product=azure-information-protection,azure-rights-management-services).

## Is Azure Information Protection suitable for my country?

Different countries have different requirements and regulations. To help you answer this question for your organization, see [Suitability for different countries](./compliance.md#suitability-for-different-countries).

## How can Azure Information Protection help with GDPR?

[!INCLUDE [gdpr-hybrid-note](includes/gdpr-hybrid-note.md)]

## Where can I find supporting information for Azure Information Protection—such as legal, compliance, and SLAs?
See [Compliance and supporting information for Azure Information Protection](./compliance.md).

## How can I report a problem or send feedback for Azure Information Protection?

For technical support, use your standard support channels or [contact Microsoft Support](information-support.md#to-contact-microsoft-support).

We also invite you to engage with our engineering team, on their [Azure Information Protection Yammer site](https://www.yammer.com/askipteam/). 

## What do I do if my question isn't here?

First, review the frequently asked questions listed below, which are specific to classification and labeling, or specific to data protection. The [Azure Rights Management service (Azure RMS)](what-is-azure-rms.md) provides the data protection technology for Azure Information Protection. Azure RMS can be used with classification and labeling, or by itself. 

- [FAQs for classification and labeling](faqs-infoprotect.md)

- [FAQs for data protection](faqs-rms.md)

- [FAQs for the classic client only](faqs-classic.md)

If your question isn't answered, see the links and resources listed in [Information and support for Azure Information Protection](information-support.md).
