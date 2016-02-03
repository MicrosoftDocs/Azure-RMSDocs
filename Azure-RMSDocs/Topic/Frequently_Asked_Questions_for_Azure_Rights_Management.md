---
title: Frequently Asked Questions for Azure Rights Management
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 71ce491f-41c1-4d15-9646-455a6eaa157d
author: Cabailey
---
# Frequently Asked Questions for Azure Rights Management
Some frequently asked questions for Microsoft [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)], also known as Azure RMS:

## What do I need to deploy Azure RMS and how do I get going?
First, check [Requirements for Azure Rights Management](../Topic/Requirements_for_Azure_Rights_Management.md), which has information about the cloud subscription options, how you can use your on-premises servers with Azure RMS, which deployment scenarios are not currently supported, which devices and applications support Azure RMS, and a link if you need a list of IP addresses and domain names for firewalls or proxy servers. You might also want to check the other topics in the [Getting Started with Azure Rights Management](../Topic/Getting_Started_with_Azure_Rights_Management.md) section, to get a basic understanding of how [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] can help protect your organization’s data, how it works with applications, how it compares with the on-premises version of Active Directory Rights Management, and understand the terms and abbreviations that are specific to [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)].

Then when you’re ready to test Azure RMS for yourself, or deploy it for your organization, use the [Azure Rights Management Deployment Roadmap](../Topic/Azure_Rights_Management_Deployment_Roadmap.md) for a list of steps with links for more information and how-to instructions.

If you need additional information, resources, and support options, see [Information and Support for Azure Rights Management](../Topic/Information_and_Support_for_Azure_Rights_Management.md).

