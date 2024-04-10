---
# required metadata

title: Release management and supportability - Microsoft Purview Information Protection client
description: Learn about the contents of each version of the Microsoft Purview Information Protection client for Windows and understand the lifecycle policy for support.
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 06/24/2022
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:git
#ms.devlang:
ms.subservice: v2client
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin
---

# Microsoft Purview Information Protection client - Release management and supportability

[!INCLUDE [looking-for-mip](../includes/looking-for-mip.md)]

This article describes the functionality added to each recent version of the Microsoft Purview Information Protection client, as well as servicing information and support timelines for each client version.

You can download the Microsoft Purview Information Protection client from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=53018).

If you're looking for updates for the *built-in labeling solution* for Microsoft Office applications, see:

- Information protection items, such as the "Sensitivity labels" sections in [What's new in Microsoft Purview risk and compliance solutions](/microsoft-365/compliance/whats-new)
- [Protect your sensitive data with Microsoft Purview](/microsoft-365/compliance/information-protection)
- The [Microsoft 365 roadmap](https://www.microsoft.com/en-us/microsoft-365/roadmap?filters=&searchterms=compliance), filtered for Microsoft 365 compliance items


## Servicing information and timelines
### Microsoft Purview Information Protection client

The Microsoft Purview Information Protection client has [multiple components bundled up into a single downloadable package](/purview/information-protection-client). It includes the PowerShell, Scanner, File Labeler (previously AIP Classify & Protect) and Viewer. Client versions begin with 3.X and do not include the AIP Add-in for Office.

The Microsoft Purview Information Protection labeling client is available for preview starting April 11, 2024 on the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=53018). Upgrades from AIP UL 2.X client versions require manual uninstall before install of the Microsoft Purview Information Protection labeling client. Client upgrades through Windows Update on machines with AIP UL 2.X client versions installed will fail.

The lifecycle of each generally available (GA) version of the Microsoft Purview Information Protection labeling client are 1 year after release.

|Client version|Date released|Supported through|
|--------------|-------------|-------------|
|3.0.16.0|Public Preview 04/11/2024<br>General Availability May 2024|May 2025|

### Azure Information Protection unified labeling client

The Azure Information Protection unified labeling client has [multiple components bundled up into a single downloadable package](clientv2-admin-guide.md#technical-overview-of-the-azure-information-protection-unified-labeling-client). The Azure Information Protection add-in [part of the unified labeling client] is the only component in maintenance mode as of January 1, 2022, driven by the modernization effort to make sensitivity labeling and protection built-in to Office applications. All other components within the unified labeling client aren't in maintenance mode and are fully supported. For more information, see our [TechCommunity blog](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/azure-information-protection-and-the-information-protection/ba-p/3671070#:~:text=Azure%20Information%20Protection%20%28AIP%29%20has%20been%20on%20a,management%20experience%20into%20the%20Microsoft%20Purview%20compliance%20portal).

The final support date of the AIP Add-in for Office is April 11, 2024 and is disabled in Office clients starting May 11, 2024 unless you have an exception to continue using the AIP unified labeling client.

|Client version|Date released|Supported through|
|--------------|-------------|-------------|
|2.18.26.0|03/25/2024|04/11/2024: AIP Add-in for Office <br>06/30/2024: AIP PowerShell, Scanner, Classify & Protect and Viewer|
|2.17.67.0|03/11/2024|04/11/2024: AIP Add-in for Office <br>06/30/2024: AIP PowerShell, Scanner, Classify & Protect and Viewer|
|2.17.66.0|01/11/2024|04/11/2024: AIP Add-in for Office <br>06/30/2024: AIP PowerShell, Scanner, Classify & Protect and Viewer|
|2.16.79.0|10/25/2023|04/11/2024: AIP Add-in for Office <br>06/30/2024: AIP PowerShell, Scanner, Classify & Protect and Viewer|
|2.16.73.0|05/23/2023|04/11/2024: AIP Add-in for Office <br>04/25/2024: AIP PowerShell, Scanner, Classify & Protect and Viewer|

The date format used on this page is *month/day/year*.

The documentation is updated accordingly to a client release cycle and is applicable only to the latest supported GA versions of the client. Fixes and new functionality are always applied to the latest GA version and aren't applied to older GA versions.
<!---
### Microsoft Update Catalog availability

After a short delay of typically four weeks, the latest general availability version is also included in the Microsoft Update Catalog. Azure Information Protection versions have a product name of **Microsoft Azure Information Protection** > **Microsoft Azure Information Protection Unified Labeling Client**, and a classification of **Updates**.

Including Azure Information Protection in the catalog means that you can upgrade the client using WSUS or Configuration Manager, or other software deployment mechanisms that use Microsoft Update.

For more information, see [Upgrading and maintaining the Azure Information Protection unified labeling client](clientv2-admin-guide.md#upgrading-and-maintaining-the-azure-information-protection-unified-labeling-client).
--->
### Release information

Use the following information to see the contents of each supported release of the Microsoft Purview Information Protection client for Windows. The most current release is listed first. The date format used on this page is *month/day/year*.

Noted Microsoft Purview Information Protection features are currently in PREVIEW. The [Azure Preview Supplemental Terms](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) include other legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability.

> [!TIP]
> Minor fixes aren't always listed so if you experience a problem with the Microsoft Purview Information Protection client, we recommend that you check whether it is fixed with the latest GA release. If the problem remains, check the current preview version (if available).
>
> For technical support, see the [Support options and community resources](../information-support.md#support-options-and-community-resources) information. We also invite you to engage with the Information Protection team, on their [Yammer site](https://www.yammer.com/askipteam/).

## Version 3.0.16.0 Preview

Microsoft Purview Information Protection client and scanner version 3.0.16.0 is available for public preview.

**Preview Date** 04/11/2024

### Fixes and improvements
This version of the Microsoft Purview Information Protection client and scanner provides the following fixes and improvements:
- Removed Azure Information Protection Add-in for Office from the client.
- Replaced references to the Azure Information Protection brand with Microsoft Purview Information Protection.  
- Updated PowerShell module name to PurviewInformationProtection from AzureInformationProtection.
- Created aliases for AzureInformationProtection PowerShell cmdlets in PurviewInformationProtection, except for `Set-AIPFileLabel` and `Set-AIPFileClassification`.
- Updated right-click in File Explorer to display "Apply sensitivity label with Microsoft Purview" to open the Information Protection File Labeler.

### Breaking Changes
- Upgrades from the Azure Information Protection Unified Labeling client must uninstall the 2.X client version from the local machine prior to installing Microsoft Purview Information Protection client version 3.0.
- Updated service names and cmdlets for Scanner. Upgrades from client version 2.X to 3.X are required to follow the [recommended procedure](LINK #1) or risk deployment failure.
- Updated parameters and functionality for new [Set-FileLabel](LINK #2), [Set-FileClassification](Link #3) and [Remove-FileLabel](Link #4) PowerShell cmdlets.

## Next steps

For more information, see:

- For users: [Download and install the client](install-unifiedlabelingclient-app.md)
- For admins: [Azure Information Protection unified labeling client administrator guide](clientv2-admin-guide.md)

For information about new features in the Microsoft Purview compliance portal, see:

- [What's new in Microsoft 365 compliance?](/microsoft-365/compliance/whats-new)
- [Microsoft 365 roadmap](https://www.microsoft.com/microsoft-365/roadmap?filters=&searchterms=Microsoft%2CInformation%2CProtection)


