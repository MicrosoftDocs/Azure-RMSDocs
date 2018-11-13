---
# required metadata

title: Install the Azure Information Protection client for users
description: Instructions and information for admins to deploy the Azure Information Protection client for Windows on enterprise networks.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 11/12/2018
ms.topic: conceptual
ms.service: information-protection
ms.assetid: ea3ec965-3720-4614-8564-3ecfe60bc175

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: eymanor
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---


# Admin Guide: Install the Azure Information Protection client for users

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*

Before you install the Azure Information Protection client on your enterprise network, check that computers have the required operating system versions and applications for Azure Information Protection: [Requirements for Azure Information Protection](../requirements.md). 

Then check the additional prerequisites that might be needed for the Azure Information Protection client, as documented in the next section. Not all the prerequisites are checked by the installation program.

## Additional prerequisites for the Azure Information Protection client

- Microsoft .NET Framework 4.6.2
    
    The full installation of the Azure Information Protection client by default, requires a minimum version of Microsoft .NET Framework 4.6.2 and if this is missing, the setup wizard from the executable installer tries to download and install this prerequisite. When this prerequisite is installed as part of the client installation, the computer must be restarted. Although not recommended, you can bypass this prerequisite when you use the setup wizard by using a [custom installation parameter](#more-information-about-the-downgradedotnetrequirement-installation-parameter).
    
    This prerequisite is not automatically installed when you install the client silently by using the executable installer, Windows Update, or Windows installer. For these scenarios, you must install this prerequisite separately if it is needed, or the install fails. You can download the Microsoft .NET Framework 4.6.2 (Offline Installer) from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=53344).

- Microsoft .NET Framework 4.5.2
    
    If the Azure Information Protection Viewer is installed separately, this requires a minimum version of Microsoft .NET Framework 4.5.2 and if this is missing, the executable installer does not download or install it.

