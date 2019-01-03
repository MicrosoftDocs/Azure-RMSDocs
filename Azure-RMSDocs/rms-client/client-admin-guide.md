---
# required metadata

title: Azure Information Protection client admin guide
description: Instructions and information for admins on an enterprise network who are responsible for deploying the Azure Information Protection client for Windows.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 01/16/2019
ms.topic: conceptual
ms.service: information-protection
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

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*

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

- An Office add-in, that installs the Azure Information Protection bar for users to select classification labels, and a **Protect** button on the ribbon for additional options. For Outlook, a **Do Not Forward** button is also available for the ribbon.

- Windows File Explorer, right-click options for users to apply classification labels and protection to files.

- A viewer to display protected files when a native application cannot open it.

- A PowerShell module to apply and remove classification labels and protection from files. 
    
    This module includes cmdlets to install and configure the [Azure Information Protection scanner](../deploy-aip-scanner.md) that runs as a service on Windows Server. This service lets you discover, classify, and protect files on data stores such as network shares and SharePoint Server libraries.

- The Rights Management client that communicates with Azure Rights Management (Azure RMS) or Active Directory Rights Management Services (AD RMS).

The Azure Information Protection client is best suited to work with its Azure services; Azure Information Protection and its data protection service, Azure Rights Management. However, with some limitations, the Azure Information Protection client also works with the on-premises version of Rights Management, AD RMS. For a comprehensive comparison of features that are supported by Azure Information Protection and AD RMS, see [Comparing Azure Information Protection and AD RMS](../compare-on-premise.md). 

If you have AD RMS and want to migrate to Azure Information Protection, see [Migrating from AD RMS to Azure Information Protection](../migrate-from-ad-rms-to-azure-rms.md).


## Should you deploy the Azure Information Protection client?

Deploy the Azure Information Protection client if any of the following applies:

- You want to classify (and optionally, protect) documents and email messages by selecting labels from within your Office applications (Word, Excel, PowerPoint, Outlook).

- You want to classify (and optionally, protect) documents and email messages by using File Explorer, which supports additional file types, multi-select, and folders.

- You want to run scripts that classify (and optionally, protect) documents by using PowerShell commands.

- You want to run a service that discovers, classifies (and optionally, protects) files that are stored on-premises.

- You want to view protected documents when a native application to display the file is not installed or cannot open these documents.

- You want to just protect files by using File Explorer or by using PowerShell commands.

- You want users and administrators to be able to track and revoke protected documents.

- You want to remove encryption from files and containers (unprotect) in bulk for data recovery purposes.

- You run Office 2010 and want to protect documents and email messages by using the Azure Rights Management service.

Example showing the Azure Information Protection client add-in for an Office application, displaying the classification labels for your organization, and the new **Protect** button on the ribbon:

![Azure Information Protection bar with default policy](../media/word2016-calloutsv2.png)

## Installing and supporting the Azure Information Protection client

You can install the Azure Information Protection client by using Windows Update, an executable, or a Windows installer file. For more information about each choice, and instructions, see [Install the Azure Information Protection client for users](client-admin-guide-install.md).  

Use the following sections for supporting information about installing the client. 

### Installation checks and troubleshooting

When the client is installed, use the **Help and Feedback** option to open the **Microsoft Azure Information Protection** dialog box:

- From an Office application: On the **Home** tab, in the **Protection** group, select **Protect**, and then select **Help and Feedback**.

- From File Explorer: Right-select a file, files, or folder, select **Classify and protect**, and then select **Help and Feedback**. 

#### **Help and Feedback** section

