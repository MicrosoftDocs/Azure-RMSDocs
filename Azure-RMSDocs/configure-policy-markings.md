---
# required metadata

title: Configure visual markings for an Azure Information Protection label - AIP
description: When you assign a label to a document or email message, you can select several options to make the chosen classification easily visible. These visual markings are a header, a footer, and a watermark.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 12/29/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: df2676eeb062-f25a-4cf8-a782-e59664427d54
ROBOTS: NOINDEX


# optional metadata

#audience:
#ms.devlang:
ms.subservice: aiplabels
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# How to configure a label for visual markings for Azure Information Protection

>***Applies to**: Azure Information Protection*
>
>***Relevant for**: [Azure Information Protection classic client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients). For the unified labeling client, see [Learn about sensitivity labels](/microsoft-365/compliance/sensitivity-labels) from the Microsoft 365 documentation.*

[!INCLUDE [AIP classic client is sunset - extended support customers](includes/classic-client-sunset-extended-support.md)]
>

When you assign a label to a document or email message, you can select several options to make the chosen classification easily visible. These visual markings are a header, a footer, and a watermark.

Additional information about these visual markings:

- Headers and footers apply to Word, Excel, PowerPoint, and Outlook.

- Watermarks apply to Word, Excel, and PowerPoint:

    - Excel: Watermarks are visible only in Page layout and Print preview modes, and when printed.

    - PowerPoint: Watermarks are applied to the master slide, as a background image. On the **View** tab, **Slide Master**, make sure that the **Hide Background Graphics** check box is not selected.

- Multiple lines are supported for watermarks, and for headers and footers in Word, Excel, and PowerPoint. If you specify multiple lines for a label's header or footer that is applied in Outlook, the lines are concatenated. In this scenario, consider using the configuration to [set different visual markings for Word, Excel, PowerPoint, and Outlook](#setting-different-visual-markings-for-word-excel-powerpoint-and-outlook).

- Maximum string lengths:

    - The maximum string length that you can enter for headers and footers is 1024 characters. However, Excel has a total limit of 255 characters for headers and footers. This limit includes characters that aren't visible in Excel, such as formatting codes. If that limit is reached, the string you enter is not displayed in Excel.

    - The maximum string length for watermarks that you can enter is 255 characters.

