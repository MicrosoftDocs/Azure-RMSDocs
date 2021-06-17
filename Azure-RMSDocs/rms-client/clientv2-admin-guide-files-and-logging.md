---
# required metadata

title: Azure Information Protection unified labeling client files and usage logging
description: Information about the client files and usage logging for the Azure Information Protection unified labeling client for Windows.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 06/17/2021
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

>***Applies to**: [Azure Information Protection](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection), Windows 10, Windows 8.1, Windows 8, Windows Server 2019, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012*
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

## Usage logging for the Azure Information Protection client

The client logs user activity to the local Windows event log **Applications and Services Logs** > **Azure Information Protection**. 

Logged events for the client include the following information:

- **Client version**

- **IP addresses** of the signed in user

- **File name and location**

- **Action**:

    - Set label: Information ID 101​
    
    - Remove label: Information ID  104

    - Discover label: Information ID 106

    - Apply custom protection: Information ID 201​
    
    - Remove custom protection: Information ID 202​
    
    - Outlook warn message: Information ID 301
    
    - Outlook justify message: Information ID 302
    
    - Outlook block message: Information ID 303

The events for Outlook warn, justify, and block messages require advanced client settings. For more information, see [Implement pop-up messages in Outlook that warn, justify, or block emails being sent](clientv2-admin-guide-customizations.md#implement-pop-up-messages-in-outlook-that-warn-justify-or-block-emails-being-sent).

## Usage logging for the Azure Information Protection scanner

Scanner activities are logged to the following local Windows event log: **Applications and Services Logs** > **Azure Information Protection Scanner**

Logged events for the scanner include the following information:

- **Computer name of the scanner machine**
-
- **SID (Security identifier) of the signed in scanner user**

- **Action**, one of the following message types:

    - **Info messages**, one of the following messages:

        - Scan started: Information ID 1001

        - Scan finished: Information ID 1002

        - Change event: : Information ID 1003

        - Discover event: Information ID 1004

        - File removed: : Information ID 1005

        - DLP rule matched: Information ID 1006

        - Permissions report: : Information ID 1007

    - **Warning message**:

        - Warning message: Information ID 2001

        - Scan canceled: Information ID 2002

    - **Error message**, one of the following messages:

        - Unknown error: Information ID 3001

        - No automatic labeling conditions: Information ID 3002

        - Database error: Information ID 3003

        - Database schema error: Information ID 3004

        - No policies found: Information ID 3005

        - No DLP policies found: Information ID 3006

        - No content scan jobs found: Information ID 3007

- **Event data**, for more information depending on the action type
## Next steps

For more information, see:

- [Customizations](clientv2-admin-guide-customizations.md)

- [File types supported](clientv2-admin-guide-file-types.md)

- [PowerShell commands](clientv2-admin-guide-powershell.md)

