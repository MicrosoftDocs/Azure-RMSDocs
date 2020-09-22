---
# required metadata

title: Track and revoke access - Azure Information Protection
description: Describes how administrators can track document access for protected documents, as well as revoke access if needed.
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

# Administrator Guide: Track and revoke document access with Azure Information Protection

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8*
>
> *Instructions for: [Azure Information Protection unified labeling client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

If you've upgraded to [version TBD](unifiedlabelingclient-version-release-history.md#version-tbd-public-preview) of the AIP unified labeling client, all protected documents are automatically registered for tracking the next time they're opened. 

Registering a document for tracking enables administrators to track access details, including successful access events and denied attempts, as well as revoke access if needed.

## Track document access

Administrators can track access for protected documents via PowerShell using the content ID generated for the protected document during registration.

**To view document access details**:

1. Use PowerShell cmdlets to find the document you want to track, such as by searching by the document name, the user who protected the document, or the time period in which the document was last accessed.

    In the cmdlet response, note the **ContentID** returned. You'll use this ContentID to return tracking information.

    > [!TIP]
    > Only documents that have been protected and registered for tracking have a ContentID value. If your document has no ContentID, open it for the AIP unified labeling client to register the file.

1. Run the following command to view tracking data for the selected file:

    ```PowerShell
    TBD
    ```
    Tracking data is returned, including the email of the user who attempted access, whether access was granted or denied, the date and time of the attempt, and the domain and the location where the access attempt originated. 

    For example:
    
    ```PowerShell
    TBD
    ```

### Configure tracking data retention

Administrators can configure how long tracking data is kept, after which the tracking data is deleted and can no longer be retrieved.

TBD

For example, if an administrator changes the tracking data retention period from 5 months to 2 months, all tracking data from earlier than 2 months ago is deleted.

## Revoke document access from PowerShell

Administrators can revoke access for any protected document stored in their local content shares.

> [!TIP]
> Users can also revoke access for any documents where they applied protection directly from the **Sensitivity** menu in their Office apps. For more information, see <x.>.

### Un-revoke access

If you have accidentally revoked access to a specific document, use the same ContentID value to un-revoke the access. 

Run the following command:

```PowerShell
TBD
```

## Next steps

For more information, see:

- [AIP unified labeling client user guide](clientv2-user-guide.md)
- [AIP unified labeling client administrator guide](clientv2-admin-guide.md)
- [Known issues for tracking and revoking document access](../known-issues.md#tracking-and-revoking-document-access)