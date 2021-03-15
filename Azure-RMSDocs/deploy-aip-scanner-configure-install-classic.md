---
# required metadata

title: Install and configure the Azure Information Protection (AIP) scanner
description: Instructions for installing and configuring the Azure Information Protection scanner to discover, classify, and protect files on data stores.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 02/01/2021
ms.topic: how-to
ms.collection: M365-security-compliance
ms.service: information-protection
ROBOTS: NOINDEX


# optional metadata

#audience:
#ms.devlang:
ms.subservice: scanner
ms.reviewer: demizets
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Configuring and installing the Azure Information Protection classic scanner

>***Applies to**: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows Server 2019, Windows Server 2016, Windows Server 2012 R2*
>
>***Relevant for**: [Azure Information Protection classic client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients). For the unified labeling client, see [Installing and configuring the AIP unified labeling scanner](deploy-aip-scanner-configure-install.md).*

[!INCLUDE [classic-client-deprecation-extended-support](includes/classic-client-deprecation-extended-support.md)]

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

    :::image type="content" source="media/scanner-add-profile.png" alt-text="Add content scan job fo the Azure Information Protection scanner":::

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
    |**Sensitivity policy**     | - **Enforce**: Select **Off** </br>- **Label files based on content**: Keep the default of **On** </br>- **Default label**: Keep the default of **Policy default** </br>- **Relabel files**: Keep the default of **Off**        |
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

    :::image type="content" source="media/scanner-repository-add.png" alt-text="Add data respository for the Azure Information Protection scanner":::

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

    ```PowerShell
    Install-AIPScanner -SqlServerInstance <name> -Profile <cluster name>
    ```

    Examples, using the profile name of **Europe**:

    - For a default instance: `Install-AIPScanner -SqlServerInstance SQLSERVER1 -Profile Europe`

    - For a named instance: `Install-AIPScanner -SqlServerInstance SQLSERVER1\AIPSCANNER -Profile Europe`

    - For SQL Server Express: `Install-AIPScanner -SqlServerInstance SQLSERVER1\SQLEXPRESS -Profile Europe`

    When you are prompted, provide the credentials for the scanner service account (`\<domain\user name>`) and password.

1. Verify that the service is now installed by using **Administrative Tools** > **Services**.

    The installed service is named **Azure Information Protection Scanner** and is configured to run by using the scanner service account that you created.

