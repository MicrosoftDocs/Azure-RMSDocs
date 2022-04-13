---
title: Tutorial - Discovering your sensitive content with the Azure Information Protection (AIP) scanner
description: Use the Azure Information Protection (AIP) scanner to locate repositories that may be at risk. Then, drill down to scan those file shares for sensitive content.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 11/09/2020
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
#Customer intent: As an administrator, I want to discover what sensitive information my organization stores on-premises
---

# Tutorial: Discovering your sensitive content with the Azure Information Protection (AIP) scanner


The Azure Information Protection client provides an on-premises scanner that enables system administrators to scan on-premises file repositories for sensitive content. 

In this tutorial, you'll learn how to:

> [!div class="checklist"]
> * Create a network scan job and scan for risky repositories
> * Add any risky repositories found to a content scan job
> * Scan your content shares for sensitive content and understand results found

**Time required**: You can finish this configuration in 15 minutes.

## Tutorial prerequisites

|Requirement  |Description  |
|---------|---------|
|**A supporting subscription**     |  You'll need an Azure subscription that includes [Azure Information Protection](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection/). <br /><br />If you don't have one of these subscriptions, you can create a [free](https://admin.microsoft.com/Signup/Signup.aspx?OfferId=87dd2714-d452-48a0-a809-d2f58c4f68b7) account for your organization.       |
|**Admin access to the Azure portal** |Make sure that you can sign in to the [Azure portal](https://portal.azure.com/) with a supported administrator account, and have protection enabled. Supported administrator accounts include: <br /><br />- **Compliance administrator**<br />- **Compliance data administrator**<br />- **Security administrator**<br />- **Global administrator**   |
|**AIP client, scanner, and Network Discovery service**   |   To fully complete this tutorial, you'll need to have installed the Azure Information Protection unified labeling client and scanner, as well as the Network Discovery service (public preview). <br /><br />For more information, see: <br /><br />- [Quickstart: Deploying the Azure Information Protection (AIP) unified labeling client](quickstart-deploy-client.md) <br />- [Tutorial: Installing the Azure Information Protection (AIP) unified labeling scanner](tutorial-install-scanner.md) |
|**A content scan job** | Make sure you have a basic content scan job that you can use for testing. You may have created one when you [installed your scanner](tutorial-install-scanner.md).<br /><br />If you need to create one now, you can use the instructions in [Configure Azure Information Protection in the Azure portal](tutorial-install-scanner.md#configure-azure-information-protection-in-the-azure-portal). When you have a basic content scan job, return here to complete this tutorial. |
|**SQL Server**     | To run the scanner, you'll need SQL Server installed on the scanner machine. <br /><br /> To install, go to the [SQL Server download page](https://www.microsoft.com/sql-server/sql-server-downloads) and select **Download now** under the installation option you want to install. In the installer, select the **Basic** installation type. <br /><br />**Note**: We recommend installing SQL Server Enterprise for production environments, and Express only for testing.    |
|**Azure Active Directory account**     |  When working with a standard, cloud-connected environment, your domain account must be synchronized to [Azure Active Directory](https://azure.microsoft.com/services/active-directory/). This isn't necessary if you're working offline. <br /><br />If you're not sure about your account, contact one of your system administrators to verify the synch status. For more information, see [Deploying the scanner with alternative configurations](deploy-aip-scanner-prereqs.md#deploying-the-scanner-with-alternative-configurations).  |
|**Sensitivity labels and a published policy** |You must have created sensitivity labels, and published a policy with at least one label to the Microsoft 365 compliance center, for the scanner service account. <br /><br />Configure sensitivity labels in the Microsoft 365 compliance center. For more information, see the [Microsoft 365 documentation](/microsoft-365/compliance/create-sensitivity-labels). |

## Define and run your content scan job

Use the content scan job you prepared with the [tutorial prerequisites](#tutorial-prerequisites) to scan your content. 

If you don't have a content scan job yet, perform [Configure initial settings in the Azure portal](tutorial-install-scanner.md#configure-initial-scanner-settings-in-the-azure-portal), and then return here to continue.


1. Sign in to the [Azure portal](https://portal.azure.com/) as a [supported administrator](#tutorial-prerequisites), and navigate to the **Azure Information Protection** pane.
        
1. In the **Scanner** menu on the left, and select :::image type="icon" source="media/i-content-scan-jobs.png" border="false"::: **Content scan jobs**, and then select your content scan job.
 
1. Edit your content scan job settings, making sure that you have a meaningful name and optional description. 

    Keep the default values for most of the settings, except for the following changes:

    -  **Treat recommended labeling as automatic**. Set to **On**.
    
    - **Configure repositories**. Ensure that there is at least one repository defined. 

    - **Enforce**. Set to **On**
    
1. Select :::image type="icon" source="media/qs-tutor/save-icon.png" border="false"::: **Save**, and then return to the :::image type="icon" source="media/i-content-scan-jobs.PNG" border="false"::: **Content scan jobs** grid.

1. To scan your content, go back to the :::image type="icon" source="media/i-content-scan-jobs.png" border="false"::: **Content scan jobs** area, and select your content scan job.

    In the toolbar above the grid, select :::image type="icon" source="media/i-scan-now.PNG" border="false"::: **Scan now** to start the scan.

    When the scan is complete, continue with [View scan results](#view-scan-results).

## View scan results

When the scan is complete, check the reports in **Azure Information Protection > Analytics** area  in the Azure portal.

For example:

:::image type="content" source="media/qs-tutor/content-scan-job-data-discovery.PNG" alt-text="Scanner results Analytics Data discovery report":::
    
> [!TIP]
> If your results are empty and you would like to run a meaningful scan, create a file named **Payment info** in one of the repositories included in your content scan job. Save the file with the following content:
> 
> **Credit card**: 2384 2328 5436 3489
>
> Run your scan again to see the difference in the results.
> 

For more information, see [Central reporting for Azure Information Protection (public preview)](reports-aip.md)

### Local scanner reports

Logs are also stored locally in the **%localappdata%\Microsoft\MSIP\Scanner\Reports directory** on the scanner machine, and include:

|Type  |Description  |
|---------|---------|
|**.txt summary files**     |  Includes the time taken to scan, the number of scanned files, and how many files had a match for the information types.       |
|**.csv detail files**     | Contains detailed descriptions for each file scanned. The directory can hold up to 60 reports for each scanning cycle.         |

## Next steps

For more information, see:

- [Tutorial: Preventing oversharing using Azure Information Protection (AIP)](/azure/information-protection/tutorial-scan-networks-and-content)
- [What is the Azure Information Protection unified labeling scanner?](deploy-aip-scanner.md)
- [Prerequisites for installing and deploying the Azure Information Protection unified labeling scanner](deploy-aip-scanner-prereqs.md)
- [Configuring and installing the Azure Information Protection unified labeling scanner](deploy-aip-scanner-configure-install.md)
- [Running the Azure Information Protection scanner](deploy-aip-scanner-manage.md)
