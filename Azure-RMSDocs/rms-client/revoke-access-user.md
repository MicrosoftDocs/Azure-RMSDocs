---
# required metadata

title: Revoke document access - Azure Information Protection
description: Describes how end users can use the AIP client to revoke document access for documents they've protected.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 09/22/2020
ms.topic: how-to
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 643c762e-23ca-4b02-bc39-4e3eeb657a1d

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: doctrack
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: user

---

# User Guide: Revoke document access with Azure Information Protection

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8*
>
> *Instructions for: [Azure Information Protection unified labeling client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

This article describes how to revoke access for documents that you've protected from Microsoft Office.

Revoking access for a protected document prevents other users from accessing the document, even if you've given them access before.

## Revoke access from Microsoft Office apps

To revoke access from Word, Excel, or PowerPoint:

1. Open the protected file where you want to revoke access. This must be a file where you have applied the protection, using your current user account.

1. On the **Home** tab, click the **Sensitivity** button and select **Revoke Access**:

    :::image type="content" source="../media/track-revoke-word.png" alt-text="Select Revoke Access from Microsoft Word":::

    > [!NOTE]
    > If you do not see these options, the AIP unified labeling client may not be installed on your machine, or you may need to still restart your Office apps or machine after installation. 
    >
    > For more information, see [User Guide: Download and install the Azure Information Protection client](install-client-app.md).

1. In the confirmation message that appears, click **Yes** to continue.

Access is revoked, and other users can no longer access the document.

### Revoking access where the document protection has been changed

If another user had changed the label or protection on the document, access is not revoked on that copy of the document. Each protection level on the document has its own ContentID value, which is used to track and revoke access.

If you think that a user may have changed the label or protection level on a document and you need to revoke access, contact a system administrator to help you revoke access on that copy of the document.

## Next steps

For more information, see:

- [AIP unified labeling client user guide](clientv2-user-guide.md)
- [AIP unified labeling client administrator guide](clientv2-admin-guide.md)
- [Known issues for tracking and revoking document access](../known-issues.md#tracking-and-revoking-document-access)