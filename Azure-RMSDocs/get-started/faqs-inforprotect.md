---
# required metadata

title: Frequently asked questions about classification and labeling | Azure Information Protection
description: Have a question about the preview release of Azure Information Protection? See if it's answered here. 
author: cabailey
manager: mbaldwin
ms.date: 09/07/2016
ms.topic: article
ms.prod:
ms.service: rights-management
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

## What can I do with Azure Information Protection?

The Azure Information Protection client adds an Information Protection bar to Microsoft Office applications that lets you view and modify assigned classification labels to data. Classification can be done manually, or recommended for you, or automatically applied. For the classifications that you specify, data can be protected by using a Rights Management service.  

The classification labels and behavior are configured in the Azure portal. You can use the default built-in policy to very quickly evaluate Azure Information Protection, or fully customize your own policies. You can change the colors, names, and the order of the classification labels that users see. You can also configure tooltips and classification visual markings such as the header, footer, or a watermark.

Try our quick start tutorial to see this working in just a few minutes: [Quick start tutorial for Azure Information Protection](infoprotect-quick-start-tutorial.md).

The current release has the following limitations. Look out for announcements on the [Enterprise Mobility and Security Blog](https://blogs.technet.microsoft.com/enterprisemobility/?product=azure-information-protection) and our [Yammer site](https://www.yammer.com/askipteam/#/threads/inGroup?type=in_group&feedId=8652489&view=all) for when additional features and capabilities become available:

- There is no centralized logging for classification and labeling.

- Label names and tooltips are supported in one language only.

- Conditions for automatic classification must be phrases or patterns.

- Files cannot be classified from Windows File Explorer.

- Office apps for mobile devices (iOS and Android) and Mac computers, and the Office web apps (Office Online) are not yet supported.

- No integration with Exchange Online or SharePoint Online.

- The SDK for partners and developers is not available.

## Do I need to be a global admin to try Azure Information Protection?

To configure the Azure Information Protection policy, you must sign in to the Azure portal as a global admin for Azure Active Directory.

However, if you select the option to install the demo policy when you install the [Azure Information Protection client](https://www.microsoft.com/en-us/download/details.aspx?id=53018), you don't need to sign in to the portal to see and try out the labeling functionality. The demo policy locally installs the default policy for Azure Information Protection, so you can try labeling documents and emails, but you won't be able to change or add new labels without signing in to the Azure portal. 

## Does Azure Information Protection support on premises and hybrid scenarios?

Azure Information Protection is a cloud-based solution. If you have an interest in deploying Azure Information Protection for a hybrid scenario, please contact the Information Protection team, by sending an email to askipteam@microsoft.com.

## How do computers get the policy information from Azure Information Protection and how often is it refreshed?

Every time a user opens an an Office application, the Azure Information Protection client checks to see if there is a later version of the Azure Information Protection policy. In addition, Office applications check every 24 hours. If there is a later version, the client downloads it using an HTTPS link to secure the data. 

If multiple instances of the Office application are loaded when a new Azure Information Protection policy is published, you must close all instances to get the latest version of the policy. For example, you have two Word documents open and want to test the updated Azure Information Protection policy in just one document: Close both Word documents and reopen the document that you want to use with the latest policy.

## Where can files be stored to use Azure Information Protection? 

Because Azure Information Protection applies persistent labels and protection to files and emails, it doesn't matter where the files are stored.

## Can I classify only new data, or can I also classify existing data?

Azure Information Protection policy actions take effect when documents are saved and emails are sent, for both new content and changes to existing content. 

If you have saved files that you want to classify, simply open and save them in your Office application. 

Currently, you cannot scan and apply classification in bulk, and must open and save each document in the Office application. 

## Can I use Azure Information Protection for classification only, without enforcing encryption and restricting usage rights?

Yes. You can configure an Azure Information Protection policy that only applies a label. In fact, we expect this to be the majority case for deployment networks where you need to protect only a subset of documents or emails that require special data management.

## How does automatic classification work?

In the Azure portal, you can use predefined patterns, such as “Credit card numbers” or “USA Social Security Number”. Or, you can define a custom string or pattern as a condition for automatic classification.

You'll see an example of this in the [Quick start tutorial for Azure Information Protection](infoprotect-quick-start-tutorial.md). 

The accuracy of classification depends on how you configure the classification rule, which is based on conditions. Currently, conditions support text patterns and regular expressions. For an explanation of each of the options available during the preview, with some suggested examples for you to test, see [How to configure conditions for automatic and recommended classification for Azure Information Protection](../deploy-use/configure-policy-classification.md). The detection runs when the document is saved, or an email is sent.

For the best user experience and to ensure business continuity, we recommend that you start with user recommendation actions, rather than fully automatic actions. This gives your users the ability to accept the labeling or protection action, or override these suggestions.   

## Can Azure Information Protection prompt users to classify files themselves rather than use automatic classification? 

Yes. Use the Azure portal to configure whether to use automatic classification or make a recommendation to users, by setting the option **Select how this label is applied: automatically or recommended to user** to **Recommended**.

You'll see an example of this in the [Quick start tutorial for Azure Information Protection](infoprotect-quick-start-tutorial.md).  

## Can I force all documents to be classified?

Yes. If you require users to classify all files that they save, in the Azure portal, set the option **All documents and emails must have a label** to **On**. 

## Can I remove classification from a file?

Yes. To remove classification from a file, open the file in the Office application, click the **Edit label** icon in the Information Protection bar, click the **Remove label** icon, and then click **OK** to confirm your action. 


## Can I prompt users to justify why they are changing the classification level?

Yes. To make sure users justify their change of classification, in the Azure portal, set the option **Users must provide justification to set a lower classification label, remove a label, or remove protection** to **On**. When they do this, their action and justification reason is logged in their local Windows event log: **Application** > **Microsoft Azure Information Protection**.

## How can I automatically protect the content after it's been classified?

In the Azure portal, you can select a Rights Management template to automatically protect the content, according to the classification level that you specify.

You'll see an example of this in the [Quick start tutorial for Azure Information Protection](infoprotect-quick-start-tutorial.md). For more information, see [How to configure a label to apply Rights Management protection](../deploy-use/configure-policy-protection.md).

## Can a file be classified with two different classifications?

If required, you can create sub-labels to better describe sub-categories for a specific sensitivity label. For example, the principal label **Secret** might contain sub-labels such as **Secret \ Legal** and **Secret \ Finance**. You can then apply different classification visual markings and different Rights Management templates to different sub-labels.

Although you can currently set visual markings, protection, and conditions at both levels, when you use sub-levels, configure these setting on the sub-level only. If you configure the same settings on the parent label and its sub-level, the settings at the sub-level take precedence.

## How can DLP solutions and other applications integrate with Azure Information Protection?

Because Azure Information Protection uses persistent metadata for classification, which includes a clear text label, this information can be read by DLP solutions and other applications. In files, this metadata is stored in custom properties; in emails, this information is in the email headers.

## How does document tracking and revocation work for Azure Information Protection?

Document tracking for files that you classify and protect by using Azure Information Protection works with Azure Rights Management protection and the RMS sharing application. You can also access the document tracking site by using the Azure Information Protection client (version 1.0.233 or later): 

- In an Office application, on the **Home** tab, in the **Protection** group, click **Protect** > **Track usage**. 

For more information, see [Track and revoke your documents when you use the RMS sharing application](../rms-client/sharing-app-track-revoke.md).

## Can I control which users can use Azure Information Protection to classify and protect content?

You can restrict which users classify and protect data by controlling the distribution of the Azure Information Protection client. 

Files and emails that are classified by Azure Information Protection can be consumed or edited by any user, with or without the Azure Information Protection client installed. 

## How can I report a problem or send feedback for Azure Information Protection?

If you have a problem with Azure Information Protection and you are using the current release of the client: In your Office application, on the **Home** tab, in the **Protection** group, click **Protect**, and then click **Help and feedback**. In the **Microsoft Azure Information Protection** dialog box, click **Send feedback**. This emails the Information Protection team, and automatically attaches log files from your PC to help diagnose the problem. 

If you have questions or feedback, use the [Azure Information Protection Yammer site](https://www.yammer.com/askipteam/). 