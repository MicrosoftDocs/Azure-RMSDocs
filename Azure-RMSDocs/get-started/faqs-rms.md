---
# required metadata

title: FAQs for Azure RMS - AIP
description: Some frequently asked questions about the data protection service, Azure Rights Management (Azure RMS), from Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 07/13/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 90df11c5-355c-4ae6-a762-351b05d0fbed

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Frequently asked questions about data protection in Azure Information Protection

>*Applies to: Azure Information Protection, Office 365*

Have a question about the data protection service, Azure Rights Management, from Azure Information Protection? See if it's answered here. 

## Do files have to be in the cloud to be protected by Azure Rights Management?
No, this is a common misconception. The Azure Rights Management service (and Microsoft) does not see or store your data as part of the information protection process. Information that you protect is never sent to or stored in Azure unless you explicitly store it in Azure or use another cloud service that stores it in Azure. 

For more information, see [How does Azure RMS work? Under the hood](../understand-explore/how-does-it-work.md) to understand how a secret cola formula that is created and stored on-premises is protected by the Azure Rights Management service but remains on-premises.

## What’s the difference between Azure Rights Management encryption and encryption in other Microsoft cloud services?

Microsoft provides multiple encryption technologies that enable you to protect your data for different, and often complementary scenarios. For example, while Office 365 offers encryption at-rest for data stored in Office 365, the Azure Rights Management service from Azure Information Protection independently encrypts your data so that it is protected regardless of where it is located or how it is transmitted.

These encryption technologies are complementary and using them requires enabling and configuring them independently. When you do so, you might have the option to bring your own key for the encryption, a scenario also known as "BYOK." Enabling BYOK for one of these technologies does not affect the others. For example, you can use BYOK for Azure Information Protection and not use BYOK for other encryption technologies, and vice versa. The keys used by these different technologies might be the same or different, depending on how you configure the encryption options for each service.

## What’s the difference between BYOK and HYOK and when should I use them?

**Bring your own key** (BYOK) in the context of Azure Information Protection, is when you create your own key on-premises for Azure Rights Management protection. You then transfer that key to a hardware security module (HSM) in Azure Key Vault where you continue to own and manage your key. If you didn't do this, Azure Rights Management protection would use a key that is automatically created and managed for you in Azure. This default configuration is referred to as "Microsoft-managed" rather than "customer-managed" (the BYOK option).

For more information about BYOK and whether you should choose this key topology for your organization, see [Planning and implementing your Azure Information Protection tenant key](../plan-design/plan-implement-tenant-key.md). 

**Hold your own key** (HYOK) in the context of Azure Information Protection, is for a few organizations that have a subset of documents or emails that cannot be protected by a key that is stored in the cloud. For these organizations, this restriction applies even if they created the key and manage it, using BYOK. The restriction can often be because of regulatory or compliance reasons and the HYOK configuration should be applied to "Top Secret" information only, that will never be shared outside the organization, will only be consumed on the internal network, and does not need to be accessed from mobile devices. 

For these exceptions (typically less than 10% of all the content that needs to be protected), organizations can use an on-premises solution, Active Directory Rights Management Services, to create the key that remains on-premises. With this solution, computers get their Azure Information Protection policy from the cloud, but this identified content can be protected by using the on-premises key.

For more information about HYOK and to make sure that you understand its limitations and restrictions, and guidance when to use it, see [Hold your own key (HYOK) requirements and restrictions for AD RMS protection](../deploy-use/configure-adrms-restrictions.md).

## Where can I find information about third-party solutions that integrate with Azure RMS?

