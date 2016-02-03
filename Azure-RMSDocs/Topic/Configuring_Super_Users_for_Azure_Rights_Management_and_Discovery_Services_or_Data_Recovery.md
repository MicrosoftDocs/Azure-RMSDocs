---
title: Configuring Super Users for Azure Rights Management and Discovery Services or Data Recovery
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: acb4c00b-d3a9-4d74-94fe-91eeb481f7e3
author: Cabailey
---
# Configuring Super Users for Azure Rights Management and Discovery Services or Data Recovery
The super user feature of Microsoft [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] (Azure RMS) ensures that authorized people and services can always read and inspect the data that Azure RMS protects for your organization. And if necessary, remove the protection or change the protection that was previously applied. A super user always has full owner rights for all use licenses that was granted by the organization’s RMS tenant. This ability is sometimes referred to as “reasoning over data” and is a crucial element in maintaining control of your organization’s data. For example, you would use this feature for any of the following scenarios:

-   An employee leaves the organization and you need to read the files that they protected.

-   An IT administrator needs to remove the current protection policy that was configured for files and apply a new protection policy.

-   Exchange Server needs to index mailboxes for search operations.

-   You have existing IT services for data loss prevention (DLP) solutions, content encryption gateways (CEG), and anti-malware products that need to inspect files that are already protected.

-   You need to bulk decrypt files for auditing, legal, or other compliance reasons.

By default, the super user feature is not enabled, and no users are assigned this role. It is enabled for you automatically if you configure the Rights Management connector for Exchange, and it is not required for standard services that run Exchange Online, SharePoint Online, or SharePoint Server.

If you need to manually enable the super user feature, use the Windows PowerShell cmdlet [Enable-AadrmSuperUserFeature](https://msdn.microsoft.com/library/azure/dn629400.aspx), and then assign users (or service accounts) as needed by using the [Add-AadrmSuperUser](https://msdn.microsoft.com/library/azure/dn629411.aspx) cmdlet or the (Set-AadrmSuperUserGroup)[https://msdn.microsoft.com/library/azure/mt653943.aspx] cmdlet and add users (or other groups) as needed to this group. 

> [!NOTE]
> If you have not yet installed the Windows PowerShell module for [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)], see [Installing Windows PowerShell for Azure Rights Management](../Topic/Installing_Windows_PowerShell_for_Azure_Rights_Management.md).

Security best practices for the super user feature:

-   Restrict and monitor the administrators who are assigned a global administrator for your Office 365 or Azure RMS tenant, or who are  assigned the GlobalAdministrator role by using the [Add-AadrmRoleBasedAdministrator](https://msdn.microsoft.com/library/azure/dn629417.aspx) cmdlet. These users can enable the super user feature and assign users (and themselves) as super users, and potentially decrypt all files that your organization protects.

-   To see which users and service accounts are individually assigned as super users, use the [Get-AadrmSuperUser cmdlet](https://msdn.microsoft.com/library/azure/dn629408.aspx). To see whether a super user group is configured, use the [Get-AadrmSuperUser](https://msdn.microsoft.com/library/azure/mt653942.aspx) cmdlet and your standard user management tools to check which users are a member of this group. Like all administration actions, enabling or disabling the super feature, and adding or removing super users are logged and can be audited by using the [Get-AadrmAdminLog](https://msdn.microsoft.com/library/azure/dn629430.aspx) command. When super users decrypt files, this action is logged and can be audited with [usage logging](https://technet.microsoft.com/library/dn529121.aspx).

-   If you do not need the super user feature for everyday services, enable the feature only when you need it, and disable it again by using the [Disable-AadrmSuperUserFeature](https://msdn.microsoft.com/library/azure/dn629428.aspx) cmdlet.

The following log extract shows some example entries from using the Get-AadrmAdminLog cmdlet. In this example, the administrator for Contoso Ltd confirms that the super user feature is disabled, adds Richard Simone as a super user, checks that Richard is the only super user configured for Azure RMS, and then enables the super user feature so that Richard can now decrypt some files that were protected by an employee who has now left the company.

`2015-08-01T18:58:20	admin@contoso.com	GetSuperUserFeatureState	Passed	Disabled`
`2015-08-01T18:59:44	admin@contoso.com	AddSuperUser -id rsimone@contoso.com	Passed	True`
`2015-08-01T19:00:51	admin@contoso.com	GetSuperUser	Passed	rsimone@contoso.com`
`2015-08-01T19:01:45	admin@contoso.com	SetSuperUserFeatureState -state Enabled	Passed	True`

## <a name="BKMK_RMSProtectionModule"></a>Scripting options for super users
Often, somebody who is assigned a super user for [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] will need to remove protection from multiple files, in multiple locations. While it’s possible to do this manually, it’s more efficient (and often more reliable) to script this. To do so, [download the RMS Protection Tool](http://www.microsoft.com/en-us/download/details.aspx?id=47256). Then, use the  [Unprotect-RMSFile](https://msdn.microsoft.com/library/azure/mt433200.aspx) cmdlet, and [Protect-RMSFile](https://msdn.microsoft.com/library/azure/mt433201.aspx)   cmdlet as required.

> [!IMPORTANT]
> Although the RMS Protection tool is designed for super users to bulk unprotect files for recovery purposes, the current version of the tool does not support user authentication for Azure RMS. Until this limitation is resolved, you must use a service principal account to authenticate with Azure RMS before you can remove protection from files. For more information and instructions, see [about_RMSProtection_AzureRMS](https://msdn.microsoft.com/library/azure/mt433202.aspx).

For more information about these cmdlets, see [RMS Protection Cmdlets](https://msdn.microsoft.com/library/azure/mt433195.aspx).

> [!NOTE]
> The RMSProtection Windows PowerShell module that ships with the RMS Protection Tool is different from and supplements the main [Windows PowerShell module for Azure Rights Management](https://technet.microsoft.com/library/jj585027.aspx). It supports both Azure RMS and AD RMS.

## See Also
[Configuring Azure Rights Management](../Topic/Configuring_Azure_Rights_Management.md)

