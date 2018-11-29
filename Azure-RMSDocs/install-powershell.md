---
# required metadata

title: Install the AIPService PowerShell module for Azure Information Protection
description: Instructions to install PowerShell for the protection service from Azure Information Protection. The name of this module is AIPService.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 04/23/2018
ms.topic: conceptual
ms.service: information-protection
ms.assetid: 0d665ed6-b1de-4d63-854a-bc57c1c49844

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Installing the AIPService PowerShell module

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](http://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

Use the following information to help you install the Windows PowerShell module for the protection service from Azure Information Protection. The name of this module is AIPService, and it replaces the previous version that was named AADRM.

You can use this PowerShell module to administer the protection service (Azure Rights Management) from the command line by using any computer that has an Internet connection and that meets the prerequisites listed in the next section. Windows PowerShell for Azure Information Protection supports scripting for automation or might be necessary for advanced configuration scenarios. For more information about the administration tasks and configurations that the module supports, see [Administering protection from Azure Information Protection by using PowerShell](administer-powershell.md).

## Prerequisites
This table lists the prerequisites to install and use the AIPService PowerShell module for the protection service from Azure Information Protection.

|Requirement|More information|
|---------------|--------------------|
|Minimum version of Windows PowerShell: 3.0|You can confirm the version of Windows PowerShell that you are running by typing `$PSVersionTable` in a PowerShell session. <br /><br /> If you need to install a later version of Windows PowerShell, see [Upgrading existing Windows PowerShell](/powershell/scripting/setup/installing-windows-powershell#upgrading-existing-windows-powershell).|
|Minimum version of the Microsoft .NET Framework: 4.5<br /><br />Note: This version of the Microsoft .NET Framework is included with the later operating systems, so you should  need to manually install it only if your client operating system is less than Windows 8.0 or your server operating system is less than Windows Server 2012.|If the minimum version of the  Microsoft .NET Framework is not already installed, you can download [Microsoft .NET Framework 4.5](http://www.microsoft.com/download/details.aspx?id=30653).<br /><br />This minimum version of the Microsoft .NET Framework is required for some of the classes that the AIPService module uses.|

## If you have the AADRM module installed

The AIPService module replaces the older module, AADRM. If you have the older module installed, uninstall it and then install the AIPService module.

The newer module has aliases to the cmdlet names in the older module so that any existing scripts will continue to work. However, plan to update these references before the old module falls out of support. Support for the AADRM module will end 31 January, 2020.

If you installed the AADRM module with the Azure Rights Management Administration Tool, use **Programs and Features** to uninstall **Windows Azure AD Rights Management Administration**.


## How to install the AIPService module

The AIPService module is on the [PowerShell Gallery](/powershell/gallery/readme) and is not available from the Microsoft Download Center. 

### To install the AIPService module from the PowerShell Gallery

If you're new to the PowerShell Gallery, see [Get Started with the PowerShell Gallery](/powershell/gallery/psgallery/psgallery_gettingstarted). Follow the instructions for the gallery requirements, which include installing the PowerShellGet module and the NuGet provider.

To see details about the AIPService module on the PowerShell Gallery, visit the [AIPService page](https://www.powershellgallery.com/packages/AIPService).

To install the AIPService module, start a PowerShell session with the **Run as Administrator** option, and type:

	Install-Module -Name AIPService

If you are warned about installing from an untrusted repository, you can press Y to confirm. Or, press N and configure the PowerShell Gallery as a trusted repository by using the command `Set-PSRepository -Name PSGallery -InstallationPolicy Trusted` and then rerun the command to install the AIPService module.  

If you have a previous version of the AIPService module installed from the Gallery, update it to the latest by typing:

	Update-Module -Name AIPService


## Next steps
In a Windows PowerShell session, confirm the version of the installed module. This check is particularly important if you upgraded from an older version:

```
(Get-Module AIPService –ListAvailable).Version
```

Note: If this command fails, first run **Import-Module AIPService**.

To see which cmdlets are available, type the following:

```
Get-Command -Module AIPService
```

Use the `Get-Help <cmdlet_name>` command to see the Help for a specific cmdlet, and use the **-online** parameter to see the latest help on the Microsoft documentation site. For example:

```
Get-Help Connect-AipService -online
```

For more information:

-   Full list of cmdlets available: [AIPService Module](/powershell/aipservice/?view=azureipps#aipservice)

-   List of main configuration scenarios that support PowerShell: [Administering protection from Azure Information Protection by using PowerShell](administer-powershell.md)

Before you can run any commands that configure the protection service, you must connect to the service by using the [Connect-AipService](/powershell/aipservice/connect-aipservice) cmdlet.

When you have finished running your configuration commands, as a best practice, disconnect from the service by using the [Disconnect-AipService](/powershell/aipservice/disconnect-aipservice) cmdlet. If you do not disconnect, the connection is automatically disconnected after a period of inactivity. Because of the automatic disconnection behavior, you might find that you need to occasionally reconnect in a PowerShell session. 

> [!NOTE]
> If the protection service is not yet activated, you can do this after you have connected to the service, by using the [Enable-AipService](/powershell/aipservice/enable-aipservice) cmdlet.

