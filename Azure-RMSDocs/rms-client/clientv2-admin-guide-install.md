---
# required metadata

title: Install the Azure Information Protection unified labeling client for users
description: Instructions and information for admins to deploy the Azure Information Protection unified labeling client for Windows on enterprise networks.
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

>***Applies to**: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows Server 2019, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012*
>
>*If you have Windows 7 or Office 2010, see [AIP for Windows and Office versions in extended support](../known-issues.md#aip-for-windows-and-office-versions-in-extended-support).*
>
>***Instructions for**: [Azure Information Protection unified labeling client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients). For the classic client, see the [classic client admin guide](client-admin-guide-install.md).*

Before you install the Azure Information Protection unified labeling client on your enterprise network, check that computers have the required operating system versions and applications for Azure Information Protection: [Requirements for Azure Information Protection](../requirements.md) and [Additional requirements for installing the unified labeling client on enterprise networks](reqs-ul-client.md).

## Supported applications for the unified labeling client

The Azure Information Protection unified labeling client can label and protect documents and emails by using the Office applications Word, Excel, PowerPoint, and Outlook from any of the following Office editions:

- **Office apps**, for the versions listed in the [table of supported versions for Microsoft 365 Apps by update channel](/officeupdates/update-history-microsoft365-apps-by-date), from Microsoft 365 Apps for Business or Microsoft 365 Business Premium, when the user is assigned a license for Azure Rights Management (also known as Azure Information Protection for Office 365)
- **Microsoft 365 Apps for Enterprise**
- **Office Professional Plus 2019**
- **Office Professional Plus 2016**
- **Office Professional Plus 2013 with Service Pack 1**
- **Office Professional Plus 2010 with Service Pack 2**

Other editions of Office (such as **standard**) cannot protect documents and emails by using a Rights Management service. For these editions, Azure Information Protection is supported for **labeling** only. 

Consequently, labels that apply protection do not display to users on the Azure Information Protection Sensitivity button or bar.

For information about which Office editions support the protection service, see [Applications that support Azure Rights Management data protection](../requirements-applications.md).

For more information, see [AIP known issues in Office applications](../known-issues.md#aip-known-issues-in-office-applications).

## Unified labeling client installation options

There are two options for installing the client for users:

|Option  |Description  | I
|---------|---------|
|**Run the executable (.exe) version of the client**     |   The recommended installation method that you can run interactively, or silently. <br><br>This method has the most flexibility and it is recommended because the installer checks for many of the prerequisites, and can automatically install missing prerequisites. <br><br>For more information, see [To install the Azure Information Protection unified labeling client by using the executable installer](#to-install-the-azure-information-protection-unified-labeling-client-by-using-the-executable-installer).|
|**Deploy the Windows installer (.msi) version of the client**     |     Supported for silent installs only that use a central deployment mechanism, such as group policy, Configuration Manager, and Microsoft Intune. <br><br>This method is necessary for Windows 10 PCs that are managed by Intune and mobile device management (MDM) because for these computers, executable files are not supported for installation. <br><br> However, when you use this installation method, you must manually check and install or uninstall the dependent software that the installer for the executable would perform for each computer. <br><br>For more information, see [To install the Azure Information Protection unified labeling client by using the .msi installer](#to-install-the-azure-information-protection-unified-labeling-client-by-using-the-msi-installer).   |
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
    |**ServiceLocation**     |  Use this parameter if you are installing the client on computers that run Office 2010 and your users are not local administrators on their computers or you do not want them to be prompted. <br><br>For more information, see: <br>- [More information about the **ServiceLocation** installation parameter](#more-information-about-the-servicelocation-installation-parameter) <br> - [AIP for Windows and Office versions in extended support](../known-issues.md#aip-for-windows-and-office-versions-in-extended-support)      |

    | | |

1. To complete the installation: 

    - **If your computer runs [Office 2010](../known-issues.md#aip-for-windows-and-office-versions-in-extended-support)**, restart your computer. 
        
        If the client was not installed with the **ServiceLocation** parameter, when you first open one of the Office applications that use the Azure Information Protection unified client (for example, Word), you must confirm any prompts to update the registry for this first-time use. 

        [Service discovery](client-deployment-notes.md#rms-service-discovery) is used to populate the registry keys. 
    
    - **For other versions of Office**, restart any Office applications and all instances of File Explorer. 
        
1. Confirm that the installation was successful by checking the install log file, which by default is created in the **%temp%** folder. 

    The install log file has the following naming format: `Microsoft_Azure_Information_Protection_<number>_<number>_MSIP.Setup.Main.msi.log`
    
    For example: **Microsoft_Azure_Information_Protection_20161201093652_000_MSIP.Setup.Main.msi.log**
    
    In this log file, search for the following string: **Product: Microsoft Azure Information Protection -- Installation completed successfully**. If the installation failed, this log file contains details to help you identify and resolve any problems.

    > [!TIP]
    > You can change the location of the installation log file with the **/log** installation parameter. 
    >  
### More information about the ServiceLocation installation parameter

When you install the client for users who have [Office 2010](../known-issues.md#aip-for-windows-and-office-versions-in-extended-support) and they do not have local administrative permissions, specify the **ServiceLocation** parameter and the URL for your Azure Rights Management service. 

This parameter and value creates and sets the following registry keys:

`HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\MSDRM\ServiceLocation\Activation`

`HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\MSDRM\ServiceLocation\EnterprisePublishing`

`HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSDRM\ServiceLocation\EnterprisePublishing`

`HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSDRM\ServiceLocation\Activation`


**To identify the value to specify for the ServiceLocation parameter:**

1. From a PowerShell session, first run [Connect-AipService](/powershell/module/aipservice/connect-aipservice) and specify your administrator credentials to connect to the Azure Rights Management service. Then run [Get-AipServiceConfiguration](/powershell/module/aipservice/get-aipserviceconfiguration). 
 
    If you haven't already installed the PowerShell module for the Azure Rights Management service, see [Installing the AIPService PowerShell module](../install-powershell.md).

2. From the output, identify the **LicensingIntranetDistributionPointUrl** value.

    For example: **LicensingIntranetDistributionPointUrl   : https://5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com/_wmcs/licensing**

3. From the value, remove **/_wmcs/licensing** from this string. For example: **https://5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com**

    The remaining string is the value to specify for your ServiceLocation parameter.

For example, to install the client silently for [Office 2010](../known-issues.md#aip-for-windows-and-office-versions-in-extended-support) and Azure RMS:

```powershell
AzInfoProtection_UL.exe /quiet ServiceLocation=https://5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com
```


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
    |**Office 2013**|All supported versions|64-bit: [KB3172523](https://www.microsoft.com/download/details.aspx?id=54992)<br /><br /> 32-bit: [KB3172523](https://www.microsoft.com/download/details.aspx?id=54979) <br /><br />Version: 1.0|Install|
    |[**Office 2010**](../known-issues.md#aip-for-windows-and-office-versions-in-extended-support)|All supported versions|[Microsoft Online Services Sign-in Assistant](https://www.microsoft.com/download/details.aspx?id=28177)<br /><br /> Version: 2.1|Install|
    |[**Office 2010**](../known-issues.md#aip-for-windows-and-office-versions-in-extended-support)|Windows 8.1 and Windows Server 2012 R2|[KB2843630](https://www.microsoft.com/download/details.aspx?id=41708)<br /><br /> Version number included in file name: v3|Install if KB2843630 or KB2919355 is not installed|
    |[**Office 2010**](../known-issues.md#aip-for-windows-and-office-versions-in-extended-support)|Windows 8 and Windows Server 2012|[KB2843630](https://www.microsoft.com/download/details.aspx?id=41708)<br /><br /> Version number included in file name: v3|Install|
    | | | | |

1. For a default installation, run the .msi with **/quiet**, for example, `AzInfoProtection_UL.msi /quiet`.

    You may need to specify additional installation parameters. For more information, see the [executable installer instructions](#to-install-the-azure-information-protection-unified-labeling-client-by-using-the-executable-installer).

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