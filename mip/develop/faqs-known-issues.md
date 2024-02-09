---
title: FAQs and known issues - Microsoft Information Projection SDK.
description: Microsoft Information Protection (MIP) SDK FAQs and troubleshooting guidance for issues and errors.
author: msmbaldwin
ms.service: information-protection
ms.topic: troubleshooting
ms.date: 11/14/2022
ms.author: mbaldwin
---

# Microsoft Information Protection (MIP) SDK FAQs and issues

This article provides answers to Frequently Asked Questions (FAQs), and troubleshooting guidance for known issues and common errors.

## Frequently Asked Questions
<!--
### Metadata Storage Changes

We [announced](https://aka.ms/mipsdkmetadata) that we're making a change to the label metadata storage location for Office files (Word, Excel, PowerPoint) to support new features in Office 365, SharePoint Online, and other services.

#### Metadata FAQ

**Question**: When will the first features become available that require this new storage location?

- Co-authoring for protected files in Microsoft 365 apps requires this new metadata storage location. For more details, review the [Security, Compliance, and Identity blog post](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/announcing-co-authoring-on-microsoft-information-protection/ba-p/2164162).

**Question**: Are other formats impacted, such as PDF?

- No, only Office files, specifically Word, Excel, and PowerPoint files.

**Question**: Is there a specific version of MIP SDK that is required?

- MIP SDK 1.7 and latter are fully compatible.

**Question**: Is there a specific version of the Office client that is required or use this store?

- As features are announced, the Office client is updated to use the new storage location. The new storage locations won't be used until the features are enabled by tenant administrators.

**Question**: Will the existing metadata stored as a custom property in *custom.xml* be kept up to date?

- No. The first time the document is saved after the new storage location is enabled, label metadata is moved to the new location. Metadata written via [`LabelingOptions.ExtendedProperties`](/dotnet/api/microsoft.informationprotection.file.labelingoptions.extendedproperties?view=mipsdk-dotnet-1.7&preserve-view=true#Microsoft_InformationProtection_File_LabelingOptions_ExtendedProperties) remains in *custom.xml*.

**Question**: Will it be possible to read the label metadata without MIP SDK? 

- Yes, but you'll need to implement your own code to parse the file and extract the information.

**Question**: Currently, it's easy to "read" the label by extracting the key/value pair strings from the file. Will reading still be possible in this manner? 

- Yes, the metadata is still available in the Office file XML to be read. However, it should be noted that your application will need to understand whether the new feature set is enabled to know which section is authoritative (custom.xml vs. labelinfo.xml). Review [MS-OFFCRYPTO: LabelInfo versus Custom Document Properties | Microsoft Docs.](/openspecs/office_file_formats/ms-offcrypto/13939de6-c833-44ab-b213-e0088bf02341) for implementation details.
  
**Question**: How can I discover if the new features are enabled? 

- We will share this information as we approach the feature release dates. 

**Question**: How will labels be migrated?

- The following logic is used to determine which section is read and used to read or write label data.

| Action | Feature Not Enabled                                                                    | Feature Enabled                                                                                                                                                        |
| ------ | -------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Read   | Label in custom.xml (unprotected) or Doc SummaryInfo (protected).                      | If label exists in labelinfo.xml, it is the effective label.<br> If there's no label in labelinfo.xml, label in custom.xml or Doc SummaryInfo is the effective label. |
| Write  | All new labels are written to custom.xml (unprotected) or Doc SummaryInfo (protected). | All new labels are written to labelinfo.xml.                                                                                                                         |
--->  
### File Parsing

**Question**: Can I write to the same file that I'm currently reading with the File SDK?

The MIP SDK does not support concurrently reading and writing the same file. Any labeled files will result in a *copy* of the input file with the label actions applied. Your application must replace the original with the labeled file.

### SDK string handling

**Question**: How does the SDK handle strings, and what string type should I be using in my code?

The SDK is intended to be used cross-platform, and uses [UTF-8 (Unicode Transformation Format - 8-bit)](https://wikipedia.org/wiki/UTF-8) for string handling. Specific guidance depends on the platform you're using:

| Platform        | Guidance                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| --------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Windows native  | For C++ SDK clients, the C++ Standard Library type [`std::string`](https://wikipedia.org/wiki/C%2B%2B_string_handling) is used for passing strings to/from API functions. Conversion to/from UTF-8 is managed internally by the MIP SDK. When a `std::string` is returned from an API, you must expect UTF-8 encoding and manage accordingly if converting the string. In some cases, a string is returned as part of a `uint8_t` vector (such as a publishing license (PL)), but should be treated as an opaque blob.<br><br>For more information and examples, see:<ul><li>[WideCharToMultiByte function](/windows/desktop/api/stringapiset/nf-stringapiset-widechartomultibyte) for assistance with converting wide character strings to multi-byte, such as UTF-8.<li>The following sample files included in the [SDK download](setup-configure-mip.md#configure-your-client-workstation):<ul><li>Sample string utility functions in `file\samples\common\string_utils.cpp`, for converting to/from wide UTF-8 strings.<li>An implementation of `wmain(int argc, wchar_t *argv[])` in `file\samples\file\main.cpp`, which uses the preceding string conversion functions.</li></ul></ul> |
| .NET            | For .NET SDK clients, all strings use the default UTF-16 encoding and no special conversion is needed. Conversion to/from UTF-16 is managed internally by the MIP SDK.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| Other platforms | All other platforms supported by the MIP SDK have native support for UTF-8.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
### Content Marking

**Question**: Does the MIP SDK support content marking? 

MIP SDK doesn't support direct application of content marking, including header, footer, or watermark, on any files. When writing the label metadata to a file, the File SDK writes the *contentBits* metadata property to indicate that protection was applied (if configured) and *will not* write the properties that indicate header, footer, or watermark were applied. When the file is opened in an application that supports content marking, the content marking configuration should be evaluated by the application and written to the file on save. 

### Protection and UPE SDKs on Android
**Question**: Which shared library should I use for integrating the MIP SDK into my Android application?

The MIP SDK Android binaries include `libmip_core.so`, `libmip_protection_sdk.so`, `libmip_upe_sdk.so` and `lipmip_unified.so`. `libmip_unified.so` is the recommended library that includes the core, protection and policy shared libraries.

## Compliance

**Question**: Is the Microsoft Information Protection SDK FIPS 140-2 compliant? 

The Microsoft Information Protection SDK uses FIPS 140-2 approved ciphers but not FIPS 140-2 validated cryptographic libraries today. Applications consuming the MIP SDK need to be aware that the SDK is not considered FIPS compliant at this time. For more information, see the article on [FIPS 140-2 compliance](concept-fips-compliance.md). 

## Issues and errors reference

### Error: "File format not supported"  

**Question**: Why do I get the following error when attempting to protect or label a PDF file?

> File format not supported

This exception results from attempting to protect or label a PDF file that has been digitally signed or password protected. See [New support for PDF encryption with Microsoft Information Protection](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/New-support-for-PDF-encryption-with-Microsoft-Information/ba-p/262757) for more information on protecting and labeling PDF files.

### Error: "Failed to parse the acquired Compliance Policy"  

**Question**: Why do I get the following error after downloading the MIP SDK and attempting to use the file sample to list all labels?

> Something bad happened: Failed to parse the acquired Compliance Policy. Failed with: [class mip::CompliancePolicyParserException] Tag not found: policy, NodeType: 15, Name: No Name Found, Value: , Ancestors: `<SyncFile><Content>`, correlationId:[34668a40-blll-4ef8-b2af-00005aa674z9]

This error indicates that you haven't migrated your labels from Azure Information Protection to the unified labeling experience. Follow [How to migrate Azure Information Protection labels to unified sensitivity labels](/azure/information-protection/configure-policy-migrate-labels) to migrate the labels, then create a Label Policy in Office 365 Security and compliance portal. 

### Error: "NoPolicyException: Label policy did not contain data"

**Question**: Why do I get the following error when trying to read a label or list labels via MIP SDK?

> NoPolicyException: Label policy did not contain data, CorrelationId=GUID, CorrelationId.Description=PolicyProfile, NoPolicyError.Category=SyncFile, NoPolicyError.Category=SyncFile

This error indicates that a label policy has not been published in the Microsoft Purview compliance portal. Follow [Create and configure sensitivity labels and their policies](/microsoft-365/compliance/create-sensitivity-labels) to configure the labeling policy.

### Error: "System.ComponentModel.Win32Exception: LoadLibrary failed"

**Question**: Why do I get the following error when using the MIP SDK .NET Wrapper?

> System.ComponentModel.Win32Exception: LoadLibrary failed for: [sdk_wrapper_dotnet.dll] when calling MIP.Initialize().

Your application does not have the required runtime, or was not built as Release. See [Ensure your app has the required runtime](setup-configure-mip.md#ensure-your-app-has-the-required-runtime) for more information. 

### Error: "ProxyAuthError exception"

**Question**: Why do I get the following error when using the MIP SDK?

> "ProxyAuthenticatonError: Proxy authentication is unsupported"

The MIP SDK doesn't support the use of authenticated proxies. To fix this message, proxy administrators should set the Microsoft Purview Information Protection service endpoints to bypass the proxy. A list of those endpoints is available at the [Office 365 URLs and IP address ranges](/office365/enterprise/urls-and-ip-address-ranges) page. MIP SDK requires that `*.protection.outlook.com` (row 9) and the Azure Information Protection service endpoints (row 73) bypass proxy authentication.

### Error: "Unknown Error" when labeling an image file using a stream output

**Question:** Why do I get an "unknown error" when I attempt to add or remove a label or protection from an image file type using a stream for output?

When using a stream for output, the stream must have both read and write access to modify the label or protection for an image file.

