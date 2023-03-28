---
# required metadata

title: Document tracking for Rights Management Service protection via the legacy tracking portal
description: Instructions and information for admins to configure and use the legacy document tracking portal for the Rights Management Service.
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 03/16/2020
ms.topic: how-to
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 983ecdc9-5631-48b8-8777-f4cbbb4934e8
ROBOTS: NOINDEX


# optional metadata

#audience:
#ms.devlang:
ms.subservice: doctrack
ms.reviewer: eymanor
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Admin Guide: Configuring and using document tracking for Rights Management Service protection with the legacy tracking portal

> [!NOTE]
> The legacy Azure Information Protection doc tracking site is supported only for the classic client, and not for the unified labeling client. For more information, see [Removed and retired services](../removed-sunset-services.md#the-aip-classic-client).


If you have a subscription that supports document tracking, the document tracking site is enabled by default for all users in your organization. Document tracking provides information for users and administrators about when a protected document was accessed and if necessary, a tracked document can be revoked.

## Using PowerShell to manage the document tracking site

The following sections contain information about how you can manage the document tracking site by using PowerShell. For installation instructions for the PowerShell module, see [Installing the AIPService PowerShell module](../install-powershell.md).

For more information about each of the cmdlets, use the links provided.

### Privacy controls for your document tracking site

If displaying all document tracking information is prohibited in your organization because of privacy requirements, you can disable document tracking by using the [Disable-AipServiceDocumentTrackingFeature](/powershell/module/aipservice/disable-aipservicedocumenttrackingfeature) cmdlet. 

This cmdlet disables access to the document tracking site so that all users in your organization cannot track or revoke access to documents that they have protected. You can re-enable document tracking any time, by using the [Enable-AipServiceDocumentTrackingFeature](/powershell/module/aipservice/enable-aipservicedocumenttrackingfeature), and you can check whether document tracking is currently enabled or disabled by using [Get-AipServiceDocumentTrackingFeature](/powershell/module/aipservice/get-aipservicedocumenttrackingfeature). 

When the document tracking site is enabled, by default, it shows information such as the email addresses of the people who attempted to access the protected documents, when these people tried to access them, and their location. This level of information can be helpful to determine how the shared documents are used and whether they should be revoked if suspicious activity is seen. However, for privacy reasons, you might need to disable this user information for some or all users. 

If you have users who should not have this activity tracked by other users, add them to a group that is stored in Azure AD, and specify this group with the [Set-AipServiceDoNotTrackUserGroup](/powershell/module/aipservice/Set-AipServiceDoNotTrackUserGroup) cmdlet. When you run this cmdlet, you must specify a single group. However, the group can contain nested groups. 

For these group members, users cannot see any activity on the document tracking site when that activity is related to documents that they shared with them. In addition, no email notifications are sent to the user who shared the document.

When you use this configuration, all users can still use the document tracking site and revoke access to documents that they have protected. However, they do not see activity for the users who you have specified by using the Set-AipServiceDoNotTrackUserGroup cmdlet.

This setting affects end users only. Administrators for Azure Information Protection can always track activities of all users, even when those users are specified by using Set-AipServiceDoNotTrackUserGroup. For more information about how administrators can track documents for users, see the [Tracking and revoking documents for users](#tracking-and-revoking-documents-for-users) section.


### Logging information from the document tracking site

You can use the following cmdlets to download logging information from the document tracking site:

- [Get-AipServiceTrackingLog](/powershell/module/aipservice/Get-AipServiceTrackingLog)
    
    This cmdlet returns tracking information about protected documents for a specified user who protected documents (the Rights Management issuer) or who accessed protected documents. Use this cmdlet to help answer the question "Which protected documents did a specified user track or access?"

- [Get-AipServiceDocumentLog](/powershell/module/aipservice/Get-AipServiceDocumentLog)
    
    This cmdlet returns protection information about the tracked documents for a specified user if that user protected documents (the Rights Management issuer) or was the Rights Management owner for documents, or protected documents were configured to grant access directly to the user. Use this cmdlet to help answer the question "How are documents protected for a specified user?"

## Destination URLs used by the document tracking site

The following URLs are used for document tracking and must be allowed on all devices and services between the clients that run the Azure Information Protection client and the internet. For example, add these URLs to firewalls, or to your Trusted Sites if you're using Internet Explorer with Enhanced Security.

-  `https://*.azurerms.com`

- `https://*.microsoftonline.com`

- `https://*.microsoftonline-p.com`

- `https://ecn.dev.virtualearth.net`

These URLs are standard for the Azure Rights Management service, with the exception of the virtualearth.net URL that is used for Bing maps to display the user location.

## Tracking and revoking documents for users

When users sign in to the document tracking site, they can track and revoke documents that they have protected by using the Azure Information Protection client. When you sign in as an Azure AD global administrator for your tenant, you can click the Admin icon, which switches to Administrator mode. Other administrator roles do not support this mode for the document tracking site. 

![Admin icon in the document tracking site](../media/tracking-site-admin-icon.png)

The Administrator mode lets you see the documents that users in your organization have selected to track by using the Azure Information Protection client.

> [!NOTE] 
> If you do not see this icon, despite being a global administrator, it's because you haven't yet shared any documents yourself. In this case, use the following URL to access the document tracking site: https://portal.azurerms.com/#/admin

Actions that you take in Administrator mode are audited and logged in the usage log files, and you must confirm to continue. For more information about this logging, see the next section.

When you are in Administrator mode, you can then search by user or document. If you search by user, you see all the documents that the specified user has selected to track by using the Azure Information Protection client. 

If you search by document, you see all the users in your organization who tracked that document by using the Azure Information Protection client. You can then drill into the search results to track the documents that users have protected and revoke these documents, if necessary. 

To leave the Administrator mode, click **X** next to **Exit administrator mode**:

![Exit administrator mode in the document tracking site](../media/tracking-site-exit-admin-icon.png)

For instructions how to use the document tracking site, see [Track and revoke your documents](client-track-revoke.md) from the user guide.

### Using PowerShell to register labeled documents with the document tracking site

To be able to track and revoke a document, it must first be registered with the document tracking site. This action occurs when users select the **Track and revoke** option from File Explorer or their Office apps when they use the Azure Information Protection client.

If you label and protect files for users by using the [Set-AIPFileLabel](/powershell/module/azureinformationprotection/set-aipfilelabel) cmdlet, you can use the *EnableTracking* parameter to register the file with the document tracking site. For example:

```ps
Set-AIPFileLabel -Path C:\Projects\ -LabelId ade72bf1-4714-4714-4714-a325f824c55a -EnableTracking
```

## Usage logging for the document tracking site

Two fields in the usage log files are applicable to document tracking: **AdminAction** and **ActingAsUser**.

**AdminAction** - This field has a value of true when an administrator uses the document tracking site in Administrator mode, for example, to revoke a document on a user's behalf or to see when it was shared. This field is empty when a user signs in to the document tracking site.

**ActingAsUser** - When the AdminAction field is true, this field contains the user name that the administrator is acting on behalf of as the searched for user or document owner. This field is empty when a user signs in to the document tracking site. 

There are also request types that log how users and administrators are using the document tracking site. For example, **RevokeAccess** is the request type when a user or an administrator on behalf of a user has revoked a document in the document tracking site. Use this request type in combination with the AdminAction field to determine whether the user revoked their own document (the AdminAction field is empty) or an administrator revoked a document on behalf of a user (the AdminAction is true).

For more information about usage logging, see [Logging and analyzing the protection usage from Azure Information Protection](../log-analyze-usage.md)

## Next steps
Now that you've configured the document tracking site for the Azure Information Protection client, see the following for additional information that you might need to support this client:

- [Customizations](/previous-versions/azure/information-protection/rms-client/client-admin-guide-customizations)

- [Client files and usage logging](/previous-versions/azure/information-protection/rms-client/client-admin-guide-files-and-logging)

- [File types supported](/previous-versions/azure/information-protection/rms-client/client-admin-guide-file-types)

- [PowerShell commands](/previous-versions/azure/information-protection/rms-client/client-admin-guide-powershell)