The **Tell me more link** by default, goes to the [Azure Information Protection](https://www.microsoft.com/cloud-platform/azure-information-protection) website but you can configure it for a custom URL as one of the [policy settings](../configure-policy-settings.md) in the Azure Information Protection policy.

The **Report an Issue** link displays only if you specify an [advanced client setting](client-admin-guide-customizations.md#add-report-an-issue-for-users). When you configure this setting, you specify an HTTP link such as the email address of your help desk.

The **Export Logs** automatically collects and attaches log files for the Azure Information Protection client if you have been asked to send these to Microsoft Support. This option can also be used by end users to send these log files to your help desk.

The **Reset Settings** signs out the user, deletes the currently downloaded Azure Information Protection policy, and resets the user settings for the Azure Rights Management service.

##### More information about the Reset Settings option

- You do not have to be a local administrator to use this option and this action is not logged in the Event Viewer. 

- Unless files are locked, this action deletes all the files in the following locations. These files include client certificates, Rights Management templates, the Azure Information Protection policy, and the cached user credentials. The client log files are not deleted.
    
    - %LocalAppData%\Microsoft\DRM
    
    - %LocalAppData%\Microsoft\MSIPC
    
    - %LocalAppData%\Microsoft\MSIP\Policy.msip
    
    - %LocalAppData%\Microsoft\MSIP\TokenCache

- The following registry keys and settings are deleted. If the settings for any of these registry keys have custom values, these must be reconfigured after you reset the client. 
    
    Typically for enterprise networks, these settings are configured by using group policy, in which case they are automatically reapplied when group policy is refreshed on the computer. However, there might be some settings that are configured one time with a script, or manually configured. In these cases, you must take additional steps to reconfigure these settings. As an example, computers might run a script one time to configure settings for redirection to Azure Information Protection because you are migrating from AD RMS and still have a Service Connection Point on your network. After resetting the client, the computer must run this script again.
    
    - HKEY_CURRENT-USER\SOFTWARE\Microsoft\Office\15.0\Common\Identity
    
    - HKEY_CURRENT-USER\SOFTWARE\Microsoft\Office\14.0\Common\DRM
    
    - HKEY_CURRENT-USER\SOFTWARE\Microsoft\Office\15.0\Common\DRM
    
    - HKEY_CURRENT-USER\SOFTWARE\Microsoft\Office\16.0\Common\DRM
    
    - HKEY_CURRENT-USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\MSIPC    

- The currently signed in user is signed out.

#### **Client status** section

Use the **Connected as** value to confirm that the displayed user name identifies the account to be used for Azure Information Protection authentication. This user name must match an account used for Office 365 or Azure Active Directory. The account must also belong to a tenant that is configured for Azure Information Protection.

If you need to sign in as a different user to the one displayed, see the [Sign in as a different user](client-admin-guide-customizations.md#sign-in-as-a-different-user) customization.

The **Last connection** displays when the client last connected to your organization's Azure Information Protection service. You can use this information with the **Information Protection policy was installed on** date and time to confirm when the Azure Information Protection policy was last installed or updated. When the client connects to the service, it automatically downloads the latest policy if it finds changes from its current policy, and also every 24 hours. If you have made policy changes after the displayed time, close and reopen the Office application.

If you see **This client is not licensed for Office Professional Plus**: The Azure Information Protection client has detected that the installed edition of Office does not support applying Rights Management protection. When this detection is made, labels that apply protection do not display on the Azure Information Protection bar.

Use the **Version** information to confirm which version of the client is installed. You can check whether this is the latest release version and the corresponding fixes and new features by clicking the **What's New** link, to read the [Version release history](client-version-release-history.md) for the client.

## Support for multiple languages

The Azure Information Protection client supports the same languages that Office 365 supports. For a list of these languages, see the **Office 365, Exchange Online Protection, and Power BI** section from the [International availability](https://products.office.com/business/international-availability) page from Office.

For these languages, menu options, dialog boxes, and messages from the Azure Information Protection client display in the user's language. There is a single installer that detects the language, so no additional configuration is required to install the Azure Information Protection client for different languages. 

However, label names and descriptions that you specify are not automatically translated when you configure labels in the Azure Information Protection policy. Beginning with August 30, 2017, the current [default policy](../configure-policy-default.md) includes support for some languages. For users to see labels in their preferred language, provide your own translations and configure the Azure Information Protection policy to use these translations. For more information, see [How to configure labels for different languages in Azure Information Protection](../configure-policy-languages.md). Visual markings are not translated and do not support more than one language.

## Post installation tasks

After you have installed the Azure Information Protection client, make sure that you give users instructions for how to label their documents and emails, and guidance for which labels to choose for specific scenarios. For example:

- Online user instructions: [Azure Information Protection user guide](client-user-guide.md)

- Download a customizable user guide: [Azure Information Protection End User Adoption Guide](https://download.microsoft.com/download/7/1/2/712A280C-1C66-4EF9-8DC3-88EE43BEA3D4/Azure_Information_Protection_End_User_Adoption_Guide_EN_US.pdf)

### Update macros in Excel spreadsheets

If you have Excel spreadsheets that contain macros, edit the macros as follows to ensure that they continue to work as expected after the Azure Information Protection client is installed:

1. At the beginning of the macro, add:

		Application.EnableEvents = False

2. At the end of the macro, add:

		Application.EnableEvents = True

For more information, see [Application.EnableEvents Property (Excel)](https://msdn.microsoft.com/vba/excel-vba/articles/application-enableevents-property-excel).

## Upgrading and maintaining the Azure Information Protection client

The Azure Information Protection team regularly updates the Azure Information Protection client for new functionality and fixes. Announcements are posted to the team's [Yammer site](https://www.yammer.com/AskIPTeam).

If you are using Windows Update, the Azure Information Protection client automatically upgrades the general availability version of the client, irrespective of how the client was installed. New client releases are published to the catalog a few weeks after the release.

Alternatively, you can manually upgrade the client by downloading the new release from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=53018). Then install the new version to upgrade the client. You must use this method to upgrade preview versions.

When you manually upgrade, uninstall the previous version first only if you're changing the installation method. For example, you change from the executable (.exe) version of the client to the Windows installer (.msi) version of the client. Or, if you need to install a previous version of the client. For example, you have the current preview version installed for testing and now need to revert to the current general availability version.

Use the [Version release history and support policy](client-version-release-history.md) to understand the support policy for the Azure Information Protection client, which versions are currently supported, and what's new and changed for the supported releases. 

### Upgrading the Azure Information Protection scanner

How to upgrade the scanner depends on whether you are upgrading to the current GA version, or to the current preview version.

#### To upgrade the scanner to the current GA version

To upgrade the Azure Information Protection scanner, install the latest version of the Azure Information Protection client. Then do the following one-time action. After you have done this, there is no need to rescan already scanned files.

- Run [Update-AIPScanner](/powershell/module/azureinformationprotection/Update-AIPScanner) after you have upgraded the Azure Information Protection client. Your configuration settings for the scanner and repositories will be retained. Running this cmdlet is required to update the database schema for the scanner and if required, the scanner service account is also granted delete permissions for the scanner database. 
    
    Until you run this update cmdlet, the scanner does not run and you typically see Event ID **1000** in the Windows event log, with the following error message: **Invalid object name 'ScannerStatus'**.

#### To upgrade the scanner to the current preview version

For the current preview version of the scanner, the upgrade process is very different from previous versions. Upgrading the scanner automatically changes the scanner to gets its configuration settings that you configure from the Azure portal, the schema is updated, and the AzInfoProtection configuration database for the scanner is also renamed:

- If you do not specify your own profile name, the configuration database is renamed **AIPScanner_\<computer_name>**. 

- If you specify your own profile name, the configuration database is renamed **AIPScanner_\<profile_name>**.

Although it's possible to upgrade the scanner in a different order, we highly recommend the following steps:

> [!IMPORTANT]
> For a smooth upgrade path, do not install the preview version of the Azure Information Protection client on the computer running the scanner as your first step to upgrade the scanner. Instead, follow the upgrade instructions.

1. Create a new scanner profile in the Azure portal, and configure settings for the scanner and your data repositories. For instructions, see 
    
    If the computer running the scanner is disconnected from the Internet, you still need to do this step. Then, export your settings to a file.

2. On the scanner computer, stop the scanner service, **Azure Information Protection Scanner**.

3. Upgrade the Azure Information Protection client by installing the current preview version from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=53018).

4. In a PowerShell session, run the Update-AIPScanner command with the same profile name that you specified in step 1. For example: `Update-AIPScanner –Profile USWEST`

5. Only if the scanner is running on a disconnected computer: Now run Import-AIPScannerConfiguration and specify the file that contains the exported settings.

6. Restart the Azure Information Protection Scanner service, **Azure Information Protection Scanner**.

If you don't configure the scanner in the Azure portal before you run the Update-AIPScanner command, you won't have a profile name to specify that identifies your scanner configuration settings for the upgrade process. In this scenario, when you configure the scanner in the Azure portal, you must specify the same profile name that was used for the Update-AIPScanner command. If you didn't specify a profile name when you ran this update command, the computer name is used to automatically create the profile name for the scanner.

## Uninstalling the Azure Information Protection client

You can use any of the following options to uninstall the client:

- Use Control Panel to uninstall a program: Click **Microsoft Azure Information Protection** > **Uninstall**

- Rerun the executable (for example, **AzInfoProtection.exe**), and from the **Modify Setup** page, click **Uninstall**. 

- Run the executable with **/uninstall**. For example: `AzInfoProtection.exe /uninstall`

## Next steps
To install the client, see [Install the Azure Information Protection client for users](client-admin-guide-install.md).

If you've already installed the client, see the following for additional information that you might need to support this client:

- [Customizations](client-admin-guide-customizations.md)

- [Client files and usage logging](client-admin-guide-files-and-logging.md)

- [Document tracking](client-admin-guide-document-tracking.md)

- [File types supported](client-admin-guide-file-types.md)

- [PowerShell commands](client-admin-guide-powershell.md)


