---
# required metadata

title: What is Azure Rights Management? - AIP
description: Information about Azure Rights Management (Azure RMS), the protection technology used by Azure Information Protection.
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 02/22/2021
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: aeeebcd7-6646-4405-addf-ee1cc74df5df

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: azurerms
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin
search.appverid:
- MET150

---

# What is Azure Rights Management?



Azure Rights Management (Azure RMS) is the cloud-based protection technology used by [Azure Information Protection](what-is-information-protection.md). 

Azure RMS helps to [protect](./rms-client/clientv2-classify-protect.md) files and emails across multiple devices, including phones, tablets, and PCs by using encryption, identity, and authorization policies.

For example, when employees email a document to a partner company, or save a document to their cloud drive, Azure RMS's persistent protection helps secure the data.

- **Protection settings remain with your data**, even when it leaves your organization's boundaries, keeping your content protected both within and outside your organization.

- **Azure RMS may be legally required** for compliance, legal discovery requirements, or best practices for information management.

- **Use Azure RMS with Microsoft 365 subscriptions or subscriptions for Azure Information Protection**. For more information, see the [Microsoft 365 licensing guidance for security & compliance](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection/) page.

Azure RMS ensures that authorized people and services, such as search and indexing, can continue to read and inspect the protected data.

Ensuring ongoing access for authorized people and services, also known as "reasoning over data", is a crucial element in maintaining control of your organization's data. This capability may not be easily accomplished with other information protection solutions that use peer-to-peer encryption.
## Protection features

|Feature  |Description  |
|---------|---------|
|**Protect multiple file types**     | In early implementations of Rights Management, only Office files could be protected, using built-in Rights Management protection. </br></br>Azure Information Protection provides support for additional file types. For more information, see [Supported file types](rms-client/clientv2-admin-guide-file-types.md).         |
|**Protect files anywhere** | When a file is [protected](./rms-client/clientv2-classify-protect.md), the protection stays with the file, even if it is saved or copied to storage that is not under the control of IT, such as a cloud storage service.|

## Collaboration features

