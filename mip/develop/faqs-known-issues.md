---
title: FAQs and known issues - Microsoft Information Projection SDK.
description: Microsoft Information Protection (MIP) SDK FAQs and troubleshooting guidance for known issues.
author: BryanLa
ms.service: information-protection
ms.topic: troubleshooting
ms.date: 10/19/2018
ms.author: bryanla
---

# Microsoft Information Protection (MIP) SDK FAQs and known issues

## Frequently Asked Questions (FAQs)

### Question: which platforms are supported by the MIP SDK?

The MIP SDK is supported on the following platforms:

[!INCLUDE [MIP SDK platform support](../include/mip-sdk-platform-support.md)]

### Question: how does the SDK handle strings, and what string type should I be using in my code?

The SDK is intended to be used cross-platform, and uses [UTF-8 (Unicode Transformation Format - 8-bit)](https://wikipedia.org/wiki/UTF-8) for string handling. Specific guidance depends on the platform you're using:

| Platform | Guidance |
|-|-|
| Windows native | For C++ SDK clients, the C++ Standard Library type [`std::string`](https://wikipedia.org/wiki/C%2B%2B_string_handling) is used for passing strings to/from API functions. Conversion to/from UTF-8 is managed internally by the MIP SDK. When a `std::string` is returned from an API, you must expect UTF-8 encoding and manage accordingly if converting the string. In some cases, a string is returned as part of a `uint8_t` vector (such as a publishing license (PL)), but should be treated as an opaque blob.<br><br>For more information and examples, see:<ul><li>[WideCharToMultiByte function](/windows/desktop/api/stringapiset/nf-stringapiset-widechartomultibyte) for assistance with converting wide character strings to multi-byte, such as UTF-8.<li>The following sample files included in the [SDK download](setup-configure-mip.md#configure-your-client-workstation):<ul><li>Sample string utility functions in `file\samples\common\string_utils.cpp`, for converting to/from wide UTF-8 strings.<li>An implementation of `wmain(int argc, wchar_t *argv[])` in `file\samples\file\main.cpp`, which uses the preceding string conversion functions.</li></ul></ul>|
| .NET | For .NET SDK clients, all strings use the default UTF-16 encoding and no special conversion is needed. Conversion to/from UTF-16 is managed internally by the MIP SDK. |
| Other platforms | All other platforms supported by the MIP SDK have native support for UTF-8. |

## Known issues

### Error: "Failed to parse the acquired Compliance Policy"  

You downloaded the MIP SDK and ran the sample applications. You use the file sample to try to list all labels, but you get the following error:

| Error | Solution |
|-|-|
|*Something bad happened: Failed to parse the acquired Compliance Policy. Failed with: [class mip::CompliancePolicyParserException] Tag not found: policy, NodeType: 15, Name: No Name Found, Value: , Ancestors: <SyncFile><Content>, correlationId:[34668a40-blll-4ef8-b2af-00005aa674z9]*| This indicates that you haven't migrated your labels from Azure Information Protection, to the unified labeling experience! Follow [How to migrate Azure Information Protection labels to the Office 365 Security & Compliance Center](/azure/information-protection/configure-policy-migrate-labels) to migrate the labels, then create a Label Policy in Office 365 Security and Compliance Center. Once that's complete, the sample will run successfully.|
