---
# required metadata

title: FAQs for classification & labeling - AIP
description: Have a question that is specifically about classification and labeling using Azure Information Protection? See if it's answered here. 
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 06/21/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 4b595b6a-7eb0-4438-b49a-686431f95ddd

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: adhall
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Frequently asked questions about classification and labeling in Azure Information Protection

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

Have a question about Azure Information Protection that is specifically about classification and labeling?  See if it's answered here. 

## What can I do with the classification capabilities in Azure Information Protection?

Try our [Edit the policy and create a new label](infoprotect-quick-start-tutorial.md) tutorial to see this working in just a few minutes.

Look out for announcements on the [Enterprise Mobility + Security blog](https://techcommunity.microsoft.com/t5/Enterprise-Mobility-Security/bg-p/enterprisemobilityandsecurity/label-name/Azure%20Information%20Protection) and our [Yammer site](https://www.yammer.com/askipteam/#/threads/inGroup?type=in_group&feedId=8652489&view=all) for when additional classification features and capabilities become available. There are a few limitations with the current release, which include the following:

- No labeling ability in the Office web apps (Office Online).

- No classification and labeling integration with Exchange Online or SharePoint Online.

> [!NOTE]
> **Now in preview**:
> - Centralized reporting for classification and labeling. For more information, see [Central reporting for Azure Information Protection](reports-aip.md).
>
>**Recently released**:
> - Labeling ability built in to Office apps for mobile devices (iOS and Android) and Mac computers. For more information, see [Apply sensitivity labels to your documents and email within Office](https://aka.ms/officemipdocs).

Request new features and vote on requests by visiting the [UserVoice site](https://msip.uservoice.com/) for Azure Information Protection.

## Which client do I install for testing new functionality?

Currently, there are two clients for Windows: 

- The **Azure Information Protection unified labeling client** that downloads labels and policy settings from one of the following admin centers: Office 365 Security & Compliance Center, Microsoft 365 security center, Microsoft 365 compliance center. This client is now in general availability, and has a preview version for you to test additional functionality for a future release.

- The **Azure Information Protection client (classic)** that downloads labels and policy settings from the Azure portal. This client builds on previous general availability versions of the client.

We recommend you test with the unified labeling client if its current feature set and functionality meet your business requirements. If not, or if you have configured labels in the Azure portal that you haven't yet [migrated to the unified labeling store](configure-policy-migrate-labels.md), use the classic client.

For more information, including a feature and functionality comparison table, see [Choose which Azure Information Protection client to use](./rms-client/use-client.md#choose-which-azure-information-protection-client-to-use).

## Can a file have more than one classification?

Users can select just one label at a time for each document or email, which often results in just one classification. However, if users select a sublabel, this actually applies two labels at the same time; a primary label and a secondary label. By using sublabels, a file can have two classifications that denote a parent\child relationship for an additional level of control.

For example, the label **Confidential** might contain sublabels such as **Legal** and **Finance**. You can apply different classification visual markings and different Rights Management templates to these sublabels. A user cannot select the **Confidential** label by itself; only one of its sublabels, such as **Legal**. As a result, the label that they see set is **Confidential \ Legal**. The metadata for that file includes one custom text property for **Confidential**, one custom text property for **Legal**, and another that contains both values (**Confidential Legal**). 

When you use sublabels, don't configure visual markings, protection, and conditions at the primary label. When you use sublevels, configure these setting on the sublabel only. If you configure these settings on the primary label and its sublabel, the settings at the sublabel take precedence.

## How do I prevent somebody from removing or changing a label?

Although there’s a [policy setting](configure-policy-settings.md) that requires users to state why they are lowering a classification label, removing a label, or removing protection, this setting does not prevent these actions. To prevent users from removing or changing a label, the content must already be protected and the protection permissions do not grant the user the Export or Full Control [usage right](configure-usage-rights.md). 

## When an email is labeled, do any attachments automatically get the same labeling?

No. When you label an email message that has attachments, those attachments do not inherit the same label. The attachments remain either without a label or retain a separately applied label. However, if the label for the email applies protection, that protection is applied to Office attachments.

## How can DLP solutions and other applications integrate with Azure Information Protection?

Because Azure Information Protection uses persistent metadata for classification, which includes a clear-text label, this information can be read by DLP solutions and other applications. 

For more information about this metadata, see [Label information stored in emails and documents](configure-policy.md#label-information-stored-in-emails-and-documents).

For examples of using this metadata with Exchange Online mail flow rules, see [Configuring Exchange Online mail flow rules for Azure Information Protection labels](configure-exo-rules.md).

## Can I create a document template that automatically includes the classification?

Yes. You can configure a label to [apply a header or footer that includes the label name](configure-policy-markings.md). But if that doesn't meet your requirements, you can create a document template that has the formatting you want and add the classification as a field code. 

As an example, you might have a table in your document's header that displays the classification. Or, you use specific wording for an introduction that references the document's classification.

To add this field code in your document:

1. Label the document and save it. This action creates new metadata fields that you can now use for your field code.

2. In the document, position the cursor where you want to add the label's classification and then, from the **Insert** tab, select **Text** > **Quick Parts** > **Field**.

3. In the **Field** dialog box, from the **Categories** dropdown, select **Document Information**. Then, from the **Fields names** dropdown, select **DocProperty**.

4. From the **Property** dropdown, select **Sensitivity**, and select **OK**.

The current label's classification is displayed in the document and this value will be refreshed automatically whenever you open the document or use the template. So if the label changes, the classification that is displayed for this field code is automatically updated in the document.

## How is Azure Information Protection classification for emails different from Exchange message classification?

Exchange message classification is an older feature that can classify emails and it is implemented independently from Azure Information Protection classification. 

However, you can integrate the two solutions so that when users classify an email by using Outlook on the web and by using some mobile mail applications, the Azure Information Protection classification and corresponding label markings are automatically added. 

You can use this same technique to use your labels with Outlook on the web and these mobile mail applications.

For configuration steps, see [Integrate Exchange message classification with Azure Information Protection for a mobile device labeling solution](./rms-client/client-admin-guide-customizations.md#integration-with-exchange-message-classification-for-a-mobile-device-labeling-solution).
