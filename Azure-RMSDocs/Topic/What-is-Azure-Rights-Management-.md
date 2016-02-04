---
title: What is Azure Rights Management?
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: aeeebcd7-6646-4405-addf-ee1cc74df5df
author: Cabailey
---
# What is Azure Rights Management?
Azure Rights Management (Azure RMS) is an information protection solution for organizations that want to protect their data in today's challenging working environment.

These challenges include the need to be Internet-connected, with users bringing personal device to work, accessing company data on the road and home, and sharing sensitive information with important business partners. As part of their daily work, users share information by using email, file-sharing sites, and cloud services. In these scenarios, traditional security controls (such as access control lists and NTFS permissions) and firewalls have limited effectiveness if you want to protect your company data while still empowering your users to work efficiently.

In comparison, Azure RMS can protect your company’s sensitive information in all these scenarios. It uses encryption, identity, and authorization policies to help secure your files and email, and it works across multiple devices—phones, tablets, and PCs. Information can be protected both within your organization and outside your organization because that protection remains with the data, even when it leaves your organization’s boundaries. As an example, employees might email a document to a partner company, or they save a document to their cloud drive. The persistent protection that Azure RMS provides not only helps to secure your company data, but might also be legally mandated for compliance, legal discovery requirements, or simply good information management practices.

But very importantly, authorized people and services (such as search and indexing) can continue to read and inspect the data that Azure RMS protects, which is not easily accomplished with other information protection solutions that use peer-to-peer encryption. This ability is sometimes referred to as “reasoning over data” and is a crucial element in maintaining control of your organization’s data.

The following picture shows how Azure RMS works as a Rights Management solution for Office 365 as well as for on-premises servers and services. You'll also see that it supports the popular end user devices that run Windows, Mac OS, iOS, Android, and Windows Phone.

![](../Image/AzRMS_elements.png)

