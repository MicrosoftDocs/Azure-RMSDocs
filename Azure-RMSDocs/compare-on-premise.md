---
# required metadata

title: Compare Azure Information Protection & AD RMS - AIP
description: If you know or have previously deployed Active Directory Rights Management Services (AD RMS), you might be wondering how Azure Information Protection compares in terms of functionality and requirements. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 12/12/2018
ms.topic: conceptual
ms.service: information-protection
ms.assetid: 8123bd62-1814-4d79-b306-e20c1a00e264

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Comparing Azure Information Protection and AD RMS

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

If you know or have previously deployed Active Directory Rights Management Services (AD RMS), you might be wondering how Azure Information Protection compares in terms of functionality and requirements as an information protection solution.

Some of the main differences for Azure Information Protection:

- **No server infrastructure required**: Azure Information Protection doesn't require the additional servers and PKI certificates that AD RMS needs, because Microsoft Azure takes care of those for you. That makes this cloud solution quicker to deploy and easier to maintain.

- **Cloud-based authentication**: Azure Information Protection uses Azure AD for authentication - for both internal users and users from other organizations. That means your mobile users can be authenticated even when they are not connected to your internal network and it is easier to share protected content with users from other organizations. Many organizations already have user accounts in Azure AD because they are running Azure services or have Office 365. But if not, RMS for individuals lets users create a free account, or a Microsoft account can be used for [applications that support this authentication for Azure Information Protection](secure-collaboration-documents.md#supported-scenarios-for-opening-protected-documents). To share AD RMS protected content with another organization requires you to configure explicit trusts with each organization.

- **Built-in support for mobile devices**: No deployment changes are needed for Azure RMS to support mobile devices and Mac computers. To support these devices with AD RMS, you must install the mobile device extension, configure AD FS for federation, and create additional records for your public DNS service.

- **Default templates**: Azure Information Protection creates default templates as soon as the protection service is activated, which makes it easy to start protecting important data immediately. There are no default templates for AD RMS.

- **Departmental templates**: Also known as scoped templates. Azure Information Protection supports departmental templates for additional templates that you create. This configuration lets you specify a subset of users to see specific templates in their client applications. Limiting the number of templates that users see makes it easier for them to select the correct policy that you define for different groups of users. AD RMS doesn't support departmental templates.

- **Document tracking and revocation**: Azure Information Protection supports these features with the Azure Information Protection client, whereas AD RMS does not.

- **Classification and labeling**: Azure Information Protection supports these features with the Azure Information Protection client that integrates with Office applications and File Explorer, whereas AD RMS does not. 


In addition, because Azure Information Protection is a cloud service, it can deliver new features and fixes more quickly than an on-premises server-based solution. There are no new features planned for AD RMS in Windows Server.

For more details and other differences, use the following table for a side-by-side comparison of the features and benefits of Azure Information Protection and AD RMS. If you have security-specific comparison questions, see the [Cryptographic controls for signing and encryption](#cryptographic-controls-for-signing-and-encryption) section in this article.

> [!NOTE]
> To make this comparison easier, some information here is repeated from [Requirements for Azure Information Protecion](requirements.md). Use that source for more specific support and version information for Azure Rights Management.

|Azure Information Protection|AD RMS|
|-----------------------------------------------------------------------------------------|--------------------------------------------------------|
|Supports information rights management (IRM) capabilities in Microsoft Online services such as Exchange Online and SharePoint Online, as well as Office 365.<br /><br />Also supports on-premises Microsoft server products, such as Exchange Server, SharePoint Server, and file servers that run Windows Server and File Classification Infrastructure (FCI).|Supports on-premises Microsoft server products such as Exchange Server, SharePoint Server, and file servers that run Windows Server and File Classification Infrastructure (FCI).|
|Automatically enables secure collaboration on documents with any organization that also uses Azure AD for authentication. This means that organizations can protect documents that they share internally or with other organizations.|Secure collaboration on documents outside the organization requires authentication trusts to be explicitly defined in a direct point-to-point relationship between two organizations. You must configure either trusted user domains (TUDs) or federated trusts that you create by using Active Directory Federation Services (AD FS).|
|Send a protected email (optionally, with Office document attachments that are automatically protected) to users when no authentication trust relationship exists. This scenario is made possible by using federation with social providers or a one-time passcode and web browser for viewing.|Does not support sending protected email when no authentication trust relationship exists.|
|Provides two default rights policy templates that restrict access of the content to your own organization; one that provides read-only viewing of protected content and another template that provides write or modify permissions for the protected content.<br /><br />You can also create your own custom templates, which include departmental templates that are visible to only a subset of users. For more information, see [Configuring and managing templates for Azure Information Protection](configure-policy-templates.md).<br /><br />In addition, users can define their own set of permissions if the templates are not sufficient.|There are no default templates; you must create and then distribute your own templates. For more information, see [AD RMS Policy Template Considerations](https://go.microsoft.com/fwlink/?LinkId=154765).<br /><br />In addition, users can define their own set of permissions if the templates are not sufficient.|
|Minimum supported version of Microsoft Office is Office 2010, which requires the [Azure Information Protection client](./rms-client/aip-client.md) or the RMS sharing application.<br /><br />Microsoft Office for Mac:<br /><br />- Microsoft Office for Mac 2016: Supported|Minimum supported version of Microsoft Office is Office 2010.<br /><br />Microsoft Office for Mac:<br /><br />- Microsoft Office for Mac 2016: Supported|
|Supports the [Azure Information Protection client](./rms-client/aip-client.md) for Windows, iOS, and Android. Mac computers and Windows Phone continue to be supported by the RMS sharing app.<br /><br />In addition, the Azure Information Protection client supports the following:<br /><br />- Sharing with people in another organization.<br /><br />- A document tracking site for users, which includes the ability to revoke a document.|Supports the [Azure Information Protection client](./rms-client/aip-client.md) for Windows, iOS, and Android. Mac computers and Windows Phone continues to be supported by the RMS sharing app. However, sharing does not support sharing with people in another organization or the document tracking site and the ability for users to revoke documents.|
|Most [file types](./rms-client/client-admin-guide-file-types.md) can be classified and protected when you use the Azure Information Protection client.<br /><br />For other applications, check the table in [Applications that support Azure Rights Management data protection](./requirements-applications.md).|Most [file types](./rms-client/client-admin-guide-file-types.md) can be protected when you use the Azure Information Protection client.<br /><br />For other applications, check the table in [Applications that support Azure Rights Management data protection](./requirements-applications.md).|
|Minimum supported version of the Windows client is Windows 7 SP1.|Minimum supported version of the Windows client is Windows 7 SP1.|
|Mobile device support includes Windows Phone, Android, iOS, and Windows RT.<br /><br />Email support by using Exchange ActiveSync IRM is also supported on all mobile device platforms that support this protocol.|Mobile device support includes Windows Phone, Android, iOS, and Windows RT, and requires the [Active Directory Rights Management Services Mobile Device Extension](https://technet.microsoft.com/library/dn673574.aspx).<br /><br />Email support by using Exchange ActiveSync IRM is supported on all mobile device platforms that support this protocol.|
|Supports multi-factor authentication (MFA) for computers and mobile devices.<br /><br />For more information, see the [Multi-factor authentication (MFA) and Azure Information Protection](./requirements-azure-ad.md#multi-factor-authentication-mfa-and-azure-information-protection).|Supports smart card authentication if IIS is configured to request certificates.|
|Supports Cryptographic Mode 2 without additional configuration, which provides stronger security for key lengths and encryption algorithms.<br /><br />For more information, see the [Cryptographic controls for signing and encryption](#cryptographic-controls-for-signing-and-encryption) section in this article, and [AD RMS Cryptographic Modes](https://go.microsoft.com/fwlink/?LinkId=266659).|Supports Cryptographic Mode 1 by default and requires additional configuration to support Cryptographic Mode 2 for stronger security.<br /><br />For more information, see the [Cryptographic controls for signing and encryption](#cryptographic-controls-for-signing-and-encryption) section in this article, and [AD RMS Cryptographic Modes](https://go.microsoft.com/fwlink/?LinkId=266659).|
|Supports migration from AD RMS and if required, to AD RMS:<br /><br />- [Migrating from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md)<br /><br />- [Decommissioning and deactivating Azure Information Protection](decommission-deactivate.md)|Supports migration from Azure Information Protection and to Azure Information Protection:<br /><br />- [Decommissioning and deactivating Azure Rights Management](decommission-deactivate.md)<br /><br />- [Migrating from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md)|
|Requires an Azure Information Protection license or Azure Rights Management license with  Office 365 to protect content. No license is required to consume content that has been protected by Azure Information Protection (includes users from another organization).<br /><br />For more information, see the [feature list](https://www.microsoft.com/cloud-platform/azure-information-protection-features) from the Azure Information Protection site.|Requires an RMS license to protect content, and to consume  content that has been protected by AD RMS.<br /><br />For more information about licensing for AD RMS, see [Client Access Licenses and Management Licenses](https://www.microsoft.com/en-us/Licensing/product-licensing/client-access-license.aspx) for general information, but contact your Microsoft partner or Microsoft representative for specific information.|

## Cryptographic controls for signing and encryption
Azure Information Protection by default, uses RSA 2048 for all public key cryptography and SHA 256 for signing operations. In comparison, AD RMS supports RSA 1024 and RSA 2048, and SHA 1 or SHA 256 for signing operations.

Both Azure Information Protection and AD RMS use AES 128 for symmetric encryption.

Azure Information Protection is compliant with FIPS 140-2 when your tenant key size is 2048 bits, which is the default when the Azure Rights Management service is activated. 

For more information about the cryptographic controls, see [Cryptographic controls used by Azure RMS: Algorithms and key length](how-does-it-work.md#cryptographic-controls-used-by-azure-rms-algorithms-and-key-lengths).


## Next steps
If you are looking to migrate from AD RMS to Azure Information Protection, see [Migrating from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md)


