---
title: Quickstart - Install the Azure Information Protection (AIP) unified labeling scanner
description: Install the Azure Information Protection (AIP) unified labeling scanner to start understanding the sensitive data you have stored in your on-premises network shares.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 08/12/2020
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
#Customer intent: As an administrator, I want to install the AIP unified labeling scanner

---

# Quickstart: Installing the Azure Information Protection (AIP) unified labeling client and scanner

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*
>
> *Instructions for the [Azure Information Protection unified labeling client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*


In this quickstart, you'll install the Azure Information Protection (AIP) on-premises scanner. The scanner enables AIP administrators to scan their network data shares and repositories for sensitive data, and apply classification and protection labels as configured in their organization's policy.

**Time required:** You can finish this configuration in less than 15 minutes.

## Quickstart prerequisites

To install the unified labeling scanner and complete this quickstart, you'll need:

|Requirement  |Description  |
|---------|---------|
|**A supporting subscription**     |  You'll need an Azure subscription that includes [Azure Information Protection Plan 1 or Plan 2](https://azure.microsoft.com/pricing/details/information-protection/). </br></br>If you don't have one of these subscriptions, you can create a [free](https://admin.microsoft.com/Signup/Signup.aspx?OfferId=87dd2714-d452-48a0-a809-d2f58c4f68b7) account for your organization.       |
|**The Azure portal** |Make sure that you can sign in to the [Azure portal](https://portal.azure.com/) with a [supported administrator account](configure-policy.md#signing-in-to-the-azure-portal). |
|**Client installed**    |   Install the AIP unified labeling client on your computer to access the scanner installation. </br></br>Download and run the **AzInfoProtection_UL.exe** from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=53018). </br></br>When the installation is complete, you may be prompted to restart your computer or Office software. Restart as needed to continue. |
|**SQL Server Express**     | To run the scanner, you'll need SQL Server Express installed on the machine where you want to install the scanner. </br></br> To install, go to the [Microsoft Download Center](https://www.microsoft.com/sql-server/sql-server-editions-express) and select **Download now** under the **Express** option. In the installer, select the **Basic** installation type.        |
|**Azure Active Directory account**     |  Your domain account must be synchronized to [Azure Active Directory](https://azure.microsoft.com/services/active-directory/). </br></br>If you're not sure about your account, contact one of your system administrators.      |
| | |

Once you've confirmed your prerequisites, [Configure Azure Information Protection in the Azure portal](#configure-azure-information-protection-in-the-azure-portal).

## Configure Azure Information Protection in the Azure portal

Even if you have a supporting Azure subscription, Azure Information Protection may not automatically be available for you in the Azure portal, or protection may not be currently activated. Do one or both of the following steps:

- [Add Azure Information Protection to the Azure portal](#add-azure-information-protection-to-the-azure-portal)
- [Confirm that protection is activated](#confirm-that-protection-is-activated)

Then, continue with [Configure initial settings in the Azure portal](#configure-initial-settings-in-the-azure-portal).

### Add Azure Information Protection to the Azure portal

1. Sign in to the [Azure portal](https://portal.azure.com) using a [supporting admin account](configure-policy.md#signing-in-to-the-azure-portal).

1. Select **+ Create a resource**. From the search box for the Marketplace, type and then select **Azure Information Protection**. On the Azure Information Protection page, select **Create**, and then **Create** again.

    :::image type="content" source="media/gifs/quickstart-add-aip-to-portal.gif" alt-text="Add Azure Information Protection to your Azure portal":::

    > [!TIP]
    > If this is the first time you're performing this step, you'll see a **Pin to dashboard** ![Pin to dashboard icon](media/qs-tutor/pin-to-dashboard.png "Pin to dashboard icon") icon next to the pane name. Select to create a tile on your dashboard so that you can navigate directly here next time.

### Confirm that protection is activated

If you already have Azure Information Protection available for you, make sure that protection is activated:
 
On the Azure Information Protection pane, in the **Manage** menu on the left, select **Protection activation**.

Confirm whether protection is activated for your tenant. For example:

:::image type="content" source="media/qs-tutor/confirm-activation.PNG" alt-text="Confirm AIP activation":::

If protection is not activated at any point, and you need to activate it, select **Activate** ![Activate AIP](media/qs-tutor/activate.png "Activate AIP"). When activation is complete, the information bar displays **Activation finished successfully**.

### Configure initial settings in the Azure portal

1. In the **Scanner** menu on the left, select :::image type="icon" source="media/i-clusters.png" border="false"::: **Clusters**.

1. Select :::image type="icon" source="media/i-add.PNG" border="false"::: **Add** to create a new cluster to manage your scanner.

1. In the **Add a new cluster** pane that opens on the right, enter a meaningful cluster name and an optional description.

    You'll need the name of this cluster when installing your scanner.

    For example:

    :::image type="content" source="media/qs-tutor/qs-add-new-cluster.png" alt-text="Add a new cluster for the quickstart":::

1. Create an initial content scan job. In the **Scanner** menu on the left, select :::image type="icon" source="media/i-content-scan-jobs.png" border="false"::: **Content scan jobs**, and then select :::image type="icon" source="media/i-add.PNG" border="false"::: **Add.**

1. In the **Add a new content scan job** pane, define the following values:

    - Enter a meaningful name for your content scan job and an optional description. 

    - Scroll down the page, and under **Policy enforcement**, select **Off**.

    Save your changes when you're done. This scan will look for all known sensitive information types, and doesn't require you to configure any labels or policy settings.

1. Close your content scan job details pane, and return to the :::image type="icon" source="media/i-content-scan-jobs.png" border="false":::  **Content scan jobs** grid. 

    In the new row that appears for your content scan job, in the **Cluster Name** column, click **+Assign to cluster.** Then, in the **Assign to cluster** pane that appears on the right, select your cluster. 

    :::image type="content" source="media/qs-tutor/assign-cluster-all.png" alt-text="Assign to cluster":::

Now you're ready to [Install the AIP unified labeling scanner](#install-the-aip-unified-labeling-scanner).

## Install the AIP unified labeling scanner

1. Open a PowerShell session with the **Run as an administrator** option.

1. Use the following command to install the scanner, specifying the location where you want to install the scanner, as well as the name of the [cluster you created in the Azure portal](#configure-initial-settings-in-the-azure-portal).

    ```ps
    Install-AIPScanner -SqlServerInstance <your SQL installation location>\SQLEXPRESS -Cluster <cluster name>
    ```
    For example:

    ```powershell
    Install-AIPScanner -SqlServerInstance localhost\SQLEXPRESS -Cluster Quickstart
    ```

    When PowerSHell prompts you for credentials, enter your username and password. 

    For the **User name** field, use the following syntax: `<domain\user name>`. For example: `emea\msanchez`.

1. Go back to the Azure portal. In the **Scanner** menu on the left, select :::image type="icon" source="media/qs-tutor/i-nodes.png" border="false"::: **Nodes**. 

    You should now see your scanner added to the grid. For example:

    :::image type="content" source="media/qs-tutor/qs-post-install-scanner.png" alt-text="Newly installed scanner displayed on the Nodes grid":::

## Next steps

Once you have the scanner installed, you're ready to start scanning.

We recommend that you first scan your network shares to find risky repositories that have public access. It's specifically on these repositories that you may want to scan for sensitive data, and then classify and protect that data from outside users.

You can then update the content scan job you created above with the details of those repositories, and scan further to find your sensitive data: 

- [Quickstart: Scanning your network for risky repositories](quickstart-scan-network.md)
- [Quickstart: Finding your sensitive content with the Azure Information Protection (AIP) scanner](quickstart-scan-content.md)

**See also:**

- [What is the Azure Information Protection unified labeling scanner?](deploy-aip-scanner.md)
- [Prerequisites for installing and deploying the Azure Information Protection unified labeling scanner](deploy-aip-scanner-prereqs.md)
- [Configuring and installing the Azure Information Protection unified labeling scanner](deploy-aip-scanner-configure-install.md)
- [Running the Azure Information Protection scanner](deploy-aip-scanner-manage.md)