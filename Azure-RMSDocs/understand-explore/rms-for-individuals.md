---
# required metadata

title: RMS for individuals and Azure Information Protection
description: Information about RMS for individuals, a free self-service subscription for users in an organization who have been sent sensitive files that have been protected by the Azure Rights Management service, but these users cannot be authenticated because their IT department does not manage an account for them in Azure.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 05/22/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 2efcb440-fefd-45e9-872b-f471573aadf2

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# RMS for individuals and Azure Information Protection

>*Applies to: Azure Information Protection*

RMS for individuals is a free self-service subscription for users in an organization who need to open files that have been protected by the Azure Rights Management service from Azure Information Protection. If these users cannot be authenticated by Azure Active Directory and their organization does not have Active Directory Rights Management (AD RMS), this free sign-up service can create an account in Azure Active Directory for a user. As a result, these users can now authenticate by using their company email address and then read the protected files on computers or mobile devices.

Using the [Azure Information Protection client](../rms-client/client-user-guide.md) on Windows computers, these users can also protect their own files but this ability is intended for trial use only and might be removed in the future.

RMS for individuals is an example of self-service signup that is supported by Azure Active Directory. For more information about how this works, see [What is Self-Service Signup for Azure?](/active-directory/active-directory-self-service-signup) in the Azure Active Directory documentation.

> [!IMPORTANT]
> This free subscription is one option to help ensure that authorized people outside your organization can always read files that your organization protects. Another option is to email documents by using message protection in Office 365. This email solution works for all email addresses on all devices and is the recommended way to safely share information and documents by email with people outside your organization.


## Next steps
See [How users sign up for RMS for individuals](rms-for-individuals-user-sign-up.md), for step-by-step instructions and a technical overview of what's happening in the background.

[!INCLUDE[Commenting house rules](../includes/houserules.md)]
