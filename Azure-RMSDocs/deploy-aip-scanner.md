---
# required metadata

title: Deploy the Azure Information Protection scanner
description: Instructions to install, configure, and run the Azure Information Protection scanner to discover, classify, and protect files on data stores.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 10/24/2018
ms.topic: conceptual
ms.service: information-protection
ms.assetid: 20d29079-2fc2-4376-b5dc-380597f65e8a

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: demizets
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Deploying the Azure Information Protection scanner to automatically classify and protect files

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows Server 2016, Windows Server 2012 R2*

Use this information to learn about the Azure Information Protection scanner, and then how to successfully install, configure, and run it. 

This scanner runs as a service on Windows Server and lets you discover, classify, and protect files on the following data stores:

- Local folders on the Windows Server computer that runs the scanner.

- UNC paths for network shares that use the Server Message Block (SMB) protocol.

- Sites and libraries for SharePoint Server 2016 and SharePoint Server 2013. SharePoint 2010 is also supported for customers who have [extended support for this version of SharePoint](https://support.microsoft.com/lifecycle/search?alpha=SharePoint%20Server%202010).

To scan and label files on cloud repositories, use [Cloud App Security](https://docs.microsoft.com/cloud-app-security/).

## Overview of the Azure Information Protection scanner

When you have configured your [Azure Information Protection policy](configure-policy.md) for labels that apply automatic classification, files that this scanner discovers can then be labeled. Labels apply classification, and optionally, apply protection or remove protection:

![Azure Information Protection scanner architecture overview](./media/infoprotect-scanner.png)

The scanner can inspect any files that Windows can index, by using iFilters that are installed on the computer. Then, to determine if the files need labeling, the scanner uses the Office 365 built-in data loss prevention (DLP) sensitivity information types and pattern detection, or Office 365 regex patterns. Because the scanner uses the Azure Information Protection client, it can classify and protect the same [file types](./rms-client/client-admin-guide-file-types.md).

You can run the scanner in discovery mode only, where you use the reports to check what would happen if the files were labeled. Or, you can run the scanner to automatically apply the labels. You can also run the scanner to discover files that contain sensitive information types, without configuring labels for conditions that apply automatic classification.

Note that the scanner does not discover and label in real time. It systematically crawls through files on data stores that you specify, and you can configure this cycle to run once, or repeatedly.

You can specify which file types to scan, or exclude from scanning. To restrict which files the scanner inspects, define a file types list by using [Set-AIPScannerScannedFileTypes](/powershell/module/azureinformationprotection/Set-AIPScannerScannedFileTypes).


## Prerequisites for the Azure Information Protection scanner
Before you install the Azure Information Protection scanner, make sure that the following requirements are in place.

|Requirement|More information|
|---------------|--------------------|
|Windows Server computer to run the scanner service:<br /><br />- 4 core processors<br /><br />- 4 GB of RAM<br /><br />- 10 GB free space (average) for temporary files|Windows Server 2016 or Windows Server 2012 R2. <br /><br />Note: For testing or evaluation purposes in a non-production environment, you can use a Windows client operating system that is [supported by the Azure Information Protection client](requirements.md#client-devices).<br /><br />This computer can be a physical or virtual computer that has a fast and reliable network connection to the data stores to be scanned.<br /><br /> The scanner requires sufficient disk space to create temporary files for each file that it scans, four files per core. The recommended disk space of 10 GB allows for 4 core processors scanning 16 files that each have a file size of 625 MB. <br /><br />Make sure that this computer has the [Internet connectivity](requirements.md#firewalls-and-network-infrastructure) that it needs for Azure Information Protection. If Internet connectivity is not possible because of your organization policies, see the [Deploying the scanner with alternative configurations](#deploying-the-scanner-with-alternative-configurations) section.|
|SQL Server to store the scanner configuration:<br /><br />- Local or remote instance<br /><br />- Sysadmin role to install the scanner|SQL Server 2012 is the minimum version for the following editions:<br /><br />- SQL Server Enterprise<br /><br />- SQL Server Standard<br /><br />- SQL Server Express<br /><br />If you install more than one instance of the scanner, each scanner instance requires its own SQL Server instance.<br /><br />When you install the scanner and your account has the Sysadmin role, the installation process automatically creates the AzInfoProtectionScanner database and grants the required db_owner role to the service account that runs the scanner.  If you cannot be granted the Sysadmin role or your organization policies require databases to be created and configured manually, see the [Deploying the scanner with alternative configurations](#deploying-the-scanner-with-alternative-configurations) section.|
|Service account to run the scanner service|In addition to running the scanner service, this account authenticates to Azure AD and downloads the Azure Information Protection policy. This account must be an Active Directory account and synchronized to Azure AD. If you cannot synchronize this account because of your organization policies, see the [Deploying the scanner with alternative configurations](#deploying-the-scanner-with-alternative-configurations) section.<br /><br />This service account has the following requirements:<br /><br />- **Log on locally** right. This right is required for the installation and configuration of the scanner, but not for operation. You must grant this right to the service account but you can remove this right after you have confirmed that the scanner can discover, classify, and protect files. If granting this right even for a short period of time is not possible because of your organization policies, see the [Deploying the scanner with alternative configurations](#deploying-the-scanner-with-alternative-configurations) section.<br /><br />- **Log on as a service** right. This right is automatically granted to the service account during the scanner installation and this right is required for the installation, configuration, and operation of the scanner. <br /><br />- Permissions to the data repositories: You must grant **Read** and **Write** permissions for scanning the files and then applying classification and protection to the files that meet the conditions in the Azure Information Protection policy. To run the scanner in discovery mode only, **Read** permission is sufficient.<br /><br />- For labels that reprotect or remove protection: To ensure that the scanner always has access to protected files, make this account a [super user](configure-super-users.md) for the Azure Rights Management service, and ensure that the super user feature is enabled. For more information about the account requirements for applying protection, see [Preparing users and groups for Azure Information Protection](prepare.md). In addition, if you have implemented [onboarding controls](activate-service.md#configuring-onboarding-controls-for-a-phased-deployment) for a phased deployment, make sure that this account is included in your onboarding controls you've configured.|
|The Azure Information Protection client is installed on the Windows Server computer|You must install the full client for the scanner. Do not install the client with just the PowerShell module.<br /><br />For client installation instructions, see the [admin guide](./rms-client/client-admin-guide.md). If you have previously installed the scanner and now need to upgrade it to a later version, see [Upgrading the Azure Information Protection scanner](./rms-client/client-admin-guide.md#upgrading-the-azure-information-protection-scanner).|
|Configured labels that apply automatic classification, and optionally, protection|For more information about how to configure the conditions in the Azure Information Protection policy, see [How to configure conditions for automatic and recommended classification for Azure Information Protection](configure-policy-classification.md).<br /><br />For more information about how to configure labels to apply protection to files, see [How to configure a label for Rights Management protection](configure-policy-protection.md).<br /><br />These labels can be in the global policy, or one or more [scoped policies](configure-policy-scope.md).<br /><br />Note: Although you can run the scanner even if you haven't configured labels that apply automatic classification, this scenario is not covered with these instructions. [More information](#using-the-scanner-with-alternative-configurations)|
|For Office documents to be scanned:<br /><br />- 97-2003 file formats and Office Open XML formats for Word, Excel, and PowerPoint|For more information about the file types that the scanner supports for these file formats, see [File types supported by the Azure Information Protection client](./rms-client/client-admin-guide-file-types.md). 

If you can't meet all the requirements in the table because they are prohibited by your organization policies, see the next section for alternatives.

If all the requirements are met, go straight to the [installation section](#install-the-azure-information-protection-scanner).

### Deploying the scanner with alternative configurations

The prerequisites listed in the table are the default requirements for the scanner and recommended because they are the simplest configuration for the scanner deployment. They should be suitable for initial testing, so that you can check the capabilities of the scanner. However, in a product environment, your organization policies might prohibit these default requirements because of one or more of the following restrictions:

- Servers are not allowed Internet connectivity

- You cannot be granted Sysadmin or databases must be created and configured manually

- Service accounts cannot be granted the **Log on locally** right

- Service accounts cannot be synchronized to Azure Active Directory but servers have Internet connectivity

The scanner can accommodate these restrictions but they require additional configuration.


#### Restriction: The scanner server cannot have Internet connectivity

Follow the instructions for a [disconnected computer](./rms-client/client-admin-guide-customizations.md#support-for-disconnected-computers). 

Note that in this configuration, the scanner cannot apply protection (or remove protection) by using your organization's cloud-based key. Instead, the scanner is limited to using labels that apply classification only, or protection that uses [HYOK](configure-adrms-restrictions.md). 

#### Restriction: You cannot be granted Sysadmin or databases must be created and configured manually

If you can be granted the Sysadmin role temporarily to install the scanner, you can remove this role when the scanner installation is complete. When you use this configuration, the database is automatically created for you and the service account for the scanner is automatically granted the required permissions. However, the user account that configures the scanner requires the db_owner role for the AzInfoProtectionScanner database, and you must manually grant this role to the user account.

If you cannot be granted the Sysadmin role even temporarily, you must manually create a database named AzInfoProtectionScanner before you install the scanner. When you use this configuration, assign the following roles:
    
|Account|Database-level role|
|--------------------------------|---------------------|
|Service account for the scanner|db_owner|
|User account for scanner installation|db_owner|
|User account for scanner configuration |db_owner|

Typically, you will use the same user account to install and configure the scanner. But if you use different accounts, they both require the db_owner role for the AzInfoProtectionScanner database.

#### Restriction: The service account for the scanner cannot be granted the **Log on locally** right

If your organization policies prohibit the **Log on locally** right for service accounts but allow the **Log on as a batch job** right, follow the instructions for  [Specify and use the Token parameter for Set-AIPAuthentication](./rms-client/client-admin-guide-powershell.md#specify-and-use-the-token-parameter-for-set-aipauthentication) from the admin guide.

#### Restriction: The scanner service account cannot be synchronized to Azure Active Directory but the server has Internet connectivity

You can have one account to run the scanner service and use another account to authenticate to Azure Active Directory:

- For the scanner service account, you can use a local Windows account or an Active Directory account.

- For the Azure Active Directory account, follow the instructions for [Specify and use the Token parameter for Set-AIPAuthentication](./rms-client/client-admin-guide-powershell.md#specify-and-use-the-token-parameter-for-set-aipauthentication) from the admin guide.


## Install the scanner

1. Sign in to the Windows Server computer that will run the scanner. Use an account that has local administrator rights and that has permissions to write to the SQL Server master database.

2. Open a Windows PowerShell session with the **Run as an administrator** option.

3. Run the [Install-AIPScanner](/powershell/module/azureinformationprotection/Install-AIPScanner) cmdlet, specifying your SQL Server instance on which to create a database for the Azure Information Protection scanner: 
    
    ```
    Install-AIPScanner -SqlServerInstance <database name>
    ```
    
    Examples:
    
    For a default instance: `Install-AIPScanner -SqlServerInstance SQLSERVER1`
    
    For a named instance: `Install-AIPScanner -SqlServerInstance SQLSERVER1\AIPSCANNER`
    
    For SQL Server Express: `Install-AIPScanner -SqlServerInstance SQLSERVER1\SQLEXPRESS`
    
    Use the online help for this cmdlet if you need more [detailed examples](/powershell/module/azureinformationprotection/install-aipscanner#examples).
    
    When you are prompted, provide the credentials for the scanner service account (\<domain\user name>) and password.

4. Verify that the service is now installed by using **Administrative Tools** > **Services**. 
    
    The installed service is named **Azure Information Protection Scanner** and is configured to run by using the scanner service account that you created.

Now that you have installed the scanner, you need to get an Azure AD token for the scanner service account to authenticate so that it can run unattended. 

## Get an Azure AD token for the scanner

The Azure AD token lets the scanner service account authenticate to the Azure Information Protection service.

1. From the same Windows Server computer, or from your desktop, sign in to the Azure portal to create two Azure AD applications that are needed to specify an access token for authentication. After an initial interactive sign-in, this token lets the scanner run non-interactively.
    
    To create these applications, follow the instructions in [How to label files non-interactively for Azure Information Protection](./rms-client/client-admin-guide-powershell.md#how-to-label-files-non-interactively-for-azure-information-protection) from the admin guide.

2. From the Windows Server computer, if your scanner service account has been granted the **Log on locally** right for the installation: Sign in with this account and start a PowerShell session. Run [Set-AIPAuthentication](/powershell/module/azureinformationprotection/set-aipauthentication), specifying the values that you copied from the previous step:
    
    ```
    Set-AIPAuthentication -webAppId <ID of the "Web app / API" application> -webAppKey <key value generated in the "Web app / API" application> -nativeAppId <ID of the "Native" application>
    ```
    
    When prompted, specify the password for your service account credentials for Azure AD, and then click **Accept**.
    
    If your scanner service account cannot be granted the **Log on locally** right for the installation: Follow the instructions in the [Specify and use the Token parameter for Set-AIPAuthentication](./rms-client/client-admin-guide-powershell.md#specify-and-use-the-token-parameter-for-set-aipauthentication) section from the admin guide. 

The scanner now has a token to authenticate to Azure AD, which is valid for one year, two years, or never expires, according to your configuration of the **Web app /API** in Azure AD. When the token expires, you must repeat steps 1 and 2.

You're now ready to specify the data stores to scan. 

## Specify data stores for the scanner

Use the [Add-AIPScannerRepository](/powershell/module/azureinformationprotection/Add-AIPScannerRepository) cmdlet to specify the data stores to be scanned by the Azure Information Protection scanner. You can specify local folders, UNC paths, and SharePoint Server URLs for SharePoint sites and libraries. 

Supported versions for SharePoint: SharePoint Server 2016 and SharePoint Server 2013. SharePoint Server 2010 is also supported for customers who have [extended support for this version of SharePoint](https://support.microsoft.com/lifecycle/search?alpha=SharePoint%20Server%202010).

1. From the same Windows Server computer, in your PowerShell session, add your first data store by running the following command:
    
    	Add-AIPScannerRepository -Path <path>
    
    For example: `Add-AIPScannerRepository -Path \\NAS\Documents`
    
    For other examples, see the [online help](/powershell/module/azureinformationprotection/Add-AIPScannerRepository#examples) for this cmdlet.

2. Repeat this command for all the data stores that you want to scan. If you need to remove a data store that you added, use the [Remove-AIPScannerRepository](/powershell/module/azureinformationprotection/Remove-AIPScannerRepository) cmdlet.

3. Confirm that you have specified all the data stores correctly, by running the [Get-AIPScannerRepository](/powershell/module/azureinformationprotection/Get-AIPScannerRepository) cmdlet:
    
    	Get-AIPScannerRepository

With the scanner's default configuration, you're now ready to run your first scan in discovery mode.

## Run a discovery cycle and view reports for the scanner

1. In your PowerShell session, restart the **Azure Information Protection Scanner** service by running the following command:
    
        Start-AIPScan

2. Wait for the scanner to complete its cycle. When the scanner has crawled through all the files in the data stores that you specified, the scanner stops although the scanner service remains running. You can use the local Windows **Applications and Services** event log, **Azure Information Protection**, to confirm when the scanner stops. Look for the informational event ID **911**.

3. Review the reports that are stored in %*localappdata*%\Microsoft\MSIP\Scanner\Reports and that have a .csv file format. With the default configuration of the scanner, only files that meet the conditions for automatic classification are included in these reports.
    
    > [!TIP]
    > Currently in preview, the information from these reports are now sent to Azure Information Protection so that you can view them from the Azure portal. For more information, see [Reporting for Azure Information Protection](reports-aip.md). 
        
    If the results are not as you expect, you might need to fine-tune the conditions that you specified in your Azure Information Protection policy. If that's the case, repeat steps 1 through 3 until you are ready to change the configuration to apply the classification and optionally, protection. 

When you're ready to automatically label the files that the scanner discovers, continue to the next procedure. 

## Configure the scanner to apply classification and protection

In its default setting, the scanner runs one time and in the reporting-only mode. To change these settings, run the [Set-AIPScannerConfiguration](/powershell/module/azureinformationprotection/Set-AIPScannerConfiguration) cmdlet.

1. On the Windows Server computer, in the PowerShell session, run the following command:
    
    	Set-AIPScannerConfiguration -Enforce On -Schedule Always
    
    There are other configuration settings that you might want to change. For example, whether file attributes are changed and what is logged in the reports. In addition, if your Azure Information Protection policy includes the setting that requires a justification message to lower the classification level or remove protection, specify that message by using this cmdlet. Use the [online help](/powershell/module/azureinformationprotection/Set-AIPScannerConfiguration#parameters) for more information about each configuration setting. 

2. Restart the **Azure Information Protection Scanner** service by running the following command:
    
        Start-AIPScan

3. As before, monitor the event log and the reports to see which files were labeled, what classification was applied, and whether protection was applied.

Because we configured the schedule to run continuously, when the scanner has worked its way through all the files, it starts a new cycle so that new and changed files are discovered.


## How files are scanned

The scanner automatically skips files that are [excluded from classification and protection](./rms-client/client-admin-guide-file-types.md#file-types-that-are-excluded-from-classification-and-protection), such as executables and system files.

You can change this behavior by defining a list of file types to scan, or exclude from scanning. When you specify this list and do not specify a data repository, the list applies to all data repositories that do not have their own list specified. To specify this list, use [Set-AIPScannerScannedFileTypes](/powershell/module/azureinformationprotection/Set-AIPScannerScannedFileTypes). After you have specified your file types list, you can add a new file type to the list by using [Add-AIPScannerScannedFileTypes](/powershell/module/azureinformationprotection/Add-AIPScannerScannedFileTypes), and remove a file type from the list by using [Remove-AIPScannerScannedFileTypes](/powershell/module/azureinformationprotection/Remove-AIPScannerScannedFileTypes).

Then the scanner uses Windows iFilter to scan the following file types. For these file types, the document will be labeled by using the conditions that you specified for your labels.

|Application type|File type|
|--------------------------------|-------------------------------------|
|Word|.docx; .docm; .dotm; .dotx|
|Excel|.xls; .xlt; .xlsx; .xltx; .xltm; .xlsm; .xlsb|
|PowerPoint|.ppt; .pps; .pot; .pptx; .ppsx; .pptm; .ppsm; .potx; .potm|
|PDF |.pdf|
|Text|.txt; .xml; .csv|

By default, only Office file types are protected by the scanner, so PDF and text files are not protected unless you [edit the registry](#editing-the-registry-for-the-scanner) to specify the file types:

- If you do not add the file type of .pdf to the registry: Files that have this file name extension will be labeled but if the label is configured for protection, the protection is not applied.

- If you do not add the file types of .txt, .xml, or .csv to the registry: Files that have these file name extensions will not be labeled because these file types do not support classification-only.

Finally, for the remaining file types, the scanner applies the default label in the Azure Information Protection policy, or the default label that you configure for the scanner.

|Application type|File type|
|--------------------------------|-------------------------------------|
|Project|.mpp; .mpt|
|Publisher|.pub|
|Visio|.vsd; .vdw; .vst; .vss; .vsdx; .vsdm; .vssx; .vssm; .vstx; .vstm|
|XPS|.xps; .oxps; .dwfx|
|Solidworks|.sldprt; .slddrw; .sldasm|
|Jpeg |.jpg; .jpeg; .jpe; .jif; .jfif; .jfi|
|Png |.png|
|Gif|.gif|
|Bitmap|.bmp; .giff|
|Tiff|.tif; .tiff|
|Photoshop|.psdv|
|DigitalNegative|.dng|
|Pfile|.pfile|

When the scanner applies a label with protection, by default, only Office file types are protected. You can change this behavior so that additional file types are protected. However, when a label applies generic protection to documents, the file name extension changes to .pfile. Other file types can change their file name extension as well. In addition, these files become read-only until they are opened by an authorized user and saved in their native format.

### Editing the registry for the scanner

To change the default scanner behavior for protecting file types other than Office files, you must manually edit the registry and specify the additional file types that you want to be protected. For instructions, see [File API configuration](develop/file-api-configuration.md) from the developer guidance. In this documentation for developers, generic protection is referred to as "PFile". In addition, specific for the scanner:

- The scanner has its own default behavior: Only Office file formats are protected by default. If the registry is not modified, any other file types will not be protected by the scanner.

- If you want the same default protection behavior of the Azure Information Protection client, where all files are automatically protected with native or generic protection: Specify the `*` wildcard as a registry key, and `Default` as the value data.

When you edit the registry, manually create the **MSIPC** key and **FileProtection** key if they do not exist, as well as a key for each file name extension.

For example, for the scanner to protect PDF files, the registry after you have edited it will look like the following picture:

![Editing the registry for the scanner to apply protection](./media/editregistry-scanner.png)

## When files are rescanned

For the first scan cycle, the scanner inspects all files in the configured data stores and then for subsequent scans, only new or modified files are inspected. 

You can force the scanner to inspect all files again by running [Start-AIPScan](/powershell/module/azureinformationprotection/Start-AIPScan) with the `-Reset` parameter. The scanner must be configured for a manual schedule, which requires the `-Schedule` parameter to be set to **Manual** with [Set-AIPScannerConfiguration](/powershell/module/azureinformationprotection/Set-AIPScannerConfiguration).

Inspecting all files again is useful when you want the reports to include all files and this configuration choice is typically used when the scanner runs in discovery mode. When a full scan is complete, the scan type automatically changes to incremental so that for subsequent scans, only new or modified files are scanned.

In addition, all files are inspected when the scanner downloads an Azure Information Protection policy that has new or changed conditions. The scanner refreshes the policy every hour, and when the service starts and the policy is older than one hour.  

> [!TIP]
> If you need to refresh the policy sooner than this one hour interval, for example, during a testing period: Manually delete the policy file, **Policy.msip** from both **%LocalAppData%\Microsoft\MSIP\Policy.msip** and **%LocalAppData%\Microsoft\MSIP\Scanner**. Then restart the Azure Information Scanner service.
> 
> If you changed protection settings in the policy, also wait 15 minutes from when you saved the protection settings before you restart the service.

If the scanner downloaded a policy that had no automatic conditions configured, the copy of the policy file in the scanner folder does not update. In this scenario, you must delete the policy file, **Policy.msip** from both **%LocalAppData%\Microsoft\MSIP\Policy.msip** and **%LocalAppData%\Microsoft\MSIP\Scanner** before the scanner can use a newly downloaded policy file that has labels correctly figured for automatic conditions.

## Using the scanner with alternative configurations

There are two alternative scenarios that the Azure Information Protection scanner supports where labels do not need to be configured for any conditions: 

- Apply a default label to all files in a data repository.
    
    For this configuration, use the [Set-AIPScannerRepository](/powershell/module/azureinformationprotection/Set-AIPScannerRepository) cmdlet, and set the *MatchPolicy* parameter to **Off**. 
    
    The contents of the files are not inspected and all files in the data repository are labeled according to the default label that you specify for the data repository (with the *SetDefaultLabel* parameter) or if this is not specify, the default label that is specified as a policy setting for the scanner account.
    

- Identify all custom conditions and known sensitive information types.
    
    For this configuration, use the [Set-AIPScannerConfiguration](/powershell/module/azureinformationprotection/Set-AIPScannerConfiguration) cmdlet, and set the *DiscoverInformationTypes* parameter to **All**.
    
    The scanner uses any custom conditions that you have specified for labels in the Azure Information Protection policy, and the list of information types that are available to specify for labels in the Azure Information Protection policy. 

## Optimizing the performance of the scanner

To maximize the scanner performance:

- **Have a high speed and reliable network connection between the scanner computer and the scanned data store**
    
    For example, place the scanner computer in the same LAN, or (preferred) in the same network segment as the scanned data store.
    
    The quality of the network connection affects the scanner performance because to inspect the files, the scanner transfers the contents of the files to the computer running the scanner service. When you reduce (or eliminate) the number of network hops this data has to travel, you also reduce the load on your network. 

- **Make sure the scanner computer has available processor resources**
    
    Inspecting the file contents for a match against your configured conditions, and encrypting and decrypting files are processor-intensive actions. Monitor typical scanning cycles for your specified data stores to identify whether a lack of processor resources is negatively affecting the scanner performance.
    
- **Do not scan local folders on the computer running the scanner service**
    
    If you have folders to scan on a Windows server, install the scanner on a different computer and configure those folders as network shares to scan. Separating the two functions of hosting files and scanning files means that the computing resources for these services are not competing with one another.

If necessary, install multiple instances of the scanner. Each scanner instance requires its own configuration database in a different SQL Server instance.

Other factors that affect the scanner performance:

- The current load and response times of the data stores that contain the files to scan

- Whether the scanner runs in discovery mode or enforce mode
    
    Discovery mode typically has a higher scanning rate than enforce mode because discovery requires a single file read action, whereas enforce mode requires read and write actions.

- You change the conditions in the Azure Information Protection
    
    Your first scan cycle when the scanner must inspect every file will obviously take longer than subsequent scan cycles that by default, inspect only new and changed files. However, if you change the conditions in the Azure Information Protection policy, all files are scanned again, as described in the [preceding section](#when-files-are-rescanned-by-the-azure-information-protection-scanner).

- Your chosen logging level
    
    You can choose between **Debug**, **Info**, **Error** and **Off** for the scanner reports. **Off** results in the best performance; **Debug** considerably slows down the scanner and should be used only for troubleshooting. For more information, see the *ReportLevel* parameter for the [Set-AIPScannerConfiguration](/powershell/module/azureinformationprotection/Set-AIPScannerConfiguration) cmdlet.

- The files themselves:
    
    - Office files are more quickly scanned than PDF files.
    
    - Unprotected files are quicker to scan than protected files.
    
    - Large files obviously take longer to scan than small files.

- Additionally:
    
    - Confirm that the service account that runs the scanner has only the rights documented in the [scanner prerequisites](#prerequisites-for-the-azure-information-protection-scanner) section, and then configure the [advanced client property](./rms-client/client-admin-guide-customizations.md#disable-the-low-integrity-level-for-the-scanner) to disable the low integrity level for the scanner.
    
    - The scanner runs more quickly when you use the [alternative configuration](#using-the-scanner-with-alternative-configurations) to apply a default label to all files because the scanner does not inspect the file contents.
    
    - The scanner runs more slowing when you use the [alternative configuration](#using-the-scanner-with-alternative-configurations) to identify all custom conditions and known sensitive information types.
    

## List of cmdlets for the scanner 

Other cmdlets for the scanner let you change the service account and database for the scanner, get the current settings for the scanner, and uninstall the scanner service. The scanner uses the following cmdlets:

- [Add-AIPScannerScannedFileTypes](/powershell/module/azureinformationprotection/Add-AIPScannerScannedFileTypes)

- [Add-AIPScannerRepository](/powershell/module/azureinformationprotection/Add-AIPScannerRepository)

- [Get-AIPScannerConfiguration](/powershell/module/azureinformationprotection/Get-AIPScannerConfiguration)

- [Get-AIPScannerRepository](/powershell/module/azureinformationprotection/Get-AIPScannerRepository)

- [Get-AIPScannerStatus](/powershell/module/azureinformationprotection/Get-AIPScannerStatus)

- [Install-AIPScanner](/powershell/module/azureinformationprotection/Install-AIPScanner)

- [Remove-AIPScannerRepository](/powershell/module/azureinformationprotection/Remove-AIPScannerRepository)

- [Remove-AIPScannerScannedFileTypes](/powershell/module/azureinformationprotection/Remove-AIPScannerScannedFileTypes)

- [Set-AIPScanner](/powershell/module/azureinformationprotection/Set-AIPScanner)

- [Set-AIPScannerConfiguration](/powershell/module/azureinformationprotection/Set-AIPScannerConfiguration)

- [Set-AIPScannerScannedFileTypes](/powershell/module/azureinformationprotection/Set-AIPScannerScannedFileTypes)

- [Set-AIPScannerRepository](/powershell/module/azureinformationprotection/Set-AIPScannerRepository)

- [Start-AIPScan](/powershell/module/azureinformationprotection/Start-AIPScan)

- [Uninstall-AIPScanner](/powershell/module/azureinformationprotection/Uninstall-AIPScanner)

- [Update-AIPScanner](/powershell/module/azureinformationprotection/Update-AIPScanner)


## Event log IDs and descriptions for the scanner

Use the following sections to identify the possible event IDs and descriptions for the scanner. These events are logged on the server that runs the scanner service, in the Windows **Applications and Services** event log, **Azure Information Protection**.

-----

Information **910**

**Scanner cycle started.**

This event is logged when the scanner service is started and begins to scan for files in the data repositories that you specified.

----

Information **911**

**Scanner cycle finished.**

This event is logged when the scanner has finished its one-time scan since the server started, or the scanner has finished a cycle for a continuous schedule.

If the scanner was configured to run one time rather than continuously, to scan the files again, you must set the schedule to **OneTime** or **Continuous**, and then manually restart the service. To change the schedule, use the [Set-AIPScannerConfiguration](/powershell/module/azureinformationprotection/Set-AIPScannerConfiguration) cmdlet and the **Schedule** parameter.

----

## Next steps

You might be wondering: [What’s the difference between Windows Server FCI and the Azure Information Protection scanner?](faqs.md#whats-the-difference-between-windows-server-fci-and-the-azure-information-protection-scanner)

You can also use PowerShell to interactively classify and protect files from your desktop computer. For more information about this and other scenarios that use PowerShell, see [Using PowerShell with the Azure Information Protection client](./rms-client/client-admin-guide-powershell.md).


