---
# required metadata

title: Scenarios for document collaboration using Azure Information Protection
description: End-to-end workflows for collaborating on documents that are protected by Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 04/30/2018
ms.topic: get-started-article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 4895c429-959f-47c7-9007-b8f032f6df6f

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Scenarios for secure collaboration by using Azure Information Protection

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](http://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

When you use Azure Information Protection, you can protect your documents without sacrificing collaboration for authorized users. These users might be internal to your organization, external users in another organization, or users with a personal email address.

The majority of documents that users need to collaborate on will be Office documents from Word, Excel, and PowerPoint. These documents support native protection, which means that in addition to the protection features of authorization and encryption, they also support restricted permission for more fine-grained control. 

These permissions are called usage rights, and include permissions such as view, edit, print. You can define individual usage rights when a document is protected, or you can define a grouping of usage rights, called permission levels. Permission levels make it easier to select usage rights that are typically used together, for example, Reviewer and Co-Author. For more information about usage rights and permission levels, see [Configuring usage rights for Azure Rights Management](../deploy-use/configure-usage-rights.md).

When you configure these permissions, you also specify which users or groups they are for:

- For users in your own organization or another organization that uses Azure Active Directory: You can specify Azure AD user accounts, Azure AD groups, or all users in that organization. 

- For users who do not have an Azure Active Directory account: Send them an invitation to create an account in your Azure Active Directory, which uses their personal email as their identity. When these users accept the invitation, this action creates a Microsoft account in your Azure Active Directory. You can now include this account in your own groups. 







[!INCLUDE[Commenting house rules](../includes/houserules.md)]


