---
# required metadata

title: Install the Azure Information Protection (AIP) unified labeling client for users
description: Learn how administrators can deploy the Azure Information Protection (AIP) unified labeling client for your users across an enterprise network.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 12/21/2020
ms.topic: how-to
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


# Admin Guide: Install the Azure Information Protection unified labeling client for users

>***Applies to**: [Azure Information Protection](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection), Windows 11, Windows 10, Windows 8.1, Windows 8, Windows Server 2019, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012*
>


This article describes how administrators can deploy the Azure Information Protection (AIP) unified labeling client for your users across an enterprise network.

Before you install the Azure Information Protection unified labeling client on your enterprise network, check that computers have the required operating system versions and applications for Azure Information Protection: [Requirements for Azure Information Protection](../requirements.md) and [Additional requirements for installing the unified labeling client on enterprise networks](reqs-ul-client.md).

## Supported applications for the unified labeling client

The Azure Information Protection unified labeling client can label and protect documents and emails by using the Office applications Word, Excel, PowerPoint, and Outlook from any of the following Office editions:

- **Office apps**, for the versions listed in the [table of supported versions for Microsoft 365 Apps by update channel](/officeupdates/update-history-microsoft365-apps-by-date), from Microsoft 365 Apps for Business or Microsoft 365 Business Premium, when the user is assigned a license for Azure Rights Management (also known as Azure Information Protection for Office 365)
- **Microsoft 365 Apps for Enterprise**
- **Office Professional Plus 2019**
- **Office Professional Plus 2016**
- **Office Professional Plus 2013 with Service Pack 1**

Other editions of Office (such as **standard**) cannot protect documents and emails by using a Rights Management service. For these editions, Azure Information Protection is supported for **labeling** only. 

Consequently, labels that apply protection do not display to users on the Azure Information Protection Sensitivity button or bar.

For information about which Office editions support the protection service, see [Applications that support Azure Rights Management data protection](../requirements-applications.md).

## Unified labeling client installation options

There are two options for installing the client for users:

|Option  |Description  | I
|---------|---------|
|**Run the executable (.exe) version of the client**     |   The recommended installation method that you can run interactively, or silently. <br><br>This method has the most flexibility and it is recommended because the installer checks for many of the prerequisites, and can automatically install missing prerequisites. <br><br>For more information, see [Install the AIP unified labeling client using the executable installer](#install-the-aip-unified-labeling-client-using-the-executable-installer).|
|**Deploy the Windows installer (.msi) version of the client**     |     Supported for silent installs only that use a central deployment mechanism, such as group policy, Configuration Manager, and Microsoft Intune. <br><br>This method is necessary for Windows 11 and Windows 10 PCs that are managed by Intune and mobile device management (MDM) because for these computers, executable files are not supported for installation. <br><br> However, when you use this installation method, you must manually check and install or uninstall the dependent software that the installer for the executable would perform for each computer. <br><br>For more information, see [Install the unified labeling client using the .msi installer](#install-the-unified-labeling-client-using-the-msi-installer). |
|     |         |


After the Azure Information Protection unified labeling client is installed, you can update this client by repeating your chosen installation method, or use Windows Update to keep the client automatically upgraded. 

For more information about upgrading, see the [Upgrading and maintaining the Azure Information Protection client](clientv2-admin-guide.md#upgrading-and-maintaining-the-azure-information-protection-unified-labeling-client) section.

## Install the AIP unified labeling client using the executable installer

Use the following instructions to install the client when you're *not* using the Microsoft Update catalog, or [deploying the **.msi**](#install-the-unified-labeling-client-using-the-msi-installer) by using a central deployment method such as Intune.

**To install the unified labeling client using the .exe file**:

1. Download the executable version of the Azure Information Protection unified labeling client (file name of **AzInfoProtection_UL**) from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=53018). 
    
    > [!IMPORTANT]
    > If there is a preview version available, keep this version for testing only. It is not intended for end users in a production environment. 
    >
 
1. For a default installation, simply run the executable, for example, **AzInfoProtection_UL.exe**. 

    To view all installation options, first run the executable with **/help**: `AzInfoProtection_UL.exe /help`

    For example: 
    - To silently install the client: `AzInfoProtection_UL.exe /quiet`
    
    - To silently install only the PowerShell cmdlets: `AzInfoProtection_UL.exe  PowerShellOnly=true /quiet`
    
    Additional parameters that are not listed on the help screen:
        
    |Parameter  |Description  |
    |---------|---------|
    |**AllowTelemetry=0**     |    Use this parameter to disable the install option **Help improve Azure Information Protection by sending usage statistics to Microsoft**.     |
    | | |

1. To complete the installation, restart any Office applications and all instances of File Explorer. 

1. Confirm that the installation was successful by checking the install log file, which by default is created in the **%temp%** folder. 

    The install log file has the following naming format: `Microsoft_Azure_Information_Protection_<number>_<number>_MSIP.Setup.Main.msi.log`
    
    For example: **Microsoft_Azure_Information_Protection_20161201093652_000_MSIP.Setup.Main.msi.log**
    
    In this log file, search for the following string: **Product: Microsoft Azure Information Protection -- Installation completed successfully**. If the installation failed, this log file contains details to help you identify and resolve any problems.

    > [!TIP]
    > You can change the location of the installation log file with the **/log** installation parameter. 
    > 


## Install the unified labeling client using the .msi installer

For central deployment, use the following information that is specific to the **.msi** installation version of the Azure Information Protection unified labeling client. 

If you use Intune for your software deployment method, use these instructions together with [Add apps with Microsoft Intune](/mem/intune/apps/apps-add).

**To install the unified labeling client with the .msi file**

1. Download the **.msi** version of the Azure Information Protection unified labeling client (**AzInfoProtection_UL**) from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=53018). 
    
    > [!IMPORTANT]
    > If there is a preview version available, keep this version for testing only. It is not intended for end users in a production environment.
    > 

1. For each computer that runs the **.msi** file, you must make sure that the following software dependencies are in place. 

    For example, package these with the **.msi** version of the client or only deploy to computers that meet these dependencies:
    
    |Office version|Operating system|Software|Action|
    |--------------------|--------------|----------------|---------------------|
    |**All versions except Office 365 1902 or later**|Windows 10 version 1809 only, operation system builds older than 17763.348|[KB 4482887](https://support.microsoft.com/help/4482887/windows-10-update-kb4482887)|Install|
    |**Office 2016**|All supported versions|64-bit: [KB3178666](https://www.microsoft.com/download/details.aspx?id=55007)<br /><br />32-bit: [KB3178666](https://www.microsoft.com/download/details.aspx?id=54999)<br /><br /> Version: 1.0|Install|
    | | | | |


1. For a default installation, run the .msi with **/quiet**, for example, `AzInfoProtection_UL.msi /quiet`.

    You may need to specify additional installation parameters. For more information, see the [executable installer instructions](#install-the-aip-unified-labeling-client-using-the-executable-installer).

    > [!NOTE]
    > By default, the **Help improve Azure Information Protection by sending usage statistics to Microsoft** installation option is enabled. To disable this option, make sure to do one of the following:
    >
    >- During installation, specify **AllowTelemetry=0**
    >- After installation, update the registry key as follows: **EnableTelemetry=0**.
    >

## Next steps
Now that you've installed the Azure Information Protection unified labeling client, see the following for additional information that you might need to support this client:

- [Client files and usage logging](clientv2-admin-guide-files-and-logging.md)

- [File types supported](clientv2-admin-guide-file-types.md)

- [PowerShell commands](clientv2-admin-guide-powershell.md)