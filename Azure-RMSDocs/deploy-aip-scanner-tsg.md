---
# required metadata

title: Troubleshoot your on-premises scanner deployment
description: Instructions for troubleshooting your unified labeling on-premises scanner deployment
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 03/10/2021
ms.topic: reference
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

# Troubleshooting your unified labeling on-premises scanner deployment


Use the content in this article to help you troubleshoot your on-premises scanner deployment.

## Troubleshooting using the scanner diagnostic tool

If you're having issues with the Azure Information Scanner, verify whether your deployment is healthy using the [Start-AIPScannerDiagnostics](/powershell/module/azureinformationprotection/start-aipscannerdiagnostics) PowerShell command:

```powershell
Start-AIPScannerDiagnostics
```

The diagnostics tool checks the following details and then exports a log file with the results:

- Whether the database is up to date
- Whether network URLs are accessible
- Whether there's a valid authentication token and the policy can be acquired
- Whether the profile is defined in the Azure portal
- Whether offline/online configuration exists and can be acquired
- Whether the rules configured are valid

> [!TIP]
> - If you are running the command under a user that is not the scanner user, be sure to add the **-OnBehalf** parameter. 
> - To print the last 10 errors from the scanner log, add the **Verbose** parameter. If you want to print more errors, use the **VerboseErrorCount** to define the number of errors you want to print.
>

> [!NOTE]
> The **Start-AIPScannerDiagnostics** command does not run a full prerequisites check. If you're having issues with the scanner, also ensure that your system complies with [scanner requirements](deploy-aip-scanner-prereqs.md), and that your [scanner configuration and installation](deploy-aip-scanner-configure-install.md) is complete.
>

## Troubleshooting a scan that timed out

If the scanner stops in the middle unexpectedly and doesn't complete scanning a large number of files in a repository, you may need to modify one of the following settings:

- **Number of dynamic ports**. You may need to increase the number of dynamic ports for the operating system hosting the files. Server hardening for SharePoint can be one reason why the scanner exceeds the number of allowed network connections, and therefore stops.

    For more information about how to view the current port range and increase the range, see [Settings that can be Modified to Improve Network Performance](/biztalk/technical-guides/settings-that-can-be-modified-to-improve-network-performance).

