---
# required metadata

title: How to find out if users have signed up for RMS for individuals | Azure Information Protection
description: As an administrator, how do you know if your users have signed up for RMS for individuals? You might use any or a combination of methods described in this article.
author: cabailey
manager: mbaldwin
ms.date: 09/25/2016
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

-   When you have an Azure subscription for your organization, use the [Get-MsolAccountSku](https://msdn.microsoft.com/library/azure/dn194118.aspx) cmdlet to see if **RIGHTSMANAGEMENT_ADHOC** is returned as one of the subscriptions. If it is, this is the RMS for individuals subscription that was granted to the organization, with a pool of active units available for users to use the self-service sign-up process.

-   Use a system management solution, such as System Center Configuration Manager, to inventory software installed and software in use. The Rights Management sharing application runs by using the **ipviewer.exe** program and you can [download and install the application](http://go.microsoft.com/fwlink/?LinkId=303970) for free to identify other characteristics about this application that you then use for software inventory.

-   Be on the lookout for file name extensions that are created by the Rights Management sharing application. The .pfile and .ppdf file name extensions are the most obvious examples, but there are other files that change their file name extension when they are natively protected by Rights Management. For more information, see [Supported file types and file name extensions](../rms-client/sharing-app-admin-guide-technical.md#supported-file-types-and-file-name-extensions) section in the [Rights Management sharing application administrator guide](http://technet.microsoft.com/library/dn339003.aspx).

