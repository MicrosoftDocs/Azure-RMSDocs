---
# required metadata

title: Office apps; Configuration for clients | Azure Information Protection
description: Information and instructions for admins to configure Office apps to work with the Azure Rights Management service from Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 09/25/2016
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: ec269afe-4e87-4cc1-9144-5fbb594b412e

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Office apps: Configuration for clients

>*Applies to: Azure Information Protection, Office 365*


Use this information to determine what you need to do so that Office apps used by your end users will work with the Azure Rights Management service from Azure Information Protection.

## Office 2016 and Office 2013
Because these later versions of Office natively support the Azure Rights Management service, no client computer configuration is required to support the information rights management (IRM) features for applications such as Word, Excel, PowerPoint, Outlook and the Outlook Web App. All users have to do is sign in to their Office applications with their [!INCLUDE[o365_1](../includes/o365_1_md.md)] credentials and they can protect files and emails, and use files and emails that have been protected by others.

However, we recommend that you supplement these applications with the Rights Management sharing application, so that users get the benefit of the Office add-in. For more information, see [Rights Management sharing application: Installation and configuration for clients](configure-sharing-app.md).

## Office 2010
For client computers to use the Azure Rights Management service with Office 2010, they must have installed the Rights Management sharing application for Windows. No further configuration is required other than users must sign in with their [!INCLUDE[o365_1](../includes/o365_1_md.md)] credentials and they can then protect files and use files that have been protected by others.

For more information about the Rights Management sharing application, see [Rights Management sharing application: Installation and configuration for clients](configure-sharing-app.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]
