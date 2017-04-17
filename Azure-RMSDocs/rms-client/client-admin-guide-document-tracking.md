---
# required metadata

title: Document tracking for Azure Information Protection
description: Instructions and information for admins to configure and use document tracking for Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 02/08/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 983ecdc9-5631-48b8-8777-f4cbbb4934e8

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: eymanor
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---


# Configuring and using document tracking for Azure Information Protection

>*Applies to: Active Directory Rights Management Services, Azure Information Protection, Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1*

If you have a [subscription that supports document tracking](https://www.microsoft.com/cloud-platform/azure-information-protection-features), the document tracking site is enabled by default for all users in your organization. Document tracking shows information such as email addresses of the people who attempted to access protected documents that users shared, when these people tried to access them, and their location. 

If displaying this information is prohibited for your organization or is is prohibited for a subset of users (for example, based on region) because of privacy requirements, you can use the following PowerShell cmdlets:

- To disable document tracking for all users in your organization: [Disable-AadrmDocumentTrackingFeature](/powershell/module/aadrm/disable-aadrmdocumenttrackingfeature)

    When users try to access the document tracking site, they see the following message: **Your administrator has disabled document tracking for your organization. Contact your administrator for details.**
    
    You can re-enable access to the site at any time, by using the [Enable-AadrmDocumentTrackingFeature](/powershell/module/aadrm/enable-aadrmdocumenttrackingfeature).

- To disable document tracking for a subset of users in your organization: [Set-AadrmDoNotTrackUserGroup](/powershell/module/aadrm/set-aadrmdonottrackusergroup)

    When you disable document tracking for a subset of users, you must specify a single group. However, the group can contain nested groups. These group members cannot access the document tracking site and they see the same message as when it's disabled for all users. 
    
    For these group members, their activity related to documents that others have shared with them is not logged to the document tracking site. If the user who protected and shared a document is not in this group, that user will be able to access the document tracking site and see that their protected document was accessed and can revoke their document. However, that user will not see any user details (user name, time, location) of the group members. In addition, that user will not get email notifications from the group members when they open the protected document.
    
    You can use the [Clear-AadrmDoNotTrackUserGroup](/powershell/module/aadrm/Clear-AadrmDoNotTrackUserGroup) if you no longer need this option for a subset of users. Or to selectively remove users, remove them from the group but be aware of [group caching](../plan-design/prepare.md#group-membership-caching). 


To check whether document tracking is enabled for your organization: Run [Get-AadrmDocumentTrackingFeature](/powershell/module/aadrm/get-aadrmdocumenttrackingfeature).

To check whether document tracking is exempt for a group: Run [Get-AadrmDoNotTrackUserGroup](/powershell/module/aadrm/get-AadrmDoNotTrackUserGroup)


> [!IMPORTANT]
> If you have users whose activity and location should not be tracked, add them to a group that is stored in Azure AD, and specify this group with the [Set-AadrmDoNotTrackUserGroup](/powershell/module/aadrm/Set-AadrmDoNotTrackUserGroup) cmdlet.

To run these cmdlets, you must have at least version **2.10.0.0** of the Azure Rights Management (AADRM) PowerShell module. For installation instructions, see [Installing Windows PowerShell for Azure Rights Management](../deploy-use/install-powershell.md). If you have previously downloaded and installed the module, check the version number by running: `(Get-Module aadrm –ListAvailable).Version`

The following URLs are used for document tracking and must be allowed (for example, add them to firewalls, or to your Trusted Sites if you're using Internet Explorer with Enhanced Security):

-  `https://\*.azurerms.com`

- `https://ecn.dev.virtualearth.net`

    This virtualearth.net URL is for Bing maps to display user location.

- `https://\*.microsoftonline.com`

- `https://\*.microsoftonline-p.com`

## Tracking and revoking documents for users

When users sign in to the document tracking site, they can track and revoke documents that they have protected by using the Azure Information Protection client or shared by using the Rights Management sharing application. When you sign in as an administrator for Azure Information Protection (global admin), you can click the Admin icon, which switches to Administrator mode so that you can see the documents that have been shared by users in your organization:

![Admin icon in the document tracking site](../media/tracking-site-admin-icon.png)

Actions that you take in Administrator mode are audited and logged in the usage log files, and you must confirm to continue. For more information about this logging, see the next section.

When you are in Administrator mode, you can then search by user or document. If you search by user, you will see all the documents that the specified user has shared. If you search by document, you will see all the users in your organization who shared that document. You can then drill into the search results to track the documents that users have shared and revoke these documents, if necessary. 

To leave the Administrator mode, click **X** next to **Exit administrator mode**:

![Exit administrator mode in the document tracking site](../media/tracking-site-exit-admin-icon.png)

For instructions how to use the document tracking site, see [Track and revoke your documents](client-track-revoke.md) from the user guide.

## Usage logging for the document tracking site

Two fields in the usage log files are applicable to document tracking: **AdminAction** and **ActingAsUser**.

**AdminAction** - This field has a value of true when an administrator uses the document tracking site in Administrator mode, for example, to revoke a document on a user's behalf or to see when it was shared. This field is empty when a user signs in to the document tracking site.

**ActingAsUser** - When the AdminAction field is true, this field contains the user name that the administrator is acting on behalf of as the searched for user or document owner. This field is empty when a user signs in to the document tracking site. 

There are also request types that log how users and administrators are using the document tracking site. For example, **RevokeAccess** is the request type when a user or an administrator on behalf of a user has revoked a document in the document tracking site. Use this request type in combination with the AdminAction field to determine whether the user revoked their own document (the AdminAction field is empty) or an administrator revoked a document on behalf of a user (the AdminAction is true).


For more information about usage logging, see [Logging and analyzing usage of the Azure Rights Management service](../deploy-use/log-analyze-usage.md)



## Next steps
Now that you've configured the document tracking site for the Azure Information Protection client, see the following for additional information that you might need to support this client:

- [Client files and usage logging](client-admin-guide-files-and-logging.md)

- [File types supported](client-admin-guide-file-types.md)

- [PowerShell commands](client-admin-guide-powershell.md)

[!INCLUDE[Commenting house rules](../includes/houserules.md)]
