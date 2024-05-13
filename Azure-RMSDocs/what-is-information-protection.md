---
# required metadata

title: What is Azure Information Protection (AIP)?
description: Azure Information Protection (AIP) extends the Microsoft Purview Information Protection framework to extend the labeling and classification functionality provided by Microsoft 365.
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 11/09/2020
ms.topic: overview
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
search.appverid:
- MET150
Customer intent: As an administrator, I want to extend Microsoft 365's labeling and classification functionality to File Explorer, PowerShell, third party apps and services, and more.
---

# What is Azure Information Protection?

[!INCLUDE [looking-for-mip](includes/looking-for-mip.md)]

Azure Information Protection (AIP) provides the encryption service, [Azure Rights Management](what-is-azure-rms.md), that's used by Microsoft Purview Information Protection and the following capabilities:

- [Sensitivity labels](/purview/sensitivity-labels)
- [Microsoft Purview Information Protection client](/purview/information-protection-client)
- [Microsoft Purview Information Protection scanner](/purview/deploy-scanner)
- [Microsoft Information Protection SDK](#microsoft-information-protection-sdk)

For a comprehensive list of capabilities from Microsoft Purview Information Protection, see [Protect your sensitive data with Microsoft Purview](/purview/information-protection).

## Microsoft Information Protection SDK

The Microsoft Information Protection SDK extends sensitivity labels to third-party apps and services. Developers can use the SDK to build built-in support for applying labels and protection to files.

For example, you might use the MIP SDK for:

- A line-of-business application that applies sensitivity labels to files on export.
- A CAD/CAM design application that provides support for built-in labeling.
- A cloud access security broker or data loss prevention solution that reasons over data encrypted with Azure Information Protection.

For more information, see the [Microsoft Information Protection SDK overview](/information-protection/develop/overview).