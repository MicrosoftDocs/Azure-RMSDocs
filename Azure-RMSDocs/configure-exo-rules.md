---
# required metadata

title: Configure Exchange Online mail flow rules for Azure Information Protection labels
description: Instructions and examples to configure Exchange Online mail flow rules for Azure Information Protection labels.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 02/15/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
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

- Your default label is **General**, which does not apply protection. For emails with this label that are sent externally, apply the additional Do Not Forward protection action.

- If an attachment with a **Confidential \ Partners** label is emailed to people outside the organization and the email is not protected, apply the additional Encrypt-Only protection action.

Mail flow rules that apply protection as an action are ignored if the email is already protected. For example, an email message that has been protected by Do Not Forward cannot be changed by an Exchange mail flow rule to use the Encrypt-Only option.  

You can extend these examples as well as modify them. For example, add more conditions. For more information about configuring mail flow rules, see [Mail flow rules (transport rules) in Exchange Online](https://technet.microsoft.com/library/jj919238(v=exchg.150).aspx) from the Exchange Online documentation.

For more information about configuring mail flow rules to encrypt email messages, see [Define mail flow rules to encrypt email messages in Office 365](https://support.office.com/article/define-mail-flow-rules-to-encrypt-email-messages-in-office-365-9b7daf19-d5f2-415b-bc43-a0f5f4a585e8) from the Office documentation. 

## Where labels are stored in emails and documents

Because an Azure Information Protection label is stored in metadata, mail flow rules in Exchange Online can read this information for messages and document attachments:

- In emails, this information is stored in the x-header: **msip_labels: MSIP_Label_\<GUID>_Enabled=True;** 

- For Word documents (.doc and .docx), Excel spreadsheets (.xls and .xlsx), and PowerPoint presentations (.ppt and .pptx), this metadata is stored in the following custom property: **MSIP_Label_\<GUID>_Enabled=True**  

To identify the GUID for a label, locate the Label ID value on the **Label** blade, when you view or configure the Azure Information Protection policy in the Azure portal. For files that have labels applied, you can also run the [Get-AIPFileStatus](/powershell/module/azureinformationprotection/get-aipfilestatus) PowerShell cmdlet to identify the GUID (MainLabelId or SubLabelId). When a label has sublabels, always specify the GUID of just a sublabel and not the parent label.

Before you configure your mail flow rules, make sure that you know the GUID of the Azure Information Protection label that you want to use.

## Example configurations

For the following examples, create a new mail flow rule by using the following steps:

1. In a web browser, using a work or school account that has been granted global administrator permissions, sign in to Office 365. 

2. Choose the **Admin** tile.

3. In the Office 365 admin center, choose **Admin centers** > **Exchange**.

4. In the Exchange admin center: **mail flow** > **rules** > **+** > **Create a new rule**. 

> [!TIP]
> If you have problems with the user interface when you configure your rules, try a different browser, such as Internet Explorer.

The examples have a single condition that applies protection when an email is sent outside the organization. For more information about other conditions that you can select, see [Mail flow rule conditions and exceptions (predicates) in Exchange Online](https://technet.microsoft.com/library/jj919235(v=exchg.150).aspx).


### Example 1: Rule that applies the Do Not Forward option to emails that are labeled **General** when they are sent outside the organization

In this example, the **General** label has a GUID of 0e421e6d-ea17-4fdb-8f01-93a3e71333b8. Substitute your own label or sublabel GUID that you want to use with this rule. 

In the Azure Information Protection policy, this label has been configured as the default label to classify emails as **General** and the label does not apply protection. 

1. In **Name**, type a name for the rule, such as `Apply Do Not Forward for General emails sent externally`.
 
2. For **Apply this rule if**: Select **The recipient is located**, select **Outside the organization**, and then select **OK**.

3. Select **More options**, and then select **add condition**.
 
4. For **and**: Select **A message header**, and then select **includes any of these words**:
     
    a. Select **Enter text**, and enter `msip_labels`.
     
    b. Select **Enter words**, and enter `MSIP_Label_0e421e6d-ea17-4fdb-8f01-93a3e71333b8_Enabled=True;`
    
    c. Select **+**, and then select **OK**.

5. For **Do the following**: Select **Modify the message security** > **Apply Office 365 Message Encryption and rights protection** > **Do Not Forward**, and then select **OK**.
    
    Your rule configuration should now look similar to the following:
    ![Exchange Online mail flow rule configured for an Azure Information Protection label - example1](./media/aip-exo-rule-ex1.png)

7. Select **Save** 

For more information about the Do Not Forward option, see [Do Not Forward option for emails](configure-usage-rights.md#do-not-forward-option-for-emails).

### Example 2: Rule that applies the Encrypt-Only option to emails when they have attachments that are labeled **Confidential \ Partners** and these emails are sent outside the organization

In this example, the **Confidential \ Partners** sublabel has a GUID of 0e421e6d-ea17-4fdb-8f01-93a3e71333b8. Substitute your own label or sublabel GUID that you want to use with this rule. 

This label is used to classify and protect documents that you use for partner collaboration.   

1. In **Name**, type a name for the rule, such as `Apply Encrypt to emails sent externally if protected attachments`.
 
2. For **Apply this rule if**: Select **The recipient is located**, select **Outside the organization**, and then select **OK**.

3. Select **More options**, and then select **add condition**.
 
4. For **and**: Select **Any attachment**, and then select **has these properties, including any of these words**:
     
    a. Select **+** > **Specify a custom attachment property**.
  
    b. For **Property**, enter `MSIP_Label_0e421e6d-ea17-4fdb-8f01-93a3e71333b8_Enabled`.
    
    c. For **Value**, enter `True`
    
    d. Select **Save**, and then select **OK**.

5. For **Do the following**: Select **Modify the message security** > **Apply Office 365 Message Encryption and rights protection** > **Encrypt**, and then select **OK**.
    
    Your rule configuration should now look similar to the following:
    ![Exchange Online mail flow rule configured for an Azure Information Protection label - example1](./media/aip-exo-rule-ex2.png)

6. Select **Save** 

For more information about the Encrypt option, see [Encrypt-Only option for emails](configure-usage-rights.md#encrypt-only-option-for-emails).


## Next steps

For information about creating and configuring the labels to use with Exchange Online mail flow rules, see [Configuring Azure Information Protection policy](configure-policy.md).

In addition, to help classify email messages that contain attachments, consider using the following Azure Information Protection [policy setting](configure-policy-settings.md): **For email messages with attachments, apply a label that matches the highest classification of those attachments**.


