---
# required metadata

title: Have users have signed up for RMS for individuals - AIP
description: As an administrator, how do you know if your users have signed up for RMS for individuals? You might use any or a combination of methods described in this article.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 02/08/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: a36c3d99-a794-4f7a-aafb-64a950f1fcf9

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---


# How to find out if your users have signed up for RMS for individuals

>*Applies to: Azure Information Protection*

As an administrator, how do you know if your users have signed up for RMS for individuals? You might use any or a combination of the following methods:

-   Ask users how they protect highly confidential files, especially when collaborating with others outside the organization.

-   When you have an Azure subscription for your organization, use the [Get-MsolAccountSku](https://msdn.microsoft.com/library/azure/dn194118.aspx) cmdlet to see if any users are assigned the **RIGHTSMANAGEMENT_ADHOC** license. This license comes from the RMS for individuals subscription that was granted to the organization, with a pool of active units available for users to use the self-service sign-up process.

-   Use a system management solution, such as System Center Configuration Manager, to inventory software installed and software in use. For example, look for **MSIP.App.exe**, which is used by the Azure Information Protection client, and **ipviewer.exe** for the Rights Management sharing application. You can download and install this client and application for free to identify other characteristics that you then use for software inventory.

-   Be on the lookout for file name extensions that are created by the Azure Information Protection client or Rights Management sharing application. The .pfile and .ppdf file name extensions are the most obvious examples, but there are other files that change their file name extension when they are natively protected by the Rights Management service. For more information, see the [File types supported for protection](../rms-client/client-admin-guide-file-types.md#file-types-supported-for-protection) section from the Azure Information Protection client admin guide.

[!INCLUDE[Commenting house rules](../includes/houserules.md)]