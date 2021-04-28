---
# required metadata

title: Azure Information Protection unified labeling client files and usage logging
description: Information about the client files and usage logging for the Azure Information Protection unified labeling client for Windows.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 03/09/2021
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
>***Relevant for**: [Azure Information Protection unified labeling client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients).*

After you have installed the Azure Information Protection unified labeling client, you might need to know where files are located and monitor how the client is being used.

## File locations for the Azure Information Protection unified labeling client

Client files:    

- For 64-bit operating systems: **\ProgramFiles (x86)\Microsoft Azure Information Protection**

- For 32-bit operating systems: **\Program Files\Microsoft Azure Information Protection**

Client logs files and currently installed policy files:

- For 64-bit and 32-bit operating systems: **%localappdata%\Microsoft\MSIP**


## Usage logging for the Azure Information Protection scanner

Scanner activities are logged to the following local Windows event log: **Applications and Services Logs** > **Azure Information Protection Scanner**

Logged events include the following information:

- **Computer name of the scanner machine**
-
- **SID (Security identifier) of the signed in scanner user**

- **Action**, one of the following:

    - **Info messages**, one of the following:

        - Scan started: Information ID 1001

        - Scan finished: Information ID 1002

    - **Warning message**: Scan canceled: Information ID 2002

    - **Error message**, one of the following:

        - Unknown error: Information ID 3001

        - No automatic labeling conditions: Information ID 3002

        - Database error: Information ID 3003

        - Database schema error: Information ID 3004

        - No policy found: Information ID 3005

        - No DLP policy found: Information ID 3006

        - No content scan job found: Information ID 3007

- **Event data**, for more information depending on the action type
## Next steps
Now that you've identified all the log files associated with the Azure Information Protection unified labeling client, see the following for additional information that you might need to support this client:

- [Customizations](clientv2-admin-guide-customizations.md)

- [File types supported](clientv2-admin-guide-file-types.md)

- [PowerShell commands](clientv2-admin-guide-powershell.md)

