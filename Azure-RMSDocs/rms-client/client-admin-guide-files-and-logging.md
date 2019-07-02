---
# required metadata

title: Azure Information Protection client files and usage logging
description: Information about the client files and usage logging for the Azure Information Protection client for Windows.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 07/03/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 5a34ab85-773f-4782-ba09-c321cddf5bc0

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: eymanor
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---


# Admin Guide: Azure Information Protection client files and client usage logging

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*
>
> *Instructions for: [Azure Information Protection client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-client-and-the-azure-information-protection-unified-labeling-client)*

After you have installed the Azure Information Protection client, you might need to know where files are located and monitor how the client is being used.

## File locations for the Azure Information Protection client

Client files:	

- For 64-bit operating systems: **\ProgramFiles (x86)\Microsoft Azure Information Protection**

- For 32-bit operating systems: **\Program Files\Microsoft Azure Information Protection**

Client logs files and currently installed policy file:

- For 64-bit and 32-bit operating systems: **%localappdata%\Microsoft\MSIP**

## Usage logging for the Azure Information Protection client

The client logs user activity to the local Windows event log **Applications and Services Logs** > **Azure Information Protection**. The events include the following information:

- Client version, policy ID

- IP addresses of the signed in user

- File name and location

- Action:

    - Set label: Information ID 101​
    
    - Set label (lower): Information ID 101​
    
    - Set label (higher): Information ID 101​
    
    - Remove label: Information ID 104​
    
    - Recommended label tooltip: Information 105​
    
    - Apply custom protection: Information ID 201​
    
    - Remove custom protection: Information ID 202​
    
    - Outlook warn message: Information ID 301
    
    - Outlook justify message: Information ID 302
    
    - Outlook block message: Information ID 303
    
    - Sign in (operational): Information ID 902​
    
    - Download policy (operational): Information ID 901
    
- Action source:
    
    - Manual ​
    
    - Recommended​
    
    - Automatic  ​
    
    - System (for sign in and download policy)
    
    - Default
    
- Label before and after action ​
    
- Protection before and after action​
    
- User justification (when applicable)

- Custom permissions (when applicable) that includes the [usage rights by their encoding name](../configure-usage-rights.md#usage-rights-and-descriptions) for the specified users, groups, or organizations

The events for Outlook warn, justify, and block messages require the current general availability client and advanced client settings. For more information, see [Implement pop-up messages in Outlook that warn, justify, or block emails being sent](client-admin-guide-customizations.md#implement-pop-up-messages-in-outlook-that-warn-justify-or-block-emails-being-sent).

For information about usage logging for the protection service, see [Logging and analyzing the protection usage from Azure Information Protection](../log-analyze-usage.md)

## Next steps
Now that you've identified all the log files associated with the Azure Information Protection client, see the following for additional information that you might need to support this client:

- [Customizations](client-admin-guide-customizations.md)

- [Document tracking](client-admin-guide-document-tracking.md)

- [File types supported](client-admin-guide-file-types.md)

- [PowerShell commands](client-admin-guide-powershell.md)

