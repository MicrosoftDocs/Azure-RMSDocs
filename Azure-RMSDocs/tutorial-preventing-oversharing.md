---
# required metadata

title: Tutorial - Preventing oversharing using Azure Information Protection (AIP)
description: A detailed tutorial for using the Azure Information Protection (AIP) client to prevent users from oversharing your content.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 08/04/2020
ms.topic: tutorial
ms.collection: M365-security-compliance
ms.service: information-protection

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

- Implement pop-up messages in Outlook that warn, justify, or block emails being sent
https://docs.microsoft.com/en-us/azure/information-protection/infoprotect-oversharing-tutorial
https://docs.microsoft.com/en-us/azure/information-protection/rms-client/clientv2-admin-guide-customizations#implement-pop-up-messages-in-outlook-that-warn-justify-or-block-emails-being-sent
PDF for creditsuisse adding for Q3

# Tutorial: Preventing oversharing using Azure Information Protection (AIP)

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*
>
>*Instructions for: [Azure Information Protection unified labeling client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

System administrators must ensure that their organization's content remains secure, and is shared only with trusted users. Preventing oversharing can include limiting internal access to specific users only, or sharing content only with trusted external users.

One of the most comment methods that users share content inappropriately is email, either in the email itself or as an attachment. 

**Time required:** You can complete this tutorial in less than 20 minutes.

In this tutorial, you learn how to:
> [!div class="checklist"]
> * Configure a warning message to display for emails that are labeled **General**
> * Create an exception for your warning messages for internal emails that are labeled **General**
> * Require users to justify sending emails with no label
> * Configure the justification prompt that's displayed for unlabeled emails
> * Block users from sending PowerPoint files with no labels
> * Configure the block message displayed unlabeled PowerPoint files
> * See your settings in action
> * Review the logged user messages and actions in the Event Log 

## Tutorial prerequisites

Make sure you have the following system requirements before starting this tutorial.

|Prerequisites  |Description  |
|---------|---------|
|**Azure Information Protection unified labeling client** | Make sure that the Azure Information Protection unified labeling client is installed on your machine. </br></br>For more information see, [Tutorial: Deploying the Azure Information Protection (AIP) unified labeling client](tutorial-deploy-client.md). |
|**Azure Information Protection subscription**     |   You must have an Azure [subscription](https://admin.microsoft.com/Signup/Signup.aspx?OfferId=87dd2714-d452-48a0-a809-d2f58c4f68b7) that includes **Azure Information Protection Plan 2.**      |
|**Access to the Azure portal**     |    Make sure that you can access [Azure portal](https://portal.azure.com), using one of the following administrator accounts: ???     |
|**Sensitivity labels**     |  A **General** sensitivity label configured in your policy. </br></br>Sensitivity labels are configured in your labeling management center, including the Office 365 Security & Compliance Center, Microsoft 365 Security center, or Microsoft 365 Compliance Center.  </br></br>**Note**: We recommend using a testing policy for this tutorial so that you don't affect your live policy. </br>Make sure that you have the name of your policy handy, as well as the GUID for your **General** label.   |
|**Machine requirements**     |  A computer running Windows, minimum version Windows ???. </br>Make sure that PowerShell is installed, and that you have the ability to run PowerShell as an administrator. </br></br>Additionally, make sure you can sign into Outlook. Be prepared to restarted Outlook multiple times during this tutorial.     |
| | |

Let's get started. 

## Implement a warning message for emails labeled as General

This procedure describes how to cause Outlook to warn users before they send an email labeled **General**. 

The users can choose to heed the warning, and either change the label or the content, or they can choose to send the email anyway.

1. Run PowerShell as an administrator.

1. Run the following command, to define a warning message for the **General** label. 

    ```PowerShell
    Set-LabelPolicy -Identity Global -AdvancedSettings @{OutlookWarnUntrustedCollaborationLabel="8faca7b8-8d20-48a3-8ea2-0f96310a848e"}
    ```

    In this example, the GUID for the **General** label is **8faca7b8-8d20-48a3-8ea2-0f96310a848e**.

    > [!TIP]
    > If you wanted to apply this setting to multiple labels, list their GUIDs in the value, separated by commas.

1. Test your setting in Outlook:

    1. On your client computer, open Outlook, or restart Outlook to pull the updated settings.

    1. Create a new email message, and apply the **General** label. In the message toolbar, click the :::image type="icon" source="media/i-sensitivity.PNG" border="false"::: **Sensitivity** button and then select **General**.

    1. Define the **To** field with your own email address, the **Subject field** as: `Testing the General label for the Warn message`, and then send the email.

        You should see the following warning, asking you to confirm before sending the email. For example:

        ![Azure Information Protection tutorial - see OutlookWarnUntrustedCollaborationLabel advanced client setting ](./media/see-warnmessage.png)

    1. Pretend that you're a user who has mistakenly tried to email something that was labeled **General**. In this case, you want to heed the warning, so click **Cancel**.

        Your email is not sent, but remains open so that you can either change the content or the label.

    1. There's no need to make any changes, and you can decide that the content is appropriate to send. This time, when the warning appears, click **Confirm and Send**.

        The email is sent.

## Show a warning message for General emails only when they're sent externally

This procedure describes how to add an exception to the warning message you configured earlier, so that the warning message is only displayed for external recipients.

When sending a **General** email internally, the warning message is not displayed.

1. Run PowerShell as an administrator.

1. Run the following command to define your domain as a trusted domain for warning messages. When you copy this command, replace **contoso.com** with your own domain.

    ```PowerShell
    Set-LabelPolicy -Identity Global -AdvancedSettings @{OutlookBlockTrustedDomains="contoso.com"}    
    ```

    > [!TIP]
    > If you wanted to apply this setting to multiple domains, such as if you wanted to add trusted partners, list their domains in the value, separated by commas.

1. Test your setting in Outlook:

    1. On your client computer, open Outlook, or restart Outlook to pull the updated settings.

    1. Create a new email message, and apply the **General** label. In the message toolbar, click the :::image type="icon" source="media/i-sensitivity.PNG" border="false"::: **Sensitivity** button and then select **General**.

    1. Define the **To** field with your own email address, the **Subject field** as: `Testing the General label for the Warn message`, and then send the email.

        The email is sent, and no warning is displayed.

## Request users to justify sending unlabeled content

This procedure describes how to configure advanced settings so that users must justify their reasoning for sending unlabeled content. 

You won't prevent them from sending it, but you'd like to encourage labeling in your organization. 

1. Run PowerShell as an administrator.

1. Run the following command to have Outlook display a justification message for your users if they try to send an email without a label:

    ```PowerShell
    Set-LabelPolicy -Identity Global -AdvancedSettings @{OutlookUnlabeledCollaborationAction="Justify"}
    ```

1. Test your setting in Outlook:

    1. On your client computer, open Outlook, or restart Outlook to pull the updated settings.

    1. Create a new email message, and make sure there is no label applied. 
    
        For example, if your policy applies a default label, use the :::image type="icon" source="media/i-sensitivity.PNG" border="false"::: button to remove it. 

    1. Define the **To** field with your own email address, the **Subject field** as: `Testing the General label for the Justification message`, and then send the email.
    
        A popup is displayed similar to the following: 

        :::image type="content" source="media/see-nolabljustify.png" alt-text="Sample justification required for unlabled messages":::

    1. Select one of the options. If you select the third option **Other, as explained**, enter some sample text in the text box. 
    
    1. Click **Confirm and Send**.
    
        The email is sent.

## Customize the free text justification prompt

This procedure describes how to customize the third option in the default justification message. 

For example, you may want to add text there to prompt the user to add specific details, or remind users not to enter any sensitive data.

1. Run PowerShell as an administrator.

1. Run the following command to have Outlook display a justification message for your users if they try to send an email without a label:

    ```PowerShell
    Set-LabelPolicy -Identity Global -AdvancedSettings @{JustificationTextForUserText="Other (please explain) - Do not enter sensitive info"}
    ```

    > [!TIP]
    > Feel free to replace the value in quotes with any other text you want to add there instead. 

1. Test your setting in Outlook:

    1. On your client computer, open Outlook, or restart Outlook to pull the updated settings.

    1. Create a new email message, and make sure there is no label applied. 

        For example, if your policy applies a default label, use the :::image type="icon" source="media/i-sensitivity.PNG" border="false"::: button to remove it. 

    1. Define the **To** field with your own email address, the **Subject field** as: `Testing the General label for the customized Justification message`, and then send the email.
    
        The justification popup is displayed, this time with your customized text. For example: 

        TBD
        
## Show a warning, justification, or warning popup message for specific labels

This procedure supports a use case scenario where users send emails, or emails with attachments, that have a specific label.
Configure a warning, justification, or blocking message to appear in Outlook, depending on the label detected.

1. Run PowerShell as an administrator. 

1. Run the **Set-LabelPolicy** cmdlet to define AIP advanced settings, using the following syntax:
    
    ```PowerShell
    Set-LabelPolicy -Identity Global -AdvancedSettings @{<Key>="<Value>"}
    ```

    Where:

    - <Key> is one of the following:
        - **OutlookWarnUntrustedCollaborationLabel** to set a warning popup
        - **OutlookJustifyUntrustedCollaborationLabel** to set a justification popup
        - **OutlookBlockUntrustedCollaborationLabel** to block the email and set a blocking popup
        
    - <Value> is at least one label GUID. Separate multiple GUIDs by commas to apply the same popup to multiple labels

> [!TIP]
> For the sake of this tutorial and following the instructions to [test your settings](#test-your-settings), make sure to set the **General** label to show a warning message.
> 

For example:

```PowerShell
Set-LabelPolicy -Identity Global -AdvancedSettings @{OutlookWarnUntrustedCollaborationLabel="8faca7b8-8d20-48a3-8ea2-0f96310a848e,b6d21387-5d34-4dc8-90ae-049453cec5cf,bb48a6cb-44a8-49c3-9102-2d2b017dcead,74591a94-1e0e-4b5d-b947-62b70fc0f53a,6c375a97-2b9b-4ccd-9c5b-e24e4fd67f73"}

Set-LabelPolicy -Identity Global -AdvancedSettings @{OutlookJustifyUntrustedCollaborationLabel="dc284177-b2ac-4c96-8d78-e3e1e960318f,d8bb73c3-399d-41c2-a08a-6f0642766e31,750e87d4-0e91-4367-be44-c9c24c9103b4,32133e19-ccbd-4ff1-9254-3a6464bf89fd,74348570-5f32-4df9-8a6b-e6259b74085b,3e8d34df-e004-45b5-ae3d-efdc4731df24"}

Set-LabelPolicy -Identity Global -AdvancedSettings @{OutlookBlockUntrustedCollaborationLabel="0eb351a6-0c2d-4c1d-a5f6-caa80c9bdeec,40e82af6-5dad-45ea-9c6a-6fe6d4f1626b"}
```

## Prevent popups from being displayed for trusted domains

Once you've configured popup messages for specific labels, you can define un-trusted domains for each message type. 
This ensures that the specified message type is not displayed for any domains that you trust, such as your own domain, or those of trusted partners.

1. Run PowerShell as an administrator.

1. Run the **Set-LabelPolicy** cmdlet to define AIP advanced settings, using the following syntax:
    
    ```PowerShell
    Set-LabelPolicy -Identity Global -AdvancedSettings @{<Key>="<Value>"}
    ```

    Where:

    - <Key> is one of the following:
        - **OutlookWarnTrustedDomains** to define trusted domains for warning messages. Warning messages will not be displayed when emails are sent to these domains.
        - **OutlookJustifyTrustedDomains** to define trusted domains for justification messages. Justification messages will not be displayed when emails are sent to these domains.
        - **OutlookBlockTrustedDomains** to define trusted domains for blocked emails. Emails will not be blocked, and blocking messages will not be displayed, when emails are sent to these domains.
            
    - <Value> is at least one label domain name. Separate multiple domain names by commas to apply the same settings to multiple domains.

For example, say that you've specified that the emails and email attachments with the **Confidential \ All Employees** label should be blocked from sending, using the **[OutlookBlockUntrustedCollaborationLabel](#show-a-warning-justification-or-warning-popup-message-for-specific-labels)** advanced setting. 

- You *do* want users to be able to send this content within your own domain, **contoso.com,** as well as the domains of your trusted partners, **fabrikam.com** and **litware.com.**
- You *do not* want users to be able to send this content to emails with a **gmail.com** domain.

If your policy is named **Global**, you'd use the following command to add trusted domains for your **Confidential \ All Employees** label, while keeping **gmail.com** blocked.

```PowerShell
Set-LabelPolicy -Identity Global -AdvancedSettings @{OutlookBlockTrustedDomains="gmail.com"}
```

As an additional example, say that you've specified that the emails and email attachments with the **Employees \ Extended** label should require justification, using the **[OutlookBlockUntrustedCollaborationLabel](#show-a-warning-justification-or-warning-popup-message-for-specific-labels)** advanced setting. You want to remove this justification requirement for your own domain, **contoso.com,** as well as the domains of your trusted partners, **fabrikam.com** and **litware.com.**

In this case, if your policy is named **Global**, you'd use the following command to add trusted domains for your **Employees \ Extended** label, while keeping **gmail.com** blocked.

```PowerShell
Set-LabelPolicy -Identity Global -AdvancedSettings @{OutlookJustifyTrustedDomains="contoso.com,fabrikam.com,litware.com"}
```    

## Implement warn, justify, or blocking popup messages for unlabeled content

Make sure to address emails or email attachments that don't have any labels. Handle unlabeled content in Outlook using any of the following methods:

- Show a warning message, prompting users to add a label
- Show a justification message, prompting users to justify sending unlabeled content
- Show a block message and block the message entirely, requiring users to add a label
- Allow the email to be sent smoothly, without showing any message at all

Use the **OutlookUnlabeledCollaborationAction** advanced client setting, with one of the following values:

- **Warn**
- **Justify**
- **Block**
- **Off**

For example, if your policy is named **Global**, use the following command to warn users about unlabeled content being send in Outlook:

```PowerShell
Set-LabelPolicy -Identity Global -AdvancedSettings @{OutlookUnlabeledCollaborationAction="Warn"}
```

## Specify file extensions for unlabeled content

By default, the warn, justify, and blocking pop-up messages in Outlook apply to all Office documents and PDFs attached to your emails, as well as the emails themselves.

You can further define your message popups by defining specific file extenstions where they are used. 

For example, if you list only Office file types, unlabeled PDF files attached to your emails will not show a warn, justify, or blocking message.

Use the **OutlookOverrideUnlabeledCollaborationExtensions** advanced property to define the file extensions where you want popup messages to be displayed, with a comma-separated list of all your file types.

For example, if your policy is named **Global**, use the following command to show popup messages on PowerPoint files or templates only:

```PowerShell
Set-LabelPolicy -Identity Global -AdvancedSettings @{OutlookOverrideUnlabeledCollaborationExtensions=".PPTX,.PPTM,.POTX,.POTM,.POT,.PPTX"}
```

## Specify a separate action for email messages without attachments

By default, the same action is applied both to the emails with attachments and emails without attachments.

Use the **OutlookUnlabeledCollaborationActionOverrideMailBodyBehavior** advanced setting to define a different action for email messages without attachments, with one of the following values:

- **Warn**: Show a warning message, instead of the action defined by other settings
- **Justify**: Request justification, instead of the action defined by other settings
- **Block**: Block the email and show a blocking message, instead the action defined by other settings
- **Off**: Take no action, and show no message, instead of the action defined by other settings

For example, if your policy is named **Global**, use the following command to have a warning message appear for unlabeled content, regardless of other settings:

```PowerShell
Set-LabelPolicy -Identity Global -AdvancedSettings @{OutlookUnlabeledCollaborationActionOverrideMailBodyBehavior="Warn"}
```

## Test your settings

Test the advanced settings that you've defined in the sections above to verify that popup messages display as expected. 

1. On your AIP client computer open Outlook. If Outlook is already open, restart it to download the changes you've made.

1. Create a new email message, and apply the **General** label. In the message toolbar, click the :::image type="icon" source="media/i-sensitivity.PNG" border="false"::: **Sensitivity** button and then select **General**.

1. Define the **To** field with your own email address, the **Subject field** as: `Testing the General label for the Warn message`, and then send the email.

    You should see the following warning, asking you to confirm before sending the email. For example:

    ![Azure Information Protection tutorial - see OutlookWarnUntrustedCollaborationLabel advanced client setting ](./media/see-warnmessage.png)

1. Pretend that you're a user who has mistakenly tried to email something that was labeled **General**. In this case, you want to heed the warning, so click **Cancel**.

    Your email is not sent, but remains open so that you can either change the content or the label.

1. There's no need to make any changes, and you can decide that the content is appropriate to send. This time, when the warning appears, click **Confirm and Send**.

    The email is sent.

### Use Event Log to identify the messages and user actions for the General label

Before we move on to the next scenario for when an email or attachment doesn't have a label, start Event Viewer and navigate to **Applications and Services Logs** > **Azure Information Protection**.

For each of the tests that you did, information events are created to record both the message and the user response:

- Warn messages: Information ID 301

- Justify messages: Information ID 302

- Block messages: Information ID 303

For example, the first test was to warn the user, and you selected **Cancel**, so the **User Response** displays **Dismissed** in the first Event 301. For example:

```
Client Version: 1.53.10.0
Client Policy ID: e5287fe6-f82c-447e-bf44-6fa8ff146ef4
Item Full Path: Testing the General label for the Warn message.msg
Item Name: Testing the General label for the Warn message
Process Name: OUTLOOK
Action: Warn
Label After Action: General
Label ID After Action: 0e421e6d-ea17-4fdb-8f01-93a3e71333b8
Action Source: 
User Response: Dismissed
```

However, you then selected **Confirm and Send**, which is reflected in the next Event 301, where the **User Response** displays **Confirmed**:

```
Client Version: 1.53.10.0
Client Policy ID: e5287fe6-f82c-447e-bf44-6fa8ff146ef4
Item Full Path: Testing the General label for the Warn message.msg
Item Name: Testing the General label for the Warn message
Process Name: OUTLOOK
Action: Warn
Label After Action: General
Label ID After Action: 0e421e6d-ea17-4fdb-8f01-93a3e71333b8
Action Source: 
User Response: Confirmed
```

The same pattern is repeated for the justify message, which has an Event 302. The first event has a **User Response** of **Dismissed**, and the second shows the justification that was selected. For example:

```
Client Version: 1.53.10.0
Client Policy ID: e5287fe6-f82c-447e-bf44-6fa8ff146ef4
Item Full Path: Testing the General label for the Justify message.msg
Item Name: Testing the General label for the Justify message
Process Name: OUTLOOK
Action: Justify
Label After Action: General
Label ID After Action: 0e421e6d-ea17-4fdb-8f01-93a3e71333b8
User Justification: I confirm the recipients are approved for sharing this content
Action Source: 
User Response: Confirmed

```

At the top of the event log, you see the block message logged, which has an Event 303. For example:

```
Client Version: 1.53.10.0
Client Policy ID: e5287fe6-f82c-447e-bf44-6fa8ff146ef4
Item Full Path: Testing the General label for the Block message.msg
Item Name: Testing the General label for the Block message
Process Name: OUTLOOK
Action: Block
Label After Action: General
Label ID After Action: 0e421e6d-ea17-4fdb-8f01-93a3e71333b8
Action Source: 
```

### Use Event Log to identify the messages and user actions for the unlabeled email

As before, the messages and user responses are logged in Event Viewer, **Applications and Services Logs** > **Azure Information Protection**, with the same event IDs.

- Warn messages: Information ID 301

- Justify messages: Information ID 302

- Block messages: Information ID 303

For example, the results of our justification prompt when the email didn't have a label:

```
Client Version: 1.53.10.0
Client Policy ID: e5287fe6-f82c-447e-bf44-6fa8ff146ef4
Item Full Path: Testing send an email without a label for the Justify message.msg
Item Name: Testing send an email without a label for the Justify message
Process Name: OUTLOOK
Action: Justify
User Justification: My manager approved sharing of this content
Action Source: 
User Response: Confirmed
```

## Clean up resources

Once you're finished with this tutorial, you can keep the policy for further reference, or delete it to clean up your resources.

Delete your policy wherever it was created, either in the ???.

Once deleted, restart Outlook so that it's no longer configured with the settings defined in this tutorial.

## Next steps

For quicker testing, this tutorial used an email message to a single recipient, and without attachments. 

Apply the same methods with multiple recipients and labels, or to attachments, where labeling status is sometimes less obvious to users.

For example, you may want to have a popup message appear on email messages labeled **Public,** but have a PowerPoint presentation attached that's labeled **General.**

For more information about advanced properties, see [Admin Guide: Custom configurations for the Azure Information Protection unified labeling client](rms-client/clientv2-admin-guide-customizations.md).

## Next steps

