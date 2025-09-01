---
# required metadata

title: FAQs for the Azure Rights Management service
description: Some frequently asked questions about the Azure Rights Management encryption service from Microsoft Purview Information Information Protection.
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 09/01/2025
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 90df11c5-355c-4ae6-a762-351b05d0fbed

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer:
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Frequently asked questions about the Azure Rights Management service

Have a question about the Azure Rights Management encryption service from Microsoft Purview Information Protection? See if it's answered here.

## Do files have to be in the cloud to be encrypted by the Azure Rights Management service?

No, this is a common misconception. The Azure Rights Management service (and Microsoft) doesn't see or store your data as part of the encryption process. Information that you encrypt is never sent to or stored in Azure unless you explicitly store it in Azure or use another cloud service that stores it in Azure.

For more information, see [How the Azure Rights Management service works: Technical details](/purview/rights-management-how-does-it-work) to understand how a secret formula that's created and stored on-premises is encrypted by the Azure Rights Management service but remains on-premises.

## What's the difference between Azure Rights Management encryption and encryption in other Microsoft cloud services?

Microsoft provides multiple encryption technologies that enable you to protect your data for different, and often complementary scenarios. For example, while Microsoft 365 offers encryption at-rest for data stored in Microsoft 365, the Azure Rights Management service from Microsoft Purview Information Protection independently encrypts your data so that it's protected regardless of where it's located or how it's transmitted.

These encryption technologies are complementary and using them requires enabling and configuring them independently. When you do so, you might have the option to bring your own key for the encryption, a scenario also known as "BYOK." Enabling BYOK for one of these technologies doesn't affect the others. For example, you can use BYOK for the Azure Rights Management service and not use BYOK for other encryption technologies, and vice versa. The keys used by these different technologies might be the same or different, depending on how you configure the encryption options for each service.

## I see Microsoft Rights Management Services is listed as an available cloud app for conditional access—how does this work?

Yes, you can configure Microsoft Entra Conditional Access for the Azure Rights Management service.

When a user opens a document that is encrypted by the Azure Rights Management service, administrators can block or grant access to users in their tenant, based on the standard conditional access controls. Requiring multifactor authentication (MFA) is one of the most commonly requested conditions. Another one is that devices must be [compliant with your Intune policies](/mem/intune/protect/conditional-access-intune-common-ways-use) so that, for example, mobile devices meet your password requirements and a minimum operating system version, and computers must be domain-joined.

For more information, see [Conditional Access policies and encrypted documents](/purview/encryption-azure-ad-configuration).

Additional information:

