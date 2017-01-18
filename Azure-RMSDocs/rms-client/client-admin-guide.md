---
# required metadata

title: Azure Information Protection client administrator guide | Azure Information Protection
description: Instructions and information for admins on an enterprise network who are responsible for deploying the Azure Information Protection client for Windows.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 01/30/2017
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


Use the following information if you are responsible for the Microsoft Azure Information Protection client on an enterprise network, or if you want more technical information than is in the [Azure Information Protection client user guide](client-user-guide.md).

The Azure Information Protection client is best suited to work with Azure Information Protection, because this deployment configuration supports sending protected documents to users in another organization, and options such as document tracking with revocation. However, with some limitations, it also works with the on-premises version of Rights Management, AD RMS. For a comprehensive comparison of features that are supported by Azure Information Protection and AD RMS, see [Comparing Azure Information Protection and AD RMS](../understand-explore/compare-azure-rms-ad-rms.md). If you have AD RMS and want to migrate to Azure Information Protection, see [Migrating from AD RMS to Azure Information Protection](../plan-design/migrate-from-ad-rms-to-azure-rms.md).

## Should you deploy the Azure Information Protection client?

Deploy the Azure Information Protection client if any of the following applies:

- You want to classify (and optionally, protect) documents and email messages by selecting labels from within your Office applications (Word, Excel, PowerPoint, Outlook).

- You want to classify (and optionally, protect) documents and email messages by using File Explorer, which supports non-Office files, multi-select, and folders.

- You want to run scripts that classify (and optionally, protect) documents by using PowerShell commands.

- You want to view protected documents when a native application to display the file is not installed.

- You want to just protect files by using File Explorer or by using Powershell commands.

- You want to remove encryption (unprotect) files and containers in bulk for data recovery purposes.

- You run Office 2010 and want to protect documents and email messages by using the Azure Rights Management service.

When the Azure Information Protection client is installed, it adds an Information Protection bar to your Office applications (Word, Excel, PowerPoint, Outlook) that displays the classification labels for your organization, in addition to a new **Protection** group on the **Home** tab (Word, Excel, PowerPoint), that has a button named **Protect**:

![Azure Information Protection bar with default policy](../media/info-protect-bar-default.png)

## How to install the Azure Information Protection client for users

Before you install the client, check that you have the required operating system versions and applications for the Azure Information Protection client: [Requirements for Azure Information Protection](../get-started/requirements-azure-rms.md). In addition, for the preview version of the client, computers running Windows 7 SP1 require [KB 2533623](https://support.microsoft.com/en-us/kb/2533623), which can be installed after the client is installed. If this update is required and not installed, you will be prompted to install it.

> [!NOTE]
> Installation requires local administrative permissions.

In addition to using the following instructions, the General Availability version of the Azure Information Protection client is also included in the Microsoft Update catalog, so that you can install and update the client by using any software update service that uses the catalog. 

1. Download the Azure Information Protection client from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=53018). 

2. For a default installation, simply run the executable, **AzInfoProtection.exe**. However, to see the installation options, first run the executable with **/help**: `AzInfoProtection.exe /help`

   Example to silently install the client: `AzInfoProtection.exe /quiet`
   
   Example to silently install only the PowerShell cmdlets: `AzInfoProtection.exe  PowerShellOnly=true /quiet`
   
   In addition, if you are installing the client on computers that run Office 2010, you must specify the **ServiceLocation** parameter (not included in the help screen) if your users are not local administrators on their computers. See the next section for more information.

3. If you are installing interactively, select the option to install a **demo policy** if you cannot connect to Office 365 or Azure Active Directory, but want to see and experience the client side of Azure Information Protection by using a local policy for demonstration purposes. When your client connects to an Azure Information Protection service, this demo policy is replaced with your organization's Azure Information Protection policy.
    
