---
# required metadata

title: The client for Azure Information Protection - AIP
description: Microsoft Azure Information Protection provides a client-server solution that helps to protect an organization's data. The client (the Azure Information Protection client or the Rights Management client) is integrated with applications that you run on computers and mobile devices.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 07/18/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#audience:
#ms.devlang:
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:
search.appverid:
- MET150

---

# The client side of Azure Information Protection

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*

Azure Information Protection provides a client-server solution that helps to protect an organization's documents and emails:

- The client can be the Azure Information Protection client (classic), the Azure Information Protection unified labeling client, or the Rights Management client. Whichever of these clients you use, it integrates with applications that you run on computers and mobile devices. 
- The service resides in the cloud (Azure Information Protection, which uses the Azure Rights Management service for the data protection) or on-premises (Active Directory Rights Management Services, more commonly known as AD RMS). 

The Azure Information Protection client (classic) and the Azure Information Protection unified labeling client supports classification and protection with labeling. The classic client also supports protection without labeling. Both clients integrate with Office applications and must be installed separately.

The Rights Management (RMS) client is automatically installed with some applications, such as Office applications, the Azure Information Protection client (classic) and Azure Information Protection unified labeling client, and RMS-enlightened applications from software vendors. However, it can also be [installed by itself](https://www.microsoft.com/en-us/download/details.aspx?id=38396), to support [synchronizing files from IRM-protected libraries and OneDrive for Business](https://support.office.com/article/Deploy-the-new-OneDrive-sync-client-in-an-enterprise-environment-3f3a511c-30c6-404a-98bf-76f95c519668), and for developers who want to integrate rights management protection into line-of-business applications.

## Choose which Azure Information Protection client to use

The **Azure Information Protection client (classic)** downloads labels and policy settings from the Azure portal. For more information about this client, see the [Azure Information Protection client: Version release history and support policy](client-version-release-history.md).

The **Azure Information Protection unified labeling client** downloads labels and policy settings from the admin centers: The Office 365 Security & Compliance Center, Microsoft 365 security center, and Microsoft 365 compliance center. For more information about this client, see the [Azure Information Protection unified labeling client: Version release information](unifiedlabelingclient-version-release-history.md).

Which client should you install?

- Install the Azure Information Protection unified labeling client for labels and policy settings that can also be used by MacOS, iOS, and Android, and if you don’t need the few features that aren't yet supported by the classic client. These features include protecting content with an on-premises key (HYOK) and a scanner for on-premises data stores.

- Install the Azure Information Protection client (classic) if you need a version of the client that has features that are not yet available with the unified labeling client. Your tradeoff is that not all label settings can be used on other client platforms, and administration using another management portal.

Currently, the classic client and the unified labeling client don't have parity for their features. However, this gap is closing and you can expect new features to be added only to the unified labeling client. For this reason, we recommend you deploy the unified labeling client if its current feature set and functionality meet your business requirements. If not, or if you have configured labels in the Azure portal that you haven't yet [migrated to the unified labeling store](../configure-policy-migrate-labels.md), use the classic client.

You can also install both clients in the same environment to support different business requirements, as demonstrated in the following example. For this scenario, we recommend you migrate the labels in the Azure portal so that both sets of clients share the same set of labels for ease of administration.

##### Example deployment strategy:

- For the majority of users, you deploy the Azure Information Protection unified labeling client because this client meets the business needs for these users. 
    
    For these users, their labeling experience is very similar across Windows, Mac, iOS, and Android because they have the same labels published to them and the same policy settings. As an admin, you manage these labels and policy settings in the same management portal.

- For a subset of users, you deploy the classic client because these users require one or more labels that apply hold your own key (HYOK) protection.
    
    For these users, they have a slightly different labeling experience when they use this client. For example, they see a **Protect** button in their Windows apps rather than a **Sensitivity** button in Office for Mac. As an admin, you need to manage their labels for HYOK settings and policy settings in a different management portal to the labels and settings for the other client platforms.

- You have on-premises data stores with documents that need to be scanned for sensitive information, or classified and protected. You deploy the classic client on servers to run the Azure Information Protection scanner.

### Compare the clients

Use the following table to help compare which features are supported by the two Azure Information Protection clients.

|Feature|Classic client|Unified labeling client|
|-------|-----------------------------------|----------------------------------------------------|
|Labeling actions: Manual, recommended, automatic| Yes | Yes |
|Central reporting (analytics):| Yes | Yes |
|Multilanguage support for labels:| Yes | Yes |
|Reset settings and export logs:| Yes | Yes |
|User-defined permissions:| Yes | Yes with limitations: <br /><br />- For Outlook only (Do Not Forward): Supported<br /><br />- For Word, Excel, PowerPoint, and File Explorer: Supported when you configure the label in the Azure portal |
|Custom permissions:| Yes | File Explorer and PowerShell <br /><br /> In Office apps, as an alternative, users can select **File Info** > **Protect Document** > **Restrict Access**  or admins can configure a label for user-defined permissions|
|Information Protection bar in Office apps:| Yes | Yes with limitations:<br /><br /> - No title or customizable tooltip<br /><br /> - Label color not displayed for applied label|
|Labels can apply visual markings (header, footer, watermark):| Yes | Yes with limitations:<br /><br /> - Headers and footers do not support variables for dynamic values <br /><br /> - No support for Word, Excel, PowerPoint, and Outlook to have different visual markings|
|File Explorer, right-click actions:| Yes | Yes with limitations:<br /><br /> - Can't protect PDF documents for .ppdf format <br /><br />  - No support for protection-only mode|
|A viewer for protected files:| Yes | Yes with limitations:<br /><br /> - For generically protected files (.pfile), unlike the viewer from the classic client, there's no ability to save changes to the originally opened file.|
|PowerShell commands:| Yes | Yes with limitations:<br /><br />- Cmdlets included: [Get-AIPFileStatus](/powershell/module/azureinformationprotection/get-aipfilestatus), [New-AIPCustomPermissions](/powershell/module/azureinformationprotection/New-AIPCustomPermissions), [Set-AIPFileClassification](/powershell/module/azureinformationprotection/set-aipfileclassification), [Set-AIPFileLabel](/powershell/module/azureinformationprotection/set-aipfilelabel), [Set-AIPAuthentication](/powershell/module/azureinformationprotection/set-aipauthentication) <br /><br />- Currently, you cannot remove protection from container files (zip, .rar, .7z, .msg, and .pst)|
|Offline support for protection actions:| Yes | Yes with limitations: <br /><br />- For File Explorer and PowerShell commands, the user must be connected to the Internet to protect files. |
|Support for disconnected computers with manual policy file management:| Yes |No |
|HYOK support:| Yes | No<br /><br /> Labels that you migrate from the Azure portal and that are configured for HYOK protection are displayed by the Azure Information Protection unified labeling client, but do not apply protection. |
|Usage logging to Event Viewer:| Yes | No|
|Label inheritance from email attachments:| Yes | Yes  |
|Display the Do Not Forward button in Outlook| Yes | No |
|[Customizations](client-admin-guide-customizations.md#available-advanced-client-settings) that include:<br />- Default label for email<br />- Enable custom permissions <br />- S/MIME support<br />- Report an Issue option| Yes | Yes by using [PowerShell](clientv2-admin-guide-customizations.md#how-to-configure-advanced-settings-for-the-client-by-using-office-365-security--compliance-center-powershell) |
|Scanner for on-premises data stores:| Yes | No |
|Track and revoke:| Yes | No |
|Protection-only mode (no labels) using templates:| Yes | No |
|Support for AD RMS:| Yes | The following action only is supported:<br /><br /> - The viewer can open protected documents when you deploy the [Active Directory Rights Management Services Mobile Device Extension](/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/dn673574\(v=ws.11\))|

#### Detailed comparisons for the clients

When both clients support the same feature, use the following table to help identify some functional differences between the two clients.

|Functionality |Classic client|Unified labeling client|
|--------------|-----------------------------------|-----------------------------------------------------------|
|Setup:| Option to install local demo policy | No local demo policy|
|Label selection and display when applied in Office apps:|From the **Protect** button on the ribbon <br /><br /> From the Information Protection bar (horizontal bar under the ribbon)|From the **Sensitivity** button on the ribbon<br /><br /> From the Information Protection bar (horizontal bar under the ribbon)|
|Manage the Information Protection bar in Office apps:|For users: <br /><br />- Option to show or hide the bar from the **Protect** button on the ribbon<br /><br />- When a user selects to hide the bar, by default, the bar is hidden in that app, but continues to automatically display in newly opened apps <br /><br /> For admins: <br /><br />- Policy settings to automatically show or hide the bar when an app first opens, and control whether the bar automatically remains hidden for newly opened apps after a user selects to hide the bar|For users: <br /><br />- Option to show or hide the bar from the **Sensitivity** button on the ribbon<br /><br />- When a user selects to hide the bar, the bar is hidden in that app and also in newly opened apps <br /><br />For admins: <br /><br />- PowerShell setting to manage the bar |
|Label color: | Configure in the Azure portal | Retained after label migration to Office 365 and configurable with PowerShell <br /><br /> Colors can be configured by using [PowerShell](clientv2-admin-guide-customizations.md#specify-a-color-for-the-label)|
|Labels support different languages:| Configure in the Azure portal | Configure by using Office 365 Security & Compliance PowerShell and the *LocaleSettings* parameter for [New-Label](https://docs.microsoft.com/powershell/module/exchange/policy-and-compliance/new-label?view=exchange-ps) and [Set-Label](https://docs.microsoft.com/powershell/module/exchange/policy-and-compliance/set-label?view=exchange-ps)|
|Policy update: | When an Office app opens <br /><br /> When you right-click to classify and protect a file or folder <br /><br />When you run the PowerShell cmdlets for labeling and protection<br /><br />Every 24 hours | When an Office app opens <br /><br /> When you right-click to classify and protect a file or folder <br /><br />When you run the PowerShell cmdlets for labeling and protection<br /><br />Every 4 hours|
|Supported formats for PDF:| Protection: <br /><br /> - ISO standard for PDF encryption (default) <br /><br /> - .ppdf <br /><br /> Consumption: <br /><br /> - ISO standard for PDF encryption <br /><br />- .ppdf<br /><br />- SharePoint IRM protection| Protection: <br /><br /> - ISO standard for PDF encryption <br /><br /> <br /><br /> Consumption: <br /><br /> - ISO standard for PDF encryption <br /><br />- .ppdf<br /><br />- SharePoint IRM protection|
|Supported cmdlets:| All the cmdlets documented for [AzureInformatioProtection](/powershell/module/azureinformationprotection) | Set-AIPFileClassification, Set-AIPFileLabel, and Get-AIPFileStatus don't support SharePoint paths <br /><br /> Set-AIPFileClassification and Set-AIPFileLabel don't support the *Owner* parameter <br /><br /> In addition, there is a single comment of "No label to apply" for all scenarios where a label isn't applied <br /><br /> Set-AIPFileClassification supports the *WhatIf* parameter, so it can be run in discovery mode <br /><br /> Set-AIPFileLabel doesn't support the *EnableTracking* parameter <br /><br /> Get-AIPFileStatus doesn't return label information from other tenants and doesn't display the *RMSIssuedTime* parameter<br /><br />In addition, the *LabelingMethod* parameter for Get-AIPFileStatus displays **Privileged** or **Standard** instead of **Manual** or **Automatic**. For more information, see the [online documentation](/powershell/module/azureinformationprotection/get-aipfilestatus).|
|Justification prompts (if configured) per action in Office: | Frequency: Per file <br /><br /> Lowering the sensitivity level <br /><br /> Removing a label<br /><br /> Removing protection | Frequency: Per session <br /><br /> Lowering the sensitivity level<br /><br /> Removing a label|
|Remove applied label actions: | User is prompted to confirm <br /><br />Default label or automatic label (if configured) isn't automatically applied next time the Office app opens the file  <br /><br />| User isn't prompted to confirm<br /><br /> Default label or automatic label (if configured) is automatically applied next time the Office app opens the file|
|Automatic and recommended labels: | Configured as [label conditions](../configure-policy-classification.md) in the Azure portal with built-in information types and custom conditions that use phrases or regular expressions <br /><br />Configuration options include: <br /><br />- Unique / Not unique count <br /><br /> - Minimum count| Configured in the admin centers with built-in sensitive information types and [custom information types](https://docs.microsoft.com/office365/securitycompliance/create-a-custom-sensitive-information-type)<br /><br />Configuration options include:  <br /><br />- Unique count only <br /><br />- Minimum and maximum count <br /><br />- AND and OR support with information types <br /><br />- Keyword dictionary<br /><br />- Customizable confidence level and character proximity|
|Customizable policy tip for automatic and recommended labels: | Yes <br /><br />Use the Azure portal to replace the default message to users | No <br /><br /> Although the admin centers have an option to supply a customized policy tip, this option is not currently supported by the unified labeling client|
|Change the default protection level of files: | Yes <br /><br />You can use [registry edits](client-admin-guide-file-types.md#changing-the-default-protection-level-of-files) to override the defaults of native and generic protection | No |

For a detailed comparison of behavior differences for specific protection settings, see [Comparing the behavior of protection settings for a label](../configure-policy-migrate-labels.md#comparing-the-behavior-of-protection-settings-for-a-label).

#### Features not planned to be in the Azure Information Protection unified labeling client

Although the Azure Information Protection unified labeling client is still under development, the following features and behavior differences from the classic client are not currently planned to be available in future releases for the unified labeling client: 

- Support Office apps for disconnected computers with manual policy file management

- Custom permissions as an option that users can select in Office apps: Word, Excel, and PowerPoint

- Track and revoke from Office apps and File Explorer

- Information Protection bar title and tooltip

- Protection-only mode (no labels) using templates

- Protect PDF document as .ppdf format

- Display the Do Not Forward button in Outlook

- Demo policy

- Justification for removing protection

- Confirmation prompt **Do you want to delete this label?** for users when you don't use the policy setting for justification

- Label an Office document by using an existing custom property (SyncPropertyName and SyncPropertyState advanced client settings)

- Separate PowerShell cmdlets to connect to a Rights Management service


#### Parent labels and their sublabels 

The Azure Information Protection client (classic) doesn't support configurations that specify a parent label that has sublabels. These configurations include specifying a default label, and a label for recommended or automatic classification. When a label has sublabels, you can specify one of the sublabels but not the parent label.

For parity, the Azure Information Protection unified labeling client also doesn't support applying parent labels that have sublabels, even though you can select these labels in the admin centers. In this scenario, the Azure Information Protection unified labeling client will not apply the parent label.

## See also
Use the following documentation when you need more information about how to deploy and use these clients:

- [Azure Information Protection client](AIP-client.md)

- [Azure Information Protection unified labeling client](unifiedlabelingclient-version-release-history.md)

- [RMS client deployment notes](client-deployment-notes.md)

Although the Azure Information Protection client (classic) can be used with AD RMS, this client is best suited to work with its Azure services; Azure Information Protection and its protection service, Azure Rights Management. For a comparison of the service side for Azure Information Protection, see [Comparing Azure Information Protection and AD RMS](../compare-on-premise.md).