- **List view threshold**. For large SharePoint farms, you may need to increase the list view threshold. By default, the list view threshold is set to **5,000**.

    For more information, see [Manage large lists and libraries in SharePoint](https://support.office.com/article/manage-large-lists-and-libraries-in-sharepoint-b8588dae-9387-48c2-9248-c24122f07c59#__bkmkchangelimit&ID0EAABAAA=Server).



## Verify scanning details per scanner node and repository

Use the [Get-AIPScannerStatus](/powershell/module/azureinformationprotection/get-aipscannerstatus) together with variables to get details about the scanning status on each node in your scanner cluster.

Use one or more of the following methods:

- [Use the NodesInfo variable to get details about the scanning status on each node](#use-the-nodesinfo-variable-to-get-details-about-the-scanning-status-on-each-node)
- [Use the Verbose parameter to get data for current scan](#use-the-verbose-parameter-to-get-data-for-current-scan)
### Use the NodesInfo variable to get details about the scanning status on each node

For example, run the following command:

```powershell
PS C:\> Get-AIPScannerStatus

Cluster        : contoso-test
ClusterStatus  : Scanning
StartTime      : 12/22/2020 9:05:02 AM
TimeFromStart  : 00:00:00:37
NodesInfo      : {t-contoso1-T298-corp.contoso.com,t-contoso2-T298-corp.contoso.com}
```

The output displays details about the current scan status, as well as a list of nodes in the cluster.

Use the **NodesInfo** variable to display further details about each node in the cluster:

```powershell
PS C:\WINDOWS\system32> $x=Get-AIPScannerStatus
PS C:\WINDOWS\system32> $x.NodesInfo
```

The output displays details for each node in a table. For example:

```powershell
NodeName                            Status    IsScanning    Summary
--------                            --------  ----------    -------
t-contoso1-T298-corp.contoso.com    Scanning        True    Microsoft.InformationProtection.Scanner.ScanSummaryData
t-contoso2-T298-corp.contoso.com    Scanning     Pending    Microsoft.InformationProtection.Scanner.ScanSummaryData
```

To drill down further into each node, use the **NodesInfo** variable again, with the node integer starting with **0**. For example:

```powershell
PS C:\Windows\system32> $x.NodesInfo[0].Summary
```

The output displays a long list of details about the scan on the selected node. For example:

```powershell
ScannerID               : t-contoso1-T298-corp.contoso.com
ScannedFiles            : 2280
FailedFiles             : 0
ScannedBytes            : 78478187
Classified              : 0
Labeled                 : 0
....

```

### Use the Verbose parameter to get data for current scan


```
PS C:\> Get-AIPScannerStatus -Verbose

ScannedFiles    MBScanned    CurrentScanSummary                                         RepositoriesStatus
------------    ---------    ------------------                                         ------------------
        2280    78478187     Microsoft.InformationProtection.Scanner.ScanSummaryData    {​​​​​​{​​​​​​ Path = C:\temp, Status = Scanning }​​​​​​
```

Drill down further to find more details for the repositories by using the **RepositoriesStatus** or the **CurrentScanSummary** variables.

Possible repository statuses include:

- **Skipped**, if the repository was skipped
- **Pending**, if the current scan has not yet started scanning the repository
- **Scanning**, if the current scan is running on the repository
- **Finished**, if the current scan has completed running on the repository

**RepositoriesStatus**

```powershell
PS C:\Windows\system32> $x.Get-AIPScannerStatus -Verbose
PS C:\Windows\system32> $x.RepositoriesStatus

Path        Status
----        ------
C:\temp     Scanning
```

**CurrentScanSummary**

```powershell
PS C:\Windows\system32> $x.CurrentScanSummary


ScannerID               : 
ScannedFiles            : 2280
FailedFiles             : 0
ScannedBytes            : 78478187
Classified              : 0
Labeled                 : 0
....
```

This output shows only a single repository. In cases of multiple repositories, each one will be listed separately.
## Scanner error reference

Use the following sections to understand specific error messages generated by the scanner, and troubleshooting or solution actions to fix the issue:

|Error type |Troubleshooting  |
|---------|---------|
|**Authentication errors**     |  - [Authentication token not accepted](#authentication-token-not-accepted) <br>  - [Authentication token missing](#authentication-token-missing)|
|**Policy errors**     |  - [Policy missing](#policy-missing) <br>- [Policy doesn't include any automatic labeling condition](#policy-doesnt-include-any-automatic-labeling-condition)      |
|**DB / Schema errors**     |  - [Database errors](#database-errors) <br> - [Mismatched or outdated schema](#mismatched-or-outdated-schema)  |
|**Other errors**     |  - [Underlying connection was closed](#underlying-connection-was-closed) <br> - [Stuck scanner processes](#stuck-scanner-processes) <br>- [Unable to connect to remote server](#unable-to-connect-to-remote-server) <br>- [Error occurred while sending the request](#error-occurred-while-sending-the-request) <br>- [Missing content scan job or profile](#missing-content-scan-job-or-profile) <br>- [No repositories configured](#no-repositories-configured) <br>- [No cluster found](#no-cluster-found)  <br>- [Scanner diagnostics errors](#scanner-diagnostics-errors) |

<!--Authentication errors-->

### Authentication token not accepted

**Error message**

`Microsoft.InformationProtection.Exceptions.AccessDeniedException: The service didn't accept the auth token.`

**Solution**

If the [Set-AIPAuthentication](/powershell/module/azureinformationprotection/set-aipauthentication) command failed, make sure to define the permissions correctly in the Azure portal.

For more information, see [Create and configure Azure AD applications for Set-AIPAuthentication](rms-client/clientv2-admin-guide-powershell.md#create-and-configure-azure-ad-applications-for-set-aipauthentication).

### Authentication token missing

**Error message**

One of the following:

- `NoAuthTokenException: Client application failed to provide authentication token for HTTP request`

- `Microsoft.InformationProtection.Exceptions.NoAuthTokenException: Client application failed to provide authentication token for HTTP request. Failed with: System.AggregateException: One or more errors occurred. ---> Microsoft.IdentityModel.Clients.ActiveDirectory.AdalException: user_interaction_required: One of two conditions was encountered: 1. The PromptBehavior.Never flag was passed, but the constraint could not be honored, because user interaction was required. 2. An error occurred during a silent web authentication that prevented the http authentication flow from completing in a short enough time frame`

- `Failed to acquire a token using windows integrated authentication (No SSO)`

- From the Azure portal, on the **Nodes** page: `Policy does not include any automatic labeling condition`

**Solution**

In order to have the scanner run non-interactively, you must authenticate using a token. 

When you run the [Set-AIPAuthentication](/powershell/module/azureinformationprotection/set-aipauthentication) command, make sure you use the token parameter on behalf of the scanner user.

For example:

```powershell
$pscreds = Get-Credential CONTOSO\scanner
Set-AIPAuthentication -AppId "77c3c1c3-abf9-404e-8b2b-4652836c8c66" -AppSecret "OAkk+rnuYc/u+]ah2kNxVbtrDGbS47L4" -DelegatedUser scanner@contoso.com -TenantId "9c11c87a-ac8b-46a3-8d5c-f4d0b72ee29a" -OnBehalfOf $pscreds
Acquired application access token on behalf of CONTOSO\scanner.
```

For more information, see [Get an Azure AD token for the scanner](deploy-aip-scanner-configure-install.md#get-an-azure-ad-token-for-the-scanner).

<!--Policy errors-->

### Policy missing

**Error message**

`Policy is missing`

**Description**

The scanner is unable to find your Microsoft Purview Information Protection policy file.

**Solution**

To verify that your policy file exists as expected, check in the following location: **%localappdata%\Microsoft\MSIP\mip\MSIP.Scanner.exe\mip\mip.policies.sqlite3**

For more information about MIP labels and label policies, see [Create and configure sensitivity labels and their policies](/microsoft-365/compliance/create-sensitivity-labels) in the Microsoft 365 documentation.

### Policy doesn't include any automatic labeling condition

**Error**

Errors show that your labeling policy is missing automatic labeling conditions

**Solution**

Verify any or all of following issues:

|Solution  |Details  |
|---------|---------|
|**Check your content scan job settings**     | In the Azure portal, do the following: <br> <br>- [Set the **Info types to be discovered** to **All**](deploy-aip-scanner-configure-install.md#identify-all-custom-conditions-and-known-sensitive-information-types)  <br>- [Define a default label to be applied when scanning](deploy-aip-scanner-configure-install.md#apply-a-default-label-to-all-files-in-a-data-repository)      |
|**Check your labeling policy settings**     |  In the Microsoft Purview compliance portal, do the following: <br> <br>- [Define a default sensitivity label](/microsoft-365/compliance/create-sensitivity-labels#publish-sensitivity-labels-by-creating-a-label-policy)  <br> - [Define automatic / recommended labeling rules](/microsoft-365/compliance/apply-sensitivity-label-automatically)       |
|**Verify that your policy is accessible**     | If your settings are defined as expected, the policy file itself may be missing or inaccessible, such as when there's a timeout from the Microsoft Purview compliance portal. <br>  <br>To verify your policy file, check that the following file exists: **%localappdata%\Microsoft\MSIP\mip\MSIP.Scanner.exe\mip\mip.policies.sqlite3**        |

For more information, see [What is the Azure Information Protection unified labeling scanner?](deploy-aip-scanner.md) and [Learn about sensitivity labels](/microsoft-365/compliance/sensitivity-labels).

<!--DB / Schema errors-->

### Database errors

**Error message**

`DB error`

**Description**

The scanner may not be able to connect to the database.

**Solution**

Check your network connectivity between the scanner computer and the database. 

Additionally, make sure that the service account being used to run scanner processes has any permissions required to access the database.

### Mismatched or outdated schema

**Error message**

One of the following:

- `SchemaMismatchException`

- In the Azure portal, on the **Nodes** page: `DB schema is not up to date. Run Update-AIPScanner command to update the DB schema` or `Error: DB schema is not up to date`

**Solution**

Run the [Update-AIPScanner](/powershell/module/azureinformationprotection/Update-AIPScanner) command to resynchronize your schema and ensure that it's up to date with any recent changes.


<!--Other errors-->

### Scanner diagnostics errors

If you get errors running the [Start-AIPDiagnostics](/powershell/module/azureinformationprotection/start-aipscannerdiagnostics) command, make sure that you're using the correct scanner account credentials in the **-OnBehalf** parameter.

For example:

```powershell
$scanner_account_creds= Get-Credential
Start-AIPScannerDiagnostics -onbehalf $scanner_account_creds
```

### Underlying connection was closed

**Error message**

`System.Net.WebException: The underlying connection was closed: An unexpected error occurred on a send. ---> System.IO.IOException: Authentication failed because the remote party has closed the transport stream.`

**Solution**

This error usually means that TLS 1.2 is not enabled.

For more information, see:

- [Firewalls and network infrastructure requirements](requirements.md#firewalls-and-network-infrastructure)
- [How to enable TLS 1.2](/mem/configmgr/core/plan-design/security/enable-tls-1-2-client) 
- [Enable TLS 1.1 and TLS 1.2 support in Office Online Server](/officeonlineserver/enable-tls-1-1-and-tls-1-2-support-in-office-online-server)

### Stuck scanner processes

**Error message**

Scanner is processing a single file longer than expected. The process might be stuck.

**Solution**

Check the detailed report to see whether the file is still growing or not. 

If the file continues to grow, this means that the scanner is still processing data, and you must wait until it's done.

However, if the file is no longer growing, do the following:

1. Do one or both of the following:

    - Run the [Start-AIPScannerDiagnostics](/powershell/module/azureinformationprotection/start-aipscannerdiagnostics) cmdlet to run diagnostic checks on your scanner, and export and zip log files for any errors that are found.
    - Run the [Export-AIPLogs](/powershell/module/azureinformationprotection/export-aiplogs) cmdlet to export and zip log files from the **%localappdata%\Microsoft\MSIP\Logs** directory.

1. Create a dump file for the MSIP Scanner service. In the Windows Task Manager, right-click the **MSIP Scanner service**, and select **Create dump file**.

1. In the Azure portal, stop the scan. 

1. On the scanner machine, restart the service.

1. Open a support ticket and attach the dump files from the scanner process.

For more information, see [Troubleshooting a scan that timed out](#troubleshooting-a-scan-that-timed-out). 

### Unable to connect to remote server

**Error**

In the **%*localappdata*%\Microsoft\MSIP\Logs\MSIPScanner.iplog** file, `Unable to connect to the remote server ---> System.Net.Sockets.SocketException: Only one usage of each socket address (protocol/network address/port) is normally permitted IP:port`    

> [!NOTE]
> This file will be zipped if there are multiple logs.

**Description**

The scanner has exceeded the number of allowed network connections.

**Solution**

Increase the number of dynamic ports for the operating system hosting the files.

For more information about how to view the current port range and increase the range, see [Settings that can be Modified to Improve Network Performance](/biztalk/technical-guides/settings-that-can-be-modified-to-improve-network-performance).


See also: [Troubleshooting a scan that timed out](#troubleshooting-a-scan-that-timed-out).
### Error occurred while sending the request

**Error message**

`[System.Net.Http.HttpRequestException: An error occurred while sending the request. ---> System.Net.WebException: The underlying connection was closed: An unexpected error occurred on a send. ---> System.IO.IOException: Unable to read data from the transport connection: An existing connection was forcibly closed by the remote host. ---> System.Net.Sockets.SocketException: An existing connection was forcibly closed by the remote host`

**Solution**

This error usually means that TLS 1.2 is not enabled.

For more information, see:

- [Firewalls and network infrastructure requirements](requirements.md#firewalls-and-network-infrastructure)
- [How to enable TLS 1.2](/mem/configmgr/core/plan-design/security/enable-tls-1-2-client) 
- [Enable TLS 1.1 and TLS 1.2 support in Office Online Server](/officeonlineserver/enable-tls-1-1-and-tls-1-2-support-in-office-online-server)


### Missing content scan job or profile

**Error**

Errors show that your content scan job or profile cannot be found.

For example, the following error in the Azure portal on the **Nodes** page: `No content scan job found`

**Solution**

Check your scanner configuration in the Azure portal.

For more information, see [Configuring and installing the  Azure Information Protection unified labeling scanner](deploy-aip-scanner-configure-install.md). 

> [!NOTE]
> A *profile* is a legacy scanner term that has been replaced by the scanner cluster and content scan job in newer versions of the scanner.
> 
### No repositories configured

**Error message**

In the Azure portal, on the **Nodes** page: `No repositories are configured`

**Description**

You may have a content scan job with no repositories configured. 

**Solution**

Check your content scan job settings and add at least one repository. 

For more information, see [Create a content scan job](deploy-aip-scanner-configure-install.md#create-a-content-scan-job).

### No cluster found

**Error message**

In the Azure portal, on the **Nodes** page: `No cluster found`

**Description**

No actual match found for one of the scanner clusters you've defined.

**Solution**

Verify your cluster configuration and check it against your own system details for typos and errors.

For more information, see [Create a scanner cluster](deploy-aip-scanner-configure-install.md#create-a-scanner-cluster).

## Next steps

For more information, see our blog on [Best practices for deploying and using the AIP UL scanner](https://techcommunity.microsoft.com/t5/microsoft-security-and/best-practices-for-deploying-and-using-the-aip-ul-scanner/ba-p/1878168).