---
# required metadata

title: Release notes
description: SDK updates by revision and other developer information.
keywords:
author: msmbaldwin
ms.author: mbaldwin
manager: barbkess
ms.date: 10/18/2017
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: CE379738-4E1D-42AD-83F4-F89B70456EBB
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: kartikk
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: dev

---

# Release notes

This article contains important information about this and previous releases of the RMS SDK 2.1.

## April 2019 - update
- Bug fixes in the File API.
- File API updated to check the EXPORT right rather than the EXTRACT right when decrypting content.
- Installer fix to ensure that the new PDF v2 protector is installed upon upgrade.
- Telemetry changes. This change required an update to the installation package that installs the C runtime libraries.
- Service backend authentication changes, ######please update to this SDK version to minmize disruption if you use symmetric key authentication for your applications
- Support for VC 15.9


## October 2017 - update

- Addition of two new APIs for environment inintialization and uninitialization. For information, see [IpcInitializeEnvironment](https://msdn.microsoft.com/library/hh535289.aspx) and [IpcUninitializeEnvironment](https://msdn.microsoft.com/library/hh535289.aspx).
- Visio file types are now supported. For more information, see [File API configuration](file-api-configuration.md).

## February 2016 - SDK documentation update

>[!Note]
> The feature documentation updates in this section apply to the SDK download dated 12/11/2015.

- **Improved authentication flow** - using OAuth2 token-based authentication via the [Azure Active Directory Authentication Library (ADAL)](https://azure.microsoft.com/documentation/articles/active-directory-authentication-libraries/). For more information on this process and the API extensions for it, see [ADAL authentication for your RMS enabled application](how-to-use-adal-authentication.md).

- **Update to ADAL** - By updating your application to use ADAL authentication rather than the Microsoft Online Sign-in Assistant, you and your customers will be able to:

  - Utilize multi-factor authentication
  - Install the RMS 2.1 client without requiring administrative privileges to the machine
  - Certify your application for Windows 10

- **Support for Microsoft Online Sign-in Assistant (SIA) with the RMS SDK is being removed.** We will continue to support the use of SIA for six months after which time support will stop.


## December 2015 update

- Performance improvements have been implemented in several areas including:
    - Publish from primary licensing server when using license-only servers.
    - RMS SDK 2.1 fails faster when there is no network connection.

- Many updates to improve error messaging and troubleshooting experience.
- Note also that the [Supported platforms](supported-platforms.md) listing is also updated.
- The need for the pre-production environment and the use of an application manifest has been removed from the RMS SDK 2.1. These sections of this developer documentation set have been removed and the overall documentation simplified and reorganized.

## May 2015 update

-   **Service apps and cloud based RMS** - [IPC\_CREDENTIAL\_SYMMETRIC\_KEY](https://msdn.microsoft.com/library/dn133062.aspx) needs three pieces of information; symmetric key, **AppPrincipalId**, and **TenantBposId**. The article for this has been updated to provide guidance on processing this information. For this update, see the revised version of [Enable your service application to work with cloud based RMS](how-to-use-file-api-with-aadrm-cloud.md).

## April 2015 update

-   **Document tracking** is now possible through a set of new APIs. For more information, see [Tracking Content](tracking-content.md).
-   **Encryption type** - We now support API level control for selection of the encryption package. For more information, see [Working with encryption](working-with-encryption.md).

    **Note**  We will no longer be exposing the **IPC\_LI\_DEPRECATED\_ENCRYPTION\_ALGORITHMS** flag in our API. This means that future apps will no longer compile if they reference this flag, but apps already built will continue to work since we will honor the flag privately in the API code. Getting the benefit of the old deprecated encryption algorithms flag can still be achieved simply by changing a flag. For more information, see [Working with encryption](working-with-encryption.md).

-   **Server Mode Applications**, those using an [API mode values](https://msdn.microsoft.com/library/hh535236.aspx) of **IPC\_API\_MODE\_SERVER**, no longer require an application manifest. You can test your application against a production RMS server and are not required to obtain a production license when switching to production environment. For more information on server mode applications, see [Application types](application-types.md).
-   **Logging** is now implemented through both file and Event Tracing for Windows methods.
-   If you're running on a **Windows 7 SP1 or Windows Server 2008 R2 machine**, see the note following under "Important developer notes".

## January 2015 update

-   **Supported protected file (pfile) size increase** - Now supports pfile sizes greater than one gigabyte (1 GB). For more information on pfiles, see [Supported File Formats](supported-file-formats.md).
-   **Improved logging for better diagnostics** - Logging levels will show **ERROR** or **WARNING** for messages that should be reviewed. All other messages, including exceptions, which are still displayed, will be logged as **INFO**.

    We chose this approach so that you won't lose any details. Now, only the important messages are shown with level as WARNING.

-   **Acquiring Company templates** – substantial fixes to the template acquire code, based on customer reports and feedback.
-   Improved localization consistency

## October 2014 update

-   Default behaviors for the File API component of SDK have been updated. For more information, see [File API configuration](file-api-configuration.md).
-   Email notification, a new feature, is described in the Developer notes article, [Enabling email notification](how-to-enable-email-notification.md).

## July 2014 update

The File API component of SDK has been extended and offers the following features:

-   Identifies which protector to use.
-   Provides RMS protection at the granularity level of a file.

    Functions added in this release:

    **Note** - Further supporting data types and structures, not listed here, have been added for the File API extensions. All articles that have been updated for this release are marked as **preliminary and subject to change**.

    -   [IpcfOpenFileOnHandle](https://msdn.microsoft.com/library/dn771751.aspx)
    -   [IpcfOpenFileOnILockBytes](https://msdn.microsoft.com/library/dn771752.aspx)
    -   [IpcfGetFileProperty](https://msdn.microsoft.com/library/dn771749.aspx)
    -   [IpcfLogicalFileRangeToRawFileRange](https://msdn.microsoft.com/library/dn771750.aspx)
    -   [IpcfReadFile](https://msdn.microsoft.com/library/dn771753.aspx)
    -   [IpcfSetEndOfFile](https://msdn.microsoft.com/library/dn771754.aspx)
    -   [IpcfWriteFile](https://msdn.microsoft.com/library/dn771756.aspx)

## April 2014 update

-   **File API memory usage**, especially for large PFiles has been improved significantly.
-   **Content ID** is now writable via the property **IPC\_LI\_CONTENT\_ID**. For more information, see [License property types](https://msdn.microsoft.com/library/hh535287.aspx).
-   **Production manifest requirement** - When your RMS enabled application/service is being run in server mode, we will not require a manifest anymore. For more information, see [Application types](application-types.md).
-   **Documentation updates**

    **Testing best practice** - guidance added for use of on-premise server before testing with Azure RMS. For more information, see [Enable your service application to work with cloud based RMS](how-to-use-file-api-with-aadrm-cloud.md).

## Important developer notes

-   **Native support for all file types**

    Native support can be added for any file type (extension) with this release of Rights Management Services SDK 2.1. For instance, for any extension &lt;ext&gt; (non-office and pdf), \*.p&lt;ext&gt; will be used if the admin configuration for that extension is "NATIVE".

    For more information on supported file types, see [File API configuration](file-api-configuration.md).

-   **Windows 7 SP1 and Windows Server 2008 R2 SP1 machines** without the update, [KB2533623](https://support.microsoft.com/kb/2533623), may have the following error protecting any office file "The parameter is incorrect. Error code 0x80070057". If you see this, please install the update and try again. If you’re still seeing issues, please contact RMS SDK Beta Feedback alias <rmcstbeta@microsoft.com>.

    **Note**  As of the April 2015 release, a check has been added to the installation process for this KB.

     

-   **File API integration**

    The Active Directory Rights Management Services File API , with the addition of File API, provides the following benefits and capabilities.

      - You can protect confidential data in an automated way without having to know the details of the Information Rights Management (IRM) implementation used by various file formats.

      - Microsoft Office files, Portable Document Format (PDF) files, and selected other file types can be protected using native protection. For a complete list of file types that can be protected with native protection, see [File API configuration](file-api-configuration.md).

      - All files, except system files and Office files can be protected using RMS Protected File format (PFile).

    The file API is implemented via the following four new functions: [IpcfDecryptFile](https://msdn.microsoft.com/library/dn133058.aspx), [IpcfEncryptFile](https://msdn.microsoft.com/library/dn133059.aspx), [IpcfGetSerializedLicenseFromFile](https://msdn.microsoft.com/library/dn133060.aspx), and [IpcfIsFileEncrypted](https://msdn.microsoft.com/library/dn133061.aspx).

    The File API requires that the Rights Management Service Client 2.1 be installed on the client computer and that the computer have connectivity to an RMS server. For more information on RMS server, RMS client, and their functionality, see the TechNet content for [IT Pro documentation for RMS](https://technet.microsoft.com/library/cc771234(v=ws.10).aspx).

-   **Issue**: When creating a license from scratch, ownership rights must be granted explicitly.

    **Solution**: Your application must explicitly add **Owner** rights to the license owner when creating a license from scratch using [IpcCreateLicenseFromScratch](https://msdn.microsoft.com/library/hh535256.aspx). For more information, see [Add explicit owner rights](add-explicit-owner-rights.md).

-   **Issue**: If an application calls [IpcProtectWindow](https://msdn.microsoft.com/library/hh535268.aspx) or [IpcUnprotectWindow](https://msdn.microsoft.com/library/hh535272.aspx) twice for the same window by using its handle, RMS SDK 2.1 will return a failure in the **HRESULT**.

    **Solution**: For specific guidance on this, see the Remarks section in [IpcProtectWindow](https://msdn.microsoft.com/library/hh535268.aspx) and [IpcUnprotectWindow](https://msdn.microsoft.com/library/hh535272.aspx).

-   **Issue**: When building for multiple architectures, you must use this guidance.

    **Solution**: If you want to use the Ipcsecproc\*isv.dll for a different architecture (for example, you have installed the 64-bit SDK on a 64-bit computer but now want to deploy on a 32-bit computer that requires Ipcsecproc\*isv.dll), you must install the 32-bit SDK on a different computer and copy the Ipcsecproc\*isv.dll files to there from the "%PROGRAMFILES%\\Microsoft Information Protection And Control" folder (the default location or wherever you chose to install the SDK).

## Frequently asked questions

**Q**: How does the default language behavior work with functions that take an LCID parameter?

**A**: Use 0 for the default locale. In this case, AD RMS Client 2.1 looks up names and descriptions in the following sequence and retrieves the first available one:

    1 - User preferred LCID.
    2 - System locale LCID.
    3 - The first available language specified in the Rights Management Server (RMS) template.

If no name and description can be retrieved, an error is returned. There can be only one name and description for a specific LCID.
