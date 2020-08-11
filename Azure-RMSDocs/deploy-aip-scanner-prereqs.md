---
# required metadata

title: Azure Information Protection (AIP) unified labeling scanner prerequisites 
description: Lists prerequisites for installing and deploying the Azure Information Protection unified labeling scanner.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 06/24/2020
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

# Prerequisites for installing and deploying the Azure Information Protection unified labeling scanner

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows Server 2019, Windows Server 2016, Windows Server 2012 R2*

>[!NOTE]
> If you're working with the classic scanner, see [Prerequisites for installing and deploying the Azure Information Protection classic scanner](deploy-aip-scanner-prereqs-classic.md).

Before you install the Azure Information Protection scanner, make sure that your system complies with the following requirements:

- [Windows Server requirements](#windows-server-requirements)
- [Service account requirements](#service-account-requirements)
- [SQL server requirements](#sql-server-requirements)
- [Azure Information Protection client requirements](#azure-information-protection-client-requirements)
- [Label configuration requirements](#label-configuration-requirements)
- [SharePoint requirements](#sharepoint-requirements)
- [Microsoft Office requirements](#microsoft-office-requirements)
- [File path requirements](#file-path-requirements)
- [Usage statistics requirements](#usage-statistics-requirements)

If you can't meet all the requirements in the table because they are prohibited by your organization policies, see the [alternative configurations](#deploying-the-scanner-with-alternative-configurations) section.

When deploying the scanner in production or testing the performance for multiple scanners, see [Storage requirements and capacity planning for SQL Server](#storage-requirements-and-capacity-planning-for-sql-server).

When you're ready to start installing and deploying your scanner, continue with [Deploying the Azure Information Protection scanner to automatically classify and protect files](deploy-aip-scanner-configure-install.md).

## Windows Server requirements

You must have a Windows Server computer to run the scanner, which has the following system specifications:

|Specification  |Details  |
|---------|---------|
|**Processor**     |4 core processors         |
|**RAM**     |8 GB         |
|**Disk space**     |10-GB free space (average) for temporary files. </br></br>The scanner requires sufficient disk space to create temporary files for each file that it scans, four files per core. </br></br>The recommended disk space of 10 GB allows for 4 core processors scanning 16 files that each have a file size of 625 MB.
|**Operating system**     |- Windows Server 2019 </br>- Windows Server 2016 </br>- Windows Server 2012 R2 </br></br>**Note:** For testing or evaluation purposes in a non-production environment, you can also use any Windows operating system that is [supported by the Azure Information Protection client](requirements.md#client-devices).
|**Network connectivity**     | Your scanner computer can be a physical or virtual computer with a fast and reliable network connection to the data stores to be scanned. </br></br> If internet connectivity is not possible because of your organization policies, see [Deploying the scanner with alternative configurations](#deploying-the-scanner-with-alternative-configurations). </br></br>Otherwise, make sure that this computer has internet connectivity that allows the following URLs over HTTPS (port 443):</br><br />-  \*.aadrm.com <br />-  \*.azurerms.com<br />-  \*.informationprotection.azure.com <br /> - informationprotection.hosting.portal.azure.net <br /> - \*.aria.microsoft.com <br />-  \*.protection.outlook.com |
| ||

## Service account requirements

You must have a service account to run the scanner service on the Windows Server computer, as well as authenticate to Azure AD and download the Azure Information Protection Policy.

Your service account must be an Active Directory account and synchronized to Azure AD.

If you cannot synchronize this account because of your organization policies, see [Deploying the scanner with alternative configurations](#deploying-the-scanner-with-alternative-configurations).

This service account has the following requirements:

|Requirement  |Details  |
|---------|---------|
|**Log on locally** user right assignment     |Required to install and configure the scanner, but not required to run scans.  </br></br>Once you've confirmed that the scanner can discover, classify, and protect files, you can remove this right from the service account.  </br></br>If granting this right even for a short period of time is not possible because of your organization policies, see [Deploying the scanner with alternative configurations](#deploying-the-scanner-with-alternative-configurations).         |
|**Log on as a service** user right assignment.     |  This right is automatically granted to the service account during the scanner installation and this right is required for the installation, configuration, and operation of the scanner.        |
|**Permissions to the data repositories**     |- **File shares or local files:** Grant **Read**, **Write**, and **Modify** permissions for scanning the files and then applying classification and protection as configured.  <br /><br />- **SharePoint:** Grant **Full Control** permissions for scanning the files and then applying classification and protection as configured.  <br /><br />- **Discovery mode:** To run the scanner in discovery mode only, **Read** permission is sufficient.         |
|**For labels that reprotect or remove protection**     | To ensure that the scanner always has access to protected files, make this account a [super user](configure-super-users.md) for Azure Information Protection, and ensure that the super user feature is enabled. </br></br>Additionally, if you've implemented [onboarding controls](activate-service.md#configuring-onboarding-controls-for-a-phased-deployment) for a phased deployment, make sure that the service account is included in the onboarding controls you've configured.|
| ||

## SQL server requirements

To store the scanner configuration data, use an SQL server with the following requirements:

- **A local or remote instance.**

    We recommend hosting the SQL Server and scanner service on different machines, unless you're working with a small deployment.

    SQL Server 2012 is the minimum version for the following editions:

    - SQL Server Enterprise
    - SQL Server Standard
    - SQL Server Express (recommended for test environments only)

- **An account with Sysadmin role to install the scanner.**

    The Sysadmin role enables the installation process to automatically create the scanner configuration database and grant the required **db_owner** role to the service account that runs the scanner.

    If you cannot be granted the Sysadmin role or your organization policies require databases to be created and configured manually, see [Deploying the scanner with alternative configurations](#deploying-the-scanner-with-alternative-configurations).

- **Capacity.** For capacity guidance, see [Storage requirements and capacity planning for SQL Server](#storage-requirements-and-capacity-planning-for-sql-server).

- **[Case insensitive collation](https://docs.microsoft.com/sql/relational-databases/collations/collation-and-unicode-support?view=sql-server-ver15)**

> [!NOTE]
> Multiple configuration databases on the same SQL server are supported when you specify a custom cluster (profile) name for the scanner, or when you use the preview version of the scanner.
>
### Storage requirements and capacity planning for SQL Server

The amount of disk space required for the scanner's configuration database and the specification of the computer running SQL Server can vary for each environment, so we encourage you to do your own testing. Use the following guidance as a starting point.

For more information, see [Optimizing the performance of the scanner](deploy-aip-scanner-configure-install.md#optimizing-scanner-performance).

The disk size for the scanner configuration database will vary for each deployment. Use the following equation as guidance:

```cli
100 KB + <file count> *(1000 + 4* <average file name length>)
```

For example, to scan 1 million files that have an average file name length of 250 bytes, allocate 2-GB disk space.

For multiple scanners:

- **Up to 10 scanners,** use:

    - 4 core processors
    - 8-GB RAM recommended

- **More than 10 scanners** (maximum 40), use:
    - 8 core processes
    - 16-GB RAM recommended

## Azure Information Protection client requirements

You must have either the [current general availability version](./rms-client/unifiedlabelingclient-version-release-history.md) of the Azure Information Protection client installed on the Windows Server computer.

For more information, see the [Unified labeling client admin guide](./rms-client/clientv2-admin-guide.md#installing-the-azure-information-protection-scanner).

> [!IMPORTANT]
> You must install the full client for the scanner. Do not install the client with just the PowerShell module.
>

## Label configuration requirements

You must have labels configured that automatically apply classification, and optionally, protection.

If you don't have these labels configured, see [Deploying the scanner with alternative configurations](#deploying-the-scanner-with-alternative-configurations).

For more information, see:

- [Apply a sensitivity label to content automatically](https://docs.microsoft.com/microsoft-365/compliance/apply-sensitivity-label-automatically)
- [Restrict access to content by using encryption in sensitivity labels](https://docs.microsoft.com/microsoft-365/compliance/encryption-sensitivity-labels)

## SharePoint requirements

To scan SharePoint document libraries and folders, ensure that your SharePoint server complies with the following requirements:

- **Supported versions.** Supported versions include: SharePoint 2019, SharePoint 2016, SharePoint 2013, and SharePoint 2010. Other versions of SharePoint are not supported for the scanner.

- **Versioning.** When you use [versioning](https://docs.microsoft.com/sharepoint/governance/versioning-content-approval-and-check-out-planning), the scanner inspects and labels the last published version. If the scanner labels a file and [content approval](https://docs.microsoft.com/sharepoint/governance/versioning-content-approval-and-check-out-planning#plan-content-approval) is required, that labeled file must be approved to be available for users.  

- **Large SharePoint farms.** For large SharePoint farms, check whether you need to increase the list view threshold (by default, 5,000) for the scanner to access all files. For more information, see [Manage large lists and libraries in SharePoint](https://support.office.com/article/manage-large-lists-and-libraries-in-sharepoint-b8588dae-9387-48c2-9248-c24122f07c59#__bkmkchangelimit&ID0EAABAAA=Server).

## Microsoft Office requirements

To scan Office documents, your documents must be in one of the following formats:

- Microsoft Office 97-2003
- Office Open XML formats for Word, Excel, and PowerPoint

For more information, see [File types supported by the Azure Information Protection unified labeling client](./rms-client/clientv2-admin-guide-file-types.md).

## File path requirements

By default, to scan files, your file paths must have a maximum of 260 characters.

To scan files with file paths of more than 260 characters, install the scanner on a computer with one of the following Windows versions, and configure the computer as needed:

|Windows version  |Description  |
|---------|---------|
|**Windows 2016 or later**     |   Configure the computer to support long paths      |
|**Windows 10 or Windows Server 2016**     | Define the following [group policy setting](https://blogs.msdn.microsoft.com/jeremykuhne/2016/07/30/net-4-6-2-and-long-paths-on-windows-10/): **Local Computer Policy** > **Computer Configuration** > **Administrative Templates** > **All Settings** > **Enable Win32 long paths**.    </br></br>For more information long file path support in these versions, see the [Maximum Path Length Limitation](https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file#maximum-path-length-limitation) section from the Windows 10 developer documentation.    |
|**Windows 10, version 1607 or later**     |  Opt in for the updated **MAX_PATH** functionality. For more information, see [Enable Long Paths in Windows 10 versions 1607 and later](https://docs.microsoft.com/windows/win32/fileio/naming-a-file#enable-long-paths-in-windows-10-version-1607-and-later).      |
| | |
## Usage statistics requirements

Disable usage statistics using one of the following methods:

- Setting the [AllowTelemetry](https://docs.microsoft.com/azure/information-protection/rms-client/client-admin-guide-install#to-install-the-azure-information-protection-client-by-using-the-executable-installer) parameter to 0

- Ensure that the **Help improve Azure Information Protection by sending usage statistics to Microsoft** option remains unselected during the scanner installation process.

## Deploying the scanner with alternative configurations

The prerequisites listed above are the default requirements for the scanner deployment, and recommended because they support the simplest scanner configuration.

The default requirements should be suitable for initial testing, so that you can check the capabilities of the scanner.

However, in a production environment, your organization's policies may prohibit these default requirements. The scanner can accommodate the following restrictions with additional configuration:

- [The scanner server cannot have internet connectivity](#restriction-the-scanner-server-cannot-have-internet-connectivity)

- [Restriction: The scanner service account cannot be synchronized to Azure Active Directory but the server has internet connectivity](#restriction-the-scanner-service-account-cannot-be-synchronized-to-azure-active-directory-but-the-server-has-internet-connectivity)

- [Restriction: The service account for the scanner cannot be granted the **Log on locally** right](#restriction-the-service-account-for-the-scanner-cannot-be-granted-the-log-on-locally-right)

- [Restriction: You cannot be granted Sysadmin or databases must be created and configured manually](#restriction-you-cannot-be-granted-sysadmin-or-databases-must-be-created-and-configured-manually)

### Restriction: The scanner server cannot have internet connectivity

To support a disconnected computer, perform the following steps:

1. Configure labels in your policy, and then import the policy using the [Import-AIPScannerConfiguration](https://docs.microsoft.com/powershell/module/azureinformationprotection/Import-AIPScannerConfiguration?view=azureipps) cmdlet. While the unified labeling client cannot apply protection without an internet connection, the scanner can still apply labels based on imported policies.

1. Configure the scanner in the Azure portal, by creating a scanner cluster. If you need help with this step, see [Configure the scanner in the Azure portal](deploy-aip-scanner-configure-install.md#configure-the-scanner-in-the-azure-portal).

1. Export your content job from the **Azure Information Protection - Content scan jobs** pane using the **Export** option.

1. In a PowerShell session, run [Import-AIPScannerConfiguration](/powershell/module/azureinformationprotection/Import-AIPScannerConfiguration) and specify the file that contains the exported settings.

### Restriction: You cannot be granted Sysadmin or databases must be created and configured manually

If you can be granted the Sysadmin role *temporarily* to install the scanner, you can remove this role when the scanner installation is complete.

Do one of the following, depending on your organization's requirements:

- **You can have the Sysadmin role temporarily.** If you temporarily have the Sysadmin role, the database is automatically created for you and the service account for the scanner is automatically granted the required permissions.

    However, the user account that configures the scanner still requires the **db_owner** role for the scanner configuration database. If you only have the Sysadmin role until the scanner installation is complete, [grant the db_owner role to the user account manually](#create-a-user-and-grant-db_owner-rights-manually).

- **You cannot have the Sysadmin role at all**. If you cannot be granted the Sysadmin role even temporarily, you must ask a user with Sysadmin rights to manually create a database before you install the scanner.

    For this configuration, the **db_owner** role must be assigned to the following accounts:

    - Service account for the scanner
    - User account for the scanner installation
    - User account for scanner configuration

    Typically, you will use the same user account to install and configure the scanner. If you use different accounts, they both require the db_owner role for the scanner configuration database. Create this user and rights as needed. If you specify your own cluster (profile) name, the configuration database is named **AIPScannerUL_<cluster_name>**.

Additionally:

- You must be a local administrator on the server that will run the scanner
- The service account that will run the scanner must be granted Full Control permissions to the following registry keys:

    - HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\MSIPC\Server
    - HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSIPC\Server

If, after configuring these permissions, you see an error when you install the scanner, the error can be ignored and you can manually start the scanner service.

#### Populate the database manually

Populate the database using the following script:

```cli
if not exists(select * from master.sys.server_principals where sid = SUSER_SID('domain\user')) BEGIN declare @T nvarchar(500) Set @T = 'CREATE LOGIN ' + quotename('domain\user') + ' FROM WINDOWS ' exec(@T) END 
```

#### Create a user and grant db_owner rights manually

To create a user and grant db_owner rights on this database, ask the Sysadmin to perform the following steps:

1. Create a DB for scanner:

    ```cli
    **CREATE DATABASE AIPScannerUL_[clustername]**

    **ALTER DATABASE AIPScannerUL_[clustername] SET TRUSTWORTHY ON**
    ```

2. Grant rights to the user that runs the install command and is used to run scanner management commands.

    SQL script:

    ```sql
    if not exists(select * from master.sys.server_principals where sid = SUSER_SID('domain\user')) BEGIN declare @T nvarchar(500) Set @T = 'CREATE LOGIN ' + quotename('domain\user') + ' FROM WINDOWS ' exec(@T) END
    USE DBName IF NOT EXISTS (select * from sys.database_principals where sid = SUSER_SID('domain\user')) BEGIN declare @X nvarchar(500) Set @X = 'CREATE USER ' + quotename('domain\user') + ' FROM LOGIN ' + quotename('domain\user'); exec sp_addrolemember 'db_owner', 'domain\user' exec(@X) END
    ```

3. Grant rights to scanner service account.

    SQL script:
    ```sql
    if not exists(select * from master.sys.server_principals where sid = SUSER_SID('domain\user')) BEGIN declare @T nvarchar(500) Set @T = 'CREATE LOGIN ' + quotename('domain\user') + ' FROM WINDOWS ' exec(@T) END
    ```

#### Restriction: The service account for the scanner cannot be granted the **Log on locally** right

If your organization policies prohibit the **Log on locally** right for service accounts, but allows the **Log on as a batch job** right, use the *OnBehalfOf* parameter with Set-AIPAuthentication.

For more information, see [How to label files non-interactively for Azure Information Protection](./rms-client//clientv2-admin-guide-powershell.md#how-to-label-files-non-interactively-for-azure-information-protection).

#### Restriction: The scanner service account cannot be synchronized to Azure Active Directory but the server has internet connectivity

You can have one account to run the scanner service and use another account to authenticate to Azure Active Directory:

- **For the scanner service account,** use a local Windows account or an Active Directory account.

- **For the Azure Active Directory account,** specify your local account for the *OnBehalfOf* parameter with Set-AIPAuthentication. For more information, see [How to label files non-interactively for Azure Information Protection](./rms-client//clientv2-admin-guide-powershell.md#how-to-label-files-non-interactively-for-azure-information-protection).

## Next steps

Once you've confirmed that your system complies with the scanner prerequisites, continue with [Deploying the Azure Information Protection scanner to automatically classify and protect files](deploy-aip-scanner-configure-install.md).

For an overview about the scanner, see [Deploying the Azure Information Protection scanner to automatically classify and protect files](deploy-aip-scanner.md).

**More information:**

- Interested in how the Core Services Engineering and Operations team in Microsoft implemented this scanner?  Read the technical case study: [Automating data protection with Azure Information Protection scanner](https://www.microsoft.com/itshowcase/Article/Content/1070/Automating-data-protection-with-Azure-Information-Protection-scanner).

- You might be wondering: [What's the difference between Windows Server FCI and the Azure Information Protection scanner?](faqs.md#whats-the-difference-between-windows-server-fci-and-the-azure-information-protection-scanner)

- You can also use PowerShell to interactively classify and protect files from your desktop computer. For more information about this and other scenarios that use PowerShell, see [Using PowerShell with the Azure Information Protection unified labeling client](./rms-client/clientv2-admin-guide-powershell.md).
