---
# required metadata

title: Configure visual markings for an Azure Information Protection label
description: When you assign a label to a document or email message, you can select several options to make the chosen classification easily visible. These visual markings are a header, a footer, and a watermark.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 02/06/2018
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

When you assign a label to a document or email message, you can select several options to make the chosen classification easily visible. These visual markings are a header, a footer, and a watermark.

Additional information about these visual markers:

- Headers and footers apply to Word, Excel, PowerPoint, and Outlook.

- Watermarks apply to Word, Excel, and PowerPoint:

    - Excel: Watermarks are visible only in Page layout and Print preview modes, and when printed.
    
	- PowerPoint: Watermarks are applied to the master slide, as a background image.
    
	- Multiple lines of text are supported.

- You can specify just a text string, or use [variables](#using-variables-in-the-text-string) to dynamically create the text string when the header, footer, or watermark is applied.

- Visual markers support one language only.

## When visual markings are applied

For email messages, the visual markings are applied when the email message is sent from Outlook.

For documents, the visual markings are applied as follows:

- In an Office app, the visual markings from a label are applied when the label is applied. Visual markings are also applied when a labeled document is opened and the document is first saved.  

- When a document is labeled by using File Explorer or PowerShell, visual markings are not immediately applied but are applied when that document is opened in an Office app and the document is first saved.

## To configure visual markings for a label

Use the following instructions to configure visual markings for a label.

1. If you haven't already done so, open a new browser window and sign in to the [Azure portal](https://portal.azure.com) as a security admin or global admin. Then navigate to the **Azure Information Protection** blade. 
    
    For example, on the hub menu, click **More services** and start typing **Information** in the Filter box. Select **Azure Information Protection**.

2. If the label that you want to configure will apply to all users, stay on the **Azure Information Protection - Global policy** blade.
    
    If the label that you want to configure is in a [scoped policy](configure-policy-scope.md) so that it applies to selected users only, from the **POLICIES** menu selection, select **Scoped policies**. Then select your scoped policy from the **Azure Information Protection - Scoped polices** blade.

3. On the **Label** blade, in the **Set visual marking (such as header or footer)** section, configure the settings for the visual markers that you want, and then click **Save**:
    
    - To configure a header: For **Documents with this label have a header**, select **On** if you want a header, and **Off** if you do not. If you select **On**, then specify the header text, size, [font](#setting-the-font-name), [color](#setting-the-font-color), and alignment for the header.
    
    - To configure a footer: For **Documents with this label have a footer**, select **On** if you want a footer, and **Off** if you do not. If you select **On**, then specify the footer text, size, [font](#setting-the-font-name), [color](#setting-the-font-color), and alignment for the footer.
    
    - To configure a watermark: For **Documents with this label have a watermark**, select **On** if you want a watermark, and **Off** if you do not. If you select **On**, then specify the watermark text, size, [font](#setting-the-font-name), [color](#setting-the-font-color), and alignment for the watermark.

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

## Setting different visual markings for Word, Excel, PowerPoint, and Outlook

This setting is currently in preview and requires the preview version of the Azure Information Protection client.

By default, the visual markings that you specify are applied across Word, Excel, PowerPoint, and Outlook. However, you can specify visual markings per Office application type when you use an "If.App" variable statement in the text string, and identify the application type by using the values **Word**, **Excel**, **PowerPoint**, or **Outlook**. You can also abbreviate these values, which is necessary if you want to specify more than one in the same If.App statement.

Use the following syntax:

	${If.App.<application type>}<your visual markings text> ${If.End}

This syntax in this statement is case-sensitive.

Examples:

- **Set header text for Word documents only:**
    
    `${If.App.Word}This Word document is sensitive ${If.End}`
    
    In Word document headers only, the label applies the header text "This Word document is sensitive". No header text is applied to other Office applications.

- **Set footer text for Word, Excel, and Outlook, and different footer text for PowerPoint:**
    
    `${If.App.WXO}This content is confidential. ${If.End}${If.App.PowerPoint}This presentation is confidential. ${If.End}`
    
    In Word, Excel, and Outlook, the label applies the footer text "This content is confidential." In PowerPoint, the label applies the footer text "This presentation is confidential."

- **Set specific watermark text for Word and PowerPoint, and then watermark text for Word, Excel, and PowerPoint:**
    
    `${If.App.WP}This content is ${If.End}Confidential`
    
    In Word and PointPoint, the label applies the watermark text "This content is Confidential". In Excel, the label applies the watermark text "Confidential". In Outlook, the label doesn't any watermark text because watermarks as visual markings are not supported for Outlook.

### Setting the font name

This setting is currently in preview.

Calibri is the default font for headers, footers, and watermark text. If you specify an alternative font name, make sure that it is available on the client devices that will apply the visual markers. Otherwise, the font that will be used is non-deterministic. 

If you have the preview version of the Azure Information Protection client, and the font specified is not available, the client falls back to using the Calibri font.

### Setting the font color

You can choose from the list of available colors or specify a custom color by entering a hex triplet code for the red, green, and blue (RGB) components of the color. For example, **#DAA520**. 

If you need a reference for these codes, [Colors by Name](https://msdn.microsoft.com/library/aa358802\(v=vs.85\).aspx) from the MSDN documentation is a helpful starting point. You also find these codes in many applications that let you edit pictures. For example, Microsoft Paint lets you choose a custom color from a palette and the RGB values are automatically displayed, which you can then copy.

## Next steps

For more information about configuring your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organizations-policy) section.  

[!INCLUDE[Commenting house rules](../includes/houserules.md)]
