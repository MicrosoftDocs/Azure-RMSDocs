---
# required metadata

title: Overview of Azure Rights Management protection from Azure Information Protection - AIP
description: Information about Azure Rights Management (Azure RMS), the protection technology used by Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 12/06/2018
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: aeeebcd7-6646-4405-addf-ee1cc74df5df

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# What is Azure Rights Management?

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*


Azure Rights Management (often abbreviated to Azure RMS) is the protection technology used by [Azure Information Protection](what-is-information-protection.md).

This cloud-based protection service uses encryption, identity, and authorization policies to help secure your files and email, and it works across multiple devices—phones, tablets, and PCs. Information can be protected both within your organization and outside your organization because that protection remains with the data, even when it leaves your organization’s boundaries.

As an example, employees might email a document to a partner company, or save a document to their cloud drive. The persistent protection that Azure RMS provides not only helps to secure your company data, but might also be legally mandated for compliance, legal discovery requirements, or simply for good information management practices.

But very importantly, authorized people and services (such as search and indexing) can continue to read and inspect the protected data. This capability is not easily accomplished with other information protection solutions that use peer-to-peer encryption. You might have heard this capability referred to as "reasoning over data" and it is a crucial element in maintaining control of your organization’s data.

The following picture shows how this service offers a protection solution for Office 365, as well as for on-premises servers and services. You also see that protection is supported by the popular end-user devices that run Windows, macOS, iOS, and Android.


![How Azure RMS works](./media/AzRMS_elements.png)

You can use this protection with Office 365 subscriptions as well as with subscriptions for Azure Information Protection. You can find more information about the available subscriptions and which features they support on the [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection/) site.

## Business problems solved by Azure Rights Management

Use the following table to identify business requirements or problems that your organization might have for protecting documents and emails, and how the Azure Rights Management technology can address these.


