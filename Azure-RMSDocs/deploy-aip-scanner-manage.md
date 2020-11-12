---
# required metadata

title: Running the Azure Information Protection unified labeling scanner (AIP)
description: Instructions for running the Azure Information Protection unified labeling scanner to discover, classify, and protect files on data stores.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 06/25/2020
ms.topic: how-to
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

# Running the Azure Information Protection scanner

>***Applies to**: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows Server 2019, Windows Server 2016, Windows Server 2012 R2*
>
>***Relevant for**: [AIP unified labeling client only](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients). For the classic scanner, see [Running the Azure Information Protection classic scanner](deploy-aip-scanner-manage-classic.md).*

Once you've confirmed your [system requirements](deploy-aip-scanner-prereqs.md) and [configured and installed your scanner](deploy-aip-scanner-configure-install.md), [run a discovery scan](#run-a-discovery-cycle-and-view-reports-for-the-scanner) to get started.

Use other steps detailed below to manage your scans moving forward.

- [Stop a scan](#stopping-a-scan)
- [Rescanning files](#rescanning-files)
- [Troubleshooting a stopped scan](#troubleshooting-a-stopped-scan)
- [Troubleshooting using the scanner diagnostic tool](#troubleshooting-using-the-scanner-diagnostic-tool)

For more information, see [Deploying the Azure Information Protection scanner to automatically classify and protect files](deploy-aip-scanner.md).

## Run a discovery cycle and view reports for the scanner

Use the following procedure after you've [configured and installed your scanner](deploy-aip-scanner-configure-install.md) to get an initial understanding of your content.

Perform these steps again as needed when your content changes.

1. In the Azure portal, on the **Azure Information Protection - Content scan jobs** pane, select your content scan jobs, and then select the **Scan now** option:

    ![Initiate scan for the Azure Information Protection scanner](./media/scanner-scan-now.png)

    Alternatively, in your PowerShell session, run the following command:

    ```PowerShell
    Start-AIPScan
    ```

1. Wait for the scanner to complete its cycle. The scan completes when the scanner has crawled through all the files in the specified data stores.

    Do any of the following to monitor scanner progress:

    - **Refresh the scan jobs.**  On the **Azure Information Protection - Content scan jobs** pane, select **Refresh**.

        Wait until you see values for the **LAST SCAN RESULTS** column and the **LAST SCAN (END TIME)** column.

    - **Use a PowerShell command.** Run `Get-AIPScannerStatus` to monitor the status change.

1. When the scan is complete, review the reports stored in the **%*localappdata*%\Microsoft\MSIP\Scanner\Reports** directory.

    - The .txt summary files include the time taken to scan, the number of scanned files, and how many files had a match for the information types.

    - The .csv files have more details for each file. This folder stores up to 60 reports for each scanning cycle and all but the latest report is compressed to help minimize the required disk space.

[Initial configurations](deploy-aip-scanner-configure-install.md#configure-the-scanner-in-the-azure-portal) instruct you to set the **Info types to be discovered** to **Policy only**. This configuration means that only files that meet the conditions you've configured for automatic classification are included in the detailed reports.

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

    ```PowerShell
    Stop-AIPScan 
    ```

## Rescanning files

For the [first scan cycle](#run-a-discovery-cycle-and-view-reports-for-the-scanner), the scanner inspects all files in the configured data stores. For subsequent scans, only new or modified files are inspected.

Inspecting all files again is typically useful when you want the reports to include all files, when you have changes that you want to apply across all files, and when the scanner runs in discovery mode.

**To manually run a full rescan:**

1. Navigate to the **Azure Information Protection - Content scan jobs** pane in the Azure portal.

1. Select your content scan job from the list, and then select the **Rescan all files** option:

    ![Initiate rescan for the Azure Information Protection scanner](./media/scanner-rescan-files.png)

When a full scan is complete, the scan type automatically changes to incremental so that for subsequent scans, only new or modified files are scanned again.

> [!TIP]
> If you've made changes to your AIP [content scan job](deploy-aip-scanner-configure-install.md#create-a-content-scan-job), the Azure portal will prompt you to skip a full rescan. To ensure that your rescan occurs, make sure to select **No** in the prompt that appears.
> 
### Trigger a full rescan by modifying your settings (versions 2.7.101.0 and lower)

In scanner versions [2.7.101.0](rms-client/unifiedlabelingclient-version-release-history.md#version-271010) and lower, all files are scanned whenever the scanner detects new or changed settings for automatic and recommended labeling. The scanner automatically refreshes the policy every four hours.

To refresh the policy sooner, such as while testing, manually delete the contents of the **%LocalAppData%\Microsoft\MSIP\mip\<processname>\mip** directory and restart the Azure Information Protection service.

If you've also changed protection settings for your labels, wait an extra 15 minutes from when you saved the updated protection settings before restarting the Azure Information Protection service.

> [!IMPORTANT]
> If you've upgraded to version [2.8.85.0](rms-client/unifiedlabelingclient-version-release-history.md#version-28850) or later, AIP skips the full rescan for updated settings to ensure consistent performance. If you've upgraded, make sure to [run a full rescan manually](#rescanning-files) as needed. 
>
> For example, if you’ve changed **Policy enforcement** settings from **Enforce = Off** to **Enforce = On,** make sure to run a full rescan to apply your labels across your content.
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

```PowerShell
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

## Next steps

- Interested in how the Core Services Engineering and Operations team in Microsoft implemented this scanner?  Read the technical case study: [Automating data protection with Azure Information Protection scanner](https://www.microsoft.com/itshowcase/Article/Content/1070/Automating-data-protection-with-Azure-Information-Protection-scanner).

- You can also use PowerShell to interactively classify and protect files from your desktop computer. For more information about this and other scenarios that use PowerShell, see [Using PowerShell with the Azure Information Protection unified labeling client](./rms-client/clientv2-admin-guide-powershell.md).