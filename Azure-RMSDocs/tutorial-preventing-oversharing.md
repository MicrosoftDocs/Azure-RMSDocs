---
# required metadata

title: Tutorial - Preventing oversharing using Azure Information Protection (AIP)
description: A detailed tutorial for using the Azure Information Protection (AIP) client to prevent users from oversharing your content.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 09/08/2020
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

# Tutorial: Preventing oversharing using Azure Information Protection (AIP)

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*
>
>*Instructions for: [Azure Information Protection unified labeling client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

System administrators must ensure that their organization's content remains secure, and is shared only with trusted users. Preventing oversharing can include limiting internal access to specific users only, or sharing content only with trusted external users. One of the most comment methods that users share content inappropriately is email, either in the email itself or as an attachment. 

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
|**Sensitivity labels**     |  A **General** sensitivity label configured in your policy. </br></br>Configure sensitivity labels your labeling admin center, including the Microsoft 365 compliance center, the Microsoft 365 security center, or the Microsoft 365 Security & Compliance Center. For more information, see the [Microsoft 365 documentation](https://docs.microsoft.com/microsoft-365/compliance/create-sensitivity-labels).</br></br>**Note**: We recommend using a testing policy for this tutorial so that you don't affect your live policy. </br>Make sure that you have the name of your policy handy, as well as the GUID for your **General** label.   |
|**Machine requirements**     |  - Make sure that you have a Windows computer, with the Azure Information Protection unified labeling client installed. For more information, see [Quickstart: Deploying the Azure Information Protection (AIP) unified labeling client](quickstart-deploy-client.md).</br>Make sure that PowerShell is installed, and that you have the ability to run PowerShell as an administrator. </br></br>Make sure you can sign into Outlook. Be prepared to restarted Outlook multiple times during this tutorial.     |
| | |

Let's get started. 

## Implement a warning message for emails labeled as General

This procedure describes how to configure your policy to warn Outlook users before they send an email labeled **General**. 

The users can choose to heed the warning, and either change the label or the content, or they can choose to send the email anyway.

1. On your AIP client machine, run PowerShell as an administrator.

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

        **TBD**
        
## Block users from sending unlabeled PowerPoint messages

This procedure describes how to block your users from sending unlabeled PowerPoint files from Outlook.

1. Run PowerShell as an administrator.

1. Run the following command to block unlabeled content from being sent from Outlook:

    ```PowerShell
    Set-LabelPolicy -Identity Global -AdvancedSettings @{OutlookUnlabeledCollaborationAction="Block"}
    ```

1. Run the following command to limit the blocking behavior for unlabeled content only to specific PowerPoint file types:

    ```PowerShell
    Set-LabelPolicy -Identity Global -AdvancedSettings @{OutlookOverrideUnlabeledCollaborationExtensions=".PPTX,.PPTM,.POTX,.POTM,.POT,.PPTX"}
    ```

1. Test your setting in Outlook:

    1. On your client computer, open PowerPoint and create a new **.pptx** file, making sure to leave the file unlabeled.

    1. Open Outlook, or restart Outlook to pull the updated settings.
    
    1. Attach your unlabeled PowerPoint file to a new Outlook message.

    1. Define the **To** field with your own email address, the **Subject field** as: `Testing unlabeled PowerPoint files`, and then send the email.
    
        Outlook blocks the email from being sent, and display the following message:

        **TBD**

## Customize the block message for unlabeled PowerPoint messages

This procedure describes how to customize the message that appears when a user tries to send an unlabeled PowerPoint file to external users.

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
                    "Title": "Emailed Blocked", 				  
                    "Body": "Sending PowerPoint files to external recipients requires that you label your files so that we can classify and protect Contoso content.<br><br>List of attachments that are not labeled:<br><br>${MatchedAttachmentName}<br><br><br>This message will not be sent.<br>You are responsible for ensuring compliance to classification requirement as per Contoso’s policies.<br><br>Label your document and send it again." 				
                },			
            }, 			
            "DefaultLanguage": "en-us" 		
        } 	
      ] 
    }
    ```
1. Save your **OutlookCollaborationRule_1.json** file in a location that's accessible by your client machine.

1. Run PowerShell as an administrator.

1. Run the following command to block unlabeled content from being sent from Outlook:

    ```PowerShell
    $filedata = Get-Content "<Path to the OutlookCollaborationRule_1.json file>”
    Set-LabelPolicy -Identity <Policy name> -AdvancedSettings @{OutlookCollaborationRule_1 ="$filedata"}    
    ```

    Where `<Path to OutlookCollaborationRule_1.json file>` is the path where you've saved your .json file. 

1. Test your setting in Outlook:

    1. On your client computer, open PowerPoint and create a new .pptx file, making sure to leave the file unlabeled.

    1. Open Outlook, or restart Outlook to pull the updated settings.
    
    1. Attach your unlabeled PowerPoint file to a new Outlook message.

    1. Define the **To** field with your own email address, the **Subject field** as: `Testing customized blocking message for unlabeled PowerPoint files`, and then send the email.
    
        Outlook blocks the email from being sent, and display the following message:

        **TBD**

## Use Event Log to identify the messages and user actions for the General label

In this tutorial, you learned how to customize AIP's behavior in Outlook to prevent a few types of oversharing, including warning, justification, and block messages.

You've also checked the behavior from Outlook on your local client computer.

Now you can start the Event Viewer to check the logs for the actions that occurred.

**Check the Event Viewer for AIP logging events**

On your client machine, open the Event Viewer application, and navigate to **Applications and Services Logs** > **Azure Information Protection**.

You'll see an information event logged for each test you performed, including details about both the message and user response:

- **Warn messages:** Information ID 301
- **Justify messages:** Information ID 302
- **Block messages:** Information ID 303

For example, the first test was to warn the user, and you selected **Cancel**. In this case, the **User Response** displays **Dismissed** in the first Event 301:

```
Client Version: 2.8.85
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
Client Version: 2.8.85
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
Client Version: 2.8.85
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
Client Version: 2.8.85
Client Policy ID: e5287fe6-f82c-447e-bf44-6fa8ff146ef4
Item Full Path: Testing the General label for the Block message.msg
Item Name: Testing the General label for the Block message
Process Name: OUTLOOK
Action: Block
Label After Action: General
Label ID After Action: 0e421e6d-ea17-4fdb-8f01-93a3e71333b8
Action Source: 
```

For example, the results of our justification prompt when the email didn't have a label:

```
Client Version: 2.8.85
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

Delete your policy in the admin center where it was created, either the Microsoft 365 compliance center, the Microsoft 365 security center, or the Microsoft 365 Security & Compliance Center.

For more information, see the [Microsoft 365 documentation](https://docs.microsoft.com/microsoft-365/compliance/create-sensitivity-labels#publish-sensitivity-labels-by-creating-a-label-policy)

Once deleted, restart Outlook so that it's no longer configured with the settings defined in this tutorial.

## Next steps

For quicker testing, this tutorial used an email message to a single recipient, and without attachments. 

Apply the same methods with multiple recipients and labels, or to attachments, where labeling status is sometimes less obvious to users.

For example, you may want to have a popup message appear on email messages labeled **Public,** but have a PowerPoint presentation attached that's labeled **General.**

For more information about advanced properties and Outlook customizations, see [Admin Guide: Custom configurations for the Azure Information Protection unified labeling client](rms-client/clientv2-admin-guide-customizations.md).
