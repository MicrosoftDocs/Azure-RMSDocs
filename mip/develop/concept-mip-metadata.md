---
title: Concepts - Label metadata in the MIP SDK
description: This article helps you understand the metadata that the Microsoft Information Protection SDK generates.
author: tommoser
ms.service: azure-information-protection
ms.topic: conceptual
ms.date: 04/10/2025
ms.author: tommos
---
# Microsoft Information Protection SDK - Metadata

The Microsoft Information Protection SDK generates the set of metadata that should be applied to a file. This metadata is a representation of the label. This document describes the metadata the SDK generates to apply to mail, documents, and other records.

## Labels

Labels in the Microsoft Information Protection SDK are applied to information to describe the sensitivity of that information. Label data is persisted to file or record in a set of key-value pairs that describe the label. The metadata name is built on the following structure:

`DefinedPrefix_ElementType_GlobalIdentifier_AttributeName`

When applied to data labeled with Microsoft Purview Information Protection, the result is:

`MSIP_Label_GUID_Enabled = true`

The GUID is a unique identifier for each label in an organization. An object can only have **one** label from the same organization. Multiple labels from the same organization can't be written to a file or object. 

## Microsoft Information Protection SDK Metadata

The MIP SDK applies the following set of metadata.

| Attribute                                       | Type or Value                 | Description                                                                                                                                                                                                                         | Mandatory |
| ----------------------------------------------- | ----------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------- |
| **Enabled**                                     | True or False                 | This attribute indicates whether the classification represented by this set of key-value pairs is enabled for the data item. DLP products typically validate the existence of this key to identify the classification label.        | Yes       |
| **SiteId**                                      | GUID                          | Microsoft Entra tenant ID                                                                                                                                                                                                    | Yes       |
| **ActionId** (Removed in MIP SDK 1.8 and later) | GUID                          | ActionID is changed each time a label is set. Audit logs include both old and new actionID to allow chaining of labeling activity to the data item.                                                                            | Yes       |
| **Method**                                      | Standard or Privileged        | Set via [mip::AssignmentMethod](https://microsoftdocs.github.io/mip-sdk-docs/cpp/common__types_8h.html#a1368c269afcb86a2b4c3331a0a1f4ae9). Standard implies that the label is applied by default or automatically. Privileged implies that the label was manually selected.         | No        |
| **SetDate**                                     | Extended ISO 8601 Date Format | The timestamp when the label was set.                                                                                                                                                                                               | No        |
| **Name**                                        | string                        | Label unique name within the tenant. It doesn't necessarily correspond to display name.                                                                                                                                             | No        |
| **ContentBits**                                 | integer                       | [ContentBits](#contentbits) is a bitmask that describes the types of content marking that was applied to content based on policy and client capabilities. CONTENT_HEADER = 0X1, CONTENT_FOOTER = 0X2, WATERMARK = 0X4, ENCRYPT = 0x8 | No                                              |

When applied to a file, the result is similar to the table below.

| Key                                                         | Value                                |
| ----------------------------------------------------------- | ------------------------------------ |
| MSIP_Label_2096f6a2-d2f7-48be-b329-b73aaa526e5d_Enabled     | true                                 |
| MSIP_Label_2096f6a2-d2f7-48be-b329-b73aaa526e5d_SetDate     | 2018-11-08T21:13:16-0800             |
| MSIP_Label_2096f6a2-d2f7-48be-b329-b73aaa526e5d_Method      | Privileged                           |
| MSIP_Label_2096f6a2-d2f7-48be-b329-b73aaa526e5d_Name        | Confidential                         |
| MSIP_Label_2096f6a2-d2f7-48be-b329-b73aaa526e5d_SiteId      | cb46c030-1825-4e81-a295-151c039dbf02 |
| MSIP_Label_2096f6a2-d2f7-48be-b329-b73aaa526e5d_ContentBits | 2                                    |
| MSIP_Label_2096f6a2-d2f7-48be-b329-b73aaa526e5d_ActionId    | 88124cf5-1340-457d-90e1-0000a9427c99 |


## ContentBits

The `contentBits` metadata property in MIP SDK is used to indicate which content-modifying actions were taken on a file by the labeling application. 

`contentBits` can be read by downstream applications to understand which actions were applied to the file. Using this property, an application like Word, Excel, or PowerPoint can compare the value on the file metadata to the value it computes based on the policy. If there's a difference, it may apply the missing information.

Take, for example, the MIP File SDK. It doesn't support applying header, footer, or watermark directly to a file. When a file is labeled with MIP SDK, the only outcomes for contentBits are `0x0` if the file is **unprotected** or `0x8` if the file is **protected**. This is true even if the label policy has header, footer, and watermark configured. 

When the file is opened in Microsoft Word, the header, footer, and watermark will be missing. When the user clicks **save** the policy is reevaluated and contentBits on the file is compared to the policy result. If there's a difference, the application applies the missing content marking.

> [!Note]
> This feature requires the Microsoft Purview Information Protection client today, and works only in Word, Excel, or PowerPoint. It does not apply to Outlook. 

## Extending Metadata with Custom Attributes

Custom metadata may be appended via File and Policy SDK. Custom attributes must maintain the base `MSIP_Label_GUID` prefix.

For example, an application written by Contoso Corporation must apply metadata indicating which system generated a labeled file. The application can create a new label, prefixed with `MSIP_Label_GUID`. The software vendor name and custom attribute are appended to the prefix to generate the custom metadata.

```csharp
LabelingOptions options = new()
{
    AssignmentMethod = AssignmentMethod.Standard
};

options.ExtendedProperties = new List<KeyValuePair<string, string>>();
options.ExtendedProperties.Add(new KeyValuePair<string, string>("GeneratedBy", "HRReportingSystem"));
```

```
MSIP_Label_f048e7b8-f3aa-4857-bf32-a317f4bc3f29_GeneratedBy = HRReportingSystem
```

> [!Note]
> To maintain compatibility across common applications, the maximum length for each a key and a value is 255 characters.

> [!Note]
> When the [protected co-authoring](/purview/sensitivity-labels-coauthoring) experience is enabled, custom metadata properties will be written to the custom.xml component of supported Office file types.

## Versioning

Over time, attributes will be introduced, modified, or retired. It's expected that applications continue to handle these old or retired attributes, as replacing the value across an enterprise may take years.

When replacing an attribute with a newer version, a version suffix should be added to the attribute:

`MSIP_Label_GUID_EnabledV2 = True | False | Condition`

## Support for Protected Coauthoring

When [co-authoring for files encrypted with sensitivity labels](/purview/sensitivity-labels-coauthoring) is enabled, the label metadata storage location and format for Word, Excel, and PowerPoint files change.

When the co-authoring feature is enabled, the SDK automatically reads and writes information to and from the updated metadata storage location. If label metadata doesn't exist in the new location, the SDK will attempt to read the metadata from the legacy storage location. If found, the label is available via get label operations. The next time a set label operation is performed, the metadata is written to the updated LabelInfo locations.

The purpose of the properties as previously described doesn't change.

The following references describe the format and storage locations:

- [LabelInfo Stream Schema](/openspecs/office_file_formats/ms-offcrypto/b75503d0-ada1-4eca-adc1-adeb643ab813)
- [LabelInfo Stream Locations](/openspecs/office_file_formats/ms-offcrypto/0c4ec12d-aba0-4dd4-8fd1-710da6735219)

## Email

Metadata applied to email maintains a key/value pair format similar to that of documents. The primary difference is that all attributes are serialized in to a single email header called **MSIP_Labels**. The key/value pairs are delimited by a semicolon and a whitespace, and placed in the new header.

Using the sample metadata above:

```
MSIP_Labels: MSIP_Label_2096f6a2-d2f7-48be-b329-b73aaa526e5d_Enabled=true; MSIP_Label_2096f6a2-d2f7-48be-b329-b73aaa526e5d_SetDate=2018-11-08T21:13:16-0800; MSIP_Label_2096f6a2-d2f7-48be-b329-b73aaa526e5d_Method=Privileged; MSIP_Label_2096f6a2-d2f7-48be-b329-b73aaa526e5d_Name=Confidential; MSIP_Label_2096f6a2-d2f7-48be-b329-b73aaa526e5d_SiteId=cb46c030-1825-4e81-a295-151c039dbf02; MSIP_Label_2096f6a2-d2f7-48be-b329-b73aaa526e5d_ContentBits=2; MSIP_Label_2096f6a2-d2f7-48be-b329-b73aaa526e5d_ActionId=88124cf5-1340-457d-90e1-0000a9427c99
```
