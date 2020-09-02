---
title: Quickstart - Finding your sensitive content with the Azure Information Protection (AIP) scanner
description: Use the Azure Information Protection (AIP) scanner to find what sensitive information you have in files stored on-premises.
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
#Customer intent: As an administrator, I want to find what sensitive information my organization stores on-premises
---

# Quickstart: Finding your sensitive content with the Azure Information Protection (AIP) scanner

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*
>
> *Instructions for: [Azure Information Protection classic or unified labeling clients for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

In this quickstart, you'll return to the content scan job you created [earlier](quickstart-install-client-scanner.md), update it with additional settings, and run the scan on the configured repositories.

**Time required:** You can finish this configuration in less than 15 minutes.

## Quickstart prerequisites

> [!NOTE]
> The examples in this quickstart build on the elements built in the previous quickstarts:    
>
> - [Installing the Azure Information Protection (AIP) unified labeling scanner](quickstart-install-client-scanner.md)
> - [Scanning your network for risky repositories (Public preview)](quickstart-scan-network.md)

|Requirement  |Description  |
|---------|---------|
|**A supporting subscription**     |  You'll need an Azure subscription that includes [Azure Information Protection Plan 1 or Plan 2](https://azure.microsoft.com/pricing/details/information-protection/). </br></br>If you don't have one of these subscriptions, you can create a [free](https://admin.microsoft.com/Signup/Signup.aspx?OfferId=87dd2714-d452-48a0-a809-d2f58c4f68b7) account for your organization.       |
|**Access to Azure Information Protection in the Azure portal** |Make sure that you can sign in to the [Azure portal](https://portal.azure.com/) with a supported administrator account, and have protection enabled. Supported administrator accounts include: </br>- **Compliance administrator**</br>- **Compliance data administrator**</br>- **Security administrator**</br>- **Global administrator** </br></br>For more information, see [Quickstart: Installing the Azure Information Protection (AIP) unified labeling client and scanner](quickstart-install-client-scanner.md).  |
|**AIP client and scanner**   |   To complete this quickstart, you'll need to have installed the Azure Information Protection unified labeling client and scanner. </br></br>For more information, see [Quickstart: Installing the Azure Information Protection (AIP) unified labeling client and scanner](quickstart-install-client-scanner.md). |
|**SQL Server Express**     | To run the scanner, you'll need SQL Server Express installed on the machine where you want to install the scanner. </br></br> To install, go to the [Microsoft Download Center](https://www.microsoft.com/sql-server/sql-server-editions-express) and select **Download now** under the **Express** option. In the installer, select the **Basic** installation type.        |
|**Azure Active Directory account**     |  Your domain account must be synchronized to [Azure Active Directory](https://azure.microsoft.com/services/active-directory/). </br></br>If you're not sure about your account, contact one of your system administrators.      |
| | | 

## Define your content scan job settings

1. In the Azure portal, go to Azure Information Protection. 

    In the **Scanner** menu on the left, and select :::image type="icon" source="media/i-content-scan-jobs.png" border="false"::: **Content scan jobs**, and then select the content scan job you created in an earlier quickstart: [Configure initial settings in the Azure portal](quickstart-install-client-scanner.md#configure-initial-settings-in-the-azure-portal)


    > [!TIP]
    > If you haven't yet completed the previous quickstarts and you don't have a content scan job yet, select :::image type="icon" source="media/i-add.PNG" border="false"::: **Add** to create a new one.
    >
 
1. Edit your content scan job settings. 

    Make sure that you have a meaningful name and optional description. Keep the default values for most of the settings, except for the following changes:

    -  **Treat recommended labeling as automatic**. Set to **On**.
    
    - **Configure repositories**. Ensure that there is at least one repository defined. 
    
        > [!TIP]
        > If you've added additional repositories to your content scan job after having scanned your network in [Quickstart: Scanning your network for risky repositories (Public preview)](quickstart-scan-network.md),  you can click to see them listed here now. 

    - **Enforce**. Set to **On**
    
 1. Click :::image type="icon" source="media/qs-tutor/save-icon.png" border="false":::, and then return to the :::image type="icon" source="media/i-content-scan-jobs.PNG" border="false"::: **Content scan jobs** grid.

## Scan your content

On the :::image type="icon" source="media/i-content-scan-jobs.png" border="false"::: **Content scan jobs** grid, select your content scan job, and then click :::image type="icon" source="media/i-scan-now.PNG" border="false"::: **Scan now**.

When the scan is complete, results are stored in the **%localappdata%\Microsoft\MSIP\Scanner\Reports directory** on the scanner machine.

Content scan job results include the following types of files:

- **.txt**. Summary files, including the time taken to scan, the number of scanned files, and how many files had a match for the information types.
- **.csv**. Contain detailed descriptions for each file scanned. The directory can hold up to 60 reports for each scanning cycle. 

> [!TIP]
> If your results are empty and you would like to run a meaningful scan, create a file named **Payment info** in one of the repositories included in your content scan job. Save the file with the following content:
> 
> **Credit card:** 2384 2328 5436 3489
>
> Run your scan again to see the difference in the results.
> 

## Next steps

For additional tutorials, see:

- [Tutorial: Deploying the Azure Information Protection (AIP) unified labeling client](tutorial-deploy-client.md)
- [Tutorial: Migrating from the Azure Information Protection (AIP) classic client to the unified labeling client](tutorial-migrating-to-ul.md)
- [Tutorial: Preventing oversharing using Azure Information Protection (AIP)](tutorial-preventing-oversharing.md)

**See also:**

- [What is the Azure Information Protection unified labeling scanner?](deploy-aip-scanner.md)
- [Prerequisites for installing and deploying the Azure Information Protection unified labeling scanner](deploy-aip-scanner-prereqs.md)
- [Configuring and installing the Azure Information Protection unified labeling scanner](deploy-aip-scanner-configure-install.md)
- [Running the Azure Information Protection scanner](deploy-aip-scanner-manage.md)
