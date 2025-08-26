---
# required metadata

title: Removed and retired services - Azure Information Protection
description: Learn about removed or retired services that you may have used or are still using with Azure Information Protection
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 02/16/2022
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection

---

# Removed and retired services

[!INCLUDE [looking-for-mip](includes/looking-for-mip.md)]

This article describes the current status for services that we've removed and retired, or are currently sunsetting, which you may have used or are still using with Azure Information Protection.

## The AIP classic client

To provide a unified and streamlined customer experience, we have retired the **Azure Information Protection classic client** and **labeling management** pages in the Azure portal as of **March 31, 2022**. This means that:

- No further support is provided for the classic client
- Maintenance versions will no longer be released
- The **Labels** and **Policies** tabs have been removed from the Azure portal
- The classic client can no longer acquire policies from the Azure portal

We recommend that all customers migrate to unified labeling, and enable [built-in sensitivity labeling for Office applications](/microsoft-365/compliance/sensitivity-labels).

For more information, see:

- [Final reminder to migrate from Azure Information Protection classic client to unified labeling
](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/final-reminder-to-migrate-from-azure-information-protection/ba-p/2731734).
- [Learn about built-in labeling and the AIP unified labeling client](rms-client/use-client.md)
- [Archived classic client documentation](/previous-versions/azure/information-protection/)

## Azure Information Protection analytics

Azure Information Protection analytics pages in the Azure portal have been deprecated and are no longer available. Instead, we highly recommend that you use the Microsoft Purview compliance portal's activity explorer and M365 unified audit log, which provide comprehensive logging and reporting.

Customers who already have AIP audit logs configured will continue to have those audit logs forwarded to their Log Analytics workspaces until March 31, 2023. At that point, customers will not be able to have any new AIP data forwarded to their Log Analytics workspace.

For more information, see:

- [Admin guide to auditing and reporting for the AIP Unified Labeling client](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/admin-guide-to-auditing-and-reporting-for-the-aip-unified/ba-p/3610727)
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
