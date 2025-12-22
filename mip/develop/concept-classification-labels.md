---
title: Concepts - Classification labels
description: This article helps you understand how labels are used for data classification with the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: azure-information-protection
ms.topic: conceptual
ms.date: 04/10/2025
ms.author: mbaldwin
---

# Microsoft Information Protection SDK - Classification label concepts

As part of a comprehensive data protection strategy, organizations should implement a data classification system. This system should outline the levels of data sensitivity within the organization, and then map document attributes to those classifications.

Attributes related to classification typically involve the **risk** to the organization if that document or data should be lost or seen by unintended subjects. In the familiar United States government classification system, there are three classification levels. Each has a definition that describes when that classification should be applied:

* **Top Secret**: Applied to information, the unauthorized disclosure of which reasonably could be expected to cause exceptionally grave damage to the national security that the original classification authority is able to identify or describe.
* **Secret**: Applied to information, the unauthorized disclosure of which reasonably could be expected to cause serious damage to the national security that the original classification authority is able to identify or describe.
* **Confidential**: Applied to information, the unauthorized disclosure of which reasonably could be expected to cause damage to the national security that the original classification authority is able to identify or describe.
* **Unclassified**: The absence of one of the previous examples. 

In a commercial or private sector application, we may define a list similar to the default in the Microsoft Purview Information Protection Service, with monetary values attached.

* **Highly Confidential**: Applied to information, the unauthorized disclosure of which reasonably could be expected to cause damages greater than USD $1M.
* **Confidential**: Applied to information, the unauthorized disclosure of which reasonably could be expected to cause damages greater than USD $100,000.
* **General**: Applied to information, the unauthorized disclosure of which reasonably could be expected to cause little measurable damages.
* **Public**: Applied to information intended for public, external consumption. 
* **Non-Business**: Applied to information that isn't related to company business, direct or indirect.

Each classification describes the risk to the business if unauthorized disclosure of that information occurs. After identifying these classifications and conditions, attributes should be identified that help data owners to understand which classification to apply.

## Labeling

The act of associating a data classification with a set of information is referred to as **labeling**. Because the MIP SDK is dealing in applying classification **labels** to documents, we don't refer to classifications, but rather to labels. A user or process has already **classified** the data based on knowledge of the information: The MIP SDK will then **label** the information.

## Labels in the MIP SDK

Labels are a fundamental component of the MIP SDK. Labels drive the tagging, protection, and content marking of all documents touched by the SDK. The SDK can:

* Apply labels to documents
* Read existing labels on documents
* Change an existing label and mandate justification if required by policy
* Remove a label from a document

The label applies protection and content marking based on the configuration defined in the Microsoft Purview portal. 

## mip::Label vs. mip::ContentLabel

Two types of label exist in the MIP SDK. `Label` and `ContentLabel`.

* Label: A label applied by a user or process as defined in the organizational policy.
* ContentLabel: A label that already exists on a document or information. It can be read, updated, or removed. 

In other words, the `ContentLabel` is a `Label` that is applied to an object.

## Metadata

The SDK also supported adding extra metadata to documents in the form of key/value pairs. If your organization has subclassifications or tags that describe the information in a more specific manner, the SDK can be used to apply that metadata.

## Next steps

For more details on the United States government classification system, see https://www.gpo.gov/fdsys/pkg/FR-2010-01-05/html/E9-31418.htm.
