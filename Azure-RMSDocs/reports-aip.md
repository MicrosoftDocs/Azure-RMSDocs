---
# required metadata

title: Analytics and central reporting for Azure Information Protection (AIP)
description: Learn how to use Azure Information Protection (AIP) analytics and central reporting to track label usage and to identify files that contain sensitive information.
author: batamig
ms.author: bagol
ms.date: 07/08/2021
manager: rkarlin
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: b2da2cdc-74fd-4bfb-b3c2-2a3a59a6bf2e

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: analytics
ms.reviewer: lilukov
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Analytics and central reporting for Azure Information Protection (public preview)

>***Applies to**: [Azure Information Protection](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection)*
>
>***Relevant for**: [AIP unified labeling client and classic client](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

[!INCLUDE [AIP classic client is sunset](includes/classic-client-sunset.md)]

This article describes how to use Azure Information Protection (AIP) analytics for central reporting, which can help you track the adoption of your labels that classify and protect your organization's data.

AIP analytics also enable you to do perform the following steps:

- Monitor labeled and protected documents and emails across your organization

- Identify documents that contain sensitive information within your organization

- Monitor user access to labeled documents and emails, and track document classification changes.

- Identify documents that contain sensitive information that might be putting your organization at risk if they are not protected, and mitigate your risk by following recommendations.

- Identify when protected documents are accessed by internal or external users from Windows computers, and whether access was granted or denied.

The data that you see is aggregated from your Azure Information Protection clients and scanners, from Microsoft Defender for Cloud Apps, and from [protection usage logs](log-analyze-usage.md).

Azure Information Protection analytics for central reporting is currently in PREVIEW. The [Azure Preview Supplemental Terms](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) include additional legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability.


## AIP reporting data

For example, the Azure Information Protection analytics for central reporting displays the following data:

|Report  |Sample data shown |
|---------|---------|
|**Usage report**     |  Select a time period to show any of the following: <br /><br />     - Which labels are being applied <br /><br />- How many documents and emails are being labeled <br /><br />- How many documents and emails are being protected <br /><br />- How many users and how many devices are labeling documents and emails <br /><br />- Which applications are being used for labeling     |
|**Activity logs**     | Select a time period to show any of the following: <br /><br />      - Which files previously discovered by scanner were deleted from the scanned repository <br /> <br /> - What labeling actions were performed by a specific user <br /><br /> - What labeling actions were performed from a specific device<br /> <br />    - Which users have accessed a specific labeled document<br /> <br />- What labeling actions were performed for a specific file path<br /> <br />- What labeling actions were performed by a specific application, such File Explorer and right-click, PowerShell, the scanner, or Microsoft Defender for Cloud Apps <br /> <br />- Which protected documents were accessed successfully by users or denied access to users, even if those users don't have the Azure Information Protection client installed or are outside your organization <br /> <br />- Drill down into reported files to view **Activity Details** for additional information      |
|**Data discovery report**     |      - What files are on your scanned data repositories, Windows 10 computers, or computers running the Azure Information Protection clients <br /><br />- Which files are labeled and protected, and the location of files by labels <br /><br />- Which files contain sensitive information for known categories, such as financial data and personal information, and the location of files by these categories       |
|**Recommendations report**     | - Identify unprotected files that contain a known sensitive information type. A recommendation lets you immediately configure the corresponding condition for one of your labels to apply automatic or recommended labeling. **<br />If you follow the recommendation**: The next time the files are opened by a user or scanned by the Azure Information Protection scanner, the files can be automatically classified and protected. <br /><br /> - Which data repositories have files with identified sensitive information but are not being scanned by the Azure Information Protection. A recommendation lets you immediately add the identified data store to one of your scanner's profiles. <br />   **If you follow the recommendation**: On the next scanner cycle, the files can be automatically classified and protected.        |
| | |

The reports use [Azure Monitor](/azure/log-analytics/log-analytics-overview) to store the data in a Log Analytics workspace that your organization owns. If you're familiar with the query language, you can modify the queries, and create new reports and Power BI dashboards. You might find the following tutorial helpful to understand the query language: [Get started with Azure Monitor log queries](/azure/azure-monitor/log-query/get-started-queries).

AIP audit logs may take up to 24 hours to appear in your Log Analytics workspace.

For more information, see [Data discovery, reporting and analytics for all your data with Microsoft Information Protection](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/Data-discovery-reporting-and-analytics-for-all-your-data-with/ba-p/253854).


### Information collected and sent to Log Analytics

To generate these reports, endpoints send the following types of information to the customer's Log Analytics:

- The label action. For example, set a label, change a label, add or remove protection, automatic and recommended labels.

- The label name before and after the label action.

- Your organization's tenant ID.

- The user ID (email address or UPN).

- The name of the user's device.

- The IP address of the user's device. 

- The relevant process name, such as **outlook** or **msip.app**.

- The name of the application that performed the labeling, such as **Outlook** or **File Explorer**

- For documents: The file path and file name of documents that are labeled.

- For emails: The email subject and email sender  for emails that are labeled. 

- The sensitive information types ([predefined](/office365/securitycompliance/what-the-sensitive-information-types-look-for) and custom) that were detected in content.

- The Azure Information Protection client version.

- The client operating system version.

This information is stored in an Azure Log Analytics workspace that your organization owns and can be viewed independently from Azure Information Protection by users who have access rights to this workspace. 

For more details, see:

- [Permissions required for Azure Information Protection analytics](#permissions-required-for-azure-information-protection-analytics)
- [Manage access to Log Analytics Workspace using Azure permissions](/azure/azure-monitor/platform/manage-access#manage-access-using-azure-permissions)
- [Azure Information Protection audit log reference](audit-logs.md)

#### Prevent the AIP clients from sending auditing data

**Unified labeling client**

To prevent the Azure Information Protection unified labeling client from sending auditing data, configure a [label policy advanced setting](rms-client/clientv2-admin-guide-customizations.md#prevent-audit-data-from-being-sent-to-aip-and-microsoft-365-analytics).

**Classic client**

To prevent the Azure Information Protection classic client from sending this data, set the [policy setting](configure-policy-settings.md) of **Send audit data to Azure Information Protection analytics** to **Off**:

|Requirement  |Instructions  |
|---------|---------|
|**To configure most users to send data, with a subset of users who cannot send data**     |  Set **Send audit data to Azure Information Protection analytics** to **Off** in a scoped policy for the subset of users. <br><br> This configuration is typical for production scenarios.     |
|**To configure only a subset of users who send data**     |  Set **Send audit data to Azure Information Protection analytics** to **Off** in the global policy, and **On** in a scoped policy for the subset of users. <br><br>This configuration is typical for testing scenarios.       |
| | |

#### Content matches for deeper analysis

Azure Information Protection lets you collect and store the actual data that's identified as being a sensitive information type (predefined or custom). For example, this can include credit card numbers that are found, as well as social security numbers, passport numbers, and bank account numbers. The content matches are displayed when you select an entry from **Activity logs**, and view the **Activity Details**. 

By default, Azure Information Protection clients don't send content matches. To change this behavior so that content matches are sent:

|Client  |Instructions  |
|---------|---------|
|**Unified labeling client**      |  Configure an [advanced setting](./rms-client/clientv2-admin-guide-customizations.md#send-information-type-matches-to-azure-information-protection-analytics) in a label policy.       |
|**Classic client**      |   Select a checkbox as part of the [configuration](#configure-a-log-analytics-workspace-for-the-reports) for Azure Information Protection analytics. The checkbox is named **Enable deeper analytics into your sensitive data**. <br><br> If you want most users who are using this client to send content matches but a subset of users cannot send content matches, select the checkbox and then configure an [advanced client setting](./rms-client/client-admin-guide-customizations.md#disable-sending-information-type-matches-for-a-subset-of-users) in a scoped policy for the subset of users.     |
|     |         |


## Prerequisites
To view the Azure Information Protection reports and create your own, make sure that the following requirements are in place.

|Requirement  |Details  |
|---------|---------|
|**An Azure subscription**     |   Your Azure subscription must include Log Analytics on the same tenant as Azure Information Protection. <br><br> For more information, see the [Azure Monitor pricing](https://azure.microsoft.com/pricing/details/log-analytics) page. <br><br>If you don't have an Azure subscription or you don't currently use Azure Log Analytics, the pricing page includes a link for a free trial.   |
| **Audit logging URL network connectivity** | AIP must be able to access the following URLs in order to support AIP audit logs:<br>- `https://*.events.data.microsoft.com` <br>- `https://*.aria.microsoft.com` (Android device data only)
|**Azure Information Protection client**    |For reporting from the client. <br><br>If you don't already have a client installed, you can download and install the unified labeling client from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=53018).      <br><br>**Note**: Both the unified labeling client and the classic client are supported. To deploy the AIP classic client, open a support ticket to get download access.     |
|**Azure Information Protection on-premises scanner**    | For reporting from on-premises data stores. <br><br>      For more information, see [Deploying the Azure Information Protection scanner to automatically classify and protect files](deploy-aip-scanner.md).   |
|**Microsoft Defender for Cloud Apps**     | For reporting from cloud-based data stores. <br><br>For more information, see [Azure Information Protection integration](/cloud-app-security/azip-integration) in the MCAS documentation.        |
|     |         |


### Permissions required for Azure Information Protection analytics

Specific to Azure Information Protection analytics, after you have configured your Azure Log Analytics workspace, you can use the Azure AD administrator role of Security Reader as an alternative to the other Azure AD roles that support managing Azure Information Protection in the Azure portal. This additional role is supported only if your tenant isn't on the [unified labeling platform](faqs.md#how-can-i-determine-if-my-tenant-is-on-the-unified-labeling-platform).

Because Azure Information Protection analytics uses Azure Monitoring, role-based access control (RBAC) for Azure also controls access to your workspace. You therefore need an Azure role as well as an Azure AD administrator role to manage Azure Information Protection analytics. If you're new to Azure roles, you might find it useful to read [Differences between Azure RBAC roles and Azure AD administrator roles](/azure/role-based-access-control/rbac-and-directory-admin-roles#differences-between-azure-rbac-roles-and-azure-ad-administrator-roles).

For more information, see:

- [Required Azure AD administrator roles](#required-azure-ad-administrator-roles)
- [Required Azure Log Analytics roles](#required-azure-log-analytics-roles)
- [Minimum roles to view the reports](#minimum-roles-to-view-the-reports)

#### Required Azure AD administrator roles

You must have one of the following [Azure AD administrator roles](/azure/active-directory/active-directory-assign-admin-roles-azure-portal) to access the Azure Information Protection analytics pane:

- To create your Log Analytics workspace or to create custom queries:
    
    - **Azure Information Protection administrator**
    - **Security administrator**
    - **Compliance administrator**
    - **Compliance data administrator**
    - **Global administrator**
    
- After the workspace has been created, you can then use the following roles with fewer permissions to view the data collected:
    
    - **Security reader**
    - **Global reader**

#### Required Azure Log Analytics roles

You must have one of the following [Azure Log Analytics roles](/azure/azure-monitor/platform/manage-access#manage-access-using-azure-permissions) or standard [Azure roles](/azure/role-based-access-control/rbac-and-directory-admin-roles#azure-rbac-roles) to access your Azure Log Analytics workspace:
    
- To create the workspace or to create custom queries, one of the following:
    
    - **Log Analytics Contributor**
    - **Contributor**
    - **Owner**
    
- After the workspace has been created, you can then use one of the following roles with fewer permissions to view the data collected:
    
    - **Log Analytics Reader**
    - **Reader**

#### Minimum roles to view the reports

After you have configured your workspace for Azure Information Protection analytics, the minimum roles needed to view the Azure Information Protection analytics reports are both of the following:

- Azure AD administrator role: **Security reader**
- Azure role: **Log Analytics Reader**

However, a typical role assignment for many organizations is the Azure AD role of **Security reader** and the Azure role of **Reader**.

### Storage requirements and data retention

The amount of data collected and stored in your Azure Information Protection workspace will vary significantly for each tenant, depending on factors such as how many Azure Information Protection clients and other supported endpoints you have, whether you're collecting endpoint discovery data, you've deployed scanners, the number of protected documents that are accessed, and so on.

However, as a starting point, you might find the following estimates useful:

- For audit data generated by Azure Information Protection clients only: 2 GB per 10,000 active users per month.

- For audit data generated by Azure Information Protection clients, and scanners: 20 GB per 10,000 active users per month.

If you use mandatory labeling or you've configured a default label for most users, your rates are likely to be significantly higher.

Azure Monitor Logs has a **Usage and estimated costs** feature to help you estimate and review the amount of data stored, and you can also control the data retention period for your Log Analytics workspace. For more information, see [Manage usage and costs with Azure Monitor Logs](/azure/azure-monitor/platform/manage-cost-storage).

## Configure a Log Analytics workspace for the reports

1. If you haven't already done so, open a new browser window and [sign in to the Azure portal](https://portal.azure.com) with an account that has the [permissions required for Azure Information Protection analytics](#permissions-required-for-azure-information-protection-analytics). Then navigate to the **Azure Information Protection** pane. 
    
    For example, in the search box for resources, services, and docs: Start typing **Information** and select **Azure Information Protection**.
    
1. Locate the **Manage** menu options, and select **Configure analytics (Preview)**.

1. On the **Azure Information Protection log analytics** pane, you see a list of any Log Analytics workspaces that are owned by your tenant. Do one of the following:
    
    - **To create a new Log Analytics workspace**: Select **Create new workspace**, and on the **Log analytics workspace** pane, supply the requested information.
    
    - **To use an existing Log Analytics workspace**: Select the workspace from the list.
    
    If you need help with creating the Log Analytics workspace, see [Create a Log Analytics workspace in the Azure portal](/azure/log-analytics/log-analytics-quick-create-workspace).

1. **AIP classic client only**: Select the checkbox **Enable deeper analytics into your sensitive data** if you want to store the actual data that's identified as being a sensitive information type. 

    For more information about this setting, see the [Content matches for deeper analysis](#content-matches-for-deeper-analysis) section on this page.

1. Select **OK**.

You're now ready to view the reports.

## View the AIP analytics reports

From the Azure Information Protection pane, locate the **Dashboards** menu options, and select one of the following options:

|Report  |Description  |
|---------|---------|
|**Usage report (Preview)**     |  Use this report to see how your labels are being used.       |
|**Activity logs (Preview)**     |  Use this report to see labeling actions from users, and on devices and file paths. In addition, for protected documents, you can see access attempts (successful or denied) for users both inside and outside your organization, even if they don't have the Azure Information Protection client installed. <br><br>  This report has a **Columns** option that lets you display more activity information than the default display. You can also see more details about a file by selecting it to display **Activity Details**.     |
|**Data discovery (Preview)**     |    Use this report to see information about labeled files found by scanners and supported endpoints.  <br><br>**Tip**: From the information collected, you might find users accessing files that contain sensitive information from location that you didn't know about or aren't currently scanning: <br><br>- If the locations are on-premises, consider adding the locations as additional data repositories for the Azure Information Protection scanner. <br>  - If the locations are in the cloud, consider using Microsoft Defender for Cloud Apps to manage them.    |
|**Recommendations (Preview)**     | Use this report to identify files that have sensitive information and mitigate your risk by following the recommendations.  <br><br> When you select an item, the **View data** option displays the audit activities that triggered the recommendation.     |
|     |         |


## Modify the AIP analytics reports and create custom queries

Select the query icon in the dashboard to open a **Log Search** pane: 

![Log Analytics icon to customize Azure Information Protection reports](./media/log-analytics-icon.png)


The logged data for Azure Information Protection is stored in the following table: **InformationProtectionLogs_CL**

When you create your own queries, use the friendly schema names that have been implemented as **InformationProtectionEvents** functions. These functions are derived from the attributes that are supported for custom queries (some attributes are for internal use only) and their names will not change over time, even if the underlying attributes change for improvements and new functionality.

### Friendly schema reference for event functions

Use the following table to identify the friendly name of event functions that you can use for custom queries with Azure Information Protection analytics.

|Column name|Description|
|-----------|-----------|
|**Time**|Event time: UTC in format YYYY-MM-DDTHH:MM:SS|
|**User**|User: Format UPN or DOMAIN\USER|
|**ItemPath**|Full item path or email subject|
|**ItemName**|File name or email subject |
|**Method**|Label assigned method: Manual, Automatic, Recommended, Default, or Mandatory|
|**Activity**|Audit activity: DowngradeLabel, UpgradeLabel, RemoveLabel, NewLabel, Discover, Access, RemoveCustomProtection, ChangeCustomProtection, NewCustomProtection, or FileRemoved |
|**ResultStatus**|Result status of the action:<br /><br /> Succeeded or Failed (reported by AIP scanner only)|
|**ErrorMessage_s**|Includes Error message details if ResultStatus=Failed. Reported by AIP scanner only|
|**LabelName**|Label name (not localized)|
|**LabelNameBefore** |Label name before change (not localized) |
|**ProtectionType**|Protection type [JSON] <br />{ <br />"Type": ["Template", "Custom", "DoNotForward"], <br />  "TemplateID": "GUID" <br /> } <br />|
|**ProtectionBefore**|Protection type before change [JSON] |
|**MachineName** |FQDN when available; otherwise host name|
|**Platform**|Device platform (Win, OSX, Android, iOS) |
|**ApplicationName**|Application friendly name|
|**AIPVersion**|Version of the Azure Information Protection client that performed the audit action |
|**TenantId**|Azure AD tenant ID |
|**AzureApplicationId**|Azure AD registered application ID (GUID)|
|**ProcessName**|Process that hosts MIP SDK|
|**LabelId**|Label GUID or null|
|**IsProtected**|Whether protected: Yes/No |
|**ProtectionOwner** |Rights Management owner in UPN format|
|**LabelIdBefore**|Label GUID or null before change|
|**InformationTypesAbove55**|JSON array of [SensitiveInformation](/microsoft-365/compliance/what-the-sensitive-information-types-look-for) found in data with confidence level 55 or above |
|**InformationTypesAbove65**|JSON array of [SensitiveInformation](/microsoft-365/compliance/what-the-sensitive-information-types-look-for) found in data with confidence level 65 or above |
|**InformationTypesAbove75**|JSON array of [SensitiveInformation](/microsoft-365/compliance/what-the-sensitive-information-types-look-for) found in data with confidence level 75 or above |
|**InformationTypesAbove85**|JSON array of [SensitiveInformation](/microsoft-365/compliance/what-the-sensitive-information-types-look-for) found in data with confidence level 85 or above |
|**InformationTypesAbove95**|JSON array of [SensitiveInformation](/microsoft-365/compliance/what-the-sensitive-information-types-look-for) found in data with confidence level 95 or above|
|**DiscoveredInformationTypes** |JSON array of [SensitiveInformation](/microsoft-365/compliance/what-the-sensitive-information-types-look-for) found in data and their matched content (if enabled) where an empty array means no information types found, and null means no information available |
|**ProtectedBefore**|Whether the content was protected before change: Yes/No |
|**ProtectionOwnerBefore**|Rights Management owner before change |
|**UserJustification**|Justification when downgrading or removing label|
|**LastModifiedBy**|User in UPN format who last modified the file. Available for Office and SharePoint only|
|**LastModifiedDate**|UTC in format YYYY-MM-DDTHH:MM:SS: Available for Office and SharePoint only |
| | |
#### Examples using InformationProtectionEvents

Use the following examples to see how you might use the friendly schema to create custom queries.

##### Example 1: Return all users who sent audit data in the last 31 days 

```
InformationProtectionEvents 
| where Time > ago(31d) 
| distinct User 
```

 
##### Example 2: Return the number of labels that were downgraded per day in the last 31 days 


```
InformationProtectionEvents 
| where Time > ago(31d) 
| where Activity == "DowngradeLabel"  
| summarize Label_Downgrades_per_Day = count(Activity) by bin(Time, 1d) 
 
```
 
##### Example 3: Return the number of labels that were downgraded from Confidential by user, in the last 31 days 

```

InformationProtectionEvents 
| where Time > ago(31d) 
| where Activity == "DowngradeLabel"  
| where LabelNameBefore contains "Confidential" and LabelName !contains "Confidential"  
| summarize Label_Downgrades_by_User = count(Activity) by User | sort by Label_Downgrades_by_User desc 

```

In this example, a downgraded label is counted only if the label name before the action contained the name **Confidential** and the label name after the action didn't contain the name of **Confidential**. 


## Next steps

After reviewing the information in the reports, if you are using the Azure Information Protection client, you might decide to make changes to your labeling policy.

- **Unified labeling client**: Make changes to your labeling policy in the Microsoft 365 compliance center. For more information, see the [Microsoft 365 documentation](/microsoft-365/compliance/sensitivity-labels).

- **Classic client**: Make changes to your policy in the Azure portal. For more information, see [Configuring the Azure Information Protection policy](configure-policy.md).

AIP audit logs are also sent to the Microsoft 365 Activity Explorer, where they may be displayed with different names. For more information, see:

- [Get started with activity explorer](/microsoft-365/compliance/data-classification-activity-explorer)
- [Labeling activity reference](/microsoft-365/compliance/data-classification-activity-explorer-available-events), including mapping between names shown in the AIP activity logs and names shown in Activity Explorer
