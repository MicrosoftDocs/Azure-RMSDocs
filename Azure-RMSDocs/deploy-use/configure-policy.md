---
# required metadata

title: Configure the Azure Information Protection policy
description: To configure classification, labeling, and protection, you must configure the Azure Information Protection policy. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 05/05/2017
ms.topic: article
ms.prod:
ms.service: information-protection
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

>*Applies to: Azure Information Protection*

To configure classification, labeling, and protection, you must configure the Azure Information Protection policy. This policy is then downloaded to computers that have installed the [Azure Information Protection client](https://www.microsoft.com/en-us/download/details.aspx?id=53018).

## Subscription support

The Azure Information Protection policy supports different levels of subscriptions:

- Azure Information Protection P2: Support for all classification, labeling, and protection features.

- Azure Information Protection P1: Support for most classification, labeling, and protection features, but not automatic classification or HYOK.

- Office 365 that includes the Azure Rights Management service: Support for protection but not classification and labeling.

When a configuration option requires a subscription that is not detected for your organization, you will see that option as unavailable in the Azure portal. 

Options that require an Azure Information Protection P2 subscription are indicated with a popup message. If you have an Office 365 subscription that includes the Azure Rights Management service and a subscription for Azure Information Protection is not detected, only protection settings can be configured.

If you have a mix of subscriptions for users for your tenant, it is your responsibility to make sure that the Azure Information Protection policy that users download does not contain configuration options that their account is not licensed to use. When you configure options that not all users have a license for, use scoped policies so that the users are not configured to use features for which they do have a license.

For more information about the subscriptions, see [What subscription do I need for Azure Information Protection and what features are included?](../get-started/faqs.md#what-subscription-do-i-need-for-azure-information-protection-and-what-features-are-included)

For more information about how to configure scoped policies, see [How to configure the policy for specific users by using scoped policies](configure-policy-scope.md).

## How to configure the Azure Information Protection policy

1. In a new browser window, sign in to the [Azure portal](https://portal.azure.com) as a security admin or global admin.

2. Navigate to the **Azure Information Protection** blade: For example, on the hub menu, click **More services** and start typing **Information Protection** in the Filter box. From the results, select **Azure Information Protection**. 

    When the **Azure Information Protection** blade loads, it automatically opens the **Policy: Global** blade, for you to view and edit the global policy that all users get. However, you can also optionally add and edit scoped policies. Azure Information Protection policies contain the following elements that you can configure:

    - Labels that let you and users classify documents and emails.

    - Title and tooltip for the Information Protection bar that users see in their Office applications.

    - The option to enforce classification when users save documents and send emails.

    - The option to set a default label as a starting point for classifying documents and emails.

    - The option to prompt users to provide a reason when they select a label that has a lower sensitivity level than the original.

    - The option to automatically label an email message, based on its attachments.

    - The option to provide a custom help link for users.

Azure Information Protection comes with a [default policy](configure-policy-default.md), which contains five main labels. These labels can be used with the full range of data that an organization typically creates and stores, from the lowest classification of personal data, to the highest classification of highly confidential data. 

You can use the default labels without changes, or you can customize them, or you can delete them, and you can create new labels. For more information, use the links in the next section to help you locate the relevant options and how to configure them. 

When you make any changes on an Azure Information Protection blade, click **Save** to save the changes, or click **Discard** to revert to the last saved settings. 

When you have finished making the changes that you want, click **Publish**. 

The Azure Information Protection client checks for any changes whenever a supported Office application starts, and downloads the changes as its latest Azure Information Protection policy. Additional triggers that refresh the policy on the client:

- Right-click to classify and protect a file or folder.

- Running the PowerShell cmdlets for labeling and protection (Get-AIPFileStatus and Set-AIPFileLabel).

- Every 24 hours.

>[!NOTE]
>When the client downloads the policy, be prepared to wait a few minutes before it's fully operational. The actual time will vary, according to factors such as the size and complexity of the policy configuration, and the network connectivity. If the resulting action of labels do not match your latest changes, allow up to 15 minutes and then try again.

### Configuring your organization's policy

Use the following information to help you configure your Azure Information Protection policy:

- [The default Information Protection policy](configure-policy-default.md)

- [How to configure the policy settings](configure-policy-settings.md)

- [How to create a new label](configure-policy-new-label.md)

- [How to delete or reorder a label](configure-policy-delete-reorder.md)

- [How to change or customize an existing label](configure-policy-change-label.md)

- [How to configure a label for protection](configure-policy-protection.md)

- [How to configure a label to apply visual markings](configure-policy-markings.md)

- [How to configure conditions for automatic and recommended classification](configure-policy-classification.md)

- [How to configure the policy for specific users by using scoped policies](configure-policy-scope.md)

- [How to configure labels for different languages](configure-policy-languages.md)

## Next steps

For an example of how to customize the default policy, and see the resulting behavior in an Office application, try the [Quick start tutorial for Azure Information Protection](../get-started/infoprotect-quick-start-tutorial.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]
