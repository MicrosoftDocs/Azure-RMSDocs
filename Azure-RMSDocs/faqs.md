---
# required metadata

title: FAQs for Azure Information Protection
description: Some frequently asked questions about Azure Information Protection and its data protection service, Azure Rights Management (Azure RMS).
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 11/09/2018
ms.topic: conceptual
ms.service: information-protection
ms.assetid: 71ce491f-41c1-4d15-9646-455a6eaa157d

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Frequently asked questions for Azure Information Protection

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](http://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

Have a question about Azure Information Protection, or about the Azure Rights Management service (Azure RMS)? See if it's answered here.

These FAQ pages are updated regularly, with new additions listed in the monthly documentation update announcements on the [Azure Information Protection technical blog](https://aka.ms/AIPblog).

## What's the difference between Azure Information Protection and Microsoft Information Protection?

Unlike Azure Information Protection, Microsoft Information Protection isn't a subscription or product that you can buy. Instead, it's a framework for products and integrated capabilities that help you protect your organization's sensitive information:

- Individual products in this framework include Azure Information Protection, Office 365 Information Protection (for example, Office 365 DLP), Windows Information Protection, and Microsoft Cloud App Security. 

- The integrated capabilities in this framework include unified label management, end-user labeling experiences built into Office apps, the ability for Windows to understand unified labels and apply protection to data, the Microsoft Information Protection SDK, and new functionality in Adobe Acrobat Reader to view labeled and protected PDFs.

For more information, see [Announcing availability of information protection capabilities to help protect your sensitive data](https://techcommunity.microsoft.com/t5/Enterprise-Mobility-Security/Announcing-availability-of-information-protection-capabilities/ba-p/261967).

## What's the difference between Azure Information Protection and Azure Rights Management?

Azure Information Protection provides classification, labeling, and protection for an organization's documents and emails. The protection technology uses the Azure Rights Management service; now a component of Azure Information Protection.

## What is the role of identity management for Azure Information Protection?

A user must have a valid user name and password to access content that is protected by Azure Information Protection. To read more about how Azure Information Protection helps to secure your data, see [The role of Azure Information Protection in securing data](/enterprise-mobility-security/solutions/azure-information-protection-securing-data). 

## What subscription do I need for Azure Information Protection and what features are included?
See the subscription information and feature list on the [Azure Information Protection pricing](https://azure.microsoft.com/en-us/pricing/details/information-protection) page. 

If you have an Office 365 subscription that includes Azure Rights Management data protection, download the [Azure Information Protection licensing datasheet](http://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf), which also includes some frequently asked questions for licensing.

## Is the Azure Information Protection client only for subscriptions that include classification and labeling?

No. Although most of the presentations and demos you've seen of the Azure Information Protection client show how it supports classification and labeling, it can also be used with subscriptions that include just the Azure Rights Management service to protect data.

When the Azure Information Protection client for Windows is installed and it doesn't have an Azure Information Protection policy, the client automatically operates in [protection-only mode](./rms-client/client-protection-only-mode.md). In this mode, users can easily apply Rights Management templates and custom permissions. If you later purchase a subscription that does include classification and labeling, the client automatically switches to standard mode when it downloads the Azure Information Protection policy.

If you currently use the Rights Management sharing application for Windows, we recommend that you replace this application with the Azure Information Protection client. Support for the sharing application will end January 31, 2019. To help with the transition, see [Tasks that you used to do with the RMS sharing application](./rms-client/upgrade-client-app.md).

## Do you need to be a global admin to configure Azure Information Protection, or can I delegate to other administrators?

Global administrators for an Office 365 tenant or Azure AD tenant can obviously run all administrative tasks for Azure Information Protection. However, if you want to assign administrative permissions to other users, you have the following options:

- **Information Protection Administrator**: This Azure Active Directory administrator role lets an administrator configure all aspects of Azure Information Protection but not other services. An administrator with this role can activate and deactivate the Azure Rights Management protection service, configure protection settings and labels, and configure the Azure Information Protection policy. In addition, an administrator with this role can run all the PowerShell cmdlets for the [Azure Information Protection client](./rms-client/client-admin-guide-powershell.md) and from the [AIPService module](administer-powershell.md). 
    
    To assign a user to this administrative role, see [Assign a user to administrator roles in Azure Active Directory](/azure/active-directory/active-directory-users-assign-role-azure-portal).

- **Security Administrator**: This Azure Active Directory administrator role lets an administrator configure all aspects of Azure Information Protection in the Azure portal, in addition to configuring some aspects of other Azure services. An administrator with this role cannot run any of the [PowerShell cmdlets from the AIPService module](administer-powershell.md).
    
    To assign a user to this administrative role, see [Assign a user to administrator roles in Azure Active Directory](/azure/active-directory/active-directory-users-assign-role-azure-portal). To see what other permissions a user with this role has, see the [Available roles](/azure/active-directory/active-directory-assign-admin-roles-azure-portal#available-roles) section from the Azure Active Directory documentation.

- Azure Rights Management **Global Administrator** and **Connector Administrator**: For these Azure Rights Management administrator roles, the first grants users permissions to run all [PowerShell cmdlets from the AIPService module](administer-powershell.md) without making them a global administrator for other cloud services, and the second role grants permissions to run only the Rights Management (RMS) connector. Neither of these administrative roles grant permissions to management consoles or to use the Admin mode in the document tracking site.

    To assign either of these administrative roles, use the AIPService PowerShell cmdlet, [Add-AipServiceRoleBasedAdministrator](/powershell/module/aipservice/add-aipservicerolebasedadministrator).

Some things to note:

- If you have configured [onboarding controls](activate-service.md#configuring-onboarding-controls-for-a-phased-deployment), this configuration does not affect the ability to administer Azure Information Protection, except the RMS connector. For example, if you have configured onboarding controls such that the ability to protect content is restricted to the “IT department” group, the account that you use to install and configure the RMS connector must be a member of that group. 

- Users who are assigned an administrative role cannot automatically remove protection from documents or emails that were protected by Azure Information Protection. Only users who are assigned super users can do this, and when the super user feature is enabled. However, any user that you assign administrative permissions to Azure Information Protection can assign users as super users, including their own account. They can also enable the super user feature. These actions are recorded in an administrator log. For more information, see the security best practices section in [Configuring super users for Azure Information Protection and discovery services or data recovery](configure-super-users.md). 

- If you are migrating your Azure Information Protection labels to Office 365, be sure to read the following section from the label migration documentation: [Important information about administrative roles](configure-policy-migrate-labels.md#important-information-about-administrative-roles).

## Does Azure Information Protection support on-premises and hybrid scenarios?

Yes. Although Azure Information Protection is a cloud-based solution, it can classify, label, and protect documents and emails that are stored on-premises, as well as in the cloud.

If you have Exchange Server, SharePoint Server, and Windows file servers, you can deploy the [Rights Management connector](deploy-rms-connector.md) so that these on-premises servers can use the Azure Rights Management service to protect your emails and documents. You can also synchronize and federate your Active Directory domain controllers with Azure AD for a more seamless authentication experience for users, for example, by using [Azure AD Connect](/azure/active-directory/hybrid/whatis-hybrid-identity#what-is-azure-ad-connect).

The Azure Rights Management service automatically generates and manages XrML certificates as required, so it doesn’t use an on-premises PKI. For more information about how Azure Rights Management uses certificates, see the [Walkthrough of how Azure RMS works: First use, content protection, content consumption](./how-does-it-work.md#walkthrough-of-how-azure-rms-works-first-use-content-protection-content-consumption) section in the [How does Azure RMS work?](./how-does-it-work.md) article.

## What types of data can Azure Information Protection classify and protect?

Azure Information Protection can classify and protect email messages and documents, whether they are located on-premises or in the cloud. These documents include Word documents, Excel spreadsheets, PowerPoint presentations, PDF documents, text-based files, and image files. For a list of the document types supported, see the list of [file types supported](./rms-client/client-admin-guide-file-types.md) in the admin guide.

Azure Information Protection cannot classify and protect structured data such as database files, calendar items, PowerBI reports, Yammer posts, Sway content, and OneNote notebooks.

## I see Azure Information Protection is listed as an available cloud app for conditional access—how does this work?

Yes, as a public preview offering, you can now configure Azure AD conditional access for Azure Information Protection.

When a user opens a document that is protected by Azure Information Protection, administrators can now block or grant access to users in their tenant, based on the standard conditional access controls. Requiring multi-factor authentication (MFA) is one of the most commonly requested conditions. Another one is that devices must be [compliant with your Intune policies](/intune/conditional-access-intune-common-ways-use) so that for example, mobile devices meet your password requirements and a minimum operating system version, and computers must be domain-joined.

For more information and some walk-through examples, see the following blog post: [Conditional Access policies for Azure Information Protection](https://cloudblogs.microsoft.com/enterprisemobility/2017/10/17/conditional-access-policies-for-azure-information-protection/).

Additional information:

- For Windows computers: For the current preview release, the conditional access policies for Azure Information Protection are evaluated when the [user environment is initialized](./how-does-it-work.md#initializing-the-user-environment) (this process is also known as bootstrapping), and then every 30 days.

- You might want to fine-tune how often your conditional access policies get evaluated. You can do this by configuring the token lifetime. For more information, see [Configurable token lifetimes in Azure Active Directory](/azure/active-directory/active-directory-configurable-token-lifetimes).

- We recommend that you do not add administrator accounts to your conditional access policies because these accounts will not be able to access the Azure Information Protection blade in the Azure portal.

- If you use MFA in your conditional access policies for collaborating with other organizations (B2B), you must use [Azure AD B2B collaboration](/active-directory/b2b/what-is-b2b) and create guest accounts for the users you want to share with in the other organization.

- If you use many cloud apps for conditional access, you might not see **Microsoft Azure Information Protection** displayed in the list to select. In this case, use the search box at the top of the list. Start typing "Microsoft Azure Information Protection" to filter the available apps. Providing you have a supported subscription, you'll then see **Microsoft Azure Information Protection** to select. 

## I see Azure Information Protection is listed as a security provider for Microsoft Graph Security—how does this work and what alerts will I receive?

Yes, as a public preview offering, you can now receive an alert for **Azure Information Protection anomalous data access**. This alert is triggered when there are unusual attempts to access data that is protected by Azure Information Protection. For example, accessing an unusually high volume of data, at an unusual time of day, or access from an unknown location.

Such alerts can help you to detect advanced data-related attacks and insider threats in your environment. These alerts use machine learning to profile the behavior of users who access your protected data. 

The Azure Information Protection alerts can be accessed by [using the Microsoft Graph Security API](https://developer.microsoft.com/graph/docs/api-reference/v1.0/resources/security-api-overview), or you can [stream alerts](https://developer.microsoft.com/en-us/graph/docs/concepts/security_siemintegration) to SIEM solutions, such as Splunk and IBM Qradar, by using Azure Monitor.

For more information about the Microsoft Graph Security API, see [Microsoft Graph Security API overview](https://developer.microsoft.com/graph/docs/concepts/security-concept-overview).

## What’s the difference between labels in Azure Information Protection and labels in Office 365?

Until recently, Office 365 had just [retention labels](https://support.office.com/article/af398293-c69d-465e-a249-d74561552d30) that let you classify documents and emails for auditing and retention when that content is in Office 365 services. In comparison, Azure Information Protection labels let you apply a consistent classification and protection policy for documents and emails whether they are on-premises or in the cloud.

Announced at Microsoft Ignite 2018, you will now start to see an option to create and configure [sensitivity labels](https://docs.microsoft.com/Office365/SecurityCompliance/sensitivity-labels) in addition to retention labels in the Office 365 Security & Compliance Center. In addition, now in preview, you can migrate your existing Azure Information Protection labels to the new unified labeling store. 

For more information about unified labeling management and how these labels will be supported, see the blog post, [Announcing availability of information protection capabilities to help protect your sensitive data](https://techcommunity.microsoft.com/t5/Enterprise-Mobility-Security/Announcing-availability-of-information-protection-capabilities/ba-p/261967).

For more information about migrating your existing labels, see [How to migrate Azure Information Protection labels to the Office 365 Security & Compliance Center](configure-policy-migrate-labels.md).

## What’s the difference between Windows Server FCI and the Azure Information Protection scanner?

Windows Server File Classification Infrastructure has historically been an option to classify documents and then protect them by using the [Rights Management connector](deploy-rms-connector.md) (Office documents only) or a [PowerShell script](./rms-client/configure-fci.md) (all file types). 

We now recommend you use the [Azure Information Protection scanner](deploy-aip-scanner.md). The scanner uses the Azure Information Protection client and your Azure Information Protection policy to label documents (all file types) so that these documents are then classified and optionally, protected.

The main differences between these two solutions:

|Windows Server FCI|Azure Information Protection scanner|
|--------------------------------|-------------------------------------|
|Supported data stores: <br /><br />- Local folders on Windows Server|Supported data stores: <br /><br />- Local folders on Windows Server<br /><br />- Windows file shares and network-attached storage<br /><br />- SharePoint Server 2016 and SharePoint Server 2013. SharePoint Server 2010 is also supported for customers who have [extended support for this version of SharePoint](https://support.microsoft.com/lifecycle/search?alpha=SharePoint%20Server%202010).|
|Operational mode: <br /><br />- Real time|Operational mode: <br /><br />- Systematically crawls the data stores and this cycle can run once, or repeatedly|
|Support for file types: <br /><br />- All file types are protected by default <br /><br />- Specific file types can be excluded from protection by editing the registry|Support for file types: <br /><br />- Office file types are protected by default <br /><br />- Specific file types can be included for protection by editing the registry|

Currently, there is a difference in setting the [Rights Management owner](configure-usage-rights.md#rights-management-issuer-and-rights-management-owner) for files that are protected on a local folder or network share. By default, for both solutions, the Rights Management owner is set to the account that protects the file but you can override this setting:

- For Windows Server FCI: You can set the Rights Management owner to be a single account for all files, or dynamically set the Rights Management owner for each file. To dynamically set the Rights Management owner, use the **-OwnerMail [Source File Owner Email]** parameter and value. This configuration retrieves the user's email address from Active Directory by using the user account name in the file's Owner property.

- For the Azure Information Protection scanner: You can set the Rights Management owner to be a single account for all files on a specified data store, but you cannot dynamically set the Rights Management owner for each file. To set the account, specify the **-DefaultOwner** parameter for the [data repository profile](/powershell/module/azureinformationprotection/Set-AIPScannerRepository?view=azureipps#optional-parameters).

When the scanner protects files on SharePoint sites and libraries, the Rights Management owner is dynamically set for each file by using the SharePoint author value.

## I’ve heard a new release is going to be available soon, for Azure Information Protection—when will it be released?

The technical documentation does not contain information about upcoming releases. For this type of information and for release announcements, check the [Enterprise Mobility and Security Blog](https://techcommunity.microsoft.com/t5/Enterprise-Mobility-Security/bg-p/enterprisemobilityandsecurity?product=azure-information-protection,azure-rights-management-services) and get the latest updates from [Microsoft Mobility@MSFTMobility](https://twitter.com/MSFTMobility) on Twitter. If it’s an Office release that you’re interested in, be sure to also check the [Office 365 blog](https://techcommunity.microsoft.com/t5/Office-365-Blog/bg-p/Office365Blog) and [Office Apps blog](https://techcommunity.microsoft.com/t5/Office-Apps-Blog/bg-p/OfficeAppsBlog).

## Is Azure Information Protection suitable for my country?

Different countries have different requirements and regulations. To help you answer this question for your organization, see [Suitability for different countries](./compliance.md#suitability-for-different-countries).

## How can Azure Information Protection help with GDPR?

To see how Azure Information Protection can help you meet the General Data Protection Regulation (GDPR), see the following blog post announcement, with video: [Microsoft 365 provides an information protection strategy to help with the GDPR](https://blogs.office.com/2018/02/22/microsoft-365-provides-an-information-protection-strategy-to-help-with-the-gdpr).

## Where can I find supporting information for Azure Information Protection—such as legal, compliance, and SLAs?
See [Compliance and supporting information for Azure Information Protection](./compliance.md).

## How can I report a problem or send feedback for Azure Information Protection?

For technical support, use your standard support channels or [contact Microsoft Support](information-support.md#to-contact-microsoft-support).

For feedback such as suggestions for improvements or new features: In your Office application, on the **Home** tab, in the **Protection** group, click **Protect**, and then click **Help and Feedback**. In the **Microsoft Azure Information Protection** dialog box, click **Send Us Feedback**. This option opens an email message to be sent to the Information Protection team.

We also invite you to engage with our engineering team, on their [Azure Information Protection Yammer site](https://www.yammer.com/askipteam/). 

## What do I do if my question isn’t here?

First, review the following frequently asked questions that are specific to classification and labeling, or specific to data protection. The Azure Rights Management service (Azure RMS) provides the data protection technology for Azure Information Protection. Azure RMS can be used with classification and labeling, or by itself. 

- [FAQs for classification and labeling](faqs-infoprotect.md)

- [FAQs for data protection](faqs-rms.md)

If you question isn't answered, use the links and resources listed in [Information and support for Azure Information Protection](information-support.md).

In addition, there are FAQs designed for end users:

- [FAQ for Azure Information Protection app for iOS and Android](./rms-client/mobile-app-faq.md)

- [FAQ for RMS sharing app for Mac computers and Windows Phone](https://technet.microsoft.com/dn451248)

- [FAQ for Rights Management Sharing Application for Windows](https://technet.microsoft.com/dn467883)



