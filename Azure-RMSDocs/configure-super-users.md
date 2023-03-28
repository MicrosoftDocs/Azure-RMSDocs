---
# required metadata

title: Configure super users for Azure Rights Management - AIP
description: Understand and implement the super user feature of the Azure Rights Management service from Azure Information Protection, so that authorized people and services can always read and inspect ("reason over") your organization's protected data.
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 07/22/2021
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: acb4c00b-d3a9-4d74-94fe-91eeb481f7e3

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: azurerms
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Configuring super users for Azure Information Protection and discovery services or data recovery

The super user feature of the Azure Rights Management service from Azure Information Protection ensures that authorized people and services can always read and inspect the data that Azure Rights Management protects for your organization. If necessary, the protection can then be removed or changed.

A super user always has the Rights Management Full Control [usage right](configure-usage-rights.md) for documents and emails that have been protected by your organization’s Azure Information Protection tenant. This ability is sometimes referred to as "reasoning over data" and is a crucial element in maintaining control of your organization’s data. For example, you would use this feature for any of the following scenarios:

- An employee leaves the organization and you need to read the files that they protected.

- An IT administrator needs to remove the current protection policy that was configured for files and apply a new protection policy.

- Exchange Server needs to index mailboxes for search operations.

- You have existing IT services for data loss prevention (DLP) solutions, content encryption gateways (CEG), and anti-malware products that need to inspect files that are already protected.

- You need to bulk decrypt files for auditing, legal, or other compliance reasons.

## Configuration for the super user feature

By default, the super user feature is not enabled, and no users are assigned this role. It is enabled for you automatically if you configure the Rights Management connector for Exchange, and it is not required for standard services that run Exchange Online, Microsoft Sharepoint Server, or SharePoint in Microsoft 365.

If you need to manually enable the super user feature, use the PowerShell cmdlet [Enable-AipServiceSuperUserFeature](/powershell/module/aipservice/enable-aipservicesuperuserfeature), and then assign users (or service accounts) as needed by using the [Add-AipServiceSuperUser](/powershell/module/aipservice/add-aipservicesuperuser) cmdlet or the [Set-AipServiceSuperUserGroup](/powershell/module/aipservice/set-aipservicesuperusergroup) cmdlet and add users (or other groups) as needed to this group. 

