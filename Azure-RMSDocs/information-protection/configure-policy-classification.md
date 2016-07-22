---
# required metadata

title: How to configure conditions for automatic and recommended classification for Azure Information Protection | Azure Rights Management
description:
author: cabailey
manager: mbaldwin
ms.date: 07/21/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: e915f959-eafb-4375-8d2c-2f312edf2d29

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# How to configure conditions for automatic and recommended classification for Azure Information Protection

*Applies to: Azure Information Protection preview*

When you configure conditions for a label, you can automatically assign a a label to a document or email. Or, you can prompt users to select the label that you recommend: 

- Automatic classification applies to Word, Excel, and PowerPoint when files are saved, and apply to Outlook when emails are sent. You cannot use automatic classification for files that were previously manually labeled.
 
- Recommended classification applies to Word, Excel, and PowerPoint when files are saved.

When you configure conditions, you can use predefined patterns, such as “Credit card numbers” or “USA Social Security Number”. Or, you can define a custom string or pattern as a condition for automatic classification. 

> [!TP]
>For the best user experience and to ensure business continuity, we recommend that you start with user recommended classification, rather than automatic classification. This configuration gives your users the ability to accept the labeling or protection action, or override these suggestions if they are not suitable for their document or email message.




Use the following instructions to configure recommended or automatic classification for a label.

1. Make sure that you are signed in to the Azure portal by using this special link for Azure Information Protection: https://portal.azure.com/?microsoft_azure_informationprotection=true
 
2. On the hub menu, click **Browse** and start typing **Information** in the Filter box. Select **Azure Information Protection**.

3. On the **Azure Information Protection** blade, select the label that you want to configure for automatic or recommended classification.

4. On the **Label** blade, in the **Configure conditions for automatically applying this label** section, click **Add a new condition**.

5. On the **Condition** blade, select **Built-in** if you want to use a predefined condition, or **Custom** if you want to specify your own, and then click **Save**:

- For **Built-in**: Select from the list of available conditions, and then select the minimum number of occurrences. For more information about how these conditions make their determination and some examples, see the [More information about the built-in conditions](#more-information-about-the-built-in-conditions) section.

- For **Custom**: Specify a name and phrase to match, which must exclude quotation marks and special characters. Then specify whether to match as a regular expression, use case sensitivity, and the minimum number of occurrences.

6. On the **Label** blade, configure the following, and then click **Save**:

    - Choose automatic or recommended classification: Select **Automatic** or **Recommended** for **Select how this label is applied: automatically or recommended to user** 

    - Specify the text for the user prompt or policy tip: Keep the default text or specify your own string.

7. To make your changes available to users, on the **Azure Information Protection** blade, click **Publish**.

## More information about the built-in conditions

The currently supported conditions:







## Next steps

For more information about configuring your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organization-s-policy) section.  



