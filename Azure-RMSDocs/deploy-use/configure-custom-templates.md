---
# required metadata

title: Configuring custom templates for Azure Rights Management | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 06/02/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
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

# Configuring custom templates for Azure Rights Management

*Applies to: Azure Rights Management, Office 365*

After you have [activated Azure Rights Management](activate-service.md) (Azure RMS), users are automatically able to use two default templates that make it easy for them to apply policies to sensitive files that restrict access to authorized users in your organization. These two templates have the following rights policy restrictions:

-   Read-only viewing for the protected content

    -   Display name: **&lt;organization name&gt; - Confidential View Only**

    -   Specific permission: View Content

-   Read or Modify permissions for the protected content

    -   Display name: **&lt;organization name&gt; - Confidential**

    -   Specific permissions: View Content, Save File, Edit Content, View Assigned Rights, Allow Macros, Forward, Reply, Reply All

In addition, the [RMS sharing application](../rms-client/sharing-app-windows.md) lets users define their own set of permissions. And, for the Outlook client and Outlook Web Access, users can select the [Do Not Forward option](../deploy-use/configure-usage-rights.md#do-not-forward-option-for-emails for email messages).

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


