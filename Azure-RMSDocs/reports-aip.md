---
# required metadata

title: Analytics and central reporting for Azure Information Protection (AIP)
description: Learn how to use Azure Information Protection (AIP) central reporting to track label usage and to identify files that contain sensitive information.
author: aashishr
ms.author: aashishr
ms.date: 02/14/2022
manager: aashishr
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

# Analytics and central reporting for Azure Information Protection

> [!NOTE]
> **Are you looking for [Microsoft Information Protection](/microsoft-365/compliance/information-protection)?** The Azure Information Protection unified labeling client is [currently in maintenance mode](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/announcing-aip-unified-labeling-client-maintenance-mode-and/ba-p/3043613). We recommend enabling Microsoft Information Protection's built-in labeling for your Office 365 applications. [Learn more](/microsoft-365/compliance/sensitivity-labels#sensitivity-labels-and-azure-information-protection).
>

This article describes how to use the [auditing solution from Microsoft Purview](/microsoft-365/compliance/auditing-solutions-overview) to view audit events generated from the Azure Information Protection Unified Labeling client. Audit events emitted to the [Microsoft 365 unified audit log](/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance) for central reporting are viewable in the [Activity explorer](https://compliance.microsoft.com/dataclassification?viewid=activitiesexplorer), which can help you track the adoption of your labels that classify and protect your organization's data.

Audit enables you to do perform the following steps:

- Aggregate data from your Azure Information Protection clients, Azure Information Protection scanners and Microsoft Defender for Cloud Apps.
- View audit events in the [Microsoft 365 unified audit log](/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance) and Office 365 activity log for your organization.
- Query, view and detect audit events in [Activity explorer](https://compliance.microsoft.com/dataclassification?viewid=activitiesexplorer) with a graphical interface in the compliance portal.

### Audit events from the Microsoft 365 unified audit log
The AIP Unified Labeling client includes the Add-in for Office, the Scanner, the Viewer for Windows, the client PowerShell, and the Classify-and-Protect shell extension for Windows. All these components generate audit events that show up in the Office 365 activity logs and can be queried using the [Office 365 Management Activity API](/office/office-365-management-api/office-365-management-activity-api-reference).

Audit events enable an administrator to:
- Monitor labeled and protected documents and emails across your organization.
- Monitor user access to labeled documents and emails, and track document classification changes.


## Microsoft 365 unified audit log event schema

The five events (also called “AuditLogRecordType”) specific to AIP listed below, and more details about each can be found within the [API reference](/office/office-365-management-api/office-365-management-activity-api-schema#auditlogrecordtype).

| Value | Member name | Description |
| ------ | ------ | ------ |
| 93 | AipDiscover | Azure Information Protection (AIP) scanner events. |
| 94 | AipSensitivityLabelAction | AIP sensitivity label events. |
| 95 | AipProtectionAction | AIP protection events. |
| 96 | AipFileDeleted | AIP file deletion events. |
| 97 | AipHeartBeat | AIP heartbeat events. |

This information is accessible in the Microsoft 365 unified audit log for your organization and can be viewed in the Activity explorer. 

### Query Audit Events in Activity Explorer
![image](https://user-images.githubusercontent.com/25543918/190709059-fd1f51bb-db75-41d8-a131-f647c5a8d8e4.png)

The Activity explorer in the Microsoft Purview compliance portal is a graphical interface to view audit events emitted to the Microsoft 365 unified audit log. An administrator of the tenant can use built-in queries to determine whether the policies and controls implemented by your organization is effective. With up to 30 days of data available, an administrator can set filters and clearly see when and how sensitive data is handled within your organization.

To see AIP-specific activity, an administrator can begin with the following filters:

- Activity type:
    - Label applied
    - Label changed
    - Label removed
    - Label file read
- Application:
    - Microsoft Azure Information Protection Word add-in
    - Microsoft Azure Information Protection Excel add-in
    - Microsoft Azure Information Protection PowerPoint add-in
    - Microsoft Azure Information Protection Outlook add-in

An administrator might not see all the options in the filter, or may see more; the filter values depend on what activities are captured for your tenant. For more information about the Activity explorer, see:

- [Get started with activity explorer](/microsoft-365/compliance/data-classification-activity-explorer)
- [Labeling activity reference](/microsoft-365/compliance/data-classification-activity-explorer-available-events)

### Information collected and sent to Microsoft Purview from the AIP Unified Labeling client

To generate these reports, endpoints send the following types of information to the Microsoft 365 unified audit log:

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

#### Prevent the AIP clients from sending auditing data

To prevent the Azure Information Protection unified labeling client from sending auditing data, configure a [label policy advanced setting](rms-client/clientv2-admin-guide-customizations.md#prevent-audit-data-from-being-sent-to-aip-and-microsoft-365-analytics).

#### Content matches for deeper analysis

Azure Information Protection lets you collect and store the actual data that's identified as being a sensitive information type (predefined or custom). For example, this can include credit card numbers that are found, as well as social security numbers, passport numbers, and bank account numbers. The content matches are displayed when you select an entry from **Activity logs**, and view the **Activity Details**. 

By default, Azure Information Protection clients don't send content matches. To change this behavior so that content matches are sent, configure an [advanced setting](./rms-client/clientv2-admin-guide-customizations.md#send-information-type-matches-to-azure-information-protection-analytics) in a label policy.

## Prerequisites
Audit events are enabled by default for your organization. To view audit events in Microsoft Purview, review the [licensing requirements](/microsoft-365/compliance/auditing-solutions-overview#licensing-requirements) for basic and Audit (Premium) solutions.

## Next steps
After reviewing the information in the reports, you may want to learn more about how to configure Microsoft Purview's auditing solution for your organization.
- Learn how to export audit events from the Microsoft 365 unified audit log to an Azure log analytics workspace with [AIP Audit Export on GitHub](https://github.com/Azure-Samples/Azure-Information-Protection-Samples/tree/master/AIP-Audit-Export).
- Read the [Admin guide to auditing and reporting for the AIP Unified Labeling client](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/admin-guide-to-auditing-and-reporting-for-the-aip-unified/ba-p/3610727) for a deep dive into Microsoft Purview's auditing solution.
- Review the [protection usage logs documentation](/purview/information-protection/rights-management-usage) for file access and denied events generated from the Rights Management Service. These events are handled separately from events generated from the Azure Information Protection Unified Labeling client.
- Refer to the [Microsoft 365 documentation](/microsoft-365/compliance/sensitivity-labels) about sensitivity labels to learn how to make changes to your labeling policy in the compliance portal.
