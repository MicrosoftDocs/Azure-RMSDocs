---
# required metadata

title: Azure Information Protection client admin guide
description: Instructions and information for admins on an enterprise network who are responsible for deploying the Azure Information Protection client for Windows.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 03/09/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 

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

>*Applies to: Active Directory Rights Management Services, Azure Information Protection, Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1*


Use the following information if you are responsible for the Azure Information Protection client on an enterprise network, or if you want more technical information than is in the [Azure Information Protection client user guide](client-user-guide.md).

The Azure Information Protection client includes the following:

- An Office add-on, that installs the Azure Information Protection bar for users to select classification labels, and a **Protect** button on the ribbon for additional options.

- Windows File Explorer, right-click options for users to apply classification labels and protection to files.

- A viewer to display protected files when a native application cannot open it.

- A PowerShell module to apply and remove classification labels and protection from files.

- The Rights Management client that communicates with Azure Rights Management (Azure RMS) or Active Directory Rights Management Services (AD RMS).

The Azure Information Protection client is best suited to work with its Azure services; Azure Information Protection and its data protection service, Azure Rights Management. However, with some limitations, the Azure Information Protection client also works with the on-premises version of Rights Management, AD RMS. For a comprehensive comparison of features that are supported by Azure Information Protection and AD RMS, see [Comparing Azure Information Protection and AD RMS](../understand-explore/compare-azure-rms-ad-rms.md). If you have AD RMS and want to migrate to Azure Information Protection, see [Migrating from AD RMS to Azure Information Protection](../plan-design/migrate-from-ad-rms-to-azure-rms.md).

**Have a question that's not answered by this documentation?** Visit our [Azure Information Protection Yammer site](https://www.yammer.com/AskIPTeam). 


## Should you deploy the Azure Information Protection client?

Deploy the Azure Information Protection client if any of the following applies:

- You want to classify (and optionally, protect) documents and email messages by selecting labels from within your Office applications (Word, Excel, PowerPoint, Outlook).

- You want to classify (and optionally, protect) documents and email messages by using File Explorer, which supports additional file types, multi-select, and folders.

- You want to run scripts that classify (and optionally, protect) documents by using PowerShell commands.

- You want to view protected documents when a native application to display the file is not installed or cannot open these documents.

- You want to just protect files by using File Explorer or by using Powershell commands.

- You want users and administrators to be able to track and revoke protected documents.

- You want to remove encryption from files and containers (unprotect) in bulk for data recovery purposes.

- You run Office 2010 and want to protect documents and email messages by using the Azure Rights Management service.

Example showing the Azure Information Protection client add-on in an Office applications, displaying the classification labels for your organization, and the new **Protect** button on the ribbon:

![Azure Information Protection bar with default policy](../media/info-protect-bar-default.png)

## How to install the Azure Information Protection client for users

Before you install the client, check that you have the required operating system versions and applications for the Azure Information Protection client: [Requirements for Azure Information Protection](../get-started/requirements-azure-rms.md). 

In addition:

- The full installation of the Azure Information Protection client requires a minimum version of Microsoft .NET Framework 4.6.2 and if this is missing, the installer tries to download and install this prerequisite. When this prerequisite is installed as part of the client installation, the computer must be restarted.

- If the Azure Information Protection Viewer is installed separately, this requires a minimum version of Microsoft .NET Framework 4.5.2 and if this is missing, the installer does not download or install it.

