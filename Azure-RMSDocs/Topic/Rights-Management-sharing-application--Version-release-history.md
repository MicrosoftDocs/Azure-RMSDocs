---
title: Rights Management sharing application: Version release history
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 6751bd90-959f-4eba-91ed-6588ac983762
author: Cabailey
---
# Rights Management sharing application: Version release history
The Rights Management team regularly updates the Rights Management sharing application for fixes and new functionality. Use the following information to see what’s new or changed in a release. The most current release is listed first.

Versions before January 1, 2015 are not listed.

> [!NOTE]
> If you have feedback or a question about the RMS sharing application, send an email message to [AskIPTeam](mailto:AskIPTeam@microsoft.com?subject=RMS%20sharing%20app:%20Feedback%20or%20question).

## Version 1.0.2004.0
**Released**: 12/11/2015

**Fixes**:

-   Only the file owner and people with **Co-Owner** permissions levels can unprotect files. Previously, the owner and people with **Co-Author** and **Co-owner** permissions levels could unprotect files.

-   Native protection for **.tif** files (in addition to .tiff files), to produce an RMS-protected, read-only **.ptif** file.

-   Improvements for error messages (accuracy and clarity).

-   Performance improvements for encrypting and decrypting content.

**New features**:

-   Support for non-administrator installation, so that standard users can install the RMS sharing application.

    There are some restrictions for standard users who run Office 2010. For more information, see the  [If you are not a local administrator and use Office 2010](../Topic/Download-and-install-the-Rights-Management-sharing-application.md#BKMK_SetupOffice2010) section in the [Download and install the Rights Management sharing application](../Topic/Download-and-install-the-Rights-Management-sharing-application.md)  user instructions.

## Version 1.0.1908.0
**Released**: 9/16/2015

**Fixes**:

-   Support for multi-factor authentication (MFA) for Azure RMS, which also removes the dependency on the Microsoft Sign-in Assistant for applications that use modern authentication.

    For more information, see the [Multi-factor authentication (MFA) and Azure RMS](../Topic/Requirements-for-Azure-Rights-Management.md#BKMK_MFA)   section in  [Requirements for Azure Rights Management](../Topic/Requirements-for-Azure-Rights-Management.md).

## Version 1.0.1784.0
**Released**: 7/30/2015

**Fixes**:

-   The default refresh interval for rights policy templates is reduced from 7 days to 1 day.

-   Small number of regressions and minor bugs.

## Version 1.0.1770.0
**Released**: 4/25/2015

**Fixes**:

-   Now, only owner and co-owners can remove protection. Co-authors cannot remove protection.

-   Files that are on a network share can now be protected.

**New features**:

-   Support for document tracking and revocation. For more information, see [Track and revoke your documents when you use the RMS sharing application](../Topic/Track-and-revoke-your-documents-when-you-use-the-RMS-sharing-application.md).

-   Template support when you choose **Share Protected**:

    -   You can now select templates.

    -   Instead of the slider, you will see a list box that includes templates and custom permissions.

    -   You no longer see options for **Allow consumption on all devices** and **Enforce usage restrictions**. Instead, **Generic Protection** is automatically selected, depending on the file type.

    For more information, see [Dialog box options for the Rights Management sharing application](../Topic/Dialog-box-options-for-the-Rights-Management-sharing-application.md).

## Version 1.0.1667.0
**Released**: 1/19/2015

**Fixes**:

-   Support for Chinese language fonts in the RMS sharing app PPDF viewer.

-   Improved error handling and messaging.

-   Fix to an issue with the automatic update notification when a newer version of the app is available for download.

**New features**:

-   **Support for multiple email domains within your organization**: If you use AD RMS and users in your organization have multiple email domains, this update lets your users consume content that has been protected by users in your organization in other domains. For more information, see the [AD RMS only: Support for multiple email domains within your organization](../Topic/Rights-Management-sharing-application-administrator-guide.md#BKMK_FederatedDomains) section in the [Rights Management sharing application administrator guide](../Topic/Rights-Management-sharing-application-administrator-guide.md).

