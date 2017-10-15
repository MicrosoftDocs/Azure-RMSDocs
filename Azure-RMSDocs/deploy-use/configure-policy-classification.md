---
# required metadata

title: Configure conditions for an Azure Information Protection label
description: When you configure conditions for a label, you can automatically assign a label to a document or email. Or, you can prompt users to select the label that you recommend. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 10/17/2017
ms.topic: article
ms.prod:
ms.service: information-protection
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

>*Applies to: Azure Information Protection*

When you configure conditions for a label, you can automatically assign a label to a document or email. Or, you can prompt users to select the label that you recommend: 

- Automatic classification applies to Word, Excel, and PowerPoint when files are saved, and apply to Outlook when emails are sent. You cannot use automatic classification for files that were previously manually labeled, or previously automatically labeled with a higher classification. The exception to this behavior is if you use the Azure Information scanner with the OverrideLabel parameter set to on.
    
    If you have the current preview version of the Azure Information Protection client: For documents, automatic classification runs [continuously in the background](#more-information-about-background-checking), instead of running when these documents are saved. There is no change to how automatic classification works for emails.

- Recommended classification applies to Word, Excel, and PowerPoint when files are saved. You can use recommended classification for files that were previously labeled, with or without a higher classification.
    
    If you have the current preview version of the Azure Information Protection client: For documents, recommended classification runs [continuously in the background](#more-information-about-background-checking), instead of running when these documents are saved.

When you configure conditions, you can use predefined patterns, such as **Credit Card Number** or **USA Social Security Number (SSN)**. Or, you can define a custom string or pattern as a condition for automatic classification. These conditions apply to the body text in documents and emails, and to headers and footers. For more information about the conditions, see step 5 in the [following procedure](#to-configure-recommended-or-automatic-classification-for-a-label).

How multiple conditions are evaluated when they apply to more than one label:

1. The labels are ordered for evaluation, according to their position that you specify in the policy: The label positioned first has the lowest position (least sensitive) and the label positioned last has the highest position (most sensitive).

2. The most sensitive label is applied.
 
3. The last sub-label is applied.

> [!TIP]
>For the best user experience and to ensure business continuity, we recommend that you start with user recommended classification, rather than automatic classification. This configuration lets your users accept the labeling or protection action, or override these suggestions if they are not suitable for their document or email message.

An example prompt for when you configure a condition to apply a label as a recommended action, with a custom policy tip:

![Azure Information Protection detection and recommendation](../media/info-protect-recommend-calloutsv2.png)

In this example, the user can click **Change now** to apply the recommended label, or override the recommendation by selecting **Dismiss**.

## To configure recommended or automatic classification for a label

1. If you haven't already done so, open a new browser window and sign in to the [Azure portal](https://portal.azure.com) as a security admin or global admin. Then navigate to the **Azure Information Protection** blade. 
    
    For example, on the hub menu, click **More services** and start typing **Information** in the Filter box. Select **Azure Information Protection**.

2. If the label that you want to configure will apply to all users, stay on the **Azure Information Protection - Global policy** blade.
    
    If the label that you want to configure is in a [scoped policy](configure-policy-scope.md) so that it applies to selected users only, from the **POLICIES** menu selection, select **Scoped policies**. Then select your scoped policy from the **Azure Information Protection - Scoped polices** blade.

3. From the **Azure Information Protection - Global policy** blade, or the **Policy:\<name>** blade, select the label to configure. 

4. On the **Label** blade, in the **Configure conditions for automatically applying this label** section, click **Add a new condition**.

5. On the **Condition** blade, select **Information Types** if you want to use a predefined condition, or **Custom** if you want to specify your own:
    - For **Information Types**: Select from the list of available conditions, and then select the minimum number of occurrences and whether the occurrence should have a unique value to be included in the occurrence count.
        
        The information types use the Office 365 data loss prevention (DLP) sensitivity information types and pattern detection. You can choose from many common sensitive information types, some of which are specific for different regions. For more information, see [What the sensitive information types look for](https://support.office.com/article/What-the-sensitive-information-types-look-for-fd505979-76be-4d9f-b459-abef3fc9e86b) from the Office documentation. 
        
        The list of information types that you can select from the Azure portal is periodically updated to include any new Office DLP additions. However, the list excludes any custom sensitive information types that you have defined and uploaded as a rule package to the Office 365 Security & Compliance Center. 
        
        When Azure Information Protection evaluates the information types that you select, it does not use the Office DLP confidence level setting but matches according to the lowest confidence.
    
    - For **Custom**: Specify a name and phrase to match, which must exclude quotation marks and special characters. Then specify whether to match as a regular expression, use case sensitivity, and the minimum number of occurrences and whether the occurrence should have a unique value to be included in the occurrence count.
        
        The regular expressions use the Office 365 regex patterns. For more information, see [Defining regular expression based matches](https://technet.microsoft.com/library/jj674702(v=exchg.150).aspx#Anchor_2) from the Office documentation.
        
6. Decide whether you need to change the **Minimum number of occurrences** and the **Count occurrence with unique value only**, and then select **Save**. 
    
    Example of the occurrences options: You select the information type for the social security number, set the minimum number of occurrences as 2, and a document has the same social security number listed twice: If you set the **Count occurrences with unique value only** to **On**, the condition is not met. If you set this option to **Off**, the condition is met.

7. Back on the **Label** blade, configure the following, and then click **Save**:
    
    - Choose automatic or recommended classification: For **Select how this label is applied: automatically or recommended to user**, select **Automatic** or **Recommended**.
    
    - Specify the text for the user prompt or policy tip: Keep the default text or specify your own string.

8. To make your changes available to users, on the initial **Azure Information Protection** blade, click **Publish**.

### More information about background checking

If you have the current preview version of the Azure Information Protection client, for documents, the client continuously checks the content for matches. This behavior enables automatic and recommended classification for documents that are stored in SharePoint Online. 

The content checking is not real-time but runs periodically as a background task if the document is modified. To help preserve battery life, the checking process runs less frequently when a laptop runs on battery rather than plugged in.

## Next steps

For more information about configuring your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organizations-policy) section.  

[!INCLUDE[Commenting house rules](../includes/houserules.md)]


