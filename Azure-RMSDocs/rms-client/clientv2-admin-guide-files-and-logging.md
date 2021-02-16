---
# required metadata

title: Azure Information Protection unified labeling client files and usage logging
description: Information about the client files and usage logging for the Azure Information Protection unified labeling client for Windows.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 02/16/2021
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: v2client
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---


# Admin Guide: Azure Information Protection unified labeling client files and client usage logging

>***Applies to**: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows Server 2019, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012*
>
>*If you have Windows 7 or Office 2010, see [AIP and legacy Windows and Office versions](../known-issues.md#aip-and-legacy-windows-and-office-versions).*
>
>***Relevant for**: [Azure Information Protection unified labeling client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients). For the classic client, see the [classic client admin guide](client-admin-guide-files-and-logging.md).*

After you have installed the Azure Information Protection unified labeling client, you might need to know where files are located and monitor how the client is being used.

## File locations for the Azure Information Protection unified labeling client

Client files:    

- For 64-bit operating systems: **\ProgramFiles (x86)\Microsoft Azure Information Protection**

- For 32-bit operating systems: **\Program Files\Microsoft Azure Information Protection**

Client logs files and currently installed policy files:

- For 64-bit and 32-bit operating systems: **%localappdata%\Microsoft\MSIP**


## Usage logging for the Azure Information Protection unified labeling client

The client logs user activity to the local Windows event log **Applications and Services Logs** > **Azure Information Protection**. The events include the following information:

- **Client version, policy ID**

- **IP addresses of the signed in user**

- **File name and location**

- **Action**, one of the following:

    - Set label: Information ID 101​
    
    - Set label (lower): Information ID 102
    
    - Set label (higher): Information ID 103​
    
    - Remove label: Information ID 104​
    
    - Recommended label tooltip: Information 105​
    
    - Apply custom protection: Information ID 201​
    
    - Remove custom protection: Information ID 202​
    
    - Outlook warn message: Information ID 301
    
    - Outlook justify message: Information ID 302
    
    - Outlook block message: Information ID 303
    
    - Sign in (operational): Information ID 902​
    
    - Download policy (operational): Information ID 901
    
- **Action source**, one of the following:
    
    - Manual ​
    
    - Recommended​
    
    - Automatic  ​
    
    - System (for sign in and download policy)
    
    - Default
    
- **Label before and after action** ​
    
- **Protection before and after action​**
    
- **User justification**, when applicable

- **Custom permissions**, when applicable, which includes the [usage rights by their encoding name](../configure-usage-rights.md#usage-rights-and-descriptions) for the specified users, groups, or organizations

###  Usage logging for Outlook pop-up message events

All events related to [Outlook pop-up messages](clientv2-admin-guide-customizations.md#implement-pop-up-messages-in-outlook-that-warn-justify-or-block-emails-being-sent), such as warnings for missing labels, are now sent to AIP audit logs. The following details are recorded in the audit logs:

- A new audit log event for the pop-up message displayed and any option selected by the user
- Any free text justification provided by the user in the popup.

## Next steps
Now that you've identified all the log files associated with the Azure Information Protection unified labeling client, see the following for additional information that you might need to support this client:

- [Customizations](clientv2-admin-guide-customizations.md)

- [File types supported](clientv2-admin-guide-file-types.md)

- [PowerShell commands](clientv2-admin-guide-powershell.md)

