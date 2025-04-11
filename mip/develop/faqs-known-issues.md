---
title: FAQs and known issues - Microsoft Information Projection SDK.
description: Microsoft Information Protection (MIP) SDK FAQs and troubleshooting guidance for issues and errors.
author: msmbaldwin
ms.service: information-protection
ms.topic: troubleshooting
ms.date: 04/10/2025
ms.author: mbaldwin
---

# Microsoft Information Protection (MIP) SDK FAQs and issues

This article provides answers to Frequently Asked Questions (FAQs), and troubleshooting guidance for known issues and common errors.

## Frequently Asked Questions

**Question** : How many labels are supported by MIP SDK?
- MIP SDK can handle up to 500 protection labels, and there is no limit for labels without protection.

**Question** : Does MIP SDK support relabeling .pfile types with classification labels?
- No, this is by design because pfiles are protected file types. Decrypt with the MPIP File Labeler before classification.

**Question** : Why are protected files downloaded from Microsoft Teams failing to decrypt?
- This is a known issue in unsupported versions of the MIP SDK. Upgrade to the latest version of the MIP SDK.

**Question** : How do I check what labels are applied when multiple labels from different tenants are applied to a file?
- Query the [GetLabel](/information-protection/develop/reference/class_mip_filehandler#summary) in the context of the user for each tenant.

**Question** : Why is my web application failing to initialize with “InternalError: 'KeyStoreWin32::OpenKey failure: NCryptOpenKey:-2147024894'”?
- The policy SDK may fail to load a profile during app initialization. Set WEBSITE_LOAD_USER_PROFILE=1 in the environment variable setting of your web app and restart the application.
   - **Name** : WEBSITE_LOAD_USER_PROFILE
   - **Value** : 1

**Question** : Why does my application fail with “KeyStoreWin32::OpenKey failure: NCryptOpenKey:-2146893788” when OnDiskEncrypted caching is configured?
- Windows may create temporary profiles when your log-in profile is unavailable. Reading from the Windows registry for OnDiskEncrypted caching [Link](/information-protection/develop/concept-cache-storage) with this temporary profile causes OpenKey failure in the MIP SDK log and is captured by the Windows operating system event logs with Event Id 1511 & 1515. To resolve this issue, contact your admin to fix the issue creating temporary profiles.

### Metadata Storage Changes

We [announced](https://aka.ms/mipsdkmetadata) that we're making a change to the label metadata storage location for Office files (Word, Excel, PowerPoint) to support new features in Office 365, SharePoint Online, and other services.

#### Metadata FAQ

**Question**: Are other formats impacted, such as PDF?

- No, only Office files, specifically Word, Excel, and PowerPoint files.

**Question**: Is there a specific version of MIP SDK that is required?

- MIP SDK 1.7 and later are fully compatible.

**Question**: Is there a specific version of the Office client that is required to use this storage location?

- All Microsoft 365 Apps clients released after September 2021 support this new metadata location. The new storage location isn't used until the tenant administrators enables the protected coauthoring feature.

**Question**: Is existing metadata stored as a custom property in *custom.xml* be kept up to date?

- No. The first time the document is saved after the new storage location is enabled, label metadata is moved to the new location. Metadata written via [`LabelingOptions.ExtendedProperties`](/dotnet/api/microsoft.informationprotection.file.labelingoptions.extendedproperties?view=mipsdk-dotnet-1.7&preserve-view=true#Microsoft_InformationProtection_File_LabelingOptions_ExtendedProperties) remains in *custom.xml*.

**Question**: Is it possible to read the label metadata without MIP SDK? 

- Yes, but you need to implement your own code to parse the file and extract the information.

**Question**: Currently, it's easy to "read" the label by extracting the key/value pair strings from the file. Can metadata still be read in this manner?

- Yes, the metadata is still available in the Office file XML to be read. Your application must read the coauthoring setting from the policy file to know that the new feature set is enabled. This setting defines where to read/write the label data (custom.xml vs. labelinfo.xml). Review [MS-OFFCRYPTO: LabelInfo versus Custom Document Properties | Microsoft Docs.](/openspecs/office_file_formats/ms-offcrypto/13939de6-c833-44ab-b213-e0088bf02341) for implementation details.

**Question**: How do I determine if coauthoring is enabled in the label policy?
The state of the coauthoring setting is returned from the policy engine. An application can read the raw bytes from the policy engine to determine coauthoring status.

**Question**: How are labels migrated to the new location?

- The following logic is used to determine which section is read and used to read or write label data.

| Action | Feature Not Enabled                                                                    | Feature Enabled                                                                                                                                                        |
| ------ | -------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Read   | Label in custom.xml (unprotected) or Doc SummaryInfo (protected).                      | If label exists in labelinfo.xml, it's the effective label.<br> If there's no label in labelinfo.xml, label in custom.xml or Doc SummaryInfo is the effective label. |
| Write  | All new labels are written to custom.xml (unprotected) or Doc SummaryInfo (protected). | All new labels are written to labelinfo.xml.                                                                                                                         |

### File Parsing

**Question**: Can I write to the same file that I'm currently reading with the File SDK?

The MIP SDK doesn't support concurrently reading and writing the same file. Any labeled files result in a *copy* of the input file with the label actions applied. Your application must replace the original with the labeled file.

### SDK string handling

**Question**: How does the SDK handle strings, and what string type should I be using in my code?

The SDK is intended to be used cross-platform, and uses [UTF-8 (Unicode Transformation Format - 8-bit)](https://wikipedia.org/wiki/UTF-8) for string handling. Specific guidance depends on the platform you're using:

| Platform        | Guidance                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| --------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Windows native  | For C++ SDK clients, the C++ Standard Library type [`std::string`](https://wikipedia.org/wiki/C%2B%2B_string_handling) is used for passing strings to/from API functions. MIP SDK internally manages conversion to/from UTF-8. When a `std::string` is returned from an API, you must expect UTF-8 encoding and manage accordingly if converting the string. In some cases, a string is returned as part of a `uint8_t` vector (such as a publishing license (PL)), but should be treated as an opaque blob.<br><br>For more information and examples, see:<ul><li>[WideCharToMultiByte function](/windows/desktop/api/stringapiset/nf-stringapiset-widechartomultibyte) for assistance with converting wide character strings to multi-byte, such as UTF-8.<li>The following sample files included in the [SDK download](setup-configure-mip.md#configure-your-client-workstation):<ul><li>Sample string utility functions in `file\samples\common\string_utils.cpp`, for converting to/from wide UTF-8 strings.<li>An implementation of `wmain(int argc, wchar_t *argv[])` in `file\samples\file\main.cpp`, which uses the preceding string conversion functions.</li></ul></ul> |
| .NET            | For .NET SDK clients, all strings use the default UTF-16 encoding and no special conversion is needed. MIP SDK internally manages conversion to/from UTF-16.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| Other platforms | All other platforms supported by the MIP SDK have native support for UTF-8.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
### Content Marking

**Question**: Does the MIP SDK support content marking? 

MIP SDK doesn't support direct application of content marking, including header, footer, or watermark, on any files. When label metadata is written to a file, the File SDK writes the *contentBits* metadata property to indicate that protection was applied (if configured). It doesn't write the properties that indicate header, footer, or watermark were applied. When the file is opened in an application, the content marking configuration should be evaluated by the application and written to the file on save.

### Protection and Policy SDK on Android
**Question**: Which shared library should I use for integrating the MIP SDK into my Android application?

The MIP SDK Android binaries include `libmip_core.so`, `libmip_protection_sdk.so`, `libmip_upe_sdk.so` and `lipmip_unified.so`. `libmip_unified.so` is the recommended library that includes the core, protection, and policy shared libraries.

## Compliance

**Question**: Is the Microsoft Information Protection SDK Federal Information Processing Standard (FIPS) 140-2 compliant? 

See [FIPS 140-2 Validation](/information-protection/develop/concept-fips-compliance).

## Issues and errors reference

### Error: "File format not supported"  

**Question**: Why do I get the following error when attempting to protect or label a PDF file?

> File format not supported

This exception results from attempting to protect or label a PDF file that is digitally signed or password protected. See [New support for PDF encryption with Microsoft Information Protection](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/New-support-for-PDF-encryption-with-Microsoft-Information/ba-p/262757) for more information on protecting and labeling PDF files.

### Error: "NoPolicyException: Label policy didn't contain data"

**Question**: Why do I get the following error when trying to read a label or list labels via MIP SDK?

> NoPolicyException: Label policy didn't contain data, CorrelationId=GUID, CorrelationId.Description=PolicyProfile, NoPolicyError.Category=SyncFile, NoPolicyError.Category=SyncFile

This error indicates that a label policy isn't published in the Microsoft Purview compliance portal. Follow [Create and configure sensitivity labels and their policies](/microsoft-365/compliance/create-sensitivity-labels) to configure the labeling policy.

If a labeling policy has been published, ensure that the user account is included in any groups that are part of the *published to* section of the label policy configuration. For more information, review [Create and publish sensitivity labels](/purview/create-sensitivity-labels#publish-sensitivity-labels-by-creating-a-label-policy).
 
External users, including guest users, cannot access another organization's label policies. To accommodate these users, implement a retry mechanism. If a `NoPolicyException` is thrown, set the `FileEngineSettings` property [ProtectionOnlyEngine](
/information-protection/develop/reference/class_mip_fileengine_settings#setprotectiononlyengine-function)
to true and retry the request. Labeling operations will not be available for that `IFileEngine` instance, but protection operations will be available. 

### Error: "System.ComponentModel.Win32Exception: LoadLibrary failed"

**Question**: Why do I get the following error when using the MIP SDK .NET Wrapper?

> System.ComponentModel.Win32Exception: LoadLibrary failed for: [sdk_wrapper_dotnet.dll] when calling MIP.Initialize().

Your application doesn't have the required runtime, or was not built as Release. See [Ensure your app has the required runtime](setup-configure-mip.md#ensure-your-app-has-the-required-runtime) for more information. 

### Error: "ProxyAuthError exception"

**Question**: Why do I get the following error when using the MIP SDK?

> "ProxyAuthenticatonError: Proxy authentication is unsupported"

The MIP SDK doesn't support the use of authenticated proxies. To fix this message, proxy administrators should set the Microsoft Purview Information Protection service endpoints to bypass the proxy. A list of those endpoints is available at the [Office 365 URLs and IP address ranges](/office365/enterprise/urls-and-ip-address-ranges) page. MIP SDK requires that `*.protection.outlook.com` (row 9) and the Azure Information Protection service endpoints (row 73) bypass proxy authentication.

### Error: "Unknown Error" when labeling an image file using a stream output

**Question:** Why do I get an "unknown error" when I attempt to add or remove a label or protection from an image file type using a stream for output?

When using a stream for output, the stream must have both read and write access to modify the label or protection for an image file.

**Question:** Are there any service-based throttling limits when using the MIP SDK?

The protection service, used by the protection SDK or protection operations in the File SDK, has a limit of 7,500 requests per 10 seconds for an entire organization. That is, if Application A is generating 4,000 requests per 10 seconds and Application B in the same organization is generating 4,000 requests per 10 seconds, both applications may start to receive `HTTP 429 Too Many Requests` responses. Developers must implement a backoff period when these exceptions are received.
