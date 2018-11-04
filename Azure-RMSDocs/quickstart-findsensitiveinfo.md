---
title: Quickstart - Find what sensitive information you have in files stored on-premises by using the Azure Information Protection scanner
description: Use the Azure Information Protection scanner to find what sensitive information you have in files stored on-premises.
author: cabailey
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 11/05/2018
ms.topic: quickstart
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: demizets
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:
#Customer intent: As an administrator, I want to find what sensitive information my organization stores on-premises
---

# Quickstart: Find what sensitive information you have in files stored on-premises

In this quickstart, you'll install and configure the Azure Information Protection scanner to find what sensitive information you have in files that are stored in an on-premises data store. For example, a local folder, network share, or SharePoint Server. 

You can finish this configuration in less than 10 minutes.

## Prerequisites

To complete this quickstart, you need:

1. A subscription that includes Azure Information Protection Plan 1 or Plan 2.
    
    If you don't have one of these subscriptions, you can create a [free](https://portal.office.com/Signup/Signup.aspx?OfferId=87dd2714-d452-48a0-a809-d2f58c4f68b7) account for your organization.

2. The Azure Information Protection client is installed on your computer. 
    
    To install the client, go to the [Microsoft download center](https://www.microsoft.com/en-us/download/details.aspx?id=53018) and download **AzInfoProtection.exe** from the Azure Information Protection page.
    
3. SQL Server Express is also installed on your computer.
    
    If this SQL Server edition isn't already installed, you can download it from the [Microsoft Download Center](https://www.microsoft.com/en-us/sql-server/sql-server-editions-express) and select a Basic installation.

4. Your domain account is synchronized to Azure AD.

For a full list of prerequisites to use Azure Information Protection, see [Requirements for Azure Information Protection](requirements.md).

## Prepare a test folder and file

For an initial test to confirm that the scanner is working:

1. Create a local folder on your computer. For example, **TestScanner** on your local C drive.

2. Create and save a Word document in that folder, which has the text **4242-4242-4242-4242** (a known credit card number for testing).

## Install the scanner

1. Open a PowerShell session with the **Run as an administrator** option.

2. Use the following command to install the scanner, specifying your own computer name:
    
    	Install-AIPScanner -SqlServerInstance <your computer name>\SQLEXPRESS
    
    When you're prompted, provide your own credentials for the scanner by using the \<domain\user name> format, and then your password. 

## Specify your test data store

In your PowerShell session, type the following command:

	Add-AIPScannerRepository -Path C:\TestScanner

## Configure the scanner to discover all information types

In your PowerShell session, type the following command:

	Set-AIPScannerConfiguration -Enforce Off -Schedule Manual -DiscoverInformationTypes All

This command configures the scanner to do a one-time discovery of all files in your specified data repository. This scan looks for all known sensitive information types, and doesn't require you to first configure your Azure Information Protection labels or policy settings.

## Start the scan and confirm it finished

1. In your PowerShell session, type the following command to start the scanner:
    
    	Start-AIPScan
    
    There's only one small file to inspect, so this initial test scan will be very quick. 

2. Go to your Windows **Event Viewer** > **Applications and Services** > **Azure Information Protection** event log. 
    
    Confirm that Azure Information Protection shows the informational event ID **911** for the **MSIP.Scanner** process. The event log entry also has a summary of results from the scan.

## See detailed results

Using File Explorer, locate the scanner reports in %*localappdata*%\Microsoft\MSIP\Scanner\Reports. Open the detailed report file that has a .csv file format.

In Excel, the first two columns display your data store repository and file name. As you look through the columns, you'll see one named **Information Type Name**, which is the column you're most interested in. For our initial test, it displays **Credit Card Number**, one of many sensitive information types that the scanner can find.

## Scan your own data

1. Run Add-AIPScannerRepository again, this time specifying your own on-premises data store that you want to scan for sensitive information. 
    
    You can specify a local folder, a network share (UNC path), or a SharePoint Server URL for a SharePoint site or library. 
    
    - Example for a local folder:
        
        	Add-AIPScannerRepository -Path D:\Data\Finance
    
    - Example for a network share
        
        	Add-AIPScannerRepository -Path \\NAS\HR
    
    - Example for a SharePoint folder:
        
        	Add-AIPScannerRepository -Path "http://sp2016/Shared Documents"

2. Restart the scanner:
    
    	Start-AIPScan

3. View the new results when the scan is complete. 
    
    How long this scan takes depends on how many files there are in your data store, how large those files are, and the type of file. 

## Clean up resources

In a production environment, you would run the scanner on a Windows Server, using a service account that silently authenticates to the Azure Information Protection service. You would also use an enterprise-grade version of SQL Server, and likely specify several data repositories. 

To clean up resources, ready for that production deployment, in your PowerShell session, run the following command to uninstall the scanner:

	Uninstall-AIPScanner

Then restart your computer.

This command doesn't remove the following items and you must manually remove them if you don't want them after this quickstart:

- The SQL Server database that was created by running the Install-AIPScanner cmdlet when the Azure Information Protection scanner was installed. 

- The scanner reports located in %*localappdata*%\Microsoft\MSIP\Scanner\Reports.

- The **Log on as a service** user right assignment that your domain account was granted for your local computer.


## Next steps

This quickstart includes the minimum configuration so that you can quickly see how the scanner can find sensitive information in a network share. If you're ready to install the scanner in a production environment, see [Deploying the Azure Information Protection scanner to automatically classify and protect files](deploy-aip-scanner.md).

If you want to classify and protect the files that contain sensitive information, you must configure Azure Information Protection labels for automatic classification and protection:

- [How to configure conditions for automatic and recommended classification for Azure Information Protection](configure-policy-classification.md)

- [How to configure a label for Rights Management protection](configure-policy-protection.md)