Many software vendors already have solutions or are implementing solutions that integrate with Azure Rights Management—and the list is growing rapidly. You might find it useful to check the [RMS-englightened solutions](requirements-applications.md#rms-enlightened-solutions) list and get the latest updates from [Dan Plastina @TheRMSGuy](https://twitter.com/TheRMSGuy) on Twitter. However, if you have a specific question, send an email message to the Information Protection team: askipteam@microsoft.com.

## Is there a management pack or similar monitoring mechanism for the RMS connector?

Although the Rights Management connector logs information, warning, and error messages to the event log, there isn’t a management pack that includes monitoring for these events. However, the list of events and their descriptions, with more information to help you take corrective action is documented in [Monitor the Azure Rights Management connector](../deploy-use/monitor-rms-connector.md).

## Do you need to be a global admin to configure Azure RMS, or can I delegate to other administrators?

Global administrators for an Office 365 tenant or Azure AD tenant can obviously run all administrative tasks for the Azure Rights Management service. However, if you want to assign administrative permissions to other users, you can do so by using the Azure RMS PowerShell cmdlet, [Add-AadrmRoleBasedAdministrator](/powershell/module/aadrm/add-aadrmrolebasedadministrator). You can assign this administrative role by user account, or by group. There are two roles available: **Global Administrator** and **Connector Administrator**. 

As these role names suggest, the first role grants permissions to run all administrative tasks for Azure Rights Management (without making them a global administrator for other cloud services) and the second role grants permissions to run only the Rights Management (RMS) connector.

Some things to note:

- Only global administrators for Office 365 and global administrators for Azure AD can use the management portals (Office 365 admin center or Azure classic portal) to configure Azure RMS. Users that you assign the global administrator role for Azure RMS must use Azure RMS PowerShell commands to configure Azure RMS. To help you find the right cmdlets for specific tasks, see [Administering Azure Rights Management by Using Windows PowerShell](../deploy-use/administer-powershell.md).

- If you have configured [onboarding controls](../deploy-use/activate-service.md#configuring-onboarding-controls-for-a-phased-deployment), this configuration does not affect the ability to administer Azure RMS, except the RMS connector. For example, if you have configured onboarding controls such that the ability to protect content is restricted to the “IT department” group, the account that you use to install and configure the RMS connector must be a member of that group. 

- No administrator for Azure RMS (the tenant's global admin or an Azure RMS global administrator) can automatically remove protection from documents or emails that were protected by Azure RMS. Only users who are assigned super users for Azure RMS can do this, and when the super user feature is enabled. However, the tenant's global administrator and any Azure RMS global administrator can assign users as super users, including their own account. They can also enable the super user feature. These actions are recorded in the Azure RMS administrator log. For more information, see the security best practices section in [Configuring super users for Azure Rights Management and discovery services or data recovery](../deploy-use/configure-super-users.md). 

>[!NOTE]
> Templates and new options for configuring Azure Rights Management protection are moving to the Azure portal, which supports security admins in addition to global admin access. For more information, see the following blog post announcements: [Azure Information Protection unified administration now in Preview](https://blogs.technet.microsoft.com/enterprisemobility/2017/04/26/azure-information-protection-unified-administration-now-in-preview/) and [Azure Information Protection unified administration phase two](https://blogs.technet.microsoft.com/enterprisemobility/2017/05/23/azure-information-protection-unified-administration-phase-two/).

## How do I create a new custom template in the Azure portal?

Currently in preview, custom templates are moving to the Azure portal where you can continue to manage them as templates, or convert them to labels. To create a new template, create a new label and configure the data protection settings for Azure RMS. Under the covers, this creates a new template that can then be accessed by services and applications that integrate with Rights Management templates.

For more information about configuring templates in the Azure portal, see [Configure and manage templates in the Azure Information Protection policy](../deploy-use/configure-policy-templates.md).

## I have a hybrid deployment of Exchange with some users on Exchange Online and others on Exchange Server—is this supported by Azure RMS?
Absolutely, and the nice thing is, users will be able to seamlessly protect and consume protected emails and attachments across the two Exchange deployments. For this configuration, [activate Azure RMS](../deploy-use/activate-service.md) and [enable IRM for Exchange Online](https://technet.microsoft.com/library/dn151475%28v=exchg.150%29.aspx), then [deploy and configure the RMS connector](../deploy-use/deploy-rms-connector.md) for Exchange Server.

## If I use this protection for my production environment, is my company then locked into the solution or risk losing access to content that we protected with Azure RMS?
No, you always remain in control of your data and can continue to access it, even if you decide to no longer use the Azure Rights Management service. For more information, see [Decommissioning and deactivating Azure Rights Management](../deploy-use/decommission-deactivate.md).

However, before you decommission your Azure RMS deployment, we would like to hear from you and understand why you made this decision. If Azure Rights Management protection does not fulfill your business requirements, check with us in case new functionality is planned for the near-future or if there are alternatives. Send an email message to [AskIPTeam@Microsoft.com](mailto:askipteam@microsoft.com?subject=Planning%20to%20decommission%20Azure%20RMS) and we’ll be happy to discuss your technical and business requirements.

## Can I control which of my users can use Azure RMS to protect content?
Yes, the Azure Rights Management service has user onboarding controls for this scenario. For more information, see the [Configuring onboarding controls for a phased deployment](../deploy-use/activate-service.md#configuring-onboarding-controls-for-a-phased-deployment) section in the [Activating Azure Rights Management](../deploy-use/activate-service.md) article.

## Can I prevent users from sharing protected documents with specific organizations?
One of the biggest benefits of using the Azure Rights Management service for data protection is that it supports business-to-business collaboration without you having to configure explicit trusts for each partner organization, because Azure AD takes care of the authentication for you.

There is no administration option to prevent users from securely sharing documents with specific organizations. For example, you want to block an organization that you don’t trust or that has a competing business. Preventing the Azure Rights Management service from sending protected documents to users in these organizations wouldn’t make sense because your users would then share their documents unprotected, which is probably the last thing you want to happen in this scenario. For example, you wouldn’t be able to identify who is sharing company-confidential documents with which users in these organizations, which you can do when the document (or email) is protected by the Azure Rights Management service.

## When I share a protected document with somebody outside my company, how does that user get authenticated?
The Azure Rights Management service always uses an Azure Active Directory account and an associated email address for user authentication, which makes business-to-business collaboration seamless for administrators. If the other organization uses Azure services, users already have accounts in Azure Active Directory, even if these accounts are created and managed on-premises and then synchronized to Azure. If the organization has Office 365, under the covers, this service also uses Azure Active Directory for the user accounts. If the user’s organization doesn’t have managed accounts in Azure, users can sign up for [RMS for individuals](../understand-explore/rms-for-individuals.md), which creates an unmanaged Azure tenant and directory for the organization with an account for the user, so that this user (and subsequent users) can then be authenticated for the Azure Rights Management service.

The authentication method for these accounts can vary, depending on how the administrator in the other organization has configured the Azure Active Directory accounts. For example, they could use passwords that were created for these accounts, multi-factor authentication (MFA), federation, or passwords that were created in Active Directory Domain Services and then synchronized to Azure Active Directory.

## Can I add external users (people from outside my company) to custom templates?
Yes. Creating custom templates that end users (and administrators) can select from applications makes it quick and easily for them to apply information protection, using predefined policies that you specify. One of the settings in the template is who is able to access the content, and you can specify users and groups from within your organization, and users and groups from outside your organization. 

To specify users from outside your organization, add them as contacts to a group that you select in the Azure classic portal when configuring your templates. To specify groups from outside your organization, you must use [Windows PowerShell module for Azure Rights Management](../deploy-use/install-powershell.md), which you can also use to specify individual external users and even all users from another organization:

-   **Use a rights definition object to create or update a template**.    Specify the external email addresses and their rights in a rights definition object, which you then use to create or update a template. You specify the rights definition object by using the [New-AadrmRightsDefinition](/powershell/module/aadrm/new-aadrmrightsdefinition) cmdlet to create a variable and then supply this variable to the  -RightsDefinition parameter with the [Add-AadrmTemplate](/powershell/module/aadrm/add-aadrmtemplate) cmdlet (for a new template) or [Set-AadrmTemplateProperty](/powershell/module/aadrm/set-aadrmtemplateproperty) cmdlet (if you're modifying an existing template). However, if you're adding these users to an existing template, you need to define rights definition objects for the existing groups in the templates and not just the external users.

For more information about custom templates, see [Configuring custom templates for the Azure Rights Management service](../deploy-use/configure-custom-templates.md).

> [!TIP]
> Templates and new options for configuring Azure Rights Management protection are moving to the Azure portal. These new options make it easier to specify external users, so you no longer have to use PowerShell or groups that contain external users. This functionality is currently in preview: [Azure Information Protection unified administration now in Preview](https://blogs.technet.microsoft.com/enterprisemobility/2017/04/26/azure-information-protection-unified-administration-now-in-preview/). 

> For documented instructions, see [To configure a label for Rights Management protection](../deploy-use/configure-policy-protection.md#to-configure-a-label-for-rights-management-protection).

## Does Azure RMS work with dynamic groups in Azure AD?
An Azure AD Premium feature lets you configure dynamic membership for security groups by specifying [attribute-based rules](https://azure.microsoft.com/documentation/articles/active-directory-accessmanagement-groups-with-advanced-rules/). This group type does not support an email address, and so cannot be used with the Azure Rights Management service. However, Office 365 groups support both dynamic group membership and are mail-enabled. Because this group is mail-enabled, you can use it with Azure Rights Management protection.

For more information about the requirements for users and groups that can be used with the Azure Rights Management service, see [Prepare users and groups for Azure Information Protection](../plan-design/prepare.md).

## How do I send a protected email to a Gmail or Hotmail account?

You might have seen references or demos for Azure Information Protection that sends protected emails to Gmail or Hotmail accounts. This feature is still in private preview, so you will not find more information about it in this documentation until it is released as public preview.

## What devices and which file types are supported by Azure RMS?
For a list of devices that support the Azure Rights Management service, see [Client devices that support Azure Rights Management data protection](../get-started/requirements-client-devices.md). Because not all supported devices can currently support all Rights Management capabilities, be sure to also check the table for [RMS-enlighted applications](../get-started/requirements-applications.md#rms-enlightened-applications).

The Azure Rights Management service can support all file types. For text, image, Microsoft Office (Word, Excel, PowerPoint) files, .pdf files, and some other application file types, Azure Rights Management provides native protection that includes both encryption and enforcement of rights (permissions). For all other applications and file types, generic protection provides file encapsulation and authentication to verify if a user is authorized to open the file.

For a list of file name extensions that are natively supported by Azure Rights Management, see [File types supported by the Azure Information Protection client](../rms-client/client-admin-guide-file-types.md). File name extensions not listed are supported by using the Azure Information Protection client that automatically applies generic protection to these files.

## How do I configure a Mac computer to protect and track documents?

First, make sure that you have installed Office for Mac by using the software installation link from https://portal.office.com. For full instructions, see [Download and install or reinstall Office 365 or Office 2016 on a PC or Mac](https://support.office.com/en-us/article/Download-and-install-or-reinstall-Office-365-or-Office-2016-on-a-PC-or-Mac-4414EAAF-0478-48BE-9C42-23ADC4716658).

Open Outlook and create a profile by using your Office 365 work or school account. Then, create a new message and do the following to configure Office so that it can protect documents and emails by using the Azure Rights Management service:

1. In the new message, on the **Options** tab, click **Permissions**, and then click **Verify Credentials**.

2. When prompted, specify your Office 365 work or school account details again, and select **Sign in**. 
    
    This downloads the Azure Rights Management templates and **Verify Credentials** is now replaced with options that include **No Restrictions**, **Do Not Forward**, and any Azure Rights Management templates that are published for your tenant. You can now cancel this new message.

To protect an email message or a document: On the **Options** tab, click **Permissions** and choose an option or template that protects your email or document.

To track a document after you have protected it: From a Windows computer that has the Azure Information Protection client installed, register the document with the document tracking site by using either an Office application or File Explorer. For instructions, see [Track and revoke your documents](../rms-client/client-track-revoke.md). From your Mac computer, you can now use your browser go to the document tracking site (https://track.azurerms.com) to track and revoke this document.

## When I open an RMS-protected Office document, does the associated temporary file become RMS-protected as well?
No. In this scenario, the associated temporary file doesn’t contain data from the original document but instead, only what the user enters while the file is open. Unlike the original file, the temporary file is obviously not designed for sharing and would remain on the device, protected by local security controls, such as BitLocker and EFS.

## We really want to use BYOK with Azure Information Protection but learned that this isn’t compatible with Exchange Online—what’s your advice?
Don’t let this current limitation delay using the Azure Rights Management service of Azure Information Protection. If you have Exchange Online and want to use bring your own key (BYOK), we recommend that you deploy Azure Information Protection in the default key management mode now, where Microsoft generates and manages your key. That way, you get all the benefits of protecting your important files and emails now, with the option to move to BYOK later (for example, when Exchange Online does support BYOK). When you do move to BYOK, your previously protected documents and emails remain accessible by using an archived key.

However, if your company policies require you to use a hardware security module (HSM) and this would otherwise block your Azure Information Protection deployment, another option is to deploy Azure Information Protection with BYOK now, with reduced Rights Management protection functionality for Exchange. For more information, see [BYOK pricing and restrictions](../plan-design/byok-price-restrictions.md) from [Planning and implementing your Azure Rights Management tenant key](../plan-design/plan-implement-tenant-key.md).

## A feature I am looking for doesn’t seem to work with SharePoint protected libraries—is support for my feature planned?
Currently, SharePoint supports Rights Management-protected documents by using IRM protected libraries, which do not support custom templates, document tracking, and some other capabilities. For more information, see the [SharePoint Online and SharePoint Server](../understand-explore/office-apps-services-support.md#sharepoint-online-and-sharepoint-server) section in the [Office applications and services](../understand-explore/office-apps-services-support.md) article.

If you are interested in a specific capability that isn't yet supported, be sure to keep an eye on announcements on the [Enterprise Mobility and Security Blog](https://blogs.technet.microsoft.com/enterprisemobility/?product=azure-rights-management-services).

## How do I configure One Drive for Business in SharePoint Online, so that users can safely share their files with people inside and outside the company?
By default, as an Office 365 administrator, you don’t configure this; users do.

Just as a SharePoint site administrator enables and configures IRM for a SharePoint library that they own, OneDrive for Business is designed for users to enable and configure IRM for their own OneDrive for Business library. However, by using PowerShell, you can do this for them. For instructions, see the [SharePoint Online and OneDrive for Business: IRM Configuration](../deploy-use/configure-office365.md#sharepoint-online-and-onedrive-for-business-irm-configuration) section in the [Office 365: Configuration for clients and online services](../deploy-use/configure-office365.md) article.

## Do you have any tips or tricks for a successful deployment?
After overseeing many deployments and listening to our customers, partners, consultants, and support engineers – one of the biggest tips we can pass on from experience: **Design and deploy simple policies**.

Because Azure Information Protection supports sharing securely with anyone, you can afford to be ambitious with your data protection reach. But be conservative with your rights policies. For many organizations, the biggest business impact comes from preventing data leakage by applying the default rights policy template that restricts access to people in your organization. Of course, you can get much more granular than that if you need to – prevent people from printing, editing etc. But keep the more granular restrictions as the exception for documents that really need high-level security, and don’t implement these more restrictive policies on day one, but plan for a more phased approach.

## How do we regain access to files that were protected by an employee who has now left the organization?
Use the [super user feature](../deploy-use/configure-super-users.md), which lets authorized users have full usage rights for all use licenses that were granted by your organization’s tenant. This same feature lets authorized services index and inspect files, as needed.

## When I test revocation in the document tracking site, I see a message that says people can still access the document for up to 30 days—is this time period configurable?

Yes. This message reflects the use license for that specific file. A use license is a per-document certificate that is granted to a user who opens a protected file or email message. This certificate contains that user's rights for the file or email message and the encryption key that was used to encrypt the content, as well as additional access restrictions defined in the document's policy. When the validity period of the use license is expired and a user tries to open the file or email message, their user credentials must be resubmitted to the Azure Rights Management service. 

If you revoke a file, that action can be enforced only when the user authenticates to the Azure Rights Management service. So if a file has a use license validity period of 30 days and the user has already opened the document, that user continues to have access to the document for the duration of the use license. When the use license expires, the user must reauthenticate, at which point the user is denied access because the document is now revoked.

The user who protected the document, the [Rights Management issuer](../deploy-use/configure-usage-rights.md#rights-management-issuer-and-rights-management-owner) is exempt from this revocation and is always able to access their documents. 

The default value for the use license validity period for a tenant is 30 days and you can configure this value by using the PowerShell cmdlet, **Set-AadrmMaxUseLicenseValidityTime**. This setting can be overridden by a more restrictive setting in a custom template. 

For more information and examples of how the use license works, see the detailed description for [Set-AadrmMaxUseLicenseValidityTime](/powershell/module/aadrm/set-aadrmmaxuselicensevaliditytime).

## Can Rights Management prevent screen captures?
By not granting the **Copy** [usage right](../deploy-use/configure-usage-rights.md), Rights Management can prevent screen captures from many of the commonly used screen capture tools on Windows platforms (Windows 7, Windows 8.1, Windows 10, Windows Phone) and Android. However, iOS and Mac devices do not allow any app to prevent screen captures, and browsers (for example, when used with Outlook Web App and Office Online) also cannot prevent screen captures.

Preventing screen captures can help to avoid accidental or negligent disclosure of confidential or sensitive information. But there are many ways that a user can share data that is displayed on a screen, and taking a screen shot is only one method. For example, a user intent on sharing displayed information can take a picture of it using their camera phone, retype the data, or simply verbally relay it to somebody.

As these examples demonstrate, even if all platforms and all software supported the Rights Management APIs to block screen captures, technology alone cannot always prevent users from sharing data that they should not. Rights Management can help to safeguard your important data by using authorization and usage policies, but this enterprise rights management solution should be used with other controls. For example, implement physical security, carefully screen and monitor people who have authorized access to your organization's data, and invest in user education so users understand what data should not be shared.

## What's the difference between a user protecting an email with Do Not Forward and a template that doesn't include the Forward right?

Despite its name and appearance, **Do Not Forward** is not the opposite of the Forward right, or a template. It is actually a set of rights that include restricting copying, printing, and saving attachments, in addition to restricting the forwarding of emails. The rights are dynamically applied to users via the chosen recipients, and not statically assigned by the administrator. For more information, see the [Do Not Forward option for emails](../deploy-use/configure-usage-rights.md#do-not-forward-option-for-emails) section in [Configuring usage rights for Azure Rights Management](../deploy-use/configure-usage-rights.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]


