---
# required metadata

title: Configure visual markings for an Azure Information Protection label
description: When you assign a label to a document or email message, you can select several options to make the chosen classification easily visible. These visual markings are a header, a footer, and a watermark.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 08/9/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: df2676eeb062-f25a-4cf8-a782-e59664427d54

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# How to configure a label for visual markings for Azure Information Protection

>*Applies to: Azure Information Protection*

When you assign a label to a document or email message, you can select several options to make the chosen classification easily visible. These visual markings are a header, a footer, and a watermark:

The visual markings are applied to Word, Excel, and PowerPoint documents when the label is applied and when the documented is saved in these Office applications. For email messages, the visual markings are applied when the email message is sent from Outlook.

Visual markings are not applied to documents when the label is applied by using File Explorer and the right-click action. Or, when a document is classified by using PowerShell.

Additional information about these visual markers:

- Headers and footers apply to Word, Excel, PowerPoint, and Outlook.

- Watermarks apply to Word, Excel, and PowerPoint:

    - Excel: Watermarks are visible only in Page layout and Print preview modes, and when printed.
    
	- PowerPoint: Watermarks are applied to the master slide, as a background image.
    
	- Multiple lines of text are supported when you use the preview version of the Azure Information Protection client.

- You can specify just a text string, or use [variables](#using-variables-in-the-text-string) to dynamically create the text string when the header, footer, or watermark is applied.

- When visual markings are applied to documents:
    
    -For the general availability version of the Azure Information Protection client: When a document is labeled and the label is configured to apply visual markings, the visual markings are applied every time the document is saved. This action can replace manual edits that a user makes to a header, footer, or watermark.
    
    -  For the current preview version of the Azure Information Protection client: When a document is labeled and the label is configured to apply visual markings, the visual markings are applied only when the document is first saved, and only if the document doesn't already have the visual markings. 
    
    In addition, if a document already has a label applied, visual markings are not applied while the document is open. If a label with visual markings is applied to a document and a user then manually edits those visual markings, while the document is open, those manual edits are not replaced by the visual markings that are configured for the applied label. However, when the document is reopened, visual markings for the label are reapplied if the label is reapplied, and this action can replace manual edits that a user has made to a header, footer, or watermark.


Use the following instructions to configure visual markings for a label.

1. If you haven't already done so, in a new browser window, sign in to the [Azure portal](https://portal.azure.com) as a security admin or global admin, and then navigate to the **Azure Information Protection** blade.

    For example, on the hub menu, click **More services** and start typing **Information** in the Filter box. Select **Azure Information Protection**.

2. If the label that you want to configure for visual markings will apply to all users, select the label to change from the **Policy: Global** blade.

     If the label that you want to configure is in a [scoped policy](configure-policy-scope.md) so that it applies to selected users only, first select that scoped policy from the initial **Azure Information Protection** blade.

3. On the **Label** blade, in the **Set visual marking (such as header or footer)** section, configure the settings for the visual markers that you want, and then click **Save**:

    - To configure a header: For **Documents with this label have a header**, select **On** if you want a header, and **Off** if you do not. If you select **On**, then specify the header text, size, color, and alignment for the header.

    - To configure a footer: For **Documents with this label have a footer**, select **On** if you want a footer, and **Off** if you do not. If you select **On**, then specify the footer text, size, color, and alignment for the header.

    - To configure a watermark: For **Documents with this label have a watermark**, select **On** if you want a watermark, and **Off** if you do not. If you select **On**, then specify the watermark text, size, color, and layout for the header.

4. To make your changes available to users, on the **Azure Information Protection** blade, click **Publish**.

## Using variables in the text string

You can use the following variables in the text string for your header, footer, or watermark:

- `${Item.Label}` for the selected label. For example: Internal

- `${Item.Name}` for the file name or email subject. For example: JulySales.docx

- `${Item.Location}` for the path and file name for documents, and the email subject for emails. For example: \\\Sales\2016\Q3\JulyReport.docx

- `${User.Name}` for the owner of the document or email, by the Windows signed in user name. For example: rsimone

- `${User.PrincipalName}` for the owner of the document or email, by the Azure Information Protection client signed in email address (UPN). For example: rsimone@vanarsdelltd.com

- `${Event.DateTime}` for the date and time when the selected label was set. For example: 8/16/2016 1:30 PM

Example: If you specify the string `Document: ${item.name}  Classification: ${item.label}` for the **General** label footer, the footer text applied to a documented named project.docx will be **Document: project.docx  Classification: General**.

## Next steps

For more information about configuring your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organizations-policy) section.  

[!INCLUDE[Commenting house rules](../includes/houserules.md)]
