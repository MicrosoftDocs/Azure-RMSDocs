---
title: Quickstart - Scanning your network for risky repositories with the Azure Information Protection (AIP) scanner
description: Use the Azure Information Protection (AIP) unified labeling scanner to find repositories across your network shares that may be at risk, and would benefit from additional scanning.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 09/01/2020
ms.topic: quickstart
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
#Customer intent: As an administrator, I want to find repositories across my network shares that would benefit from additional scanning

---

# Quickstart: Scanning your network for risky repositories (Public preview)

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*
>
> *Instructions for the [Azure Information Protection unified labeling client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

In this quickstart, you'll run a network scan job to scan a specific IP address or IP range for repositories that are open to the public and may have sensitive content at risk.

Use the information in the reports generated to understand which repositories to add to your content scan jobs for deeper scanning.

**Time required:** You can finish this quickstart in less than 15 minutes.

## Quickstart prerequisites

> [!NOTE]
> The examples in this quickstart are based on the elements built in the previous quickstart: [Installing the Azure Information Protection (AIP) unified labeling client and scanner](quickstart-install-client-scanner.md).      
>
|Requirement  |Description  |
|---------|---------|
|**A supporting subscription**     |  You'll need an Azure subscription that includes [Azure Information Protection Plan 1 or Plan 2](https://azure.microsoft.com/pricing/details/information-protection/). </br></br>If you don't have one of these subscriptions, you can create a [free](https://admin.microsoft.com/Signup/Signup.aspx?OfferId=87dd2714-d452-48a0-a809-d2f58c4f68b7) account for your organization.       |
|**Access to Azure Information Protection in the Azure portal** |Make sure that you can sign in to the [Azure portal](https://portal.azure.com/) with a supported administrator account, and have protection enabled. Supported administrator accounts include: </br>- **Compliance administrator**</br>- **Compliance data administrator**</br>- **Security administrator**</br>- **Global administrator** </br></br>For more information, see [Quickstart: Installing the Azure Information Protection (AIP) unified labeling client and scanner](quickstart-install-client-scanner.md).  |
| **Azure Information Protection analytics**|Make sure that you have [Azure Information Protection analytics](reports-aip.md) enabled.  In the Azure portal, go to **Azure Information Protection > Manage > Configure analytics (Preview)**.   |
|**AIP client and scanner**   |   To complete this quickstart, you'll need to have installed the Azure Information Protection unified labeling client and scanner. </br></br>For more information, see [Quickstart: Installing the Azure Information Protection (AIP) unified labeling client and scanner](quickstart-install-client-scanner.md). |
|**SQL Server Express**     | To run the scanner, you'll need SQL Server Express installed on the machine where you want to install the scanner. </br></br> To install, go to the [Microsoft Download Center](https://www.microsoft.com/sql-server/sql-server-editions-express) and select **Download now** under the **Express** option. In the installer, select the **Basic** installation type.        |
|**Azure Active Directory account**     |  Your domain account must be synchronized to [Azure Active Directory](https://azure.microsoft.com/services/active-directory/). </br></br>If you're not sure about your account, contact one of your system administrators.      |
| | | 

## Install the Network Discovery service

AIP network scan jobs require you to install the additional Network Discovery service on the scanner computer. This service is supported only in [versions 2.8.85 (Public preview)](rms-client/unifiedlabelingclient-version-release-history.md#version-2885-public-preview) and higher of the unified labeling client.

**To install the Network Discovery service:**

On the scanner computer, open a PowerShell session as an administrator.

Then run the following commands, to first get the credentials you want the Network Discovery service to use when scanning the network, and the install the service:

1. Define the credentials you want to use for Network Discovery. 

    For example, run the following commands:

    ``` PowerShell 
    $serviceacct= Get-Credential 
    ``` 
    When prompted, enter the credentials for the account you want to use to run the Network Discovery service.

    ``` PowerShell 
    $shareadminacct= Get-Credential 
    ``` 
    When prompted, enter the credentials for the admin account you want to use to simulate administrator access during your network scan job.

    ``` PowerShell  
    $publicaccount= Get-Credential 
    ``` 
    When prompted, enter the credentials for the account you want to use to simulate public access during your network scan job.

1. Run the following to install the Network Discovery service:

    ```PowerShell
    Install-AIPScanner [-ServiceUserCredentials] <PSCredential> [-SqlServerInstance] <String> [- Cluster <String>] [<CommonParameters>]
    ```

    For example:

    ```PowerShell
    Install-MIPNetworkDiscovery -SqlServerInstance SQLSERVER1\SQLEXPRESS -Cluster Quickstart -ServiceUserCredentials $serviceacct  -ShareAdminUserAccount $shareadminacct -StandardDomainsUserAccount $publicaccount
 
    ```

When the system confirms that the installation has completed successfully, continue with  [Create a network scan job](#create-a-network-scan-job) in the Azure portal.

## Create a network scan job

Create a network scan job to scan a specified IP address or IP range for risky repositories. 

**To create a network scan job:**

1. [Sign in to the Azure portal](configure-policy.md#signing-in-to-the-azure-portal), and navigate to the **Azure Information Protection** pane. 
    
    For example, in the search box for resources, services, and docs: Start typing **Information** and select **Azure Information Protection**.
    
1. In the **Scanner** menu on the left, select :::image type="icon" source="media/qs-tutor/i-network-scan-jobs.png" border="false"::: **Network scan jobs (Preview)**.

1. Click :::image type="icon" source="media/i-add.PNG" border="false"::: **Add** to add a new job. In the **Add a new network scan job** pane, enter the following details:
    
    |Option  |Description  |
    |---------|---------|
    |**Network scan job name** and **Description**     |Enter a meaningful name, such as `Quickstart`, and an optional description.         |
    |**Select the cluster**     | From the dropdown, select **Quickstart** to use the cluster you installed in [the previous quickstart](quickstart-install-client-scanner.md).       |
    |**Configure IP ranges to discover**     | Click the row to open the **Choose IP ranges** pane. There, enter an IP address or IP range to scan. </br>**Note**: Make sure to enter IP addresses that are accessible from the scanner's machine.      |
    |**Set schedule**     | Keep the default value of **One Time**.        |
    |**Row5**     |         |
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

## Add risky repositories to a content scan job

Once your network scan job is complete, you can check for any risky repositories found. For example, you may want to add any repositories found with public read or read/write access to a content scan job, and further scan for sensitive content.

> [!TIP]
> Scanning for sensitive content also enables you to automatically label that content, classifying and protecting it as configured by your organization's policy.
> 

1. In the **Scanner** menu on the left, select :::image type="icon" source="media/qs-tutor/i-repos.png" border="false"::: **Repositories (Preview)**.

    :::image type="content" source="media/small/risky-repos-small.png" alt-text="View repositories from your network scan job" lightbox="media/qs-tutor/risky-repos.png":::

1. In the grid below the graphs, locate a repository that is not yet managed by the scanner. Not being managed by the scanner means that they are not included in a content scan job, and are not being scanned for sensitive content.

    > [!TIP]
    > For example, repositories that have **Effective Public Access** found to be **R** (read) or **RW** (read/write) are available to the public and may have sensitive content at risk.
    > 

1. Select the row, and then above the grid, select :::image type="icon" source="media/i-add.PNG" border="false"::: **Assign Selected Items**. 

1. In the **Assign to Content Scan Job** pane that appears on the right, select your content scan job from the dropdown list, and then click :::image type="icon" source="media/qs-tutor/save-icon.png" border="false"::: **Save**.

    :::image type="content" source="media/qs-tutor/assign-content-scan-job.png" alt-text="Assign a risky repository to a content scan job":::

The next time your content scan job runs, it will now include this newly discovered repository, and identify, label, classify and protect any sensitive content found, as configured in your policy.

## Next steps

To configure additional details in your content scan job and run the scan, continue with [Quickstart: Finding your sensitive content with the Azure Information Protection (AIP) scanner](quickstart-scan-content.md).

**See also:**

- [What is the Azure Information Protection unified labeling scanner?](deploy-aip-scanner.md)
- [Prerequisites for installing and deploying the Azure Information Protection unified labeling scanner](deploy-aip-scanner-prereqs.md)
- [Configuring and installing the Azure Information Protection unified labeling scanner](deploy-aip-scanner-configure-install.md)
- [Running the Azure Information Protection scanner](deploy-aip-scanner-manage.md)