---
title: Microsoft Information Protection (MIP) SDK version release history and support policy
description: Version release history and change notes for the MIP SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: conceptual
ms.date: 04/10/2025
ms.author: mbaldwin
---

# Microsoft Information Protection (MIP) Software Development Kit (SDK) version release history and support policy

## Servicing

Each general availability (GA) version is supported for one year once the next GA version is released. The documentation may not include information about unsupported versions. Fixes and new functionality are only applied to the latest GA version.

Preview versions shouldn't be deployed in production. Instead, use the latest preview version to test new functionality or fixes that are coming in the next GA version. Only the most current preview version is supported.

## Release history

Use the following information to see what’s new or changed for a supported release. The most current release is listed first.

NuGet packages for major releases remain active in NuGet. Only the latest version of each major release is maintained on Microsoft Download Center. Versions before 1.4 are not available.

> [!NOTE]
> For technical support, visit the [Stack Overflow Microsoft Information Protection forum](https://stackoverflow.com/questions/tagged/microsoft-information-protection) or open a support case with Microsoft Support.

| Version | Link                         | Status             | End of Support     |
| ------- | ---------------------------- | ------------------ | ------------------ |
| 1.17    | https://aka.ms/mipsdkbins    | **Supported**      | TBD                |
| 1.16    | https://aka.ms/mipsdkbins116 | **Supported**      | June 9, 2026       |
| 1.15    | https://aka.ms/mipsdkbins115 | **Supported**      | December 13, 2025  |
| 1.14    | https://aka.ms/mipsdkbins114 | **Out of Support** | July 5, 2025       |
| 1.13    | https://aka.ms/mipsdkbins113 | **Out of Support** | October 27, 2024   |
| 1.12    | https://aka.ms/mipsdkbins112 | **Out of Support** | March 17, 2024     |
| 1.11    | https://aka.ms/mipsdkbins111 | **Out of Support** | June 9, 2023       |
| 1.10    | https://aka.ms/mipsdkbins110 | **Out of Support** | November 17, 2022  |
| 1.9     | https://aka.ms/mipsdkbins19  | **Out of Support** | August 23, 2022    |
| 1.8     | https://aka.ms/mipsdkbins18  | **Out of Support** | April 29, 2022     |
| 1.7     | https://aka.ms/mipsdkbins17  | **Out of Support** | January 14, 2022   |
| 1.6     | https://aka.ms/mipsdkbins16  | **Out of Support** | September 23, 2021 |
| 1.5     | https://aka.ms/mipsdkbins15  | **Out of Support** | April 16, 2021     |
| 1.4     | https://aka.ms/mipsdkbins14  | **Out of Support** | March 2, 2021      |

## Version 1.17.158

**Release Date:** August 8, 2025

### File SDK
- Fixed a bug on x86 devices where content near 2 GB size boundary could be protected but not unprotected.

### Platform and Dependency Updates
- Fixed issue on Android where 16KB page size setting was not enabled correctly.
- Removed support for Ubuntu 20.04.

## Version 1.17.154

**Release Date:** July 18, 2025

### File SDK
- Fixed a bug where msg attachments with titles longer than 127 characters were truncated.
- Fixed a bug where EML files were incorrectly identified as unlabeled.
- Fixed bug where protecting a file on behalf of a delegated user caused the file to show the incorrect owner.
- Fixed a bug where a pfile between 500 MB and 1 GB could not be decrypted on x86 systems.

### Protection SDK
- Added support for offline republishing and online publishing for cross-cloud scenarios.

## Version 1.17.137

**Release Date:** June 9, 2025

### File SDK
- Added support for EML file types.
- Added support for offline publishing.

### Platform and Dependency Updates
- Added support for cloud auto-discovery to automatically get services information based on email address in Identity if there is no Cloud or CloudEndPointBaseUrl set. By default, this feature is disabled, Setting `FlightingFeature::CloudAutoDiscovery` to enable.
- Added support for 16KB page sizes on Android.
- Updated Android NDK version from 23.2 to 27.2.
- Updated MSVC from 19.29 to 19.44.

## Version 1.16.149

**Release Date:** April 8, 2025

### File SDK
- Fixed an issue where Unicode characters in HTML messages were not rendering correctly.

### Policy SDK
- Fixed an issue where policy SDK was not connecting to the specified cloud.
- Fixed a crash when using an AuthDelegate on Android with the C wrapper.
 
### Protection SDK
- Fixed a crash when using an AuthDelegate on Android with the C wrapper.

### Platform and Dependency Updates
- Fixed an issue where exception details were not displayed on Android.
- Updated OpenSSL from 3.0.15 to 3.4.1.
- Updated libxml2 from 2.12.7 to 2.14.0.
- Updated Zlib from 1.2.13 to 1.3.1.


## Version 1.15.134

**Release Date:** April 8, 2025

### File SDK
- Fixed an issue where Unicode characters in HTML messages were not rendering correctly.
- Fixed an issue where Office documents were encrypted with the extension .pfile when files were not synced to OneDrive.
- Fixed a bug where a partially created output file lingered when CommitAsync failed.
- Fixed bug where user-defined permissions label metadata was altered when protection was modified.

### Policy SDK
- Fixed an issue where policy SDK was not connecting to the specified cloud.
- Fixed a crash when using an AuthDelegate on Android with the C wrapper.
 
### Protection SDK
- Fixed a crash when using an AuthDelegate on Android with the C wrapper.

### Platform and Dependency Updates
- Fixed an issue where TLS 1.2 was not accepted when "allow any TLS version" was configured.
- Fixed an issue where exception details were not displayed on Android.
- Updated OpenSSL from 3.0.15 to 3.4.1.
- Updated libxml2 from 2.12.7 to 2.14.0.
- Updated Zlib from 1.2.13 to 1.3.1.

## Version 1.14.171

**Release Date:** April 8, 2025

### File SDK
- Fixed an issue where Unicode characters in HTML messages were not rendering correctly.

### Platform and Dependency Updates
- Updated OpenSSL from 3.0.15 to 3.4.1.
- Updated libxml2 from 2.12.7 to 2.14.0.
- Updated Zlib from 1.2.13 to 1.3.1.

## Version 1.16.126

**Release Date:** December 13, 2024

### File SDK
- Added support for labeling MP4s. These files can be labeled without converting to a pfile. Applying a protection label results in a pfile output.
- Added capability to decrypt nested .MSG files with `ContainerDecryptionOption::All`. After 10 decryptions of the same nested .MSG file, a mip::BadInputError("Max depth reached on nested msg attachments") exception is thrown.
- Added support for Arm64 for Windows File SDK.
- Fixed an issue where Double Key Encryption info was missing when User-Defined Permissions were modified.
- Fixed a bug when remove protection failed for file sizes larger than 500MB.
- Fixed a bug where text style in .MSG files were not preserved during decryption.
- Fixed an issue where an exception was not thrown when protection is attempted for files that cannot be accessed.

### Protection SDK
- Fixed an intermittent crash in offline publishing.

### Platform and Dependency Updates
- Fixed an issue where TLS 1.2 was not accepted despite configuring settings to allow any TLS version.

### Breaking Changes
- Updated `CommitAsync` to remove output files instead of an empty file after failure.
- Updated `LoadUserCert` API to `LoadUserCertSync`. `LoadUserCert` is deprecated.
- Updated Java wrappers sample to use MSAL for authentication.


## Version 1.15.107

**Release Date:** October 14, 2024

### File SDK

- Fixed an issue where `.msg` files could not be encrypted if email HTML contained emojis. Enable this feature using `FlightingFeature::PriopritizeHtmlInMsgs`, which is off by default.
- Added support for text encoding standards KOI8-R, KOI8-U, ISO8859 (1, 3, 4, 6, 7, 8, 9, 13 and 15), HZ-GB2312, GB18030 and ISO-2022-JP.

### Platform and Dependency Updates

- MIP SDK on .NET for all Ubunutu versions is now generally available. 
- Added support for Ubuntu 24.04.
- Ended support for Debian 10 and RHEL 7.
- Updated uriparser from 0.9.7 to 0.9.8.
- Fixed an issue with End User License caches for file owners.
- Improved exceptions on iOS to include more error details.
- Improved error messaging for `NoPermissionError` during file decryption with ExtendedErrorInfo. Disable this feature by turning off `FlightingFeature::EnableExtendedErrors`.

## Version 1.14.150

**Release Date:** October 14, 2024

### Platform and Dependency Updates

- Updated uriparser from 0.9.7 to 0.9.8.
  
## Version 1.13.234

**Release Date:** October 14, 2024

### Platform and Dependency Updates

- Updated uriparser from 0.9.7 to 0.9.8.
- Updated Azure Identity from 1.11.0 to 1.11.4.
- Fixed a crash when acquiring license rights data in .NET wrapper.

## Version 1.15.94

**Release Date:** August 12, 2024

### File SDK

- Fixed an issue where saving PDF files with protection labels failed in Office.
- Added exception when labeling .zip.pfile fails for labels without protection.
- Fixed an issue where decryption failed for files protected with MIP SDK version 1.11 and below.

### Platform and Dependency Updates

- Fixed a crash when acquiring license rights data in .NET wrapper.
- Updated Azure Identity from 1.11.0 to 1.11.4.

## Version 1.14.148

**Release Date:** August 12, 2024

### Platform and Dependency Updates

- Fixed a crash when acquiring license rights data in .NET wrapper.
- Updated Azure Identity from 1.11.0 to 1.11.4.

## Version 1.13.229

**Release Date:** July 12, 2024

### File SDK
- Fixed an issue where linearized PDFs were corrupted.
- Fixed an issue where decryption failed for labeled files with MIP SDK 1.10/1.11.
- Fixed a security issue in the PDF parser.

## Version 1.15.86

**Release Date:** July 5, 2024

### File SDK
- Fixed an issue where linearized PDFs were corrupted.
- Fixed an issue where decryption for labeled files failed with MIP SDK 1.10/1.11.
- Fixed a security bug in the PDF parser.
- Added support for Central European text encoding to protect RTF email.

### Platform and Dependency Updates
- Added support for masking more PII fields, like engineIDs and file paths.
- Added support for C API additions that enable better configuration of protection descriptors for user-defined permissions and AdHoc protection.
- Added support for TLS 1.3.

## Version 1.14.146

**Release Date:** July 5, 2024

### File SDK
- Fixed an issue where linearized PDFs were corrupted.
- Fixed an issue where decryption for labeled files failed with MIP SDK 1.10/1.11.
- Fixed a security bug in the PDF parser.

### Platform and Dependency Updates
- Added PII masking for engineIDs and file paths fields.

## Version 1.14.128

**Release Date:** February 27, 2024

### File SDK
- Fixed a bug with unicode characters when consuming MSG files.
- Fixed an issue where Hangul characters were not displayed properly in MSG files.
- Fixed a bug where streams were not aligned correctly when not null terminated.

### Protection SDK
- Added support for UTF16-encoded JSON prelicenses.
- Added check for expired prelicenses with `FlightingFeature::PreLicenseValidityCheck` with default true.
- Updated EUL and prelicenses to expose label name and label description.

### Policy SDK
- Updated the policy sync URL for China cloud.

### Updates for legacy tenants who migrated from AD RMS to RMS
- Fixed an issue where `LoadUserCert` threw an error.
- Fixed an issue causing corrupt offline publishing licenses, which could not be consumed to decrypt content.
- Fixed a bug where legacy tenant prelicenses were not accepted by the protection SDK.

### Platform and Dependency Updates
- Updated URI parser to 0.9.7.
- Updated SQLite3 to 3.45.1.
- Updated Libgsf to 1.14.52.

### Breaking Changes
- Fixed path for config file from `applicationPath/mipmip_config.json` to `applicationPath/mip/mip_config.json`. Applications using a [config file](/information-protection/develop/concept-logging) to mask PII in log files must update the file location.

## Version 1.13.209

**Release Date:** February 27, 2024

### File SDK
- Fixed a bug with unicode characters when consuming MSG files.
- Fixed an issue where Hangul characters were not displayed properly in MSG files.
- Fixed a bug where streams were not aligned correctly when not null terminated.

### Policy SDK
- Updated the policy sync URL for China cloud.

### Protection SDK
- Fixed an issue where licenses were cached without owner emails.
- Added support for UTF16-encoded JSON prelicenses.
- Added check for expired prelicenses with `FlightingFeature::PreLicenseValidityCheck` with default true.
- Updated End-User Licenses (EULs) and prelicenses to expose label name and label description.

### Updates for legacy tenants who migrated from Active Directory Rights Management Service (AD RMS) to Rights Management Service (RMS)
- Fixed an issue where `LoadUserCert` threw an error.
- Fixed an issue causing corrupt offline publishing licenses, which could not be consumed to decrypt content.
- Fixed bug where a legacy tenant prelicenses were not accepted by the protection SDK.

### Platform and Dependency Updates
- Updated OpenSSL to 1.1.1-w from 1.1.1-r.
- Updated URI parser to 0.9.7.
- Updated SQLite3 to 3.45.1.
- Updated Libgsf to 1.14.52.

### Breaking Changes
- Fixed path for config file from `applicationPath/mipmip_config.json` to `applicationPath/mip/mip_config.json`. Applications using a [config file](/information-protection/develop/concept-logging) to mask Personal Identifiable Information (PII) in log files must update the file location.

## Version 1.14.108

**Release Date:** October 27, 2023

### File SDK
- Fixed a bug where .doc files encrypted by SharePoint Online (SPO) had invalid metadata.
-	Fixed an issue where labeling signed Office and PDF files invalidated the signature and could not be opened with some editors.
-	Fixed a bug where constructing .msg files failed when using Messaging Application Programming Interface (MAPI) to convert some files to .msg format.
-	Fixed a bug in MIP file SDK sample where corrupted output files were not deleted in event of failure.
-	Fixed an issue where decrypting PDF files did not remove all label metadata.
-	Fixed a bug where encrypting .msg files with an empty body threw an exception.
-	Fixed a bug where .pdf files that start with comments are protected as .pfiles instead of natively protected .pdf files.
-	Fixed an issue where an exception was thrown when updating an inactive label with the same label.
-	Added exceptions when attempting to use policy operations on a protection-only file engine.
  
### Policy SDK
-	Change policy service URLs to target global endpoints for DoD, GCC-High and China sovereign clouds.
  
### Protection SDK
-	Fixed a bug where non-RMS protected attachments did not throw an error when decryption or inspection failed for .msg files.
-	Fixed a bug where EULs valid for less than one day were not cached.
-	Added support to preserve encrypted application data when using template protection. 
-	Added support for pulling serialized template data (Windows/Linux/macOS).
    - Enable using: GetTemplatesSettings::SetFetchSerializedTemplates.
    -	Retrieve using TemplateDescriptor::GetSerializedTemplate().
-	Fixed a bug where user certificate store was not encrypted.
-	Fixed a bug where signed app data was not provided consistently between publishing and consumption.
  
### Platform and Dependency Updates
-	Upgraded to Open SSL 3.0 for FIPS-compliance.
-	Fix an issue where some audit events were dropped.
-	Exposed a flag to control max shutdown timer for 1DS cache cleanup.
-	Added support for masking PII in log files. By default, PII is not masked.
    -	Set AllowPii to false in mip_config.json to mask PII with a [config file](/information-protection/develop/concept-logging). The config file is located at mipConfiguration->GetPath()/mip.
-	Added support for CBC encryption of Office files by default.
-	Fixed Android exception regarding resource location path.
  
### Breaking Changes
-	Error code for signed Office files and signed PDF files changed from Mip::FileIOError to Mip::NotSupportedError.
-	Audit event properties store the type of PII instead of None by default. Custom audit delegates that expect the PII to be None require updates.
-	Signed app data returns extra entries for DKE protected docs during publishing.
-	Office files use CBC encryption by default. To revert this, set FlightingFeature::UseCbcForOfficeFileEncryption to false.


## Version 1.13.187

**Release Date:** August 15, 2023

### Bug Fixes

- MIP SDK now hides symbols for statically linked OpenSSL on Linux.
- Fixed a bug where non-Office compound files were using AES128-ECB if legacy algorithms flag was set. These files should use AES256-CBC and ignore the legacy algorithms flag.
- Raised send priority of auditing events to highest level, ensuring audit events are submitted to the audit endpoint more frequently.

## Version 1.13.182

**Release Date:** July 27, 2023

### Bug Fixes

- Fixed an issue removing protection from MSG files when attachments are protected with non-RMS technology. A warning is thrown instead of an exception.
  
## Version 1.13.176

**Release Date:** June 10, 2023

### Bug Fixes

- Fixed an issue where CommitAsync() failed to return in low disk space conditions. 
- Fixed an issue where creating FileHandler for xlsb files failed when file was downloaded from SharePoint.

### Platform and Dependency Updates

- Added support for Ubuntu 22.04.
- Added support for Debian 11.
- Added support for RedHat Enterprise Linux 9.
- Removed support for Ubuntu 18.04.
- Removed support for Debian 9.

## Version 1.13.161

**Release Date:** March 28, 2023

### Bug Fixes

- Fixed a signing issue on .NET NuGet package.
- Fixed an issue in `ProtectionProfile` where offline publishing setting was missing.

## Version 1.13.158

**Release Date:** March 17, 2023

### File SDK

- Added a feature flag that enables MIP SDK to publish Office files and emails in cipher block chaining mode.
  - Set with flighting feature `UseCBCForOfficeFileEncryption` via `MipConfiguration.FeatureSettingsOverride()`.
- Fixed issues with consuming cipher block chaining (CBC) mode protected Office files and emails. MIP SDK can now consume CBC mode protected content generated by Office.

### Protection SDK

- Added preview support for offline publishing in the Protection SDK.
  - Offline protection can be enabled by setting `ProtectionProfileSettings.OfflinePublishing` to `true` in both C++ and .NET.

### Breaking Changes

- `PublishingSettings` for republishing require either a serialized publishing license or a `ProtectionHandler` in the constructor instead of being able to set either/both after construction.
- Removed `SetPublishingLicenseForRepublish` and `SetProtectionHandlerForRepublish`.
- `ProtectionDescriptorBuilder` uses `SetLabelInfo` instead of `SetLabelId`
- `Insert` method in `mip::StorageDelegate` and `IStorageDelegate` is replaced with `InsertOrReplace`.

### Critical Update

MIP SDK 1.13 introduces support for consuming files and emails protected with AES256-CBC generated by Word, Excel, PowerPoint, Outlook, Exchange Online, SharePoint Online, and MIP SDK-enabled applications that opted in to CBC publishing. If your application uses the File SDK to consume any of these formats, it's important that you update the application to MIP SDK 1.13. In the second half of 2023, Microsoft 365 Apps, Exchange Online, and SharePoint Online begin to protect with AES256-CBC by default. Applications that have not updated will fail to properly decrypt files and emails.

MIP SDK 1.13 continues to publish Office documents and emails using AES128 in electronic codebook (ECB) mode. MIP SDK 1.14 enables AES256-CBC publishing by default. If you'd like to test CBC publishing ahead of time, enable the `UseCBCForOfficeFileEncryption` feature flag via `MipConfiguration.FeatureSettingsOverride()`.

Applications that fail to update to MIP SDK 1.13 may begin to encounter an exception with the following details: `Something bad happened: AESCryptoWriter: Failed to transform final block`.  

## Version 1.12.101

**Release Date:** November 18, 2022

### File SDK

- Fixed an issue where including special characters in a label name may cause a message to be unopenable by Microsoft Outlook.
- Fixed a bug when protection was removed for inactive labels.
- Fixed a bug where changing label permissions with co-auth enabled produced protected documents that could not be opened.
- Upgraded libgsf to 1.14.50 and LibXML2 to 2.9.14.
- Upgraded Extreme Memory Profiles (XMP) to use version 2.4.7 

### Policy SDK

- Fixed a bug with invalid metadata exception for `ComputeActions`.

### Protection SDK

- Added accessors to retrieve the intranet and extranet URLs from `TenantInformation`.
- Exposed a C API for acquiring delegation licenses.
- Fixed a bug for inconsistent parent label metadata when child labels are removed.
- Fixed an auth cache bug for `CreateFromLicenseType`.
- Fix an issue where the engine being cleaned up during a `GetTemplatesAsync()` call would cause a crash.
- Added `GetLicenseRightsData` to get user/objectId/puid and rights from publishing license.
- Fixed a bug where descriptor tag could not be added to license if there are no descriptors.
- Fixed a .NET crash on Linux.
- Fixed a desk space issue; an error is now reported when MIP runs out of disk space when protecting content.
- Upgraded OpenSSL dependency to 1.1.1-r.1.

### Platform and Dependency Updates

- Fixed a bug where clouds weren't treated consistently.
- Added support for offline publishing preview feature.
- Fixed a bug where wrappers were missing telemetry cloud for sovereign cloud scenarios.
- Removed PII from audit telemetry of debug builds.

### Breaking Changes

- If both `usersWithDefaultRights` and `additionalUsersAndRights` are empty, `CreateFromLicenseType` throws a `BadInputError`.
- Added new methods `GetLicenseRightsData` and `GetLicenseRightsDataAsync` in class `ProtectionEngine`.


## Version 1.12.61

**Release Date:** June 9, 2022

### File SDK

- File SDK now supports data boundary via `FileEngineSettings.DataBoundary`.
- Fixed a bug in `GetCodePage` in `MsgInspector`.
- Fixed bug where **BodyType** always returned **TXT** in `MsgInspector`.
- Fixed a bug in Java wrapper where using `UserRoles` threw *java.util.Collections$UnmodifiableCollection can't be cast to java.util.List* exception.
- Fixed a bug when decrypting text files >2GB with `GetDecryptedTemporaryStreamAsync()`.
  
### Policy SDK

- Policy SDK now supports data boundary via `PolicyEngineSettings.DataBoundary`. 
- Fixed a bug where in certain conditions policy changes resulted in a crash. 
- Fixed an issue where Encrypt Only labels with DKE protection weren't filtered when they should be. 

### Protection SDK

- **Preview**: Added support for offline protection.
  - Enable offline protection by setting `ProtectionProfile.OfflinePublishing` to true when creating a `ProtectionProfile`.
  - Caching templates requires setting `ProtectionEngineSettings.SetTemplateRefreshArgs(std::chrono::hours)` (C++) or `ProtectionEngineSettings.TemplateRefreshArgs` (.NET) to enable protection template caching. 
- Protection SDK now supports data boundary via `ProtectionEngineSettings.DataBoundary`
 
### Breaking Changes

- `FileHandler.SetLabel()` API no longer supports **rpmsg** files as input.
- Passing a plaintext MSG file to the `MsgInspector` results in a **NotSupportedError**
- `MsgInpector` no longer attempts to decrypt attachments that are part of the **message.rpmsg** file.
- `MsgInpector` returns a fully functional **MSG** file if the **message.rpmsg** file had MSG attachments. These MSG files can be decrypted with the `FileHandler.RemoveProtection` API.
- `TelemetryDelegate` and `AuditDelegate` **WriteEvent** method now requires a second parameter, `EventContext`. The `EventContext` class exposes information on the target cloud and data boundary for the event. 

### Platform and Dependency Updates

- Added support across all three SDKs for setting European Union data boundary. 
  - When `DataBoundary` is set to EU, all telemetry and audit events flow directly to the EU region.
  - Setting `DataBoundary` to any other region results in emitting data to nearest service entry point.
- Updated libxml2 to 2.9.13.
- Fixed a crash specific to Android. 
- Fixed an issue where SDK wasn't fully honoring log level

## Version 1.11.96

**Release Date:** July 20, 2022

### File SDK

- Fixed a bug in `MemoryStream` for `GetDecryptedTemporaryStream` large file types 
- Fixed a bug causing data loss during PDF encryption due to stack overflow crash 
  - With `OptimizePdfMemory`, if /Info is an `ObjStm` with an internal indirect object, it returns `PDFPARSER_ERROR_FORMAT` instead of stack overflow 
- Fixed a bug where supporting MIP libraries weren't loading in Java 
- Fixed a bug where MSG files with protected MSG file attachments would experience corruption when `rpmsg` extension had a trailing null terminator 
- Fixed a crash in MSG files with link attachments 
- Fixed a bug where sequence of label application wasn't honored correctly using Azure Information Protection (AIP) Unified Client app for Windows 
- Fixed a bug where `RemoveProtection` threw `LabelDisabledError` exception stating inactive label was specified 
- Fixed a bug where `DeleteLabel` threw invalid metadata exception while input file is protected by templateID

### Policy SDK

- Fixed an issue where policy change would cause a crash due to mismatch between native and managed map during `OnPolicyChanged` call

### Platform and Dependency Changes

- Fixed an issue where telemetry and audit data may not be sent when using C# or Java interface 
- Fixed a bug where clouds with the same base URL weren't treated consistently 
- Updated version of Adobe XMP to 6.0.0 and pushed security fix for expat vulnerability in 2.1.0 `storeAtts()` function 
- Exposed `EnableAuditAndTelemetryForSovereignClouds` flag for .NET 
- Fixed a crash caused by control flow integrity performing vtable security checks 
  - Disabled these checks because Android doesn't support cross-library vtable checks 
- Fixed a bug in Windows crypto delegate for use after free vulnerability. Applies only to applications that set `EnableFipsValidatedCryptography` on Windows 
  - `hashObject` vector was being cleaned up before the handle and caused a use after free when the handle was cleaned up in the destructor of `BcryptData`

## Version 1.11.64

**Release Date:** January 12, 2022

### File SDK

- Fixed a bug in pfile-wrapped MSG files using the incorrect content format.
- Fixed a bug where the `Inspector` class caused a crash on `rpmsg` files.
- Fixed a bug where SDK wasn't properly compressing files over 4GB, resulting in possible corruption.

### Protection SDK

- Fixed an issue related to chasing Domain Name System (DNS) records for AD RMS on iOS.

### Platform and Dependency Updates

- Updated log4j in Java sample apps.
- Renamed arm64 ABI on Android to arm64-v8a

## Version 1.11.53

**Release Date:** November 17, 2021

### File SDK

- Fixed bug where IsModified() in mip::FileHandler returns false instead of true for a plaintext .MSG file with protected attachment.
- Fixed bug Addressing XML formatting issues in metadata that broke labels with no protection in certain cases.

### Policy SDK

- Introduced improvements to prevent deadlocking in Policy Sync.

### Breaking Changes

- Previously, when a label was configured for "Do Not Forward" or "Encrypt Only" and a file protection action, MIP SDK wouldn't display the label in the label list for the file content type.

  - The SDK is updated to fix this issue. The label will not be filtered in either case when configured to apply to both content types.
  - This change doesn't impact labels where the protection action was "Encrypt Only" or "Do Not Forward".
  - Lastly, it doesn’t impact labels intended for files where the action was predefined or user-defined protection.

- Updated existing exceptions for better handling of specific scenarios. The following previously surfaced as `NetworkError::Category::FailureResponseCode`
  - `NetworkError::Category::ServiceUnavailable`
    - New exception category (`NetworkError` exception).
    - Returned when the dependent service is unavailable.
    - Service returns 503
  - `NetworkError::Category::Throttled`
    - Exception: `NetworkError`
    - Returned when too many requests are made to the dependent service.
    - Service returns 429

### Platform and Dependency Updates

- Updated SDK dependencies to latest versions
- All MIP SDK binaries are updated to use version 2.9.12 of libxml2 static library and libgsf dynamic library for Android and Windows.
- Proxy support for Linux introduced. Example of how to set proxy below.

```bash
export HTTP_PROXY="http://10.10.10.10:8080"
```

## Version 1.10.115

**Release Date** February 25, 2022

- Fixed a bug in pfile-wrapped MSG files using the incorrect content format.
- Fixed a bug where the `Inspector` class caused a crash on `rpmsg` files.
- Fixed a bug where SDK wasn't properly compressing files over 4GB, resulting in possible corruption.
- Fixed a bug in detecting that protected MSG files. Files may be protected but SDK treats them as plaintext.

## Version 1.10.98

**Release Date** September 29, 2021

### Bug Fixes

- Fixed a bug in iOS where bitcode wasn't enabled

## Version 1.10.97

**Release date:** September 17, 2021

### Bug Fixes

- Fixed a bug where attachments on MSG files were corrupted when applying a protection label to the MSG file.

## Version 1.10.93

**Release date:** August 23, 2021

### General Changes

- Added `MipConfiguration` class.
  - This class controls the configuration settings previously set directly on MipContext.
  - Delegates, logging location, etc. are set as part of this object.
  - Review [MipContext Concepts](concept-mipcontext.md) for details.
- `MipContext::Create()` constructor is changed to accept only the new `MipConfiguration` object.
  - Review [MipContext Concepts](concept-mipcontext.md) for details.
- All engine settings default to en-US locale if the `.Locale` property is set to `null`.
- Fixed an issue where the SDK wasn't fully honoring the logging level settings.

### File SDK

- Added support for reading and writing labels to MSG files.
  - The pattern for labeling these files is that same as any other file type.
  - The **enable_msg_file_type** custom setting must be set to enable MSG file handling.
  - Attachments are protected but **not** labeled.
  - Review [Set enable_msg_file_type and use File SDK for protecting .msg file](quick-email-msg-csharp.md#set-enable_msg_file_type-and-use-file-sdk-for-labeling-msg-file) for details on custom setting.
- `FileHandler::IsLabeledOrProtected()` now supports MSG files.
- File SDK now supports decryption of protected attachments on unprotected MSG files.
  - This change applies only to files and not containers such as MSG or ZIP files.
- Added new static method `mip::FileHandler::GetFileStatus()`
  - This function returns a new `mip::FileStatus` object that indicates whether the file is labeled, protected, or contains protected objects.
  - `FileStatus` exposes three properties: `IsProtected`, `IsLabeled`, and `ContainsProtectedObjects`.
  - `ContainsProtectedObjects` is useful for MSG files with protected attachments.
- When calling `FileHandler::RemoveProtection()` on a plaintext MSG file with protected attachments, protection is removed from the attachments.
- Fixed a bug where `IProtectionHandler` was destroyed when calling `IFileHandler.SetProtection()` in a loop. `IProtectionHandler` instance is no longer destroyed after use.

### Policy SDK

- The content marking variable `${Event.DateTime}` now defaults to local time rather than UTC.
  - This variable can be set back to the previous default by using flighting feature `EventDateTimeTokenUseUtc`.
- Fixed bug where `IsActive` wasn't returning the same values inside a `PolicyHandler` as it was when retrieving labels from a `PolicyEngine`.

### Protection SDK

- Added new more specific error types that surface in both Protection and File SDK. See Breaking Changes section.

### Breaking Changes

- Introduced new custom settings to govern the default audit settings.
  - Added new property in audit Delegate to set audit settings.
  - `LabelGroupData` class no longer has `IsAuditEnabled()` method.
  - You can use instead `GetEnableAuditSetting()` to get `EnableAudit` settings in the policy once policy is loaded. Default audit settings are `Undefined` as opposed to `true` in older versions.
- Allow passing the document's timezone to ComputeActions to allow actions to be computed as if the document existed in a different timezone from the machine applying the label.
  - Useful for when labels are applied on behalf of a user through a service, where the server's local time isn't necessarily the same as the user's.
  - Instead of returning the `${Event.DateTime}` in UTC format, we now default to local time without displaying the timezone.
- Updated existing exceptions for better handling of specific scenarios.
  - `NoPermissionsError::Category::NotPremiumLicenseUser`
    - Previously surfaced as `NoPermissionsError::Category::AccessDenied`
    - Caused by an unlicensed user attempting to revoke protected content.
  - `NoPermissionsError::Category::NotOwner`
    - Previously surfaced as `NoPermissionsError::Category::AccessDenied`
    - Caused by a user attempting to revoke a document they don't own.
  - `ServiceDisabledError::Extent::Tenant`
    - Previously surfaced as `ServiceDisabledError::Extent::User`
    - Returned when the targeted Azure Rights Management service instead is disabled.
  - `NoPermissionsError::Category::AccessDenied`
    - Previously surfaced as `NetworkError::Category::FailureResponseCode`
    - Returned when the user has no rights to publish due to licensing or onboarding controls.
  - `BadInputError::ErrorCode::DoubleKey`
    - Previously surfaced as `NetworkError::Category::FailureResponseCode`
    - Returned when Double Key Encryption (DKE) parameters are incorrect.
  - `CustomerKeyUnavailableError`
    - New exception.
    - Returned when the tenant is configured for bring-your-own-key (BYOK) and the key can't be reached.
    - Service returns HTTP424.
  - `NetworkError::Category::FunctionNotImplemented`
    - New exception.
    - Returned when service returned HTTP501 (Not Implemented).
  - The following previously surfaced as `NetworkError::Category::FailureResponseCode`
    - `TemplateArchivedError`: The application attempted to apply a template ID is archived.
    - `LicenseNotRegisteredError`: The document publishing license isn't registered for revocation.
    - `NoPermissionsError::Category::UserNotFound`: The provided user doesn't exist in the target tenant.
    - `NoPermissionsError::Category::InvalidEmail`: An invalid email address was provided.
    - `NoPermissionsError::Category::AccessDenied`: The provided identity isn't a principal recognized by RMS or isn't a valid delegator.
    - `BadInputError::ErrorCode::LicenseNotTrusted`: The provided publishing license isn't from a trusted publisher. (Not in C API)
    - `BadInputError::ErrorCode::ParameterParsing`: Returned by various XML, JSON, or other parsing issues (Not in C API)

### Platform and Dependency Updates

- Added Support for Debian 10.
- Added Support for Ubuntu 20.04.

## Version 1.9.90

**Release date:** July 7, 2021

### General Changes

- Fixed a bug in File SDK where legacy documents couldn't be decrypted on 32-bit Windows.
- Enable bitcode on iOS builds.
- Updated Ubuntu 16.04 to use OpenSSL 1.1.1k.
- Fixed an issue in decrypting MSG files that had been previously handled by third-party eDiscovery tools.

## Version 1.9.78

**Release date:** April 29, 2021

### General Changes

- Added a new parameter that allows developers to provide custom scenario IDs for correlating errors.
  - In the event that a support case is required to diagnose a service-side error, this scenario ID may be helpful in troubleshooting.
  - **File SDK**: When creating a `FileHandler` set the applicationScenarioID via `FileExecutionState`
  - **Protection SDK**: Various APIs now support passing in the scenario ID.
    - `mip::ProtectionCommonSettings(mApplicationScenarioId)`
    - `mip::GetTemplatesSettings::CreateGetTemplatesSettings()->SetApplicationScenarioId()`
    - `mip::ProtectionHandler::PublishingSettings()->SetApplicationScenarioId()`
    - `mip::ProtectionHandler::ConsumptionSettings()->SetApplicationScenarioId()`
    - `mip::PolicyEngine::SetSessionId()`
- Added `Workload` enum and consent checks.
  - Added `HasWorkloadConsent()` and `GetWorkloadConsent()` to `FileEngine` and `PolicyEngine`.
- Added synchronous APIs to Policy SDK .NET wrapper: `AddEngine()`, `ListEngines()`, `DeleteEngine()`, `UnloadEngine()`.
- Added support for redirecting protection requests via `ProtectionProfile::Settings::AddRedirectionUri()`
- Added a logger context that can be used with `LoggerDelegate` to write custom context data through to logs.
  - This API can be useful for correlating error events in services to a single operation or events.
  - The following APIs support providing the logger context:
    - `LoggerDelegate::WriteToLogWithContext`
    - `TaskDispatcherDelegate::DispatchTask` or `ExecuteTaskOnIndependentThread`
    - `FileEngine::Settings::SetLoggerContext(const std::shared_ptr<void>& loggerContext)`
    - `FileProfile::Settings::SetLoggerContext(const std::shared_ptr<void>& loggerContext)`
    - `ProtectionEngine::Settings::SetLoggerContext(const std::shared_ptr<void>& loggerContext)`
    - `ProtectionProfile::Settings::SetLoggerContext(const std::shared_ptr<void>& loggerContext)`
    - `PolicyEngine::Settings::SetLoggerContext(const std::shared_ptr<void>& loggerContext)`
    - `PolicyProfile::Settings::SetLoggerContext(const std::shared_ptr<void>& loggerContext)`
    - `FileHandler::IsProtected()`
    - `FileHandler::IsLabeledOrProtected()`
    - `FileHanlder::GetSerializedPublishingLicense()`
    - `PolicyHandler::IsLabeled()`

### Platform and Dependency Updates

- Added support for CentOS 8
- Added support for iOS Frameworks
- Updated OpenSSL to version 1.1.1k
- Updated SQLite to 3.34.1

### Breaking Changes

- Changed default audit behavior for tenants where [AIP Analytics](/azure/information-protection/reports-aip) is enabled. It is now mandatory that in addition to configuring the service-side components of the AIP Analytics feature that you also set the EnableAudit property to true in sensitivity label policies.
  - `Set-LabelPolicy -Identity Global -AdvancedSettings @{EnableAudit="True"}`
  - Review [this](/azure/information-protection/rms-client/clientv2-admin-guide-customizations#configuring-advanced-settings-for-the-client-via-powershell) Docs article for details on setting advanced policy settings.
- Added function `GetApplicationScenarioId()` to `FileExecutionState`.
- Removed `ContentFormat` enum.
- Added specific errors with categories for a set of errors exposed previously under `NetworkError` via strings/error codes.
  - `NoPermissionsError::Category::UserNotFound`
  - `NoPermissionsError::Category::AccessDenied`
  - `NoPermissionsError::Category::AccessExpired`
  - `NoPermissionsError::Category::UserNotFound`
- `Microsoft.RightsManagement.Exceptions.UnknownTenantException` thrown service now surfaces as `ServiceDisabledError` instead of `Network Error`

### Bug Fixes

- Fixed a memory leak when calling `mip::FileHandler::IsLabeledOrProtected()`.
- Fixed a bug where failure in `FileHandler::InspectAsync()` called incorrect observer.
- Fixed a bug where SDK attempted to apply co-authoring label format to Office formats that don't support co-authoring (DOC, PPT, XLS).
- Fixed a crash in the .NET wrapper related to `FileEngine` disposal. Native `PolicyEngine` object remained present for some period and would attempt a policy refresh, resulting in a crash.
- Fixed a bug where the SDK would ignore labels applied by older versions of AIP due to missing **SiteID** property.

## Version 1.8.97

**Release date:** February 24, 2021

- Fixed a bug where child labels weren't filtered properly and included all types of labels, even if not requested.
- Fixed a bug where labels weren't maintained on `RemoveProtection()` if label metadata was incomplete.

## Version 1.8.94

**Release date:** February 8, 2021

- Fixed bug in NuGet package where debug configuration for C++ projects deployed release binaries. Version 1.8.86 may result in a crash with native C++ apps. Make sure to update to 1.8.94 or later.
- Fixed a bug where policy engine was required to remove protection.
  - If policy engine can't be loaded and label metadata is present, the policy engine is discarded if protection is removed.
- Fixed a bug where empty `labelInfo.xml` was generated if file was changed to another protected label.

## Version 1.8.86

**Release date:** January 13, 2021

### General Changes

- Added support for Mac on ARM.
- Signed all dylib files for Mac.
- All clouds are fully supported across all three Software Development Kits (SDKs).
- Rename `TelemetryConfiguration` to `DiagnosticConfiguration`.
- Updated `MipContext` to accept `DiagnosticConfiguration` instead of `TelemetryConfiguration`.
- Exposed new `AuditDelegate`.
- Several custom settings had their name changed and are removed in version 1.9. These cutsom settings continue to function in parallel with their updates names in version 1.8.

| New Name          | Old Name                   |
| ----------------- | -------------------------- |
| is_debug_audit    | is_debug_telemetry         |
| is_audit_disabled | is_built_in_audit_disabled |

### File SDK

- Added support for user-defined labels with double key encryption.
- Added an API, `MsgInspector.BodyType` to expose body encoding type for MSG files.
- Added APIs to support Double Key Encryption with User-Defined Permissions.
- Added flag for `mip::FileHandler` that allows the caller to disable audit discover event send. This fixes a scenario where using the `ClassifyAsync()` API would result in duplicate discovery events.
- Fixed bugs where:
  - Setting protection on XPS file fails.
  - A file can't be opened after upload/download from SharePoint Online and removing custom permissions.
  - `RemoveProtection()` function would accept a message.rpmsg input. Now accepts only MSG files.
  - A crash that occurred when attempting to track or revoke unprotected files.

### Policy SDK

- Removed `ActionId` from default metadata properties to ensure consistency between Microsoft Office and SharePoint Online labeled documents.
- Added support for Azure Purview-specific labels.
- Added ability to override both telemetry and audit via delegates for each.
  - Audit delegate provides the ability to send AIP auditing events to a destination other than AIP Analytics, or in addition to AIP Analytics.
- Added flag for `mip::PolicyHandler` that allows the caller to discover audit discover event send. This fixes a scenario where using the `ClassifyAsync()` API would result in duplicate discovery events.
- Fixed a bug where encrypted policy database couldn't be opened in certain scenarios.
- Exposed new `AuditDelegate` that allows developers to override default MIP SDK audit pipeline and send events to their own infrastructure.
- `mip::ClassifierUniqueIdsAndContentFormats` and `GetContentFormat()` now return `std::string` instead of `mip::ContentFormat`. This change is replicated in .NET and Java wrappers.
- `ContentFormat.Default` is now `ContentFormat.File`.

### Protection SDK

- Added a `ProtectionEngineSettings.SetAllowCloudServiceOnly` property that prohibits any connections to Active Directory Rights Management Services clusters when true. Only cloud environments are used.
- Added support for acquiring delegation licenses.
  - Delegations licenses enable services to fetch a license for content on behalf of a user.
  - This lets the service view rights data and decrypt on behalf of the user without additional calls to service.

### Java Wrapper (Public Preview)

- Added support for Track and Revoke to Java Wrapper.
- Added stream support to Java Wrapper

### C API

- Removed **MIP_FLIGHTING_FEATURE_KEEP_PDF_LINEARIZATION** flag from C API.

## Version 1.7.147

### File SDK

- Minor bug fix for the `.PBIX` file format.

## Version 1.7.145

**Release date:** November 13, 2020

### General Changes

- Updated NuGet package to copy dependencies only on update rather than always.
- Debug configuration on .NET uses release version of native libraries. We found that customers deploying .NET solutions in debug mode to remote servers were required to install the VC++ Debug runtime, which isn't trivial. If there's a need to debug in to native libraries, copy the DLLs from the SDK Redistributable into the project folder (https://ala.ms/mipsdkbins)
- Fixed a bug that was generating warnings for .NET Core projects.

## Version 1.7.133

**Release date**: September 23, 2020

### General SDK Changes

- Public Preview available for Java on Windows and Ubuntu 18.04.
- .NET Core now supported on Windows.
- Public preview support for .NET Core on Ubuntu 18.04.
- Improved local logging for Keystore when storage cache type is set to `OnDiskEncrypted.`
- Enabled feature flighting on .NET Wrapper
- Reverted SDK telemetry behavior to pre-1.6. A minimum set of usage events are now sent when opted in for minimum telemetry only.

### File SDK

- Fixed UTF-16/UTF-8 body conversion in `MSGInspector`.
- Set a default max file size limit for files protected by the File SDK to 6GB.
  - Change made due to decryption of large files requiring _at least_ the file size in available memory.
  - Can be overridden by custom setting `max_file_size_for_protection`.
- Added support for linearized PDFs.
- Fixed a bug where LastModifiedDate wasn't updated on Change event.
- Fixed a memory leak in protected PDF creation.
- File SDK supports revocation of tracked files.
- `FileEngine::Settings::SetLabelFilter` is deprecated, use `ConfigureFunctionality` instead.

### Policy SDK

- Policy SDK now supports Encrypt Only labeling actions.
- Fixed a bug where `mip::Identity` wasn't properly loaded from cached engines.
- Fixed a bug where classification GUID comparisons were case-sensitive in classification API.
- Enriched audit events by adding new fields.

### Protection SDK

- Fixed a bug where `mip::Identity` wasn't properly loaded from cached engines.
- Added implicit registration for newly created publishing licenses.
- Added support for cryptographic algorithms used to support DKE in Office files.
- Made `documentId` and `owner` parameters optional.

### C APIs

- Added missing identity and DKE APIs.
- Moved `AuthDelegate` from profile to engine across all SDKs.
- Publish Policy SDK Sample for C
- `MIP_CC_CreateProtectionEngineSettingsWithIdentity` is deprecated, use `MIP_CC_CreateProtectionEngineSettingsWithIdentityAndAuthCallback` instead.
- `MIP_CC_CreateProtectionEngineSettingsWithEngineId` is deprecated, use `MIP_CC_CreateProtectionEngineSettingsWithEngineIdAndAuthCallback` instead.
- `MIP_CC_CreateProtectionProfileSettings` signature has changed.
- `MIP_CC_CreatePolicyEngineSettingsWithIdentity` is deprecated, use `MIP_CC_CreatePolicyEngineSettingsWithIdentityAndAuthCallback`.
- `MIP_CC_CreatePolicyEngineSettingsWithEngineId` is deprecated, use `MIP_CC_CreatePolicyEngineSettingsWithEngineIdAndAuthCallback`.
- `MIP_CC_PolicyEngineSettings_SetLabelFilter` is deprecated, use `MIP_CC_PolicyEngineSettings_ConfigureFunctionality`.
- `MIP_CC_CreatePolicyProfileSettings` signature has changed.

### Breaking Changes

#### Common

- `TelemetryConfiguration::isTelemetryOptedOut` renamed to `isMinimalTelemetryEnabled`.

#### C API

- `mip_cc_document_state` is updated with a new value `mip_cc_metadata_version_format` contentMetadataVersionFormat

## Version 1.6.103

**Release date**: April 16, 2020

### General SDK Changes

- TLS 1.2 enforced for all non-ADRMS HTTP communication.
- Migrated iOS/macOS HTTP implementation from NSURLConnection to NSURLSession.
- Migrated iOS telemetry component from Aria SDK to 1DS SDK.
- Telemetry component now uses MIP's HttpDelegate on iOS, macOS, and Linux. (Previously only win32).
- Improved type safety for C API.
- Moved AuthDelegate from Profile to Engine in C++, C#, and Java APIs.
- AuthDelegate moved from constructor of `Profile::Settings` to `Engine::Settings`.
- Added Category to NoPolicyError to provide more info about why policy sync failed.
- Added `PolicyEngine::GetTenantId` method.
- Added explicit support for all clouds.
  - New `Engine::Settings::SetCloud` method to set target cloud (GCC High, 21-Vianet, etc.).
  - Existing `Engine::Settings::SetCloudEndpointBaseUrl` method call is no longer necessary for recognized clouds.
- Enabled bitcode for iOS binaries.

### File SDK

- Added `IFileHandler::InspectAsync` to C# and Java Wrappers
- New support via `FileProfile::AcquirePolicyAuthToken` for triggering policy token acquisition to allow an application to warm up its token cache.
- `MsgInspector::GetAttachments` returns `vector<shared_ptr<MsgAttachmentData>>` instead of `vector<unique_ptr<MsgAttachmentData>>`
- `TelemetryConfiguration::isOptedOut` setting now completely disables telemetry. Previously a set of minimum telemetry was sent.

### Policy SDK

- New support for triggering token acquisition to allow an application to warm up its token cache via `PolicyProfile::AcquireAuthToken`.
- Hold Your Own Key (HYOK) labels are filtered by default.
- Metadata associated with deleted labels are now removed.
- If there is ever a mismatch between cached label policy and sensitivity policy, the policy cache is cleared.
- New support for versioned metadata:
  - A file format may rev the location/format of its label metadata. In that case, an application should provide MIP with all metadata, and MIP determines which metadata is "true".
  - `ContentLabel::GetExtendedProperties` now returns `vector<MetadataEntry>` instead of `vector<pair<string, string>>`.
  - `MetadataAction::GetMetadataToAdd` now returns `vector<MetadataEntry>` instead of `vector<pair<string, string>>`.
  - `ExecutionState::GetContentMetadata` should now return `vector<MetadataEntry>` instead of `vector<pair<string, string>>`.
  - `ExecutionState::GetContentMetadataVersion` should return the highest version of metadata that the application recognizes for the current file format (usually 0).
  - `PolicyEngine::GetWxpMetadataVersion` returns the metadata version for Office documents as configured by tenant admin (0 = default, 1 = coauth-enabled format).
  - Equivalent changes in C API:
    - `MIP_CC_ContentLabel_GetExtendedProperties`
    - `MIP_CC_MetadataAction_GetMetadataToAdd`
    - `mip_cc_metadata_callback`
    - `mip_cc_document_state`
    - `MIP_CC_PolicyEngine_GetWxpMetadataVersion`
- `TelemetryConfiguration::isOptedOut` setting now completely disables telemetry. Previously a set of minimum telemetry was sent.

### Protection SDK

- New support for registration and revocation for doc tracking.
- New support for generating a pre-license when publishing.
- Exposed public Microsoft TLS cert used by protection service.
  - `GetMsftCert` and `GetMsftCertPEM`
  - If an application overrides `HttpDelegate` interface, it must trust server certificates issued by this CA.
  - This requirement is expected to be removed late in 2020.

## Version 1.5.124

**Release date**: March 2, 2020

### General SDK Changes

- Java API (Windows-only)
- Cancellation of async MIP tasks
  - All async calls return mip::AsyncControl object with a Cancel() method
- Delay-load dependent binaries
- Optionally mask specific telemetry/audit properties
  - Configurable via mip::TelemetryConfiguration::maskedProperties
- Improved exceptions:
  - All errors include actionable correlation IDs in description string
  - Network error has 'Category', 'BaseUrl', 'RequestId', and 'StatusCode' fields
- Improved C API result/error details

### File SDK

- Network-free check if file is labeled or protected
  - mip::FileHandler::IsLabeledOrProtected()
  - Minor risk of false positives (for example if file contains zombie label metadata)
- Filter labels associated with specific types of protection
  - Configurable via mip::FileEngine::Settings::SetLabelFilter()
- Expose policy data to File SDK
  - mip::FileEngine::GetPolicyDataXml()

### Policy SDK

- Dynamic content marking for watermark/header/footer actions:
  - Fields like ${Item.Label}, ${Item.Name}, ${User.Name}, ${Event.DateTime} are automatically
    populated by MIP
  - mip::Identity can be constructed with user-friendly "name" field used by dynamic content marking
  - Configurable via mip::PolicyEngine::Settings::SetVariableTextMarkingType()
- Network-free check if content is labeled
  - mip::PolicyHandler::IsLabeled()
  - Minor risk of false positives (for example if content contains zombie label metadata)
- Label policy cache TTL
  - Default: 30 days
  - Configurable via mip::PolicyProfile::SetCustomSettings()
- **Breaking Change**
  - Updated PolicyEngine.Settings.LabelFilter from list of enums to nullable bitfield.

### Protection SDK

- Pre-license
  - Existence of a pre-license alongside encrypted content, along with a previously retrieved user
    cert, allows for offline decryption of content
  - mip::ProtectionHandler::ConsumptionSettings can be constructed with a pre-license
  - mip::ProtectionEngine::LoadUserCert|Async() fetches user cert which is stored according to
    mip::ProtectionProfile's caching policy
- Server-specific feature checking
  - Checks if user's tenant supports "encrypt only" feature (only available in Azure RMS)
  - mip::ProtectionEngine::IsFeatureSupported()
- Richer details when fetching RMS templates
- **Breaking Changes**
  - `mip::ProtectionEngine::GetTemplates()` `vector<shared_ptr<string>>` return value replaced with
    `vector<shared_ptr<mip::TemplateDescriptor>>` (C++)
  - `mip::ProtectionEngine::Observer::OnGetTemplatesSuccess()` callback `shared_ptr<vector<string>>`
    parameter replaced with `vector<shared_ptr<mip::TemplateDescriptor>>` (C++)
  - IProtectionEngine.GetTemplates|Async() return value `List<string>` replaced with
    `List<TemplateDescriptor>`. (C#)
  - MIP_CC_ProtectionEngine_GetTemplates() mip_cc_guid* param replaced with mip_cc_template_descriptor* (C API)

### C API

- **Breaking Changes**: Updated most functions to include mip_cc_error\* parameter, can be NULL

### Error/Exception Updates

- Error handling summary:
  - AccessDeniedError: User has not been granted rights to access content
    - NoAuthTokenError: App did not provide auth token
    - NoPermissionsError: User has not been granted rights to specific content, but referrer/owner is available
    - ServiceDisabledError: Service is disabled for user/device/platform/tenant
  - AdhocProtectionRequiredError: Ad hoc protection must be set before setting a label
  - BadInputError: Invalid input from user/app
    - InsufficientBufferError: Invalid buffer input from user/app
    - LabelDisabledError: Label ID is recognized but disabled for use
    - LabelNotFoundError: Unrecognized label ID
    - TemplateNotFoundError: Unrecognized template ID
  - ConsentDeniedError: An operation that required consent from user/app wasn't granted consent
  - DeprecatedApiError: This API is deprecated
  - FileIOError: Failed to read/write file
  - InternalError: Unexpected internal failure
  - NetworkError
    - ProxyAuthenticationError: Proxy authentication is required
    - Category=BadResponse: Server returned unreadable HTTP response (retry might succeed)
    - Category=Cancelled: Failed to establish HTTP connection because operation was canceled by user/app (retry probably succeeds)
    - Category=FailureResponseCode: Server returned a generic failure response (retry might succeed)
    - Category=NoConnection: Failed to establish HTTP connection (retry might succeed)
    - Category=Offline: Failed to establish HTTP connection because application is in offline mode (retry won't succeed)
    - Category=Proxy: Failed to establish HTTP connection due to proxy issue (retry probably won't succeed)
    - Category=SSL: Failed to establish HTTP connection due to SSL issue (retry probably won't succeed)
    - Category=Throttled: Server returned "throttled" response (backoff/retry probably succeeds)
    - Category=Timeout: Failed to establish HTTP connection after timeout (retry probably succeeds)
    - Category=UnexpectedResponse: Server returned unexpected data (retry might succeed)
  - NoPolicyError: Tenant or user isn't configured for labels
  - NotSupportedError: Operation not supported in current state
  - OperationCancelledError: Operation was canceled
  - PrivilegedRequiredError: Can't modify label unless assignment method = privileged
- Changes
  - Removed unused PolicySyncError. Replaced by NetworkError
  - Removed unused TransientNetworkError. Replaced by NetworkError categories

## Version 1.4.0

**Release date**: November 6, 2019

This version introduces support for the Protection SDK in the .NET package (Microsoft.InformationProtection.File).

### SDK changes

- Performance improvements and bug fixes
- Renamed StorageType enum to CacheStorageType
- Android links to libc++ instead of gnustl
- Removed previously deprecated APIs
  - File/Policy/Profile::Settings must be initialized with a MipContext
  - File/Policy/Profile::Settings path, application info, logger delegate, telemetry, and log level getters/setters have been removed. These properties are managed by MipContext
- Better static library support on Apple platforms
  - Monolithic static libraries
    - libmip_file_sdk_static.a
    - libmip_upe_sdk_static.a
    - libmip_protection_sdk_static.a
    - libmip_upe_and_protection_sdk_static.a
  - Third-party dependencies extracted into separate libraries
    - libsqlite3.a
    - libssl.a
- Removed mip_telemetry.dll (merged into mip_core.dll)

### File SDK

- RPMSG
  - Encryption
  - Added support for string8 decryption
- Configurable PFILE extension behavior (default, {extension}.PFILE, or P{extension})
  - ProtectionSettings::SetPFileExtensionBehavior

### Policy SDK

- Complete C API
- Configure filtering of labels associated with protection
  - PolicyEngine::Settigns::SetLabelFilter()

### Protection SDK

- Removed previously deprecated APIs
  - Removed ProtectionEngine::CreateProtectionHandlerFromDescriptor[Async] (use ProtectionEngine::CreateProtectionHandlerForPublishing[Async])
  - Removed ProtectionEngine::CreateProtectionHandlerFromPublishingLicense[Async] (use ProtectionEngine::CreateProtectionHandlerForConsumption[Async])
- Complete C# API
- Complete C API
  - C API normalization changes from v1.3 C API preview:
    - Renamed mip_cc_storage_type to mip_cc_cache_storage_type
    - Renamed MIP_CC_AddProtectionProfileEngine to MIP_CC_ProtectionProfile_AddEngine
    - Renamed MIP_CC_CreateProtectionEngineSettingsForExistingEngine to MIP_CC_CreateProtectionEngineSettingsWithEng
    - Renamed MIP_CC_CreateProtectionEngineSettingsForNewEngine to MIP_CC_CreateProtectionEngineSettingsWithIdentity
    - Renamed MIP_CC_SetProtectionProfileSettingsHttpDelegate to MIP_CC_ProtectionProfileSettings_SetHttpDelegate
    - Renamed MIP_CC_CreateProtectionHandlerForConsumption to MIP_CC_ProtectionEngine_CreateProtectionHandlerForConsumption
    - Renamed MIP_CC_CreateProtectionHandlerForPublishing to MIP_CC_ProtectionEngine_CreateProtectionHandlerForPublishing
    - Renamed MIP_CC_GetProtectionEngineId to MIP_CC_ProtectionEngine_GetEngineId
    - Renamed MIP_CC_GetProtectionEngineTemplates to MIP_CC_ProtectionEngine_GetTemplates
    - Renamed MIP_CC_GetProtectionEngineTemplatesSize to MIP_CC_ProtectionEngine_GetTemplatesSize
    - Renamed MIP_CC_SetTelemetryConfigurationHttpDelegate to MIP_CC_TelemetryConfiguration_SetHttpDelegate
    - Renamed MIP_CC_SetTelemetryConfigurationHostName to MIP_CC_TelemetryConfiguration_SetHostName
    - Renamed MIP_CC_SetTelemetryConfigurationIsLocalCachingEnabled to MIP_CC_TelemetryConfiguration_SetIsLocalCachingEnabled
    - Renamed MIP_CC_SetTelemetryConfigurationIsNetworkDetectionEnabled to MIP_CC_TelemetryConfiguration_SetIsNetworkDetectionEnabled
    - Renamed MIP_CC_SetTelemetryConfigurationIsTelemetryOptedOut to MIP_CC_TelemetryConfiguration_SetIsTelemetryOptedOut
    - Renamed MIP_CC_SetTelemetryConfigurationLibraryName to MIP_CC_TelemetryConfiguration_SetLibraryName
    - Removed MIP_CC_ProtectionEngine_GetRightsForLabelIdSize and updated MIP_CC_ProtectionEngine_GetRightsForLabelId to populate a mip_cc_string_list instead of a comma-separated string buffer
    - Removed MIP_CC_ProtectionHandler_GetRightsSize and updated MIP_CC_ProtectionHandler_GetRights to populate a mip_cc_string_list instead of a comma-separated string buffer
    - Added MIP_CC_ProtectionEngine_GetEngineIdSize and updated MIP_CC_ProtectionEngine_GetEngineId to populate a string buffer instead of a mip_cc_guid
    - MIP_CC_CreateProtectionDescriptorFromUserRights now takes 'mip_cc_dictionary-' param instead of 'mip_cc_dictionary'
    - MIP_CC_ProtectionEngineSettings_SetCustomSettings now takes 'mip_cc_dictionary-' param instead of 'mip_cc_dictionary'
    - MIP_CC_ProtectionProfileSettings_SetCustomSettings now takes 'mip_cc_dictionary-' param instead of 'mip_cc_dictionary'
    - MIP_CC_TelemetryConfiguration_SetCustomSettings now takes 'mip_cc_dictionary-' param instead of 'mip_cc_dictionary'
    - MIP_CC_CreateMipContext takes 'isOfflineOnly' and 'loggerDelegateOverride' params

## Version 1.3.0

**Release date**: August 22, 2019

### New Features

- `mip::MipContext` is the new highest-level object.
- Decryption of protected MSG files is now supported.
- Inspection of message.rpmsg files is supported via `mip::FileInspector` and `mip::FileHandler::InspectAsync()`.
- On-disk cache may now be optionally encrypted.
- Protection SDK now supports Chinese cloud customers.
- ARM64 support on Android.
- ARM64e support on iOS.
- End-user license (EUL) cache can now be disabled.
- .pfile encryption may be disabled via `mip::FileEngine::EnablePFile`
- Improved performance for protection operations by reducing number of HTTP calls
- Removed the delegated identity details from `mip::Identity` and instead added `DelegatedUserEmail` to `mip::FileEngine::Settings`, `mip::ProtectionSettings`, `mip::PolicyEngine::Settings`, and `mip::ProtectionHandler`'s `PublishingSettings` and `ConsumptionSettings`.
- Functions that previously returned LabelId now return a `mip::Label` object.

### Changes

- In previous versions, we required that you called `mip::ReleaseAllResources`. Version 1.3 replaces this with `mip::MipContext::~MipContext` or `mip::MipContext::Shutdown`.
- Removed `ActionSource` from `mip::LabelingOptions` and `mip::ExecutionState::GetNewLabelActionSource`
- Replaced `mip::ProtectionEngine::CreateProtectionHandlerFromDescriptor` with `mip::ProtectionEngine::CreateProtectionHandlerForPublishing`.
- Replaced `mip::ProtectionEngine::CreateProtectionHandlerFromPublishingLicense` with `mip::ProtectionEngine::CreateProtectionHandlerForConsumption`.
- Renamed `mip::PublishingLicenseContext` to `mip::PublishingLicenseInfo` and updated to contain rich fields instead of raw serialized bytes.
- `mip::PublishingLicenseInfo` contains the data relevant to MIP after parsing a publishing license (PL).
- `mip::TemplateNotFoundError` and `mip::LabelNotFoundError` thrown when application passes MIP a template ID or label ID that isn't recognized.
- Added support for label-based conditional access via the claims parameter of `AcquireToken()` and `mip::AuthDelegate::OAuth2Challenge()`. This functionality hasn't yet been exposed via the compliance center portal.

## Version 1.2.0

**Release date**: April 15, 2019

### New Features

- Telemetry component now uses same HTTP stack as the rest of MIP, even if client application has overridden it with HttpDelegate.
- Client applications can control the threading behavior of async tasks by overriding TaskDispatcherDelegate in Profiles.
- RPMSG encryption now in preview.
- Align File/Policy SDK exception handling behavior with Protection SDK:
  - ProxyAuthError thrown by all SDKs if a proxy is configured to require authentication.
  - NoAuthTokenError thrown by all SDKs if empty auth token is provided by application's implementation of mip::AuthDelegate::AcquireOAuth2Token.
- Improved HTTP caching for Policy SDK reduces # of required HTTP calls by half.
- Richer logs/audit/telemetry for improved failure detection and debugging.
- Support for external/foreign labels to facilitate migration to AIP labels.
- Enabled support for third-party applications to download sensitivity types from SCC.
- More telemetry settings are exposed and configurable (caching/threading behavior, etc.).

### SDK Changes

- mip_common.dll split into mip_core.dll and mip_telemetry.dll.
- Renamed mip::ContentState to mip::DataState to describe how an application interacts with data at a high level.
- mip::AdhocProtectionRequiredError exception is thrown by FileHandler::SetLabel to notify an application that it must first apply ad hoc protection before applying a label.
- mip::OperationCancelledError exception is thrown when an operation is canceled (for example due to shutdown or HTTP cancellation).
- New APIs:
  - mip::ClassificationResult::GetSensitiveInformationDetections
  - mip::FileEngine::GetLastPolicyFetchTime
  - mip::FileEngine::GetDefaultSensitivityLabel
  - mip::FileEngine::GetPolicyId
  - mip::FileEngine::HasClassificationRules
  - mip::FileEngine::Settings::SetPolicyCloudEndpointBaseUrl
  - mip::FileHandler::GetDecryptedTemporaryFileAsync
  - mip::FileHandler::Observer::OnGetDecryptedTemporaryFileFailure
  - mip::FileHandler::Observer::OnGetDecryptedTemporaryFileSuccess
  - mip::File/Policy/ProtectionProfile::SetTaskDispatcherDelegate
  - mip::File/Policy/ProtectionProfile::SetTelemetryConfiguration
  - mip::HttpRequest::GetBody returns std::vector<uint8_t> instead of std::string
  - mip::HttpRequest::GetId
  - mip::PolicyEngine::GetLastPolicyFetchTime
  - mip::PolicyEngine::GetPolicyId
  - mip::PolicyEngine::HasClassificationRules
  - mip::PolicyEngine::Settings::SetCloudEndpointBaseUrl
  - mip::ProtectionDescriptor::GetContentId
  - (interface) mip::TaskDispatcherDelegate

### New Requirements

- mip::ReleaseAllResources must be called prior to process termination (after clearing references to all Profiles, Engines, and Handlers)
- (interface) mip::ExecutionState::GetClassificationResults return type and "classificationIds" parameter has changed
- (interface) mip::FileExecutionState::GetAuditMetadata can be implemented by applications to specify detailed information to surface to a tenant admin's audit dashboard (for example sender, recipients, last modified, etc.)
- (interface) mip::FileExecutionState::GetClassificationResults return type has changed, and it now requires a FileHandler parameter
- (interface) mip::FileExecutionState::GetDataState should be implemented by applications to specify how an application is interacting with contentIdentifier
- (interface) mip::HttpDelegate interface requires 'CancelOperation' and 'CancelAllOperations' methods
- (interface) mip::HttpDelegate interface 'Send' and 'SendAsync' return mip::HttpOperation instead of mip::HttpResponse
- (interface) mip::HttpResponse::GetBody returns std::vector<uint8_t> instead of std::string
- (interface) mip::HttpResponse interface requires 'GetId' method implementation
- mip::ContentLabel::GetCreationTime return std::chrono::time_point instead of std::string
- mip::FileEngine::CreateFileHandlerAsync no longer accepts 'contentIdentifier' parameter
- mip::PolicyHandler::NotifyCommitedActions renamed to mip::PolicyHandler::NotifyCommittedActions

## Version 1.1.0

**Release date**: January 15, 2019

This version introduces support for the following platforms:

- .NET
- iOS SDK (Policy SDK)
- Android SDK (Policy SDK and Protection SDK)

### New Features

- ADRMS support
- Protection SDK operations are truly asynchronous (on Win32), allowing for simultaneous non-blocking encrypt/decrypt operations
  - Application callbacks (AuthDelegate, HTTPDelegate, etc.) may now be invoked on -any- background thread
- Custom label properties set by IT administrators can now be read via mip::Label::GetCustomSettings
- Serialized publishing license can now be retrieved directly from a file without any HTTP operations via mip::FileHandler::GetSerializedPublishingLicense
- Applications are notified whether an HTTP operation is required to complete the creation of a mip::FileEngine/mip::PolicyEngine via mip::FileProfile::Observer::OnAddPolicyEngineStarting/mip::PolicyProfile::Observer::OnAddEngineStarting
- Detection of whether protected content has an expiration date or not is simplified with convenience method mip::ProtectionDescriptor::DoesContentExpire
- Classification:
  - Sensitivity types (regex expressions for CC#'s, passport #'s, etc.) can be acquired from SCC service
    - Enable feature by setting mip::FileEngine::Settings/mip::PolicyEngine::Settings flag
    - Read types via mip::FileEngine::ListSensitivityTypes/mip::PolicyEngine::ListSensitivityTypes
  - Classification results from external document scanner utilities can be fed to MIP to drive recommended/required labels based on document content
    - Pass results to MIP via mip::FileExecutionState::GetClassificationResults/mip::ExecutionState::GetClassificationResults
    - mip::ApplyLabelAction and mip::RecommendLabelAction can be returned by mip::PolicyEngine::ComputeActions when classification results match a policy rule indicating required/recommended labels

### New Requirements

- Enforced population of ID/name/version fields mip::ApplicationInfo when creating mip::FileProfile, mip::PolicyProfile, and mip::ProtectionProfile
- Applications must implement new mip::FileExecutionState interface when creating mip::FileHandlers

### New Exceptions

- mip::NoAuthTokenError thrown if application's AuthDelegate returns an empty token (due to cancellation)
  - Applies to creation of:
    - mip::FileEngine
    - mip::FileHandler
    - mip::PolicyEngine
    - mip::ProtectionHandler
- mip::NoPolicyError thrown if tenant isn't configured for labels
  - Applies to creation of:
    - mip::FileEngine
    - mip::PolicyEngine
- mip::ServiceDisabledError thrown if RMS service is disabled for a specific user/device/platform/tenant
  - Applies to creation of:
    - mip::FileHandler
    - mip::ProtectionHandler
- mip::NoPermissionsError thrown if a user doesn't have rights to decrypt a document or the content is expired
  - Applies to creation of:
    - mip::FileHandler
    - mip::ProtectionHandler

## Next steps

- See [MIP SDK FAQs and issues](faqs-known-issues.md) for information on supported platforms and more.
- See [MIP SDK setup and configuration](setup-configure-mip.md) for information on how to get started with the MIP SDK.
