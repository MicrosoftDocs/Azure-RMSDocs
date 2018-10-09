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

## Known issues

### Error: "Failed to parse the acquired Compliance Policy"  

You downloaded the MIP SDK and ran the sample applications. You use the file sample to try to list all labels, but you get the following error:

| Error | Solution |
|-|-|
|*Something bad happend: Failed to parse the acquired Compliance Policy. Failed with: [class mip::CompliancePolicyParserException] Tag not found : policy, NodeType: 15, Name: No Name Found, Value: , Ancestors: <SyncFile><Content>, correlationId:[34668a40-blll-4ef8-b2af-00005aa674z9]*| This indicates that you haven't migrated your labels from Azure Information Protection, to the unified labeling experience! Follow [How to migrate Azure Information Protection labels to the Office 365 Security & Compliance Center](/azure/information-protection/configure-policy-migrate-labels) to migrate the labels, then create a Label Policy in Office 365 Security and Compliance Center. Once that's complete, the sample will run successfully.|


### String conversions

TBD