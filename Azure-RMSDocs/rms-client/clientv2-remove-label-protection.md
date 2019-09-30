---
# required metadata

title: Remove labels using the Azure Information Protection unified labeling client
description: Instructions to remove sensitivity labels and protection from files and emails by using the Azure Information Protection unified labeling client.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 09/24/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: v2client
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: user

---

# User Guide: Remove labels and protection from files and emails that have been labeled by Azure Information Protection

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1*
>
> *Instructions for: [Azure Information Protection unified labeling client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-client-and-the-azure-information-protection-unified-labeling-client)*

When the Azure Information Protection unified client is [installed on your computer](install-client-app.md), you can remove sensitivity labels and protection from files and emails.

When the sensitivity label that you remove is configured to apply protection, this action also removes protection from the file. You might be prompted to record why you are removing the label.

> [!IMPORTANT]
> You must be the owner of the file to remove protection, or been granted permissions to remove protection (the Rights Management permission of **Export** or **Full Control**).

If you want to choose a different label or a different set of protection settings, you do not need to remove the label or protection. Instead, choose a new label and if necessary, you can define custom permissions by using File Explorer. 

You can remove labels and protection from Office documents and emails when you are creating or editing them from within your Office desktop apps: **Word**, **Excel**, **PowerPoint**, **Outlook**. 

You can also remove labels and protection by using **File Explorer**, which supports additional file types and is a convenient way to remove labels and protection from multiple files at once.

## Using Office apps to remove labels and protection from documents and emails

From the **Home** tab, select the **Sensitivity** button on the ribbon, and clear the currently selected label.

Or, if you have selected **Show Bar** from the **Sensitivity** button, you can select the **Delete Label** icon from the Azure Information Protection bar:

![Azure Information Protection bar - Delete Label](../media/v2delete-label.png)

If the **Delete Label** icon is not immediately available, first select the **Edit Label** icon:

![Azure Information Protection bar - Edit Label](../media/v2edit-label.png)

If you still do not see the **Delete Label** icon, your administrator does not allow you to use this option because all documents and email must have a label.

## Using File Explorer to remove labels and protection from files

When you use File Explorer, you can quickly remove labels and protection from a single file, multiple files, or a folder. When you select a folder, all the files in that folder and any subfolders it has are automatically selected. 

1. In File Explorer, select your file, multiple files, or a folder. Right-click, and select **Classify and protect**.

2. To remove a label: In the **Classify and protect - Azure Information Protection** dialog box, click **Delete Label**. If the label was configured to apply protection, that protection is automatically removed.

3. To remove custom protection from a single file: In the **Classify and protect - Azure Information Protection** dialog box, clear the **Protect with custom permissions** option. 

4. To remove custom protection from multiple files: In the **Classify and protect - Azure Information Protection** dialog box, click **Remove custom permissions**.

5. Click **Apply** and wait for the **Work finished** message to see the results. Then click **Close**.


## Other instructions
More how-to instructions from the Azure Information Protection user guide:

- [What do you want to do?](client-user-guide.md#what-do-you-want-to-do)

## Additional information for administrators    

See [Overview of sensitivity labels](/Office365/SecurityCompliance/sensitivity-labels).