|Feature  |Description  |
|---------|---------|
|**Safely share information**     |  [Protected files](./rms-client/clientv2-classify-protect.md) are safe to share with others, such as an attachment to an email or a link to a SharePoint site. </br></br> If the sensitive information is within an email message, protect the email, or use the **Do Not Forward** option from Outlook.       |
|**Support for business-to-business collaboration**     |  Because Azure Rights Management is a cloud service, there’s no need to explicitly configure trusts with other organizations before you can share protected content with them. </br></br>Collaboration with other organizations that already have a Microsoft 365 or a Microsoft Entra directory is automatically supported. </br></br>For organizations without Microsoft 365 or a Microsoft Entra directory, users can sign up for the free [RMS for individuals](rms-for-individuals.md) subscription, or use a Microsoft account for [supported applications](/previous-versions/azure/information-protection/secure-collaboration-documents#supported-scenarios-for-opening-protected-documents).       |

> [!TIP]
> Attaching protected files, rather than protecting an entire email message, enables you to keep the email text un-encrypted. 
>
> For example, you may want to include instructions for first-time use if the email is being sent outside your organization. If you attach a protected file, the basic instructions can be read by anyone, but only authorized users will be able to open the document, even if the email or document is forwarded to other people.

## Platform support features

Azure RMS supports a broad range of platforms and applications, including:

|Feature  |Description  |
|---------|---------|
|**Commonly used devices** </br>not just Windows computers     | Client devices include: </br></br>- Windows computers and phones </br>- Mac computers </br>- iOS tablets and phones </br>- Android tablets and phones        |
|**On-premises services**     | In addition to working [seamlessly with Office 365](office-apps-services-support.md), use Azure Rights Management with the following on-premises services when you deploy the [RMS connector](deploy-rms-connector.md): </br></br>- Exchange Server </br>- SharePoint Server </br>- Windows Server running File Classification Infrastructure        |
|**Application extensibility**     |Azure Rights Management has tight integration with Microsoft Office applications and services, and extends support for other applications by using the [Azure Information Protection client](./rms-client/use-client.md ). </br></br>The [Microsoft Information Protection SDK](/information-protection/develop/) provide your internal developers and software vendors with APIs to write custom applications that support Azure Information Protection. </br></br>For more information, see [Other applications that support the Rights Management APIs](api-support.md).         |

## Infrastructure features

Azure RMS provides the following features to support IT departments and infrastructure organizations:

- [Create simple and flexible policies](#create-simple-and-flexible-policies)
- [Easy activation](#easy-activation)
- [Auditing and monitoring services](#auditing-and-monitoring-services)
- [Ability to scale across your organization](#ability-to-scale-across-your-organization)
- [Maintain IT control over data](#maintain-it-control-over-data)

> [!NOTE]
> Organizations always have the choice to stop using the Azure Rights Management service without losing access to content that was previously protected by Azure Rights Management. 
> 
> For more information, see  [Decommissioning and deactivating Azure Rights Management](decommission-deactivate.md). 
> 

#### Create simple and flexible policies

Customized protection templates provide a quick and easy solution for administrators to apply policies, and for users to apply the correct level of protection for each document and restrict access to people inside your organization. 

For example, for a company-wide strategy paper to be shared with all employees, apply a read-only policy to all internal employees. For a more sensitive document, such as a financial report, restrict access to executives only.

Configure your labeling policies in the Microsoft Purview compliance portal. For more information, see the [sensitivity labeling documentation for Microsoft 365](/microsoft-365/compliance/sensitivity-labels#what-label-policies-can-do).        


#### Easy activation

For new subscriptions, activation is automatic. For existing subscriptions, [activating the Rights Management service](activate-service.md) requires just a couple of clicks in your management portal, or two PowerShell commands.

#### Auditing and monitoring services

[Audit and monitor usage](log-analyze-usage.md) of your protected files, even after these files leave your organization’s boundaries. 

For example, if a Contoso, Ltd employee works on a joint project with three people from Fabrikam, Inc, they might send their Fabrikam partners a document that's protected and restricted to *read-only*. 

Azure RMS auditing can provide the following information:

- Whether the Fabrikam partners opened the document, and when. 

- Whether other people, who were not specified, attempted, and failed to open the document. This might happen if the email was forwarded on, or saved to a shared location.

AIP administrators can [track document usage and revoke access](rms-client/track-and-revoke-admin.md) for Office files. Users can [revoke access](rms-client/revoke-access-user.md) for their protected documents as needed.

#### Ability to scale across your organization

Because Azure Rights Management runs as a cloud service with the Azure elasticity to scale up and out, you don’t have to provision or deploy additional on-premises servers.

#### Maintain IT control over data

Organizations can benefit from IT control features, such as:

|Feature  |Description  |
|---------|---------|
|**Tenant key management**    | Use tenant key management solutions, such as Bring Your Own Key (BYOK) or Double Key Encryption (DKE). <br><br>For more information about, see: <br>- [Planning and implementing your AIP tenant key](plan-implement-tenant-key.md) <br>- [DKE in the Microsoft 365 documentation](/microsoft-365/compliance/double-key-encryption).|
|**Auditing and usage logging**    |   Use auditing and [usage logging](log-analyze-usage.md) features to analyze for business insights, monitor for abuse, and perform forensic analysis for information leaks.      |
|**Access delegation**     |  Delegate access with the [super user feature](/purview/encryption-super-users), ensuring that IT can always access protected content, even if a document was protected by an employee who then leaves the organization. </br> In comparison, peer-to-peer encryption solutions risk losing access to company data.       |
|**Active Directory synchronization**     |   Synchronize [just the directory attributes that Azure RMS needs](/azure/active-directory/hybrid/reference-connect-sync-attributes-synchronized#azure-rms) to support a common identity for your on-premises Active Directory accounts, by using [a hybrid identity solution](/azure/active-directory/hybrid/), such as Microsoft Entra Connect.      |
|**Single-sign on**     | Enable single-sign on without replicating passwords to the cloud, by using AD FS.        |
|**Migration from AD RMS** |If you've deployed Active Directory Rights Management Services (AD RMS), [migrate to the Azure Rights Management service](migrate-from-ad-rms-to-azure-rms.md) without losing access to data that was previously protected by AD RMS. |

## Security, compliance, and regulatory requirements
Azure Rights Management supports the following security, compliance, and regulatory requirements:

- **Use of industry-standard cryptography and supports FIPS 140-2.** For more information, see the [Cryptographic controls used by Azure RMS: Algorithms and key lengths](how-does-it-work.md#cryptographic-controls-used-by-azure-rms-algorithms-and-key-lengths) information.

- **Support for nCipher nShield hardware security module (HSM)** to store your tenant key in Microsoft Azure data centers. 

    Azure Rights Management uses separate security worlds for its data centers in North America, EMEA (Europe, Middle East and Africa), and Asia, so your keys can be used only in your region.

- **Certification for the following standards**:

    -   ISO/IEC 27001:2013 (./includes ISO/IEC 27018)
    -   SOC 2 SSAE 16/ISAE 3402 attestations
    -   HIPAA BAA
    -   EU Model Clause
    -   FedRAMP as part of Microsoft Entra ID in Office 365 certification, issued FedRAMP Agency Authority to Operate by HHS
    -   PCI DSS Level 1

For more information about these external certifications, see the [Azure Trust Center](https://azure.microsoft.com/support/trust-center/compliance/).


## Next steps

For more technical information about how the Azure Rights Management service works, see [How does Azure RMS work?](how-does-it-work.md)

If you are familiar with the on-premises version of Rights Management, Active Directory Rights Management Services (AD RMS), you might be interested in the comparison table from [Comparing Azure Rights Management and AD RMS](compare-on-premise.md).
