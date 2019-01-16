---
# required metadata

title: Install PowerShell for AADRM - AIP
description: Instructions to install Windows PowerShell for the Azure Rights Management service from Azure Information Protection. The name of this module is AADRM.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 12/12/2018
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

# Installing the AADRM PowerShell module

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

Use the following information to help you install the Windows PowerShell module for the Azure Rights Management service from Azure Information Protection. The name of this module is AADRM.

You can use this PowerShell module to administer the Azure Rights Management service from the command line by using any computer that has an Internet connection and that meets the prerequisites listed in the next section. Windows PowerShell for Azure Rights Management supports scripting for automation or might be necessary for advanced configuration scenarios. For more information about the administration tasks and configurations that the module supports, see [Administering Azure Rights Management by Using Windows PowerShell](administer-powershell.md).

## Prerequisites
This table lists the prerequisites to install and use the AADRM PowerShell module for the Azure Rights Management service from Azure Information Protection.

|Requirement|More information|
|---------------|--------------------|
|Minimum version of Windows PowerShell: 3.0|You can confirm the version of Windows PowerShell that you are running by typing `$PSVersionTable` in a PowerShell session. <br /><br /> If you need to install a later version of Windows PowerShell, see [Upgrading existing Windows PowerShell](/powershell/scripting/setup/installing-windows-powershell#upgrading-existing-windows-powershell).|
|Minimum version of the Microsoft .NET Framework: 4.5<br /><br />Note: This version of the Microsoft .NET Framework is included with the later operating systems, so you should  need to manually install it only if your client operating system is less than Windows 8.0 or your server operating system is less than Windows Server 2012.|If the minimum version of the  Microsoft .NET Framework is not already installed, you can download [Microsoft .NET Framework 4.5](https://www.microsoft.com/download/details.aspx?id=30653).<br /><br />This minimum version of the Microsoft .NET Framework is required for some of the classes that the AADRM module uses.|

Starting with version 2.5.0.0 of the AADRM module, the Microsoft Online Services Sign-In Assistant is no longer required.

> [!NOTE]
> 
> If you installed a version of the AADRM module with the Azure Rights Management Administration Tool, use **Programs and Features** to uninstall **Windows Azure AD Rights Management Administration** before you install the latest version of the AADRM module from the PowerShell Gallery.


## How to install the AADRM module

The AADRM module has moved to the [PowerShell Gallery](/powershell/gallery/readme) and is no longer available from the Microsoft Download Center. 

### To install the AADRM module from the PowerShell Gallery

If you're new to the PowerShell Gallery, see [Get Started with the PowerShell Gallery](/powershell/gallery/psgallery/psgallery_gettingstarted). Follow the instructions for the gallery requirements, which include installing the PowerShellGet module and the NuGet provider.

To see details about the AADRM module on the PowerShell Gallery, visit the [AADRM page](https://www.powershellgallery.com/packages/AADRM).

To install the AADRM module, start a PowerShell session with the **Run as Administrator** option, and type:

	Install-Module -Name AADRM

If you are warned about installing from an untrusted repository, you can press Y to confirm. Or, press N and configure the PowerShell Gallery as a trusted repository by using the command `Set-PSRepository -Name PSGallery -InstallationPolicy Trusted` and then rerun the command to install the AADRM module.  

If you have a previous version of the AADRM module installed from the Gallery, update it to the latest by typing:

	Update-Module -Name AADRM


## Next steps
In a Windows PowerShell session, confirm the version of the installed module. This check is particularly important if you upgraded from an older version:

```
(Get-Module AADRM –ListAvailable).Version
```

Note: If this command fails, first run **Import-Module AADRM**.

To see which cmdlets are available, type the following:

```
Get-Command -Module AADRM
```

Use the `Get-Help <cmdlet_name>` command to see the Help for a specific cmdlet, and use the **-online** parameter to see the latest help on the Microsoft documentation site. For example:

```
Get-Help Connect-AadrmService -online
```

For more information:

-   Full list of cmdlets available: [AADRM Module](/powershell/aadrm/vlatest/rightsmanagement)

-   List of main configuration scenarios that support  PowerShell: [Administering Azure Rights Management by Using Windows PowerShell](administer-powershell.md)

Before you can run any commands that configure the Azure Rights Management service, you must connect to the service by using the [Connect-AadrmService](/powershell/aadrm/vlatest/connect-aadrmservice) cmdlet. 
When you have finished running your configuration commands, as a best practice, disconnect from the service by using the [Disconnect-AadrmService](/powershell/aadrm/vlatest/disconnect-aadrmservice) cmdlet. If you do not disconnect, the connection is automatically disconnected after a period of inactivity. Because of the automatic disconnection behavior, you might find that you need to occasionally reconnect in a PowerShell session. 

> [!NOTE]
> If the Azure Rights Management service is not yet activated, you can do this after you have connected to the service, by using the [Enable-Aadrm](/powershell/aadrm/vlatest/enable-aadrm) cmdlet.

