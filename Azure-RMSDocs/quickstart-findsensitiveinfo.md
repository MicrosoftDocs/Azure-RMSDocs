---
title: Quickstart - Find sensitive info with the Azure Information Protection scanner
description: Use the Azure Information Protection scanner to find what sensitive information you have in files stored on-premises.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 11/10/2020
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
#Customer intent: As an administrator, I want to find what sensitive information my organization stores on-premises
---

# Quickstart: Find what sensitive information you have in files stored on-premises

>***Applies to**: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*
>
> ***Relevant for**: [Azure Information Protection classic client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

>[!NOTE]
> To provide a unified and streamlined customer experience, **Azure Information Protection classic client** and **Label Management** in the Azure Portal are being **deprecated** as of **March 31, 2021**. This time-frame allows all current Azure Information Protection customers to transition to our unified labeling solution using the Microsoft Information Protection Unified Labeling platform. Learn more in the official [deprecation notice](https://aka.ms/aipclassicsunset).

In this quickstart, you'll enable SharePoint to allow scanning, and also install and configure the Azure Information Protection scanner to find any sensitive data you have stored in an on-premises data store.

**Time required:** You can finish this configuration in less than 15 minutes.

## Prerequisites

To complete this quickstart, you need:

|Requirement  |Description  |
|---------|---------|
|**A supporting subscription**     |  You'll need a subscription that includes [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection/). </br></br>If you don't have one of these subscriptions, you can create a [free](https://admin.microsoft.com/Signup/Signup.aspx?OfferId=87dd2714-d452-48a0-a809-d2f58c4f68b7) account for your organization.       |
|**Client installed**    |   You'll need the classic or unified labeling client installed on your computer. </br></br>- To install the unified labeling client, go the [Microsoft download center](https://www.microsoft.com/download/details.aspx?id=53018) and download **AzInfoProtection_UL.exe** from the Azure Information Protection page. </br>- To deploy the AIP classic client, open a support ticket to get download access.       |
|**SQL Server Express**     | You'll need SQL Server Express installed on your computer. </br></br> To install, go to the [Microsoft Download Center](https://www.microsoft.com/sql-server/sql-server-editions-express) and select **Download now** under the Express option. In the installer, select the **Basic** installation type.        |
|**Azure AD**     |  Your domain account must be synchronized to Azure AD. </br></br>If you're not sure about your account, contact one of your system administrators.      |
|**SharePoint access**     | To enable a SharePoint scan, you'll need access and permissions to your SharePoint policy. |
| | |

## Prepare a test folder and file

For an initial test to confirm that the scanner is working:

1. Create a new folder on an accessible network share. For example, name this folder **TestScanner**.

1. Create and save a Word document in that folder, which has the text **Credit card: 4242-4242-4242-4242**.

## Permission users to scan SharePoint repositories

To use the scanner across SharePoint repositories, specify the site URL for Azure Information Protection to discover all sites under that URL and scan them.

To enable scans across repositories, add the following SharePoint permissions for the user you intend to use to scan:

1. Open SharePoint, and select **Permission Policy** and select **Add Permission Policy Level**.

    ![Create new permissions policy level for a specific user](./media/aip-quick-set-sp-permissions.png)

1. Under **Site Collection Permissions**, select the **Site Collector Auditor** option.

1. Under **Permissions**, select **Grant** for the **View Application Pages** option and **Save** your changes.  

    ![Select Site Collector Auditor and permissions options for a specific user](./media/aip-quick-set-site-permissions.png)

1. After confirming your changes, click **OK** in the **Policy for Web Application** message that opens.

1. In the **Add Users** page, add the user you intend to use for scanning in the **Choose users** field. Under **Choose Permissions**, select the **site collection** option and then click **Finish** to apply the permissions you created to the user you added or selected.

    ![Add user to new permissions options](./media/aip-quick-set-user-permissions.png)

## Configure a profile for the scanner

Before you install the scanner, create a profile for it in the Azure portal. This profile contains scanner settings and locations of the data repositories to scan.

1. Open a new browser window and [sign in to the Azure portal](configure-policy.md#signing-in-to-the-azure-portal). Then navigate to the **Azure Information Protection** pane.

    For example, in the search box for resources, services, and docs: Start typing **Information** and select **Azure Information Protection**.

1. Locate the **Scanner** options from the left pane, and select **Profiles**.

1. On the **Azure Information Protection - Profiles** pane, select **Add**:

    :::image type="content" source="media/scanner-add-profile.png" alt-text="Add profile for the Azure Information Protection scanner":::

1. On the **Add a new profile** pane, specify a name for the scanner that is used to identify its configuration settings and data repositories to scan. For example, for this quickstart, you might specify **Quickstart**. When you later install the scanner, you will need to specify the same profile name.

    Optionally, specify a description for administrative purposes, to help you identify the scanner's profile name.

1. Locate the **Policy enforcement** section, where for this quickstart, select just one setting: For **Enforce**, select **Off**. Then select **Save** but do not close the pane.

    The settings configure the scanner to do a one-time discovery of all files in your specified data repositories. This scan looks for all known sensitive information types, and doesn't require you to first configure your Azure Information Protection labels or policy settings.

1. Now that the profile is created and saved, you're ready to return to the **Configure repositories** option to specify your network folder as the data store to be scanned.

    Still on the **Add a new profile** pane, select **Configure repositories** to open the **Repositories** pane:

    :::image type="content" source="./media/scanner-repositories-bar.png" alt-text="Configure data repositories for the Azure Information Protection scanner":::

1. On the **Repositories** pane, select **Add**:

    :::image type="content" source="media/scanner-repository-add.png" alt-text="Add data repository for the Azure Information Protection scanner":::

1. On the **Repository** pane, specify the folder that you created earlier. For example: `\\server\TestScanner`

    For the remaining settings on this pane, do not change them but keep them as **Profile default**, which means that the data repository inherits the settings from the scanner profile.

    Select **Save**.

1. Back on the **Azure Information Protection - Profiles** pane, you now see your profile  listed, together with the **SCHEDULE** column showing **Manual** and the **ENFORCE** column is blank.

    The **NODES** column shows **0** because you haven't yet installed the scanner for this profile.

You're now ready to install the scanner with the scanner profile that you've created.

## Install the scanner

1. Open a PowerShell session with the **Run as an administrator** option.

1. Use the following command to install the scanner, specifying the name of your network share and the profile name that you saved in the Azure portal:

    ```ps
    Install-AIPScanner -SqlServerInstance <your network share name>\SQLEXPRESS -Profile <profile name>
    ```

    When you're prompted, provide your own credentials for the scanner by using the \<domain\user name> format, and then your password.

## Start the scan and confirm it finished

1. Back in the Azure portal, refresh the **Azure Information Protection - Profiles** pane, and you should see the **NODES** column now display **1**.

1. Select your profile name, and then the **Scan now** option:

    :::image type="content" source="media/scanner-scan-now.png" alt-text="Initiate scan for the Azure Information Protection scanner":::

    If this option is not available after selecting your profile, the scanner is not connected to Azure Information Protection. Review your configuration and internet connectivity.

1. There's only one small file to inspect, so this initial test scan will be quick:

    Wait until you see values displayed for the **LAST SCAN RESULTS** and **LAST SCAN (END TIME)** columns.

> [!TIP]
> Alternatively, for the scanner from the classic client only:
>
> Check the local Windows **Applications and Services** event log, **Azure Information Protection**. Confirm the informational event ID **911** for the **MSIP.Scanner** process. The event log entry also has a summary of results from the scan.
>
## See detailed results

Using File Explorer, locate the scanner reports in **%*localappdata*%\Microsoft\MSIP\Scanner\Reports.** Open the detailed report file that has a **.csv** file format.

In Excel:

- The first two columns display your data store repository and file name.
- As you look through the columns, you'll see one named **Information Type Name**, which is the column you're most interested in.

    For our initial test, it displays **Credit Card Number**, one of many sensitive information types that the scanner can find.

## Scan your own data

1. Edit your scanner profile and add a new data repository, this time specifying your own on-premises data store that you want to scan for sensitive information.

    Specify a network share (UNC path) or a SharePoint Server URL for a SharePoint site or library.

    For example:

    - **For a network share**: `\\NAS\HR`
    - **For a SharePoint folder**: `http://sp2016/Shared Documents`

1. Restart the scanner again.

    From the **Azure Information Protection - Profiles** pane, make sure your profile is selected, and then select the **Scan now** option:

    :::image type="content" source="media/scanner-scan-now.png" alt-text="Initiate scan for the Azure Information Protection scanner":::

1. View the new results when the scan is complete.

    How long this scan takes depends on how many files there are in your data store, how large those files are, and the type of file.

## Clean up resources

In a production environment, you would run the scanner on a Windows Server, using a service account that silently authenticates to the Azure Information Protection service. You would also use an enterprise-grade version of SQL Server, and likely specify several data repositories.

To clean up resources and make your system ready for a production deployment, in your PowerShell session, run the following command to uninstall the scanner:

```ps
Uninstall-AIPScanner
```

Then restart your computer.

This command doesn't remove the following items and you must manually remove them if you don't want them after this quickstart:

- The SQL Server database that was created by running the Install-AIPScanner cmdlet when the Azure Information Protection scanner was installed: **AIPScanner_\<profile>**

- The scanner reports located in **%*localappdata*%\Microsoft\MSIP\Scanner\Reports.**

- The **Log on as a service** user right assignment that your domain account was granted for your local computer.

## Next steps

This quickstart includes the minimum configuration so that you can quickly see how the scanner can find sensitive information in on-premises data stores. If you're ready to install the scanner in a production environment, see [Deploying the Azure Information Protection scanner to automatically classify and protect files](deploy-aip-scanner.md).

If you want to classify and protect the files that contain sensitive information, you must configure labels for automatic classification and protection:

- [How to configure conditions for automatic and recommended classification for Azure Information Protection](configure-policy-classification.md)
- [How to configure a label for Rights Management protection](configure-policy-protection.md)
