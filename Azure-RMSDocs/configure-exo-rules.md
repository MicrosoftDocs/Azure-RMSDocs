---
# required metadata

title: Exchange Online mail flow rules for Azure Information Protection labels
description: Instructions and examples to configure Exchange Online mail flow rules for Azure Information Protection labels.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 10/26/2020
ms.topic: how-to
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: ba4e4a4d-5280-4e97-8f5c-303907db1bf5
ROBOTS: NOINDEX


# optional metadata

#audience:
#ms.devlang:
ms.reviewer: shakella
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Configuring Exchange Online mail flow rules for Azure Information Protection labels

>***Applies to**: Azure Information Protection, [Office 365](https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RE4Dz8M)*
>
>***Relevant for**: [Azure Information Protection classic client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients). For the unified labeling client, see [Learn about sensitivity labels](/microsoft-365/compliance/sensitivity-labels) and [DLP labels](/microsoft-365/compliance/dlp-sensitivity-label-as-condition) from the Microsoft 365 documentation.*

[!INCLUDE [AIP classic client is sunset - extended support customers](includes/classic-client-sunset-extended-support.md)]

Use the following information to help you configure mail flow rules in Exchange Online to use Azure Information Protection labels, and to apply additional protection for specific scenarios. For example:

- Your default label is **General**, which does not apply protection. For emails with this label that are sent externally, apply the additional Do Not Forward protection action.

- If an attachment with a **Confidential \ Partners** label is emailed to people outside the organization and the email is not protected, apply the additional encrypt-only protection action.

Mail flow rules that apply protection as an action are ignored if the email is already protected. For example, an email message that has been protected by Do Not Forward cannot be changed by an Exchange mail flow rule to use the encrypt-only option.  

You can extend these examples as well as modify them. For example, add more conditions. For more information about configuring mail flow rules, see [Mail flow rules (transport rules) in Exchange Online](/exchange/security-and-compliance/mail-flow-rules/mail-flow-rules) from the Exchange Online documentation.

For more information about configuring mail flow rules to encrypt email messages, see [Define mail flow rules to encrypt email messages in Microsoft 365](https://support.office.com/article/define-mail-flow-rules-to-encrypt-email-messages-in-office-365-9b7daf19-d5f2-415b-bc43-a0f5f4a585e8) from the Office documentation. 

## Prerequisite: Know your label GUID

Because an Azure Information Protection label is stored in metadata, mail flow rules in Exchange Online can read this information for messages and Office document attachments. Mail flow rules do not support inspecting the metadata for PDF documents.

Before you configure mail flow rules to identify messages and documents that are labeled, make sure that you know the GUID of the Azure Information Protection label that you want to use. 

For more information about the metadata stored by a label and how to identify label GUIDs, see [Label information stored in emails and documents](configure-policy.md#label-information-stored-in-emails-and-documents).

## Example configurations

For the following examples, create a new mail flow rule by using the following steps:

1. In a web browser, using a work or school account that has been granted global administrator permissions, sign in to Microsoft 365. 

2. Choose the **Admin** tile.

3. In the Microsoft 365 admin center, choose **Admin centers** > **Exchange**.

4. In the Exchange admin center: **mail flow** > **rules** > **+** > **Create a new rule**. 

> [!TIP]
> If you have problems with the user interface when you configure your rules, try a different browser, such as Internet Explorer.

The examples have a single condition that applies protection when an email is sent outside the organization. For more information about other conditions that you can select, see [Mail flow rule conditions and exceptions (predicates) in Exchange Online](/exchange/security-and-compliance/mail-flow-rules/conditions-and-exceptions).


### Example 1: Rule that applies the Do Not Forward option to emails that are labeled **General** when they are sent outside the organization

In this example, the **General** label has a GUID of 0e421e6d-ea17-4fdb-8f01-93a3e71333b8. Substitute your own label or sublabel GUID that you want to use with this rule. 

In the Azure Information Protection policy, this label has been configured as the default label to classify emails as **General** and the label does not apply protection. 

1. In **Name**, type a name for the rule, such as `Apply Do Not Forward for General emails sent externally`.
 
2. For **Apply this rule if**: Select **The recipient is located**, select **Outside the organization**, and then select **OK**.

3. Select **More options**, and then select **add condition**.
 
4. For **and**: Select **A message header**, and then select **includes any of these words**:
     
    a. Select **Enter text**, and enter `msip_labels`.
     
    b. Select **Enter words**, and enter `MSIP_Label_0e421e6d-ea17-4fdb-8f01-93a3e71333b8_Enabled=True`
    
    c. Select **+**, and then select **OK**.

5. For **Do the following**: Select **Modify the message security** > **Apply Office 365 Message Encryption and rights protection** > **Do Not Forward**, and then select **OK**.
    
    Your rule configuration should now look similar to the following:
    ![Exchange Online mail flow rule configured for an Azure Information Protection label - example 1](./media/aip-exo-rule-ex1.png)

7. Select **Save** 

For more information about the Do Not Forward option, see [Do Not Forward option for emails](configure-usage-rights.md#do-not-forward-option-for-emails).

### Example 2: Rule that applies the encrypt-only option to emails when they have attachments that are labeled **Confidential \ Partners** and these emails are sent outside the organization

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
    ![Exchange Online mail flow rule configured for an Azure Information Protection label - example 2](./media/aip-exo-rule-ex2.png)

6. Select **Save** 

For more information about the Encrypt option, see [encrypt-only option for emails](configure-usage-rights.md#encrypt-only-option-for-emails).


## Next steps

For information about creating and configuring the labels to use with Exchange Online mail flow rules, see [Configuring Azure Information Protection policy](configure-policy.md).

In addition, to help classify email messages that contain attachments, consider using the following Azure Information Protection [policy setting](configure-policy-settings.md): **For email messages with attachments, apply a label that matches the highest classification of those attachments**.