---
# required metadata

title: The client for Azure Information Protection
description: Microsoft Azure Information Protection provides a client-server solution that helps to protect an organization's data. The client (the Azure Information Protection client or the Rights Management client) is integrated with applications that you run on computers and mobile devices.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 02/26/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: a6fa85be-f92a-4e00-9efc-9dbfd4dfbfcb

# optional metadata

#audience:
#ms.devlang:
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# The client side of Azure Information Protection

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*

Azure Information Protection provides a client-server solution that helps to protect an organization's documents and emails:

- The client can be the Azure Information Protection client or the Rights Management client, and this client integrates with applications that you run on computers and mobile devices. 

- The service resides in the cloud (Azure Information Protection, which uses the Azure Rights Management service for the data protection) or on-premises (Active Directory Rights Management Services, more commonly known as AD RMS). 

The Azure Information Protection client supports classification and protection with labeling, in addition to protection without labeling. This client integrates with Office applications and must be installed separately.

The Rights Management (RMS) client is automatically installed with some applications, such as Office applications, the Azure Information Protection client, and RMS-enlightened applications from software vendors. However, it can also be [installed by itself](https://www.microsoft.com/en-us/download/details.aspx?id=38396), to support [synchronizing files from IRM-protected libraries and OneDrive for Business](https://support.office.com/article/Deploy-the-new-OneDrive-sync-client-in-an-enterprise-environment-3f3a511c-30c6-404a-98bf-76f95c519668), and for developers who want to integrate rights management protection into line-of-business applications.

## Choose which Azure Information Protection client to use

The **Azure Information Protection client** that downloads labels and policy settings from the Azure portal is in general availability, and has a preview version for testing new functionality and fixes. For more information about these versions of the client, see the [Azure Information Protection client: Version release history and support policy](client-version-release-history.md). 

The **Azure Information Protection unified labeling client** downloads labels and policy settings from the Office 365 Security & Compliance Center. This client is currently in preview for testing. For more information about this version of the client, see the [Azure Information Protection unified labeling client: Version release information](unifiedlabelingclient-version-release-history.md).

Which client should you install?

- If you are deploying in production, use the Azure Information Protection client that is generally available.

- If you are in a testing and evaluating phase, use one of the preview clients.
    
    Currently, the preview versions of the Azure Information Protection client and the Azure Information Protection unified labeling client don't have parity for their features. However, expect this gap to close and then, new features to be added only to the Azure Information Protection unified labeling client. For this reason, we recommend you test with the Azure Information Protection unified labeling client if its current feature set and functionality meet your business requirements. If not, or if you have configured labels in the Azure portal that you haven't yet [migrated to the unified labeling store](../configure-policy-migrate-labels.md), use the Azure Information Protection client.

### Feature comparisons for the clients

Use the following table to help compare which features are supported by the two current preview versions.

|Feature|Azure Information Protection client|Azure Information Protection<br /> unified labeling client|
|-------|-----------------------------------|----------------------------------------------------|
|Labeling actions: Manual, recommended, automatic| Yes | Yes |
|Information Protection bar in Office apps<br />with customizable tooltip:| Yes | Yes|
|Central reporting (analytics):| Yes | Yes |
|Reset settings and export logs:| Yes | Yes |
|User-defined permissions:| Yes | For Outlook only (Do Not Forward) |
|Custom permissions:| Yes | File Explorer only <br /><br /> In Office apps, as an alternative, users can select **File Info** > **Protect Document** > **Restrict Access** |
|File Explorer, right-click actions:| Yes | Yes with limitations:<br /><br /> - Can't protect PDF documents for .ppdf format <br /><br />  - No support for protection-only mode|
|A viewer for protected files:| Yes | Yes with limitations:<br /><br /> - For generically protected files (.pfile), unlike the viewer from the Azure Information Protection client, there's no ability to save changes to the originally opened file.|
|PowerShell commands:| Yes | Yes with limitations:<br /><br />- Cmdlets included: [Get-AIPFileStatus](/powershell/module/azureinformationprotection/get-aipfilestatus), [Set-AIPFileClassification](/powershell/module/azureinformationprotection/set-aipfileclassification), [Set-AIPFileLabel](/powershell/module/azureinformationprotection/set-aipfilelabel), and [Set-AIPAuthentication](/powershell/module/azureinformationprotection/set-aipauthentication) <br /><br />- Cmdlets that connect directly to a protection service are not included|
|Offline support for protection actions:| Yes | Yes with limitations: <br /><br />- For File Explorer and PowerShell commands, the user must be connected to the Internet to protect files. |
|HYOK support:| Yes | No<br /><br /> Labels that you migrate from the Azure portal and that are configured for HYOK protection are displayed by the Azure Information Protection unified labeling client, but do not apply protection. |
|Usage logging to Event Viewer:| Yes | No|
|Label inheritance from email attachments:| Yes | No |
|Display Do Not Forward button in Outlook| Yes | No |
|[Customizations](client-admin-guide-customizations.md#available-advanced-client-settings) that include:<br />- Default label for email<br />- Enable custom permissions <br />- S/MIME support<br />- Report an Issue option| Yes | No |
|Scanner for on-premises data stores:| Yes | No |
|Track and revoke:| Yes | No |
|Protection-only mode (no labels):| Yes | No |
|Multilanguage support:| Yes | No |
|Support for AD RMS:| Yes | The following action only is supported:<br /><br /> - The viewer can open protected documents|

#### Functional comparison for the clients

When both clients support the same feature, use the following table to help identify some functional differences between the two current preview versions.

|Functionality |Azure Information Protection client|Azure Information Protection<br /> unified labeling client|
|--------------|-----------------------------------|-----------------------------------------------------------|
|Setup:| Option to install local demo policy | No local demo policy|
|Label selection and display when applied in Office apps:|From the **Protect** button on the ribbon <br /><br /> From the Information Protection bar (horizontal bar under the ribbon)|From the **Sensitivity** button on the ribbon<br /><br /> From the Information Protection bar (horizontal bar under the ribbon)|
|Manage the Information Protection bar in Office apps:|For users: <br /><br />- Option to show or hide the bar from the **Protect** button on the ribbon<br /><br />- When a user selects to hide the bar, by default, the bar is hidden in that app, but continues to automatically display in newly opened apps <br /><br /> For admins: <br /><br />- Policy settings to automatically show or hide the bar when an app first opens, and control whether the bar automatically remains hidden for newly opened apps after a user selects to hide the bar|For users: <br /><br />- Option to show or hide the bar from the **Sensitivity** button on the ribbon<br /><br />- When a user selects to hide the bar, the bar is hidden in that app and also in newly opened apps <br /><br />For admins: <br /><br />- No policy settings to manage the bar|
|Label color: | Configure in the Azure portal | Retained after label migration to Office 365 <br /><br /> New labels created in the Security & Compliance Center have the default, black color|
|Policy update: | When an Office app opens <br /><br /> When you right-click to classify and protect a file or folder <br /><br />When you run the PowerShell cmdlets for labeling and protection<br /><br />Every 24 hours | When an Office app opens <br /><br /> When you right-click to classify and protect a file or folder <br /><br />When you run the PowerShell cmdlets for labeling and protection<br /><br />Every 4 hours|
|Supported formats for PDF:| Protection: <br /><br /> - ISO standard for PDF encryption (default) <br /><br /> - .ppdf <br /><br /> Consumption: <br /><br /> - ISO standard for PDF encryption <br /><br />- .ppdf<br /><br />- SharePoint IRM protection| Protection: <br /><br /> - ISO standard for PDF encryption <br /><br /> <br /><br /> Consumption: <br /><br /> - ISO standard for PDF encryption <br /><br />- .ppdf<br /><br />- SharePoint IRM protection|
|Supported cmdlets:| All the cmdlets documented for [AzureInformatioProtection](/powershell/module/azureinformationprotection) | Set-AIPFileClassification doesn't support the the *Owner* parameter <br /><br /> Set-AIPFileLabel doesn't support SharePoint libraries or the *Owner* or *EnableTracking* parameters <br /><br /> Get-AIPFileStatus doesn't return label information from other tenants and returns NULL for the *Owner* and *RMSIssuedTime* parameters<br /><br />In addition, the *LabelingMethod* parameter for Get-AIPFileStatus displays **Privileged**, **Standard**, or **Auto** instead of **Manual** or **Automatic**. For more information, see the [online documentation](/powershell/module/azureinformationprotection/get-aipfilestatus).|
|Justification prompts (if configured) per action in Office: | Frequency: Per file <br /><br /> Lowering the sensitivity level <br /><br /> Removing a label<br /><br /> Removing protection | Frequency: Per session <br /><br /> Lowering the sensitivity level<br /><br /> Removing a label|
|Remove label actions: | User is prompted to confirm <br /><br />Default label or automatic label (if configured) isn't automatically applied next time the Office app opens the file  <br /><br />| User isn't prompted to confirm<br /><br /> Default label or automatic label (if configured) is automatically applied next time the Office app opens the file|
|Automatic and recommended classification: | Configured as [label conditions](../configure-policy-classification.md) in the Azure portal with built-in information types and custom conditions that use phrases or regular expressions <br /><br />Configuration options include: <br /><br />- Unique / Not unique count <br /><br /> - Minimum count| Configured in the Security & Compliance Center with built-in sensitive information types and [custom information types](https://docs.microsoft.com/office365/securitycompliance/create-a-custom-sensitive-information-type)<br /><br />Configuration options include:  <br /><br />- Unique count only <br /><br />- Minimum and maximum count <br /><br />- AND and OR support with information types <br /><br />- Keyword dictionary<br /><br />- Customizable confidence level and character proximity|

##### Parent labels and their sublabels 

The Azure Information Protection client doesn't support configurations that specify a parent label that has sublabels. These configurations include specifying a default label, and a label for recommended or automatic classification. When a label has sublabels, you can specify one of the sublabels but not the parent label.

For parity, the Azure Information Protection unified labeling client also doesn't support applying parent labels that have sublabels, even though you can select these labels in the Office 365 Security & Compliance Center. In this scenario, the Azure Information Protection unified labeling client will not apply the parent label.

## See also
Use the following documentation when you need more information about how to deploy and use these clients:

- [Azure Information Protection client](AIP-client.md)

- [Azure Information Protection unified labeling client](unifiedlabelingclient-version-release-history.md)

- [RMS client deployment notes](client-deployment-notes.md)

Although the Azure Information Protection client can be used with AD RMS, the Azure Information Protection client is best suited to work with its Azure services; Azure Information Protection and its data protection service, Azure Rights Management. For a comparison of the service side for Azure Information Protection, see [Comparing Azure Information Protection and AD RMS](../compare-on-premise.md).
