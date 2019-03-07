---
title: FAQs and known issues - Microsoft Information Projection SDK.
description: Microsoft Information Protection (MIP) SDK FAQs and troubleshooting guidance for issues and errors.
author: msmbaldwin
ms.service: information-protection
ms.topic: troubleshooting
ms.collection: M365-security-compliance
ms.date: 03/05/2019
ms.author: mbaldwin
---

# Microsoft Information Protection (MIP) SDK FAQs and issues

This article provides answers to Frequently Asked Questions (FAQs), and troubleshooting guidance for known issues and common errors.

## Frequently Asked Questions 

### SDK string handling

**Question**: How does the SDK handle strings, and what string type should I be using in my code?

The SDK is intended to be used cross-platform, and uses [UTF-8 (Unicode Transformation Format - 8-bit)](https://wikipedia.org/wiki/UTF-8) for string handling. Specific guidance depends on the platform you're using:

| Platform | Guidance |
|-|-|
| Windows native | For C++ SDK clients, the C++ Standard Library type [`std::string`](https://wikipedia.org/wiki/C%2B%2B_string_handling) is used for passing strings to/from API functions. Conversion to/from UTF-8 is managed internally by the MIP SDK. When a `std::string` is returned from an API, you must expect UTF-8 encoding and manage accordingly if converting the string. In some cases, a string is returned as part of a `uint8_t` vector (such as a publishing license (PL)), but should be treated as an opaque blob.<br><br>For more information and examples, see:<ul><li>[WideCharToMultiByte function](/windows/desktop/api/stringapiset/nf-stringapiset-widechartomultibyte) for assistance with converting wide character strings to multi-byte, such as UTF-8.<li>The following sample files included in the [SDK download](setup-configure-mip.md#configure-your-client-workstation):<ul><li>Sample string utility functions in `file\samples\common\string_utils.cpp`, for converting to/from wide UTF-8 strings.<li>An implementation of `wmain(int argc, wchar_t *argv[])` in `file\samples\file\main.cpp`, which uses the preceding string conversion functions.</li></ul></ul>|
| .NET | For .NET SDK clients, all strings use the default UTF-16 encoding and no special conversion is needed. Conversion to/from UTF-16 is managed internally by the MIP SDK. |
| Other platforms | All other platforms supported by the MIP SDK have native support for UTF-8. |

## Issues and errors reference

### Error: "File format not supported"  

**Question**: Why do I get the following error when attempting to protect or label a PDF file?

> File format not supported

This exception results from attempting to protect or label a PDF file that has been digitally signed or password protected. See [New support for PDF encryption with Microsoft Information Protection](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/New-support-for-PDF-encryption-with-Microsoft-Information/ba-p/262757) for more information on protecting and labeling PDF files.

### Error: "Failed to parse the acquired Compliance Policy"  

**Question**: Why do I get the following error after downloading the MIP SDK and attempting to use the file sample to list all labels?

> Something bad happened: Failed to parse the acquired Compliance Policy. Failed with: [class mip::CompliancePolicyParserException] Tag not found: policy, NodeType: 15, Name: No Name Found, Value: , Ancestors: <SyncFile><Content>, correlationId:[34668a40-blll-4ef8-b2af-00005aa674z9]

This indicates that you haven't migrated your labels from Azure Information Protection to the unified labeling experience. Follow [How to migrate Azure Information Protection labels to the Office 365 Security & Compliance Center](/azure/information-protection/configure-policy-migrate-labels) to migrate the labels, then create a Label Policy in Office 365 Security and Compliance Center. 

### Error: "System.ComponentModel.Win32Exception: LoadLibrary failed"

**Question**: Why do I get the following error when using the MIP SDK .NET Wrapper?

> System.ComponentModel.Win32Exception: LoadLibrary failed for: [sdk_wrapper_dotnet.dll] when calling MIP.Initialize().

Your application does not have the required runtime, or was not built as Release. See [Ensure your app has the required runtime](setup-configure-mip.md#ensure-your-app-has-the-required-runtime) for more information. 