> [!TIP]
> At this point, you might find the additional resources useful:
> 
> -   Two minute video: [What is Microsoft Azure Rights Management](http://technet.microsoft.com/dn833005.aspx)
> -   Five-step tutorial: [Quick Start Tutorial for Azure Rights Management](../Topic/Quick-Start-Tutorial-for-Azure-Rights-Management.md)
> -   Azure RMS requirements, including subscription options to purchase or evaluate: [Requirements for Azure Rights Management](../Topic/Requirements-for-Azure-Rights-Management.md)

Use the following sections to learn more about Azure RMS:

-   [What problems does Azure RMS solve?](../Topic/What-is-Azure-Rights-Management-.md#BKMK_RMSrequirements)

    -   [Security, compliance, and regulatory requirements](../Topic/What-is-Azure-Rights-Management-.md#BKMK_RMScompliance)

-   [Azure RMS in action: What administrators and users see](../Topic/What-is-Azure-Rights-Management-.md#BKMK_RMSpictures)

    -   [Activating and configuring Rights Management](../Topic/What-is-Azure-Rights-Management-.md#BKMK_Example_ManagementPortal)

    -   [Automatically protecting files on file servers running Windows Server and File Classification Infrastructure](../Topic/What-is-Azure-Rights-Management-.md#BKMK_Example_FCI)

    -   [Automatically protecting emails with Exchange Online and data loss prevention policies](../Topic/What-is-Azure-Rights-Management-.md#BKMK_Example_DLP)

    -   [Automatically protecting files with SharePoint Online and protected libraries](../Topic/What-is-Azure-Rights-Management-.md#BKMK_Example_SharePoint)

    -   [Users safely share attachments with mobile users](../Topic/What-is-Azure-Rights-Management-.md#BKMK_Example_SharingApp)

-   [How does Azure RMS work? Under the hood](../Topic/What-is-Azure-Rights-Management-.md#BKMK_HowRMSworks)

    -   [Cryptographic controls used by Azure RMS: Algorithms and key lengths](../Topic/What-is-Azure-Rights-Management-.md#BKMK_RMScrytographics)

    -   [Walkthrough of how Azure RMS works: First use, content protection, content consumption](../Topic/What-is-Azure-Rights-Management-.md#BKMK_Walthrough)

-   [Next steps](../Topic/What-is-Azure-Rights-Management-.md#BKMK_NextSteps)

## <a name="BKMK_RMSrequirements"></a>What problems does Azure RMS solve?
Use the following table to identify business requirements or problems that your organization might have, and how Azure RMS can address these.

|Requirement or problem|Solved by Azure RMS|
|--------------------------|-----------------------|
|Protect all file types|√ In previous implementation of Rights Management, only Office files could be protected, using native protection. Now, [generic protection](https://technet.microsoft.com/library/dn574738%28v=ws.10%29.aspx) means that all file types are supported.|
|Protect files anywhere|√ When a file is saved to a location ([protect in-place](https://technet.microsoft.com/library/dn574733%28v=ws.10%29.aspx)), the protection stays with the file, even if it is copied to storage that is not under the control of IT, such as a cloud storage service.|
|Share files securely by email|√ When a file is shared by email ([share protected](https://technet.microsoft.com/library/dn574735%28v=ws.10%29.aspx)), the file is protected as an attachment to an email message, with instructions how to open the protected attachment. The email text is not encrypted, so the recipient can always read these instructions. However, because the attached document is protected, only authorized users will be able to open it, even if the email or document is forwarded to other people.|
|Auditing and monitoring|√ You can [audit and monitor usage](https://technet.microsoft.com/library/dn529121.aspx) of your protected files, even after these files leave your organization’s boundaries.<br /><br />For example, you work for Contoso, Ltd. You are working on a joint project with 3 people from Fabrikam, Inc. You email these 3 people a document that you protect and restrict to read-only. Azure RMS auditing can provide the following information:<br /><br />Whether the people you specified in Fabrikam opened the document, and when.<br /><br />Whether other people that you didn’t specify attempted (and failed) to open the document—perhaps because it was forwarded or saved to a shared location that others could access.<br /><br />Whether any of the specified people tried (and failed) to print or change the document.|
|Support for all commonly used devices, not just Windows computers|√ [Supported devices](https://technet.microsoft.com/library/dn655136.aspx) include:<br /><br />Windows computers and phones<br /><br />Mac computers<br /><br />iOS tablets and phones<br /><br />Android tablets and phones|
|Support for business-to-business collaboration|√ Because Azure RMS is a cloud service, there’s no need to explicitly configure trusts with other organizations before you can share protected content with them. If they already have an Office 365 or an Azure AD directory, collaboration across organizations is automatically supported. If they do not, users can sign up for the free [RMS for individuals](https://technet.microsoft.com/library/dn592127.aspx) subscription.|
|Support for on-premises services, as well as Office 365|√  In addition to working [seamlessly with Office 365](https://technet.microsoft.com/library/jj585004.aspx), you can also use Azure RMS with the following on-premises services when you deploy the [RMS connector](https://technet.microsoft.com/library/dn375964.aspx):<br /><br />Exchange Server<br /><br />SharePoint Server<br /><br />Windows Server running File Classification Infrastructure|
|Easy activation|√ [Activating the Rights Management service](https://technet.microsoft.com/library/jj658941.aspx) for users requires just a couple of clicks in the Azure classic portal.|
|Ability to scale across your organization, as needed|√ Because Azure RMS runs as a cloud service with the Azure elasticity to scale up and out, you don’t have to provision or deploy additional on-premises servers.|
|Ability to create simple and flexible policies|√ [Customized rights policy templates](https://technet.microsoft.com/library/dn642472.aspx) provide a quick and easy solution for administrators to apply policies, and for users to apply the correct level of protection for each document and restrict access to people inside your organization.<br /><br />For example, for a company-wide strategy paper to be shared with all employees, you could apply a read-only policy to all internal employees. Then, for a more sensitive document, such as a financial report, you could restrict access to executives only.|
|Broad application support|√ Azure RMS has tight integration with Microsoft Office applications and services, and extends support for other applications by using the RMS sharing application.<br /><br />√ The   [Microsoft Rights Management SDK](https://msdn.microsoft.com/library/hh552972%28v=vs.85%29.aspx) provides your internal developers and software vendors with APIs to write custom applications that support Azure RMS.<br /><br />For more information, see [How Applications Support Azure Rights Management](../Topic/How-Applications-Support-Azure-Rights-Management.md).|
|IT must maintain control of data|√ Organizations can choose to manage their own tenant key and use the “[Bring Your Own Key](https://technet.microsoft.com/library/dn440580.aspx)” (BYOK) solution and store their tenant key in Hardware Security Modules (HSMs).<br /><br />√ Support for auditing and [usage logging](https://technet.microsoft.com/library/dn529121.aspx) so that you can analyze for business insights, monitor for abuse, and (if you have an information leak) perform forensic analysis.<br /><br />√ Delegated access by using the [super user feature](https://technet.microsoft.com/library/mt147272.aspx) ensures that IT can always access protected content, even if a document was protected by an employee who then leaves the organization. In comparison, peer-to-peer encryption solutions risk losing access to company data.<br /><br />√ Synchronize [just the directory attributes that Azure RMS needs](https://azure.microsoft.com/documentation/articles/active-directory-aadconnectsync-attributes-synchronized/) to support a common identity for your on-premises Active Directory accounts, by using a [directory synchronization tool](https://azure.microsoft.com/documentation/articles/active-directory-aadconnect-get-started-tools-comparison/), such as Azure AD Connect.<br /><br />√ Enable single-sign on without replicating passwords to the cloud, by using AD FS.<br /><br />√ Organizations always have the choice to stop using Azure RMS without losing access to content that was previously protected by Azure RMS. For information about decommissioning options, see [Decommissioning and Deactivating Azure Rights Management](../Topic/Decommissioning-and-Deactivating-Azure-Rights-Management.md). In addition, organizations who have deployed Active Directory Rights Management Services (AD RMS) can [migrate to Azure RMS](https://technet.microsoft.com/library/dn858447.aspx) without losing access to data that was previously protected by AD RMS.|
> [!TIP]
> If you are familiar with the on-premises version of Rights Management, Active Directory Rights Management Services (AD RMS), you might be interested in the comparison table from [Comparing Azure Rights Management and AD RMS](../Topic/Comparing-Azure-Rights-Management-and-AD-RMS.md).

### <a name="BKMK_RMScompliance"></a>Security, compliance, and regulatory requirements
Azure RMS supports the following security, compliance and regulatory requirements:

√ Use of industry-standard cryptography and supports FIPS 140-2. For more information, see the [Cryptographic controls used by Azure RMS: Algorithms and key lengths](../Topic/What-is-Azure-Rights-Management-.md#BKMK_RMScrytographics) section in this topic.

√ Support for Thales Hardware Security Modules (HSMs) to store your tenant key in Microsoft Azure data centers. Azure RMS uses separate security worlds for its data centers in North America, EMEA (Europe, Middle East and Africa), and Asia, so your keys can be used only in your region.

√ Certified for the following:

-   ISO/IEC 27001:2013 (includes [ISO/IEC 27018](http://azure.microsoft.com/blog/2015/02/16/azure-first-cloud-computing-platform-to-conform-to-isoiec-27018-only-international-set-of-privacy-controls-in-the-cloud/))

-   SOC 2 SSAE 16/ISAE 3402 attestations

-   HIPAA BAA

-   EU Model Clause

-   FedRAMP as part of Azure Active Directory in Office 365 certification, issued FedRAMP Agency Authority to Operate by HHS

-   PCI DSS Level 1

For more information about these external certifications, see the [Azure Trust Center](http://azure.microsoft.com/support/trust-center/compliance/).

## <a name="BKMK_RMSpictures"></a>Azure RMS in action: What administrators and users see
The pictures in this section show some typical examples of how administrators and users see and can use Azure RMS to help protect sensitive or confidential information.

> [!NOTE]
> In all these examples where Azure RMS protects data, the content owner continues to have full access to the data (file or email), even if the applied protection grants permissions to a group that the owner wasn’t a member of, or even if the applied protection includes an expiration date.
> 
> Similarly, IT can always access the protected data without restrictions, by using the super user feature of Rights Management that grants delegated access to authorized users or services that you specify. In addition, IT can track and monitor usage for data that has been protected—for example, who is accessing the data and when.

For other screenshots and videos that show RMS in action, check the [Microsoft Rights Management services portal](http://www.microsoft.com/rms), the [Microsoft Rights Management (RMS) Team Blog](http://blogs.technet.com/b/rms), and [curated content for Azure RMS on the Curah! site](http://curah.microsoft.com/Search?query="Azure%20RMS").

### <a name="BKMK_Example_ManagementPortal"></a>Activating and configuring Rights Management
Although you can use Windows PowerShell to activate and configure Azure RMS, it’s easiest from the management portal. As soon as the service is activated, you have two default templates that administrators and users can select to quickly and easily apply information protection to files. But you can also create your own custom templates for additional options and settings.

|||
|-|-|
|![](../Image/AzRMS_StoryboardActivate_small1.png)<br /><br />[Bigger picture](http://technet.microsoft.com/98d53a12-3b19-4622-bb1e-75ef56df5438) (by default, in same browser window)|You can use either the Office 365 admin center (first picture) or the Azure classic portal (second picture) to activate RMS.<br /><br />Just one click to activate and another click to confirm, then information protection is enabled for administrators and users in your organization.|
|![](../Image/AzRMS_TemplatesPortal_small.png)<br /><br />[Bigger picture](http://technet.microsoft.com/596e4fec-124c-41b1-8efd-63d5179193fb) (by default, in same browser window)|After activation, two rights policy templates are automatically available for your organization. One template is for read-only (**Confidential View Only** is included in the name), the other for read and modify access (**Confidential**).<br /><br />When these templates are applied to files or emails, they restrict access to users in your organization. This is a very quick and easy way to help prevent your company data leaking to people outside your organization.<br /><br />Tip: You can easily recognize these default templates, because they are automatically prefixed by your organization name. In our example, **VanArsdel, Ltd**.<br /><br />If you do not want users to see these templates or if you want to create your own templates, you can do this from the Azure classic portal. As this picture shows, a wizard takes you through the custom template creation process.|
|![](../Image/AzRMS_TemplatesSettings3.png)<br /><br />[Bigger picture](http://technet.microsoft.com/f5df80e5-efc9-4c0f-91be-060225977356) (by default, in same browser window)|Offline access, expiration settings, and whether to publish the template immediately (make it visible in applications that support Rights Management) are some of the configuration settings available if you decide to create your own templates.|
|![](../Image/AzRMS_TemplatesPortal_ExplorerWord3.png)<br /><br />[Bigger picture](http://technet.microsoft.com/597a3402-fd5a-4bcf-b5e6-5c983dbde697) (by default, in same browser window)|As a result of publishing these templates, users can now select them in applications such as  File Explorer and Microsoft Word:<br /><br />A user could choose the default template, **VanArsdel, Ltd – Confidential**. Then, only employees from the VanArsdel organization can open and use this document, even if it’s later emailed to somebody outside the organization or saved to a public location.<br /><br />A user could choose the custom template that the administrator created, **Sales and Marketing – Read and Print Only**. Then, not only is the file protected from people outside the organization, but it’s also restricted to employees from the Sales and Marketing department. Further, these employees do not have full rights to the document, only read and print. For example, they cannot modify it or copy from it.|
For more information, see [Activating Azure Rights Management](../Topic/Activating-Azure-Rights-Management.md) and [Configuring Custom Templates for Azure Rights Management](../Topic/Configuring-Custom-Templates-for-Azure-Rights-Management.md).

To help users protect important company files, see [Helping Users to Protect Files by Using Azure Rights Management](../Topic/Helping-Users-to-Protect-Files-by-Using-Azure-Rights-Management.md).

Next, see some examples of how administrators can apply the templates to automatically configure information protection for files and emails.

### <a name="BKMK_Example_FCI"></a>Automatically protecting files on file servers running Windows Server and File Classification Infrastructure
This example shows how you can use Azure RMS to automatically protect files on file servers that run at least Windows Server 2012 and are configured to use File Classification Infrastructure.

There are many ways to apply classification values to files. For example, you can inspect the contents of files and accordingly apply built-in classifications such as Confidentiality and Personally Identifiable Information. However, in this example, an administrator creates a custom classification of **Marketing** that is automatically applied to all user documents that are saved in the **Marketing Promotions** folder. Although this folder is protected with NTFS permissions that restricts access to members of the Marketing group, the administrator knows that these permissions can be lost if somebody from that group moves or emails the files. Then, the information in the files could be accessed by unauthorized users.

|||
|-|-|
|![](../Image/AzRMS_FCI_ConnectorSmall.png)<br /><br />[Bigger picture](http://technet.microsoft.com/cf18c56b-c301-4640-8d9e-9e677e494091) (by default, in same browser window)|The administrators installs and configures the Rights Management (RMS) connector, which acts as a relay between on-premises servers and Azure RMS.|
|![](../Image/AzRMS_ExampleFCI_ConfigurationSmall.png)<br /><br />[Bigger picture](http://technet.microsoft.com/ba3e247d-ea5e-4009-8eac-74f70270ece0) (by default, in same browser window)|On the file server, the administrator configures the classification rules and tasks so that all user files in the **Marketing Promotions** folder are automatically classified as **Marketing** and protected with RMS encryption.<br /><br />She selects the custom RMS template that was created in our first example, which restricts access to members of the Sales and Marketing departments: **Sales and Marketing – Read and Print Only**.<br /><br />As a result, all documents in that folder are automatically configured with the Marketing classification and protected by the Sales and Marketing RMS template.|
|![](../Image/AzRMS_FCI_EmailSmall.png)<br /><br />[Bigger picture](http://technet.microsoft.com/ad666594-68df-4289-835a-235b2af9bf4b) (by default, in same browser window)|How RMS helps to prevent data leaking to people who should not have access to sensitive or confidential information:<br /><br />Janet, from Marketing, emails a confidential report from the Marketing Promotions folder. This report contains new product features and advertising plans and is requested by a co-worker who is currently traveling on business. However, Janet mistakenly emails it to the wrong person—she didn’t notice that she accidentally selected a recipient with a similar name, in another company.<br /><br />The recipient cannot read the confidential report because he is not a member of the Sales and Marketing group.|
For more information, see [Deploying the Azure Rights Management Connector](../Topic/Deploying-the-Azure-Rights-Management-Connector.md).

### <a name="BKMK_Example_DLP"></a>Automatically protecting emails with Exchange Online and data loss prevention policies
The previous example showed how you could automatically protect files that contain sensitive or confidential information, but what if the information is not in a file, but in an email message? This is where Exchange Online data loss prevention (DLP) policies comes in, either prompting users to apply information protection (by using Policy Tips) or automatically applying it for them (by using transport rules).

In this example, the administrator configures a policy to help keep the organization in compliance with US regulations for protecting personally identifiable information data, but rules can also be configured for other compliance regulations, or custom rules that you define.

|||
|-|-|
|![](../Image/AzRMS_DLPExample1.png)<br /><br />[Bigger picture](http://technet.microsoft.com/58461319-3981-4b7f-a195-956a1778e907) (by default, in same browser window)|The Exchange template named **U.S. Personally Identifiable Information (PII) Data** is used by the administrator to create and configure a new DLP policy. This template looks for information such as social security numbers and driver license numbers in email messages.<br /><br />The rules are configured so that email messages that contain this information and that are sent outside the organization automatically have rights protection applied by using an RMS template that restricts access to company employees only.<br /><br />Here, the rule is configured to use one of the default templates, **VanArsdel, Ltd – Confidential**, from our first example. But you can also see how the choice of templates includes any custom templates you’ve created, and a **No Do Forward** option that is specific to Exchange.|
|![](../Image/AzRMS_DLPUnprotectedEmail_small.png)<br /><br />[Bigger picture](http://technet.microsoft.com/bfb0762d-06fb-42e4-beff-eb391f4bedf0) (by default, in same browser window)|The hiring manager writes an email message that contains the social security number of a recently hired employee. He sends this email message to Sherrie in the Human Resources department.|
|![](../Image/AzRMS_DLPProtectedEmail_small.png)<br /><br />[Bigger picture](http://technet.microsoft.com/59e3b68e-4bed-4962-bb1e-e82d82f8000a) (by default, in same browser window)|If this email message is sent or forwarded to somebody outside the organization, the DLP rule automatically applies rights protection.<br /><br />The email is encrypted when it leaves the organization’s infrastructure, so that the social security number in the email message cannot be read while in transit, or in the recipient’s inbox. The recipient will not be able to read the message unless he or she is a VanArsdel employee.|
For more information, see the following sections:

-   [Exchange Online and Exchange Server](../Topic/How-Applications-Support-Azure-Rights-Management.md#BKMK_ExchangeIntro) in the [How Applications Support Azure Rights Management](../Topic/How-Applications-Support-Azure-Rights-Management.md) topic.

-   [Exchange Online: IRM Configuration](../Topic/Configuring-Applications-for-Azure-Rights-Management.md#BKMK_ExchangeOnline) in the [Configuring Applications for Azure Rights Management](../Topic/Configuring-Applications-for-Azure-Rights-Management.md) topic.

### <a name="BKMK_Example_SharePoint"></a>Automatically protecting files with SharePoint Online and protected libraries
This shows how you can easily protect documents when you use SharePoint Online and protected libraries.

In this example, the SharePoint administrator for Contoso has created a library for each department that they use to centrally store and check out documents for editing and version control. For example, there is a library for Sales, one for Marketing, one for Human Resources, and so on. When a new document is uploaded or created in one of these protected libraries, that document inherits the protection of the library (no need to select a rights policy template) and that document is automatically protected and remains protected, even if it’s moved outside the SharePoint library.

|||
|-|-|
|![](../Image/AzRMS_StoryboardSPO_small1.png)<br /><br />[Bigger picture](http://technet.microsoft.com/2fc90989-9289-4431-9e6a-07740b7f6e5a) (by default, in same browser window)|The administrator enables Information Rights Management for the SharePoint site.|
|![](../Image/AzRMS_StoryboardSPO_small2.png)<br /><br />[Bigger picture](http://technet.microsoft.com/a18f2e99-5ac4-4103-a88c-527846374091) (by default, in same browser window)|Then, she enables Rights Management for a library. Although there are additional options, this simple setting is often all that’s needed.<br /><br />When documents are now downloaded from this library, they  are automatically protected by Rights Management, inheriting the protection that’s configured for the library.|
|![](../Image/AzRMS_StoryboardSPO_small3.png)<br /><br />[Bigger picture](http://technet.microsoft.com/0ebd6806-0190-441e-84db-72ac4b97e4a2) (by default, in same browser window)|When somebody from the sales department checks out this sales report from the library, they can clearly see from the information banner at the top that it’s a protected document with restricted access.<br /><br />The document remains protected even if the user renames it, saves it to another location, or shares it by email. No matter what the file is named, where it’s stored, or whether it’s shared by email, only members of the sales department can read it.|
For more information, see the following sections:

-   [SharePoint Online and SharePoint Server](../Topic/How-Applications-Support-Azure-Rights-Management.md#BKMK_SharePointIntro) in the [How Applications Support Azure Rights Management](../Topic/How-Applications-Support-Azure-Rights-Management.md) topic.

-   [SharePoint Online and OneDrive for Business: IRM Configuration](../Topic/Configuring-Applications-for-Azure-Rights-Management.md#BKMK_SharePointOnline) in the [Configuring Applications for Azure Rights Management](../Topic/Configuring-Applications-for-Azure-Rights-Management.md) topic.

### <a name="BKMK_Example_SharingApp"></a>Users safely share attachments with mobile users
The previous examples showed how administrators can automatically apply information protection to sensitive and confidential data. But there will be some occasions when users might need to apply this protection themselves. For example, they are collaborating with partners in another organization, they need custom permissions or settings that are not defined in templates, for or ad-hoc situations that are not covered by the previous examples. In these situations, users can apply the RMS templates themselves or configure custom permissions.

This example shows how users can easily share a document with somebody they’re collaborating with from another company, but still be able to protect the document and be confident that the recipient can read it, even from a popular mobile device. This scenario uses the Rights Management sharing application, which you can automatically deploy to Windows computers in your organization. Or, users can install it themselves.

In this example, Alice from Contoso, emails a confidential Word document that she sends to Bob, at Fabrikam. He reads the document on his iPad, but he could just as easily read it on an iPhone, an Android tablet or phone, a Mac computer, or a Windows phone or computer.

|||
|-|-|
|![](../Image/AzRMS_StoryboardEmail_small1.png)<br /><br />[Bigger picture](http://technet.microsoft.com/feeef78d-3c2e-432b-817d-d06f784be226) (by default, in same browser window)|From her Windows PC, Alice creates a standard email message and attaches a document.<br /><br />She clicks **Share Protected** on the ribbon, which loads the **share protected** dialog box from the RMS sharing application.<br /><br />Alice wants to restrict Bob to viewing and editing the document, and doesn’t want him to copy or print it, so she selects **REVIEWER – View and Edit**. She also wants to be emailed when somebody tries to open the document, and have the ability to revoke the document later if necessary and know that revocation will take effect immediately.|
|![](../Image/AzRMS_StoryboardEmail_small2.png)<br /><br />[Bigger picture](http://technet.microsoft.com/e748fd78-8bba-4168-96cf-f96def078283) (by default, in same browser window)|Bob sees the email on his iPad.<br /><br />In addition to Alice’s message and attachment, there are instructions that he follows to sign up and install the RMS sharing app on his iPad.|
|![](../Image/AzRMS_StoryboardEmail_small3.png)<br /><br />[Bigger picture](http://technet.microsoft.com/7dba5ff9-a61d-4a83-8adc-d6ffb0e85df6) (by default, in same browser window)|Bob can now open the attachment. He is first asked to sign in to confirm that he is the intended recipient.<br /><br />When Bob views the document, he also sees the restricted access information that tells him he can view and edit the document, but not copy or print.|
|![](../Image/AzRMS_StoryboardEmail_small4.png)<br /><br />[Bigger picture](http://technet.microsoft.com/9f642a2e-58ad-44ab-9f81-f890d15380f9) (by default, in same browser window)|Alice receives an email message that tells her Bob successfully opened the document that she sent, and when he accessed the document.<br /><br />If Bob forwards his email with the attachment, or saves it where others can access it, or it is intercepted on the network, other people will not be able to read the document.|
For more information, see [Protect a file that you share by email](https://technet.microsoft.com/library/dn574735.aspx) and [View and use files that have been protected](https://technet.microsoft.com/library/dn574741.aspx) from the [Rights Management sharing application user guide](https://technet.microsoft.com/library/dn339006.aspx).

In addition, the [Quick Start Tutorial for Azure Rights Management](../Topic/Quick-Start-Tutorial-for-Azure-Rights-Management.md) includes step-by-step instructions for this scenario.

Now you’ve seen some examples of what Azure RMS can do, you might be interested in how it does it. For technical information about how Azure RMS works, see the next section.

## <a name="BKMK_HowRMSworks"></a>How does Azure RMS work? Under the hood
One important thing to understand about how Azure RMS works is that the Rights Management service (and Microsoft) do not see or store your data as part of the information protection process. Information that you protect is never sent to or stored in Azure unless you explicitly store it in Azure or use another cloud service that stores it in Azure. Azure RMS simply makes the data in a document unreadable to anyone other than authorized users and services:

-   The data is encrypted at the application level and includes a policy that defines the authorized use for that document.

-   When a protected document is used by a legitimate user or it is processed by an authorized service, the data in the document is decrypted and the rights that are defined in the policy are enforced.

At a high level, you can see how this process works in the following picture. A document containing the secret formula is protected, and then successfully opened by an authorized user or service. The document is protected by a content key (the green key in this picture). It is unique for each document and is placed in the file header where it is protected by your RMS tenant root key (the red key in this picture). Your tenant key can be generated and managed by Microsoft, or you can generate and manage your own tenant key.

Throughout the protection process when Azure RMS is encrypting and decrypting, authorizing, and enforcing restrictions, the secret formula is never sent to Azure.

![](../Image/AzRMS_SecretColaFormula_final.png)

For a detailed description of what’s happening, see the [Walkthrough of how Azure RMS works: First use, content protection, content consumption](../Topic/What-is-Azure-Rights-Management-.md#BKMK_Walthrough) section in this topic.

For technical details about the algorithms and key lengths that Azure RMS uses, see the next section.

### <a name="BKMK_RMScrytographics"></a>Cryptographic controls used by Azure RMS: Algorithms and key lengths
Even if you don't need to know yourself how RMS works, you might be asked about the cryptographic controls that it uses, to make sure that the security protection is industry-standard.

|||
|-|-|
|Documentation protection method:|Algorithm: AES<br /><br />Key length: 128 bits and 256 bits [footnote 1]|
|Key protection method:|Algorithm: RSA<br /><br />Key length: 2048 bits|
|Certificate signing:|Algorithm: SHA-256|
Footnote 1:
             256 bits is used by the Rights Management sharing application for generic protection and native protection when the file has a .ppdf file name extension or is a protected text or image file (such as .ptxt or .pjpg).

### <a name="BKMK_Walthrough"></a>Walkthrough of how Azure RMS works: First use, content protection, content consumption
To understand in more detail how Azure RMS works, let's walk through a typical flow after the [Azure RMS service is activated](https://technet.microsoft.com/library/jj658941.aspx) and when a user first uses RMS on their Windows computer (a process sometimes known as **initializing the user environment** or bootstrapping), **protects content** (a document or email), and then **consumes**  (opens and uses) content that has been protected by somebody else.

After the user environment is initialized, that user can then protect documents or consume protected documents on that computer.

> [!NOTE]
> If this user moves to another Windows computer, or another user uses this same Windows computer, the initialization process is repeated.

#### Initializing the user environment
Before a user can protect content or consume protected content on a Windows computer, the user environment must be prepared on the device. This is a one-time process and happens automatically without user intervention when a user tries to protect or consume protected content:

|||
|-|-|
|![](../Image/AzRMS.png)|The RMS client on the computer first connects to Azure RMS, and authenticates the user by using their Azure Active Directory account.<br /><br />When the user’s account is federated with Azure Active Directory, this authentication is automatic and the user is not prompted for credentials.|

|||
|-|-|
|![](../Image/AzRMS_useractivation2.png)|After the user is authenticated, the connection is automatically redirected to the organization’s RMS tenant, which issues certificates that let the user authenticate to Azure RMS in order to consume protected content and to protect content offline.<br /><br />A copy of the user’s certificate is stored in Azure RMS so that if the user moves to another device, the certificates are created by using the same keys.|

#### Content protection
When a user protects a document, the RMS client takes the following actions on an unprotected document:

|||
|-|-|
|![](../Image/AzRMS_documentprotection1.png)|The RMS client creates a random key (the content key) and encrypts the document using this key with the AES symmetric encryption algorithm.|

|||
|-|-|
|![](../Image/AzRMS_documentprotection2.png)|The RMS client then creates a certificate that includes a policy for the document, either based on a template or by specifying specific rights for the document. This policy includes the rights for different users or groups and other restrictions, such as an expiration date.<br /><br />The RMS client then uses the organization’s key that was obtained when the user environment was initialized and uses this key to encrypt the policy and the symmetric content key. The RMS client also signs the policy with the user’s certificate that was obtained when the user environment was initialized.|

|||
|-|-|
|![](../Image/AzRMS_documentprotection3.png)|Finally, the RMs client embeds the policy into a file with the body of the document encrypted previously, which together comprise a protected document.<br /><br />This document can be stored anywhere or shared by using any method, and the policy always stays with the encrypted document.|

#### Content consumption
When a user wants to consume a protected document, the RMS client starts by requesting access to the Azure RMS service:

|||
|-|-|
|![](../Image/AzRMS_documentconsumption1.png)|The authenticated user sends the document policy and the user’s certificates to Azure RMS. The service decrypts and evaluates the policy, and builds a list of rights (if any) the user has for the document.|

|||
|-|-|
|![](../Image/AzRMS_documentconsumption2.png)|The service then extracts the AES content key from the decrypted policy. This key is then encrypted with the user’s public RSA key that was obtained with the request.<br /><br />The re-encrypted content key is then embedded into an encrypted use license with the list of user rights, which is then returned to the RMS client.|

|||
|-|-|
|![](../Image/AzRMS_documentconsumption3.png)|Finally, the RMS client takes the encrypted use license and decrypts it with its own user private key. This lets the RMS client decrypt the document’s body as it is needed and render it on the screen.<br /><br />The client also decrypts the rights list and passes them to the application, which enforces those rights in the application’s user interface.|

#### Variations
The preceding walkthroughs cover the standard scenarios but there are some variations:

-   **Mobile devices**: When mobile devices protect or consume files with Azure RMS, the process flows are much simpler. Mobile devices don’t first go through the user initialization process because instead, each transaction (to protect or consume content) is independent. As with Windows computers, mobile devices connect to the Azure RMS service and authenticate. To protect content, mobile devices submit a policy and Azure RMS sends them a publishing license and symmetric key to protect the document. To consume content, when mobile devices connect to the Azure RMS service and authenticate, they send the document policy to Azure RMS and request a use license to consume the document. In response, Azure RMS sends the necessary keys and restrictions to the mobile devices. Both processes use TLS to protect the key exchange and other communications.

-   **RMS connector**: When Azure RMS is used with the RMS connector, the process flows remain the same. The only difference is that the connector acts as a relay between the on-premises services (such as Exchange Server and SharePoint Server) and Azure RMS. The connector itself does not perform any operations, such as the initialization of the user environment, or encryption or decryption. It simply relays the communication that would usually go to an AD RMS server, handling the translation between the protocols that are used on each side. This scenario lets you use Azure RMS with on-premises services.

-   **Generic protection (.pfile)**: When Azure RMS generically protects a file, the flow is basically the same for content protection except that the RMS client creates a policy that grants all rights. When the file is consumed, it is decrypted before it is passed to the target application. This scenario lets you protect all files, even if they don’t natively support RMS.

-   **Protected PDF (.ppdf)**: When Azure RMS natively protects an Office file, it also creates a copy of that file and protects it in the same way. The only difference is that the file copy is in PPDF file format, which the RMS sharing application knows how to open for viewing only. This scenario lets you send protected attachments via email, knowing that the recipient on a mobile device will always be able to read them even if the mobile device doesn’t have an app that natively supports protected Office files.

## <a name="BKMK_NextSteps"></a>Next steps
To learn more about Azure RMS, use the other topics in the [Getting Started with Azure Rights Management](../Topic/Getting-Started-with-Azure-Rights-Management.md) section, such as [How Applications Support Azure Rights Management](../Topic/How-Applications-Support-Azure-Rights-Management.md) to learn how your existing applications can integrate with Azure RMS to provide an information protection solution. Review [Terminology for Azure Rights Management](../Topic/Terminology-for-Azure-Rights-Management.md) so that you’re familiar with the terms that you might come across as you’re configuring and using Azure RMS, and be sure to also check [Requirements for Azure Rights Management](../Topic/Requirements-for-Azure-Rights-Management.md) before you start your deployment. If you want to dive right in and try it out for yourself, use the [Quick Start Tutorial for Azure Rights Management](../Topic/Quick-Start-Tutorial-for-Azure-Rights-Management.md).

If you’re ready to start deploying Azure RMS for your organization, use the [Azure Rights Management Deployment Roadmap](../Topic/Azure-Rights-Management-Deployment-Roadmap.md) for your deployment steps and links for how-to instructions.

> [!TIP]
> For additional information and help, use the resources and links in [Information and Support for Azure Rights Management](../Topic/Information-and-Support-for-Azure-Rights-Management.md).

## See Also
[Getting Started with Azure Rights Management](../Topic/Getting-Started-with-Azure-Rights-Management.md)

