---
# required metadata

title: Configuring Azure Information Protection policy | Azure Information Protection
description: To configure classification, labeling, and protection, you must configure the Azure Information Protection policy. 
author: cabailey
manager: mbaldwin
ms.date: 08/25/2016
ms.topic: article
ms.prod:
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: ba0e8119-886c-4830-bd26-f98fb14b2933

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: eymanor
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Configuring Azure Information Protection policy

>*Applies to: Azure Information Protection preview*

**[ This information is preliminary and subject to change. ]**

To configure classification, labeling, and protection, you must configure the Azure Information Protection policy. This policy is then downloaded to computers that have installed the [Azure Information Protection client](https://www.microsoft.com/en-us/download/details.aspx?id=53018).

To configure the Azure Information Protection policy during the preview release of Azure Information Protection:

1. In a new browser window, sign in to the [Azure portal](https://portal.azure.com).

2. Navigate to the **Azure Information Protection** blade: For example, on the hub menu, click **More services** and start typing **Information Protection** in the Filter box. From the results, select **Azure Information Protection**. 

    You'll then see the **Azure Information Protection** blade where you can configure the Azure Information Protection policy, which contains the following elements:

    - Title and tooltip for the Information Protection bar that users see in their Office applications.

    - Labels that let you and users classify documents and emails.

    - The option to enforce classification when users save documents and send emails.

    - The option to set a default label as a starting point for classifying documents and emails.

    - The option to prompt users to provide a reason when they select a label that has a lower sensitivity level than the original.


Azure Information Protection comes with a [default policy](configure-policy-default.md), which contains the labels **Personal**, **Public**, **Internal**, **Confidential**, and **Secret**. You can use the default labels without changes, or you can customize them, or you can delete them, and you can create new labels.

When you make any changes on an Azure Information Protection blade, click **Save** to save the changes, or click **Discard** to revert to the last saved settings. 

When you have finished making the changes that you want, click **Publish**. 

The Azure Information Protection client checks for any changes whenever a supported Office application starts, and downloads the changes as its Azure Information Protection policy.

## Configuring your organization's policy

Use the following information to help you configure your Azure Information Protection policy:

- [The default Information Protection policy](configure-policy-default.md)

- [How to configure the global policy settings](configure-policy-settings.md)

- [How to create a new label](configure-policy-new-label.md)

- [How to delete or reorder a label](configure-policy-delete-reorder.md)

- [How to change or customize an existing label](configure-policy-change-label.md)

- [How to configure a label to apply protection](configure-policy-protection.md)

- [How to configure a label to apply visual markings](configure-policy-markings.md)

- [How to configure conditions for automatic and recommended classification](configure-policy-classification.md)

## Next steps

For an example of how to customize the default policy, and see the resulting behavior in an Office application, try the [Quick start tutorial for Azure Information Protection](infoprotect-quick-start-tutorial.md).

