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

| Operating system | Versions |  
|------------------|----------|
| Ubuntu  |  16.04 |
| RedHat Enterprise Linux | 7 with devtoolset-7 |
| Debian  | 9 |
| macOS   | High Sierra and later |
| Windows | All supported versions, 32 bit and 64 bit |

### Question: what string type does the SDK use, and what type should I be using in my code?

The SDK is intended to be used cross-platform, and uses [UTF-8 (Unicode Transformation Format - 8-bit)](https://wikipedia.org/wiki/UTF-8) for string handling. Specific guidance depends on the platform you are using:

| Platform | Guidance |
|-|-|
| .NET | All strings that are passed from/to native code to/from managed code are converted from/to utf-8. |
| Windows native | The [C++ Standard Library type `std::string`](https://wikipedia.org/wiki/C%2B%2B_string_handling) is used for passing strings to/from API functions. As such, the contents of string type variables carry the utf-8 multibyte character encoding, which must be accomodated when doing string conversion operations. |
| Other platforms | TBD |


## Known issues

### Error: "Failed to parse the acquired Compliance Policy"  

You downloaded the MIP SDK and ran the sample applications. You use the file sample to try to list all labels, but you get the following error:

| Error | Solution |
|-|-|
|*Something bad happend: Failed to parse the acquired Compliance Policy. Failed with: [class mip::CompliancePolicyParserException] Tag not found : policy, NodeType: 15, Name: No Name Found, Value: , Ancestors: <SyncFile><Content>, correlationId:[34668a40-blll-4ef8-b2af-00005aa674z9]*| This indicates that you haven't migrated your labels from Azure Information Protection, to the unified labeling experience! Follow [How to migrate Azure Information Protection labels to the Office 365 Security & Compliance Center](/azure/information-protection/configure-policy-migrate-labels) to migrate the labels, then create a Label Policy in Office 365 Security and Compliance Center. Once that's complete, the sample will run successfully.|
