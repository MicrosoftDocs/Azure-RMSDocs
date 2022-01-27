---
title: Tutorial - Install the Azure Information Protection (AIP) unified labeling scanner
description: Install the Azure Information Protection (AIP) unified labeling scanner to discover sensitive data stored in your on-premises network shares.
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
#Customer intent: As an administrator, I want to install the AIP unified labeling scanner

---

# Tutorial: Installing the Azure Information Protection (AIP) unified labeling scanner

>***Applies to**: [Azure Information Protection](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection)*
>

This tutorial describes how to install the Azure Information Protection (AIP) on-premises scanner. The scanner enables AIP administrators to scan their networks and content shares for sensitive data, and apply classification and protection labels as configured in their organization's policy.

**Time required**: You can complete this tutorial in 30 minutes..

## Tutorial prerequisites

To install the unified labeling scanner and complete this tutorial, you'll need:

|Requirement  |Description  |
|---------|---------|
|**A supporting subscription**     |  You'll need an Azure subscription that includes [Azure Information Protection](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection/). <br /><br />If you don't have one of these subscriptions, create a [free](https://admin.microsoft.com/Signup/Signup.aspx?OfferId=87dd2714-d452-48a0-a809-d2f58c4f68b7) account for your organization.       |
|**Admin access to the Azure portal** |Make sure that you can sign in to the [Azure portal](https://portal.azure.com/) with one of the following administrator accounts: <br /><br />- **Compliance administrator**<br />- **Compliance data administrator**<br />- **Security administrator**<br />- **Global administrator** |
|**Client installed**    |   To access the scanner installation, first install the AIP unified labeling client on the machine you'll be using to run the scans. <br /><br />Download and run the **AzInfoProtection_UL.exe** from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=53018). <br /><br />When the installation is complete, you may be prompted to restart your computer or Office software. Restart as needed to continue. <br /><br />For more information, see [Quickstart: Deploying the Azure Information Protection (AIP) unified labeling client](quickstart-deploy-client.md).|
|**SQL Server**     | To run the scanner, you'll need SQL Server installed on the scanner machine. <br /><br /> To install, go to the [SQL Server download page](https://www.microsoft.com/sql-server/sql-server-downloads) and select **Download now** under the installation option you want to install. In the installer, select the **Basic** installation type. <br /><br />**Note**: We recommend installing SQL Server Enterprise for production environments, and Express only for testing environments.       |
|**Azure Active Directory account**     |  When working with a standard, cloud-connected environment, the domain service account you want to use for the scanner must be synchronized to [Azure Active Directory](https://azure.microsoft.com/services/active-directory/). This isn't necessary if you're working offline. <br /><br />If you're not sure about your account, contact one of your system administrators to verify the synch status.   |
|**Sensitivity labels and a published policy** |You must have created sensitivity labels, and published a policy with at least one label to the Microsoft 365 compliance center, for the scanner service account. <br /><br />Configure sensitivity labels in the Microsoft 365 compliance center. For more information, see the [Microsoft 365 documentation](/microsoft-365/compliance/create-sensitivity-labels). |
| | |

For more information, see [Requirements for installing and deploying the Azure Information Protection unified labeling scanner](deploy-aip-scanner-prereqs.md).
Once you've confirmed your prerequisites, [Configure Azure Information Protection in the Azure portal](#configure-azure-information-protection-in-the-azure-portal).

## Configure Azure Information Protection in the Azure portal

Azure Information Protection may not be available for you in the Azure portal, or protection may not be currently activated. 

Perform one or both of the following steps, as needed:

- [Add Azure Information Protection to the Azure portal](#add-azure-information-protection-to-the-azure-portal)
- [Confirm that protection is activated](#confirm-that-protection-is-activated)

Then, continue with [Configure initial scanner settings in the Azure portal](#configure-initial-scanner-settings-in-the-azure-portal).

### Add Azure Information Protection to the Azure portal

1. Sign in to the [Azure portal](https://portal.azure.com) using a [supporting admin account](#tutorial-prerequisites).

1. Select **+ Create a resource**. In the search box, search for and then select **Azure Information Protection**. On the Azure Information Protection page, select **Create**, and then **Create** again.

    :::image type="content" source="media/gifs/quickstart-add-aip-to-portal.gif" alt-text="Add Azure Information Protection to your Azure portal":::

    > [!TIP]
    > If this is the first time you're performing this step, you'll see a **Pin to dashboard** ![Pin to dashboard icon](media/qs-tutor/pin-to-dashboard.png "Pin to dashboard icon") icon next to the pane name. Select the pin icon to create a tile on your dashboard so that you can navigate directly here next time.

Continue with [Confirm that protection is activated](#confirm-that-protection-is-activated).

### Confirm that protection is activated

If you already have Azure Information Protection available for you, make sure that protection is activated:

1. In the Azure Information Protection area, under **Manage** on the left, select **Protection Activation**.

1. Confirm whether protection is activated for your tenant. For example:

    :::image type="content" source="media/qs-tutor/confirm-activation.PNG" alt-text="Confirm AIP activation":::

If protection isn't activated, select ![Activate AIP](media/qs-tutor/activate.png "Activate AIP") **Activate**. When activation is complete, the information bar displays **Activation finished successfully**.

Continue with [Configure initial scanner settings in the Azure portal](#configure-initial-scanner-settings-in-the-azure-portal).

### Configure initial scanner settings in the Azure portal

Prepare your initial scanner settings in the Azure portal before you install the scanner on your machine.

1. In the Azure Information Protection area, under **Scanner** on the left, select :::image type="icon" source="media/i-clusters.png" border="false":::  **Clusters**.

1. On the clusters page, select :::image type="icon" source="media/i-add.PNG" border="false"::: **Add** to create a new cluster to manage your scanner.

1. In the **Add a new cluster** pane that opens on the right, enter a meaningful cluster name and an optional description.

    > [!IMPORTANT]
    > You'll need the name of this cluster when installing your scanner.
    > 
    
    For example:

    :::image type="content" source="media/qs-tutor/qs-add-new-cluster.png" alt-text="Add a new cluster for the tutorial":::

1. Create an initial content scan job. In the **Scanner** menu on the left, select :::image type="icon" source="media/i-content-scan-jobs.png" border="false"::: **Content scan jobs**, and then select :::image type="icon" source="media/i-add.PNG" border="false"::: **Add**.

1. In the **Add a new content scan job** pane, enter a meaningful name for your content scan job, and an optional description.

    Then, scroll down the page to **Policy enforcement**, and select **Off**.

    Save your changes when you're done. 

    This default scan job will scan for all known sensitive information types.

1. Close the details pane for your content scan job, and return to the :::image type="icon" source="media/i-content-scan-jobs.png" border="false":::  **Content scan jobs** grid. 

    In the new row that appears for your content scan job, in the **Cluster Name** column, select **+Assign to cluster**. Then, in the **Assign to cluster** pane that appears on the right, select your cluster. 

    :::image type="content" source="media/qs-tutor/assign-cluster-all.png" alt-text="Assign to cluster":::

Now you're ready to [Install the AIP unified labeling scanner](#install-the-aip-unified-labeling-scanner).

## Install the AIP unified labeling scanner

Once you've [configured basic scanner settings in the Azure portal](#configure-azure-information-protection-in-the-azure-portal), install the unified labeling scanner on your scanner server.

1. On the scanner server, open a PowerShell session with the **Run as an administrator** option.

1. Use the following command to install the scanner. In your command, specify where you want to install the scanner, as well as the name of the [cluster you created in the Azure portal](#configure-initial-scanner-settings-in-the-azure-portal).

    ```PowerShell
    Install-AIPScanner -SqlServerInstance <your SQL installation location>\SQLEXPRESS -Cluster <cluster name>
    ```
    For example:

    ```powershell
    Install-AIPScanner -SqlServerInstance localhost\SQLEXPRESS -Cluster Quickstart
    ```

    When PowerShell prompts you for credentials, enter the username and password. 

    For the **User name** field, use the following syntax: `<domain\user name>`. For example: `emea\contososcanner`.

1. Go back to the Azure portal. In the **Scanner** menu on the left, select :::image type="icon" source="media/qs-tutor/i-nodes.png" border="false"::: **Nodes**. 

    You should now see your scanner added to the grid. For example:

    :::image type="content" source="media/qs-tutor/qs-post-install-scanner.png" alt-text="Newly installed scanner displayed on the Nodes grid":::

Continue with [Get an Azure Active directory token for the scanner](#get-an-azure-active-directory-token-for-the-scanner) to enable your scanner service account to run non-interactively.

## Get an Azure Active directory token for the scanner

Perform this procedure when you're working with a standard, cloud-connected environment, to allow the scanner to authenticate to the AIP service, enabling the service to run non-interactively.

This procedure is not required if you're working offline only.

For more information, see [How to label files non-interactively for Azure Information Protection](rms-client/clientv2-admin-guide-powershell.md#how-to-label-files-non-interactively-for-azure-information-protection).

**To get an Azure AD token for the scanner**:

1. In the Azure portal, create an Azure AD application to specify an access token for authentication.

1. On your scanner machine, sign in with a scanner service account that's been granted the **Log on locally** right, and start a PowerShell session.

1. Start a PowerShell session, and run the following command, using the values copied from your Azure AD application.

    ```PowerShell
    Set-AIPAuthentication -AppId <ID of the registered app> -AppSecret <client secret sting> -TenantId <your tenant ID> -DelegatedUser <Azure AD account>
    ```

    For example:

    ```PowerShell
    $pscreds = Get-Credential CONTOSO\scanner
    Set-AIPAuthentication -AppId "77c3c1c3-abf9-404e-8b2b-4652836c8c66" -AppSecret "OAkk+rnuYc/u+]ah2kNxVbtrDGbS47L4" -DelegatedUser scanner@contoso.com -TenantId "9c11c87a-ac8b-46a3-8d5c-f4d0b72ee29a" -OnBehalfOf $pscreds

    Acquired application access token on behalf of CONTOSO\scanner.
    ``` 

    > [!TIP]
    > If your scanner service account cannot be granted the **Log on locally** right for the installation, use the **OnBehalfOf** parameter with **Set-AIPAuthentication**, instead of the **DelegatedUser** parameter.

The scanner now has a token to authenticate to Azure AD. This token is valid for as long as you've configured in Azure Active Directory. You must repeat this procedure when the token expires.

Continue with [installing the optional Network Discovery service](#install-the-network-discovery-service-public-preview), which enables you to scan your network repositories for content that may be at risk, and then add those repositories to a content scan job.

## Install the Network Discovery service (public preview)

Starting in version 2.8.85.0 of the AIP unified labeling client, administrators can use the AIP scanner to scan network repositories, and then add any repositories that seem risky to a content scan job.

Network scan jobs help you understand *where* your content may be at risk, by attempting to access configured repositories as both an administrator and a public user.

For example, if a repository is found to have both read and write public access, you may want to scan further and confirm that no sensitive data is stored there.

> [!NOTE]
> This feature is currently in PREVIEW. The [Azure Preview Supplemental Terms](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) include additional legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability.

**To install the Network Discovery service**:

1. On the scanner machine, open a PowerShell session as an administrator.

1. Define the credentials you want AIP to use when running the Network Discovery service, as well as when simulating admin and public user access. 

    Enter the credentials for each command when prompted using the following syntax: `domain\user`. For example: `emea\msanchez`

    Run: 

    **Credentials to run the Network Discovery service**:

    ``` PowerShell 
    $serviceacct= Get-Credential 
    ``` 

    **Credentials to simulate admin access**:

    ``` PowerShell 
    $shareadminacct= Get-Credential 
    ``` 

    **Credentials to simulate public user access**:

    ``` PowerShell  
    $publicaccount= Get-Credential 
    ``` 

1. To install the Network Discovery service, run:

    ```PowerShell
    Install-MIPNetworkDiscovery [-ServiceUserCredentials] <PSCredential> [[-StandardDomainsUserAccount] <PSCredential>] [[-ShareAdminUserAccount] <PSCredential>] [-SqlServerInstance] <String> -Cluster <String> [-WhatIf] [-Confirm] [<CommonParameters>]

    For example:

    ```PowerShell
    Install-MIPNetworkDiscovery -SqlServerInstance SQLSERVER1\SQLEXPRESS -Cluster Quickstart -ServiceUserCredentials $serviceacct  -ShareAdminUserAccount $shareadminacct -StandardDomainsUserAccount $publicaccount
 
    ```

The system shows a confirmation message when the installation is complete.

## Next steps

Once you have the scanner and the Network Discovery service installed, you're ready to start scanning. 

For more information, see [Tutorial: Discovering your sensitive content with the Azure Information Protection (AIP) scanner](tutorial-scan-networks-and-content.md).

> [!TIP]
> If you've installed version 2.8.85.0, we recommend that you scan your network to discover repositories that may have content at risk. 
>
>To scan your risky repositories for sensitive data, and then classify and protect that data from outside users, update your content scan job with the details of the repositories you've found.
>

**See also**:

- [What is the Azure Information Protection unified labeling scanner?](deploy-aip-scanner.md)
- [Prerequisites for installing and deploying the Azure Information Protection unified labeling scanner](deploy-aip-scanner-prereqs.md)
- [Tutorial: Preventing oversharing using Azure Information Protection (AIP)](/azure/information-protection/tutorial-scan-networks-and-content)
