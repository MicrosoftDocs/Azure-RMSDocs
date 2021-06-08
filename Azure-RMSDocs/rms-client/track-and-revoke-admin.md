---
# required metadata

title: Track and revoke access - Azure Information Protection
description: Describes how administrators can track document access for protected documents, as well as revoke access if needed.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 06/08/2021
ms.topic: conceptual
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

>***Applies to**: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8*
>
>***Relevant for**: [AIP unified labeling client only](../faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients).*

Document tracking provides information for administrators, with either the [Azure Information Protection Administrator](/azure/active-directory/roles/permissions-reference#azure-information-protection-administrator) or [Azure Rights Management Global Administrator](/azure/active-directory/roles/permissions-reference#global-administrator) role, about when a protected document was accessed. If necessary, both admins and users can revoke document access for tracked documents. 

If you've upgraded to [version 2.9.111.0](unifiedlabelingclient-version-release-history.md#version-291110) or later, any protected Office documents that are not yet registered for tracking are automatically registered the next time they're opened via the AIP unified labeling client. Protected documents are supported for track and revoke, even if they are not labeled.

Registering a document for tracking enables admins to track access details, including successful access events and denied attempts, as well as revoke access if needed.

> [!NOTE]
> Track and revoke features are supported for Office file types only.
>  
> Protected documents are supported for track and revoke, even if they are not labeled.
> 

## Track document access

Admins can track access for protected documents via PowerShell using the **ContentID** generated for the protected document during registration.

**To view document access details**:

Use the following cmdlets to find details for the document you want to track:

1. Find the **ContentID** value for the document you want to track.

    Use the [Get-AipServiceDocumentLog](/powershell/module/aipservice/get-aipservicedocumentlog) to search for a document using the filename and/or the email address of the user who applied protection.

    For example;

    ```PowerShell
    Get-AipServiceDocumentLog -ContentName "test.docx" -Owner “alice@contoso.com” -FromTime "12/01/2020 00:00:00" -ToTime "12/31/2020 23:59:59"
    ```

    This command returns the **ContentID** for all matching, protected documents that are registered for tracking.

    > [!NOTE]
    > Protected documents are registered for tracking when they are first opened on a machine with the unified labeling client installed. If this command does not return the ContentID for your protected file, open it on a machine with the unified labeling client installed to register the document for tracking.

1. Use the [Get-AipServiceTrackingLog](/powershell/module/aipservice/get-aipservicetrackinglog) cmdlet with your document's **ContentID** to return your tracking data.

    For example:

    ```PowerShell
    Get-AipServiceTrackingLog -ContentId c03bf90c-6e40-4f3f-9ba0-2bcd77524b87
    ```

    Tracking data is returned, including emails of users who attempted access, whether access was granted or denied, the time and date of the attempt, and the domain and location where the access attempt originated.

## Revoke document access from PowerShell

Admins can revoke access for any protected document stored in their local content shares, using the [Set-AIPServiceDocumentRevoked](/powershell/module/aipservice/set-aipservicedocumentrevoked) cmdlet.

1. Find the **ContentID** value for the document you want to revoke access for.

    Use the [Get-AipServiceDocumentLog](/powershell/module/aipservice/get-aipservicedocumentlog) to search for a document using the filename and/or the email address of the user who applied protection.

    For example:

    ```PowerShell
    Get-AipServiceDocumentLog -ContentName "test.docx" -Owner “alice@contoso.com” -FromTime "12/01/2020 00:00:00" -ToTime "12/31/2020 23:59:59"
    ```

    The data returned includes the ContentID value for your document.

    > [!TIP]
    > Only documents that have been protected and registered for tracking have a **ContentID** value. 
    >
    > If your document has no **ContentID**, open it on a machine with the unified labeling client installed to register the file for tracking.

1. Use the [Set-AIPServiceDocumentRevoked](/powershell/module/aipservice/set-aipservicedocumentrevoked) with your document's ContentID to revoke access.

    For example:

    ```PowerShell
    Set-AipServiceDocumentRevoked -ContentId 0e421e6d-ea17-4fdb-8f01-93a3e71333b8 -IssuerName testIssuer
    ```

> [!NOTE]
> If [offline access](/microsoft-365/compliance/encryption-sensitivity-labels#assign-permissions-now) is allowed, users will continue to be able to access the documents that have been revoked until the offline policy period expires. 
>

> [!TIP]
> Users can also revoke access for any documents where they applied protection directly from the **Sensitivity** menu in their Office apps. For more information, see [User Guide: Revoke document access with Azure Information Protection](revoke-access-user.md)

### Un-revoke access

If you have accidentally revoked access to a specific document, use the same **ContentID** value with the [Clear-AipServiceDocumentRevoked](/powershell/module/aipservice/clear-aipservicedocumentrevoked) cmdlet to un-revoke the access. 

To use the **Clear-AipServiceDocumentRevoked** cmdlet, you must first load the **AipService.dll**.

For example:

```PowerShell
Import-Module -Name "C:\Program Files\WindowsPowerShell\Modules\AIPService\1.0.0.4\AipService.dll"
Clear-AipServiceDocumentRevoked -ContentId   0e421e6d-ea17-4fdb-8f01-93a3e71333b8 -IssuerName testIssuer
```

Document access is granted to the user you defined in the **IssuerName** parameter.

## Turn off track and revoke features for your tenant

If you need to turn off track and revoke features for your tenant, such as for privacy requirements in your organization or region, perform both of the following steps:

1. Run the [Disable-AipServiceDocumentTrackingFeature](/powershell/module/aipservice/disable-aipservicedocumenttrackingfeature) cmdlet.

1. Set the [EnableTrackAndRevoke](clientv2-admin-guide-customizations.md#turn-off-document-tracking-features) advanced client setting to **False**.

Document tracking and options to revoke access are turned off for your tenant:

- Opening protected documents with the AIP unified labeling client no longer registers the documents for track and revoke.
- Access logs are not stored when protected documents that are already registered are opened. Access logs that were stored before turning off these features are still available.
- Admins will not be able to track or revoke access via PowerShell, and end-users will no longer see the [**Revoke**](revoke-access-user.md#revoke-access-from-microsoft-office-apps) menu option in their Office apps.

> [!TIP]
> To turn track and revoke back on, set the [EnableTrackAndRevoke](clientv2-admin-guide-customizations.md#turn-off-document-tracking-features) to **True**, and also run the [Enable-AipServiceDocumentTrackingFeature](/powershell/module/aipservice/enable-aipservicedocumenttrackingfeature) cmdlet.
>

## Turn off the ability for end-users to revoke access

If you do not want end-users to have the ability to revoke access to protected documents from their Office apps, you can remove the **Revoke Access** option from your Office apps.

> [!NOTE]
> Removing the **Revoke Access** option continues to keep your protected documents tracked in the background, and retains the admin ability to revoke access to documents [via PowerShell](/powershell/module/aipservice/set-aipservicedocumentrevoked).
> 
To remove the **Revoke Access** option from Office apps, set the [EnableRevokeGuiSupport](clientv2-admin-guide-customizations.md#turn-off-the-revoke-option-for-end-users-in-office-apps) advanced client setting to **False**.

For more information, see [User Guide: Revoke document access with Azure Information Protection](revoke-access-user.md).
## Next steps

For more information, see:

- [AIP unified labeling client user guide](clientv2-user-guide.md)
- [AIP unified labeling client administrator guide](clientv2-admin-guide.md)
- [Known issues for track and revoke features](../known-issues.md#known-issues-for-track-and-revoke-features)
