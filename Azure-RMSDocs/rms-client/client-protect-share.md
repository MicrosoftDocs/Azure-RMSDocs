---
# required metadata

title: Set custom protection for a file and then share it with others | Azure Information Protection
description: Instructions how to set custom protection for a file and then share it with others.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 01/30/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 7704c242-a1b4-48b9-951e-7ad3eefa0e22

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: eymanor
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Set custom protection for a file and then share it with others by using Azure Information Protection

>*Applies to: Active Directory Rights Management Services, Azure Information Protection, Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1*

If you share files with people on a regular basis, your administrator might have configured a label for you that sets protection on the file such that these people can read it. If that's not the case or you need to share it with somebody else, you can set custom protection for a file.

If the file is already protected, first save a copy of the file. Then follow these instructions, which you'll find very similar to the instructions in [Classify and protect a file or email](client-classify-protect.md).


## To set custom protection for a file and then share it

1.  In File Explorer, right-click your file, and select **Classify and protect**. 

2. In the **Classify and protect - Azure Information Protection** dialog box, you will see whether the file is already labeled. Decide whether you want to keep an existing label, remove it, or choose another label.

3. Select **Protect with custom permissions** and then specify the following:

    - **Select permissions**: Select the level of access that you want people to have when you protect the selected file or files.
    
    - **Select users**: Specify the people who should have the permissions you selected for your file or files. For people and groups in your organization, you can use the address book to search and select them. For people in another organization, you must specify their full email address. Make sure that you use a business email address because personal email addresses are not currently supported.
        
    - **Expire access on**: Select this option only for time-sensitive files so that the people you specified will not be able to open your selected file or files after a date that you specify. You will still be able to open the original file but after midnight (your current time zone), on the day that you select, the people that you specified will not be able to open the file.

5. Click **Apply** and wait for the **Work finished** message to see the results. Then click **Close**.

6. Use your standard sharing mechanism to now share this file. If you are sharing it with people outside your organization, they might need instructions if this is the first time that they have received a protected file. For these people, you can copy and past the following message: **I've protected this file with Microsoft Azure Information Protection. For first time use, see these [instructions](https://go.microsoft.com/fwlink/?LinkId=524168).** 

## Other instructions
For how-to instructions, see the following sections from the Azure Information Protection user guide:

-   [What do you want to do?](client-user-guide.md#what-do-you-want-to-do)

[!INCLUDE[Commenting house rules](../includes/houserules.md)]
