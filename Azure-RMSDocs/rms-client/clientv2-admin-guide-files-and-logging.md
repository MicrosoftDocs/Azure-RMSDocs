---
# required metadata

title: Azure Information Protection unified labeling client files and usage logging
description: Information about the client files and usage logging for the Azure Information Protection unified labeling client for Windows.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 07/25/2019
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

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1, Windows Server 2019, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*
>
> *Instructions for: [Azure Information Protection unified labeling client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-client-and-the-azure-information-protection-unified-labeling-client)*

After you have installed the Azure Information Protection unified labeling client, you might need to know where files are located and monitor how the client is being used.

## File locations for the Azure Information Protection client

Client files:	

- For 64-bit operating systems: **\ProgramFiles (x86)\Microsoft Azure Information Protection**

- For 32-bit operating systems: **\Program Files\Microsoft Azure Information Protection**

Client logs files:

- For 64-bit and 32-bit operating systems: **%localappdata%\Microsoft\MSIP\Logs**


## Next steps
Now that you've identified all the log files associated with the Azure Information Protection unified labeling client, see the following for additional information that you might need to support this client:

- [Customizations](clientv2-admin-guide-customizations.md)

- [File types supported](clientv2-admin-guide-file-types.md)

- [PowerShell commands](clientv2-admin-guide-powershell.md)

