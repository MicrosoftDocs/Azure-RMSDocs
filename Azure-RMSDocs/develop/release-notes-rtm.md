---
# required metadata

title: Release notes | Azure RMS
description:
keywords:
author: bruceperlerms
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 84a93d5b-37e9-4d9c-9b7c-ad00963a68d7

# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

﻿
# Release notes

This topic contains important information about this and previous releases of the RMS SDK 2.1.

## New for the December 2015 update

-   Performance improvements have been implemented in several areas including:

    Publish from primary licensing server when using license-only servers.

    RMS SDK 2.1 fails faster when there is no network connection.

-   Many updates to improve error messaging and troubleshooting experience.
-   Note also that the [Supported platforms](supported-platforms.md) listing is also updated.

## May 2015 update

-   **Service apps and cloud based RMS** - [**IPC\_CREDENTIAL\_SYMMETRIC\_KEY**](/rights-management/sdk/2.1/api/win/ipc_credential#msipc_ipc_credential_symmetric_key) needs three pieces of information; symmetric key, **AppPrincipalId** and **TenantBposId**. The topic for this has been updated to provide guidance on processing this acquiring information. For this update, see the updated version of [Enable your service application to work with cloud based RMS](how-to-use-file-api-with-aadrm-cloud.md).

## April 2015 update

-   **Document tracking** is now possible through a set of new APIs. For more information, see [Tracking Content](tracking-content.md).
-   **Encryption type** - We now support API level control for selection of the encryption package. For more information, see [Working with encryption](working-with-encryption.md).

    **Note**  We will no longer be exposing the **IPC\_LI\_DEPRECATED\_ENCRYPTION\_ALGORITHMS** flag in our API. This means that future apps will no longer compile if they reference this flag, but apps already built will continue to work since we will honor the flag privately in the API code. Getting the benefit of the old deprecated encryption algorithms flag can still be achieved simply by changing a flag. For more information, see [Working with encryption](working-with-encryption.md).

     

-   **Server Mode Applications**, those using an [**API mode value**](/rights-management/sdk/2.1/api/win/api%20mode%20values#msipc_api_mode_values_IPC_API_MODE_SERVER) of **IPC\_API\_MODE\_SERVER**, no longer require an application manifest. You can test your application against a production RMS server and are not required to obtain a production license when switching to production environment. For more information on server mode applications, see [Application types](application-types.md).
-   **Logging** is now implemented through both file and Event Tracing for Windows methods.
-   If you're running on a **Windows 7 SP1 or Windows Server 2008 R2 machine**, see the note following under "Important developer notes".

## January 2015 update

-   **Supported protected file (pfile) size increase** - Now supports pfile sizes greater than one gigabyte (1 GB). For more information on pfiles, see [Support File Formats](supported-file-formats.md).
-   **Improved logging for better diagnostics** - Logging levels will show **ERROR** or **WARNING** for messages that should be reviewed. All other messages, including exceptions which are still displayed, will be logged as **INFO**.

    We chose this approach so that you won't lose any details. Now, only the important messages are shown with level as WARNING.

-   **Acquiring Company templates** – substantial fixes to the template acquire code, based on customer reports and feedback.
-   Improved localization consistency

## October 2014 update

-   Default behaviors for the File API component of SDK have been updated. For more information, see [File API configuration](file-api-configuration.md).
-   Email notification, a new feature, is described in the Developer notes topic, [Enabling email notification](how-to-enable-email-notification.md).

## July 2014 update

The File API components of SDK has been extended and offers the following features:

-   Identifies which protector to use.
-   Provides RMS protection at the granularity level of a file.

    Functions added in this release:

    **Note**  Further supporting data types and structures, not listed here, have been added for the File API extensions. All topics that have been updated for this release are marked as **preliminary and subject to change**.

     

    -   [**IpcfOpenFileOnHandle**](xref:msipc.ipcfopenfileonhandle)
    -   [**IpcfOpenFileOnILockBytes**](xref:msipc.ipcfopenfileonilockbytes)
    -   [**IpcfGetFileProperty**](xref:msipc.ipcfgetfileproperty)
    -   [**IpcfLogicalFileRangeToRawFileRange**](xref:msipc.ipcflogicalfilerangetorawfilerange)
    -   [**IpcfReadFile**](xref:msipc.ipcfreadfile)
    -   [**IpcfSetEndOfFile**](xref:msipc.ipcfsetendoffile)
    -   [**IpcfWriteFile**](xref:msipc.ipcfwritefile)

## April 2014 update

-   **File API memory usage**, especially for large PFiles has been improved significantly.
-   **Content ID** is now writable via the property **IPC\_LI\_CONTENT\_ID**. For more information, see [**License property types**](/rights-management/sdk/2.1/api/win/License%20property%20types#msipc_license_property_types_IPC_LI_APP_SPECIFIC_DATA).
-   **Production manifest requirement** - When your RMS enabled application/service is being run in server mode, we will not require a manifest anymore. For more information, see [Application types](application-types.md).
-   **Documentation updates**

    **Reorganized** - [How-to use](how-to-use-msipc.md) to clarify the order of steps for environment setup and application testing.

    **Testing best practice** - guidance added for use of on-premise server before testing with Azure RMS. For more information, see [Enable your service application to work with cloud based RMS](how-to-use-file-api-with-aadrm-cloud.md).

## Important developer notes

-   **Native support for all file types**

    Native support can be added for any file type (extension) with this release of Rights Management Services SDK 2.1. For instance, for any extension &lt;ext&gt; (non-office and pdf), \*.p&lt;ext&gt; will be used if the admin configuration for that extension is "NATIVE".

    For more information on supported file types, see [File API configuration](file-api-configuration.md).

-   **Windows 7 SP1 and Windows Server 2008 R2 SP1 machines** without the update, [KB2533623](https://support.microsoft.com/en-us/kb/2533623), may have the following error protecting any office file "The parameter is incorrect. Error code 0x80070057". If you see this, please install the update and try again. If you’re still seeing issues, please contact RMS SDK Beta Feedback alias <rmcstbeta@microsoft.com>.

    **Note**  As of the April 2015 release, a check has been added to the installation process for this KB.

     

-   **File API integration**

    The Active Directory Rights Management Services File API , with the addition of File API, provides the following benefits and capabilities.

    You can protect confidential data in an automated way without having to know the details of the Information Rights Management (IRM) implementation used by various file formats.

    Microsoft Office files, Portable Document Format (PDF) files, and selected other file types can be protected using native protection. For a complete list of file types that can be protected with native protection, see [File API configuration](file-api-configuration.md).

    All files, except system files and Office files can be protected using RMS Protected File format (PFile).

-   **Issue**: When creating a license from scratch, ownership rights must be granted explicitly.

    **Solution**: Your application must explicitly add **Owner** rights to the license owner when creating a license from scratch using [**IpcCreateLicenseFromScratch**](/rights-management/sdk/2.1/api/win/functions#msipc_ipccreatelicensefromscratch). For more information, see [Add explicit owner rights](add-explicit-owner-rights.md).

-   **Issue**: If an application calls [**IpcProtectWindow**](/rights-management/sdk/2.1/api/win/functions#msipc_ipcprotectwindow) or [**IpcUnprotectWindow**](xref:msipc.ipcunprotectwindow) twice for the same window by using its handle, RMS SDK 2.1 will return a failure in the **HRESULT**.

    **Solution**: For specific guidance on this, see the Remarks section in [**IpcProtectWindow**](/rights-management/sdk/2.1/api/win/functions#msipc_ipcprotectwindow) and [**IpcUnprotectWindow**](xref:msipc.ipcunprotectwindow).

-   **Issue**: When building for multiple architectures, you must use this guidance.

    **Solution**: If you want to use the Ipcsecproc\*isv.dll for a different architecture (for example, you have installed the 64-bit SDK on a 64-bit computer but now want to deploy on a 32-bit computer that requires Ipcsecproc\*isv.dll), you must install the 32-bit SDK on a different computer and copy the Ipcsecproc\*isv.dll files to there from the "%PROGRAMFILES%\\Microsoft Information Protection And Control" folder (the default location or wherever you chose to install the SDK).

## Frequently asked questions

**Q**: How does the default language behavior work with functions that take an LCID parameter?

**A**: Use 0 for the default locale. In this case, AD RMS Client 2.1 looks up names and descriptions in the following sequence and retrieves the first available one:

1 - User preferred LCID.
2 - System locale LCID.
3 - The first available language specified in the Rights Management Server (RMS) template.
If no name and description can be retrieved, an error is returned. There can be only one name and description for a specific LCID.

## Related topics

* [Overview](ad-rms-overview.md)
* [Add explicit owner rights](add-explicit-owner-rights.md)
* [File API configuration](file-api-configuration.md)
* [**IpcfGetSerializedLicenseFromFile**](xref:msipc.ipcfgetserializedlicensefromfile)
* [**IpcfEncryptFile**](/rights-management/sdk/2.1/api/win/functions#msipc_ipcfencryptfile)
* [**IpcfDecryptFile**](/rights-management/sdk/2.1/api/win/functions#msipc_ipcfdecryptfile)
* [**IpcfIsFileEncrypted**](xref:msipc.ipcfisfileencrypted)
* [**IpcCreateLicenseFromScratch**](/rights-management/sdk/2.1/api/win/functions#msipc_ipccreatelicensefromscratch)
* [**IpcProtectWindow**](/rights-management/sdk/2.1/api/win/functions#msipc_ipcprotectwindow)
* [**IpcUnprotectWindow**](xref:msipc.ipcunprotectwindow)
 

 



