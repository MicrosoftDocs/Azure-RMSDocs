---
# required metadata

title: FAQs for Azure Information Protection (AIP)
description: Get answers to frequently asked questions about Azure Information Protection (AIP) and its protection service, Azure Rights Management (Azure RMS).
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 09/14/2021
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

# Frequently asked questions for Azure Information Protection (AIP)

[!INCLUDE [looking-for-mip](includes/looking-for-mip.md)]

Have a question about Azure Information Protection (AIP), or about the Azure Rights Management service (Azure RMS)?

See if it's answered below or on the [subsequent, more specific, FAQ pages](#what-do-i-do-if-my-question-isnt-here).

## What's the difference between Azure Information Protection and Microsoft Purview Information Protection?

Unlike Azure Information Protection, [Microsoft Purview Information Protection](https://www.microsoft.com/security/business/information-protection) isn't a subscription or product that you can buy. Instead, it's a framework for products and integrated capabilities that help you protect your organization's sensitive information.

**Microsoft Purview Information Protection products include**:
- Azure Information Protection
- Microsoft 365 Information Protection, such as Microsoft 365 DLP
- Windows Information Protection
- Microsoft Defender for Cloud Apps

**Microsoft Purview Information Protection capabilities include**:
- Unified label management
- End-user labeling experiences built into Office apps
- The ability for Windows to understand unified labels and apply protection to data
- The Microsoft Information Protection SDK
- Functionality in Adobe Acrobat Reader to view labeled and protected PDFs

For more information, see [Information protection capabilities to help protect your sensitive data](https://techcommunity.microsoft.com/t5/Enterprise-Mobility-Security/Announcing-availability-of-information-protection-capabilities/ba-p/261967).


## What's the difference between Azure Information Protection and Azure Rights Management?

Azure Information Protection (AIP) provides classification, labeling, and protection for an organization's documents and emails.

Content is protected using the Azure Rights Management service, which is now a component of AIP.

For more information, see [How AIP protects your data](aip-classification-and-protection.md#how-aip-protects-your-data) and [Learn about the Azure Rights Management service](/purview/azure-rights-management-learn-about)).

## What subscription do I need for Azure Information Protection and what features are included?

To understand more about AIP subscriptions, see:

- [Microsoft 365 licensing guidance for security & compliance](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection)
- [Modern Work Plan Comparison](https://go.microsoft.com/fwlink/?linkid=2139145) (PDF download)

## Do you need to be a global admin to configure Azure Information Protection, or can I delegate to other administrators?

Global administrators for a Microsoft 365 tenant or Microsoft Entra tenant can obviously run all administrative tasks for Azure Information Protection.

However, if you want to assign administrative permissions to other users, do so using the following roles:

- [Azure Information Protection administrator](#azure-information-protection-administrator)
- [Compliance administrator or Compliance data administrator](#compliance-administrator-or-compliance-data-administrator)
- [Security administrator](#security-administrator)
- [Azure Rights Management Global Administrator and Connector Administrator](#azure-rights-management-global-administrator-and-connector-administrator)

Additionally, note the following when managing administrative tasks and roles:

|Issue  |Details  |
|---------|---------|
|**Supported account types**     | Microsoft accounts are not supported for delegated administration of Azure Information Protection, even if these accounts are assigned to one of the administrative roles listed.         |
|**Onboarding controls**     |If you have configured [onboarding controls](/purview/activate-rights-management-service#configuring-onboarding-controls-for-a-phased-deployment), this configuration does not affect the ability to administer Azure Information Protection, except the RMS connector. <br /><br />For example, if you have configured onboarding controls so that the ability to protect content is restricted to the *IT department* group, the account used to install and configure the RMS connector must be a member of that group.          |
|**Removing protection**     |  Administrators cannot automatically remove protection from documents or emails that were protected by Azure Information Protection. <br /><br />Only users who are assigned as super users can remove protection, and only when the super user feature is enabled. <br /><br />Any user with administrative permissions to Azure Information Protection can enable the super user feature, and assign users as super users, including their own account.<br /><br />These actions are recorded in an administrator log. <br /><br />For more information, see the security best practices section in [Configuring super users for Azure Information Protection and discovery services or data recovery](/purview/encryption-super-users). <br><br>**Tip**: If your content is stored in SharePoint or OneDrive, admins can run the [Unlock-SensitivityLabelEncryptedFile](/powershell/module/sharepoint-online/unlock-sposensitivitylabelencryptedfile) cmdlet to remove both the sensitivity label and the encryption. For more information, see the [Microsoft 365 documentation](/microsoft-365/compliance/sensitivity-labels-sharepoint-onedrive-files#remove-encryption-for-a-labeled-document). |
|**Migrating to the unified labeling store**      |  If you are migrating your Azure Information Protection labels to the unified labeling store, be sure to read the following section from the label migration documentation: <br />[Administrative roles that support the unified labeling platform](configure-policy-migrate-labels.md#administrative-roles-that-support-the-unified-labeling-platform). |

### Azure Information Protection administrator

This Microsoft Entra administrator role lets an administrator configure Azure Information Protection but not other services.

Administrators with this role can:

- Activate and deactivate the Azure Rights Management protection service
- Configure protection settings and labels
- Configure the Azure Information Protection policy
- Run all the PowerShell cmdlets for the [Azure Information Protection client](./rms-client/clientv2-admin-guide-powershell.md) and from the [AIPService module](/purview/administer-rights-management-powershell)

To assign a user to this administrative role, see [Assign a user to administrator roles in Microsoft Entra ID](/azure/active-directory/active-directory-users-assign-role-azure-portal).

### Compliance administrator or Compliance data administrator

These Microsoft Entra administrator roles enable administrators to:

- Configure Azure Information Protection, including activating and deactivating the Azure Rights Management protection service
- Configure protection settings and labels
- Configure the Azure Information Protection policy
- Run all the PowerShell cmdlets for the [Azure Information Protection client](./rms-client/clientv2-admin-guide-powershell.md) and from the [AIPService module](/purview/administer-rights-management-powershell).

To assign a user to this administrative role, see [Assign a user to administrator roles in Microsoft Entra ID](/azure/active-directory/active-directory-users-assign-role-azure-portal).

To see what other permissions a user with these roles have, see the [Available roles](/azure/active-directory/active-directory-assign-admin-roles-azure-portal#available-roles) section from the Microsoft Entra documentation.

> [!NOTE]
> These roles don't support [tracking and revoking](rms-client/track-and-revoke-admin.md) documents for users.
>

### Security administrator

This Microsoft Entra administrator role enables administrators to configure Azure Information Protection in the Azure portal and some aspects of other Azure services.

Administrators with this role cannot run any of the [PowerShell cmdlets from the AIPService module](/purview/administer-rights-management-powershell), or [track and revoke](rms-client/track-and-revoke-admin.md) documents for users.

To assign a user to this administrative role, see [Assign a user to administrator roles in Microsoft Entra ID](/azure/active-directory/active-directory-users-assign-role-azure-portal).

To see what other permissions a user with this role has, see the [Available roles](/azure/active-directory/active-directory-assign-admin-roles-azure-portal#available-roles) section from the Microsoft Entra documentation.

### Azure Rights Management Global Administrator and Connector Administrator

The Global Administrator role enables users to run all [PowerShell cmdlets from the AIPService module](/purview/administer-rights-management-powershell) without making them a global administrator for other cloud services.

The Connector Administrator role enables users to run only the Rights Management (RMS) connector.

These administrative roles don't grant permissions to management consoles. The Connector Administrator role also does not support [tracking and revoking](rms-client/track-and-revoke-admin.md) documents for users.

To assign either of these administrative roles, use the AIPService PowerShell cmdlet, [Add-AipServiceRoleBasedAdministrator](/powershell/module/aipservice/add-aipservicerolebasedadministrator).

## Does Azure Information Protection support on-premises and hybrid scenarios?

Yes. Although Azure Information Protection is a cloud-based solution, it can classify, label, and protect documents and emails that are stored on-premises, as well as in the cloud.

If you have Exchange Server, SharePoint Server, and Windows file servers, use one or both of the following methods:

- Deploy the [Rights Management connector](deploy-rms-connector.md) so that these on-premises servers can use the Azure Rights Management service to protect your emails and documents
- Synchronize and federate your Active Directory domain controllers with Microsoft Entra ID for a more seamless authentication experience for users. For example, use [Microsoft Entra Connect](/azure/active-directory/hybrid/whatis-azure-ad-connect).

The Azure Rights Management service automatically generates and manages XrML certificates as required, so it doesn't use an on-premises PKI.

For more information about how Azure Rights Management uses certificates, see the [Walkthrough of how Azure RMS works: First use, content protection, content consumption](./how-does-it-work.md#walkthrough-of-how-azure-rms-works-first-use-content-protection-content-consumption).

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

Yes, you can configure Microsoft Entra Conditional Access for Azure Information Protection.

When a user opens a document that is protected by Azure Information Protection, administrators can now block or grant access to users in their tenant, based on the standard conditional access controls. Requiring multifactor authentication (MFA) is one of the most commonly requested conditions. Another one is that devices must be [compliant with your Intune policies](/mem/intune/protect/conditional-access-intune-common-ways-use) so that, for example, mobile devices meet your password requirements and a minimum operating system version, and computers must be domain-joined.

For more information, see [Conditional Access policies and encrypted documents](/purview/encryption-azure-ad-configuration).

Additional information:

|Topic  |Details  |
|---------|---------|
|**Evaluation frequency**    | For Windows computers, and the current preview release, the conditional access policies for Azure Information Protection are evaluated when the [user environment is initialized](./how-does-it-work.md#initializing-the-user-environment) (this process is also known as bootstrapping), and then every 30 days.<br /><br />To fine-tune how often your conditional access policies get evaluated, [configure the token lifetime](/azure/active-directory/active-directory-configurable-token-lifetimes).       |
|**Administrator accounts**     |We recommend that you do not add administrator accounts to your conditional access policies because these accounts will not be able to access the Azure Information Protection pane in the Azure portal.         |
|**MFA and B2B collaboration**     |If you use MFA in your conditional access policies for collaborating with other organizations (B2B), you must use [Microsoft Entra B2B collaboration](/azure/active-directory/b2b/what-is-b2b) and create guest accounts for the users you want to share with in the other organization.        |
|**Terms of Use prompts**     |With the Microsoft Entra December 2018 preview release, you can now [prompt users to accept a terms of use](https://techcommunity.microsoft.com/t5/Azure-Active-Directory-Identity/Updates-to-Azure-AD-Terms-of-Use-functionality-within/ba-p/294822) before they open a protected document for the first time.       |
|**Cloud apps**     |If you use many cloud apps for conditional access, you might not see **Microsoft Information Protection Sync Service** and **Microsoft Rights Management Service** displayed in the list to select. <br /><br />In this case, use the search box at the top of the list. Start typing "Microsoft Information Protection Sync Service" and "Microsoft Rights Management Service" to filter the available apps. Providing you have a supported subscription; you'll then see these options and will be able to select them. |

> [!NOTE]
> The Azure Information Protection support for conditional access is currently in PREVIEW. The [Azure Preview Supplemental Terms](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) include additional legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability.
>

## Is Azure Information Protection suitable for my country?

Different countries have different requirements and regulations. To help you answer this question for your organization, see [Suitability for different countries](./compliance.md#suitability-for-different-countries).

## How can Azure Information Protection help with GDPR?

[!INCLUDE [gdpr-hybrid-note](includes/gdpr-hybrid-note.md)]

## Where can I find supporting information for Azure Information Protection—such as legal, compliance, and SLAs?
See [Compliance and supporting information for Azure Information Protection](./compliance.md).


## How can I report a problem or send feedback for Azure Information Protection?

For technical support, use your standard support channels or [contact Microsoft Support](https://support.microsoft.com/contactus).

We also invite you to engage with our engineering team, on their [Azure Information Protection Yammer site](https://www.yammer.com/askipteam/).

## What do I do if my question isn't here?

First, review the frequently asked questions listed below, which are specific to classification and labeling, or specific to data protection. The [Azure Rights Management service (Azure RMS)](what-is-azure-rms.md) provides the data protection technology for Azure Information Protection. Azure RMS can be used with classification and labeling, or by itself.

- [FAQs for classification and labeling](faqs-infoprotect.md)

- [FAQs for data protection](faqs-rms.md)