4. To complete the installation: 

    - If your computer runs Office 2010, restart your computer. 
        
        If the client was not installed with the ServiceLocation parameter, when you first open one of the Office applications that use the Azure Information Protection bar (for example, Word), you must confirm any prompts to update the registry for this first-time use. [Service discovery](../rms-client/client-deployment-notes.md#rms-service-discovery) is used to populate the registry keys. 
    
    - For other versions of Office, restart any Office applications and all instances of File Explorer. 
        


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


## To verify installation, connection status, or report a problem

1. Open an Office application and on the **Home** tab, in the **Protection** group, click **Protect**, and then click **Help and feedback**.

2. In the **Microsoft Azure Information Protection** dialog box, note the following:

    - In the **client status** section: Use the **Version** value to verify that the installation was successful. In addition, you see when the client last connected to your organization's Azure Information Protection service and when the Azure Information Protection policy was last installed or updated. When the client connects to the service, it automatically downloads the latest policy if it finds changes from its current policy. If you have made policy changes after the displayed time, close and reopen the Office application.
    
        You also see your displayed user name that identifies the account that is used to authenticate you to Azure Information Protection. This user name must match an account that you use for Office 365 or Azure Active Directory and that belongs to a tenant that is configured for Azure Information Protection.

    - In the **Help and feedback** section: The **Tell me more link** by default, goes to the [Azure Information Protection](https://www.microsoft.com/en-us/cloud-platform/azure-information-protection) website but can be configured for a custom URL as one of the [policy settings](../deploy-use/configure-policy-settings.md) in the Azure Information Protection policy.
        
        Use the **Send feedback** link to automatically attach your client logs to an email message that can be sent to the Information Protection team to investigate a problem. 
    
        For diagnostic information and to reset the client, click **Run diagnostics**. When the diagnostics tests finish, click **Copy Results** to paste the information into an email that you can send to your help desk or Microsoft support. When the tests finish, you can also reset the client.
        
        More information about the **Reset** option:
        
        - You do not have to be a local administrator to use this option and this action is not logged in the Event Viewer. 
        
        - Unless files are locked, this action deletes all the files in **%localappdata%\Microsoft\MSIPC**, which is where client certificates and rights management templates are stored. It does not delete the Azure Information Protection policy, or the client log files, or sign out the user.
        
        - The following registry key and settings are deleted: **HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\MSIPC**. If you configure settings for this registry key (for example, settings for redirection to your Azure Information Protection tenant because you are migrating from AD RMS and still have a Service Connection Point on your network), you must reconfigure the registry settings after you reset the client.
        
        - After you have reset the client, you must re-initialize the user environment (also known as "bootstrapping"), which will download certificates for the client and the latest templates. To do this, close all instances of Office and then restart an Office application. This action will also check that you have downloaded the latest Azure Information Protection policy. Do not run the diagnostics tests again until you have done this.


## Configuring document tracking
If you have a [subscription that supports document tracking](https://www.microsoft.com/en-us/cloud-platform/azure-information-protection-features), the document tracking site is enabled by default for all users in your organization. Document tracking shows information such as email addresses of the people who attempted to access protected documents that users shared, when these people tried to access them, and their location. If displaying this information is prohibited in your organization because of privacy requirements, you can disable access to the document tracking site by using the  [Disable-AadrmDocumentTrackingFeature](http://go.microsoft.com/fwlink/?LinkId=623032) cmdlet. You can re-enable access to the site at any time, by using the [Enable-AadrmDocumentTrackingFeature](http://go.microsoft.com/fwlink/?LinkId=623037), and you can check whether access is currently enabled or disabled by using [Get-AadrmDocumentTrackingFeature](http://go.microsoft.com/fwlink/?LinkId=623037).

To run these cmdlets, you must have at least version **2.3.0.0** of the Azure Rights Management module for Windows PowerShell. For installation instructions, see [Installing Windows PowerShell for Azure Rights Management](../deploy-use/install-powershell.md).

> [!TIP]
> If you have previously downloaded and installed the module, check the version number by running: `(Get-Module aadrm –ListAvailable).Version`

The following URLs are used for document tracking and must be allowed (for example, add them to your Trusted Sites if you're using Internet Explorer with Enhanced Security):

-   https://&#42;.azurerms.com

-   https://ecn.dev.virtualearth.net

    > [!NOTE]
    > This URL is for Bing maps.

-   https://&#42;.microsoftonline.com

-   https://&#42;.microsoftonline-p.com

### Tracking and revoking documents for users

When users sign in to the document tracking site, they can track and revoke documents that they have shared by using the RMS sharing application. When you sign in as an administrator for Azure Information Protection (global admin), you can click the Admin icon in the top right of the page, which switches to Administrator mode so that you can see the documents that have been shared by users in your organization.

Actions that you take in Administrator mode are audited and logged in the usage log files, and you must confirm to continue. For more information about this logging, see the next section.

When you are in Administrator mode, you can then search by user or document. If you search by user, you will see all the documents that the specified user has shared. If you search by document, you will see all the users in your organization who shared that document. You can then drill into the search results to track the documents that users have shared and revoke these documents, if necessary. 

To leave the Administrator mode, click **X** next to **Exit administrator mode**.

For instructions how to use the document tracking site, see [Track and revoke your documents](client-track-revoke.md) from the user guide.



### Usage logging for the document tracking site

Two fields in the usage log files are applicable to document tracking: **AdminAction** and **ActingAsUser**.

**AdminAction** - This field has a value of true when an administrator uses the document tracking site in Administrator mode, for example, to revoke a document on a user's behalf or to see when it was shared. This field is empty when a user signs in to the document tracking site.

**ActingAsUser** - When the AdminAction field is true, this field contains the user name that the administrator is acting on behalf of as the searched for user or document owner. This field is empty when a user signs in to the document tracking site. 

There are also request types that log how users and administrators are using the document tracking site. For example, **RevokeAccess** is the request type when a user or an administrator on behalf of a user has revoked a document in the document tracking site. Use this request type in combination with the AdminAction field to determine whether the user revoked their own document (the AdminAction field is empty) or an administrator revoked a document on behalf of a user (the AdminAction is true).


For more information about usage logging, see [Logging and analyzing usage of the Azure Rights Management service](../deploy-use/log-analyze-usage.md)



## Next steps
Now that you've installed the Azure Information Protection client, see the following for additional information that you might need to support this client:

-[Client files and usage logging](client-admin-guide-files-and-logging.md)

- [Configuring and using document tracking](client-admin-guide-document-tracking.md)

- [File types supported](client-admin-guide-file-types.md)

- [Using PowerShell](client-admin-guide-powershell.md)


[!INCLUDE[Commenting house rules](../includes/houserules.md)]
