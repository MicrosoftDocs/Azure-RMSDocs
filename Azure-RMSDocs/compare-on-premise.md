---
# required metadata

title: Compare Azure Information Protection & AD RMS - AIP
description: If you know or have previously deployed Active Directory Rights Management Services (AD RMS), you might be wondering how Azure Information Protection compares in terms of functionality and requirements. 
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 11/08/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 8123bd62-1814-4d79-b306-e20c1a00e264

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Comparing Azure Information Protection and AD RMS

[!INCLUDE [looking-for-mip](includes/looking-for-mip.md)]

If you know or have previously deployed Active Directory Rights Management Services (AD RMS), you might be wondering how Azure Information Protection compares in terms of functionality and requirements as an information protection solution.

Some of the main differences for Azure Information Protection include:



| Difference  | Description  |
|---------|---------|
|**No server infrastructure required**     |  Azure Information Protection doesn't require the extra servers and PKI certificates that AD RMS needs, because Microsoft Azure takes care of those requirements for you. <br><br>That makes this cloud solution quicker to deploy and easier to maintain.       |
|**Cloud-based authentication**     |  Azure Information Protection uses Microsoft Entra ID for authentication - for both internal users and users from other organizations. <br><br>That means your users can be authenticated even when they aren't connected to your internal network and it's easier to share protected content with users from other organizations. <br><br>Many organizations already have user accounts in Microsoft Entra ID because they're running Azure services or have Microsoft 365. But if not, RMS for individuals lets users create a free account, or a Microsoft account can be used for [applications that support this authentication for Azure Information Protection](/previous-versions/azure/information-protection/secure-collaboration-documents#supported-scenarios-for-opening-protected-documents). <br><br>In comparison, to share AD RMS protected content with another organization, you must configure explicit trusts with each organization.       |
|**Built-in support for mobile devices**     | No deployment changes are needed for Azure Information Protection to support mobile devices and Mac computers. <br><br>To support these devices with AD RMS, you must install the mobile device extension, configure AD FS for federation, and create extra records for your public DNS service.        |
|**Default templates**     |  Azure Information Protection automatically creates default templates that restrict access of the content to your own organization. These templates make it easy to start protecting sensitive data immediately. <br><br>There are no default templates for AD RMS.       |
|**Departmental templates**     | Also known as scoped templates. Azure Information Protection supports departmental templates for additional templates that you create. <br><br>This configuration lets you specify a subset of users to see specific templates in their client applications. Limiting the number of templates that users see makes it easier for them to select the correct policy that you define for different groups of users. <br><br>AD RMS doesn't support departmental templates.        |
|**Document tracking and revocation**     |  Azure Information Protection supports these features with the Rights Management Service only <!--for vihita: while AD RMS does not at all.-->       |
|**Classification and labeling**     | Azure Information Protection supports labels that apply classification, and optionally, protection. <br><br>Use the AIP client to integrate classification and labeling with Office applications, File Explorer, PowerShell, and a scanner for on-premises data stores. <br><br>   AD RMS does not support these classification and labeling capabilities.        |

In addition, because Azure Information Protection is a cloud service, it can deliver new features and fixes more quickly than an on-premises server-based solution. There are no new features planned for AD RMS in Windows Server.


### Detailed comparison between AIP and AD RMS

For more details, use the following table for a side-by-side comparison. 

If you have security-specific comparison questions, see the [Cryptographic controls for signing and encryption](#cryptographic-controls-for-signing-and-encryption) section in this article.


|Difference|Azure Information Protection|AD RMS|
|----------|-----------------------------------------------------------------------------------------|--------------------------------------------------------|
| **Information Rights Management (IRM)**|Supports IRM capabilities in both Microsoft Online services and on-premises Microsoft server products.|Supports IRM capabilities for on-premises Microsoft server products, and Exchange Online.|
| **Secure collaboration**|Automatically enables secure collaboration on documents with any organization that also uses Microsoft Entra ID for authentication.|Secure collaboration on documents outside the organization requires authentication trusts to be explicitly defined in a direct point-to-point relationship between two organizations. <br><br>You must configure either trusted user domains (TUDs) or federated trusts that you create by using Active Directory Federation Services (AD FS).|
| **Protected emails**|Send a protected email (optionally, with Office document attachments that are automatically protected) to users when no authentication trust relationship exists. <br><br>This scenario is made possible by using federation with social providers or a one-time passcode and web browser for viewing.|Does not support sending protected email when no authentication trust relationship exists.|
| **Client support**|Supports the AIP unified labeling client.<!--need vihita on this one for both protection and consumption activities.--> |Supports the AIP unified labeling client for consumption only, and requires that you install the [Active Directory Rights Management Services Mobile Device Extension](./active-directory-rights-manage-mobile-device.md). |
| **Multi-factor authentication (MFA)**|Supports MFA for computers and mobile devices.<br /><br />For more information, see the [Multi-factor authentication (MFA) and Azure Information Protection](./requirements-azure-ad.md#multi-factor-authentication-mfa-and-azure-information-protection).|Supports smart card authentication if IIS is configured to request certificates.|
| **Cryptographic Mode**|Supports Cryptographic Mode 2 by default, to provide a recommended level of security for key lengths and encryption algorithms.|Supports Cryptographic Mode 1 by default, and requires extra configuration to support Cryptographic Mode 2 for a recommended level of security.<br /><br />For more information, see [AD RMS Cryptographic Modes](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/hh867439(v=ws.10)).|
| **Licensing**|Requires an Azure Information Protection license or Azure Rights Management license with Microsoft 365 to protect content. <br /><br />No license is required to consume content that has been protected by AIP (includes users from another organization).|Requires an RMS license to protect content, and to consume  content that has been protected by AD RMS.<br /><br />For more information about licensing, see [Client Access Licenses and Management Licenses](https://www.microsoft.com/Licensing/product-licensing/client-access-license.aspx) for general information, but contact your Microsoft partner or Microsoft representative for specific information.|

## Cryptographic controls for signing and encryption
Azure Information Protection by default, uses RSA 2048 for all public key cryptography and SHA 256 for signing operations. In comparison, AD RMS supports RSA 1024 and RSA 2048, and SHA 1 or SHA 256 for signing operations.

Both Azure Information Protection and AD RMS use AES 128 for symmetric encryption.

Azure Information Protection is compliant with FIPS 140-2 when your tenant key size is 2048 bits, which is the default when the Azure Rights Management service is activated. 

For more information about the cryptographic controls, see [Cryptographic controls used by Azure RMS: Algorithms and key length](how-does-it-work.md#cryptographic-controls-used-by-azure-rms-algorithms-and-key-lengths).


## Next steps
For more detailed requirements to use Azure Information Protection, such as device support and minimum versions, see [Requirements for Azure Information Protection](requirements.md).

If you're looking to migrate from AD RMS to Azure Information Protection, see [Migrating from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md).

Get started with [Active Directory Rights Management Services Mobile Device Extension](./active-directory-rights-manage-mobile-device.md). 