- Windows PowerShell version 4.0
    
    The PowerShell module for the client requires Windows PowerShell version 4.0, which might need to be installed on older operating systems. For more information, see [How to Install Windows PowerShell 4.0](http://social.technet.microsoft.com/wiki/contents/articles/21016.how-to-install-windows-powershell-4-0.aspx). The installer does not check or install this prerequisite for you. To confirm the version of Windows PowerShell that you are running, type `$PSVersionTable` in a PowerShell session.

- Screen resolution greater than 800x600
    
    Resolutions 800x600 and lower can't fully display the **Classify and protect - Azure Information Protection** dialog box when you right-click a file or folder in File Explorer.


- Microsoft Online Services Sign-in Assistant 7.250.4303.0
    
    Computers running Office 2010 require Microsoft Online Services Sign-in Assistant version 7.250.4303.0. This version is included with the client installation. If you have a later version of the Sign-in Assistant, uninstall it before you install the Azure Information Protection client. For example, check the version and uninstall the Sign-in Assistant by using **Control Panel** > **Program and Features** > **Uninstall or change a program**.

- KB 2533623
    
    Computers running Windows 7 Service Pack 1 require KB 2533623. For more information about this update, see [Microsoft Security Advisory: Insecure library loading could allow remote code execution](https://support.microsoft.com/en-us/kb/2533623). You might be able to install this update directly, or it might be superseded by another update that installs it for you.
    
    If this update is required and not installed, the client installation warns you that it must be installed. This update can be installed after the client is installed but some actions will be blocked and the message is displayed again.  

- Visual C++ Redistributable for Visual Studio 2015 (32-bit version)
    
    For computers running Windows 7 Service Pack 1, install **vc_redist.x86.exe** from the following download page: [Visual C++ Redistributable for Visual Studio 2015](https://www.microsoft.com/en-us/download/details.aspx?id=48145)
    
    The client installation does not check for this prerequisite but it is needed for the Azure Information Protection client to classify and protect PDF files.

- Group policy configuration for **List of managed add-ins**
    
    For Office 2013 and later versions, configure the group policy setting **List of managed add-ins** and add the **Microsoft Azure Information Protection** add-in for Office applications. Specify the following programmatic identifiers (ProgID) for Azure Information Protection, and set the option to **1: The add-in is always enabled**.
    
    - For Outlook: `MSIP.OutlookAddin`
    
    - For Word: `MSIP.WordAddin`
    
    - For Excel: `MSIP.ExcelAddin`
    
    - For PowerPoint: `MSIP.PowerPointAddin`
    
    If you do not configure this setting, the Microsoft Azure Information Protection add-in can get disabled and users will not be able to label their documents and emails in their Office application.
    
    For more information about configuring this group policy setting, see [System Administrator control over add-ins](https://docs.microsoft.com/office/vba/outlook/concepts/getting-started/support-for-keeping-add-ins-enabled#system-administrator-control-over-add-ins) from the Office documentation.

> [!IMPORTANT]
> Installation of the Azure Information Protection client requires local administrative permissions.


## Options to install the Azure Information Protection client for users

There are two options for installing the client for users:

**Run the executable (.exe) version of the client**: The recommended installation method that you can run interactively, or silently. This method has the most flexibility and it is recommended because the installer checks for many of the prerequisites, and can automatically install missing prerequisites. [Instructions](#to-install-the-azure-information-protection-client-by-using-the-executable-installer)

**Deploy the Windows installer (.msi) version of the client**: Supported for silent installs only that use a central deployment mechanism, such as group policy, Configuration Manager, and Microsoft Intune. This method is necessary for Windows 10 PCs that are managed by Intune and mobile device management (MDM) because for these computers, executable files are not supported for installation. However, when you use this installation method, you must manually check and install or uninstall the dependent software that the installer for the executable would perform for each computer. [Instructions](#to-install-the-azure-information-protection-client-by-using-the-msi-installer)

After the Azure Information Protection client is installed, you can update this client by repeating your chosen installation method, or use Windows Update to keep the client automatically upgraded. For more information about upgrading, see the [Upgrading and maintaining the Azure Information Protection client](client-admin-guide.md#upgrading-and-maintaining-the-azure-information-protection-client) section.

### To install the Azure Information Protection client by using the executable installer

Use the following instructions to install the client when you're not using the Microsoft Update catalog, or deploying the .msi by using a central deployment method such as Intune.

1. Download the executable version Azure Information Protection client from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=53018). 
    
    If there is a preview version available, keep this version for testing only. It is not intended for end users in a production environment. 

2. For a default installation, simply run the executable, for example, **AzInfoProtection.exe**. However, to see the installation options, first run the executable with **/help**: `AzInfoProtection.exe /help`

    Example to silently install the client: `AzInfoProtection.exe /quiet`
    
    Example to silently install only the PowerShell cmdlets: `AzInfoProtection.exe  PowerShellOnly=true /quiet`
    
    Additional parameters that are not listed on the help screen:
    
    - **ServiceLocation**: Use this parameter if you are installing the client on computers that run Office 2010 and your users are not local administrators on their computers or you do not want them to be prompted. [More information](#more-information-about-the-servicelocation-installation-parameter) 
    
    - **DowngradeDotNetRequirement**: Use this parameter to bypass the requirement for Microsoft Framework .NET version 4.6.2. [More information](#more-information-about-the-downgradedotnetrequirement-installation-parameter)
    
    - **AllowTelemetry=0**: Use this parameter to disable the install option **Help improve Azure Information Protection by sending usage statistics to Microsoft**. 
    
3. If you are installing interactively, select the option to install a **demo policy** if you cannot connect to Office 365 or Azure Active Directory, but want to see and experience the client side of Azure Information Protection by using a local policy for demonstration purposes. When your client connects to an Azure Information Protection service, this demo policy is replaced with your organization's Azure Information Protection policy.
    
4. To complete the installation: 

    - If your computer runs Office 2010, restart your computer. 
        
        If the client was not installed with the ServiceLocation parameter, when you first open one of the Office applications that use the Azure Information Protection bar (for example, Word), you must confirm any prompts to update the registry for this first-time use. [Service discovery](client-deployment-notes.md#rms-service-discovery) is used to populate the registry keys. 
    
    - For other versions of Office, restart any Office applications and all instances of File Explorer. 
        
5. You can confirm that the installation was successful by checking the install log file, which by default is created in the %temp% folder. You can change this location with the **/log** installation parameter. 
 
    This file has the following naming format: `Microsoft_Azure_Information_Protection_<number>_<number>_MSIP.Setup.Main.msi.log`
    
    For example: **Microsoft_Azure_Information_Protection_20161201093652_000_MSIP.Setup.Main.msi.log**
    
    In this log file, search for the following string: **Product: Microsoft Azure Information Protection -- Installation completed successfully.** If the installation failed, this log file contains details to help you identify and resolve any problems.

#### More information about the ServiceLocation installation parameter

When you install the client for users who have Office 2010 and they do not have local administrative permissions, specify the ServiceLocation parameter and the URL for your Azure Rights Management service. This parameter and value creates and sets the following registry keys:

HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\MSDRM\ServiceLocation\Activation

HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\MSDRM\ServiceLocation\EnterprisePublishing

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSDRM\ServiceLocation\EnterprisePublishing

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSDRM\ServiceLocation\Activation

Use the following procedure to identify the value to specify for the ServiceLocation parameter. 

##### To identify the value to specify for the ServiceLocation parameter

1. From a PowerShell session, first run [Connect-AadrmService](https://docs.microsoft.com/powershell/aadrm/vlatest/connect-aadrmservice) and specify your administrator credentials to connect to the Azure Rights Management service. Then run [Get-AadrmConfiguration](https://docs.microsoft.com/powershell/aadrm/vlatest/get-aadrmconfiguration). 
 
    If you haven’t already installed the PowerShell module for the Azure Rights Management service, see [Installing the AADRM PowerShell module](../install-powershell.md).

2. From the output, identify the **LicensingIntranetDistributionPointUrl** value.

    For example: **LicensingIntranetDistributionPointUrl   : https://5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com/_wmcs/licensing**

3. From the value, remove **/_wmcs/licensing** from this string. For example: **https://5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com**

    The remaining string is the value to specify for your ServiceLocation parameter.

Example to install the client silently for Office 2010 and Azure RMS: `AzInfoProtection.exe /quiet ServiceLocation=https://5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com`


#### More information about the DowngradeDotNetRequirement installation parameter

To support automatic upgrades by using Windows Update, and for reliable integration with Office applications, the Azure Information Protection client uses Microsoft .NET Framework version 4.6.2. By default, an interactive installation by using the executable checks for this version and tries to install it if it is missing. The installation then requires the computer to restart.

If installing this later version of the Microsoft .NET Framework is not practical, you can install the client with the **DowngradeDotNetRequirement=True** parameter and value, which bypasses this requirement if Microsoft .NET Framework version 4.5.1 is installed.

For example: `AzInfoProtection.exe DowngradeDotNetRequirement=True`

We recommend that you use this parameter with caution, and with the knowledge that there are reported issues with Office applications hanging when the Azure Information Protection client is used with this older version of the Microsoft .NET Framework. If you do experience hanging problems, upgrade to the recommended version before you try other troubleshooting solutions. 

Also remember that if you use Windows Update to keep the Azure Information Protection client updated, you must have another software deployment mechanism to upgrade the client to later versions.

### To install the Azure Information Protection client by using the .msi installer

For central deployment, use the following information that is specific to the .msi installation version of the Azure Information Protection client. 

If you use Intune for your software deployment method, use these instructions together with [Add apps with Microsoft Intune](/intune/deploy-use/add-apps).

1. Download the .msi version of the Azure Information Protection client from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=53018). 
    
    If there is a preview version available, keep this version for testing only. It is not intended for end users in a production environment. 

2. For each computer that runs the .msi file, you must make sure that the following software dependencies are in place. For example, package these with the .msi version of the client or only deploy to computers that meet these dependencies:
    
    |Office version|Operating system|Software|Action|
    |--------------------|--------------|----------------|---------------------|
    |Office 2016|All supported versions|64-bit: [KB3178666](https://www.microsoft.com/en-us/download/details.aspx?id=55007)<br /><br />32-bit: [KB3178666](https://www.microsoft.com/en-us/download/details.aspx?id=54999)<br /><br /> Version: 1.0|Install|
    |Office 2013|All supported versions|64-bit: [KB3172523](https://www.microsoft.com/en-us/download/details.aspx?id=54992)<br /><br /> 32-bit: [KB3172523](https://www.microsoft.com/en-us/download/details.aspx?id=54979) <br /><br />Version: 1.0|Install|
    |Office 2010|All supported versions|[Microsoft Online Services Sign-in Assistant](https://www.microsoft.com/en-us/download/details.aspx?id=28177)<br /><br /> Version: 2.1|Install|
    |Office 2010|Windows 8.1 and Windows Server 2012 R2|[KB2843630](https://www.microsoft.com/en-us/download/details.aspx?id=41708)<br /><br /> Version number included in file name: v3|Install if KB2843630 or KB2919355 is not installed|
    |Office 2010|Windows 8 and Windows Server 2012|[KB2843630](https://www.microsoft.com/en-us/download/details.aspx?id=41708)<br /><br /> Version number included in file name: v3|Install|
    |Office 2010|Windows 7 and Windows Server 2008 R2|[KB2843630](https://www.microsoft.com/en-us/download/details.aspx?id=41709)<br /><br /> Version number included in file name: v3|Install if KB3125574 is not installed|
    |Not applicable|Windows 7|[vc_redist.x86.exe](https://www.microsoft.com/en-us/download/details.aspx?id=48145)|Install|
    |Not applicable|Windows 7|KB2627273 <br /><br /> Version number included in file name: v4|Uninstall|

3. For a default installation, run the .msi with **/quiet**, for example, `AzInfoProtection.msi /quiet`. However, you might need to specify additional installation parameters that are documented in the [executable installer instructions](#to-install-the-azure-information-protection-client-by-using-the-executable-installer).  


## How to install the Azure Information Protection scanner

The PowerShell module that is included with the Azure Information Protection client has cmdlets to install and configure the scanner. However, to use the scanner, you must install the full version of the client and cannot install just the PowerShell module.

To install the client for the scanner, follow the same instructions in the preceding sections. You're then ready to install the scanner. For instructions, see [Deploying the Azure Information Protection scanner to automatically classify and protect files](../deploy-aip-scanner.md).

## Next steps
Now that you've installed the Azure Information Protection client, see the following for additional information that you might need to support this client:

- [Customizations](client-admin-guide-customizations.md)

- [Client files and usage logging](client-admin-guide-files-and-logging.md)

- [Document tracking](client-admin-guide-document-tracking.md)

- [File types supported](client-admin-guide-file-types.md)

- [PowerShell commands](client-admin-guide-powershell.md)


