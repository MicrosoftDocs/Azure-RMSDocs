---
# required metadata

title: Removed and deprecated services - Azure Information Protection
description: Learn about deprecated services that you may have used or are still using with Azure Information Protection
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 01/24/2022
ms.topic: concept
ms.collection: M365-security-compliance
ms.service: information-protection

---

# Removed and deprecated services

This article describes the current status for removed and deprecated services that you may have used, or may still be using with Azure Information Protection.

## The AIP classic client

To provide a unified and streamlined customer experience, the **Azure Information Protection classic client** and **labeling management** pages in the Azure portal are deprecated as of **March 31, 2021**. No further support is provided for the classic client, and maintenance versions will no longer be released.

The classic client will be officially retired, and will stop functioning, on **March 31, 2022**. At this point, the **Labels** and **Policies** tabs will be removed from the Azure portal, and the classic client will not longer be able to acquire policies from the Azure portal.

We recommend that all customers migrate to unified labeling, and enable [built-in sensitivity labeling for Office applications](/microsoft-365/compliance/sensitivity-labels?view=o365-worldwide).

For more information, see:

- [Final reminder to migrate from Azure Information Protection classic client to unified labeling
](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/final-reminder-to-migrate-from-azure-information-protection/ba-p/2731734).
- [Compare the labeling solutions for Windows computers](rms-client/use-client.md#compare-the-labeling-solutions-for-windows-computers)

## The AIP unified labeling client

As we continue to bring the customer labeling and protection experience to built-in applications like [Office 365](/microsoft-365/compliance/sensitivity-labels?view=o365-worldwide), the Azure Information Protection unified labeling client has moved into maintenance mode as of **January 1, 2022**.

Moving forward, no new features will be added to the unified labeling client. In contrast, we are continuously developing new features for sensitivity labeling in Microsoft 365.

We recommend that all customers enable [built-in sensitivity labeling for Office applications](/microsoft-365/compliance/sensitivity-labels?view=o365-worldwide) and use features from the AIP unified labeling client only when they do not yet exist for built-in labeling.

For more information, see:

- [Announcing AIP unified labeling client maintenance mode and sunset of mobile viewer](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/announcing-aip-unified-labeling-client-maintenance-mode-and/ba-p/3043613)
- [Compare the labeling solutions for Windows computers](rms-client/use-client.md#compare-the-labeling-solutions-for-windows-computers)
- [Microsft 365 roadmap](https://aka.ms/MIPC/Roadmap)


## The AIP mobile viewer apps

As we continue to bring the customer labeling and protection experience to built-in applications like Office 365, AIP mobile viewer apps for iOS and Android are planned to be sunset on **December 31, 2022**.

After the mobile app sunset date, all relevant supported file types can still be consumed by [AIP viewer for windows](rms-client/clientv2-view-use-files.md). We are evaluating alternative options for our customers that are interested in consuming protected PDF files via mobile.

For consuming protected messages, we recommend that you use the Outlook mobile application, which is supported and aligned with built-in labeling and consuming protected messages.

For more information, see our blog: [Announcing AIP unified labeling client maintenance mode and sunset of mobile viewer](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/announcing-aip-unified-labeling-client-maintenance-mode-and/ba-p/3043613).

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
