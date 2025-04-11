---
title: Labeling and Protection - Microsoft Information Protection SDK
description:  Microsoft Information Protection Software Development kit operations.
author: msmbaldwin
ms.author: mbaldwin
ms.date: 04/10/2025
ms.topic: conceptual
ms.service: information-protection

---

# Labeling and pre-existing protection in Microsoft Information Protection SDK

Microsoft Purview Information Protection supports labeling and classification services. Users and applications can apply the following to supported files:

- Classification only through application of a label

- Classification and protection through application of a label

- Protection only

This article discusses how the SDK handles attempt for applying a label to a file that has pre-existing protection. When the document has pre-existing protection either through application of a label or otherwise, SDK handles application of a new label in scenarios as below.

## Label-based protection when label metadata has been stripped

If a file has a label applied and that label applied protection, then the SDK can resolve file's protection to the particular label. If a user who has "Edit" permissions on the file removes the label metadata either accidentally or maliciously, the protection still remains. When next time SDK interacts with the file, it looks at the protection data, resolves that protection template to the original label, and reapplies the label. This SDK behavior is a safety mechanism built into the SDK for information protection in case the label metadata is tampered with.

## Custom-protection and label applications

If the file has some form of protection applied through an RMS template and a user tries to apply a label to the file, the SDK first should resolve the original protection to a label. Not being able to do so, SDK can not evaluate if the new protection sensitivity level is more restrictive or permissive than the original protection sensitivity and hence SDK won't apply the new label to the file.

## User-defined permissions

If a file has a label applied and that label applied user-defined protection, the protection is applied to the file. In this case, the SDK can not resolve the protection to an RMS template. If a user tries to apply a new label to the file now, the SDK treats the action similar to above and won't apply the new label to the file.
