---
title: Installing Windows PowerShell for Azure Rights Management
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 0d665ed6-b1de-4d63-854a-bc57c1c49844
author: Cabailey
---
# Installing Windows PowerShell for Azure Rights Management
Use the following information to help you install Windows PowerShell for Microsoft [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] (Azure RMS).

You can use this Windows PowerShell module to administer [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] from the command line by using any computer that has an Internet connection and that meets the prerequisites listed in the next section. Windows PowerShell for [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] supports scripting for automation or might be necessary for advanced configuration scenarios. For more information about the administration tasks and configurations that the module supports, see [Administering Azure Rights Management by Using Windows PowerShell](../Topic/Administering-Azure-Rights-Management-by-Using-Windows-PowerShell.md).

## Prerequisites
This table lists the prerequisites to install and use Windows PowerShell for [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)].

|Requirement|More information|
|---------------|--------------------|
|A version of Windows that supports the [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)] administration module|Check the list of supported operating systems in the **System Requirements** section of the [download page for the Azure Rights Management Administration Tool](http://go.microsoft.com/fwlink/?LinkId=257721).|
|Minimum version of Windows PowerShell: 2.0|Support for the [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)] administration module is introduced in Windows PowerShell 2.0.<br /><br />By default, most Windows operating systems install with at least version 2.0 of Windows PowerShell. If you need to install Windows PowerShell 2.0, see [Install Windows PowerShell 2.0](http://msdn.microsoft.com/library/ff637750.aspx).<br /><br />Tip: You can confirm the version of Windows PowerShell that you are running by typing **$PSVersionTable** in a Windows PowerShell session.|
|Minimum version of the Microsoft .NET Framework: 4.5<br /><br />Note: This version of the Microsoft .NET Framework is included with the later operating systems, so you should  need to manually install it only if your client operating system is less than Windows 8.0 or your server operating system is less than Windows Server 2012.|If the minimum version of the  Microsoft .NET Framework is not already installed, you can download [Microsoft .NET Framework 4.5](http://www.microsoft.com/download/details.aspx?id=30653).<br /><br />This minimum version of the Microsoft .NET Framework is required for some of the classes that the [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)] administration module uses.|
|Microsoft Online Services Sign-In Assistant 7.0|The Microsoft Online Services Sign-In Assistant is required for [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] authentication.<br /><br />For more information, see [Download Center: Microsoft Online Services Assistant for IT Professionals RTW](http://www.microsoft.com/en-us/download/details.aspx?id=41950).|

## How to install the Rights Management administration module

1.  Go to the Microsoft Download Center and [download the Azure Rights Management Administration Tool](https://go.microsoft.com/fwlink/?LinkId=257721), which contains the [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] administration module for Windows PowerShell.

2.  From the local folder where you downloaded and saved the [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)] installer file, double-click the executable file that you downloaded for your platform (WindowsAzureADRightsManagementAdministration_x64 or WindowsAzureADRightsManagementAdministration_x86.exe) to start the Azure AD Rights Management Administration Setup Wizard.

3.  Complete the wizard.

Windows PowerShell for [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] is now installed.

## Next steps
To see which cmdlets are available, start Windows PowerShell with the **Run as administrator** option and type the following:

```
Get-Command -Module aadrm
```
Use `the Get-Help <cmdlet_name>` command to see the Help for a specific cmdlet.

For more information:

-   Full list of cmdlets available: [Azure Rights Management Cmdlets](https://msdn.microsoft.com/library/windowsazure/dn629398.aspx)

-   List of main configuration scenarios that support Windows PowerShell: [Administering Azure Rights Management by Using Windows PowerShell](../Topic/Administering-Azure-Rights-Management-by-Using-Windows-PowerShell.md)

Before you can run any commands that configure the [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] service, you must connect to the  service by using the [Connect-AadrmService](https://msdn.microsoft.com/library/windowsazure/dn629415.aspx) cmdlet. When you have finished running the configuration commands that you want, disconnect from the service by using the [Disconnect-AadrmService](https://msdn.microsoft.com/library/windowsazure/dn629416.aspx) cmdlet.

> [!NOTE]
> If you have not yet activated [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)], you can do this after you have connected to the service, by using the [Enable-Aadrm](https://msdn.microsoft.com/library/windowsazure/dn629412.aspx) cmdlet.

## See Also
[Administering Azure Rights Management by Using Windows PowerShell](../Topic/Administering-Azure-Rights-Management-by-Using-Windows-PowerShell.md)