- You can specify just a text string, or use [variables](#using-variables-in-the-text-string) to dynamically create the text string when the header, footer, or watermark is applied.

- Word, PowerPoint, Outlook, and now Excel support visual markings in different colors.

- Visual markings support one language only.

## When visual markings are applied

For email messages, the visual markings are applied when an email message is sent from Outlook. If that email message is forwarded or replied to with a change of label, the original visual markings are always retained.

For documents, the visual markings are applied as follows:

- In an Office app, the visual markings from a label are applied when the label is applied. Visual markings are also applied when a labeled document is opened and the document is first saved.  

- When a document is labeled by using File Explorer, PowerShell, or the Azure Information Protection scanner: Visual markings are not immediately applied but are applied by the Azure Information Protection client when that document is opened in an Office app and the document is first saved.

    The exception is when you use [AutoSave](https://support.office.com/article/what-is-autosave-6d6bd723-ebfd-4e40-b5f6-ae6e8088f7a5) with Office apps for files that are saved in Microsoft SharePoint, OneDrive for work or school, or OneDrive for home: When AutoSave is on, visual markings are not applied unless you configure the [advanced client setting](./rms-client/client-admin-guide-customizations.md#turn-on-classification-to-run-continuously-in-the-background) to turn on classification to run continuously in the background.

## To configure visual markings for a label

Use the following instructions to configure visual markings for a label.

1. If you haven't already done so, open a new browser window and [sign in to the Azure portal](configure-policy.md#signing-in-to-the-azure-portal). Then navigate to the **Azure Information Protection** pane.

    For example, in the search box for resources, services, and docs: Start typing **Information** and select **Azure Information Protection**.

2. From the **Classifications** > **Labels** menu option: On the **Azure Information Protection - Labels** pane, select the label that contains the visual markings you want to add or change.

3. On the **Label** pane, in the **Set visual marking (such as header or footer)** section, configure the settings for the visual markings that you want, and then click **Save**:

    - To configure a header: For **Documents with this label have a header**, select **On** if you want a header, and **Off** if you do not. If you select **On**, then specify the header text, size, [font](#setting-the-font-name), [color](#setting-the-font-color), and alignment for the header.

    - To configure a footer: For **Documents with this label have a footer**, select **On** if you want a footer, and **Off** if you do not. If you select **On**, then specify the footer text, size, [font](#setting-the-font-name), [color](#setting-the-font-color), and alignment for the footer.

    - To configure a watermark: For **Documents with this label have a watermark**, select **On** if you want a watermark, and **Off** if you do not. If you select **On**, then specify the watermark text, size, [font](#setting-the-font-name), [color](#setting-the-font-color), and alignment for the watermark.

When you click **Save**, your changes are automatically available to users and services. There's no longer a separate publish option.

## Using variables in the text string

You can use the following variables in the text string for your header, footer, or watermark:

- `${Item.Label}` for the selected label. For example: General

- `${Item.Name}` for the file name or email subject. For example: JulySales.docx

- `${Item.Location}` for the path and file name for documents, and the email subject for emails. For example: \\\Sales\2016\Q3\JulyReport.docx

- `${User.Name}` for the display name of the owner of the document or email, by the Windows user currently signed in. For example: Rosalind Simone

- `${User.PrincipalName}` for the owner of the document or email, by the Azure Information Protection client signed in email address (UPN). For example: rsimone@vanarsdelltd.com

- `${Event.DateTime}` for the date and time when the selected label was set. For example: 8/16/2016 1:30 PM

> [!NOTE]
>This syntax is case-sensitive.

>[!TIP]
> You can also use a [field code to insert the label name](faqs-classic.md#can-i-create-a-document-template-that-automatically-includes-the-classification) into a document or template.

## Setting different visual markings for Word, Excel, PowerPoint, and Outlook

By default, the visual markings that you specify are applied across Word, Excel, PowerPoint, and Outlook. However, you can specify visual markings per Office application type when you use an "If.App" variable statement in the text string, and identify the application type by using the values **Word**, **Excel**, **PowerPoint**, or **Outlook**. You can also abbreviate these values, which is necessary if you want to specify more than one in the same If.App statement.

Use the following syntax:

```ps
${If.App.<application type>}<your visual markings text> ${If.End}
```

> [!NOTE]
>This syntax in this statement is case-sensitive.

Examples:

- **Set header text for Word documents only**:

    `${If.App.Word}This Word document is sensitive ${If.End}`

    In Word document headers only, the label applies the header text "This Word document is sensitive". No header text is applied to other Office applications.

- **Set footer text for Word, Excel, and Outlook, and different footer text for PowerPoint**:

    `${If.App.WXO}This content is confidential. ${If.End}${If.App.PowerPoint}This presentation is confidential. ${If.End}`

    In Word, Excel, and Outlook, the label applies the footer text "This content is confidential." In PowerPoint, the label applies the footer text "This presentation is confidential."

- **Set specific watermark text for Word and PowerPoint, and then watermark text for Word, Excel, and PowerPoint**:

    `${If.App.WP}This content is ${If.End}Confidential`

    In Word and PowerPoint, the label applies the watermark text "This content is Confidential". In Excel, the label applies the watermark text "Confidential". In Outlook, the label doesn't apply any watermark text because watermarks as visual markings are not supported for Outlook.

> [!NOTE]
> When using the Azure Information Protection unified labeling client, setting values for **font name** is only possible by using the Azure Information Protection portal. When setting values for **font color** beyond one of the five default values, is also only possible by using the Azure Information Protection portal.

### Setting the font name

Calibri is the default font for headers, footers, and watermark text. If you specify an alternative font name, make sure that it is available on the client devices that will apply the visual markings.
If the font specified is not available, the client falls back to using the Calibri font.

### Setting the font color

You can choose from the list of available colors or specify a custom color by entering a hex triplet code for the red, green, and blue (RGB) components of the color. For example, **#40e0d0** is the RGB hex value for turquoise.

If you need a reference for these codes, you'll find a helpful table from the [\<color>](https://developer.mozilla.org/docs/Web/CSS/color_value) page from the MSDN web docs. You also find these codes in many applications that let you edit pictures. For example, Microsoft Paint lets you choose a custom color from a palette and the RGB values are automatically displayed, which you can then copy.

## Next steps

For more information about configuring your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organizations-policy) section.  
