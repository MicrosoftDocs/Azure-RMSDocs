---
# required metadata

title: Configure labels for different languages in Azure Information Protection
description: You can add support for different languages for the labels that users see on the Information Protection bar, by specifying the languages in the Azure Information Protection policy and importing your translations.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 07/05/2017
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

>[!NOTE]
>This feature is currently in preview, to be used in conjunction with the current **preview** version of the Azure Information Protection client that you can download from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=53018).

Although the default labels for Azure Information Protection support multiple languages, you must configure support for label names and descriptions that you specify. This configuration requires you to do the following:

1. Select the languages that your users use. 

2. Export your current label names and descriptions to a file.

3. Edit the file to supply your translations.

4. Import the file back into your Azure Information Protection policy.

Select the languages that match your users' language setting for Office and Windows. These label names and descriptions then display in the Azure Information Protection bar in Office apps, and in the **Classify and protection - Azure Information Protection** dialog box, respectively. For more information about which language is chosen, see the [How the Azure Information Protection client determines the language to display](#how-the-azure-information-protection-client-determines-the-language-to- display) section on this page. 

## To configure labels to display in different languages

1. If you haven't already done so, sign in to the [Azure portal](https://portal.azure.com) as a security admin or global admin, and then navigate to the **Azure Information Protection** blade. 
    
    For example, on the hub menu, click **More services** and start typing **Information** in the Filter box. Select **Azure Information Protection**.

2. On the initial **Azure Information Protection** blade, locate **MANAGE**, and then select **Languages**.

3. On the **Azure Information Protection - Languages** blade, locate the first language you want to add by either typing the name in the search box, or by scrolling through the list of available languages. 

4. Select your language, and select **OK**.

5. On the next blade, you'll see your selected language added to a list:
    
    - To add another language, select **Add a new language for translation** and repeat steps 3 and 4. 
        
        > [!NOTE]
        > Be sure to select the languages that your users have for Office, and for Windows. In some cases, this might require two different selections per computer.
        
    - If you change your mind about any language that you have added, select that entry from the list, and then click **Remove**.

6. When all the languages you want to support are listed, select the check box next to **LANGUAGE NAME** to select all the entries (or alternatively, select individual entries), and then click **Export** to save a local copy of the existing label names and descriptions to a file. 
    
    The downloaded file is named **exported localization.zip** and is saved in your local Downloads folder. It can also be accessed by selecting this file name on the status bar of the Azure portal.

7. Extract the files from **exported localization.zip** so that you have  .xml files for each language that you selected for download. 

8. Edit each .xml file: For each string within `<LocalizedText>` tags, provide the translations that you want for each chosen language. 

9. When you have edited each .xml file, create a new compressed (zipped) folder that contains these files. The compressed folder can have any name, but must have a .zip extension.

10. Return to the Azure portal blade and select **Import**. Note that if this option is unavailable, first clear the check box for **LANGUAGE NAME** or the check boxes for the individually selected languages.
    
    When the import completes, the localized label names and descriptions download to users after you next publish the Azure Information Protection policy. You can click **Publish** from the **Global policy** or **Scoped policies** blade.

## How the Azure Information Protection client determines the language to display

When users download an Azure Information Protection policy that supports different languages, the language that users see for their label names and tooltips is determined by the following logic:

**For the labels and tooltips that users see on the Azure Information Protection bar in Office apps:**

- When there is a direct match for the language of their Office app, label names and descriptions display in that language.

- When there is no match for the language of their Office app, label names and descriptions display in the language you specified by default for all users. This language is typically English, which is the language used in the default policy.

**For the labels and tooltips that users see when they use right-click to classify and protect files or folders:**

- When there is a direct match for the language of their operating system, label names and descriptions display in that language.

- When there is no match for the language of their operating system, label names and descriptions display in the language you specified by default for all users. This language is typically English, which is the language used in the default policy.

## When localized label names are not used

In the following scenarios, localized label (and sub-label) names are not used. For consistency across your tenant, the default language is always used for the following:

- Client usage logs

- PowerShell (output from Get-AIPFileStatus)

- Document metadata and email headers


## Next steps

For more information about configuring the options that you can make for a label, and other settings for your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organizations-policy) section.

[!INCLUDE[Commenting house rules](../includes/houserules.md)]


