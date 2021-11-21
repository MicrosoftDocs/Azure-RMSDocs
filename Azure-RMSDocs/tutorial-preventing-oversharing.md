---
# required metadata

title: Tutorial - Preventing oversharing using Azure Information Protection (AIP)
description: A detailed tutorial for using the Azure Information Protection (AIP) client to prevent users from oversharing your content.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 11/09/2020
ms.topic: tutorial
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: aiplabels
#ms.reviewer: elina.kaminsky
#ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Tutorial: Preventing oversharing in Outlook using Azure Information Protection (AIP)

>**Applies to*: [Azure Information Protection](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection)*
>
> ***Relevant for**: [Azure Information Protection unified labeling client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

As a system admin, you need to ensure that your organization's content remains secure, and is shared only with trusted users. One of the most common ways that users share content inappropriately is by email. Configure your policy to prevent oversharing via Outlook, such as limiting access to specific users only, or allowing users to share content only with trusted external users.

**Time required**: You can complete this tutorial in 30 minutes.

In this tutorial, you learn how to:
> [!div class="checklist"]
> * Configure warning, justification, and blocking behaviors for specific labeling conditions
> * See your settings in action
> * Review the logged user messages and actions in the Event Log 

## Tutorial prerequisites

Make sure you have the following system requirements before starting this tutorial.

|Prerequisites  |Description  |
|---------|---------|
|**Machine requirements**     | Make sure that you: <br /><br />- Have a Windows computer, with the Azure Information Protection unified labeling client installed. For more information, see [Quickstart: Deploying the Azure Information Protection (AIP) unified labeling client](quickstart-deploy-client.md). <br /><br />- Have PowerShell installed, and that you can run PowerShell as an administrator. <br /><br />- Can sign into Outlook. Be prepared to restart Outlook multiple times during this tutorial.     |
|**Azure Information Protection subscription**     |   You'll need an Azure subscription that includes [Azure Information Protection](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection/). <br /><br />If you don't have one of these subscriptions, create a [free](https://admin.microsoft.com/Signup/Signup.aspx?OfferId=87dd2714-d452-48a0-a809-d2f58c4f68b7) account for your organization.       |
|**Sensitivity labels and a testing policy**     |  A **General** sensitivity label configured in your policy. <br /><br />Configure sensitivity labels in the Microsoft 365 compliance center. For more information, see the [Microsoft 365 documentation](/microsoft-365/compliance/create-sensitivity-labels). <br /><br />We recommend using a testing policy for this tutorial so that you don't affect your live policy. <br />Make sure that you have the name of your policy handy, as well as the GUID for your **General** label.   |
| | |

Let's get started. 

## Implement a warning message for emails labeled as General

This procedure describes how to configure your policy to warn Outlook users before they send an email labeled **General**. 

The users can choose to heed the warning, and either change the label or the content, or they can choose to send the email anyway.

1. On the client machine, run PowerShell as an administrator.

1. Run the following command, to define a warning message for the **General** label. When you copy this command, replace **Global** with the name of your policy, and the long string of characters with your own label ID.

    ```PowerShell
    Set-LabelPolicy -Identity Global -AdvancedSettings @{OutlookWarnUntrustedCollaborationLabel="8faca7b8-8d20-48a3-8ea2-0f96310a848e"}
    ```

    In this example, the policy is named **Global**, and the GUID for the **General** label is **8faca7b8-8d20-48a3-8ea2-0f96310a848e**.

    > [!TIP]
    > If you wanted to apply this setting to multiple labels, list their GUIDs in the value, separated by commas.

1. Test your setting in Outlook:

    1. On your client computer, open or restart Outlook to pull the updated settings.

    1. Create a new email message, and apply the **General** label. In the message toolbar, select the :::image type="icon" source="media/i-sensitivity.PNG" border="false"::: **Sensitivity** button and then select **General**.

    1. Define the **To** field with your own email address, the **Subject field** as: `Testing a warning message for the General label`, and then send the email.

        You should see the following warning, asking you to confirm before sending the email. For example:

        :::image type="content" source="media/qs-tutor/ul-see-warnmessage.png" alt-text="Testing a warning message for the General label":::

    1. Pretend that you're a user who has mistakenly tried to email something that was labeled **General**. In this case, you want to heed the warning, so select **Cancel**.

        Your email is not sent, but remains open so that you can either change the content or the label.

    1. There's no need to make any changes, and you can decide that the content is appropriate to send. Select **Send** again. This time, when the warning appears, select **Confirm and Send**.

        The email is sent.

Continue with [Show a warning message for General emails only when they're sent externally](#show-a-warning-message-for-general-emails-only-when-theyre-sent-externally).

## Show a warning message for General emails only when they're sent externally

This procedure describes how to add an exception to the warning message you configured earlier, so that the warning message is only displayed for external recipients.

When sending a **General** email internally, the warning message is not displayed.

1. On the client machine, run PowerShell as an administrator.

1. Run the following command to define your domain as a trusted domain for warning messages. When you copy this command, replace **Global** with the name of your policy, and **contoso.com** with your own domain.

    ```PowerShell
    Set-LabelPolicy -Identity Global -AdvancedSettings @{OutlookWarnTrustedDomains="contoso.com"}    
    ```

    > [!TIP]
    > If you wanted to apply this setting to multiple domains, such as if you wanted to add trusted partners, list their domains in the value, separated by commas.

1. Test your setting in Outlook:

    1. On your client computer, open or restart Outlook to pull the updated settings.

    1. Create a new email message, and apply the **General** label. In the message toolbar, select the :::image type="icon" source="media/i-sensitivity.PNG" border="false"::: **Sensitivity** button and then select **General**.

    1. Define the **To** field with your own email address, the **Subject field** as: `Testing a warning message for the General label`, and then send the email.

        The email is sent, and no warning is displayed.

## Request users to justify sending unlabeled content

This procedure describes how to configure advanced settings so that users must justify their reasoning for sending unlabeled content. 

1. On the client machine, run PowerShell as an administrator.

1. To have Outlook display a justification message for your users if they try to send an unlabeled email, replace **Global** with the name of your policy, and run:
 
    ```PowerShell
    Set-LabelPolicy -Identity Global -AdvancedSettings @{OutlookUnlabeledCollaborationAction="Justify"}
    ```

1. Test your setting in Outlook:

    1. On your client computer, open or restart Outlook to pull the updated settings.

    1. Create a new email message, and make sure that there is no label applied.
    
        For example, if your policy applies a default label, use the :::image type="icon" source="media/i-sensitivity.PNG" border="false"::: button to remove it. 

    1. Define the **To** field with your own email address, the **Subject field** as: `Testing the justification message for unlabeled content`, and then send the email.
    
        A popup is displayed similar to the following example:

        :::image type="content" source="media/qs-tutor/ul-see-nolabljustify.png" alt-text="Sample justification message for unlabeled content":::

    1. Select one of the options. If you select the third option **Other, as explained**, enter some sample text in the text box. 
    
    1. Select **Confirm and Send**.
    
        The email is sent.

Continue with [Customize the free text justification prompt](#customize-the-free-text-justification-prompt).

## Customize the free text justification prompt

This procedure describes how to customize the third option in the default justification message. 

For example, you may want to add text there to prompt the user to add specific details, or remind users not to enter any sensitive data.

1. On the client machine, run PowerShell as an administrator.

1. To customize the free text prompt in the justification message displayed, replace **Global** with your policy name, and run:

    ```PowerShell
    Set-LabelPolicy -Identity Global -AdvancedSettings @{JustificationTextForUserText="Other (please explain) - Do not enter sensitive info"}
    ```

    > [!TIP]
    > Feel free to replace the value in quotes with any other text you want to add there instead. 

1. Test your setting in Outlook:

    1. On your client computer, open or restart Outlook to pull the updated settings.

    1. Create a new email message, and make sure there is no label applied. 

        For example, if your policy applies a default label, use the :::image type="icon" source="media/i-sensitivity.PNG" border="false"::: button to remove it. 

    1. Define the **To** field with your own email address, the **Subject field** as: `Testing a customized free text justification prompt`, and then send the email.
    
        The justification popup is displayed, this time with your customized text. For example: 

        :::image type="content" source="media/qs-tutor/ul-see-nolabljustify-custom.png" alt-text="Sample justification prompt with customized free text prompt":::
        
## Block users from sending unlabeled PowerPoint messages

This procedure describes how to block your users from sending unlabeled PowerPoint files from Outlook.

1. On the client machine, run PowerShell as an administrator.

1. To block unlabeled content from being sent from Outlook, replace **Global** with your policy name, and run:

    ```PowerShell
    Set-LabelPolicy -Identity Global -AdvancedSettings @{OutlookUnlabeledCollaborationAction="Block"}
    ```

1. To limit the blocking behavior to specific PowerPoint file types only, replace **Global** with your policy name, and run:

    ```PowerShell
    Set-LabelPolicy -Identity Global -AdvancedSettings @{OutlookOverrideUnlabeledCollaborationExtensions=".PPTX,.PPTM,.POTX,.POTM,.POT,.PPTX"}
    ```

1. Test your setting in Outlook:

    1. On your client computer, open PowerPoint and create a new **.pptx** file, making sure to leave the file unlabeled.

    1. Open or restart Outlook to pull the updated settings.
    
    1. Attach your unlabeled PowerPoint file to a new Outlook message.

    1. Define the **To** field with your own email address, the **Subject field** as: `Testing sending unlabeled PowerPoint files`, and then send the email.
    
        Outlook blocks the email from being sent, and displays the following message:

        :::image type="content" source="media/qs-tutor/ul-see-blockmessage.png" alt-text="Sample blocking message for an unlabeled PowerPoint attachment":::

Continue with [Customize the block message for unlabeled PowerPoint messages](#customize-the-block-message-for-unlabeled-powerpoint-messages).

## Customize the block message for unlabeled PowerPoint messages

This procedure describes how to customize the message that appears when a user tries to send an unlabeled PowerPoint file to external users.

> [!IMPORTANT]
> This procedure will override any settings you've already defined using the **OutlookUnlabeledCollaborationAction** advanced property, and is shown for tutorial purposes only.
>
> In production, we recommend that you avoid complications by *either* using the **OutlookUnlabeledCollaborationAction** advanced property to define your rules, *or* defining complex rules with a json file as defined below, but not both.
>

**To define your rule using a json file**:

1. Create a **.json** file, named **OutlookCollaborationRule_1.json**, with the following code:

    ```JSON
    { 	
    "type" : "And", 	
    "nodes" : [ 		
        { 			
            "type" : "Except" , 			
            "node" :{ 				
                "type" : "SentTo",  				
                "Domains" : [  					
                    "contoso.com", 					
                ]   			
            } 		
        },
		{ 			
            "type" : "Or", 			
            "nodes" : [ 				
                { 			
					"type" : "AttachmentLabel",
					 "LabelId" : null,
					"Extensions": [
									".PPTX",
                                    ".PPTM",
                                    ".POTX",
                                    ".POTM",
                                    ".POT",
                                    ".PPTX"
								 ]
					
				},
                { 					
                    "type" : "EmailLabel",
					 "LabelId" : null
                }
			]
		},		
        { 			
            "type" : "Email Block", 			
            "LocalizationData": { 				
                "en-us": { 				  
                    "Title": "Email Blocked", 				  
                    "Body": "Sending PowerPoint files to external recipients requires that you label your files so that we can classify and protect Contoso content.<br><br>List of attachments that are not labeled:<br><br>${MatchedAttachmentName}<br><br><br>This message will not be sent.<br>You are responsible for ensuring compliance to classification requirement as per Contoso’s policies.<br><br>Label your document and send it again." 				
                },			
            }, 			
            "DefaultLanguage": "en-us" 		
        } 	
      ] 
    }
    ```
1. Save your **OutlookCollaborationRule_1.json** file in a location that's accessible by your client machine.

1. On the client machine, run PowerShell as an administrator.

1. To customize your blocking message, copy the following code, replacing **C:\OutlookCollaborationRule_1.json** with the path to your .json file, and **General** with the name of your policy.

    ```PowerShell
    $filedata = Get-Content "C:\OutlookCollaborationRule_1.json”
    Set-LabelPolicy -Identity General -AdvancedSettings @{OutlookCollaborationRule_1 ="$filedata"}
    ```

    Run the code to implement the settings defined in your .json file.

1. Test your setting in Outlook:

    1. On your client computer, open PowerPoint and create a new **.pptx** file, making sure to leave the file unlabeled.

    1. Open or restart Outlook to pull the updated settings.

    1. Attach your unlabeled PowerPoint file to a new Outlook message.

    1. Define the **To** field with your own email address, the **Subject field** as: `Testing customized blocking message for unlabeled PowerPoint files`, and then send the email.

        Outlook blocks the email from being sent, and displays the following message:

        :::image type="content" source="media/qs-tutor/ul-see-custom-blockmessage.png" alt-text="Custom block message for PowerPoint files with no label":::

Continue with [Use Event Log to identify the messages and user actions for the General label](#use-event-log-to-identify-the-messages-and-user-actions-for-the-general-label).

## Use Event Log to identify the messages and user actions for the General label

In this tutorial, you learned how to customize AIP's behavior in Outlook to prevent a few types of oversharing, including warning, justification, and block messages. You've also checked the behavior from Outlook on your local client computer.

Now you can start the Windows Event Viewer to check the logs for the actions that occurred.

**To check the Event Viewer for AIP logging events**:

On your client machine, open the Windows Event Viewer application, and navigate to **Applications and Services Logs** > **Azure Information Protection**.

You'll see an information event logged for each test you performed, including details about both the message and user response:

- **Warn messages**: Information ID 301
- **Justify messages**: Information ID 302
- **Block messages**: Information ID 303

For example:

- [Check the Event log for your warning message tests](#check-the-event-log-for-your-warning-message-tests)
- [Check the Event log for your justify message tests](#check-the-event-log-for-your-justify-message-tests)
- [Check the Event log for your block message tests](#check-the-event-log-for-your-block-message-tests)

### Check the Event log for your warning message tests

The first test was to warn the user, and you selected **Cancel**. In this case, the **User Response** displays **Dismissed** in the first Event 301:

```
Client Version: 2.8.85.0
Client Policy ID: e5287fe6-f82c-447e-bf44-6fa8ff146ef4
Item Full Path: Testing a warning message for the General label.msg
Item Name: Testing a warning message for the General label
Process Name: OUTLOOK
Action: Warn
Label After Action: General
Label ID After Action: 0e421e6d-ea17-4fdb-8f01-93a3e71333b8
Action Source: 
User Response: Dismissed
```

However, you then selected **Confirm and Send**, which is reflected in the next Event 301, where the **User Response** displays **Confirmed**:

```
Client Version: 2.8.85.0
Client Policy ID: e5287fe6-f82c-447e-bf44-6fa8ff146ef4
Item Full Path: Testing a warning message for the General label.msg
Item Name: Testing a warning message for the General label
Process Name: OUTLOOK
Action: Warn
Label After Action: General
Label ID After Action: 0e421e6d-ea17-4fdb-8f01-93a3e71333b8
Action Source: 
User Response: Confirmed
```

### Check the Event log for your justify message tests

The same pattern is repeated for the justify message, which has an Event 302. The first event has a **User Response** of **Dismissed**, and the second shows the justification that was selected. For example:

```
Client Version: 2.8.85.0
Client Policy ID: e5287fe6-f82c-447e-bf44-6fa8ff146ef4
Item Full Path: Testing the justification message for unlabeled content.msg
Item Name: Testing the justification message for unlabeled content
Process Name: OUTLOOK
Action: Justify
Label After Action: General
Label ID After Action: 0e421e6d-ea17-4fdb-8f01-93a3e71333b8
User Justification: I confirm the recipients are approved for sharing this content
Action Source: 
User Response: Confirmed

```

### Check the Event log for your block message tests

At the top of the event log, you see the block message logged, which has an Event 303. For example:

```
Client Version: 2.8.85.0
Client Policy ID: e5287fe6-f82c-447e-bf44-6fa8ff146ef4
Item Full Path: Testing sending unlabeled PowerPoint files.msg
Item Name: Testing sending unlabeled PowerPoint files
Process Name: OUTLOOK
Action: Block
Label After Action: General
Label ID After Action: 0e421e6d-ea17-4fdb-8f01-93a3e71333b8
Action Source: 
```

## Clean up resources

Once you're finished with this tutorial, you can keep the testing policy for further reference, or delete it to clean up your resources.

If you want to delete your policy, do so in the Microsoft 365 compliance center.

For more information, see the [Microsoft 365 documentation](/microsoft-365/compliance/create-sensitivity-labels#publish-sensitivity-labels-by-creating-a-label-policy)

Once deleted, restart Outlook on the client machine so that it's no longer configured with the settings defined in this tutorial.

## Next steps

For quicker testing, this tutorial used an email message to a single recipient, and without attachments. 

Apply the same methods with multiple recipients and labels, or to attachments, where labeling status is sometimes less obvious to users.

For example, you may want to have a popup message appear on email messages labeled **Public**, but have a PowerPoint presentation attached that's labeled **General**.

For more information about advanced properties and Outlook customizations, see [Admin Guide: Custom configurations for the Azure Information Protection unified labeling client](rms-client/clientv2-admin-guide-customizations.md).