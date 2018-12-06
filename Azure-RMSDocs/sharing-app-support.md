---
# required metadata

title: RMS sharing app for Windows and mobile platforms - AIP
description: How the RMS sharing application supports Azure RMS as a free, downloadable application that is required to support Office 2010, but also recommended for Windows computers, Mac computers, and mobile devices. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 08/22/2018
ms.topic: conceptual
ms.service: information-protection
ms.assetid: 1da6e372-2b3f-4af7-80f7-6b9073dff7f5

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---


# RMS sharing application for Windows and mobile platforms

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](http://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

> [!IMPORTANT]
> **End of support notification**: The Rights Management sharing application for Windows is being replaced by the [Azure Information Protection client](./rms-client/aip-client.md). Support for this older application will stop January 31, 2019. 
 
The RMS sharing application is a downloadable application that supports Office 2010 for Windows computers, and used to be recommended for all Windows computers and mobile devices. It is still recommended for Mac computers and Windows Phone devices. One of its benefits is that it can apply generic protection for applications and files that do not natively support the Azure Rights Management service, which means that all files can be protected. For more information about the different protection levels, see the [Level of protection – native and generic](./rms-client/sharing-app-admin-guide-technical.md#levels-of-protection--native-and-generic) section from the [Rights Management sharing application administrator guide](./rms-client/sharing-app-admin-guide.md).

When users protect their files by using the RMS sharing application, they can also track the documents that they protected, and if necessary, revoke access to them. They do this by using the [document tracking site](https://go.microsoft.com/fwlink/?LinkId=529562).

For Windows computers, the RMS sharing application unobtrusively integrates with and enhances the  applications that users already use:

-   An Office add-in for Word, Excel, PowerPoint, and Outlook is installed. This provides users with a **Share Protected** button on the ribbon, which invokes an easy-to-use dialog box of settings that are most commonly used to protect files to be emailed. This button also provides a quick way to access the document tracking site.

-   A new right-click option for File Explorer. This provides users with a **Protect in-place** option, which invokes an easy-to-use dialog box of settings that are most commonly used to protect files stored on a disk.

-   A viewer to open files that have been protected by the Azure Rights Management service. This viewer is automatically invoked when there is no other application installed that could open the protected file.

-   Back-end configuration for Office 2010 that lets Word, Excel, PowerPoint, and Outlook from this suite work seamlessly with the Azure Rights Management service.

Although the RMS sharing application for Windows can be downloaded and installed for a single computer by using the [Microsoft Rights Management page](https://go.microsoft.com/fwlink/?LinkId=303970), it also supports an enterprise deployment for silent installation and custom configuration. For more information, see the following resources:

-   [Rights Management sharing application administrator guide](./rms-client/sharing-app-admin-guide.md)

-   [Rights Management sharing application user guide](./rms-client/sharing-app-user-guide.md)

The RMS sharing application for mobile devices supports the most commonly used mobile devices, such as iPad and iPhone, Android, Windows Phone, and Windows RT. Users can download this app from the relevant store, and there are links to these from the [Microsoft Rights Management page](https://go.microsoft.com/fwlink/?LinkId=303970).

**If you have Microsoft Intune**: Because the RMS sharing app includes the Microsoft Intune App Software Development Kit, you can use  the following options:

-   Deploy and manage the app for iOS and Android devices that are enrolled by Intune.

-   Manage the app for Android devices that are not enrolled by Intune.


## Next steps
To see how other applications and services support the Azure Rights Management service from Azure Information Protection, see [How applications support the Azure Rights Management service](applications-support.md).

