---
title: File servers that run Windows Server and use File Classification Infrastructure (FCI)
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: TBD
author: Cabailey
---

# <a name="BKMK_FCIIntro"></a>File servers that run Windows Server and use File Classification Infrastructure (FCI)

When you configure Windows Server to use File Classification Infrastructure, this File Server Resource Manager feature can scan local files and determine whether they contain sensitive data. For files that meet this criteria, they are tagged with classification properties that an administrator defines. The File Classification Infrastructure can then take automatic action, according to the classification. One of these actions include applying information protection by using [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] and the deployment of the Rights Management connector (also known as the RMS connector). Office files are then automatically protected by Azure RMS.

To protect all file types, you would not use the RMS connector, but instead, run a Windows PowerShell script, using cmdlets from the [RMS Protection tool](https://www.microsoft.com/en-us/download/details.aspx?id=47256).

The classification policies are fully configurable and highly extensible so that you can prevent potential data leakage from unauthorized and authorized users. It can even help to reduce the risk of data leakage by network administrators because you can configure policies that don’t require these administrators to have access to the files.

For instructions to deploy and configure the RMS connector for Office files, see [Deploying the Azure Rights Management Connector](deploying-the-azure-rights-management-connector.md).

For instructions to use the Windows PowerShell script for all file types, see [RMS Protection with Windows Server File Classification Infrastructure &#40;FCI&#41;](rms-protection-with-windows-server-file-classification-infrastructure-fci.md).



## Next steps
Now you understand how applications and services support Azure RMS, you might be interested in comparing Azure RMS with the on-premises version of Rights Management, Active Directory Rights Management Services (AD RMS). For a comparison of features, requirements, and security controls, see [Comparing Azure Rights Management and AD RMS](comparing-azure-rights-management-and-ad-rms.md).


