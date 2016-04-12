---
# required metadata

title: Comparing Azure Rights Management and AD RMS | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
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

# Comparing Azure Rights Management and AD RMS
If you know or have previously deployed Active Directory Rights Management Services (AD RMS), you might be wondering how [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] (Azure RMS) compares in terms of functionality and requirements. Use the following table for a side-by-side comparison of the features and benefits of Azure RMS and AD RMS. If you have security-specific comparison questions, see the [Cryptographic controls for signing and encryption](comparing-azure-rights-management-and-ad-rms.md#cryptographic-controls-for-signing-and-encryption) section in this article.

> [!NOTE]
> To make this comparison easier, some information here is repeated from [Requirements for Azure Rights Management](../get-started/requirements-for-azure-rights-management.md). Use that article for more specific support and version information for [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)].

|Azure RMS|AD RMS|
|-----------------------------------------------------------------------------------------|--------------------------------------------------------|
|Supports information rights management (IRM) capabilities in Microsoft Online services such as Exchange Online and SharePoint Online, as well as Office 365.<br /><br />Also supports on-premises Microsoft server products, such as Exchange Server, SharePoint Server, and file servers that run Windows Server and File Classification Infrastructure (FCI).|Supports on-premises Microsoft server products such as Exchange Server, SharePoint Server, and file servers that run Windows Server and File Classification Infrastructure (FCI).|
|Enables implicit trust between organizations and users in any organization. This means that protected content can be shared between users within the same organization or across organizations when users have [!INCLUDE[o365_1](../includes/o365_1_md.md)], or [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)], or users sign up for RMS for individuals.|Trusts must be explicitly defined in a direct point-to-point relationship between two organizations by using either trusted user domains (TUDs) or federated trusts that you create by using Active Directory Federation Services (AD FS).|
|Provides two default rights policy templates that restrict access of the content to your own organization; one that provides read-only viewing of protected content and another template that provides write or modify permissions for the protected content.<br /><br />You can also create your own custom templates, which includes departmental templates that are visible to only a subset of users. For more information, see [Configuring custom templates for Azure Rights Management](../deploy-use/configuring-custom-templates-for-azure-rights-management.md).<br /><br />In addition, users can define their own set of permissions if the templates are not sufficient.|There are no default rights policy templates; you must create and then distribute these. For more information, see [AD RMS Policy Template Considerations](http://go.microsoft.com/fwlink/?LinkId=154765).<br /><br />In addition, users can define their own set of permissions if the templates are not sufficient.|
|Minimum supported version of Microsoft Office is Office 2010, which requires the [RMS sharing application](../rms-client/rights-management-sharing-application-for-windows.md).<br /><br />Microsoft Office for Mac:<br /><br />Microsoft Office for Mac 2016: Supported<br /><br />Microsoft Office for Mac 2011: Not supported|Minimum supported version of Microsoft Office is Office 2007.<br /><br />Microsoft Office for Mac:<br /><br />Microsoft Office for Mac 2016: Supported<br /><br />Microsoft Office for Mac 2011: Supported|
|Supports the [RMS sharing application](../rms-client/rights-management-sharing-application-for-windows.md) for Windows, Mac computers, and mobile devices.<br /><br />In addition, the RMS sharing application supports the following:<br /><br />Sharing with people in another organization.<br /><br />Email notification, which lets the sender know when somebody tries to open a protected attachment.<br /><br />A document tracking site for users, which includes the ability to revoke a document.|Supports the [RMS sharing application](../rms-client/rights-management-sharing-application-for-windows.md) for Windows, Mac computers, and mobile devices. However, sharing does not support sharing with people in another organization, email notification, or the document tracking site and the ability for users to revoke documents.|
|All file types can be protected with [native or generic protection](../rms-client/rights-management-sharing-application-administrator-guide-technical-overview.md#levels-of-protection-native-and-generic) when you use the RMS sharing application.<br /><br />For other applications, check the [client devices capabilities table](../get-started/rms-requirements-client-devices.md#client-device-capabilities).|All file types can be protected with [native or generic protection](../rms-client/rights-management-sharing-application-administrator-guide-technical-overview.md#levels-of-protection-native-and-generic) when you use the RMS sharing application.<br /><br />For other applications, check the [client devices capabilities table](../get-started/rms-requirements-client-devices.md#client-device-capabilities).|
|Minimum supported version of the Windows client is Windows 7.|Minimum supported version of the Windows client is Windows Vista Service Pack 2.|
|Mobile device support includes Windows Phone, Android, iOS, and Windows RT.<br /><br />Email support by using Exchange ActiveSync IRM is also supported on all mobile device platforms that support this protocol.|Mobile device support includes Windows Phone, Android, iOS, and Windows RT, and requires the [Active Directory Rights Management Services Mobile Device Extension](http://technet.microsoft.com/library/dn673574.aspx).<br /><br />Email support by using Exchange ActiveSync IRM is supported on all mobile device platforms that support this protocol.|
|Supports multi-factor authentication (MFA) for computers and mobile devices.<br /><br />For more information, see the [Multi-factor authentication (MFA) and Azure RMS](../get-started/rms-requirements-aad-directory.md#multi-factor-authentication-mfa-and-azure-rms).|Supports smart card authentication if IIS is configured to request certificates.|
|Supports Cryptographic Mode 2 without additional configuration, which provides stronger security for key lengths and encryption algorithms.<br /><br />For more information, see the [Cryptographic controls for signing and encryption](#cryptographic-controls-for-signing-and-encryption) section in this article, and [AD RMS Cryptographic Modes](http://go.microsoft.com/fwlink/?LinkId=266659).|Supports Cryptographic Mode 1 by default and requires additional configuration to support Cryptographic Mode 2 for stronger security.<br /><br />For more information, see the [Cryptographic controls for signing and encryption](#cryptographic-controls-for-signing-and-encryption) section in this article, and [AD RMS Cryptographic Modes](http://go.microsoft.com/fwlink/?LinkId=266659).|
|Supports migration from AD RMS and if required, to AD RMS:<br /><br />[Migrating from AD RMS to Azure Rights Management](../plan-design/migrating-from-ad-rms-to-azure-rights-management.md)<br /><br />[Decommissioning and deactivating Azure Rights Management](../deploy-use/decommissioning-and-deactivating-azure-rights-management.md)|Supports migration from Azure RMS and to Azure RMS:<br /><br />[Decommissioning and deactivating Azure Rights Management](../deploy-use/decommissioning-and-deactivating-azure-rights-management.md)<br /><br />[Migrating from AD RMS to Azure Rights Management](../plan-design/migrating-from-ad-rms-to-azure-rights-management.md)|
|Requires an RMS license to protect content. No RMS license is required to consume content that has been protected by Azure RMS (includes users from another organization).<br /><br />For more information, see the [Cloud subscriptions that support Azure RMS](../get-started/rms-requirements-cloud-subscriptions.md).|Requires an RMS license to protect content, and to consume  content that has been protected by AD RMS.<br /><br />For more information about licensing for AD RMS, see [Client Access Licenses and Management Licenses](https://www.microsoft.com/en-us/Licensing/product-licensing/client-access-license.aspx) for general information, but contact your Microsoft partner or Microsoft representative for specific information.|

## Cryptographic controls for signing and encryption
[!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] always uses RSA 2048 for all public key cryptography and SHA 256 for signing operations. In comparison, AD RMS supports RSA 1024 and RSA 2048, and SHA 1 or SHA 256 for signing operations.

Both [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] and AD RMS use AES 128 for symmetric encryption.

[!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] is compliant with FIPS 140-2 when your tenant key is created and managed by Microsoft (the default), or if you manage your own tenant key (known as BYOK). For more information about managing your tenant key, see [Planning and implementing your Azure Rights Management tenant key](../plan-design/planning-and-implementing-your-azure-rights-management-tenant-key.md).

## Next steps
If you are looking to migrate from AD RMS to Azure RMS, see [Migrating from AD RMS to Azure Rights Management](../plan-design/migrating-from-ad-rms-to-azure-rights-management.md)


