---
# required metadata

title: Track and revoke access - Azure Information Protection
description: Describes how administrators can track document access for protected documents, as well as revoke access if needed.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 12/08/2020
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

# Administrator Guide: Track and revoke document access with Azure Information Protection (Public preview)

>***Applies to**: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8*
>
>***Relevant for**: [AIP unified labeling client only](../faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients). For the classic client, see [Admin Guide: Configuring and using document tracking for AIP using the classic client](client-admin-guide-document-tracking.md).*

If you've upgraded to [version 2.9.109.0](unifiedlabelingclient-version-release-history.md#version-291090-public-preview) or later, any protected documents that are not yet registered for tracking are automatically registered the next time they're opened via the AIP unified labeling client.

Registering a document for tracking enables AIP Global Administrators to track access details, including successful access events and denied attempts, as well as revoke access if needed. 

Track and revoke features for the unified labeling client are currently in PREVIEW. The [Azure Preview Supplemental Terms](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) include additional legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability. 

## Track document access

Administrators can track access for protected documents via PowerShell using the ContentID generated for the protected document during registration.

**To view document access details**:

Use the following cmdlets to find details for the document you want to track:

1. Find the **ContentID** value for the document you want to track.
    
    Use the [Get-AipServiceDocumentLog](/powershell/module/aipservice/get-aipservicedocumentlog) to search for a document using the filename and/or the email address of the user who applied protection.
    
    For example;
        
    ```PowerShell
    PS C:\>Get-AipServiceDocumentLog -ContentName "test.docx" -OwnerEmail “alice@contoso.com” -FromTime "12/01/2020 00:00:00" -ToTime "12/31/2020 23:59:59"
    ```
 
    This command returns the **ContentID** for all matching, protected documents that are registered for tracking.

    > [!NOTE]
    > Protected documents are registered for tracking when they are first opened on a machine with the unified labeling client installed. If this command does not return the ContentID for your protected file, open it on a machine with the unified labeling client installed to register the document for tracking.

1. Use the [Get-AipServiceTrackingLog](/powershell/module/aipservice/get-aipservicetrackinglog) cmdlet with your document's **ContentID** to return your tracking data.

    For example:
    
    ```PowerShell
    PS C:\>Get-Get-AipServiceTrackingLog -ContentId c03bf90c-6e40-4f3f-9ba0-2bcd77524b87
    ```

    Tracking data is returned, including emails of users who attempted access, whether access was granted or denied, the time and date of the attempt, and the domain and location where the access attempt originated.

## Revoke document access from PowerShell

Administrators can revoke access for any protected document stored in their local content shares, using the [Set-AIPServiceDocumentRevoked](/powershell/module/aipservice/set-aipservicedocumentrevoked) cmdlet. 

1. Find the ContentID value for the document you want to revoke access for.
    
    Use the [Get-AipServiceDocumentLog](/powershell/module/aipservice/get-aipservicedocumentlog) to search for a document using the filename and/or the email address of the user who applied protection.
    
    For example;
        
    ```PowerShell
    PS C:\>Get-AipServiceDocumentLog -ContentName "test.docx" -OwnerEmail “alice@contoso.com” -FromTime "12/01/2020 00:00:00" -ToTime "12/31/2020 23:59:59"
    ```

    The data returned includes the ContentID value for your document.

    > [!TIP]
    > Only documents that have been protected and registered for tracking have a ContentID value. 
    >
    > If your document has no ContentID, open it on a machine with the unified labeling client installed to register the file for tracking.

1. Use the [Set-AIPServiceDocumentRevoked](/powershell/module/aipservice/set-aipservicedocumentrevoked) with your document's ContentID to revoke access.

    For example:

    ```PowerShell
    Set-AipServiceDocumentRevoked -ContentId 0e421e6d-ea17-4fdb-8f01-93a3e71333b8 -IssuerName testIssuer
    ```

> [!TIP]
> Users can also revoke access for any documents where they applied protection directly from the **Sensitivity** menu in their Office apps. For more information, see [User Guide: Revoke document access with Azure Information Protection](revoke-access-user.md)

### Un-revoke access

If you have accidentally revoked access to a specific document, use the same **ContentID** value with the [Clear-AipServiceDocumentRevoke](/powershell/module/aipservice/clear-aipservicedocumentrevoke) cmdlet to un-revoke the access. 

For example: 

```PowerShell
Clear-AipServiceDocumentRevoke -ContentId   0e421e6d-ea17-4fdb-8f01-93a3e71333b8 -IssuerName testIssuer
```

Document access is granted to the user you defined in the **IssuerName** parameter.

## Next steps

For more information, see:

- [AIP unified labeling client user guide](clientv2-user-guide.md)
- [AIP unified labeling client administrator guide](clientv2-admin-guide.md)
- [Known issues for tracking and revoking document access](../known-issues.md#tracking-and-revoking-document-access-public-preview)