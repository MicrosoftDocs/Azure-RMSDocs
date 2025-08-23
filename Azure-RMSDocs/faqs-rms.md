---
# required metadata

title: FAQs for Azure RMS - AIP
description: Some frequently asked questions about the data protection service, Azure Rights Management (Azure RMS), from Azure Information Protection.
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 11/11/2021
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 90df11c5-355c-4ae6-a762-351b05d0fbed

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Frequently asked questions about data protection in Azure Information Protection


Have a question about the data protection service, Azure Rights Management, from Azure Information Protection? See if it's answered here.

## Do files have to be in the cloud to be protected by Azure Rights Management?

No, this is a common misconception. The Azure Rights Management service (and Microsoft) does not see or store your data as part of the information protection process. Information that you protect is never sent to or stored in Azure unless you explicitly store it in Azure or use another cloud service that stores it in Azure.

For more information, see [How does Azure RMS work? Under the hood](./how-does-it-work.md) to understand how a secret cola formula that is created and stored on-premises is protected by the Azure Rights Management service but remains on-premises.

## What's the difference between Azure Rights Management encryption and encryption in other Microsoft cloud services?

Microsoft provides multiple encryption technologies that enable you to protect your data for different, and often complementary scenarios. For example, while Microsoft 365 offers encryption at-rest for data stored in Microsoft 365, the Azure Rights Management service from Azure Information Protection independently encrypts your data so that it is protected regardless of where it is located or how it is transmitted.

These encryption technologies are complementary and using them requires enabling and configuring them independently. When you do so, you might have the option to bring your own key for the encryption, a scenario also known as "BYOK." Enabling BYOK for one of these technologies does not affect the others. For example, you can use BYOK for Azure Information Protection and not use BYOK for other encryption technologies, and vice versa. The keys used by these different technologies might be the same or different, depending on how you configure the encryption options for each service.

## Can I now use BYOK with Exchange Online?