- The PowerShell module requires Windows PowerShell version 4.0, which might need to be installed on older operating systems. For more information, see [How to Install Windows PowerShell 4.0](http://social.technet.microsoft.com/wiki/contents/articles/21016.how-to-install-windows-powershell-4-0.aspx). The installer does not check or install this prerequisite for you. To confirm the version of Windows PowerShell that you are running, type **$PSVersionTable** in a PowerShell session.

- Computers running Windows 7 Service Pack 1 require KB 2533623. For more information about this update, see [Microsoft Security Advisory: Insecure library loading could allow remote code execution](https://support.microsoft.com/en-us/kb/2533623). You might be able to install this update directly, or it might be superseded by another update that installs it for you.
    
    If this update is required and not installed, the client installation warns you that it must be installed. This update can be installed after the client is installed but some actions will be blocked and the message is displayed again.  

> [!NOTE]
> Installation requires local administrative permissions.

In addition to using the following instructions, the Azure Information Protection client is also included in the Microsoft Update catalog, so that you can install and update the client by using any software update service that uses the catalog. 

1. Download the Azure Information Protection client from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=53018). 
    
    If there is a prevew version available, keep this version for testing only. It is not intended for end users in a production environment. 

2. For a default installation, simply run the executable, for example, **AzInfoProtection.exe**. However, to see the installation options, first run the executable with **/help**: `AzInfoProtection.exe /help`

   Example to silently install the client: `AzInfoProtection.exe /quiet`
   
   Example to silently install only the PowerShell cmdlets: `AzInfoProtection.exe  PowerShellOnly=true /quiet`
   
   In addition, if you are installing the client on computers that run Office 2010, you must specify the **ServiceLocation** parameter (not included in the help screen) if your users are not local administrators on their computers. See the next section for more information.

3. If you are installing interactively, select the option to install a **demo policy** if you cannot connect to Office 365 or Azure Active Directory, but want to see and experience the client side of Azure Information Protection by using a local policy for demonstration purposes. When your client connects to an Azure Information Protection service, this demo policy is replaced with your organization's Azure Information Protection policy.
    
4. To complete the installation: 

    - If your computer runs Office 2010, restart your computer. 
        
        If the client was not installed with the ServiceLocation parameter, when you first open one of the Office applications that use the Azure Information Protection bar (for example, Word), you must confirm any prompts to update the registry for this first-time use. [Service discovery](../rms-client/client-deployment-notes.md#rms-service-discovery) is used to populate the registry keys. 
    
    - For other versions of Office, restart any Office applications and all instances of File Explorer. 
        
5. You can confirm that the installation was successful by checking the install log file in the %temp% folder. This file has the following naming format: `Microsoft_Azure_Information_Protection_<number>_<number>_MSIP.Setup.Main.msi.log`
    
    For example: **Microsoft_Azure_Information_Protection_20161201093652_000_MSIP.Setup.Main.msi.log**
    
    In this log file, search for the following string: **Product: Microsoft Azure Information Protection -- Installation completed successfully.** If the installation failed, this log file contains details to help you identify and resolve any problems.

### Additional instructions for Office 2010 only

When you install the client for users who have Office 2010 and they do not have local administrative permissions, specify the ServiceLocation parameter and the URL for your Azure Rights Management service. This parameter and value creates and sets the following registry keys:

HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\MSDRM\ServiceLocation\Activation

HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\MSDRM\ServiceLocation\EnterprisePublishing

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSDRM\ServiceLocation\EnterprisePublishing

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSDRM\ServiceLocation\Activation

Use the following procedure to identify the value to specify for the ServiceLocation parameter. 

#### To identify the value to specify for the ServiceLocation parameter

1. From a PowerShell session, first run [Connect-AadrmService](https://docs.microsoft.com/powershell/aadrm/vlatest/connect-aadrmservice) and specify your administrator credentials to connect to the Azure Rights Management service. Then run [Get-AadrmConfiguration](https://docs.microsoft.com/powershell/aadrm/vlatest/get-aadrmconfiguration). 
 
    If you haven’t already installed the PowerShell module for the Azure Rights Management service, see [Installing Windows PowerShell for Azure Rights Management](../deploy-use/install-powershell.md).

2. From the output, identify the **LicensingIntranetDistributionPointUrl** value.

    For example: **LicensingIntranetDistributionPointUrl   : https://5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com/_wmcs/licensing**

3. From the value, remove **/_wmcs/licensing** from this string. For example: **https://5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com**

    The remaining string is the the value to specify for your ServiceLocation parameter.

Example to install the client silently for Office 2010 and Azure RMS: `AzInfoProtection.exe /quiet ServiceLocation=https://5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com`


## To uninstall the Azure Information Protection client

You can use any of these options:

- Use Control Panel to uninstall a program: Click **Microsoft Azure Information Protection** > **Uninstall**

- Rerun the executable (for example, **AzInfoProtection.exe**), and from the **Modify Setup** page, click **Uninstall**. 

- Run the executable with **/uninstall**. For example: `AzInfoProtection.exe /uninstall`


## Additional checks To verify installation, connection status, or send feedback

1. Open an Office application and on the **Home** tab, in the **Protection** group, click **Protect**, and then click **Help and feedback**.

2. In the **Microsoft Azure Information Protection** dialog box, note the following:

    - In the **client status** section: Use the **Version** value to verify that the installation was successful. In addition, you see when the client last connected to your organization's Azure Information Protection service and when the Azure Information Protection policy was last installed or updated. When the client connects to the service, it automatically downloads the latest policy if it finds changes from its current policy. If you have made policy changes after the displayed time, close and reopen the Office application.
    
        You also see your displayed user name that identifies the account that is used to authenticate you to Azure Information Protection. This user name must match an account that you use for Office 365 or Azure Active Directory and that belongs to a tenant that is configured for Azure Information Protection.

    - In the **Help and feedback** section: The **Tell me more link** by default, goes to the [Azure Information Protection](https://www.microsoft.com/en-us/cloud-platform/azure-information-protection) website but can be configured for a custom URL as one of the [policy settings](../deploy-use/configure-policy-settings.md) in the Azure Information Protection policy.
        
        Use the **Send feedback** link to send suggestions or requests to the Information Protection team. Do not use this option for technical support but instead, see the [Support options and community resources](../get-started/information-support.md#support-options-and-community-resources). 
    
        For diagnostic information and to reset the client, click **Run diagnostics**. When the diagnostics tests finish, click **Copy Results** to paste the information into an email that you can send to your help desk or Microsoft support. When the tests finish, you can also reset the client.
        
        More information about the **Reset** option:
        
        - You do not have to be a local administrator to use this option and this action is not logged in the Event Viewer. 
        
        - Unless files are locked, this action deletes all the files in **%localappdata%\Microsoft\MSIPC**, which is where client certificates and rights management templates are stored. It does not delete the Azure Information Protection policy, or the client log files, or sign out the user.
        
        - The following registry key and settings are deleted: **HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\MSIPC**. If you configure settings for this registry key (for example, settings for redirection to your Azure Information Protection tenant because you are migrating from AD RMS and still have a Service Connection Point on your network), you must reconfigure the registry settings after you reset the client.
        
        - After you have reset the client, you must re-initialize the user environment (also known as "bootstrapping"), which will download certificates for the client and the latest templates. To do this, close all instances of Office and then restart an Office application. This action will also check that you have downloaded the latest Azure Information Protection policy. Do not run the diagnostics tests again until you have done this.


## Next steps
Now that you've installed the Azure Information Protection client, see the following for additional information that you might need to support this client:

- [Client files and usage logging](client-admin-guide-files-and-logging.md)

- [Document tracking](client-admin-guide-document-tracking.md)

- [File types supported](client-admin-guide-file-types.md)

- [PowerShell commands](client-admin-guide-powershell.md)


[!INCLUDE[Commenting house rules](../includes/houserules.md)]
