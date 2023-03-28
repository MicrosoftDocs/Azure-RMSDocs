---
title: Overview - Microsoft Information Protection SDK.
description: Microsoft Purview Information Protection is the unification of Microsoft's classification, labeling, and protection services, into a single  administration experience and software development kit (SDK).
author: msmbaldwin
ms.service: information-protection
ms.topic: overview
ms.date: 11/14/2022
ms.author: mbaldwin
#Customer intent: As a an application developer or administrator, I want to get an overview of the MIP SDK, so that I can determine what it is and how it's used.
---
# Overview

## Microsoft Purview Information Protection

Microsoft Purview Information Protection is the unification of Microsoft's classification, labeling, and protection services:

- Unified administration is provided across Microsoft 365, Azure Information Protection, Windows Information Protection, and other Microsoft services. 
- Third parties can use the MIP SDK to integrate with applications, using a standard, consistent data labeling schema and protection service.

* [What is Office 365 Security and Compliance Center?](/office365/securitycompliance/)
* [What is Azure Information Protection?](/azure/information-protection/understand-explore/what-is-information-protection)
* [How does the protection work in Azure Information Protection?](/azure/information-protection/understand-explore/what-is-information-protection#how-data-is-protected)

## Microsoft Information Protection SDK

The MIP SDK exposes the labeling and protection services from Office 365 Security and Compliance Center, to third-party applications and services. Developers can use the SDK to build native support for applying labels and protection to files. Developers can reason over which actions should be taken when specific labels are detected, and reason over MIP-encrypted information. 

The labels and protection applied to information across the suite of Microsoft services are **consistent**. Consistency allows applications and services that support MIP to read and write the labels in a common, predictable manner.

High-level MIP SDK use cases include:

* A line-of-business application that applies classification labels to files on export.
* A CAD/CAM design application provides native support for Microsoft Purview Information Protection labeling.
* A cloud access security broker or data loss prevention solution reasons over data encrypted with Azure Information Protection.

For a more exhaustive list, review [API concepts](concept-apis-use-cases.md).

The MIP SDK is supported on the following platforms:

[!INCLUDE [MIP SDK platform support](../includes/mip-sdk-platform-support.md)]

## Next Steps

Now you're ready to get started with the SDK. The first thing you'll need to do is [complete the MIP SDK setup and configuration steps](setup-configure-mip.md). These steps will ensure your Microsoft 365 subscription and client machine are set up correctly.