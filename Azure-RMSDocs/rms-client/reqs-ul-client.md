---
# required metadata

title: Additional requirements for installing the Azure Information Protection unified labeling client
description: Information for admins who need to understand the additional system requirements for installing the Unified Labeling client on enterprise networks.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 01/07/2021
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


# Additional requirements for installing the unified labeling client on enterprise networks

>***Applies to**: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows Server 2019, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012*
>
>*If you have Windows 7 or Office 2010, see [AIP for Windows and Office versions in extended support](../known-issues.md#aip-and-legacy-windows-and-office-versions).*
>
>***Relevant for**: [Azure Information Protection unified labeling client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients). For the classic client, see the [classic client admin guide](client-admin-guide-install.md).*

Before you install the Azure Information Protection unified labeling client on your enterprise network, check that computers have the required operating system versions and applications for Azure Information Protection: [Requirements for Azure Information Protection](../requirements.md). 

Then, verify that you have the additional items required for installing the Azure Information Protection unified labeling client.

> [!NOTE]
> Not all of these requirements are verified by the installation software.
>

## Microsoft .NET Framework requirements

The full installation of the Azure Information Protection unified labeling client by default, requires a minimum version of Microsoft .NET Framework 4.6.2. 

If this framework is missing, the setup wizard from the executable installer tries to download and install this prerequisite. When this prerequisite is installed as part of the client installation, the computer must be restarted.  

If you are installing the [Azure Information Protection Viewer](clientv2-view-use-files.md) on its own, you must have a minimum version of Microsoft .NET Framework 4.5.2. 

> [!IMPORTANT]
> If a minimum version of Microsoft .NET Framework 4.5.2 is missing for the Viewer installation, the installation software does *not* download or install it.
> 

### Disable Exploit protection (.NET 2 or 3 only)

The AIP client is not supported on machines with .NET 2 or 3 that have [Exploit protection](/windows/security/threat-protection/microsoft-defender-atp/enable-exploit-protection) enabled. 

In such cases, we recommend that you upgrade your .NET version. 

If you must keep your .NET version 2 or 3,  make sure to [disable Exploit protection](../known-issues.md#known-issues-for-aip-and-exploit-protection) before installing the AIP client.

## Windows PowerShell minimum requirements

The PowerShell module for the client requires a minimum version of Windows PowerShell 4.0.

If you're working on an older operating system, you may need to insall PowerShell manually. For more information, see [How to Install Windows PowerShell 4.0](https://social.technet.microsoft.com/wiki/contents/articles/21016.how-to-install-windows-powershell-4-0.aspx). 

> [!IMPORTANT]
> The installer does *not* check or install this prerequisite for you. 
>
> To confirm the version of Windows PowerShell that you are running, type `$PSVersionTable` in a PowerShell session.  
> 


## Screen resolution requirements

Client machines with resolutions of **800x600** and lower can't fully display the **Classify and protect - Azure Information Protection** dialog box when you right-click a file or folder in the File Explorer.   

## Admin permissions

To install the Azure Information Protection unified labeling client, you must have local administrative permissions on the client computer.
        
## Windows 10 requirements

Computers running Office 2010 require **Microsoft Online Services Sign-in Assistant version 7.250.4303.0**, which is included with the client installation. 

If you have a later version of the Sign-in Assistant, uninstall it before you install the Azure Information Protection unified labeling client. 

For example, check the version and uninstall the Sign-in Assistant by using **Control Panel** > **Program and Features** > **Uninstall or change a program**. 

For Windows 10 version 1809 only, operation system builds older than 17763.348, install [March 1, 2019—KB4482887 (OS Build 17763.348)](https://support.microsoft.com/help/4482887/windows-10-update-kb4482887) to ensure the Information Protection bar displays correctly in Office applications. This update is not needed if you have Office 365 1902 or later.    

## Configure your group policy to prevent disabling AIP

For Office versions 2013 and later, we recommend that you configure your group policy to ensure that the **Microsoft Azure Information Protection** add-in for Office applications is always enabled.  Without this add-in, users won't be able to label their documents or emails in Office applications.   

For Word, Excel, PowerPoint, and Outlook, use the group policy setting **list of managed add-ins** documented in [No Add-ins loaded due to group policy settings for Office 2013 and Office 2016 programs](https://support.microsoft.com/help/2733070/no-add-ins-loaded-due-to-group-policy-settings-for-office-2013-and-off). 

Specify the following programmatic identifiers (ProgID) for AIP, and set the option to **1: The add-in is always enabled**.

|Application  |ProgID  |
|---------|---------|
|Word     |     `MSIP.WordAddin`    |
|Excel     |  `MSIP.ExcelAddin`       |
|PowerPoint     |   `MSIP.PowerPointAddin`      |
|Outlook | `MSIP.OutlookAddin` |
| | | 

## Next steps

Continue with  [Admin Guide: Install the Azure Information Protection unified labeling client for users](clientv2-admin-guide-install.md).

For more information, see:

- [Client files and usage logging](clientv2-admin-guide-files-and-logging.md)

- [File types supported](clientv2-admin-guide-file-types.md)

- [PowerShell commands](clientv2-admin-guide-powershell.md)