---
# required metadata

title: Remove protection by using the RMS sharing app - AIP
description: Instructions to remove protection from a file (that is, unprotect a file) that was previously protected by using the RMS sharing application.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 02/23/2017
ms.topic: conceptual
ms.service: information-protection
ms.assetid: da95b938-eaad-4c83-a21e-ff1d4872aae4

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Remove protection from a file by using the Rights Management sharing application

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 7 with SP1, Windows 8, Windows 8.1*

To remove protection from a file (that is, unprotect a file) that was previously protected by using the RMS sharing application, use the **Remove Protection** option from File Explorer.

> [!IMPORTANT]
> You must be an owner of the file to remove protection.

## To remove protection from a file

1.  From File Explorer, right-click the file (for example, Sample.ptxt), select **Protect with RMS**, click **Protect in-place**, and then click **Remove Protection**:

    ![Remove protection menu option for RMS sharing application](../media/ADRMS_MSRMSApp_RemoveProtection.png)

    You might be prompted for credentials.

Note: If you do not see these options, it’s likely that either the RMS sharing application is not installed on your computer, the latest version isn’t installed, or your computer must be restarted to complete the installation. For more information about how to install the sharing application, see [Download and install the Rights Management sharing application](install-sharing-app.md).

The original protected file is deleted (for example, Sample.ptxt) and replaced with a file that has the same name but with the unprotected file name extension (for example, Sample.txt).

## Examples and other instructions
For examples for how you might use the Rights Management sharing application, and how-to instructions, see the following sections from the Rights Management sharing application user guide:

-   [Examples for using the RMS sharing application](sharing-app-user-guide.md#examples-for-using-the-rms-sharing-application)

-   [What do you want to do?](sharing-app-user-guide.md#what-do-you-want-to-do)

## See Also
[Rights Management sharing application user guide](sharing-app-user-guide.md)
