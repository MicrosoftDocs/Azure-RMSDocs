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

In this quickstart, you'll return to your content scan job, update it with addition settings, and run the scan on the configured repositories.

**Time required:** You can finish this configuration in less than 15 minutes.

## Quickstart prerequisites

To complete this quickstart, you'll need to have installed the Azure Information Protection unified labeling scanner.

> [!NOTE]
> The examples in this quickstart build on the elements built in the previous quickstarts:    
>
> - [Installing the Azure Information Protection (AIP) unified labeling client and scanner](quickstart-install-client-scanner.md)
> - [Scanning your network for risky repositories (Public preview)](quickstart-scan-network.md)

## Define your content scan job settings

1. In the Azure portal, go to Azure Information Protection. 

    In the **Scanner** menu on the left, and select :::image type="icon" source="media/i-content-scan-jobs.png" border="false"::: **Content scan jobs**, and then select the content scan job you created in an earlier quickstart: [Configure initial settings in the Azure portal](quickstart-install-client-scanner.md#configure-initial-settings-in-the-azure-portal)


    If you don't have a content scan job yet, select :::image type="icon" source="media/i-add.PNG" border="false"::: **Add** to create a new one.

1. Update your the content scan job settings:
    
    |Setting  |Description  |
    |---------|---------|
    |Description     |         |
    |Row2     |         |
    |Row3     |         |
    |Row4     |         |
    |Row5     |         |
    |Row6     |         |
    |Row7     |         |


## Scan your content

1. Go back to the :::image type="icon" source="media/i-content-scan-jobs.png" border="false"::: **Content scan jobs** grid, and select **Run scan now**.


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