|Topic  |Details  |
|---------|---------|
|**Evaluation frequency**| For Windows computers, the conditional access policies for the Azure Rights Management service are evaluated when the [user environment is initialized](/purview/rights-management-how-does-it-work#initializing-the-user-environment) (this process is also known as bootstrapping), and then every 30 days.<br /><br />To fine-tune how often your conditional access policies get evaluated, [configure the token lifetime](/azure/active-directory/active-directory-configurable-token-lifetimes).       |
|**Administrator accounts** |We recommend that you don't add administrator accounts to your conditional access policies because these accounts won't be able to access the Azure Rights Management service when you configure encryption settings for sensitivity labels in the Microsoft Purview portal.         |
|**MFA and B2B collaboration**     |If you use MFA in your conditional access policies for collaborating with other organizations (B2B), you must use [Microsoft Entra B2B collaboration](/azure/active-directory/b2b/what-is-b2b) and create guest accounts for the users you want to share with in the other organization.        |
|**Terms of Use prompts**     |You can [prompt users to accept a terms of use](https://techcommunity.microsoft.com/t5/Azure-Active-Directory-Identity/Updates-to-Azure-AD-Terms-of-Use-functionality-within/ba-p/294822) before they open an encrypted document for the first time.       |
|**Cloud apps**     |If you use many cloud apps for conditional access, you might not see **Microsoft Information Protection Sync Service** and **Microsoft Rights Management Service** displayed in the list to select. <br /><br />In this case, use the search box at the top of the list. Start typing "Microsoft Information Protection Sync Service" and "Microsoft Rights Management Service" to filter the available apps. Providing you have a supported subscription; you'll then see these options and will be able to select them. |

## I've protected a document and now want to change the usage rights or add users—do I need to reprotect the document?

If the document was encrypted by using a sensitivity label or rights management template, there's no need to reprotect the document. Modify the sensitivity label or rights management template by making your changes to the usage rights or add new groups (or users), and then save these changes:

- When a user hasn't accessed the document before you made the changes, the changes take effect as soon as the user opens the document.

- When a user has already accessed the document, these changes take effect when their [use license](/purview/rights-management-usage-rights#rights-management-use-license) expires. Reprotect the document only if you can't wait for the use license to expire. Reprotecting effectively creates a new version of the document, and therefore a new use license for the user.

Alternatively, if you have already configured a group for the required permissions, you can change the group membership to include or exclude users and there isn't a need to change the sensitivity label or rights management template. There might be a small delay before the changes take effect because group membership is [cached](/purview/rights-management-users-groups#group-membership-caching) by the Azure Rights Management service.

If the document was encrypted by using user-defined permissions, such as the [Let users assign permissions](/purview/encryption-sensitivity-labels#let-users-assign-permissions) encryption setting for sensitivity labels, you can't change the permissions for the existing document. You must encrypt the document again and specify all the users and all the usage rights that are required for this new version of the document. To re-encrypt an encrypted document, you must have the Full Control usage right.

## I have a hybrid deployment of Exchange with some users on Exchange Online and others on Exchange Server—is this supported by the Azure Rights Management service?
Yes, this scenario is supported. The nice thing is, users are able to seamlessly encrypt and consume encrypted emails and attachments across the two Exchange deployments. For this configuration, [activate the Azure Rights Management service](/purview/activate-rights-management-service) and [enable IRM for Exchange Online](/microsoft-365/enterprise/activate-rms-in-microsoft-365), then [deploy and configure the RMS connector](deploy-rms-connector.md) for Exchange Server.

## If I use this encryption solution for my production environment, is my company then locked into the solution?
No, you always remain in control of your data and can continue to access it, even if you decide to no longer use the Azure Rights Management service. For more information, see [Decommission and deactivate the Azure Rights Management service](/purview/deactivate-rights-management-service).

## Can I control which of my users can use the Azure Rights Management service to encrypt content?
Yes, when you use [sensitivity labels to encrypt content](/purview/encryption-sensitivity-labels), label publishing policies define which users see the labels in their apps. If you don't want some users to encrypt content, create a separate label publishing policy for them and in the policy, include only labels that don't apply encryption. For more information, see [Create and configure sensitivity labels and their policies](/purview/create-sensitivity-labels).

## When I share an encrypted document with somebody outside my company, how does that user get authenticated?

By default, the Azure Rights Management service uses a Microsoft Entra account and an associated email address for user authentication, which makes business-to-business collaboration seamless for administrators. If the other organization uses Azure services, users already have accounts in Microsoft Entra ID, even if these accounts are created and managed on-premises and then synchronized to Azure. If the organization has Microsoft 365, this service also uses Microsoft Entra ID for the user accounts. If the user's organization doesn't have managed accounts in Azure, users can sign up for [RMS for individuals](./rms-for-individuals.md), which creates an unmanaged Azure tenant and directory for the organization with an account for the user, so that this user (and subsequent users) can then be authenticated for the Azure Rights Management service.

The authentication method for these accounts can vary, depending on how the administrator in the other organization has configured the Microsoft Entra accounts. For example, they could use passwords that were created for these accounts, federation, or passwords that were created in Active Directory Domain Services and then synchronized to Microsoft Entra ID.

Other authentication methods:

- If you encrypt an email with an Office document attachment to a user who doesn't have an account in Microsoft Entra ID, the authentication method changes. The Azure Rights Management service is federated with some popular social identity providers, such as Gmail. If the user's email provider is supported, the user can sign in to that service and their email provider is responsible for authenticating them. If the user's email provider isn't supported, or as a preference, the user can apply for a one-time passcode that authenticates them and displays the email with the encrypted document in a web browser.

- The Azure Rights Management service can use Microsoft accounts for supported applications. However, not all applications can open encrypted content when a Microsoft account is used for authentication. [More information](/previous-versions/azure/information-protection/secure-collaboration-documents#supported-scenarios-for-opening-protected-documents)

## What type of groups can I use with the Azure Rights Management service?
For most scenarios, you can use any group type in Microsoft Entra ID that has an email address. This rule of thumb always applies when you assign usage rights but there are some exceptions for administering the Azure Rights Management service. For more information, see [Azure Rights Management service requirements for group accounts](/purview/rights-management-users-groups#azure-rights-management-service-requirements-for-group-accounts).

## How do I send an encrypted email to a Gmail or Hotmail account?

When you use Exchange Online and the Azure Rights Management service, you just send the email to the user as an encrypted message. For example, you can select a sensitivity label that automatically applies Do Not Forward for you.

The recipient sees an option to sign in to their Gmail, Yahoo, or Microsoft account, and then they can read the encrypted email. Alternatively, they can choose the option for a one-time passcode to read the email in a browser.

To support this scenario, Exchange Online must be enabled for the Azure Rights Management service and Microsoft Purview Message Encryption.

For more information about the capabilities that include supporting all email accounts on all devices, see the following blog post: [Announcing new capabilities available in Office 365 Message Encryption](https://techcommunity.microsoft.com/t5/Security-Privacy-and-Compliance/Email-Encryption-and-Rights-Protection/ba-p/110801).

## Which file types are supported by the Azure Rights Management service?

The Azure Rights Management service can support all file types. For text, image, Microsoft Office (Word, Excel, PowerPoint) files, PDF files, and some other application file types, the Azure Rights Management service supports native encryption that includes the enforcement of usage rights (permissions). For all other applications and file types, generic encryption provides file encapsulation and authentication to verify if a user is authorized to open the file.

For a list of file types supported for Office apps and services, see [Office file types supported](/purview/sensitivity-labels-office-apps#office-file-types-supported) from the sensitivity labeling documentation.

For a list of additional file types that are supported by the Microsoft Purview Information Protection client, see [Supported file types](/purview/information-protection-client#supported-file-types) from the information protection client documentation.

## When I open an Office document that's encrypted by the Azure Rights Management service, does the associated temporary file become encrypted by this service as well?
No. In this scenario, the associated temporary file doesn't contain data from the original document but instead, only what the user enters while the file is open. Unlike the original file, the temporary file is obviously not designed for sharing and would remain on the device, protected by local security controls, such as BitLocker and EFS.

## How do we regain access to files that were encrypted by an employee who has now left the organization?
Use the [super user feature](/purview/encryption-super-users), which grants the Full Control usage rights to authorized users for all items that are encrypted by your tenant. Super users can always read this encrypted content, and if necessary, remove the encryption or re-encrypt the item for different users. This same feature lets authorized services index and inspect items, as needed.

If your content is stored in SharePoint or OneDrive, admins can run the [Unlock-SensitivityLabelEncryptedFile](/powershell/module/sharepoint-online/unlock-sposensitivitylabelencryptedfile) cmdlet, to remove both the sensitivity label and the encryption. For more information, see [Remove encryption for a labeled document](/microsoft-365/compliance/sensitivity-labels-sharepoint-onedrive-files#remove-encryption-for-a-labeled-document).

## Can Rights Management prevent screen captures?
By not granting the **Copy** [usage right](/purview/rights-management-usage-rights), Rights Management can prevent screen captures from many of the commonly used screen capture tools on Windows platforms. Screen captures can similarly be prevented in Office for Mac, for Word, Excel, and PowerPoint (but not Outlook).

However, iOS and Android devices don't allow any app to prevent screen captures. In addition, browsers other than Edge can't prevent screen captures. Browser use includes Outlook on the web and Office for the web.

Preventing screen captures can help to avoid accidental or negligent disclosure of confidential or sensitive information. But there are many ways that a user can share data that is displayed on a screen, and taking a screenshot is only one method. For example, a user intent on sharing displayed information can take a picture of it using their camera phone, retype the data, or simply verbally relay it to somebody.

As these examples demonstrate, even if all platforms and all software supported the Rights Management APIs to block screen captures, technology alone can't always prevent users from sharing data that they should not. Rights Management can help to safeguard your important data by using authorization and usage policies, but this enterprise rights management solution should be used with other controls. For example, implement physical security, carefully screen and monitor people who have authorized access to your organization's data, and invest in user education so users understand what data shouldn't be shared.

## What's the difference between a user encrypting an email with Do Not Forward and usage rights that don't include the Forward right?

Despite its name, **Do Not Forward** isn't the opposite of the Forward usage right, or a template. It'sactually a set of rights that include restricting copying, printing, and saving the email outside the mailbox, in addition to restricting the forwarding of emails. The rights are dynamically applied to users via the chosen recipients, and not statically assigned by the administrator. For more information, see the [Do Not Forward option for emails](/purview/rights-management-usage-rights#do-not-forward-option-for-emails) section in [Configure usage rights for the Azure Rights Management service](/purview/rights-management-usage-rights).
