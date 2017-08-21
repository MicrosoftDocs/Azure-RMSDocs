---
# required metadata

title: Azure Information Protection client admin guide
description: Instructions and information for admins on an enterprise network who are responsible for deploying the Azure Information Protection client for Windows.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 08/09/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 33a5982f-7125-4031-92c2-05daf760ced1

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: eymanor
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---


# Azure Information Protection client administrator guide

>*Applies to: Active Directory Rights Management Services, Azure Information Protection, Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*

Use the information in this guide if you are responsible for the Azure Information Protection client on an enterprise network, or if you want more technical information than is in the [Azure Information Protection client user guide](client-user-guide.md). 

For example:

- Understand the different components of this client and whether you should install it

- How to install the client for users, with information about prerequisites, installation options and parameters, and verification checks

- How to accommodate custom configurations that often require editing the registry

- Locate the client files and usage logs

- Identify the file types supported by the client

- Configure and use the document tracking site for users

- Use the client with PowerShell for command-line control

**Have a question that's not addressed by this documentation?** Visit our [Azure Information Protection Yammer site](https://www.yammer.com/AskIPTeam). 

## Technical overview of the Azure Information Protection client

The Azure Information Protection client includes the following:

- An Office add-on, that installs the Azure Information Protection bar for users to select classification labels, and a **Protect** button on the ribbon for additional options.

- Windows File Explorer, right-click options for users to apply classification labels and protection to files.

- A viewer to display protected files when a native application cannot open it.

- A PowerShell module to apply and remove classification labels and protection from files.

- The Rights Management client that communicates with Azure Rights Management (Azure RMS) or Active Directory Rights Management Services (AD RMS).

The Azure Information Protection client is best suited to work with its Azure services; Azure Information Protection and its data protection service, Azure Rights Management. However, with some limitations, the Azure Information Protection client also works with the on-premises version of Rights Management, AD RMS. For a comprehensive comparison of features that are supported by Azure Information Protection and AD RMS, see [Comparing Azure Information Protection and AD RMS](../understand-explore/compare-azure-rms-ad-rms.md). 

If you have AD RMS and want to migrate to Azure Information Protection, see [Migrating from AD RMS to Azure Information Protection](../plan-design/migrate-from-ad-rms-to-azure-rms.md).


## Should you deploy the Azure Information Protection client?

Deploy the Azure Information Protection client if any of the following applies:

- You want to classify (and optionally, protect) documents and email messages by selecting labels from within your Office applications (Word, Excel, PowerPoint, Outlook).

- You want to classify (and optionally, protect) documents and email messages by using File Explorer, which supports additional file types, multi-select, and folders.

- You want to run scripts that classify (and optionally, protect) documents by using PowerShell commands.

- You want to view protected documents when a native application to display the file is not installed or cannot open these documents.

- You want to just protect files by using File Explorer or by using PowerShell commands.

- You want users and administrators to be able to track and revoke protected documents.

- You want to remove encryption from files and containers (unprotect) in bulk for data recovery purposes.

- You run Office 2010 and want to protect documents and email messages by using the Azure Rights Management service.

Example showing the Azure Information Protection client add-on in an Office application, displaying the classification labels for your organization, and the new **Protect** button on the ribbon:

![Azure Information Protection bar with default policy](../media/word2016-calloutsv2.png)

## How to install the Azure Information Protection client for users

Before you install the client, check that computers have the required operating system versions and applications for Azure Information Protection: [Requirements for Azure Information Protection](../get-started/requirements-azure-rms.md). 

Then check the additional prerequisites that might be needed for the Azure Information Protection client.

### Additional prerequisites for the Azure Information Protection client

