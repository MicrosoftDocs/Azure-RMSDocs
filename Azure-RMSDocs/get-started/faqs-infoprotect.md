---
# required metadata

title: FAQs for classification & labeling - AIP
description: Have a question that is specifically about classification and labeling using Azure Information Protection? See if it's answered here. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 04/25/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 4b595b6a-7eb0-4438-b49a-686431f95ddd

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: adhall
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Frequently asked questions about classification and labeling in Azure Information Protection

>*Applies to: Azure Information Protection, Office 365*

Have a question about Azure Information Protection that is specifically about classification and labeling?  See if it's answered here. 

## What can I do with the classification capabilities in Azure Information Protection?

Try our quick start tutorial to see this working in just a few minutes: [Quick start tutorial for Azure Information Protection](infoprotect-quick-start-tutorial.md).

Look out for announcements on the [Enterprise Mobility and Security Blog](https://blogs.technet.microsoft.com/enterprisemobility/?product=azure-information-protection) and our [Yammer site](https://www.yammer.com/askipteam/#/threads/inGroup?type=in_group&feedId=8652489&view=all) for when additional classification features and capabilities become available. There are a few limitations with the current release, which include the following:

- Label names and tooltips are supported in one language only. Note that support for multiple languages is now in preview. 

- There is no centralized logging for classification and labeling.

- Conditions for automatic classification must be phrases or patterns.

- No labeling ability for Office apps for mobile devices (iOS and Android) and Mac computers, or the Office web apps (Office Online).

- No classification and labeling integration with Exchange Online or SharePoint Online.

- The SDK for partners and developers does not yet include classification and labeling.

The February release removes many previous limitations. For more information, see the [blog post announcement](https://blogs.technet.microsoft.com/enterprisemobility/2017/02/08/azure-information-protection-december-update-moves-to-general-availability/).

## Do I need to be a global admin to configure classification and labels?

To configure the Azure Information Protection policy, you no longer have to sign in to the Azure portal as a global admin for Azure Active Directory. You can also now use an account that has a security admin role.

If you select the option to install the demo policy when you install the [Azure Information Protection client](https://www.microsoft.com/en-us/download/details.aspx?id=53018), you don't need to sign in to the portal to see and try out the labeling functionality. The demo policy locally installs a default policy for Azure Information Protection, so you can try labeling documents and emails, but you won't be able to change or add new labels without signing in to the Azure portal. 

## Which options in the Azure portal are P2?

The options in the Azure portal that require a **Azure Information Protection Premium 2** (P2) subscription now have an information popup message to identify them. For more information about which features are included in the P1 and P1 subscriptions, see the [feature list](https://www.microsoft.com/cloud-platform/azure-information-protection-features) from the Azure Information Protection site.

## Can a file have more than one classification?

Users can select just one label at a time for each document or email, which often results in just one classification. However, if users select a sub-label, this actually applies two labels at the same time; a primary label and a secondary label. By using sub-labels, a file can have two classifications that denote a parent\child relationship for an additional level of control.

For example, the label **Confidential** might contain sub-labels such as **Legal** and **Finance**. You can apply different classification visual markings and different Rights Management templates to these sub-labels. A user cannot select the **Confidential** label by itself; only one of its sub-labels, such as **Legal**. As a result, the label that they see set is **Confidential \ Legal**. The metadata for that file includes one custom text property for **Confidential**, one custom text property for **Legal**, and another that contains both values (**Confidential Legal**). 

When you use sub-labels, don't configure visual markings, protection, and conditions at the primary label. When you use sub-levels, configure these setting on the sub-label only. If you configure these settings on the primary label and its sub-label, the settings at the sub-label take precedence.

## When an email is labeled, do any attachments automatically get the same labeling?

No. When you label an email message that has attachments, those attachments do not inherit the same label. The attachments remain either without a label or will retain a separately applied label. However, if the label for the email applies protection, that protection is applied to the attachments.

## How can DLP solutions and other applications integrate with Azure Information Protection?

Because Azure Information Protection uses persistent metadata for classification, which includes a clear text label, this information can be read by DLP solutions and other applications. In files, this metadata is stored in custom properties; in emails, this information is in the email headers.

## How is Azure Information Protection classification for emails different from Exchange message classification?

Exchange message classification is an older feature that can classify emails and it is implemented independently from Azure Information Protection classification. However, you can integrate the two solutions so that when users classify an email using the Outlook web app and in some mobile mail applications, the Azure Information Protection classification and corresponding label markings is automatically added. Exchange adds the classification and the Azure Information Protection client applies the corresponding label settings for that classification.

Although the Outlook web app doesn't yet natively support Azure Information Protection classification and protection, you can use this same technique to use your labels with this email client in addition to the desktop Outlook client.

To achieve this solution: 

1. Use the [New-MessageClassification](https://technet.microsoft.com/library/bb124400) Exchange PowerShell cmdlet to create message classifications with the Name property that maps to your label names in your Azure Information Protection policy. 

2. Create an Exchange transport rule for each label: Apply the rule when the message properties include the classification that you configured, and modify the message properties to set a message header. 

    For the message header, you'll find the information to specify by inspecting the Internet headers of an email that you sent and classified by using your Azure Information Protection label. Look for the header **msip_labels** and the string that immediately follows, up to and including the semicolon. Using the previous example:
    
    **msip_labels: MSIP_Label_0e421e6d-ea17-4fdb-8f01-93a3e71333b8_Enabled=True;**
    
    Then, for the message header in the rule, specify **msip_labels** for the header, and the remainder of this string for the header value. For example:
    
    ![Example Exchange Online transport rule that sets the message header for a specific Azure Information Protection label](../media/exchange-rule-for-message-header.png)

Before you test this, remember that there is often a delay when you create or edit transport rules (for example, wait an hour). But when the rule is in effect, the following now happens when users use the Outlook web access app or a mobile device client that supports Rights Management protection: 

- Users select the Exchange message classification and send the email.

- The Exchange rule detects the Exchange classification and accordingly modifies the message header to add the Azure Information Protection classification.

- When recipients running the Azure Information Protection client view the email in Outlook, they will see the Azure Information Protection label assigned and any corresponding email header, footer, or watermark. 

If your Azure Information Protection labels apply rights management protection, add this to the rule configuration by selecting the option to modify the message security, apply rights protection, and then select the RMS template or Do Not Forward option.

You can also configure transport rules to do the reverse mapping: When an Azure Information Protection label is detected, set a corresponding Exchange message classification. To do this:

- For each Azure Information Protection label, create a transport rule that is applied when the **msip_labels** header includes the name of your label (for example, **General**), and apply a message classification that maps to this label.


[!INCLUDE[Commenting house rules](../includes/houserules.md)]
