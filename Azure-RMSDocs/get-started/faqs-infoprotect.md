---
# required metadata

title: Frequently asked questions about classification and labeling | Azure Information Protection
description: Have a question about the preview release of Azure Information Protection? See if it's answered here. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 12/21/2016
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

The Azure Information Protection client adds an Information Protection bar to Microsoft Office applications that lets you view and modify assigned classification labels to data. Classification can be done manually, or recommended for you, or automatically applied. For the classifications that you specify, data can be protected by using a Rights Management service.  

The classification labels and behavior are configured in the Azure portal. You can use the default built-in policy to very quickly evaluate Azure Information Protection, or fully customize your own policies. You can change the colors, names, and the order of the classification labels that users see. You can also configure tooltips and classification visual markings such as the header, footer, or a watermark.

Try our quick start tutorial to see this working in just a few minutes: [Quick start tutorial for Azure Information Protection](infoprotect-quick-start-tutorial.md).

The current release has the following limitations. Look out for announcements on the [Enterprise Mobility and Security Blog](https://blogs.technet.microsoft.com/enterprisemobility/?product=azure-information-protection) and our [Yammer site](https://www.yammer.com/askipteam/#/threads/inGroup?type=in_group&feedId=8652489&view=all) for when additional features and capabilities become available:

- Label names and tooltips are supported in one language only.

- There is no centralized logging for classification and labeling.

- Conditions for automatic classification must be phrases or patterns.

- Office apps for mobile devices (iOS and Android) and Mac computers, and the Office web apps (Office Online) are not yet supported.

- No integration with Exchange Online or SharePoint Online.

- The SDK for partners and developers is not available.

Some of the limitations previously listed are now available in preview. For more information, see the blog post announcement: [Azure Information Protection December preview now available](https://blogs.technet.microsoft.com/enterprisemobility/2016/12/07/azure-information-protection-december-preview-now-available/).


## Do I need to be a global admin to try Azure Information Protection?

To configure the Azure Information Protection policy, you must sign in to the Azure portal as a global admin for Azure Active Directory.

However, if you select the option to install the demo policy when you install the [Azure Information Protection client](https://www.microsoft.com/en-us/download/details.aspx?id=53018), you don't need to sign in to the portal to see and try out the labeling functionality. The demo policy locally installs the default policy for Azure Information Protection, so you can try labeling documents and emails, but you won't be able to change or add new labels without signing in to the Azure portal. 

## Which options in the Azure portal are P1 or P2?

To check which features are included in the **Azure Information Protection Premium 1** (P1) subscription vs. the **Azure Information Protection Premium 2** (P2) subscription, see the [feature list](https://www.microsoft.com/en-us/cloud-platform/azure-information-protection-features) from the Azure Information Protection site. However, as a general guide, the advanced features such as automatic classification and hold your own key (HYOK) are specific to the Azure Information Protection Premium 2 subscription.

## Does Azure Information Protection support on premises and hybrid scenarios?

Azure Information Protection is a cloud-based solution. If you have an interest in deploying Azure Information Protection for a hybrid scenario, please contact the Information Protection team, by sending an email to askipteam@microsoft.com.

## How do computers get the policy information from Azure Information Protection and how often is it refreshed?

Every time a user opens an an Office application, the Azure Information Protection client checks to see if there is a later version of the Azure Information Protection policy. In addition, Office applications check every 24 hours. If there is a later version, the client downloads it using an HTTPS link to secure the data. 

If multiple instances of the Office application are loaded when a new Azure Information Protection policy is published, you must close all instances to get the latest version of the policy. For example, you have two Word documents open and want to test the updated Azure Information Protection policy in just one document: Close both Word documents and reopen the document that you want to use with the latest policy.

## Where can files be stored to use Azure Information Protection? 

Because Azure Information Protection applies persistent labels and protection to files and emails, it doesn't matter where the files are stored.

## Can I classify only new data, or can I also classify existing data?

Azure Information Protection policy actions take effect when documents are saved and emails are sent, for both new content and changes to existing content.

If you have the preview client, you can also quickly classify (and optionally, protect) existing files from File Explorer. 

## Can I use Azure Information Protection for classification only, without enforcing encryption and restricting usage rights?

Yes. You can configure an Azure Information Protection policy that only applies classification without protection, when the file type supports this action. In fact, we expect this to be the majority case for deployment networks where you need to protect only a subset of documents or emails that require special data management.

## How does automatic classification work?

In the Azure portal, you can use predefined patterns, such as “Credit card numbers” or “USA Social Security Number”. Or, you can define a custom string or pattern as a condition for automatic classification.

You'll see an example of this in the [Quick start tutorial for Azure Information Protection](infoprotect-quick-start-tutorial.md). 

The accuracy of classification depends on how you configure the classification rule, which is based on conditions. Currently, conditions support text patterns and regular expressions. For an explanation of each of the options available during the preview, with some suggested examples for you to test, see [How to configure conditions for automatic and recommended classification for Azure Information Protection](../deploy-use/configure-policy-classification.md). The detection runs when the document is saved, or an email is sent.

For the best user experience and to ensure business continuity, we recommend that you start with user recommendation actions, rather than fully automatic actions. This gives your users the ability to accept the labeling or protection action, or override these suggestions.   

## Can Azure Information Protection prompt users to classify files themselves rather than use automatic classification? 

Yes. Use the Azure portal to configure whether to use automatic classification or make a recommendation to users, by setting the option **Select how this label is applied: automatically or recommended to user** to **Recommended**.

You'll see an example of this in the [Quick start tutorial for Azure Information Protection](infoprotect-quick-start-tutorial.md).  

## Can I force all documents to be classified?

Yes. If you require users to classify all files that they save, in the Azure portal, configure the policy setting **All documents and emails must have a label** to **On**. 

## Can I remove classification from a file?

Yes. To remove classification from a file, open the file in the Office application, click the **Edit label** icon in the Information Protection bar, click the **Remove label** icon, and then click **OK** to confirm your action. 


## Can I prompt users to justify why they are changing the classification level?

Yes. To make sure users justify their change of classification, in the Azure portal, set the option **Users must provide justification to set a lower classification label, remove a label, or remove protection** to **On**. When they do this, their action and justification reason is logged in their local Windows event log: **Applications and Services Logs** > **Microsoft Azure Information Protection**.

## How can I automatically protect the content after it's been classified?

In the Azure portal, you can select a Rights Management template to automatically protect the content, according to the classification level that you specify.

You'll see an example of this in the [Quick start tutorial for Azure Information Protection](infoprotect-quick-start-tutorial.md). For more information, see [How to configure a label to apply Rights Management protection](../deploy-use/configure-policy-protection.md).

## Can a file have more than one classification?

Users can select just one label at a time for each document or email, which often results in just one classification. However, if users select a sub-label, this actually applies two labels at the same time; a primary label and a secondary label. By using sub-labels, a file can have two classifications that denote a parent\child relationship for an additional level of control.

For example, the label **Secret** might contain sub-labels such as **Legal** and **Finance**. You can apply different classification visual markings and different Rights Management templates to these sub-labels. A user cannot select the **Secret** label by itself; only one of its sub-labels, such as **Legal**. As a result, the label that they see set is **Secret \ Legal**. The metadata for that file includes one custom text property for **Secret**, one custom text property for **Legal**, and another that contains both values (**Secret Legal**). 

When you use sub-labels, don't configure visual markings, protection, and conditions at the primary label. When you use sub-levels, configure these setting on the sub-label only. If you configure these settings on the primary label and its sub-label, the settings at the sub-label take precedence.

## When an email is labeled, do any attachments automatically get the same labeling?

No. When you label an email message that has attachments, those attachments do not inherit the same label. The attachments remain either without a label or will retain a separately applied label. However, if the label for the email applies protection, that protection is applied to the attachments.

## How is Azure Information Protection classification for emails different from Exchange message classification?

Exchange message classification is an older feature that can classify emails and it is implemented independently from Azure Information Protection classification. However, you can integrate the two solutions so that when users classify an email using the Outlook web app and in some mobile mail applications, the Azure Information Protection classification and corresponding label markings is automatically added. Exchange adds the classification and the preview version of the Azure Information Protection client applies the corresponding label settings for that classification.

Although the Outlook web app doesn't yet natively support Azure Information Protection classification and protection, you can use this same technique to use your labels with this email client in addition to the desktop Outlook client.

To achieve this solution: 

1. Use the [New-MessageClassification](https://technet.microsoft.com/library/bb124400) Exchange PowerShell cmdlet to create message classifications with the Name property that maps to your label names in your Azure Information Protection policy. 

2. Create an Exchange transport rule for each label: Apply the rule when the message properties include the classification that you configured, and modify the message properties to set a message header. 

    For the message header, you'll find the information to specify by inspecting the properties of an Office file that you classified by using your Azure Information Protection label. Identify the file property that has the format **MSIP_Label_<GUID>_Enabled** and specify this string for the message header, and then specify **True** for the header value. For example, your message header might look like this string: **MSIP_Label_132616b8-f72d-5d1e-aec1-dfd89eb8c5b2_Enabled**


The following now happens when users use the Outlook web access app or a mobile device client that supports rights management protection: 

- Users select the Exchange message classification and send the email.

- The Exchange rule detects the Exchange classification and accordingly modifies the message header to add the Azure Information Protection classification.

- When recipients running the preview version of the Azure Information Protection client view the email in Outlook, they will see the Azure Information Protection label assigned and any corresponding email header, footer, or watermark. 

If your Azure Information Protection labels apply rights management protection, add this to the rule configuration by selecting the option to modify the message security, apply rights protection, and then select the RMS template or Do Not Forward option.

You can also configure transport rules to do the reverse mapping: When an Azure Information Protection label is detected, set a corresponding Exchange message classification. To do this:

- For each Azure Information Protection label, create a transport rule that is applied when the **msip_labels** header includes the name of your label (for example, **Confidential**), and apply a message classification that maps to this label.

## How can DLP solutions and other applications integrate with Azure Information Protection?

Because Azure Information Protection uses persistent metadata for classification, which includes a clear text label, this information can be read by DLP solutions and other applications. In files, this metadata is stored in custom properties; in emails, this information is in the email headers.

## How does document tracking and revocation work for Azure Information Protection?

Document tracking for files that you classify and protect by using Azure Information Protection works with Azure Rights Management protection and the RMS sharing application. You can also access the document tracking site by using the Azure Information Protection client (version 1.0.233 or later): 

- In an Office application, on the **Home** tab, in the **Protection** group, click **Protect** > **Track usage**. 

For more information, see [Track and revoke your documents when you use the RMS sharing application](../rms-client/sharing-app-track-revoke.md).

## Can I control which users can use Azure Information Protection to classify and protect content?

You can restrict which users classify and protect data by controlling the distribution of the Azure Information Protection client. You add new labels just for specified users when you configure a [scoped policy](../deploy-use\configure-policy-scope.md). 

Files and emails that are classified by Azure Information Protection can be consumed or edited by any user, with or without the Azure Information Protection client installed. 

## How do I sign in as a different user?

In a production environment, you wouldn't usually need to sign in as a different user when you're using the Azure Information Protection client. However, you might need to do so if you have multiple tenants. For example, you have a test tenant in addition to the Office 365 or Azure tenant that your organization uses.

You can verify which account you're currently signed in as by using the **Microsoft Azure Information Protection** dialog box: Open an Office application and on the **Home** tab, in the **Protection** group, click **Protect**, and then click **Help and feedback**. Your account name is displayed in the **Client status** section.

Especially when you're using an administrator account, be sure to check the domain name of the signed in account that's displayed. For example, if you have an "admin" account in two different tenants, it can be easy to miss that you're signed in with the right account name but wrong domain. A symptom of this can be failing to download the Azure Information Protection policy, or not seeing the labels or behavior that you expect.

To sign in as a different user, you must currently edit the registry:

1. Using a registry editor, navigate to **HKEY_CURRENT_USER\SOFTWARE\Microsoft\MSIP** and delete the **TokenCache** value.

2. Restart any open Office applications and sign in with your different user account. If you do not see a prompt in your Office application to sign in to the Azure Information Protection service, return to the **Microsoft Azure Information Protection** dialog box and click **Sign in** from the updated **Client status** section.

Additionally:

- If you want to reinitialize the environment for the Azure Rights Management service (also known as bootstrapping), you can do this by using the **Reset** option from the [RMS Analyzer tool](https://www.microsoft.com/en-us/download/details.aspx?id=46437).

- If you want to delete the currently downloaded Azure Information Protection policy, you can do so by deleting the **Policy.msip** file from the %localappdata%\Microsoft\MSIP folder.

## How can I report a problem or send feedback for Azure Information Protection?

If you have a problem with Azure Information Protection and you are using the current release of the client: In your Office application, on the **Home** tab, in the **Protection** group, click **Protect**, and then click **Help and feedback**. In the **Microsoft Azure Information Protection** dialog box, click **Send feedback**. This emails the Information Protection team, and automatically attaches log files from your PC to help diagnose the problem. 

If you have questions or feedback, use the [Azure Information Protection Yammer site](https://www.yammer.com/askipteam/). 