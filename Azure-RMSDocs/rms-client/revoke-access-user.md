---
# required metadata

title: Revoke document access - Azure Information Protection
description: Describes how end users can use the AIP client to revoke document access for documents they've protected.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 10/21/2020
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

# User Guide: Revoke document access with Azure Information Protection (Public preview)

>***Applies to**: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8*
>
>***Relevant for**: [AIP unified labeling client only](../faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients). For the classic client, see [User Guide: Track and revoke your documents when you use the AIP classic client](client-track-revoke.md).*

This article describes how to revoke access for documents that you've protected from Microsoft Office.

Revoking access for a protected document prevents other users from accessing the document, even if you've given them access before. For more information, see [User Guide: Classify and protect with the Azure Information Protection unified labeling client](clientv2-classify-protect.md).

Track and revoke features for the unified labeling client are currently in PREVIEW. The [Azure Preview Supplemental Terms](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) include additional legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability. 

## Revoke access from Microsoft Office apps

To revoke access from Word, Excel, or PowerPoint:

1. Open the protected file whose access you want to revoke. This must be a file where *you* have applied the protection, using your *current* user account.

    > [!TIP]
    > If you've only just applied a label and protection, you cannot revoke access in the same session. Reopen the document if you need to revoke access.

1. On the **Home** tab, click the **Sensitivity** button and select **Revoke Access**:

    :::image type="content" source="../media/track-revoke-word.png" alt-text="Select Revoke Access from Microsoft Word":::

    > [!NOTE]
    > Don't see this option? For more information, see possible scenarios [below](#dont-see-the-revoke-access-option).
    >
 
1. In the confirmation message that appears, click **Yes** to continue.

Access is revoked, and other users can no longer access the document.

### Don't see the Revoke Access option?

If you do not see the option to **Revoke Access** in the **Sensitivity** menu, you may have one of the following scenarios:

- You might have just applied the protection in this session. If this is the case, close and re-open the document to try again.

- You might be viewing an unprotected document. Revoking access is relevant only for protected documents.

- You may not have the latest AIP unified labeling client version installed, or you may need to restart your Office apps or machine after installation. 

    For more information, see [User Guide: Download and install the Azure Information Protection client](install-client-app.md).

## Revoking access where the document protection has been changed on a copy

If another user had changed the label or the protection on a copy of the document, access is *not revoked* on that copy of the document. 

This is because tracking and revoking access is done using a unique ContentID value, which changes each time protection is changed.

> [!IMPORTANT]
> If you think that a user may have changed the label or protection level on a document and you need to revoke access, contact a system administrator to help you revoke access on that copy of the document.
> 
## Next steps

For more information, see:

- [AIP unified labeling client user guide](clientv2-user-guide.md)
- [AIP unified labeling client administrator guide](clientv2-admin-guide.md)
- [Known issues for tracking and revoking document access](../known-issues.md#tracking-and-revoking-document-access)