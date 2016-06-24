---
# required metadata

title: Frequently asked questions for Azure Rights Management | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 06/23/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
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

# Frequently asked questions for Azure Rights Management

*Applies to: Azure Rights Management, Office 365*

Some frequently asked questions for Microsoft [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)], also known as Azure RMS:

## What do I need to deploy Azure RMS and how do I get going?
First, check [Requirements for Azure Rights Management](requirements-azure-rms.md), which has information about the cloud subscription options, how you can use your on-premises servers with Azure RMS, which deployment scenarios are not currently supported, which devices and applications support Azure RMS, and a link if you need a list of IP addresses and domain names for firewalls or proxy servers. You might also want to check the other articles in this **Get Started **section as well as the **Understand & Explore** section, to get a basic understanding of how [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] can help protect your organization’s data, how it works with applications, how it compares with the on-premises version of Active Directory Rights Management, and understand the terms and abbreviations that are specific to [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)].

## Do files have to be in the cloud to be protected by Azure RMS?
No, this is a common misconception. The Azure Rights Management service (and Microsoft) do not see or store your data as part of the information protection process. Information that you protect is never sent to or stored in Azure unless you explicitly store it in Azure or use another cloud service that stores it in Azure. 

For more information, see [How does Azure RMS work? Under the hood](../understand-explore/how-does-it-work.md) to understand how a secret cola formula that is created and stored on-premises is protected by Azure RMS but remains on-premises.

## Can I integrate Azure RMS with my on-premises servers?
Yes. Azure RMS can be integrated with your on-premises servers, such as Exchange Server, SharePoint, and Windows file servers. To do this, you use the [Rights Management connector](../deploy-use/deploy-rms-connector.md). Or, if you're just interested in using File Classification Infrastructure (FC) with Windows Server, you can use the [RMS Protection cmdlets](https://technet.microsoft.com/library/mt601315%28v=ws.10%29.aspx). You can also synchronize and federate your Active Directory domain controllers with Azure AD for a more seamless authentication experience for users, for example, by using [Azure AD Connect](http://azure.microsoft.com/documentation/articles/active-directory-aadconnect/).

