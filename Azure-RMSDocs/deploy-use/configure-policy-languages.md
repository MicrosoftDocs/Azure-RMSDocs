---
# required metadata

title: Configure labels for different languages
description: You can add support for different languages for the labels that users see on the Information Protection bar, by specifying the languages in the Azure Information Protection policy and importing your translations.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 04/25/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: a0e89fd0-795b-4e7a-aea9-ff6fc9163bde

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# How to configure labels for different languages in Azure Information Protection

>*Applies to: Azure Information Protection*

[ Note: This feature is currently in preview.]

By default, the names and descriptions of labels support a single language that is displayed to all users in your organization. You can add support for different languages by selecting the ones that you need, export your current label names and descriptions to a file, edit the file to supply your translations, and then import the file back into your Azure Information Protection policy.

In addition to selecting a language, for many languages, you can also select locales. For example, Spanish supports numerous locales that include Latin America, Argentina, Bolivia, and Chile. 

When you publish the updated policy and users download it, the language that users see for their label names and tooltips is determined by the following logic:

For the Azure Information Protection bar in Office apps:

- When there is a direct match for the language and locale of their Office app, label names and descriptions display in that language and locale.

- When there is a match for the language of their Office app but not a match for that language locale, label names and descriptions display in that language.

- When there is no match for the language of their Office app, label names and descriptions display in the language you specified by default for all users. This language is typically English, which is the language used in the default policy.

For the labels and tooltips that users see when they use right-click to classify and protect files or folders:

- When there is a direct match for the language and locale of their operating system, label names and descriptions display in that language and locale.

- When there is a match for the language of their operating system but not a match for that language locale, label names and descriptions display in that language.

- When there is no match for the language of their operating system, label names and descriptions display in the language you specified by default for all users. This language is typically English, which is the language used in the default policy.

To configure labels to display in different languages, use the following instructions.

1. If you haven't already done so, in a new browser window, sign in to the [Azure portal](https://portal.azure.com) as a security admin or global admin, and then navigate to the **Azure Information Protection** blade. 
    
    For example, on the hub menu, click **More services** and start typing **Information** in the Filter box. Select **Azure Information Protection**.

2. On the initial **Azure Information Protection** blade, locate **MANAGE**, and then select **Localization**.

3. On the Localization blade, locate the first language you want to add by either typing the name in the search box, or by scrolling through the list of available languages. To specify a locale for a language, first select **Show locales**, so that the available locales display when you expand a language.

4. Select your language or language locale, and select **OK**.

5. On the next blade, you'll see your selected language or language locale added to a list:
    
    - To add another language or language locale, select **Add a new language/locale for translation** and repeat steps 3 and 4. 
    
    - If you change your mind about any language or language locale that you have added, select that entry from the list, and then click **Remove**.
        
    > [!NOTE]
    > Be sure to select the languages (and locales) that your users have for Office, and for Windows. In some cases, this might be two different selections per computer.

6. When all the languages or language locales you want to support are listed, select the box next to **LANGUAGE NAME** to select all the entries (or alternatively, select individual entries), and then click **Export** to save a local copy of the existing label names and descriptions to a file. 
    
    The downloaded file is named **exported localization.zip** and is saved in your local Downloads folder. It can also be accessed by selecting this file name on the status bar of the Azure portal.

7. Extract the files from **exported localization.zip** so that you have  .xml files for each language that you selected for download. 

8. Edit each .xml file: For each string within  `<LocalizedText>` tags, provide the translations that you want for each chosen language or language locale. 

9. When you have edited each .xml file, create a new compressed (zipped)folder (any name) that contains these files.

10. Return to the Azure portal blade and select **Import**. Note that if this option appears unavailable, first refresh the portal.

8. ??To make your changes available to users, on the **Azure Information Protection** blade, click **Publish**. ??


## Next steps

For more information about configuring the options that you can make for a label, and other settings for your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organizations-policy) section.

[!INCLUDE[Commenting house rules](../includes/houserules.md)]


