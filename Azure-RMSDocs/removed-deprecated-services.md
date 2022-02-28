---
# required metadata

title: Removed and deprecated services - Azure Information Protection
description: Learn about deprecated services that you may have used or are still using with Azure Information Protection
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 02/16/2022
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection

---

# Removed and deprecated services

[!INCLUDE [looking-for-mip](includes/looking-for-mip.md)]

This article describes the current status for removed and deprecated services that you may have used, or may still be using with Azure Information Protection.

## The AIP classic client

To provide a unified and streamlined customer experience, the **Azure Information Protection classic client** and **labeling management** pages in the Azure portal are deprecated as of **March 31, 2021**. No further support is provided for the classic client, and maintenance versions will no longer be released.

The classic client will be officially retired, and will stop functioning, on **March 31, 2022**. At this point, the **Labels** and **Policies** tabs will be removed from the Azure portal, and the classic client will not longer be able to acquire policies from the Azure portal.

We recommend that all customers migrate to unified labeling, and enable [built-in sensitivity labeling for Office applications](/microsoft-365/compliance/sensitivity-labels).

For more information, see:

- [Final reminder to migrate from Azure Information Protection classic client to unified labeling
](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/final-reminder-to-migrate-from-azure-information-protection/ba-p/2731734).
- [Learn about built-in labeling and the AIP unified labeling client](rms-client/use-client.md)

## Azure Information Protection analytics

Starting March 1, 2022, Microsoft no longer supports new Log Analytics workspaces to onboard for storing [AIP audit logs](reports-aip.md).

Customers who already have AIP audit logs configured will continue to have those audit logs forwarded to their Log Analytics workspaces until September 30, 2022. At that point, customers will not be able to have any new AIP data forwarded to their Log Analytics workspace.

Instead, we highly recommend that you use the Microsoft 365 compliance center's activity explorer and content explorer, which provide comprehensive logging and reporting.

The AIP scanner's [network discovery](deploy-aip-scanner-configure-install.md#create-a-network-scan-job-public-preview) features also use the AIP audit pipeline, and this feature will also be deprecated with the AIP audit logs on September 30, 2022. Starting March 1, 2022, only existing customers with AIP audit logs already configured will be able to continue using network discovery features.

For more information, see:

- [Get started with activity explorer](/microsoft-365/compliance/data-classification-activity-explorer)
- [Get started with content explorer](/microsoft-365/compliance/data-classification-content-explorer)
- [AIP Yammer community post](https://aka.ms/AIPAuditLogDeprecation)

## AIP and legacy Windows and Office, SharePoint, and Exchange versions

- [Windows 7 extended supported ended on January 14, 2020](/lifecycle/products/windows-7).

    We strongly encourage you to upgrade to a newer version of Windows.

    However, if you have Extended Security Updates (ESU) and a support contract, AIP support is available to continue keeping your Windows 7 systems secure.

    For more information, check with your support contact.

- [Office 2010](/lifecycle/products/microsoft-office-2010) and [Exchange Server 2010](/lifecycle/products/exchange-server-2010) extended support ended on October 13, 2020.

    This support will not be extended, and ESU will not be offered for Office 2010.

    We strongly encourage you to upgrade to a newer version of Office 365.

- [SharePoint Server 2010 extended support ended on April 13, 2021](/lifecycle/products/microsoft-sharepoint-server-2010).

For more information, check with your support contact.
