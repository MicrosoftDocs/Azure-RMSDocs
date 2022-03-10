---
# required metadata

title: Running the Azure Information Protection classic scanner (AIP)
description: Instructions for running the Azure Information Protection classic scanner to discover, classify, and protect files on data stores.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 06/29/2020
ms.topic: conceptual
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

# Running the Azure Information Protection classic scanner

>***Applies to**: Azure Information Protection, Windows Server 2019, Windows Server 2016, Windows Server 2012 R2*
>
>***Relevant for**: [Azure Information Protection classic client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients). For the unified labeling client, see [Running the Azure Information Protection scanner](deploy-aip-scanner-manage.md)*.

[!INCLUDE [AIP classic client is sunset](includes/classic-client-sunset.md)]

Once you've confirmed your [system requirements](deploy-aip-scanner-prereqs-classic.md) and [configured and installed your scanner](deploy-aip-scanner-configure-install-classic.md), [run a discovery scan](#run-a-discovery-cycle-and-view-reports-for-the-scanner) to get started.

Use other steps detailed below to manage your scans moving forward.

- [Stop a scan](#stopping-a-scan)
- [Rescanning files](#rescanning-files)
- [Troubleshooting a stopped scan](#troubleshooting-a-stopped-scan)
- [Troubleshooting using the scanner diagnostic tool](#troubleshooting-using-the-scanner-diagnostic-tool)
- [Scanner event log IDs and descriptions](#event-log-ids-and-descriptions-for-the-scanner)

For more information, see [Deploying the Azure Information Protection scanner to automatically classify and protect files](deploy-aip-scanner.md).

## Run a discovery cycle and view reports for the scanner

Use the following procedure after you've [configured and installed your scanner](deploy-aip-scanner-configure-install.md) to get an initial understanding of your content.

Perform these steps again as needed when your content changes.

1. In the Azure portal, on the **Azure Information Protection - Content scan jobs** pane, select your content scan jobs, and then select the **Scan now** option:

    ![Initiate scan for the Azure Information Protection scanner](./media/scanner-scan-now.png)

    Alternatively, in your PowerShell session, run the following command:
    
    ```ps
    Start-AIPScan
    ```

1. Wait for the scanner to complete its cycle. The scan completes when the scanner has crawled through all the files in the specified data stores.

    Do any of the following to monitor scanner progress:

    - **Refresh the scan jobs.**  On the **Azure Information Protection - Content scan jobs** pane, select **Refresh**.

        Wait until you see values for the **LAST SCAN RESULTS** column and the **LAST SCAN (END TIME)** column.

    - **Use a PowerShell command.** Run `Get-AIPScannerStatus` to monitor the status change.

    - **Check Windows event logs.** Check the local Windows **Applications and Services** event log, named **Azure Information Protection**.

        This log also reports when the scanner has finished scanning, including a summary of results. Look for the informational event ID **911**. For more information, see [Event log IDs and descriptions for the scanner](#event-log-ids-and-descriptions-for-the-scanner).

1. When the scan is complete, review the reports stored in the **%*localappdata*%\Microsoft\MSIP\Scanner\Reports** directory.

    - The .txt summary files include the time taken to scan, the number of scanned files, and how many files had a match for the information types.

    - The .csv files have more details for each file. This folder stores up to 60 reports for each scanning cycle and all but the latest report is compressed to help minimize the required disk space.

[Initial configurations](deploy-aip-scanner-configure-install-classic.md#configure-the-scanner-in-the-azure-portal) instruct you to set the **Info types to be discovered** to **Policy only**. This configuration means that only files that meet the conditions you've configured for automatic classification are included in the detailed reports.

If you don't see any labels applied, check that your label configuration includes automatic rather than recommended classification, or enable **Treat recommended labeling as automatic** (available in scanner version 2.7.x.x and above).

If the results are still not as you expect, you might need to reconfigure the conditions that you specified for your labels. If that's the case, reconfigure the conditions as needed, and repeat this procedure until you are satisfied with the results. Then, update your configuration automatically, and optionally protection.

### Viewing updates in the Azure portal

Scanners send this information to Azure Information Protection every five minutes, so that you can view the results in near real time from the Azure portal. For more information, see [Reporting for Azure Information Protection](reports-aip.md).

The Azure portal displays information about the last scan only. If you need to see the results of previous scans, return to the reports that are stored on the scanner computer, in the %*localappdata*%\Microsoft\MSIP\Scanner\Reports folder.

### Changing log levels or locations

Change the level of logging by using the *ReportLevel* parameter with [Set-AIPScannerConfiguration](/powershell/module/azureinformationprotection/set-aipscannerconfiguration).

The report folder location or name cannot be changed. If you want to store reports in a different location, consider using a directory junction for the folder.

For example, use the [Mklink](/windows-server/administration/windows-commands/mklink) command: `mklink /j D:\Scanner_reports C:\Users\aipscannersvc\AppData\Local\Microsoft\MSIP\Scanner\Reports`

If you've performed these steps after an initial configuration and installation, continue with [Configure the scanner to apply classification and protection](deploy-aip-scanner-configure-install.md#configure-the-scanner-to-apply-classification-and-protection).

## Stopping a scan

To stop a currently running scan before it's complete, use one of the following methods:

- **Azure portal.** Select **Stop scan**:

    ![Stop a scan for the Azure Information Protection scanner](./media/scanner-stop-scan.png)

- **Run a PowerShell command.** Run the following command:
    
    ```ps
    Stop-AIPScan 
    ```

## Rescanning files

For the [first scan cycle](#run-a-discovery-cycle-and-view-reports-for-the-scanner), the scanner inspects all files in the configured data stores. For subsequent scans, only new or modified files are inspected.

Inspecting all files again is typically useful when you want the reports to include all files, and when the scanner runs in discovery mode.

Run a new scan of all your files using one the following methods:

- [Manually run a full rescan](#manually-run-a-full-rescan)
- [Trigger a full rescan by refreshing the policy](#trigger-a-full-rescan-by-refreshing-the-policy)

### Manually run a full rescan

Force the scanner to inspect all files again, as needed, from the **Azure Information Protection - Content scan jobs** pane in the Azure portal.

Select your content scan job from the list, and then select the **Rescan all files** option:

![Initiate rescan for the Azure Information Protection scanner](./media/scanner-rescan-files.png)

When a full scan is complete, the scan type automatically changes to incremental so that for subsequent scans, only new or modified files are scanned again.

### Trigger a full rescan by refreshing the policy

All files are also inspected in the following scenarios whenever the scanner downloads an Azure Information Protection policy that has new or changed conditions.

The scanner automatically refreshes the policy every hour, as well as each time the service starts and the policy is found to be over an hour old.

To refresh the policy sooner, such as while testing, manually delete the **Policy.msip**  policy file from the **%LocalAppData%\Microsoft\MSIP** directory and restart the Azure Information Protection service.

> [!NOTE]
> If you've also changed protection settings for your labels, wait an extra 15 minutes from when you saved the updated protection settings before restarting the Azure Information Protection service.
>

## Troubleshooting a stopped scan

If the scanner stops in the middle unexpectedly, and doesn't complete scanning a large number of files in a repository, you may need to modify one of the following settings:

- **Number of dynamic ports**. You may need to increase the number of dynamic ports for the operating system hosting the files. Server hardening for SharePoint can be one reason why the scanner exceeds the number of allowed network connections, and therefore stops.

    To check whether this is the cause of the scanner stopping, look to see if the following error message is logged for the scanner in the  **%*localappdata*%\Microsoft\MSIP\Logs\MSIPScanner.iplog** file.

    **Unable to connect to the remote server ---> System.Net.Sockets.SocketException: Only one usage of each socket address (protocol/network address/port) is normally permitted IP:port**

    > [!NOTE]
    > This file will be zipped if there are multiple logs.

    For more information about how to view the current port range and increase the range, see [Settings that can be Modified to Improve Network Performance](/biztalk/technical-guides/settings-that-can-be-modified-to-improve-network-performance).

- **List view threshold.** For large SharePoint farms, you may need to increase the list view threshold. By default, the list view threshold is set to 5,000.

    For more information, see [Manage large lists and libraries in SharePoint](https://support.office.com/article/manage-large-lists-and-libraries-in-sharepoint-b8588dae-9387-48c2-9248-c24122f07c59#__bkmkchangelimit&ID0EAABAAA=Server).

## Troubleshooting using the scanner diagnostic tool

If you're having issues with the Azure Information Scanner, verify whether your deployment is healthy using the following PowerShell command:

```ps
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
> If you are running the command under a user that is not the scanner user, be sure to add the **-OnBehalf** parameter. 
>

> [!NOTE]
> The **Start-AIPScannerDiagnostics** tool does not run a full prerequisites check. If you're having issues with the scanner, also ensure that your system complies with [scanner requirements](deploy-aip-scanner-prereqs.md), and that your [scanner configuration and installation](deploy-aip-scanner-configure-install.md) is complete.
>

## Event log IDs and descriptions for the scanner

The following AIP scanner log events are stored in the Windows **Applications and Services** event log named **Azure Information Protection**.

|Event ID  |Activity  |Description  |
|---------|---------|---------|
|**910**     | Scanner cycle started        | Logged when the scanner service is started and begins to scan for files in the data repositories that you specified.        |
|**911**     |   Scanner cycle finished      | Logged when the scanner has finished a manual scan, or the scanner has finished a cycle for a continuous schedule.       |
| | | |

> [!TIP]
> If the scanner was configured to run manually rather than continuously, to scan the files again, set the **Schedule** to **Manual** or **Always** in the content scan job, and then restart the service. For more information, see [Rescanning files](#rescanning-files).
>

## Next steps

- Interested in how the Core Services Engineering and Operations team in Microsoft implemented this scanner?  Read the technical case study: [Automating data protection with Azure Information Protection scanner](https://www.microsoft.com/itshowcase/Article/Content/1070/Automating-data-protection-with-Azure-Information-Protection-scanner).

- You might be wondering: [What's the difference between Windows Server FCI and the Azure Information Protection scanner?](faqs-classic.md#whats-the-difference-between-windows-server-fci-and-the-azure-information-protection-scanner)

- You can also use PowerShell to interactively classify and protect files from your desktop computer. For more information about this and other scenarios that use PowerShell, see [Using PowerShell with the Azure Information Protection client](./rms-client/client-admin-guide-powershell.md).