- Microsoft .NET Framework 4.6.2
    
    The full installation of the Azure Information Protection client by default, requires a minimum version of Microsoft .NET Framework 4.6.2 and if this is missing, the installer tries to download and install this prerequisite. When this prerequisite is installed as part of the client installation, the computer must be restarted. Although not recommended, you can bypass this prerequisite with a [custom installation parameter](#more-information-about-the-downgradedotnetrequirement-installation-parameter).

- Microsoft .NET Framework 4.5.2
    
    If the Azure Information Protection Viewer is installed separately, this requires a minimum version of Microsoft .NET Framework 4.5.2 and if this is missing, the installer does not download or install it.

- Windows PowerShell version 4.0
    
    The PowerShell module for the client requires Windows PowerShell version 4.0, which might need to be installed on older operating systems. For more information, see [How to Install Windows PowerShell 4.0](http://social.technet.microsoft.com/wiki/contents/articles/21016.how-to-install-windows-powershell-4-0.aspx). The installer does not check or install this prerequisite for you. To confirm the version of Windows PowerShell that you are running, type `$PSVersionTable` in a PowerShell session.

- Microsoft Online Services Sign-in Assistant 7.250.4303.0
    
    Computers running Office 2010 require Microsoft Online Services Sign-in Assistant version 7.250.4303.0. This version is included with the client installation. If you have a later version of the Sign-in Assistant, uninstall it before you install the Azure Information Protection client. For example, check the version and uninstall the Sign-in Assistant by using **Control Panel** > **Program and Features** > **Uninstall or change a program**.

- KB 2533623
    
    Computers running Windows 7 Service Pack 1 require KB 2533623. For more information about this update, see [Microsoft Security Advisory: Insecure library loading could allow remote code execution](https://support.microsoft.com/en-us/kb/2533623). You might be able to install this update directly, or it might be superseded by another update that installs it for you.
    
    If this update is required and not installed, the client installation warns you that it must be installed. This update can be installed after the client is installed but some actions will be blocked and the message is displayed again.  

- Do not disable the **Microsoft Azure Information Protection** add-in for Office applications
    
    If you have configured the group policy setting **List of managed add-ins**, add the Microsoft Azure Information Protection add-in for Office applications by specifying the following programmatic identifiers (ProgID) for Azure Information Protection, and set the option to **1: The add-in is always enabled**.
    
    - For Outlook: `MSIP.OutlookAddin`
    
    - For Word: `MSIP.WordAddin`
    
    - For Excel: `MSIP.ExcelAddin`
    
    - For PowerPoint: `MSIP.PowerPointAddin`
    
    Even if you haven't configured this **List of managed add-ins** group policy setting, you might need to configure it if you get reports that the Microsoft Azure Information Protection add-in is getting disabled. When this add-in is disabled, users do not see the Azure Information Protection bar in the Office application.
    
    For more information about this group policy setting, see [No Add-ins loaded due to group policy settings for Office 2013 and Office 2016 programs](https://support.microsoft.com/help/2733070/no-add-ins-loaded-due-to-group-policy-settings-for-office-2013-and-off).

> [!IMPORTANT]
> Installation of the Azure Information Protection client requires local administrative permissions.


### Options to install the Azure Information Protection client for users

There are three options for installing the client for users:

**Windows Update**: The Azure Information Protection client is included in the Microsoft Update catalog, so that you can install and update this client by using any software update service that uses the catalog.

**Run the executable (.exe) version of the client**: The recommended installation method that you can run interactively, or silently. This method has the most flexibility and it is recommended because the installer checks for many of the prerequisites, and can automatically install missing prerequisites. [Instructions](#to-install-the-azure-information-protection-client-by-using-the-executable-installer)

**Deploy the Windows installer (.msi) version of the client**: Supported for silent installs only that use a central deployment mechanism, such as group policy, Configuration Manager, and Microsoft Intune. This method is necessary for Windows 10 PCs that are managed by Intune and mobile device management (MDM) because for these computers, executable files are not supported for installation. However, when you use this installation method, you must manually check and install or uninstall the dependent software that the installer for the executable would perform for each computer. [Instructions](#to-install-the-azure-information-protection-client-by-using-the-msi-installer)

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
        
        If the client was not installed with the ServiceLocation parameter, when you first open one of the Office applications that use the Azure Information Protection bar (for example, Word), you must confirm any prompts to update the registry for this first-time use. [Service discovery](../rms-client/client-deployment-notes.md#rms-service-discovery) is used to populate the registry keys. 
    
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
 
    If you haven’t already installed the PowerShell module for the Azure Rights Management service, see [Installing Windows PowerShell for Azure Rights Management](../deploy-use/install-powershell.md).

2. From the output, identify the **LicensingIntranetDistributionPointUrl** value.

    For example: **LicensingIntranetDistributionPointUrl   : https://5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com/_wmcs/licensing**

3. From the value, remove **/_wmcs/licensing** from this string. For example: **https://5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com**

    The remaining string is the value to specify for your ServiceLocation parameter.

Example to install the client silently for Office 2010 and Azure RMS: `AzInfoProtection.exe /quiet ServiceLocation=https://5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com`


#### More information about the DowngradeDotNetRequirement installation parameter

To support automatic upgrades by using Windows Update, and for reliable integration with Office applications, the Azure Information Protection client uses Microsoft .NET Framework version 4.6.2. By default, the installation checks for this version and tries to install it if it is missing. The installation then requires the computer to restart.

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
    |Office 2016|All supported versions|64-bit: [KB317866](https://www.microsoft.com/en-us/download/details.aspx?id=55073)<br /><br />32-bit: [KB317866](https://www.microsoft.com/en-us/download/details.aspx?id=55058)<br /><br /> Version: 1.0|Install|
    |Office 2013|All supported versions|64-bit: [KB3172523](https://www.microsoft.com/en-us/download/details.aspx?id=54992)<br /><br /> 32-bit: [KB3172523](https://www.microsoft.com/en-us/download/details.aspx?id=54979) <br /><br />Version: 1.0|Install|
    |Office 2010|All supported versions|[Microsoft Online Services Sign-in Assistant](https://www.microsoft.com/en-us/download/details.aspx?id=28177)<br /><br /> Version: 2.1|Install|
    |Office 2010|Windows 8.1 and Windows Server 2012 R2|[KB2843630](https://www.microsoft.com/en-us/download/details.aspx?id=41708)<br /><br /> Version number included in file name: v3|Install if KB2843630 or KB2919355 is not installed|
    |Office 2010|Windows 8 and Windows Server 2012|[KB2843630](https://www.microsoft.com/en-us/download/details.aspx?id=41708)<br /><br /> Version number included in file name: v3|Install|
    |Office 2010|Windows 7|[KB2843630](https://www.microsoft.com/en-us/download/details.aspx?id=41709)<br /><br /> Version number included in file name: v3|Install if KB3125574 is not installed|
    |Not applicable|Windows 7|KB2627273 <br /><br /> Version number included in file name: v4|Uninstall|
    

3. For a default installation, run the .msi with **/quiet**, for example, `AzInfoProtection.msi /quiet`. However, you might need to specify additional installation parameters that are documented in the [executable installer instructions](#to-install-the-azure-information-protection-client-by-using-the-executable-installer).  

## Additional checks and troubleshooting

Use the **Help and Feedback** option to open the **Microsoft Azure Information Protection** dialog box:

- From an Office application: On the **Home** tab, in the **Protection** group, select **Protect**, and then select **Help and Feedback**.

- From File Explorer: Right-select a file, files, or folder, select **Classify and protect**, and then select **Help and Feedback**. 

### **Help and Feedback** section

The **Tell me more link** by default, goes to the [Azure Information Protection](https://www.microsoft.com/cloud-platform/azure-information-protection) website but you can configure it for a custom URL as one of the [policy settings](../deploy-use/configure-policy-settings.md) in the Azure Information Protection policy.

Use the **Send Us Feedback** link to send suggestions or requests to the Information Protection team. Do not use this option for technical support but instead, see the [Support options and community resources](../get-started/information-support.md#support-options-and-community-resources). 

The **Export Logs** automatically collects and attaches log files for the Azure Information Protection client if you have been asked to send these to Microsoft Support. This option can also be used by end users to send these log files to your help desk.

For diagnostic information and to reset the client, select **Run diagnostics**. When the diagnostics tests finish, click **Copy Results** to paste the information into an email that you can send to Microsoft Support, or end users can send to your help desk. When the tests finish, you can also reset the client.

> [!NOTE]
> In the preview version of the client, **Run diagnostics** is removed and replaced with **Reset Settings**. In addition, the behavior for this option has [changed](#more-information-about-the-reset-option-for-the-current-preview-version-of-the-azure-information-protection-client).

#### More information about the reset option for the general availability (GA) version of the Azure Information Protection client

- You do not have to be a local administrator to use this option and this action is not logged in the Event Viewer. 

- Unless files are locked, this action deletes all the files in **%LocalAppData%\Microsoft\MSIPC**, which is where client certificates and Rights Management templates are stored. It does not delete the Azure Information Protection policy, or the client log files, or sign out the user.

- The following registry key and settings are deleted: **HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\MSIPC**. If you configured settings for this registry key, you must reconfigure the registry settings after you reset the client. For example, you configured settings for redirection to your Azure Information Protection tenant because you are migrating from AD RMS and still have a Service Connection Point on your network.

- After you have reset the client, you must reinitialize the user environment, which will download certificates for the client and the latest templates. To do this, close all instances of Office and then restart an Office application. This action also checks that you have downloaded the latest Azure Information Protection policy. Do not run the diagnostics tests again until you have done this.

#### More information about the reset option for the current preview version of the Azure Information Protection client

- You do not have to be a local administrator to use this option and this action is not logged in the Event Viewer. 

- Unless files are locked, this action deletes all the files in the following locations. These files include client certificates, Rights Management templates, the Azure Information Protection policy, and the cached user credentials. The client log files are not deleted.
    
    - %LocalAppData%\Microsoft\DRM
    
    - %LocalAppData%\Microsoft\MSIPC
    
    - %LocalAppData%\Microsoft\MSIP\Policy.msip
    
    - %LocalAppData%\Microsoft\MSIP\TokenCache

- The following registry keys and settings are deleted. If you configured settings for any of these registry keys, you must reconfigure them after you reset the client. For example, you configured settings for redirection to your Azure Information Protection tenant because you are migrating from AD RMS and still have a Service Connection Point on your network:
    
    - HKEY_CURRENT-USER\SOFTWARE\Microsoft\Office\15.0\Common\Identity
    
    - HKEY_CURRENT-USER\SOFTWARE\Microsoft\Office\14.0\Common\DRM
    
    - HKEY_CURRENT-USER\SOFTWARE\Microsoft\Office\15.0\Common\DRM
    
    - HKEY_CURRENT-USER\SOFTWARE\Microsoft\Office\16.0\Common\DRM
    
    - HKEY_CURRENT-USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\MSIPC    

- The currently signed in user is signed out.

### **Client status** section

Use the **Connected as** value to confirm that the displayed user name identifies the account to be used for Azure Information Protection authentication. This user name must match an account used for Office 365 or Azure Active Directory. The account must also belong to a tenant that is configured for Azure Information Protection.

If you need to sign in as a different user to the one displayed, see the [Sign in as a different user](client-admin-guide-customizations.md#sign-in-as-a-different-user) customization.

The **Last connection** displays when the client last connected to your organization's Azure Information Protection service. You can use this information with the **Information Protection policy was installed on** date and time to confirm when the Azure Information Protection policy was last installed or updated. When the client connects to the service, it automatically downloads the latest policy if it finds changes from its current policy, and also every 24 hours. If you have made policy changes after the displayed time, close and reopen the Office application.

If you see **This client is not licensed for Office Professional Plus**: The Azure Information Protection client has detected that the installed edition of Office does not support applying Rights Management protection. When this detection is made, labels that apply protection do not display on the Azure Information Protection bar.

Use the **Version** information to confirm which version of the client is installed. You can check whether this is the latest release version and the corresponding fixes and new features by clicking the **What's New** link, to read the [Version release history](client-version-release-history.md) for the client.

## Support for multiple languages

The Azure Information Protection client supports the same languages that Office 365 supports. For a list of these languages, see the **Office 365, Exchange Online Protection, and Power BI** section from the [International availability](https://products.office.com/business/international-availability) page from Office.

For these languages, menu options, dialog boxes, and messages from the Azure Information Protection client display in the user's language. There is a single installer that detects the language, so no additional configuration is required to install the Azure Information Protection client for different languages. 

However, label names and descriptions that you specify are not automatically translated when you configure labels in the Azure Information Protection policy. Beginning with August 30, 2017, the current [default policy](../deploy-use/configure-policy-default.md) includes support for some languages. For users to see labels in their preferred language, provide your own translations and configure the Azure Information Protection policy to use these translations. For more information, see [How to configure labels for different languages in Azure Information Protection](../deploy-use/configure-policy-languages.md).

## To uninstall the Azure Information Protection client

You can use any of these options:

- Use Control Panel to uninstall a program: Click **Microsoft Azure Information Protection** > **Uninstall**

- Rerun the executable (for example, **AzInfoProtection.exe**), and from the **Modify Setup** page, click **Uninstall**. 

- Run the executable with **/uninstall**. For example: `AzInfoProtection.exe /uninstall`

## Next steps
Now that you've installed the Azure Information Protection client, see the following for additional information that you might need to support this client:

- [Customizations](client-admin-guide-customizations.md)

- [Client files and usage logging](client-admin-guide-files-and-logging.md)

- [Document tracking](client-admin-guide-document-tracking.md)

- [File types supported](client-admin-guide-file-types.md)

- [PowerShell commands](client-admin-guide-powershell.md)


[!INCLUDE[Commenting house rules](../includes/houserules.md)]
