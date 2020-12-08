---
title: Quickstart - Configure a label for users to easily protect emails with Azure Information Protection (AIP)
description: Configure a label that protects an email for a user by automatically applying the Do Not Forward protection.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 08/04/2020
ms.topic: quickstart
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: aiplabels
#ms.reviewer: demizets
#ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin
#Customer intent: As an administrator, I want to make it easy for users to protect their emails that contain sensitive information.
---

# Quickstart: Configure a label for users to easily protect emails that contain sensitive information

>***Applies to**: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*
>
> ***Relevant for**: [Azure Information Protection classic client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

>[!NOTE]
> To provide a unified and streamlined customer experience, **Azure Information Protection classic client** and **Label Management** in the Azure Portal are being **deprecated** as of **March 31, 2021**. This time-frame allows all current Azure Information Protection customers to transition to our unified labeling solution using the Microsoft Information Protection Unified Labeling platform. Learn more in the official [deprecation notice](https://aka.ms/aipclassicsunset).

In this quickstart, you'll configure an existing Azure Information Protection label to automatically apply the **Do Not Forward** protection setting.

The current Azure Information Protection policy already contains two labels that have this configuration:

- **Confidential \ Recipients Only**

- **Highly Confidential \ Recipients Only**

However, if your policy is older, or if protection wasn't activated at the time your organization's policy was created, you won't have these labels.

**Time required:** You can finish this configuration in 5 minutes.

## Prerequisites

To complete this quickstart, you need:

|Requirement  |Description  |
|---------|---------|
|**A supporting subscription**     |  You'll need a subscription that includes [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection/). <br><br>If you don't have one of these subscriptions, you can create a [free](https://admin.microsoft.com/Signup/Signup.aspx?OfferId=87dd2714-d452-48a0-a809-d2f58c4f68b7) account for your organization.       |
|**AIP added to the Azure portal**    |  You've added the Azure Information Protection pane to the Azure portal, and confirmed that the protection service is activated. <br><br>For more information, see [Quickstart: Get started in the Azure portal](quickstart-viewpolicy.md).       |
|**An existing Azure Information Protection label to configure**     | Use one of the default labels, or a label that you've created. For more information, see  [Quickstart: Create a new Azure Information Protection label for specific users](quickstart-label-specificusers.md). |
|**Classic client installed**    |   To test the new label, you'll need the classic client installed on your computer. <br><br>The Azure Information Protection classic client is being deprecated in March  2021. To deploy the AIP classic client, open a support ticket to get download access.  |
|**A Windows computer, signed into Office apps** |To test the new label, you'll need a  computer running Windows (minimum of Windows 7 with Service Pack 1). <br><br>On this computer, sign into one of the following Office app versions: <br><br>- **Office apps,** for the versions listed in the [table of supported versions for Microsoft 365 Apps by update channel](/officeupdates/update-history-microsoft365-apps-by-date), from Microsoft 365 Apps for Business or Microsoft 365 Business Premium, when the user is assigned a license for Azure Rights Management (also known as Azure Information Protection for Office 365). <br>- **Microsoft 365 Apps for Enterprise.** <br>- **Office Professional Plus 2019.** <br>- **Office Professional Plus 2016**.<br>- **Office Professional Plus 2013 with Service Pack 1**. <br>- **Office Professional Plus 2010 with Service Pack 2**.|
| | |

For a full list of prerequisites to use Azure Information Protection, see [Requirements for Azure Information Protection](requirements.md).

## Configure an existing label to apply the Do Not Forward protection

1. Open a new browser window and sign in to the [Azure portal](https://portal.azure.com) as a global admin. Then navigate to **Azure Information Protection**.

    For example, in the search box for resources, services, and docs: Start typing **Information** and select **Azure Information Protection**.

    If you are not the global admin, use the following link for alternative roles: [Signing in to the Azure portal](configure-policy.md#signing-in-to-the-azure-portal)

1. From the **Classifications** > **Labels** menu option: On the **Azure Information Protection - Labels** pane, select the label you want to configure to apply the protection.

1. On the **Label** pane, locate **Set permissions for documents and emails containing this label**. Select **Protect**, and the **Protection** pane automatically opens if **Not configured** or **Remove Protection** was previously selected.

    If the **Protection** pane does not automatically open, select **Protection**:

    :::image type="content" source="media/info-protect-protection-bar-configured.png" alt-text="Configure protection for an Azure Information Protection label":::

1. On the **Protection** pane, make sure that **Azure (cloud key)** is selected.

1. Select **Set user-defined permissions (Preview)**.

1. Make sure that the following option is selected: **In Outlook apply Do Not Forward**.

1. If selected, clear the following option: **In Word, Excel, PowerPoint and File Explorer prompt user for custom permissions**.

1. Click **OK** on the **Protection** pane, and then click **Save** on the **Label** pane.

Your label is now configured to display in Outlook only, and apply the **Do Not Forward** protection to emails.

## Test your new label

Your configured label displays only in Outlook and is suitable for emails sent to any recipient outside your organization when Exchange Online is configured for the [new capabilities in Office 365 Message Encryption](https://support.office.com/article/7ff0c040-b25c-4378-9904-b1b50210d00e).

1. On your computer, open Outlook and create a new email message. If Outlook is already open, restart it to force a policy refresh.

2. Specify the recipients, some text for the email message, and then apply the label that you just created.

    The email message is classified according to the label name, and protected with the Do Not Forward restriction.

3. Send the email.

The result is that recipients cannot forward the email, or print it, copy from it, or save attachments, or save the email as a different name. The protected email message can be read by any user, on any device.

## Clean up resources

Do the following if you do not want to keep this configuration and return your label such that it doesn't apply protection:

1. From the **Classifications** > **Labels** menu option: On the **Azure Information Protection - Labels** pane, select the label you configured.

1. On the **Label** pane, locate **Set permissions for documents and emails containing this label**, select **Not configured**, and select **Save**.

## Next steps

This quickstart includes the minimum options so that you can quickly configure a label that makes it easy for users to protect their emails. However, if the configuration is too restrictive, or not restrictive enough, see the other example configurations:

- [Label for protected email that supports less restrictive permissions than Do Not Forward](configure-policy-protection.md#example-4-label-for-protected-email-that-supports-less-restrictive-permissions-than-do-not-forward)

- [Label that encrypts content but doesn't restrict who can access it](configure-policy-protection.md#example-5-label-that-encrypts-content-but-doesnt-restrict-who-can-access-it)

For full instructions how to configure a label that applies protection, see [How to configure a label for Rights Management protection](configure-policy-protection.md).
