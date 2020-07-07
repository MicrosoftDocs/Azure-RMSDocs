---
# required metadata

title: Install and configure the Azure Information Protection (AIP) unified labeling scanner
description: Instructions for installing and configuring the Azure Information Protection unified labeling scanner to discover, classify, and protect files on data stores.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 06/29/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: scanner
ms.reviewer: demizets
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Configuring and installing the  Azure Information Protection unified labeling scanner

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows Server 2019, Windows Server 2016, Windows Server 2012 R2*

>[!NOTE] 
> If you're working with the AIP classic scanner, see [Installing and configuring the Azure Information Protection classic scanner](deploy-aip-scanner-configure-install-classic.md).

Before you start configuring and installing the Azure Information Protection scanner, verify that your system complies with the [required prerequisites](deploy-aip-scanner-prereqs.md).

When you're ready, continue with the following steps:

1. [Configure the scanner in the Azure portal](#configure-the-scanner-in-the-azure-portal)

1. [Install the scanner](#install-the-scanner)

1. [Get an Azure AD token for the scanner](#get-an-azure-ad-token-for-the-scanner)

1. [Configure the scanner to apply classification and protection](#configure-the-scanner-to-apply-classification-and-protection)
 
Perform the following additional configuration procedures as needed for your system:

|Procedure  |Description  |
|---------|---------|
|[Change which file types to protect](#change-which-file-types-to-protect) |You may want to scan, classify, or protect different file types than the default. For more information, see [AIP scanning process](deploy-aip-scanner.md#aip-scanning-process). |
|[Upgrading your scanner](#upgrading-your-scanner) | Upgrade your scanner to leverage the latest features and improvements.|
|[Editing data repository settings in bulk](#editing-data-repository-settings-in-bulk)| Use import and export options to make changes in bulk for multiple data repositories.|
|[Use the scanner with alternative configurations](#using-the-scanner-with-alternative-configurations)| Use the scanner without configuring labels with any conditions |
|[Optimize performance](#optimizing-scanner-performance)| Guidance to optimize your scanner performance|
| | |

For more information, see also [List of cmdlets for the scanner](#list-of-cmdlets-for-the-scanner).

## Configure the scanner in the Azure portal

Before you install the scanner, or upgrade it from an older general availability version of the scanner, create a cluster and content scan job for the scanner in the Azure portal. 

Then, configure the cluster and content scan job with scanner settings and the data repositories to scan.

To configure your scanner: 

1. [Sign in to the Azure portal](configure-policy.md#signing-in-to-the-azure-portal), and navigate to the **Azure Information Protection** pane. 
    
    For example, in the search box for resources, services, and docs: Start typing **Information** and select **Azure Information Protection**.
    
1. Locate the **Scanner** menu options, and select **Clusters**.

1. On the **Azure Information Protection - Clusters** pane, select **Add**:
    
    :::image type="content" source="media/scanner-add-profile.png" alt-text="Add content scan job for the Azure Information Protection scanner":::

1. On the **Add a new cluster** pane:

    1. Specify a meaningful name for the scanner. This name is used to identify the scanner's configuration settings and the data repositories to scan. 

        For example, you might specify **Europe** to identify the geographical location of the data repositories that your scanner will cover. When you later install or upgrade the scanner, you will need to specify the same cluster name.
   
    2. Optionally, specify a description for administrative purposes, to help you identify the scanner's cluster name.

    3. Select **Save**.
1. Locate the **Scanner** menu options, and select **Content scan jobs**.
1. On the **Azure Information Protection - Content scan jobs** pane, select **Add**.
 
1. For this initial configuration, configure the following settings, and then select **Save** but do not close the pane:
    
    |Section  |Settings  |
    |---------|---------|
    |**Content scan job settings**     |    - **Schedule**: Keep the default of **Manual** </br>- **Info types to be discovered**: Change to **Policy only** </br>- **Configure repositories**: Do not configure at this time because the content scan job must first be saved.         |
    |**Policy enforcement**     | - **Enforce**: Select **Off** </br>- **Label files based on content**: Keep the default of **On** </br>- **Default label**: Keep the default of **Policy default** </br>- **Relabel files**: Keep the default of **Off**        |
    |**Configure file settings**     | - **Preserve "Date modified", "Last modified" and "Modified by"**: Keep the default of **On** </br>- **File types to scan**: Keep the default file types for **Exclude** </br>- **Default owner**: Keep the default of **Scanner Account**        |
    | | |


1. Now that the content scan job is created and saved, you're ready to return to the **Configure repositories** option to specify the data stores to be scanned. 

    Specify UNC paths, and SharePoint Server URLs for SharePoint on-premises document libraries and folders. 
    
    > [!NOTE]
    > SharePoint Server 2019, SharePoint Server 2016, and SharePoint Server 2013 are supported for SharePoint. SharePoint Server 2010 is also supported when you have [extended support for this version of SharePoint](https://support.microsoft.com/lifecycle/search?alpha=SharePoint%20Server%202010).
    >     
    To add your first data store, while on the **Add a new content scan job** pane, select **Configure repositories** to open the **Repositories** pane:
    
    :::image type="content" source="media/scanner-repositories-bar.png" alt-text="Configure data repositories for the Azure Information Protection scanner":::

1. On the **Repositories** pane, select **Add**:
    
    :::image type="content" source="media/scanner-repository-add.png" alt-text="Add data repository for the Azure Information Protection scanner":::

1. On the **Repository** pane, specify the path for the data repository, and then select **Save**.

    For example: 

    - For a network share, use `\\Server\Folder`. 
    - For a SharePoint library, use `http://sharepoint.contoso.com/Shared%20Documents/Folder`.

    > [!NOTE]
    > Wildcards are not supported and WebDav locations are not supported.
    >     

    Use the following syntax when adding SharePoint paths:
    
    |Path  |Syntax  |
    |---------|---------|
    |**Root path**     | `http://<SharePoint server name>` </br></br>Scans all sites, including any site collections allowed for the scanner user. </br>Requires [additional permissions](quickstart-findsensitiveinfo.md#permission-users-to-scan-sharepoint-repositories) to automatically discover root content        |
    |**Specific SharePoint subsite or collection**     | One of the following: </br>- `http://<SharePoint server name>/<subsite name>` </br>- `http://SharePoint server name>/<site collection name>/<site name>` </br></br>Requires [additional permissions](quickstart-findsensitiveinfo.md#permission-users-to-scan-sharepoint-repositories) to automatically discover site collection content         |
    |**Specific SharePoint library**     | One of the following: </br>- `http://<SharePoint server name>/<library name>` </br>- `http://SharePoint server name>/.../<library name>`       |
    |**Specific SharePoint folder**     | `http://<SharePoint server name>/.../<folder name>`        |
    | | |

    For the remaining settings on this pane, do not change them for this initial configuration, but keep them as **Content scan job default**. The default setting means that the data repository inherits the settings from the content scan job.

    <!--
        > [!IMPORTANT]
        > While the local file system can be scanned, this configuration is not recommended for production deployments and can **only** be used in single node clusters.
        >
        > Scanning of local folders by multi-node clusters is not supported. If you need to scan a folder on the local file system, we recommend creating a share, and scanning it using a network URL.
    -->

1. If you want to add another data repository, repeat steps 8 and 9. 

1. Close the **Repositories** pane and the **content scan job** pane. 

Back on the **Azure Information Protection - Content scan job** pane, your content scan name is displayed, together with the **SCHEDULE** column showing **Manual** and the **ENFORCE** column is blank.

You're now ready to install the scanner with the content scanner job that you've created. Continue with [Install the scanner](#install-the-scanner).

## Install the scanner

After you've [configured the Azure Information Protection scanner in the Azure portal](#configure-the-scanner-in-the-azure-portal), perform the steps below to install the scanner:

1. Sign in to the Windows Server computer that will run the scanner. Use an account that has local administrator rights and that has permissions to write to the SQL Server master database.

    > [!IMPORTANT]
    > For more information, see [Prerequisites for installing and deploying the Azure Information Protection scanner](deploy-aip-scanner-prereqs.md).
    >
 
1. Open a Windows PowerShell session with the **Run as an administrator** option.

1. Run the [Install-AIPScanner](/powershell/module/azureinformationprotection/Install-AIPScanner) cmdlet, specifying your SQL Server instance on which to create a database for the Azure Information Protection scanner, and the scanner cluster name that you specified in the preceding section: 
    
    ```
    Install-AIPScanner -SqlServerInstance <name> -Profile <cluster name>
    ```
    
    Examples, using the profile name of **Europe**:
    
    - For a default instance: `Install-AIPScanner -SqlServerInstance SQLSERVER1 -Profile Europe`
    
    - For a named instance: `Install-AIPScanner -SqlServerInstance SQLSERVER1\AIPSCANNER -Profile Europe`
    
    - For SQL Server Express: `Install-AIPScanner -SqlServerInstance SQLSERVER1\SQLEXPRESS -Profile Europe`
    
    When you are prompted, provide the credentials for the scanner service account (\<domain\user name>) and password.

1. Verify that the service is now installed by using **Administrative Tools** > **Services**. 
    
    The installed service is named **Azure Information Protection Scanner** and is configured to run by using the scanner service account that you created.

Now that you have installed the scanner, you need to [get an Azure AD token for the scanner](#get-an-azure-ad-token-for-the-scanner) service account to authenticate, so that the scanner can run unattended. 

## Get an Azure AD token for the scanner

An Azure AD token allows the scanner to authenticate to the Azure Information Protection service.

To get an Azure AD token:

1. Return to the Azure portal to create an Azure AD application to specify an access token for authentication. This token lets the scanner run non-interactively. For more information, see [How to label files non-interactively for Azure Information Protection](./rms-client/clientv2-admin-guide-powershell.md#how-to-label-files-non-interactively-for-azure-information-protection).

2. From the Windows Server computer, if your scanner service account has been granted the **Log on locally** right for the installation, sign in with this account and start a PowerShell session. 

    Run [Set-AIPAuthentication](/powershell/module/azureinformationprotection/set-aipauthentication), specifying the values that you copied from the previous step:
    
    ```ps
    Set-AIPAuthentication -AppId <ID of the registered app> -AppSecret <client secret sting> -TenantId <your tenant ID> -DelegatedUser <Azure AD account>
    ```
        
    For example:

    ```ps
    $pscreds = Get-Credential CONTOSO\scanner
    Set-AIPAuthentication -AppId "77c3c1c3-abf9-404e-8b2b-4652836c8c66" -AppSecret "OAkk+rnuYc/u+]ah2kNxVbtrDGbS47L4" -DelegatedUser scanner@contoso.com -TenantId "9c11c87a-ac8b-46a3-8d5c-f4d0b72ee29a" -OnBehalfOf $pscreds
    Acquired application access token on behalf of CONTOSO\scanner.
    ```

> [!TIP]
> If your scanner service account cannot be granted the **Log on locally** right for the installation, use the *OnBehalfOf* parameter with [Set-AIPAuthentication](https://docs.microsoft.com/powershell/module/azureinformationprotection/set-aipauthentication), as described in [How to label files non-interactively for Azure Information Protection](./rms-client//clientv2-admin-guide-powershell.md#how-to-label-files-non-interactively-for-azure-information-protection).

The scanner now has a token to authenticate to Azure AD, which is valid for one year, two years, or never, according to your configuration of the **Web app /API** client secret in Azure AD. 

When the token expires, you must repeat this procedure.

You're now ready to run your first scan in discovery mode. For more information, see [Run a discovery cycle and view reports for the scanner](deploy-aip-scanner-manage.md#run-a-discovery-cycle-and-view-reports-for-the-scanner).

If you've already run a discovery scan, continue with [Configure the scanner to apply classification and protection](#configure-the-scanner-to-apply-classification-and-protection).

## Configure the scanner to apply classification and protection

The default settings configure the scanner to run once, and in reporting-only mode.

To change these settings, edit the content scan job:

1. In the Azure portal, on the **Azure Information Protection - Content scan jobs** pane, select the cluster and content scan job to edit it.

2. On the Content scan job pane, change the following, and then select **Save**:
    
   - From the **Content scan job** section: Change the **Schedule** to **Always**
   - From the **Policy enforcement** section: Change **Enforce** to **On**
    
    > [!TIP]
    > You may want to change other settings on this pane, such as whether file attributes are changed and whether the scanner can relabel files. Use the information popup help to learn more information about each configuration setting.

3. Make a note of the current time and start the scanner again from the **Azure Information Protection - Content scan jobs** pane:

    :::image type="content" source="media/scanner-scan-now.png" alt-text="Initiate scan for the Azure Information Protection scanner":::
    
    Alternatively, run the following command in your PowerShell session:
    
    ```ps
    Start-AIPScan
    ```

The scanner is now scheduled to run continuously. When the scanner works its way through all configured files, it automatically starts a new cycle so that any new and changed files are discovered.

## Change which file types to protect

By default the AIP scanner protects Office file types and PDF files only.

Use PowerShell commands to change this behavior as needed, such as to configure the scanner to protect all file types, just as the client does, or to protect additional, specific file types. 

For a label policy that applies to the user account downloading labels for the scanner, specify a PowerShell advanced setting named **PFileSupportedExtensions**. 

For a scanner that has access to the internet, this user account is the account that you specify for the *DelegatedUser* parameter with the Set-AIPAuthentication command.

**Example 1:**  PowerShell command for the scanner to protect all file types, where your label policy is named "Scanner":

```ps
Set-LabelPolicy -Identity Scanner -AdvancedSettings @{PFileSupportedExtensions="*"}
```

**Example 2:** PowerShell command for the scanner to protect .xml files and .tiff files in addition to Office files and PDF files, where your label policy is named "Scanner":

```ps
Set-LabelPolicy -Identity Scanner -AdvancedSettings @{PFileSupportedExtensions=ConvertTo-Json(".xml", ".tiff")}
```

For more information, see [Change which file types to protect](./rms-client/clientv2-admin-guide-customizations.md#change-which-file-types-to-protect).

## Upgrading your scanner
 
If you have previously installed the scanner and want to upgrade, use the instructions described in [Upgrading the Azure Information Protection scanner](./rms-client/client-admin-guide.md#upgrading-the-azure-information-protection-scanner).

Then, [configure](deploy-aip-scanner-configure-install.md) and [use your scanner](deploy-aip-scanner-manage.md) as usual, skipping the steps to install your scanner.

## Editing data repository settings in bulk

Use the **Export** and **Import** buttons to make changes for your scanner across several repositories. 

This way, you don't need to make the same changes several times, manually, in the Azure portal.

For example, if you have a new file type on several SharePoint data repositories, you may want to update the settings for those repositories in bulk.

To make changes in bulk across repositories:

1. In the Azure portal on the **Repositories** pane, select the **Export** option. For example:

    :::image type="content" source="media/export-scanner-repositories.png" alt-text="Exporting data repository settings for the Azure Information Protection scanner":::

1. Manually edit the exported file to make your change. 

1. Use the **Import** option on the same page to import the updates back across your repositories.

## Using the scanner with alternative configurations

The Azure Information Protection scanner usually looks for conditions specified for your labels in order to classify and protect your content as needed.

In the following scenarios, the Azure Information Protection scanner is also able to scan your content and manage labels, without any conditions configured:

- [Apply a default label to all files in a data repository](#apply-a-default-label-to-all-files-in-a-data-repository)
- [Remove existing labels from all files in a data repository](#remove-existing-labels-from-all-files-in-a-data-repository)
- [Identify all custom conditions and known sensitive information types](#identify-all-custom-conditions-and-known-sensitive-information-types)
### Apply a default label to all files in a data repository

In this configuration, all unlabeled files in the repository are labeled with the default label specified for the repository or the content scan job. Files are labeled without inspection. 

Configure the following settings: 

|Setting  |Description  |
|---------|---------|
|**Label files based on content**    |Set to **Off**         |
|**Default label**     | Set to **Custom**, and then select the label to use       |
|**Enforce default label**     | Select to have the default label applied to all files, even if they are already labeled.        |
| | |

### Remove existing labels from all files in a data repository

In this configuration, all existing labels are removed, including protection, if protection was applied with the label. Protection applied independently of a label is retained.

Configure the following settings: 

|Setting  |Description  |
|---------|---------|
|**Label files based on content**    |Set to **Off**         |
|**Default label**     | Set to **None**  |
|**Relabel files** | Set to **On**, with the **Enforce default label** checkbox selected|
| | |

### Identify all custom conditions and known sensitive information types

This configuration enables you to find sensitive information that you might not realize you had, at the expense of scanning rates for the scanner. 

Set the **Info types to be discovered** to **All**. 

To identify conditions and information types for labeling, the scanner uses any custom sensitive information types specified, and the list of built-in sensitive information types that are available to select, as defined in your labeling management center.

## Optimizing scanner performance

> [!NOTE]
> If you are looking to improve the responsiveness of the scanner computer rather than the scanner performance, use an advanced client setting to [limit the number of threads used by the scanner](./rms-client/clientv2-admin-guide-customizations.md#limit-the-number-of-threads-used-by-the-scanner).
> 

Use the following options and guidance to help you optimize scanner performance:

|Option  |Description  |
|---------|---------|
|**Have a high speed and reliable network connection between the scanner computer and the scanned data store**     |  For example, place the scanner computer in the same LAN, or preferably, in the same network segment as the scanned data store. </br></br>The quality of the network connection affects the scanner performance because, to inspect the files, the scanner transfers the contents of the files to the computer running the scanner service. </br></br>Reducing or eliminating  the network hops required for the data to travel also reduces the load on your network.      |
|**Make sure the scanner computer has available processor resources**     | Inspecting the file contents and encrypting and decrypting files are processor-intensive actions. </br></br>Monitor the typical scanning cycles for your specified data stores to identify whether a lack of processor resources is negatively affecting the scanner performance.        |
|**Install multiple instances of the scanner** | The Azure Information Protection scanner supports multiple configuration databases on the same SQL server instance when you specify a custom cluster (profile) name for the scanner. </br></br>Multiple scanners can also share the same cluster (profile), resulting in quicker scanning times.|
|**Check your alternative configuration usage** |The scanner runs more quickly when you use the [alternative configuration](#using-the-scanner-with-alternative-configurations) to apply a default label to all files because the scanner does not inspect the file contents. <br/></br>The scanner runs more slowly when you use the [alternative configuration](#using-the-scanner-with-alternative-configurations) to identify all custom conditions and known sensitive information types.|
| | |

<!-- removed when removing local folders
|**Do not scan local folders on the computer running the scanner service**     | If you have folders to scan on a Windows server, install the scanner on a different computer and configure those folders as network shares to scan. </br></br>Separating the two functions of hosting files and scanning files means that the computing resources for these services are not competing with one another.        |
-->

### Additional factors that affect performance

Additional factors that affect the scanner performance include:

|Factor  |Description  |
|---------|---------|
|**Load/response times**     |The current load and response times of the data stores that contain the files to scan will also affect scanner performance.         |
|**Scanner mode** (Discovery / Enforce)    | Discovery mode typically has a higher scanning rate than enforce mode. </br></br>Discovery requires a single file read action, whereas enforce mode requires read and write actions.        |
|**Policy changes**     |Your scanner performance may be affected if you've made changes to the autolabeling in the label policy. </br></br>Your first scan cycle, when the scanner must inspect every file, will take longer than subsequent scan cycles that by default, inspect only new and changed files. </br></br>If you change the conditions or autolabeling settings, all files are scanned again. For more information, see [Rescanning files](deploy-aip-scanner-manage.md#rescanning-files).|
|**Regex constructions**    | Scanner performance is affected by how your regex expressions for custom conditions are constructed. </br></br> To avoid heavy memory consumption and the risk of timeouts (15 minutes per file), review your regex expressions for efficient pattern matching. </br></br>For example: </br>- Avoid [greedy quantifiers](https://docs.microsoft.com/dotnet/standard/base-types/quantifiers-in-regular-expressions) </br>- Use non-capturing groups such as `(?:expression)` instead of `(expression)`    |
|**Log level**     |  Log level options include **Debug**, **Info**, **Error** and **Off** for the scanner reports.</br></br>- **Off** results in the best performance </br>- **Debug** considerably slows down the scanner and should be used only for troubleshooting. </br></br>For more information, see the *ReportLevel* parameter for the [Set-AIPScannerConfiguration](/powershell/module/azureinformationprotection/Set-AIPScannerConfiguration) cmdlet.       |
|**Files being scanned**     |- With the exception of Excel files, Office files are more quickly scanned than PDF files. </br></br>- Unprotected files are quicker to scan than protected files. </br></br>- Large files obviously take longer to scan than small files.         |
| | |

## List of cmdlets for the scanner

This section lists PowerShell cmdlets supported for the Azure Information Protection scanner.

> [!NOTE]
> The Azure Information Protection scanner is configured from the Azure portal. Therefore, cmdlets used in previous versions to configure data repositories and the scanned file types list are now deprecated.
> 

Supported cmdlets for the scanner include:

- [Get-AIPScannerConfiguration](/powershell/module/azureinformationprotection/Get-AIPScannerConfiguration)

- [Get-AIPScannerStatus](/powershell/module/azureinformationprotection/Get-AIPScannerStatus)

- [Export-AIPLogs](/powershell/module/azureinformationprotection/Export-AIPLogs)

- [Import-AIPScannerConfiguration](/powershell/module/azureinformationprotection/Import-AIPScannerConfiguration)

- [Install-AIPScanner](/powershell/module/azureinformationprotection/Install-AIPScanner)

- [Set-AIPScanner](/powershell/module/azureinformationprotection/Set-AIPScanner)

- [Set-AIPScannerConfiguration](/powershell/module/azureinformationprotection/Set-AIPScannerConfiguration)

- [Start-AIPScanDiagnostics](/powershell/module/azureinformationprotection/Start-AIPScanDiagnostics)

- [Start-AIPScan](/powershell/module/azureinformationprotection/Start-AIPScan)

- [Stop-AIPScan](/powershell/module/azureinformationprotection/Stop-AIPScan)

- [Uninstall-AIPScanner](/powershell/module/azureinformationprotection/Uninstall-AIPScanner)

- [Update-AIPScanner](/powershell/module/azureinformationprotection/Update-AIPScanner)

## Next steps

Once you've installed and configured your scanner, start [scanning your files](deploy-aip-scanner-manage.md).

See also: [Deploying the Azure Information Protection scanner to automatically classify and protect files](deploy-aip-scanner.md).

**More information:**

- Interested in how the Core Services Engineering and Operations team in Microsoft implemented this scanner?  Read the technical case study: [Automating data protection with Azure Information Protection scanner](https://www.microsoft.com/itshowcase/Article/Content/1070/Automating-data-protection-with-Azure-Information-Protection-scanner).

- You might be wondering: [What's the difference between Windows Server FCI and the Azure Information Protection scanner?](faqs.md#whats-the-difference-between-windows-server-fci-and-the-azure-information-protection-scanner)

- Use PowerShell to interactively classify and protect files from your desktop computer. For more information about this and other scenarios that use PowerShell, see [Using PowerShell with the Azure Information Protection unified labeling client](./rms-client/clientv2-admin-guide-powershell.md).
