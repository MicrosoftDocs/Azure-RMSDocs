---
# required metadata

title: Configure labels and templates for different languages in Azure Information Protection
description: You can add support for different languages for the labels that users see on the Information Protection bar, and for any templates that users see, by specifying the languages in the Azure Information Protection policy and importing your translations.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 04/30/2018
ms.topic: conceptual
ms.service: information-protection
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

# How to configure labels and templates for different languages in Azure Information Protection

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*

Although the default labels for Azure Information Protection support multiple languages, you must configure support for label names and descriptions that you specify. This configuration requires you to do the following:

1. Select the languages that your users use. 

2. Export your current label names and descriptions to a file.

3. Edit the file to supply your translations.

4. Import the file back into your Azure Information Protection policy.

You can also configure templates for different languages when either of the following conditions apply. This configuration is appropriate if users or administrators need to see the current template name and description in their localized language.

- The template was created in the Azure classic portal or by using PowerShell, and the template is not linked to a label by using the **Select a predefined template** protection setting.

- You do not have a subscription that supports labels, so you can only create and manage templates in the Azure portal.

Select the languages that match your users' language setting for Office and Windows. These label names and descriptions then display in the Azure Information Protection bar in Office apps, and in the **Classify and protection - Azure Information Protection** dialog box, respectively. For more information about which language is chosen, see the [How the Azure Information Protection client determines the language to display](#how-the-azure-information-protection-client-determines-the-language-to- display) section on this page. 

## To configure labels and templates for different languages

1. If you haven't already done so, open a new browser window and [sign in to the Azure portal](configure-policy.md#signing-in-to-the-azure-portal). Then navigate to the **Azure Information Protection** blade.
    
    For example, on the hub menu, click **All services** and start typing **Information** in the Filter box. Select **Azure Information Protection**.

2. From the **Manage** > **Languages** menu option: On the **Azure Information Protection - Languages** blade, select **Add a new language for translation**. Select the languages that you want to add and then select **OK**. You can either type the name of the language in the search box, or scroll through the list of available languages

3. Your selected languages now display on the **Azure Information Protection - Languages** blade:
    
    - To add another language, select **Add a new language for translation** and repeat the previous step. 
        
        > [!NOTE]
        > Be sure to select the languages that your users have for Office, and for Windows. In some cases, this might require two different selections per computer.
        
    - If you change your mind about any language that you have added, select that entry from the list, and then click **Remove**.

4. When all the languages you want to support are listed, select the check box next to **LANGUAGE NAME** to select all the entries (or alternatively, select individual entries), and then click **Export** to save a local copy of the existing label names and descriptions to a file. 
    
    The downloaded file is named **exported localization.zip** and is saved in your local Downloads folder. It can also be accessed by selecting this file name on the status bar of the Azure portal.

5. Extract the files from **exported localization.zip** so that you have  .xml files for each language that you selected for download. 

6. Edit each .xml file: For each string within `<LocalizedText>` tags, provide the translations that you want for each chosen language. 

7. When you have edited each .xml file, create a new compressed (zipped) folder that contains these files. The compressed folder can have any name, but must have a .zip extension.

8. Return to the **Azure Information Protection - Languages** blade, and select **Import**. Note that if this option is unavailable, first clear the check box for **LANGUAGE NAME** or the check boxes for the individually selected languages.
    
    When the import completes, the localized names and descriptions download to users.

## How the Azure Information Protection client determines the language to display

When users download an Azure Information Protection policy that supports different languages, the language that users see for their label names and tooltips is determined by the following logic:

**For the labels and tooltips that users see on the Azure Information Protection bar in Office apps:**

- When there is a direct match for the language of their Office app, label names and descriptions display in that language.

- When there is no match for the language of their Office app, label names and descriptions display in the language you specified by default for all users. This language is typically English, which is the language used in the default policy.

**For the labels and tooltips that users see when they use right-click to classify and protect files or folders:**

- When there is a direct match for the language of their operating system, label names and descriptions display in that language.

- When there is no match for the language of their operating system, label names and descriptions display in the language you specified by default for all users. This language is typically English, which is the language used in the default policy.

## When localized label names are not used

In the following scenarios, localized label (and sublabel) names are not used. For consistency across your tenant, the default language is always used for the following:

- Client usage logs

- PowerShell (output from Get-AIPFileStatus)

- Document metadata and email headers


## Next steps

For more information about configuring the options that you can make for a label, and other settings for your Azure Information Protection policies, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organizations-policy) section.



