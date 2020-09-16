---
title: Labeling and Protection - Microsoft Information Protection SDK
description:  Microsoft Information Protection Software Development kit operations.
author: Pathak-Aniket
ms.author: v-anikep
ms.date: 08/20/2020
ms.topic: conceptual
ms.service: information-protection

---

# Labeling and Pre existing protection in Microsoft Information Protection SDK

Microsoft Information Protection supports labeling and classification services. Users and applications can apply the following to supported files:

- Classification only through application of a label

- Classification and protection through application of a label

- Protection only

This article discusses how the SDK handles attempt for applying a label to a file that has pre-existing protection. When the document has pre-existing protection either through application of a label or otherwise, SDK handles application of a new label in scenarios as below.

### When file is protected through a label and label metadata is stripped 

If a file has a label applied and that label applied protection, then the SDK should be able to resolve that file protection to the particular label. If a user who has "Edit" permissions on the file, removes the label metadata either accidentally or maliciously, the protection still remains. When the next time SDK interacts with the file, it looks at the protection data, resolves that protection template to the original label and reapplies the label. This is a safety mechanism built into the SDK for information protection in case the label metadata is tampered with.

### When file is protected (not from a label) and user tries to apply a new label

If the file has some form of protection applied, through an RMS template and user tries to apply a label to the file, SDK first needs to be able to resolve the original protection to a label. Not being able to do so, SDK will not be able to evaluate if the new protection sensitivity level is more restrictive or permissive than the original protection sensitivity and hence SDK will not apply the new label to the file.

### When label is UDP protection is treated as custom

If a file has a label applied and that label applied user defined protection, the protection is applied to the file, but there is no way for the SDK to resolve the same to an RMS template. In this case when a user tries to apply a new label to the file, SDK treats the action similar to above and will not apply the new label to the file..