## Can I integrate Azure RMS with my on-premises servers?
Yes. Azure RMS can be integrated with your on-premises servers, such as Exchange Server, SharePoint, and Windows file servers. To do this, you use the [Rights Management connector](https://technet.microsoft.com/library/dn375964.aspx). Or, if you're just interested in using File Classification Infrastructure (FC) with Windows Server, you can use the [RMS Protection cmdlets](https://technet.microsoft.com/library/mt601315%28v=ws.10%29.aspx). You can also synchronize and federate your Active Directory domain controllers with Azure AD for a more seamless authentication experience for users, for example, by using [Azure AD Connect](http://azure.microsoft.com/documentation/articles/active-directory-aadconnect/).

Azure RMS automatically generates and manages XrML certificates as required, so it doesn’t use an on-premises PKI. For more information about how Azure RMS uses certificates, see the [Walkthrough of how Azure RMS works: First use, content protection, content consumption](../Topic/What_is_Azure_Rights_Management_.md#BKMK_Walthrough) section in the [What is Azure Rights Management?](../Topic/What_is_Azure_Rights_Management_.md) topic.

## I have a hybrid deployment of Exchange with some users on Exchange Online and others on Exchange Server—is this supported by Azure RMS?
Absolutely, and the nice thing is, users will be able to seamlessly protect and consume protected emails and attachments across the two Exchange deployments. For this configuration, [activate Azure RMS](https://technet.microsoft.com/library/jj658941.aspx) and [enable IRM for Exchange Online](https://technet.microsoft.com/library/dn151475%28v=exchg.150%29.aspx), then [deploy and configure the RMS connector](https://technet.microsoft.com/library/dn375964.aspx) for Exchange Server.

## If I deploy Azure RMS in production, is my company then locked into the solution or risk losing access to content that we protected with Azure RMS?
No, you always remain in control of your data and can continue to access it, even if you decide to no longer use Azure RMS. For more information, see [Decommissioning and Deactivating Azure Rights Management](../Topic/Decommissioning_and_Deactivating_Azure_Rights_Management.md).

However, before you decommission your Azure RMS deployment, we would like to hear from you and understand why you made this decision. If Azure RMS does not fulfil your business requirements, check with us in case new functionality is planned for the near-future or if there are alternatives. Send an email message to [AskIPTeam@Microsoft.com](mailto:askipteam@microsoft.com?subject=Planning%20to%20decommission%20Azure%20RMS) and we’ll be happy to discuss your technical and business requirements.

## Can I control which of my users can use Azure RMS to protect content?
Yes, Azure RMS has user onboarding controls for this scenario. For more information, see the [Configuring onboarding controls for a phased deployment](../Topic/Activating_Azure_Rights_Management.md#BKMK_OnboardingControls) section in the [Activating Azure Rights Management](../Topic/Activating_Azure_Rights_Management.md) topic.

## Can I prevent users from sharing protected documents with specific organizations?
One of the biggest benefits of Azure RMS is that it supports business-to-business collaboration without you having to configure explicit trusts for each partner organization, because Azure AD takes care of the authentication for you.

There is no administration option to prevent users from securely sharing documents with specific organizations. For example, you want to block an organization that you don’t trust or that has a competing business. Preventing Azure RMS from sending protected documents to users in these organizations wouldn’t make sense because your users would then share their documents unprotected, which is probably the last thing you want to happen in this scenario! For example, you wouldn’t be able to identify who is sharing company-confidential documents with which users in these organizations, which you can do when the document (or email) is protected by Azure RMS.

## When I share a protected document with somebody outside my company, how does that user get authenticated?
Azure RMS always uses an Azure Active Directory account and an associated email address for user authentication, which makes business-to-business collaboration seamless for administrators. If the other organization uses Azure services, users will already have accounts in Azure Active Directory, even if these accounts are created and managed on-premises and then synchronized to Azure.  If the organization has Office 365, under the covers, this service also uses Azure Active Directory for the user accounts.  If the user’s organization doesn’t have managed accounts in Azure, users can sign up for [RMS for individuals](https://technet.microsoft.com/library/dn592127.aspx), which creates an unmanaged Azure tenant and directory for the organization with an account for the user, so that this user can then be authenticated for Azure RMS.

The authentication method for these accounts can vary, depending on how the administrator in the other organization has configured the Azure Active Directory accounts. For example, they could use passwords that were created for these accounts, multi-factor authentication (MFA), federation, or passwords that were created in Active Directory Domain Services and then synchronized to Azure Active Directory.

## Can I add users from outside my company to custom templates?
Yes.  Creating custom templates that end users (and administrators) can select from applications makes it quick and easily for them to apply information protection, using predefined policies that you specify. One of the settings in the template is who is able to access the content, and you can specify users and groups from within your organization, and users from outside your organization.

To specify users from outside your organization, use [Windows PowerShell module for Azure Rights Management](https://technet.microsoft.com/library/jj585012.aspx):

-   **Use a rights definition object to create or update a template**.    Specify the external email addresses and their rights in a rights definition object, which you then use to create or update a template. You specify the rights definition object by using the [New-AadrmRightsDefinition](https://msdn.microsoft.com/library/azure/dn727080.aspx) cmdlet to create a variable and then supply this variable to the  -RightsDefinition parameter with the [Add-AadrmTemplate](https://msdn.microsoft.com/library/azure/dn727075.aspx) cmdlet (for a new template) or [Set-AadrmTemplateProperty](https://msdn.microsoft.com/library/azure/dn727076.aspx) cmdlet (if you're modifying an existing template). However, if you're adding these users to an existing template, you will need to define rights definition objects for the existing groups in the templates and not just the external users.

For more information about custom templates, see [Configuring Custom Templates for Azure Rights Management](../Topic/Configuring_Custom_Templates_for_Azure_Rights_Management.md).

## What devices and which file types are supported by Azure RMS?
For a list of supported devices, see the [Client devices that support Azure RMS](../Topic/Requirements_for_Azure_Rights_Management.md#BKMK_SupportedDevices) section in the [Requirements for Azure Rights Management](../Topic/Requirements_for_Azure_Rights_Management.md) topic. Because not all supported devices can currently support all RMS capabilities, be sure to also check the [Client device capabilities](../Topic/Requirements_for_Azure_Rights_Management.md#BKMK_ClientCapabilities) table in the same topic.

Azure RMS can support all file types. For text, image, Microsoft Office (Word, Excel, PowerPoint) files, .pdf files, and some other application file types, Azure RMS provides native protection that includes both encryption and enforcement of rights (permissions). For all other applications and file types, generic protection provides file encapsulation and authentication to verify if a user is authorized to open the file.

For a list of file name extensions that are natively supported by Azure RMS, see the [Supported file types and file name extensions](http://technet.microsoft.com/library/dn339003.aspx) section of the [Rights Management sharing application administrator guide](http://technet.microsoft.com/library/dn339003.aspx). File name extensions not listed are supported by using the RMS sharing application that automatically applies generic protection to these files.

## When will you support migration from AD RMS?
Initially, Azure RMS didn’t support migration from an on-premises deployment of Rights Management, such as AD RMS. But it’s supported now.

For more information, see [Migrating from AD RMS to Azure Rights Management](../Topic/Migrating_from_AD_RMS_to_Azure_Rights_Management.md).

## We really want to use BYOK with Azure RMS but learned that this isn’t compatible with Exchange Online—what’s your advice?
Don’t let this current limitation delay your Azure RMS deployment. If you have Exchange Online and want to use bring your own key (BYOK), we recommend that you deploy Azure RMS in the default key management mode now, where Microsoft generates and manages your key. That way, you get all the benefits of protecting your important files and emails now, with the option to move to BYOK later (for example, when Exchange Online does support BYOK).

However, if your company policies require you to use a hardware security module (HSM) and this would otherwise block your Azure RMS deployment, another option is to deploy Azure RMS with BYOK now, with reduced RMS functionality for Exchange. For more information, see the [BYOK pricing and restrictions](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_Pricing) section in the [Planning and Implementing Your Azure Rights Management Tenant Key](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md) topic.

## A feature I am looking for doesn’t seem to work with SharePoint protected libraries—is support for my feature planned?
Currently, SharePoint supports RMS protected documents by using IRM protected libraries, which do not support custom templates, document tracking, and some other capabilities.  For more information, expand the   [SharePoint Online and OneDrive for Business: IRM Configuration](../Topic/Configuring_Applications_for_Azure_Rights_Management.md#BKMK_SharePointOnline) section in the [How Applications Support Azure Rights Management](../Topic/How_Applications_Support_Azure_Rights_Management.md) topic .

If you are interested in a specific  capability that isn't yet supported,  be sure to keep an eye on announcements on the [RMS team blog](http://blogs.technet.com/b/rms/).

## How do I configure One Drive for Business in SharePoint Online, so that users can safely share their files with people inside and outside the company?
By default, as an Office 365 administrator, you don’t configure this; users do.

Just as a SharePoint site administrator enables and configures IRM for a SharePoint library that they own, OneDrive for Business is designed for users to enable and configure IRM for their own OneDrive for Business library.  However, by using PowerShell, you can do this for them. For instructions, expand the [SharePoint Online and OneDrive for Business: IRM Configuration](../Topic/Configuring_Applications_for_Azure_Rights_Management.md#BKMK_SharePointOnline)  section in the [Configuring Applications for Azure Rights Management](../Topic/Configuring_Applications_for_Azure_Rights_Management.md) article.

## Do you have any tips or tricks for a successful RMS deployment?
After overseeing many deployments and listening to our customers, partners, consultants, and support engineers – one of the biggest tips we can pass on from experience: **Design and deploy simple rights policies**.

Because Azure RMS supports sharing securely with anyone, you can afford to be ambitious with your information protection reach. But be conservative with your rights policies. For many organizations, the biggest business impact comes from preventing data leakage by applying the default rights policy template that restricts access to people in your organization. Of course, you can get much more granular than that if you need to – prevent people from printing, editing etc. But keep the more granular restrictions as the exception for documents that really need high-level security, and don’t implement these more restrictive policies on day one, but plan for a more phased approach.

## What features can or can’t be used with the different subscriptions for Azure RMS?
For the paid subscriptions that support Azure RMS (Office 365, Azure RMS Premium, and Enterprise Mobility Suite), there are some differences in the RMS features that are supported. For a list of these, see [Comparison of Rights Management Services (RMS) Offerings](http://technet.microsoft.com/dn858608).

The free subscription that supports Azure RMS (RMS for individuals) supports consuming content that has been protected by Azure RMS. For more information, see [RMS for Individuals and Azure Rights Management](../Topic/RMS_for_Individuals_and_Azure_Rights_Management.md).

## Where can I get technical information about the free Azure RMS subscription (RMS for individuals)—for example, how it really works, how to take control of the accounts, and which domains can’t be used?
You’ll find answers to these questions in the [RMS for Individuals and Azure Rights Management](../Topic/RMS_for_Individuals_and_Azure_Rights_Management.md) topic.

## How do we regain access to files that were protected by an employee who has now left the organization?
Use the super user feature of Azure RMS, which lets authorized users have full owner rights for all use licenses that were granted by your organization’s RMS tenant. This same feature lets authorized services index and inspect files, as needed.

For more information, see [Configuring Super Users for Azure Rights Management and Discovery Services or Data Recovery](../Topic/Configuring_Super_Users_for_Azure_Rights_Management_and_Discovery_Services_or_Data_Recovery.md).

## Can Rights Management prevent screen captures?
Rights Management does block screen captures from most of the commonly used screen capture tools, which can help to avoid accidental or negligent disclosure of confidential or sensitive information. However, there are many ways that a user can share data that is displayed on a screen, and taking a screen shot is only one method. For example, a user intent on sharing displayed information can take a picture of it using their camera phone, retype the data, or simply verbally relay it to somebody.

As these examples demonstrate, technology alone cannot always prevent users from sharing data that they should not. While Rights Management can help to safeguard your important data by using authorization and usage policies, this enterprise rights management solution should be used with other controls. For example, implement physical security, carefully screen and monitor people who have authorized access to your organization's data, and invest in user education so users understand what data should not be shared.

## Where can I find supporting information for Azure RMS—such as legal, compliance, and SLAs?
Azure RMS supports other services and also relies on other services. If you’re looking for information that is related to Azure RMS but not about how to use the Azure RMS service, check the following resources:

**Legal and privacy:**

-   For Microsoft Azure agreement information: [Microsoft Azure Agreement](http://azure.microsoft.com/support/legal/subscription-agreement/)

-   For Microsoft Azure privacy information: [Microsoft Azure Privacy Statement](http://azure.microsoft.com/support/legal/privacy-statement/)

**Security, compliance, and auditing:**

See the [Security, compliance, and regulatory requirements](../Topic/What_is_Azure_Rights_Management_.md#BKMK_RMScompliance) section in the [What is Azure Rights Management?](../Topic/What_is_Azure_Rights_Management_.md) topic. In addition:

-   For external certifications for Azure RMS: [Microsoft Azure Trust Center](http://azure.microsoft.com/support/trust-center/)

-   For FIPS 140 information: [FIPS 140 Validation](https://technet.microsoft.com/library/security/cc750357.aspx)

**Service level agreements:**

-   Service level agreement for Azure RMS, by selected country: [Service level agreement](http://microsoftvolumelicensing.com/DocumentSearch.aspx?Mode=3&amp;DocumentTypeId=37)

-   Service level agreement for Azure Active Directory: [Service Level Agreements](http://azure.microsoft.com/support/legal/sla/)

**Documentation:**

-   Azure Active Directory Documentation site: [Azure Active Directory](http://azure.microsoft.com/documentation/services/active-directory/)

-   Azure Active Directory Library: [Azure Active Directory](http://msdn.microsoft.com/library/azure/jj673460.aspx)

-   Office 365 Library: [Office 365](http://technet.microsoft.com/library/dn127064%28v=office.14%29.aspx)

## What do I do if my question isn’t here?
Use the links and resources listed in [Information and Support for Azure Rights Management](../Topic/Information_and_Support_for_Azure_Rights_Management.md).

In addition, there are FAQs designed for end-users:

-   [FAQ for Rights Management Sharing Application for Windows](https://technet.microsoft.com/dn467883)

-   [FAQ for Rights Management Sharing Application for Mobile and Mac Platforms](https://technet.microsoft.com/dn451248)

-   [FAQ for Document Tracking](http://go.microsoft.com/fwlink/?LinkId=523977)

This FAQ page will be updated regularly, with new additions listed in the monthly documentation update announcements on the [Microsoft Rights Management (RMS) Team](http://blogs.technet.com/b/rms/) blog.

> [!TIP]
> You can use the [docs tag](http://blogs.technet.com/b/rms/archive/tags/docs/) on the blog, to more easily find these documentation announcements.

## See Also
[Getting Started with Azure Rights Management](../Topic/Getting_Started_with_Azure_Rights_Management.md)

