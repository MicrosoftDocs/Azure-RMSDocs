---
# required metadata

title: How Windows file servers that use FCI support Azure RMS - AIP
description: How Windows Server File Classification Infrastructure can be used with Azure RMS when you deploy the RMS connector to automatically protect Office documents.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 11/08/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 8fdad425-5daf-4ce1-822f-9d2fb0b87df1
ROBOTS: NOINDEX


# optional metadata

#audience:
#ms.devlang:
ms.subservice: fci
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---


# How Windows file servers that use FCI support Azure Rights Management

>***Applies to**: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*
>
>***Relevant for**: [Azure Information Protection classic client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

>[!NOTE] 
> To provide a unified and streamlined customer experience, **Azure Information Protection classic client** and **Label Management** in the Azure Portal are being **deprecated** as of **March 31, 2021**. This time-frame allows all current Azure Information Protection customers to transition to our unified labeling solution using the Microsoft Information Protection Unified Labeling platform. Learn more in the official [deprecation notice](https://aka.ms/aipclassicsunset).

When you configure Windows Server to use File Classification Infrastructure, this File Server Resource Manager feature can scan local files and determine whether they contain sensitive data. 

Files that meet this criteria are tagged with classification properties that an administrator defines. The File Classification Infrastructure can then take automatic action, according to the classification. 

One of these actions includes applying information protection by using Azure Rights Management and the deployment of the Rights Management connector (also known as the RMS connector). Office files are then automatically protected by Azure RMS.

> [!TIP]
> To protect all file types, do not use the RMS connector, but instead, run a Windows PowerShell script that uses cmdlets from the [Azure Information Protection module](./rms-client/client-admin-guide-powershell.md).
> 

The classification policies are fully configurable and highly extensible so that you can prevent potential data leakage from unauthorized and authorized users. It can even help to reduce the risk of data leakage by network administrators because you can configure policies that don’t require these administrators to have access to the files.

For instructions to deploy and configure the RMS connector for Office files, see [Deploying the Azure Rights Management connector](deploy-rms-connector.md).

For instructions to use the Windows PowerShell script for all file types, see 

- [RMS Protection with Windows Server File Classification Infrastructure &#40;FCI&#41;](./rms-client/configure-fci.md)
- [Windows PowerShell script for Azure RMS protection by using File Server Resource Manager FCI](rms-client/fci-script.md)


## Next steps

Now that you understand how applications and services support Azure RMS, you might be interested in comparing Azure RMS with the on-premises version of Rights Management, Active Directory Rights Management Services (AD RMS). For a comparison of features, requirements, and security controls, see [Comparing Azure Rights Management and AD RMS](compare-on-premise.md).