Azure RMS automatically generates and manages XrML certificates as required, so it doesn’t use an on-premises PKI. For more information about how Azure RMS uses certificates, see the [Walkthrough of how Azure RMS works: First use, content protection, content consumption](../understand-explore/how-does-it-work.md#walkthrough-of-how-azure-rms-works-first-use-content-protection-content-consumption) section in the [How does Azure RMS work?](../understand-explore/how-does-it-work.md) article.

## Is there a management pack or similar monitoring mechanism for the RMS connector?

No. Although the Rights Management connector logs information, warning, and error messages to the event log, there isn’t a management pack that includes monitoring for these events. However, the list of events and their descriptions, with more information to help you take corrective action is documented in [Monitor the Azure Rights Management connector](.. deploy-use/monitor-rms-connector).

## I have a hybrid deployment of Exchange with some users on Exchange Online and others on Exchange Server—is this supported by Azure RMS?
Absolutely, and the nice thing is, users will be able to seamlessly protect and consume protected emails and attachments across the two Exchange deployments. For this configuration, [activate Azure RMS](../deploy-use/activate-service.md) and [enable IRM for Exchange Online](https://technet.microsoft.com/library/dn151475%28v=exchg.150%29.aspx), then [deploy and configure the RMS connector](../deploy-use/deploy-rms-connector.md) for Exchange Server.

## Are there step-by-step instructions to configure Exchange Online to use Azure RMS?

Yes. See [Exchange Online: IRM Configuration](../deploy-use/configure-office365.md#exchange-online-irm-configuration.md ) to see a typical set of commands that enables Exchange Online to use Azure RMS, why the Outlook Web App doesn't immediately show the **Set permissions** menu options, and the command to run if you change or update the Azure RMS templates. 

## If I deploy Azure RMS in production, is my company then locked into the solution or risk losing access to content that we protected with Azure RMS?
No, you always remain in control of your data and can continue to access it, even if you decide to no longer use Azure RMS. For more information, see [Decommissioning and deactivating Azure Rights Management](../deploy-use/decommission-deactivate.md).

However, before you decommission your Azure RMS deployment, we would like to hear from you and understand why you made this decision. If Azure RMS does not fulfil your business requirements, check with us in case new functionality is planned for the near-future or if there are alternatives. Send an email message to [AskIPTeam@Microsoft.com](mailto:askipteam@microsoft.com?subject=Planning%20to%20decommission%20Azure%20RMS) and we’ll be happy to discuss your technical and business requirements.

## Can I control which of my users can use Azure RMS to protect content?
Yes, Azure RMS has user onboarding controls for this scenario. For more information, see the [Configuring onboarding controls for a phased deployment](../deploy-use/activate-service.md#configuring-onboarding-controls-for-a-phased-deployment) section in the [Activating Azure Rights Management](../deploy-use/activate-service.md) article.

## Can I prevent users from sharing protected documents with specific organizations?
One of the biggest benefits of Azure RMS is that it supports business-to-business collaboration without you having to configure explicit trusts for each partner organization, because Azure AD takes care of the authentication for you.

There is no administration option to prevent users from securely sharing documents with specific organizations. For example, you want to block an organization that you don’t trust or that has a competing business. Preventing Azure RMS from sending protected documents to users in these organizations wouldn’t make sense because your users would then share their documents unprotected, which is probably the last thing you want to happen in this scenario! For example, you wouldn’t be able to identify who is sharing company-confidential documents with which users in these organizations, which you can do when the document (or email) is protected by Azure RMS.

## When I share a protected document with somebody outside my company, how does that user get authenticated?
Azure RMS always uses an Azure Active Directory account and an associated email address for user authentication, which makes business-to-business collaboration seamless for administrators. If the other organization uses Azure services, users will already have accounts in Azure Active Directory, even if these accounts are created and managed on-premises and then synchronized to Azure.  If the organization has Office 365, under the covers, this service also uses Azure Active Directory for the user accounts.  If the user’s organization doesn’t have managed accounts in Azure, users can sign up for [RMS for individuals](../understand-explore/rms-for-individuals.md), which creates an unmanaged Azure tenant and directory for the organization with an account for the user, so that this user can then be authenticated for Azure RMS.

The authentication method for these accounts can vary, depending on how the administrator in the other organization has configured the Azure Active Directory accounts. For example, they could use passwords that were created for these accounts, multi-factor authentication (MFA), federation, or passwords that were created in Active Directory Domain Services and then synchronized to Azure Active Directory.

## Can I add users from outside my company to custom templates?
Yes. Creating custom templates that end users (and administrators) can select from applications makes it quick and easily for them to apply information protection, using predefined policies that you specify. One of the settings in the template is who is able to access the content, and you can specify users and groups from within your organization, and users from outside your organization.

To specify users from outside your organization, add them as contacts to a group that you select in the Azure classic portal when configuring your templates. Or, use [Windows PowerShell module for Azure Rights Management](../deploy-use/install-powershell.md):

-   **Use a rights definition object to create or update a template**.    Specify the external email addresses and their rights in a rights definition object, which you then use to create or update a template. You specify the rights definition object by using the [New-AadrmRightsDefinition](https://msdn.microsoft.com/library/azure/dn727080.aspx) cmdlet to create a variable and then supply this variable to the  -RightsDefinition parameter with the [Add-AadrmTemplate](https://msdn.microsoft.com/library/azure/dn727075.aspx) cmdlet (for a new template) or [Set-AadrmTemplateProperty](https://msdn.microsoft.com/library/azure/dn727076.aspx) cmdlet (if you're modifying an existing template). However, if you're adding these users to an existing template, you will need to define rights definition objects for the existing groups in the templates and not just the external users.

For more information about custom templates, see [Configuring custom templates for Azure Rights Management](../deploy-use/configure-custom-templates.md).

## Does Azure RMS work with dynamic groups in Azure AD?
An Azure AD Premium feature lets you configure dynamic membership for groups by specifying [attribute-based rules](https://azure.microsoft.com/documentation/articles/active-directory-accessmanagement-groups-with-advanced-rules/). When you create a security group in Azure AD, this group type supports dynamic membership but does not support an email address, and so cannot be used with Azure RMS. However, you can now create a new group type in Azure AD that supports both dynamic membership and is mail-enabled. When you add a new group in the Azure classic portal, you can choose the **GROUP TYPE** of **Office 365 “Preview”**. Because this group is mail-enabled, you can use it with Azure RMS.

As the option name clearly shows, this new group type is still in preview, with additional functionality expected and new documentation to follow. In the meantime, we wanted to confirm that you can use this new group type with Azure RMS.


## What devices and which file types are supported by Azure RMS?
For a list of supported devices, see [Client devices that support Azure RMS](../get-started/requirements-client-devices.md). Because not all supported devices can currently support all RMS capabilities, be sure to also check the [Client device capabilities](../get-started/requirements-client-devices.md#client-device-capabilities) table in the same article.

Azure RMS can support all file types. For text, image, Microsoft Office (Word, Excel, PowerPoint) files, .pdf files, and some other application file types, Azure RMS provides native protection that includes both encryption and enforcement of rights (permissions). For all other applications and file types, generic protection provides file encapsulation and authentication to verify if a user is authorized to open the file.

For a list of file name extensions that are natively supported by Azure RMS, see the [Supported file types and file name extensions](../rms-client/sharing-app-admin-guide-technical.md#supported-file-types-and-file-name-extensions) section of the [Rights Management sharing application administrator guide](../rms-client/sharing-app-admin-guide.md). File name extensions not listed are supported by using the RMS sharing application that automatically applies generic protection to these files.

## When I open an RMS-protected Office document, does the associated temporary file become RMS-protected as well?

No. In this scenario, the associated temporary file doesn’t contain data from the original document but instead, only what the user enters while the file is open. Unlike the original file, the temporary file is obviously not designed for sharing and would remain on the device, protected by local security controls, such as BitLocker and EFS.

## When will you support migration from AD RMS?
Initially, Azure RMS didn’t support migration from an on-premises deployment of Rights Management, such as AD RMS. But it’s supported now.

For more information, see [Migrating from AD RMS to Azure Rights Management](../plan-design/migrate-from-ad-rms-to-azure-rms.md).

## We really want to use BYOK with Azure RMS but learned that this isn’t compatible with Exchange Online—what’s your advice?
Don’t let this current limitation delay your Azure RMS deployment. If you have Exchange Online and want to use bring your own key (BYOK), we recommend that you deploy Azure RMS in the default key management mode now, where Microsoft generates and manages your key. That way, you get all the benefits of protecting your important files and emails now, with the option to move to BYOK later (for example, when Exchange Online does support BYOK).

However, if your company policies require you to use a hardware security module (HSM) and this would otherwise block your Azure RMS deployment, another option is to deploy Azure RMS with BYOK now, with reduced RMS functionality for Exchange. For more information, see [BYOK pricing and restrictions](../plan-design/byok-price-restrictions.md) from [Planning and iplementing your Azure Rights Management tenant key](../plan-design/plan-implement-tenant-key.md).

## A feature I am looking for doesn’t seem to work with SharePoint protected libraries—is support for my feature planned?
Currently, SharePoint supports RMS protected documents by using IRM protected libraries, which do not support custom templates, document tracking, and some other capabilities. For more information, see the [SharePoint Online and SharePoint Server](../understand-explore/office-apps-services-support.md#sharepoint-online-and-sharepoint-server) section in the [Office applications and services](../understand-explore/office-apps-services-support.md) article .

If you are interested in a specific  capability that isn't yet supported,  be sure to keep an eye on announcements on the [RMS team blog](http://blogs.technet.com/b/rms/).

## How do I configure One Drive for Business in SharePoint Online, so that users can safely share their files with people inside and outside the company?
By default, as an Office 365 administrator, you don’t configure this; users do.

Just as a SharePoint site administrator enables and configures IRM for a SharePoint library that they own, OneDrive for Business is designed for users to enable and configure IRM for their own OneDrive for Business library.  However, by using PowerShell, you can do this for them. For instructions, see the [SharePoint Online and OneDrive for Business: IRM Configuration](../deploy-use/configure-office365.md#sharepoint-online-and-onedrive-for-business-irm-configuration) section in the [Office 365: Configuration for clients and online services](../deploy-use/configure-office365.md) article.

## Do you have any tips or tricks for a successful RMS deployment?
After overseeing many deployments and listening to our customers, partners, consultants, and support engineers – one of the biggest tips we can pass on from experience: **Design and deploy simple rights policies**.

Because Azure RMS supports sharing securely with anyone, you can afford to be ambitious with your information protection reach. But be conservative with your rights policies. For many organizations, the biggest business impact comes from preventing data leakage by applying the default rights policy template that restricts access to people in your organization. Of course, you can get much more granular than that if you need to – prevent people from printing, editing etc. But keep the more granular restrictions as the exception for documents that really need high-level security, and don’t implement these more restrictive policies on day one, but plan for a more phased approach.

## What features can or can’t be used with the different subscriptions for Azure RMS?
For the paid subscriptions that support Azure RMS (Office 365, Azure RMS Premium, and Enterprise Mobility Suite), there are some differences in the RMS features that are supported. For a list of these, see [Comparison of Rights Management Services (RMS) Offerings](http://technet.microsoft.com/dn858608).

The free subscription that supports Azure RMS (RMS for individuals) supports consuming content that has been protected by Azure RMS. For more information, see [RMS for individuals and Azure Rights Management](../understand-explore/rms-for-individuals.md).

## Where can I get technical information about the free Azure RMS subscription (RMS for individuals)—for example, how it really works, how to take control of the accounts, and which domains can’t be used?
You’ll find answers to these questions in [RMS for individuals and Azure Rights Management](../understand-explore/rms-for-individuals.md) and related articles.

## How do we regain access to files that were protected by an employee who has now left the organization?
Use the super user feature of Azure RMS, which lets authorized users have full owner rights for all use licenses that were granted by your organization’s RMS tenant. This same feature lets authorized services index and inspect files, as needed.

For more information, see [Configuring super users for Azure Rights Management and discovery services or data recovery](../deploy-use/configure-super-users.md).

## Can Rights Management prevent screen captures?
By not granting the **Copy** [usage righ](../deploy-use/configure-usage-rights.md), Rights Management can prevent screen captures from many of the commonly used screen capture tools on Windows platforms (Windows 7, Windows 8.1, Windows 10, Windows Phone) and Android. However, iOS and Mac devices do not allow any app to prevent screen captures, and browsers (for example, when used with Outlook Web App and Office Online) also cannot prevent screen captures.

Preventing screen captures can help to avoid accidental or negligent disclosure of confidential or sensitive information. But there are many ways that a user can share data that is displayed on a screen, and taking a screen shot is only one method. For example, a user intent on sharing displayed information can take a picture of it using their camera phone, retype the data, or simply verbally relay it to somebody.

As these examples demonstrate, even if all platforms and all software supported the Rights Management APIs to block screen captures, technology alone cannot always prevent users from sharing data that they should not. Rights Management can help to safeguard your important data by using authorization and usage policies, but this enterprise rights management solution should be used with other controls. For example, implement physical security, carefully screen and monitor people who have authorized access to your organization's data, and invest in user education so users understand what data should not be shared.

## What's the difference between a user protecting an email with Do Not Forward and a template that doesn't include the Forward right?

Despite its name and appearance, **Do Not Forward** is neither the opposite of the Forward right, nor a template. It is actually a set of rights that include restricting copying, printing, and saving attachments, in addition to restricting the forwarding of emails. The rights are dynamically applied to users via the chosen recipients, and not statically assigned by the administrator. For more information, see the [Do Not Forward option for emails](../deploy-use/configure-usage-rights.md#do-not-forward-option-for-emails) section in [Configuring usage rights for Azure Rights Management](../deploy-use/configure-usage-rights.md).

## Where can I find information about 3rd party solutions that integrate with Azure RMS?

Many software vendors already have solutions or are implementing solutions that integrate with Azure RMS—and the list is growing very rapidly. You might find it useful to check the [Enterprise Mobility and Security Blog](https://blogs.technet.microsoft.com/enterprisemobility/?product=azure-rights-management-services) and get the latest updates from [Dan Plastina @TheRMSGuy](https://twitter.com/TheRMSGuy) on Twitter. However, if you have a specific question, send an email message to the Information Protection team: askipteam@microsoft.com.

## Where can I find supporting information for Azure RMS—such as legal, compliance, and SLAs?
Azure RMS supports other services and also relies on other services. If you’re looking for information that is related to Azure RMS but not about how to use the Azure RMS service, check the following resources:

**Legal and privacy:**

-   For Microsoft Azure agreement information: [Microsoft Azure Agreement](http://azure.microsoft.com/support/legal/subscription-agreement/)

-   For Microsoft Azure privacy information: [Microsoft Azure Privacy Statement](http://azure.microsoft.com/support/legal/privacy-statement/)

**Security, compliance, and auditing:**

See the [Security, compliance, and regulatory requirements](../understand-explore/azure-rms-problems-it-solves.md#security-compliance-and-regulatory-requirements) section in the [What problems does Azure RMS solve?](../understand-explore/azure-rms-problems-it-solves.md) article. In addition:

-   For external certifications for Azure RMS: [Microsoft Azure Trust Center](http://azure.microsoft.com/support/trust-center/)

-   For FIPS 140 information: [FIPS 140 Validation](https://technet.microsoft.com/library/security/cc750357.aspx)

**Service level agreements:**

-   Service level agreement for Azure RMS, by selected region: [Download from the Product Licensing Search page](http://microsoftvolumelicensing.com/DocumentSearch.aspx?Mode=3&amp;DocumentTypeId=37)

	- For  example, click **OnlineSvcsConsolidatedSLA(WW)(English)(March2016)** to download the March 2016 service level agreement for North America.

-   Service level agreement for Azure Active Directory: [Service Level Agreements](http://azure.microsoft.com/support/legal/sla/)

**Documentation:**

-   Azure Active Directory Documentation site: [Azure Active Directory](http://azure.microsoft.com/documentation/services/active-directory/)

-   Azure Active Directory Library: [Azure Active Directory](http://msdn.microsoft.com/library/azure/jj673460.aspx)

-   Office 365 Library: [Office 365](http://technet.microsoft.com/library/dn127064%28v=office.14%29.aspx)

## I’ve heard a new release is going to be available soon, for Azure RMS—when will it be released?

The technical documentation does not contain information about upcoming releases. For this type of information and for release announcements, check the [Enterprise Mobility and Security Blog](https://blogs.technet.microsoft.com/enterprisemobility/?product=azure-rights-management-services) and get the latest updates from [Dan Plastina @TheRMSGuy](https://twitter.com/TheRMSGuy) on Twitter. If it’s an Office release that you’re interested in, be sure to also check the Office blog.

## What do I do if my question isn’t here?
Use the links and resources listed in [Information and support for Azure Rights Management](information-support.md).

In addition, there are FAQs designed for end-users:

-   [FAQ for Rights Management Sharing Application for Windows](https://technet.microsoft.com/dn467883)

-   [FAQ for Rights Management Sharing Application for Mobile and Mac Platforms](https://technet.microsoft.com/dn451248)

-   [FAQ for Document Tracking](http://go.microsoft.com/fwlink/?LinkId=523977)

This FAQ page will be updated regularly, with new additions listed in the monthly documentation update announcements on the [Enterprise Mobility and Security blog](https://blogs.technet.microsoft.com/enterprisemobility/?product=azure-rights-management-services) blog.


