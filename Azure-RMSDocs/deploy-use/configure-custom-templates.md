---
# required metadata

title: Configure custom templates for Azure RMS - AIP
description: Information and instructions for admins to configure and manage usage rights templates. Templates make it easy for users and other admins to apply policies to sensitive files that restrict access to authorized users.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 07/21/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 1775d8d0-9a59-42c8-914f-ce285b71ac1c

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Configuring custom templates for the Azure Rights Management service

>*Applies to: Azure Information Protection, Office 365*

When the Azure Rights Management service has been [activated](activate-service.md), users are automatically able to use two default templates that make it easy for them to apply rights management policies to sensitive files that restrict access to authorized users in your organization. These two templates have the following rights policy restrictions:

-   Read-only viewing for the protected content

    -   Display name: **&lt;organization name&gt; - Confidential View Only** or **Highly Confidential \ All employees**

    -   Specific permission: View Content

-   Read or Modify permissions for the protected content

    -   Display name: **&lt;organization name&gt; - Confidential** or **Confidential \ All employees**

    -   Specific permissions: View Content, Save File, Edit Content, View Assigned Rights, Allow Macros, Forward, Reply, Reply All

In addition, the [Azure Information Protection client](../rms-client/aip-client.md) lets users define their own set of permissions. And, for the Outlook client and Outlook Web Access, users can select the [Do Not Forward option](../deploy-use/configure-usage-rights.md#do-not-forward-option-for-emails).

For many organizations, the default templates might be sufficient. But if you want to create your own custom rights policy templates, you can do so. Reasons for creating a custom template include the following:

-   You want a template to grant rights to a subset of users in the organization rather than all users.

-   You want only a subset of users to be able to see and select a template (departmental template) from applications, rather than all users in the organization see and can select the template.

-   You want to define a custom right for a template, such as View and Edit, but not Copy and Print.

-   You want to configure additional options in a template that include an expiration date and whether the content can be accessed without an Internet connection.

For users to be able to select a custom template that contains settings such as these, you must first create a custom template, configure it, and then publish it. Although you will probably require only a few templates, you can have a maximum of 500 custom templates saved in Azure. 

Use the following information to help you configure and use custom templates:

-   [How to create, configure, and publish a custom template](create-template.md)

-   [How to copy a template](copy-template.md)

-   [How to remove (archive) templates](remove-template.md)

-   [How to refresh templates for users](refresh-templates.md)

-   [Use PowerShell to manage templates](configure-templates-with-powershell.md)

> [!TIP]
> Templates and new options for configuring Azure Rights Management protection are moving to the Azure portal. This functionality is currently in preview. For more information see the following blog post announcement: [Azure Information Protection unified administration now in Preview](https://blogs.technet.microsoft.com/enterprisemobility/2017/04/26/azure-information-protection-unified-administration-now-in-preview/) 


[!INCLUDE[Commenting house rules](../includes/houserules.md)]

