---
# required metadata

title: New Azure Information Protection label - AIP
description: Although Azure Information Protection comes with default labels that you can customize, you can also create your own labels that users see on the Information Protection bar.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 07/17/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 1b45faa5-0c9c-40d6-910a-f117e7b6e8a3

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: aiplabels
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# How to create a new label for Azure Information Protection

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*
>
> *Instructions for: [Azure Information Protection client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-client-and-the-azure-information-protection-unified-labeling-client)*

Although Azure Information Protection comes with default labels that you can customize, you can also create your own labels.

You can add a new label, or add a new sublabel to an existing label when you need a further level of classification. For example, the last label in the [default policy](configure-policy-default.md), contains sublabels.

When you create the first sublabel for a label, users can no longer select the original, parent label. If necessary, create a new sublabel to recreate the parent label settings so that users can apply the same settings.

Use the following instructions to add a new label that can then be added to an Azure Information Protection policy.

1. If you haven't already done so, open a new browser window and [sign in to the Azure portal](configure-policy.md#signing-in-to-the-azure-portal). Then navigate to the **Azure Information Protection** blade.
    
    For example, on the hub menu, click **All services** and start typing **Information** in the Filter box. Select **Azure Information Protection**.

2. From the **Classifications** > **Labels** menu option: On the **Azure Information Protection - Labels** blade, do one of the following actions:
    
    - To create a new label: Click **Add a new label**.
    
    - To create a new sublabel: Right-click or select the context menu (**...**) for the label that you want to create a sublabel for, and then click **Add a sub-label**.

3. On the **Label** or **Sub-label** blade, select the options that you want for this new label, and then click **Save**.
    
    When you specify a display name, you are prevented from specifying some characters (such as a backslash and ampersand) because not all services and applications that use Azure Information Protection can support these characters. In addition to the characters that are blocked, do not specify the **#** character.    
    
    Note that new labels are automatically assigned the color black. Choose a distinguishing color from the list of colors, or enter a hex triplet code for the red, green, and blue (RGB) components of the color. For example, **#DAA520**. If you need a reference for these codes, you'll find a helpful table from the [\<color>](https://developer.mozilla.org/docs/Web/CSS/color_value) page from the MSDN web docs. You also find these codes in many applications that let you edit pictures. For example, Microsoft Paint lets you choose a custom color from a palette and the RGB values are automatically displayed, which you can then copy.

4. To make your new label available to users: From the **Classifications** > **Policies** menu option, select the policy to contain the new label. Select **Add or remove labels**. Select the label from the **Policy: Add or remove labels** blade, select **OK**, and then select **Save**.
    
    >[!TIP]
    >For new labels, consider adding them first to a scoped policy that you use for testing. When you are satisfied with the results, remove the label from this testing scope, and then add the label to a policy that you use in production.     
    
    For more information about adding labels, see [How to add or remove a label](configure-policy-add-remove-label.md).
    
    Your changes are automatically available to users and services. There's no longer a separate publish option.

5. If you want this new label name and description to display in different languages for users: Follow the procedures in [How to configure labels for different languages](configure-policy-languages.md). 

## Next steps

For more information about configuring your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organizations-policy) section.  


