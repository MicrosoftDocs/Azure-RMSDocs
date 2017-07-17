---
# required metadata

title: Azure Information Protection client files and usage logging
description: Information about the client files and usage logging for the Azure Information Protection client for Windows.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 05/23/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
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


# Azure Information Protection client files and client usage logging

>*Applies to: Active Directory Rights Management Services, Azure Information Protection, Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*

After you have installed the Azure Information Protection client, you might need to know where files are located and monitor how the client is being used.

## File locations for the Azure Information Protection client

Client files:	

- For 64-bit operating systems: **\ProgramFiles (x86)\Microsoft Azure Information Protection**

- For 32-bit operating systems: **\Program Files\Microsoft Azure Information Protection**

Client logs files and currently installed policy file:

- For 64-bit and 32-bit operating systems: **%localappdata%\Microsoft\MSIP**

## Usage logging for the Azure Information Protection client

The client logs user activity to the local Windows **Applications and Services** event log, **Azure Information Protection**. The events include the following information:

- Date, client version, policy ID

- Signed in user name, computer name

- File name and location

- Action:

    - Set Label:  Information ID 101​
    
    - Set Label (lower):  Information ID 102​
    
    - Set Label (higher): Information ID 103​
    
    - Remove label: Information ID 104​
   
    - Recommended tip: Information 105​
    
    - Apply custom protection: Information ID 201​
    
    - Remove custom protection: Information ID 202​
    
    - Sign in (operational): Information ID 902​
    
    - Download policy (operational): Information ID 901
    
- Action source:
    
    - Manual ​
    
    - Recommended​
    
    - Automatic  ​
    
    - System (for sign in and download policy)
    
- Label before and after action ​
    
- Protection before and after action​
    
- User justification (when applicable)
    

For information about usage logging for the Azure Rights Management service, see [Logging and analyzing usage of the Azure Rights Management service](../deploy-use/log-analyze-usage.md)



## Next steps
Now that you've identified all the log files associated with the Azure Information Protection client, see the following for additional information that you might need to support this client:

- [Customizations](client-admin-guide-customizations.md)

- [Document tracking](client-admin-guide-document-tracking.md)

- [File types supported](client-admin-guide-file-types.md)

- [PowerShell commands](client-admin-guide-powershell.md)

[!INCLUDE[Commenting house rules](../includes/houserules.md)]
