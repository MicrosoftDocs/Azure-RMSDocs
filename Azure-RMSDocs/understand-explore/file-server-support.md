---
# required metadata

title: How file servers that use FCI support Azure RMS from AIP
description: How Windows Server File Classification Infrastructure can be used with Azure RMS when you deploy the RMS connector to automatically protect Office documents.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 07/17/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 8fdad425-5daf-4ce1-822f-9d2fb0b87df1

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---


# How File servers that run Windows Server and use File Classification Infrastructure (FCI) support Azure Rights Management

>*Applies to: Azure Information Protection, Office 365*


When you configure Windows Server to use File Classification Infrastructure, this File Server Resource Manager feature can scan local files and determine whether they contain sensitive data. For files that meet this criteria, they are tagged with classification properties that an administrator defines. The File Classification Infrastructure can then take automatic action, according to the classification. One of these actions include applying information protection by using [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] and the deployment of the Rights Management connector (also known as the RMS connector). Office files are then automatically protected by Azure RMS.

To protect all file types, you would not use the RMS connector, but instead, run a Windows PowerShell script that uses cmdlets from the [Azure Information Protection module](../rms-client/client-admin-guide-powershell.md).

The classification policies are fully configurable and highly extensible so that you can prevent potential data leakage from unauthorized and authorized users. It can even help to reduce the risk of data leakage by network administrators because you can configure policies that don’t require these administrators to have access to the files.

For instructions to deploy and configure the RMS connector for Office files, see [Deploying the Azure Rights Management connector](../deploy-use/deploy-rms-connector.md).

For instructions to use the Windows PowerShell script for all file types, see [RMS Protection with Windows Server File Classification Infrastructure &#40;FCI&#41;](../rms-client/configure-fci.md).



## Next steps
Now that you understand how applications and services support Azure RMS, you might be interested in comparing Azure RMS with the on-premises version of Rights Management, Active Directory Rights Management Services (AD RMS). For a comparison of features, requirements, and security controls, see [Comparing Azure Rights Management and AD RMS](compare-azure-rms-ad-rms.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]

