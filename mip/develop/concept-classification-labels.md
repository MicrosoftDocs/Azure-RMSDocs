---
title: Concepts - Classification labels
description: This article will help you understand how labels are used for data classification.
author: BryanLa
ms.service: information-protection
ms.topic: conceptual
ms.date: 09/27/2018
ms.author: bryanla
---

# Classification labels

As part of a comprehensive data protection strategy, organizations should implement a data classification system that outlines the levels of sensitivity of data within the organization, and then map document attributes to those classifications.

Attributes related to classification typically involve the **risk** to the organization if that document or data should be lost or seen by unintended subjects. In the familiar United States government classification system, there are three classification levels. Each has a definition that describes when that classification should be applied:

* **Top Secret**: Shall be applied to information, the unauthorized disclosure of which reasonably could be expected to cause exceptionally grave damage to the national security that the original classification authority is able to identify or describe.
* **Secret**: Shall be applied to information, the unauthorized disclosure of which reasonably could be expected to cause serious damage to the national security that the original classification authority is able to identify or describe.
* **Confidential**: Shall be applied to information, the unauthorized disclosure of which reasonably could be expected to cause damage to the national security that the original classification authority is able to identify or describe.
* **Unclassified**: This isn't actually a classification, but rather the absence of one of the above three.

In a commercial or private sector application, we may define a list similar to the default in the Azure Information Protection Service, with monetary values attached.

* **Highly Confidential**: Shall be applied to information, the unauthorized disclosure of which reasonably could be expected to cause damages greater than USD $1M.
* **Confidential**: Shall be applied to information, the unauthorized disclosure of which reasonably could be expected to cause damages greater than USD $100K.
* **General**: Shall be applied to information, the unauthorized disclosure of which reasonably could be expected to cause little measurable damages.
* **Public**: Shall be applied to information intended for public, external consumption. 
* **Non-Business**: Shall be applied to information that is not related to company business, direct or indirect.

Each classification describes the risk to the business in the event of unauthorized disclosure of that information. After identifying these classification and conditions, attributes should be identified that help data owners to understand which classification to apply.

## Labeling

The act of associating a data classification with a set of information is referred to as **labeling**. Because the MIP SDK is dealing in applying classification **labels** to documents, we don't refer to classifications, but rather to labels. A user or process has already **classified** the data based on knowledge of the information: The MIP SDK will then **label** the information.

## Labels in the MIP SDK

Labels are a fundamental component of the MIP SDK. Labels drive the tagging, protection, and content marking of all documents touched by the SDK. The SDK can:

* Apply labels to documents
* Read existing labels on documents
* Change an existing label and mandate justification if required by policy
* Remove a label from a document

The label will apply protection and content marking based on configuration label administrators have defined in Security and Compliance Center. 

## mip::Label vs. mip::ContentLabel

Two types of label exist in the MIP SDK. `Label` and `ContentLabel`.

* Label: A label that can be applied by a user or process as defined in the organizational policy.
* ContentLabel: A label that already exists on a document or information. It can be read, updated, or removed. 

In other words, the `ContentLabel` is a `Label` that has been applied to a piece of information.

## Metadata

The SDK also supported adding extra metadata to documents in the form of key/value pairs. If your organization has sub-classifications or tags that describe the information in a more specific manner, the SDK can be used to apply that metadata.

[Read here]() for more information on applying metadata.

## Links

Classification reference: https://www.gpo.gov/fdsys/pkg/FR-2010-01-05/html/E9-31418.htm
