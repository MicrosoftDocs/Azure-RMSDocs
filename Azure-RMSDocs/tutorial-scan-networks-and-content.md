---
title: Tutorial - Finding your sensitive content with the Azure Information Protection (AIP) scanner
description: Use the Azure Information Protection (AIP) scanner to locate repositories that may be at risk. Then, drill down to scan those file shares for sensitive content.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 10/11/2020
ms.topic: tutorial
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: demizets
#ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin
ms.subservice: aiplabels
#Customer intent: As an administrator, I want to find what sensitive information my organization stores on-premises
---

# Tutorial: Finding your sensitive content with the Azure Information Protection (AIP) scanner

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*
>
> *Instructions for: [Azure Information Protection classic or unified labeling clients for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

The Azure Information Protection client provides a scanner that enables system administrators to scan networks and file shares for sensitive content. 

In this tutorial, you'll learn how to:

> [!div class="checklist"]
> * Install the Network Discovery service
> * Create a network scan job and scan for risky repositories
> * Add any risky repositories found to a content scan job
> * Scan your content shares for sensitive content and understand results found

> [!NOTE]
> Network Discovery is available only starting in version [2.8.85.0 ](rms-client/unifiedlabelingclient-version-release-history.md#version-2885-public-preview) of the unified labeling scanner, and is in public preview. If you do not have this version of the client and scanner installed, review the [tutorial prerequisites](#tutorial-prerequisites) and then go straight to [Define and run your content scan job](#define-and-run-your-content-scan-job).
> 

**Time required:** You can finish this configuration in less than 15 minutes.

## Tutorial prerequisites

|Requirement  |Description  |
|---------|---------|
|**A supporting subscription**     |  You'll need an Azure subscription that includes [Azure Information Protection Plan 1 or Plan 2](https://azure.microsoft.com/pricing/details/information-protection/). </br></br>If you don't have one of these subscriptions, you can create a [free](https://admin.microsoft.com/Signup/Signup.aspx?OfferId=87dd2714-d452-48a0-a809-d2f58c4f68b7) account for your organization.       |
|**Admin access to the Azure portal** |Make sure that you can sign in to the [Azure portal](https://portal.azure.com/) with a supported administrator account, and have protection enabled. Supported administrator accounts include: </br></br>- **Compliance administrator**</br>- **Compliance data administrator**</br>- **Security administrator**</br>- **Global administrator**   |
|**AIP client and scanner**   |   To complete this tutorial, you'll need to have installed the Azure Information Protection unified labeling client and scanner, as well as the Network Discovery service. </br></br>For more information, see: </br></br>- [Quickstart: Deploying the Azure Information Protection (AIP) unified labeling client](quickstart-deploy-client.md) </br>- [Quickstart: Installing the Azure Information Protection (AIP) unified labeling scanner](quickstart-install-scanner.md) |
|**A content scan job** | Make sure you have a basic content scan job that you can use for testing. You may have created one when you [installed your scanner](quickstart-install-scanner.md).</br></br>If you need to create one now, you can use the instructions in [Configure Azure Information Protection in the Azure portal](quickstart-install-scanner.md#configure-azure-information-protection-in-the-azure-portal). When you have a basic content scan job, return here to complete this tutorial. |
|**SQL Server**     | To run the scanner, you'll need SQL Server installed on the scanner machine. </br></br> To install, go to the [Microsoft Download Center](https://www.microsoft.com/sql-server/sql-server-editions-express) and select **Download now** under the installation option you want to install. In the installer, select the **Basic** installation type. </br></br>**Note**: We recommend installing SQL Server Enterprise for production environments.       |
|**Azure Active Directory account**     |  Your domain account must be synchronized to [Azure Active Directory](https://azure.microsoft.com/services/active-directory/). </br></br>If you're not sure about your account, contact one of your system administrators to verify the synch status.       |
| | | 

When you're ready, continue with [Install the Network Discovery service](#install-the-network-discovery-service).

## Create a network scan job

Create a network scan job to scan a specified IP address or IP range for risky repositories.

> [!NOTE]
> This feature is available only starting in version [2.8.85.0](rms-client/unifiedlabelingclient-version-release-history.md#version-2885-public-preview), and is currently in public preview.
> 

**To create a network scan job:**

1. Sign in to the [Azure portal](https://portal.azure.com/) as a [supported administrator](#tutorial-prerequisites), and navigate to the **Azure Information Protection** area.
        
1. In the **Scanner** menu on the left, select :::image type="icon" source="media/qs-tutor/i-network-scan-jobs.png" border="false"::: **Network scan jobs (Preview)**.

1. Select :::image type="icon" source="media/i-add.PNG" border="false"::: **Add** to add a new job. In the **Add a new network scan job** pane, enter the following details:
    
    |Option  |Description  |
    |---------|---------|
    |**Network scan job name** and **Description**     |Enter a meaningful name, such as `Quickstart`, and an optional description.         |
    |**Select the cluster**     | Select your cluster name from the dropdown list.</br></br> For example, if you've completed [Quickstart: Installing the Azure Information Protection (AIP) unified labeling scanner](quickstart-install-scanner.md), and still have that cluster available, select **Quickstart**.       |
    |**Configure IP ranges to discover**     | Select the row to open the **Choose IP ranges** pane. There, enter an IP address or IP range to scan. </br></br>**Note**: Make sure to enter IP addresses that are accessible from the scanner's machine.      |
    |**Set schedule**     | Keep the default value of **One Time**.        |
    |**Set start time (UTC)**     |  Calculate the current UTC time, considering your current time zone, and set the start time to run within 5 minutes from now.     |
    |     |         |

    For example: 

    :::image type="content" source="media/qs-tutor/network-scan-job.png" alt-text="Enter details for your network scan job":::

1. Select :::image type="icon" source="media/qs-tutor/save-icon.png" border="false"::: **Save** at the top of the page.

1. Return to the :::image type="icon" source="media/qs-tutor/i-network-scan-jobs.png" border="false"::: **Network scan jobs (Preview)** grid, and wait for your scan to start running.

The grid data is updated as your scan completes. For example:

:::image type="content" source="media/qs-tutor/scanned-network.png" alt-text="Refreshed network scan jobs":::

> [!TIP]
> If your network scan job does not run, check to make sure that the [Network Discovery service is installed correctly](#install-the-network-discovery-service) on the scanner machine.

Continue with [Add risky repositories to a content scan job](#add-risky-repositories-to-a-content-scan-job).

## Add risky repositories to a content scan job

Once your network scan job is complete, you can check for any risky repositories found. 

For example, if a repository is found to have both read and write public access, you may want to scan further and confirm that no sensitive data is stored there.

> [!NOTE]
> This feature is available only starting in version [2.8.85.0](rms-client/unifiedlabelingclient-version-release-history.md#version-2885-public-preview), and is currently in public preview.
> 

**To add risky repositories to your content scan job**:

1. Sign in to the [Azure portal](https://portal.azure.com/) as a [supported administrator](#tutorial-prerequisites), and navigate to the **Azure Information Protection** pane.
        
1. In the **Scanner** menu on the left, select :::image type="icon" source="media/qs-tutor/i-repos.png" border="false"::: **Repositories (Preview)**.

    :::image type="content" source="media/small/risky-repos-small.png" alt-text="View repositories found by your network scan job" lightbox="media/qs-tutor/risky-repos.png":::

1. In the grid below the graphs, locate a repository that is not yet managed by the scanner. Not being managed by the scanner means that they are not included in a content scan job, and are not being scanned for sensitive content.

    > [!TIP]
    > For example, repositories that have **Effective Public Access** found to be **R** (read) or **RW** (read/write) are available to the public and may have sensitive content at risk.
    > 

1. Select the row, and then above the grid, select :::image type="icon" source="media/i-add.PNG" border="false"::: **Assign Selected Items**. 

1. In the **Assign to Content Scan Job** pane that appears on the right, select your content scan job from the dropdown list, and then select :::image type="icon" source="media/qs-tutor/save-icon.png" border="false"::: **Save**.

    For example:

    :::image type="content" source="media/qs-tutor/assign-content-scan-job.png" alt-text="Assign a risky repository to a content scan job":::

The next time your content scan job runs, it will now include this newly discovered repository, and identify, label, classify, and protect any sensitive content found, as configured in your policy.

Continue with [Define and run your content scan job](#define-and-run-your-content-scan-job).

## Define and run your content scan job

Use the content scan job you prepared with the [tutorial prerequisites](#tutorial-prerequisites) to scan your content. 

If you don't have a content scan job yet, perform [Configure initial settings in the Azure portal](quickstart-install-scanner.md#configure-initial-scanner-settings-in-the-azure-portal), and then return here to continue.


1. Sign in to the [Azure portal](https://portal.azure.com/) as a [supported administrator](#tutorial-prerequisites), and navigate to the **Azure Information Protection** pane.
        
1. In the **Scanner** menu on the left, and select :::image type="icon" source="media/i-content-scan-jobs.png" border="false"::: **Content scan jobs**, and then select your content scan job.
 
1. Edit your content scan job settings, making sure that you have a meaningful name and optional description. 

    Keep the default values for most of the settings, except for the following changes:

    -  **Treat recommended labeling as automatic**. Set to **On**.
    
    - **Configure repositories**. Ensure that there is at least one repository defined. 
    
        > [!TIP]
        > If you've added additional repositories to your content scan job after having scanned your network in [Add risky repositories to a content scan job](#add-risky-repositories-to-a-content-scan-job),  you can select to see them listed here now. 

    - **Enforce**. Set to **On**
    
1. Select :::image type="icon" source="media/qs-tutor/save-icon.png" border="false":::, and then return to the :::image type="icon" source="media/i-content-scan-jobs.PNG" border="false"::: **Content scan jobs** grid.

1. To scan your content, go back to the :::image type="icon" source="media/i-content-scan-jobs.png" border="false"::: **Content scan jobs** area, and select your content scan job.

    In the toolbar above the grid, select :::image type="icon" source="media/i-scan-now.PNG" border="false"::: **Scan now** to start the scan.

    When the scan is complete, continue with [View scan results](#view-scan-results).

### View scan results

When the scan is complete, check the reports in Analytics area of the Azure Information Protection blade in the Azure portal.

For more information, see [Central reporting for Azure Information Protection (public preview)](reports-aip.md)
    
> [!TIP]
> If your results are empty and you would like to run a meaningful scan, create a file named **Payment info** in one of the repositories included in your content scan job. Save the file with the following content:
> 
> **Credit card:** 2384 2328 5436 3489
>
> Run your scan again to see the difference in the results.
> 

Logs are also stored locally in the **%localappdata%\Microsoft\MSIP\Scanner\Reports directory** on the scanner machine, and include:

- **.txt summary files.** Includes the time taken to scan, the number of scanned files, and how many files had a match for the information types.
- **.csv detail files.** Contains detailed descriptions for each file scanned. The directory can hold up to 60 reports for each scanning cycle. 

## Next steps

For additional tutorials, see:

- [Tutorial: Migrating from the Azure Information Protection (AIP) classic client to the unified labeling client](tutorial-migrating-to-ul.md)
- [Tutorial: Preventing oversharing using Azure Information Protection (AIP)](tutorial-preventing-oversharing.md)

**See also:**

- [What is the Azure Information Protection unified labeling scanner?](deploy-aip-scanner.md)
- [Prerequisites for installing and deploying the Azure Information Protection unified labeling scanner](deploy-aip-scanner-prereqs.md)
- [Configuring and installing the Azure Information Protection unified labeling scanner](deploy-aip-scanner-configure-install.md)
- [Running the Azure Information Protection scanner](deploy-aip-scanner-manage.md)
