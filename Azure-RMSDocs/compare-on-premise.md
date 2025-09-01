---
# required metadata

title: Compare the Azure Rights Management service with & AD RMS
description: Compare the Azure Rights Management service from Microsoft Purview Information Protection with the older on-premises version, Active Directory Rights Management Services (AD RMS). 
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 01/09/2025
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 8123bd62-1814-4d79-b306-e20c1a00e264

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer:
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Comparing the Azure Rights Management service and AD RMS

[!INCLUDE [looking-for-mip](includes/looking-for-mip.md)]

If you know or have previously deployed Active Directory Rights Management Services (AD RMS), you might be wondering how the [Azure Rights Management service](/purview/azure-rights-management-learn-about) from Microsoft Purview Information Protection compares in terms of functionality and requirements as an information protection solution.

Some of the main differences for the Azure Rights Management service include:

|Difference  |Description |
|------------|------------|
|**No server infrastructure required** |  The Azure Rights Management service doesn't require the extra servers and PKI certificates that AD RMS needs, because Microsoft Azure takes care of those requirements for you. <br><br>That makes this cloud solution quicker to deploy and easier to maintain.       |
|**Cloud-based authentication** |  The Azure Rights Management service uses Microsoft Entra ID for authentication - for both internal users and users from other organizations. <br><br>That means your users can be authenticated even when they aren't connected to your internal network and it's easier to share encrypted content with users from other organizations. <br><br>Many organizations already have user accounts in Microsoft Entra ID because they're running Azure services or have Microsoft 365. But if not, a Microsoft account or RMS for individuals lets users create a free account for authentication. <br><br>In comparison, to share AD RMS protected content with another organization, you must configure explicit trusts with each organization.       |
|**Built-in support for mobile devices** | No deployment changes are needed for the Azure Rights Management service to support mobile devices and Mac computers. <br><br>To support these devices with AD RMS, you must install the mobile device extension, configure Active Directory Federation Services (AD FS) for federation, and create extra records for your public DNS service.        |
|**Default templates** |  The Azure Rights Management service automatically creates default templates that restrict access of the content to your own organization. These templates make it easy to start protecting sensitive data immediately. <br><br>There are no default templates for AD RMS.       |
|**Document tracking and revocation** | Only the Azure Rights Management service supports [these features](/purview/track-and-revoke-admin).|
|**Classification and labeling** | The Azure Rights Management service supports [sensitivity labels](/purview/sensitivity-labels) that apply classification, and optionally, protection actions such as encryption and visual markings. <br><br>Sensitivity labels are built into Microsoft 365 apps and services with no additional installation required. Optionally, use the [Microsoft Purview Information Protection client](/purview/information-protection-client) to extend labels to all file types, use PowerShell for automation, and a scanner for on-premises data stores. <br><br>   AD RMS does not support these classification and labeling capabilities. |

In addition, because the Azure Rights Management service is a cloud service, it can deliver new features and fixes more quickly than an on-premises server-based solution. There aren't any new features planned for AD RMS in Windows Server.


### Detailed comparison between AIP and AD RMS

For more details, use the following table for a side-by-side comparison. 

If you have security-specific comparison questions, see the [Cryptographic controls for signing and encryption](#cryptographic-controls-for-signing-and-encryption) section in this article.


|Difference|Rights Management service|AD RMS|
|----------|-------------------------|------|
|**Information Rights Management (IRM)**|Supports IRM capabilities in both Microsoft Online services and on-premises Microsoft server products.|Supports IRM capabilities for on-premises Microsoft server products, and Exchange Online.|
|**Secure collaboration**|Automatically enables secure collaboration on documents with any organization that also uses Microsoft Entra ID for authentication.|Secure collaboration on documents outside the organization requires authentication trusts to be explicitly defined in a direct point-to-point relationship between two organizations. <br><br>You must configure either trusted user domains (TUDs) or federated trusts that you create by using Active Directory Federation Services (AD FS).|
|**Encrypted emails**|Send an encrypted email (optionally, with Office and PDF document attachments that are automatically encrypted) to users when no authentication trust relationship exists. <br><br>This scenario is made possible by using federation with social providers or a one-time passcode and web browser for viewing.|Doesn't support sending encrypted email when no authentication trust relationship exists.|
<! -- leave or update? -->| **Client support**|Supports the AIP unified labeling client.|Supports the AIP unified labeling client for consumption only, and requires that you install the [Active Directory Rights Management Services Mobile Device Extension](./active-directory-rights-manage-mobile-device.md). |-->
| **Multifactor authentication (MFA)**|Supports MFA for computers and mobile devices.<br /><br />For more information, see the [Multifactor authentication (MFA)](/purview/rights-management-requirements#multifactor-authentication-mfa).|Supports smart card authentication if IIS is configured to request certificates.|
| **Cryptographic Mode**|Supports Cryptographic Mode 2 by default, to provide a recommended level of security for key lengths and encryption algorithms.|Supports Cryptographic Mode 1 by default, and requires extra configuration to support Cryptographic Mode 2 for a recommended level of security.<br /><br />For more information, see [AD RMS Cryptographic Modes](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/hh867439(v=ws.10)).|
| **Licensing**|Requires a license for Microsoft Purview Information Protection with Microsoft 365 to encrypt content. <br /><br />No license is required to consume content that has been protected by the Azure Rights Management service (includes users from another organization).|Requires an RMS license to encrypt content, and to consume content that has been encrypted by AD RMS.<br /><br />For more information about licensing, see [Client Access Licenses and Management Licenses](https://www.microsoft.com/Licensing/product-licensing/client-access-license.aspx) for general information, but contact your Microsoft partner or Microsoft representative for specific information.|

## Cryptographic controls for signing and encryption
The Azure Rights Management service by default, uses RSA 2048 for all public key cryptography and SHA 256 for signing operations. In comparison, AD RMS supports RSA 1024 and RSA 2048, and SHA 1 or SHA 256 for signing operations.

Both the Azure Rights Management service and AD RMS use AES 128 for symmetric encryption.

The Azure Rights Management service is compliant with FIPS 140-2 when your tenant key size is 2048 bits, which is the default when the service is activated. 

For more information about the cryptographic controls, see [Cryptographic controls: Algorithms and key lengths](/purview/rights-management-how-does-it-work#cryptographic-controls-algorithms-and-key-lengths).


## Next steps
For more detailed requirements to use the Azure Rights Management service, see [Requirements for the Azure Rights Management service](/purview/rights-management-requirements).

If you're looking to migrate from AD RMS to Azure Information Protection, see [Migrating from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md).
