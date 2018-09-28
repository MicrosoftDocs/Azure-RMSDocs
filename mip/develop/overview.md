---
title: Overview - Microsoft Information Projection SDK.
description: Microsoft Information Protection (MIP) is the unification of Microsoft's classification, labeling, and protection services, into a single  administration experience and software development kit (SDK).
author: BryanLa
ms.service: information-protection
ms.topic: overview
ms.date: 09/27/2018
ms.author: bryanla
---
# Overview

## Microsoft Information Protection

Microsoft Information Protection (MIP) is the unification of Microsoft's classification, labeling, and protection services, into a single  administration experience and software development kit (SDK). Unified administration is provided across Office 365, Azure Information Protection, Windows Information Protection, and other Microsoft services. Third parties can use the SDK to integrate with applications, using a standard, consistent data labeling schema and protection service.

* [What is Office 365 Security and Compliance Center?](https://support.office.com/article/overview-of-security-and-compliance-in-office-365-dcb83b2c-ac66-4ced-925d-50eb9698a0b2?redirectSourcePath=%252farticle%252f7fe448f7-49bd-4d3e-919d-0a6d1cf675bb&ui=en-US&rs=en-US&ad=US)
* [What is Azure Information Protection?](/azure/information-protection/understand-explore/what-is-information-protection)
* [How does the protection work in Azure Information Protection?](/azure/information-protection/understand-explore/what-is-information-protection.md#how-data-is-protected)

## Microsoft Information Protection SDK

The MIP SDK exposes the labeling and protection services from Office 365 Security and Compliance Center to third-party applications and services. Developers can use the SDK to build native support for applying labels and protection to files. Developers can reason over which actions should be taken when specific labels are detected, and reason over MIP-encrypted information. 

The labels and protection applied to information across the suite of Microsoft services are **consistent**. Consistency allows applications and services that support MIP to read and write the labels in a common, predictable manner.

High-level MIP SDK use cases include:

* A line-of-business application that applies classification labels to files on export.
* A CAD/CAM design application provides native support for Microsoft Information Protection labeling.
* A cloud access security broker or data loss prevention solution reasons over data encrypted with Azure Information Protection.

For a more exhaustive list, review [API concepts](concept-apis-use-cases.md).

## Next Steps

Now you're ready to get started with the SDK. The first thing you'll need to do, is [complete the MIP SDK setup and configuration steps](setup-configure-mip.md), to make sure your Office 365 subscription and client machine are set up correctly.