Now that you have installed the scanner, you need to [get an Azure AD token for the scanner](#get-an-azure-ad-token-for-the-scanner) service account to authenticate, so that the scanner can run unattended.

## Get an Azure AD token for the scanner

An Azure AD token allows the scanner to authenticate to the Azure Information Protection service.

To get an Azure AD token:

1. Return to the Azure portal to create two Azure AD applications to specify an access token for authentication. This token lets the scanner run non-interactively.

    For more information, see [How to label files non-interactively for Azure Information Protection](./rms-client/client-admin-guide-powershell.md#how-to-label-files-non-interactively-for-azure-information-protection).

2. From the Windows Server computer, if your scanner service account has been granted the **Log on locally** right for the installation, sign in with this account and start a PowerShell session.

    Run [Set-AIPAuthentication](/powershell/module/azureinformationprotection/set-aipauthentication), specifying the values that you copied from the previous step:

    ```PowerShell
    Set-AIPAuthentication -webAppId <ID of the "Web app / API" application> -webAppKey <key value generated in the "Web app / API" application> -nativeAppId <ID of the "Native" application>
    ```

    When prompted, specify the password for your service account credentials for Azure AD, and then click **Accept**.

    For example:

    ```PowerShell
    Set-AIPAuthentication -WebAppId "57c3c1c3-abf9-404e-8b2b-4652836c8c66" -WebAppKey "+LBkMvddz?WrlNCK5v0e6_=meM59sSAn" -NativeAppId "8ef1c873-9869-4bb1-9c11-8313f9d7f76f").token | clip
    Acquired application access token on behalf of the user
    ```

> [!TIP]
> If your scanner service account cannot be granted the **Log on locally** right, [Specify and use the Token parameter for Set-AIPAuthentication](./rms-client/client-admin-guide-powershell.md#specify-and-use-the-token-parameter-for-set-aipauthentication).
>

The scanner now has a token to authenticate to Azure AD, which is valid for one year, two years, or never, according to your configuration of the **Web app /API** in Azure AD.

When the token expires, you must repeat steps 1 and 2.

You're now ready to run your first scan in discovery mode. For more information, see [Run a discovery cycle and view reports for the scanner](deploy-aip-scanner-manage.md#run-a-discovery-cycle-and-view-reports-for-the-scanner).

If you've already run a discovery scan, continue with [Configure the scanner to apply classification and protection](#configure-the-scanner-to-apply-classification-and-protection).

## Configure the scanner to apply classification and protection

The default settings configure the scanner to run once, and in reporting-only mode.

To change these settings, edit the content scan job:

1. In the Azure portal, on the **Azure Information Protection - Content scan jobs** pane, select the cluster and content scan job to edit it.

2. On the Content scan job pane, change the following, and then select **Save**:

   - From the **Content scan job** section: Change the **Schedule** to **Always**
   - From the **Sensitivity policy** section: Change **Enforce** to **On**

    > [!TIP]
    > You may want to change other settings on this pane, such as whether file attributes are changed and whether the scanner can relabel files. Use the information popup help to learn more information about each configuration setting.

3. Make a note of the current time and start the scanner again from the **Azure Information Protection - Content scan jobs** pane:

    ![Initiate scan for the Azure Information Protection scanner](./media/scanner-scan-now.png)

    Alternatively, run the following command in your PowerShell session:

    ```PowerShell
    Start-AIPScan
    ```

4. To view reports of files labeled, what classification was applied, and whether protection was applied, monitor the event log for the informational type **911** and the most recent time stamp.

    Check reports for details, or use the Azure portal to find this information.

The scanner is now scheduled to run continuously. When the scanner works its way through all configured files, it automatically starts a new cycle so that any new and changed files are discovered.

## Change which file types to protect

By default, the AIP scanner protects Office file types and PDF files only. To change this behavior, such as to configure the scanner to protect all file types, just as the client does, or to protect specific additional file types, edit the registry as follows:

- Specify the additional file types that you want to be protected
- Specify the type of protection you want to apply (native or generic)

In this documentation for developers, generic protection is referred to as "PFile".

To align the supported file types with the client, where all files are automatically protected with native or generic protection:

1. Specify:

    - The `*` wildcard as a registry key
    - `Encryption` as the value (REG_SZ)
    - `Default` as the value data

1. Verify whether the **MSIPC** and **FileProtection** keys exist. Create them manually if they don't, and then create a subkey for each file name extension.

    For example, for the scanner to protect TIFF images in addition to Office files and PDFs, the registry will look similar to the following after you've edited it:

    ![Editing the registry for the scanner to apply protection](./media/editregistry-scanner.png)

    > [!NOTE]
    > As an image file, TIFF files support native protection and the resulting file name extension is **.ptiff**.
    >

    For files that don't support native protection, specify the file name extension as a new key, and **PFile** for generic protection. The resulting file name extension for the protected file is **.pfile**.

For a list of text and images file types that similarly support native protection but must be specified in the registry, see [Supported file types for classification and protection](./rms-client/client-admin-guide-file-types.md#file-types-supported-for-protection).

## Upgrading your scanner

If you have previously installed the scanner and want to upgrade, see [Upgrading the Azure Information Protection scanner](./rms-client/client-admin-guide.md#upgrading-the-azure-information-protection-scanner).

Then, [configure](deploy-aip-scanner-configure-install-classic.md) and [use your scanner](deploy-aip-scanner-manage-classic.md) as usual, skipping the steps to install your scanner.

>[!NOTE]
> If you have a version of the scanner that is older than 1.48.204.0 and you're not ready to upgrade it, see [Deploying previous versions of the Azure Information Protection scanner to automatically classify and protect files](deploy-aip-scanner-previousversions.md).

## Editing data repository settings in bulk

Use the **Export** and **Import** buttons to make changes for your scanner across several repositories.

This way, you don't need to make the same changes several times, manually, in the Azure portal.

For example, if you have a new file type on several SharePoint data repositories, you may want to update the settings for those repositories in bulk.

To make changes in bulk across repositories:

1. In the Azure portal on the **Repositories** pane, select the **Export** option. For example:

    :::image type="content" source="media/export-scanner-repositories.png" alt-text="Exporting data repository settings for the scanner":::

1. Manually edit the exported file to make your change.

1. Use the **Import** option on the same page to import the updates back across your repositories.

## Using the scanner with alternative configurations

The Azure Information Protection scanner usually looks for conditions specified for your labels in order to classify and protect your content as needed.

In the following scenarios, the Azure Information Protection scanner is also able to scan your content and manage labels, without any conditions configured:

- [Apply a default label to all files in a data repository](#apply-a-default-label-to-all-files-in-a-data-repository)
- [Identify all custom conditions and known sensitive information types](#identify-all-custom-conditions-and-known-sensitive-information-types)

### Apply a default label to all files in a data repository

In this configuration, all unlabeled files in the repository are labeled with the default label specified for the repository or the content scan job. Files are labeled without inspection.

Configure the following settings:

- **Label files based on content**: Set to **Off**
- **Default label**: Set to **Custom**, and then select the label to use

### Identify all custom conditions and known sensitive information types

This configuration enables you to find sensitive information that you might not realize you had, at the expense of scanning rates for the scanner.

Set the **Info types to be discovered** to **All**.

To identify conditions and information types for labeling, the scanner uses custom conditions specified for labels, and the list of information types available to specify for labels, as listed in the Azure Information Protection policy.

For more information, see [Quickstart: Find what sensitive information you have](quickstart-findsensitiveinfo.md).

## Optimizing scanner performance

> [!NOTE]
> If you are looking to improve the responsiveness of the scanner computer rather than the scanner performance, use an advanced client setting to [limit the number of threads used by the scanner](./rms-client/client-admin-guide-customizations.md#limit-the-number-of-threads-used-by-the-scanner).
>

Use the following options and guidance to help you optimize scanner performance:

|Option  |Description  |
|---------|---------|
|**Have a high speed and reliable network connection between the scanner computer and the scanned data store**     |  For example, place the scanner computer in the same LAN, or preferably, in the same network segment as the scanned data store. </br></br>The quality of the network connection affects the scanner performance because, to inspect the files, the scanner transfers the contents of the files to the computer running the scanner service. </br></br>Reducing or eliminating  the network hops required for the data to travel also reduces the load on your network.      |
|**Make sure the scanner computer has available processor resources**     | Inspecting the file contents and encrypting and decrypting files are processor-intensive actions. </br></br>Monitor the typical scanning cycles for your specified data stores to identify whether a lack of processor resources is negatively affecting the scanner performance.        |
|**Install multiple instances of the scanner** | The Azure Information Protection scanner supports multiple configuration databases on the same SQL server instance when you specify a custom cluster (profile) name for the scanner. |
|**Grant specific rights and disable low integrity level**|Confirm that the service account that runs the scanner has only the rights documented in [Service account requirements](deploy-aip-scanner-prereqs.md#service-account-requirements). </br></br>Then, configure the [advanced client setting](./rms-client/client-admin-guide-customizations.md#disable-the-low-integrity-level-for-the-scanner) to disable the low integrity level for the scanner.|
|**Check your alternative configuration usage** |The scanner runs more quickly when you use the [alternative configuration](#using-the-scanner-with-alternative-configurations) to apply a default label to all files because the scanner does not inspect the file contents. <br/></br>The scanner runs more slowly when you use the [alternative configuration](#using-the-scanner-with-alternative-configurations) to identify all custom conditions and known sensitive information types.|
|**Decrease scanner timeouts** | Decrease the scanner timeouts with [advanced client settings](./rms-client/client-admin-guide-customizations.md#change-the-timeout-settings-for-the-scanner).Decreased scanner timeouts provide better scanning rates and lower memory consumption. </br></br>**Note**: Decreasing scanner timeouts means that some files may be skipped.
| | |


### Additional factors that affect performance

Additional factors that affect the scanner performance include:

|Factor  |Description  |
|---------|---------|
|**Load/response times**     |The current load and response times of the data stores that contain the files to scan will also affect scanner performance.         |
|**Scanner mode** (Discovery / Enforce)    | Discovery mode typically has a higher scanning rate than enforce mode. </br></br>Discovery requires a single file read action, whereas enforce mode requires read and write actions.        |
|**Policy changes**     |Your scanner performance may be affected if you've made changes to the conditions in the Azure Information Protection policy . </br></br>Your first scan cycle, when the scanner must inspect every file, will take longer than subsequent scan cycles that by default, inspect only new and changed files. </br></br>If you change the conditions, all files are scanned again. For more information, see [Rescanning files](deploy-aip-scanner-manage-classic.md#rescanning-files).|
|**Regex constructions**    | Scanner performance is affected by how your regex expressions for custom conditions are constructed. </br></br> To avoid heavy memory consumption and the risk of timeouts (15 minutes per file), review your regex expressions for efficient pattern matching. </br></br>For example: </br>- Avoid [greedy quantifiers](/dotnet/standard/base-types/quantifiers-in-regular-expressions) </br>- Use non-capturing groups such as `(?:expression)` instead of `(expression)`    |
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

**More information**:

Interested in how the Core Services Engineering and Operations team in Microsoft implemented this scanner?  Read the technical case study: [Automating data protection with Azure Information Protection scanner](https://www.microsoft.com/itshowcase/Article/Content/1070/Automating-data-protection-with-Azure-Information-Protection-scanner).

You might be wondering: [What's the difference between Windows Server FCI and the Azure Information Protection scanner?](faqs-classic.md#whats-the-difference-between-windows-server-fci-and-the-azure-information-protection-scanner)

You can also use PowerShell to interactively classify and protect files from your desktop computer. For more information about this and other scenarios that use PowerShell, see [Using PowerShell with the Azure Information Protection client](./rms-client/client-admin-guide-powershell.md).