|Requirement or problem|Solved by Azure RMS|
|--------------------------|-----------------------|
|Protect multiple file types|√ In early implementations of Rights Management, only Office files could be protected, using native Rights Management protection. Now, **generic protection** that was first offered by the Rights Management sharing application and now by the Azure Information Protection client means that more [file types](./rms-client/client-admin-guide-file-types.md) are supported.|
|Protect files anywhere|√ When a file is [protected](./rms-client/client-classify-protect.md), the protection stays with the file, even if it is saved or copied to storage that is not under the control of IT, such as a cloud storage service.|
|Safely share information|√ When a file is [protected](./rms-client/client-classify-protect.md), it is safe to share with others. For example, an attachment to an email or a link to a SharePoint site. If the sensitive information is within an email message, you can protect the email or simply use the Do Not Forward option from Outlook. <br /><br />The benefit of attaching a protected file rather than protecting the whole email message is that the email text is not encrypted, so you can include instructions for first-time use if the email is being sent outside your organization. Anybody can read the instructions but because the attached document is protected, only authorized users will be able to open the document, even if the email or document is forwarded to other people.|
|Auditing and monitoring|√ You can [audit and monitor usage](log-analyze-usage.md) of your protected files, even after these files leave your organization’s boundaries.<br /><br />For example, you work for Contoso, Ltd. You are working on a joint project with three people from Fabrikam, Inc. You email these three people a document that you protect and restrict to read-only. Azure Rights Management auditing can provide the following information:<br /><br />- Whether the people you specified in Fabrikam opened the document, and when.<br /><br />- Whether other people that you didn’t specify attempted (and failed) to open the document—perhaps because it was forwarded or saved to a shared location that others could access.<br /><br />- Whether any of the specified people tried (and failed) to print or change the document.<br /><br />In addition, the [document tracking site](./rms-client/client-track-revoke.md) lets users and administrators track, and if necessary, revoke access to protected documents.|
|Support for commonly used devices, not just Windows computers|√ [Supported devices](./requirements-client-devices.md) include:<br /><br />- Windows computers and phones<br /><br />- Mac computers<br /><br />- iOS tablets and phones<br /><br />- Android tablets and phones|
|Support for business-to-business collaboration|√ Because Azure Rights Management is a cloud service, there’s no need to explicitly configure trusts with other organizations before you can share protected content with them. If they already have an Office 365 or an Azure AD directory, collaboration across organizations is automatically supported. If they do not, users can sign up for the free [RMS for individuals](rms-for-individuals.md) subscription, or use a Microsoft account for [applications that support this authentication for Azure Information Protection](secure-collaboration-documents.md#supported-scenarios-for-opening-protected-documents).|
|Support for on-premises services, as well as Office 365|√  In addition to working [seamlessly with Office 365](office-apps-services-support.md), you can also use Azure Rights Management with the following on-premises services when you deploy the [RMS connector](deploy-rms-connector.md):<br /><br />- Exchange Server<br /><br />- SharePoint Server<br /><br />- Windows Server running File Classification Infrastructure|
|Easy activation|√ For new subscriptions, activation is automatic. For existing subscriptions, [activating the Rights Management service](activate-service.md) requires just a couple of clicks in your management portal. Or, if you prefer command-line control, just two PowerShell commands.|
|Ability to scale across your organization, as needed|√ Because Azure Rights Management runs as a cloud service with the Azure elasticity to scale up and out, you don’t have to provision or deploy additional on-premises servers.|
|Ability to create simple and flexible policies|√ [Customized protection templates](configure-policy-templates.md) provide a quick and easy solution for administrators to apply policies, and for users to apply the correct level of protection for each document and restrict access to people inside your organization.<br /><br />For example, for a company-wide strategy paper to be shared with all employees, you could apply a read-only policy to all internal employees. Then, for a more sensitive document, such as a financial report, you could restrict access to executives only.|
|Broad application support|√ Azure Rights Management has tight integration with Microsoft Office applications and services, and extends support for other applications by using the [Azure Information Protection client](./rms-client/aip-client.md ).<br /><br />√ The [Azure Information Protection SDKs](./develop/developers-guide.md) provide your internal developers and software vendors with APIs to write custom applications that support Azure Information Protection.<br /><br />For more information, see [Other applications that support the Rights Management APIs](api-support.md).|
|IT must maintain control of data|√ Organizations can choose to manage their own tenant key and use the “[Bring Your Own Key](plan-implement-tenant-key.md)” (BYOK) solution and store their tenant key in Hardware Security Modules (HSMs).<br /><br />√ Support for auditing and [usage logging](log-analyze-usage.md) so that you can analyze for business insights, monitor for abuse, and (if you have an information leak) perform forensic analysis.<br /><br />√ Delegated access by using the [super user feature](configure-super-users.md) ensures that IT can always access protected content, even if a document was protected by an employee who then leaves the organization. In comparison, peer-to-peer encryption solutions risk losing access to company data.<br /><br />√ Synchronize [just the directory attributes that Azure RMS needs](/azure/active-directory/hybrid/reference-connect-sync-attributes-synchronized#azure-rms) to support a common identity for your on-premises Active Directory accounts, by using [a hybrid identity solution](/azure/active-directory/hybrid/), such as Azure AD Connect.<br /><br />√ Enable single-sign on without replicating passwords to the cloud, by using AD FS.<br /><br />√ Organizations always have the choice to stop using the Azure Rights Management service without losing access to content that was previously protected by Azure Rights Management. For information about decommissioning options, see [Decommissioning and deactivating Azure Rights Management](decommission-deactivate.md). In addition, organizations who have deployed Active Directory Rights Management Services (AD RMS) can [migrate to the Azure Rights Management service](migrate-from-ad-rms-to-azure-rms.md) without losing access to data that was previously protected by AD RMS.|
> [!TIP]
> If you are familiar with the on-premises version of Rights Management, Active Directory Rights Management Services (AD RMS), you might be interested in the comparison table from [Comparing Azure Rights Management and AD RMS](compare-on-premise.md).

## Security, compliance, and regulatory requirements
Azure Rights Management supports the following security, compliance and regulatory requirements:

√ Use of industry-standard cryptography and supports FIPS 140-2. For more information, see the [Cryptographic controls used by Azure RMS: Algorithms and key lengths](how-does-it-work.md#cryptographic-controls-used-by-azure-rms-algorithms-and-key-lengths) information.

√ Support for Thales Hardware Security Modules (HSMs) to store your tenant key in Microsoft Azure data centers. Azure Rights Management uses separate security worlds for its data centers in North America, EMEA (Europe, Middle East and Africa), and Asia, so your keys can be used only in your region.

√ Certified for the following:

-   ISO/IEC 27001:2013 (./includes [ISO/IEC 27018](https://azure.microsoft.com/blog/2015/02/16/azure-first-cloud-computing-platform-to-conform-to-isoiec-27018-only-international-set-of-privacy-controls-in-the-cloud/))

-   SOC 2 SSAE 16/ISAE 3402 attestations

-   HIPAA BAA

-   EU Model Clause

-   FedRAMP as part of Azure Active Directory in Office 365 certification, issued FedRAMP Agency Authority to Operate by HHS

-   PCI DSS Level 1

For more information about these external certifications, see the [Azure Trust Center](https://azure.microsoft.com/support/trust-center/compliance/).

## Next steps

For more technical information about how the Azure Rights Management service works, see [How does Azure RMS work?](how-does-it-work.md)