Yes, you can now use BYOK with Exchange Online when you follow the instructions in [Set up new Microsoft 365 Message Encryption capabilities built on top of Azure Information Protection](https://support.office.com/article/7ff0c040-b25c-4378-9904-b1b50210d00e). These instructions enable the new capabilities in Exchange Online that support using BYOK for Azure Information Protection, as well as the new Office 365 Message Encryption.

For more information about this change, see the blog announcement: [Office 365 Message Encryption with the new capabilities](https://techcommunity.microsoft.com/t5/Security-Privacy-and-Compliance/Email-Encryption-and-Rights-Protection/ba-p/110801)

## Is there a management pack or similar monitoring mechanism for the RMS connector?

Although the Rights Management connector logs information, warning, and error messages to the event log, there isn't a management pack that includes monitoring for these events. However, the list of events and their descriptions, with more information to help you take corrective action is documented in [Monitor the Microsoft Rights Management connector](monitor-rms-connector.md).

## How do I create a new custom template in the Azure portal?

Custom templates have moved to the Azure portal where you can continue to manage them as templates, or convert them to labels. To create a new template, create a new label and configure the data protection settings for Azure RMS. Under the covers, this creates a new template that can then be accessed by services and applications that integrate with Rights Management templates.

For more information about templates in the Azure portal, see [Configuring and managing templates for Azure Information Protection](/previous-versions/azure/information-protection/configure-policy-templates).

## I've protected a document and now want to change the usage rights or add users—do I need to reprotect the document?

If the document was protected by using a label or template, there's no need to reprotect the document. Modify the label or template by making your changes to the usage rights or add new groups (or users), and then save these changes:

- When a user hasn't accessed the document before you made the changes, the changes take effect as soon as the user opens the document.

- When a user has already accessed the document, these changes take effect when their [use license](configure-usage-rights.md#rights-management-use-license) expires. Reprotect the document only if you cannot wait for the use license to expire. Reprotecting effectively creates a new version of the document, and therefore a new use license for the user.

Alternatively, if you have already configured a group for the required permissions, you can change the group membership to include or exclude users and there is no need to change the label or template. There might be a small delay before the changes take effect because group membership is [cached](prepare.md#group-membership-caching-by-azure-information-protection) by the Azure Rights Management service.

If the document was protected by using custom permissions, you cannot change the permissions for the existing document. You must protect the document again and specify all the users and all the usage rights that are required for this new version of the document. To reprotect a protected document, you must have the Full Control usage right.

Tip: To check whether a document was protected by a template or by using custom permission, use the [Get-AIPFile​Status](/powershell/module/azureinformationprotection/get-aipfilestatus) PowerShell cmdlet. You always see a template description of **Restricted Access** for custom permissions, with a unique template ID that is not displayed when you run [Get-RMSTemplate](/powershell/module/azureinformationprotection/get-rmstemplate).

## I have a hybrid deployment of Exchange with some users on Exchange Online and others on Exchange Server—is this supported by Azure RMS?
Absolutely, and the nice thing is, users are able to seamlessly protect and consume protected emails and attachments across the two Exchange deployments. For this configuration, [activate Azure RMS](/purview/activate-rights-management-service) and [enable IRM for Exchange Online](/microsoft-365/enterprise/activate-rms-in-microsoft-365), then [deploy and configure the RMS connector](deploy-rms-connector.md) for Exchange Server.

## If I use this protection for my production environment, is my company then locked into the solution or risk losing access to content that we protected with Azure RMS?
No, you always remain in control of your data and can continue to access it, even if you decide to no longer use the Azure Rights Management service. For more information, see [Decommission and deactivate the Azure Rights Management service](/purview/decommission-deactivate).

## Can I control which of my users can use Azure RMS to protect content?
Yes, the Azure Rights Management service has user onboarding controls for this scenario. For more information, see the [Configuring onboarding controls for a phased deployment](/purview/activate-rights-management-service#configuring-onboarding-controls-for-a-phased-deployment) section in the [Activate the Azure Rights Management service](/purview/activate-rights-management-service) article.

## Can I prevent users from sharing protected documents with specific organizations?
One of the biggest benefits of using the Azure Rights Management service for data protection is that it supports business-to-business collaboration without you having to configure explicit trusts for each partner organization, because Microsoft Entra ID takes care of the authentication for you.

There is no administration option to prevent users from securely sharing documents with specific organizations. For example, you want to block an organization that you don't trust or that has a competing business. Preventing the Azure Rights Management service from sending protected documents to users in these organizations wouldn't make sense because your users would then share their documents unprotected, which is probably the last thing you want to happen in this scenario. For example, you wouldn't be able to identify who is sharing company-confidential documents with which users in these organizations, which you can do when the document (or email) is protected by the Azure Rights Management service.

## When I share a protected document with somebody outside my company, how does that user get authenticated?

By default, the Azure Rights Management service uses a Microsoft Entra account and an associated email address for user authentication, which makes business-to-business collaboration seamless for administrators. If the other organization uses Azure services, users already have accounts in Microsoft Entra ID, even if these accounts are created and managed on-premises and then synchronized to Azure. If the organization has Microsoft 365, under the covers, this service also uses Microsoft Entra ID for the user accounts. If the user's organization doesn't have managed accounts in Azure, users can sign up for [RMS for individuals](./rms-for-individuals.md), which creates an unmanaged Azure tenant and directory for the organization with an account for the user, so that this user (and subsequent users) can then be authenticated for the Azure Rights Management service.

The authentication method for these accounts can vary, depending on how the administrator in the other organization has configured the Microsoft Entra accounts. For example, they could use passwords that were created for these accounts, federation, or passwords that were created in Active Directory Domain Services and then synchronized to Microsoft Entra ID.

Other authentication methods:

- If you protect an email with an Office document attachment to a user who doesn't have an account in Microsoft Entra ID, the authentication method changes. The Azure Rights Management service is federated with some popular social identity providers, such as Gmail. If the user's email provider is supported, the user can sign in to that service and their email provider is responsible for authenticating them. If the user's email provider is not supported, or as a preference, the user can apply for a one-time passcode that authenticates them and displays the email with the protected document in a web browser.

- Azure Information Protection can use Microsoft accounts for supported applications. Currently, not all applications can open protected content when a Microsoft account is used for authentication. [More information](/previous-versions/azure/information-protection/secure-collaboration-documents#supported-scenarios-for-opening-protected-documents)

## Can I add external users (people from outside my company) to custom templates?

Yes. The [protection settings](/previous-versions/azure/information-protection/configure-policy-protection) that you can configure in the Azure portal let you add permissions to users and groups from outside your organization, and even all users in another organization. You might find it useful to reference the step-by-step example, [Secure document collaboration by using Azure Information Protection](/previous-versions/azure/information-protection/secure-collaboration-documents). 

Note that if you have Azure Information Protection labels, you must first convert your custom template to a label before you can configure these protection settings in the Azure portal. For more information, see [Configuring and managing templates for Azure Information Protection](/previous-versions/azure/information-protection/configure-policy-templates).

Alternatively, you can add external users to custom templates (and labels) by using PowerShell. This configuration requires you to use a rights definition object that you use to update your template:

1. Specify the external email addresses and their rights in a rights definition object, by using the [New-AipServiceRightsDefinition](/powershell/module/aipservice/new-aipservicerightsdefinition) cmdlet to create a variable.

2. Supply this variable to the RightsDefinition parameter with the [Set-AipServiceTemplateProperty](/powershell/module/aipservice/set-aipservicetemplateproperty) cmdlet.

    When you add users to an existing template, you must define rights definition objects for the existing users in the templates, in addition to the new users. For this scenario, you might find helpful **Example 3: Add new users and rights to a custom template** from the [Examples](/powershell/module/aipservice/set-aipservicetemplateproperty#examples) section for the cmdlet.

## What type of groups can I use with Azure RMS?
For most scenarios, you can use any group type in Microsoft Entra ID that has an email address. This rule of thumb always applies when you assign usage rights but there are some exceptions for administering the Azure Rights Management service. For more information, see [Azure Information Protection requirements for group accounts](prepare.md#azure-information-protection-requirements-for-group-accounts).

## How do I send a protected email to a Gmail or Hotmail account?

When you use Exchange Online and the Azure Rights Management service, you just send the email to the user as a protected message. For example, you can select the new **Protect** button in the command bar in Outlook on the Web, use the Outlook **Do Not Forward** button or menu option. Or, you can select an Azure Information Protection label that automatically applies Do Not Forward for you, and classifies the email.

The recipient sees an option to sign in to their Gmail, Yahoo, or Microsoft account, and then they can read the protected email. Alternatively, they can choose the option for a one-time passcode to read the email in a browser.

To support this scenario, Exchange Online must be enabled for the Azure Rights Management service and the new capabilities in Office 365 Message Encryption. For more information about this configuration, see [Exchange Online: IRM Configuration](configure-office365.md#exchangeonline-irm-configuration).

For more information about the new capabilities that include supporting all email accounts on all devices, see the following blog post: [Announcing new capabilities available in Office 365 Message Encryption](https://techcommunity.microsoft.com/t5/Security-Privacy-and-Compliance/Email-Encryption-and-Rights-Protection/ba-p/110801).

## What devices and which file types are supported by Azure RMS?

The Azure Rights Management service can support all file types. For text, image, Microsoft Office (Word, Excel, PowerPoint) files, .pdf files, and some other application file types, Azure Rights Management provides native protection that includes both encryption and enforcement of rights (permissions). For all other applications and file types, generic protection provides file encapsulation and authentication to verify if a user is authorized to open the file.

For a list of file name extensions that are natively supported by Azure Rights Management, see [File types supported by the Azure Information Protection client](./rms-client/clientv2-admin-guide-file-types.md). File name extensions not listed are supported by using the Azure Information Protection client that automatically applies generic protection to these files.

## When I open an RMS-protected Office document, does the associated temporary file become RMS-protected as well?
No. In this scenario, the associated temporary file doesn't contain data from the original document but instead, only what the user enters while the file is open. Unlike the original file, the temporary file is obviously not designed for sharing and would remain on the device, protected by local security controls, such as BitLocker and EFS.

## A feature I am looking for doesn't seem to work with SharePoint protected libraries—is support for my feature planned?
Currently, Microsoft SharePoint supports RMS-protected documents by using IRM protected libraries, which do not support Rights Management templates, document tracking, and some other capabilities. For more information, see the [SharePoint in Microsoft 365 and SharePoint Server](./office-apps-services-support.md#sharepoint-in-microsoft-365-and-sharepoint-server) section in the [Office applications and services](./office-apps-services-support.md) article.

If you are interested in a specific capability that isn't yet supported, be sure to keep an eye on announcements on the [Enterprise Mobility and Security Blog](https://cloudblogs.microsoft.com/enterprisemobility/?product=azure-rights-management-services).

## How do I configure One Drive in SharePoint, so that users can safely share their files with people inside and outside the company?
By default, as a Microsoft 365 administrator, you don't configure this; users do.

Just as a SharePoint site administrator enables and configures IRM for a SharePoint library that they own, OneDrive is designed for users to enable and configure IRM for their own OneDrive library. However, by using PowerShell, you can do this for them. For instructions, see [SharePoint in Microsoft 365 and OneDrive: IRM Configuration](configure-office365.md#sharepoint-in-microsoft-365-and-onedrive-irm-configuration).

## Do you have any tips or tricks for a successful deployment?

After overseeing many deployments and listening to our customers, partners, consultants, and support engineers – one of the biggest tips we can pass on from experience: **Design and deploy simple policies**.

Because Azure Information Protection supports sharing securely with anyone, you can afford to be ambitious with your data protection reach. But be conservative when you configure rights usage restrictions. For many organizations, the biggest business impact comes from preventing data leakage by restricting access to people in your organization. Of course, you can get much more granular than that if you need to – prevent people from printing, editing etc. But keep the more granular restrictions as the exception for documents that really need high-level security, and don't implement these more restrictive usage rights on day one, but plan for a more phased approach.

## How do we regain access to files that were protected by an employee who has now left the organization?
Use the [super user feature](/purview/encryption-super-users), which grants the Full Control usage rights to authorized users for all documents and emails that are protected by your tenant. Super users can always read this protected content, and if necessary, remove the protection or reprotect it for different users. This same feature lets authorized services index and inspect files, as needed.

If your content is stored in SharePoint or OneDrive, admins can run the [Unlock-SensitivityLabelEncryptedFile](/powershell/module/sharepoint-online/unlock-sposensitivitylabelencryptedfile) cmdlet, to remove both the sensitivity label and the encryption. For more information, see the [Microsoft 365 documentation](/microsoft-365/compliance/sensitivity-labels-sharepoint-onedrive-files#remove-encryption-for-a-labeled-document).

## Can Rights Management prevent screen captures?
By not granting the **Copy** [usage right](configure-usage-rights.md), Rights Management can prevent screen captures from many of the commonly used screen capture tools on Windows platforms (Windows 7, Windows 8.1, Windows 10, Windows 10 Mobile, and Windows 11). However, iOS, Mac,and Android devices do not allow any app to prevent screen captures. In addition, browsers on any device cannot prevent screen captures. Browser use includes Outlook on the web and Office for the web.

> [!NOTE]
> Now rolling out to [Current Channel (Preview)](https://office.com/insider): in Office for Mac, Word, Excel, and PowerPoint (but not Outlook) now support the Rights Management usage right to prevent screen captures.

Preventing screen captures can help to avoid accidental or negligent disclosure of confidential or sensitive information. But there are many ways that a user can share data that is displayed on a screen, and taking a screenshot is only one method. For example, a user intent on sharing displayed information can take a picture of it using their camera phone, retype the data, or simply verbally relay it to somebody.

As these examples demonstrate, even if all platforms and all software supported the Rights Management APIs to block screen captures, technology alone cannot always prevent users from sharing data that they should not. Rights Management can help to safeguard your important data by using authorization and usage policies, but this enterprise rights management solution should be used with other controls. For example, implement physical security, carefully screen and monitor people who have authorized access to your organization's data, and invest in user education so users understand what data should not be shared.

## What's the difference between a user protecting an email with Do Not Forward and a template that doesn't include the Forward right?

Despite its name and appearance, **Do Not Forward** is not the opposite of the Forward right, or a template. It is actually a set of rights that include restricting copying, printing, and saving the email outside the mailbox, in addition to restricting the forwarding of emails. The rights are dynamically applied to users via the chosen recipients, and not statically assigned by the administrator. For more information, see the [Do Not Forward option for emails](configure-usage-rights.md#do-not-forward-option-for-emails) section in [Configuring usage rights for Azure Information Protection](configure-usage-rights.md).

## What's the difference between Windows Server FCI and the Azure Information Protection scanner?

Windows Server File Classification Infrastructure has historically been an option to classify documents and then protect them by using the [Rights Management connector](deploy-rms-connector.md) (Office documents only) or a [PowerShell script](./rms-client/configure-fci.md) (all file types). 

We now recommend you use the [Azure Information Protection scanner](/microsoft-365/compliance/deploy-scanner). The scanner uses the Azure Information Protection client and your Azure Information Protection policy to label documents (all file types) so that these documents are then classified and optionally, protected.

The main differences between these two solutions:

|  |Windows Server FCI  |Azure Information Protection scanner  |
|---------|---------|---------|
|**Supported data stores**    | Local folders on Windows Server        | - Windows file shares and network-attached storage<br /><br />- SharePoint Server 2016 and SharePoint Server 2013. SharePoint Server 2010 is also supported for customers who have [extended support for this version of SharePoint](https://support.microsoft.com/lifecycle/search?alpha=SharePoint%20Server%202010).        |
|**Operational mode**     |Real time         |Systematically crawls the data stores once or repeatedly         |
|**Supported file types**     | - All file types are protected by default <br /><br />- Specific file types can be excluded from protection by editing the registry|Support for file types: <br /><br />- Office file types and PDF documents are protected by default <br /><br />- Additional file types can be included for protection by editing the registry|