Although using a group for your super users is easier to manage, be aware that for performance reasons, Azure Rights Management [caches the group membership](prepare.md#group-membership-caching-by-azure-information-protection). So if you need to assign a new user to be a super user to decrypt content immediately, add that user by using Add-AipServiceSuperUser, rather than adding the user to an existing group that you have configured by using Set-AipServiceSuperUserGroup.

> [!NOTE]
> - When adding a user with the [Add-AipServiceSuperUser](/powershell/module/aipservice/add-aipservicesuperuser) cmdlet, you must also add the primary mail address or user principal name to the group. Email aliases are not evaluated.
> 
> - If you have not yet installed the Windows PowerShell module for Azure Rights Management, see [Installing the AIPService PowerShell module](install-powershell.md).

It doesn't matter when you enable the super user feature or when you add users as super users. For example, if you enable the feature on Thursday and then add a user on Friday, that user can immediately open content that was protected at the very beginning of the week.

## Security best practices for the super user feature

- Restrict and monitor the administrators who are assigned a global administrator for your Microsoft 365 or Azure Information Protection tenant, or who are assigned the GlobalAdministrator role by using the [Add-AipServiceRoleBasedAdministrator](/powershell/module/aipservice/add-aipservicerolebasedadministrator) cmdlet. These users can enable the super user feature and assign users (and themselves) as super users, and potentially decrypt all files that your organization protects.

- To see which users and service accounts are individually assigned as super users, use the [Get-AipServiceSuperUser](/powershell/module/aipservice/get-aipservicesuperuser) cmdlet. 

- To see whether a super user group is configured, use the [Get-AipServiceSuperUserGroup](/powershell/module/aipservice/get-aipservicesuperusergroup) cmdlet and your standard user management tools to check which users are a member of this group. 

- Like all administration actions, enabling or disabling the super feature, and adding or removing super users are logged and can be audited by using the [Get-AipServiceAdminLog](/powershell/module/aipservice/get-aipserviceadminlog) command. For example, see [Example auditing for the super user feature](#example-auditing-for-the-super-user-feature).

- When super users decrypt files, this action is logged and can be audited with [usage logging](log-analyze-usage.md).

    > [!NOTE]
    > While the logs include details about the decryption, including the user who decrypted the file, they do not note when the user is a super user. 
    > Use the logs together with the cmdlets listed above to first collect a list of super users that you can identify in the logs.
    >

- If you do not need the super user feature for everyday services, enable the feature only when you need it, and disable it again by using the [Disable-AipServiceSuperUserFeature](/powershell/module/aipservice/disable-aipservicesuperuserfeature) cmdlet.

### Example auditing for the super user feature

The following log extract shows some example entries from using the [Get-AipServiceAdminLog](/powershell/module/aipservice/get-aipserviceadminlog) cmdlet. 

In this example, the administrator for Contoso Ltd confirms that the super user feature is disabled, adds Richard Simone as a super user, checks that Richard is the only super user configured for the Azure Rights Management service, and then enables the super user feature so that Richard can now decrypt some files that were protected by an employee who has now left the company.

`2015-08-01T18:58:20	admin@contoso.com	GetSuperUserFeatureState	Passed	Disabled`

`2015-08-01T18:59:44	admin@contoso.com	AddSuperUser -id rsimone@contoso.com	Passed	True`

`2015-08-01T19:00:51	admin@contoso.com	GetSuperUser	Passed	rsimone@contoso.com`

`2015-08-01T19:01:45	admin@contoso.com	SetSuperUserFeatureState -state Enabled	Passed	True`

## Scripting options for super users

Often, somebody who is assigned a super user for Azure Rights Management will need to remove protection from multiple files, in multiple locations. While it’s possible to do this manually, it’s more efficient (and often more reliable) to script this using the [Set-AIPFileLabel](/powershell/module/azureinformationprotection/set-aipfilelabel) cmdlet.

If you are using classification and protection, you can also use the [Set-AIPFileLabel](/powershell/module/azureinformationprotection/set-aipfilelabel) to apply a new label that doesn't apply protection, or remove the label that applied protection.

For more information about these cmdlets, see [Using PowerShell with the Azure Information Protection client](/previous-versions/azure/information-protection/rms-client/client-admin-guide-powershell) from the Azure Information Protection client admin guide.

> [!NOTE]
> The AzureInformationProtection module is different from and supplements the [AIPService PowerShell module](administer-powershell.md) that manages the Azure Rights Management service for Azure Information Protection.

### Removing protection on PST files

To remove protection on PST files, we recommend that you use [eDiscovery from Microsoft Purview](/microsoft-365/compliance/ediscovery) to search and extract protected emails and protected attachment in emails.

The super user ability is automatically integrated with Exchange Online so that eDiscovery in the Microsoft Purview compliance portal can search for encrypted items prior to export, or decrypt encrypted email on export.

If you cannot use Microsoft Purview eDiscovery, you might have another eDiscovery solution that integrates with the Azure Rights Management service to similarly reason over data. 

Or, if your eDiscovery solution cannot automatically read and decrypt protected content, you can still use this solution in a multi-step process together with the [Set-AIPFileLabel](/powershell/module/azureinformationprotection/set-aipfilelabel) cmdlet:

1. Export the email in question to a PST file from Exchange Online or Exchange Server, or from the workstation where the user stored their email.

2. Import the PST file into your eDiscovery tool. Because the tool cannot read protected content, it's expected that these items will generate errors.

3. From all the items that the tool couldn't open, generate a new PST file that this time, contains just protected items. This second PST file will likely be much smaller than the original PST file.

4. Run [Set-AIPFileLabel](/powershell/module/azureinformationprotection/set-aipfilelabel)  on this second PST file to decrypt the contents of this much smaller file. From the output, import the now-decrypted PST file into your discovery tool.

For more detailed information and guidance for performing eDiscovery across mailboxes and PST files, see the following blog post: [Azure Information Protection and eDiscovery Processes](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/Azure-Information-Protection-and-eDiscovery-Processes/ba-p/270216).
