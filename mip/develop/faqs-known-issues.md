---
title: FAQs and known issues - Microsoft Information Projection SDK.
description: Microsoft Information Protection (MIP) SDK FAQs and troubleshooting guidance for known issues.
author: BryanLa
ms.service: information-protection
ms.topic: troubleshooting
ms.date: 10/08/2018
ms.author: bryanla
---

# Microsoft Information Protection (MIP) SDK FAQs and known issues

## Frequently Asked Questions (FAQs)

### Question: which platforms are supported by the MIP SDK?

The MIP SDK is supported on the following platforms:

[!INCLUDE [MIP SDK platform support](..\include\mip-sdk-platform-support.md)]

### Question: what string type does the SDK use, and what type should I be using in my code?

The SDK is intended to be used cross-platform, and uses [UTF-8 (Unicode Transformation Format - 8-bit)](https://wikipedia.org/wiki/UTF-8) for string handling. Specific guidance depends on the platform you are using:

| Platform | Guidance |
|-|-|
| .NET | All strings that are passed from/to native code to/from managed code are converted from/to utf-8. |
| Windows native | The C++ Standard Library types `std::string`](https://wikipedia.org/wiki/C%2B%2B_string_handling) and vectors of `uint8_t`, are used for passing strings to/from API functions. Internally, MIP APIs manage conversion to/from UTF-8 encoding when using the strings. As such, when a string is returned to your code from an API, you must expect UTF-8 encoding and manage accordingly when using/converting the string. For additional details and examples, see:<br><br> - [WideCharToMultiByte function](/windows/desktop/api/stringapiset/nf-stringapiset-widechartomultibyte) for assistance with converting wide character strings to multi-byte, such as UTF-8.<br>- SDK [sample string utility functions](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/samples/common/string_utils.cpp) for converting to/from wide strings<br>- An [example of wmain(int argc, wchar_t *argv[])](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/samples/file/main.cpp#L656) using the string conversion functions |
| Other platforms | All other platforms supported by the MIP SDK have native support for UTF-8. |


## Known issues

### Error: "Failed to parse the acquired Compliance Policy"  

You downloaded the MIP SDK and ran the sample applications. You use the file sample to try to list all labels, but you get the following error:

| Error | Solution |
|-|-|
|*Something bad happend: Failed to parse the acquired Compliance Policy. Failed with: [class mip::CompliancePolicyParserException] Tag not found : policy, NodeType: 15, Name: No Name Found, Value: , Ancestors: <SyncFile><Content>, correlationId:[34668a40-blll-4ef8-b2af-00005aa674z9]*| This indicates that you haven't migrated your labels from Azure Information Protection, to the unified labeling experience! Follow [How to migrate Azure Information Protection labels to the Office 365 Security & Compliance Center](/azure/information-protection/configure-policy-migrate-labels) to migrate the labels, then create a Label Policy in Office 365 Security and Compliance Center. Once that's complete, the sample will run successfully.|
