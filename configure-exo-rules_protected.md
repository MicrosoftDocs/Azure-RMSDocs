---
# required metadata

title: Configure Exchange Online mail flow rules for Azure Information Protection labels
description: Instructions and examples to configure Exchange Online mail flow rules for Azure Information Protection labels.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 12/12/2018
ms.topic: conceptual
ms.service: information-protection
ms.assetid: ba4e4a4d-5280-4e97-8f5c-303907db1bf5

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: shakella
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Configuring Exchange Online mail flow rules for Azure Information Protection labels

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

Use the following information to help you configure mail flow rules in Exchange Online to use Azure Information Protection labels, and to apply additional protection for specific scenarios. For example:

- Your default label is **Confidential - Internal**, which does not apply protection. For emails with this label that are sent externally, reject the email back to the sender with a standard 5.7.1 error and an explaination of why it could not be delivered.

Mail flow rules that apply protection as an action are ignored if the email is already protected. For example, an email message that has been protected by Do Not Forward cannot be changed by an Exchange mail flow rule to use the Encrypt-Only option.  

You can extend these examples as well as modify them. For example, add more conditions. For more information about configuring mail flow rules, see [Mail flow rules (transport rules) in Exchange Online](https://technet.microsoft.com/library/jj919238(v=exchg.150).aspx) from the Exchange Online documentation.

For more information about configuring mail flow rules to encrypt email messages, see [Define mail flow rules to encrypt email messages in Office 365](https://support.office.com/article/define-mail-flow-rules-to-encrypt-email-messages-in-office-365-9b7daf19-d5f2-415b-bc43-a0f5f4a585e8) from the Office documentation. 

## Where labels are stored in emails and documents

Because an Azure Information Protection label is stored in metadata, mail flow rules in Exchange Online can read this information for messages and document attachments:

- In emails, this information is stored in the x-header: **Microsoft.Exchange.RMSApaAgent.ProtectionTemplateId** 

- For Word documents (.doc and .docx), Excel spreadsheets (.xls and .xlsx), PowerPoint presentations (.ppt and .pptx), and PDF documents (.pdf), this metadata is stored in the xml wrapper of the document that can be read by opening any document in a simple txt editor (i.e NotePad) 

> [!TIP]
> Currently, Exchange is not equiped to parse xml wrappers on documents that are protected with Azure Information Protection lables. This functionality is pending ETA 

To identify the TemplateId for a label, we will need to connect to Azure Active Directory Rights Management (AADRM) service via PowerShell and execute Get-AADRMTemplate to find the TemplateId or the resepective label. When a label has sublabels, always specify the TemplateId of just a sublabel and not the parent label. For more informaion on how to connect to the AADRM service, see [Connect to all Office 365 services in a single Windows PowerShell window](https://docs.microsoft.com/en-us/office365/enterprise/powershell/connect-to-all-office-365-services-in-a-single-windows-powershell-window). Information on the Get-AADRMTemplate cmdlet can be found here [Get-AadrmTemplate](https://docs.microsoft.com/en-us/powershell/module/aadrm/get-aadrmtemplate?view=azureipps).

Before you configure your mail flow rules, make sure that you know the TemplateId of the Azure Information Protection label that you want to use.

## Example configurations

For the following examples, create a new mail flow rule by using the following steps:

1. In a web browser, using a work or school account that has been granted global administrator permissions, sign in to Office 365. 

2. Choose the **Admin** tile.

3. In the Office 365 admin center, choose **Admin centers** > **Exchange**.

4. In the Exchange admin center: **mail flow** > **rules** > **+** > **Create a new rule**. 

> [!TIP]
> If you have problems with the user interface when you configure your rules, try a different browser, such as Internet Explorer.

The examples have a single condition that applies protection when an email is sent outside the organization. For more information about other conditions that you can select, see [Mail flow rule conditions and exceptions (predicates) in Exchange Online](https://technet.microsoft.com/library/jj919235(v=exchg.150).aspx).


### Example 1: Rule that rejects emails to the sender that are labeled **Confidential - Internal** when they are sent outside the organization
> [!TIP]
> You are only able to apply transport rules to labels that enforce protection in their configuration. 

In this example, the **Confidential - Internal** label has a TemplateId of 6db6d071-2973-4c7b-a46a-f86df676f780. Substitute your own label or sublabel TemplateId that you want to use with this rule. 

In the Azure Information Protection policy, this label has been configured as the default label to classify emails as **General** and the label does not apply protection. 

1. In **Name**, type a name for the rule, such as `Reject email to sender labled with Confidential - Internal when destined for external recipients`.
 
2. For **Apply this rule if**: Select **The recipient is located**, select **Outside the organization**, and then select **OK**.

3. Select **More options**, and then select **add condition**.
 
4. For **and**: Select **A message header**, and then select **includes any of these words**:
     
    a. Select **Enter text**, and enter `Microsoft.Exchange.RMSApaAgent.ProtectionTemplateId`.
     
    b. Select **Enter words**, and enter `6db6d071-2973-4c7b-a46a-f86df676f780`
    
    c. Select **+**, and then select **OK**.

5. For **Do the following**: Select **Block the Message** > **Reject the Message and include an explaination** > enter an explaination in the prompt, then select **OK**.
    
    Your rule configuration should now look similar to the following:
    ![Exchange Online mail flow rule configured for an Azure Information Protection label - example3](./media/aip-exo-rule-ex3.png)

7. Select **Save** 


## Next steps

For information about creating and configuring the labels to use with Exchange Online mail flow rules, see [Configuring Azure Information Protection policy](configure-policy.md).


