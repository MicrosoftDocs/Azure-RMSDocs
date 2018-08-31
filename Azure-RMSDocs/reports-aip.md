---
# required metadata

title: Reporting for Azure Information Protection
description: How to use reports to see how your Azure Information Protection labels are being used and what sensitive information you have
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 09/00/2018
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: b2da2cdc-74fd-4bfb-b3c2-2a3a59a6bf2e

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: lilukov
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Reporting for Azure Information Protection

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*

> [!NOTE]
> This feature is currently in preview and subject to change.

Use the Azure Information Protection dashboards in the Azure portal to see how your labeling deployment is progressing. Additionally, gain insights into which files contains sensitive information that might need to be protected.

The Azure Information Protection client records usage information to the local Windows event log, and the Azure Information Protection scanner writes its reporting information to locally stored .csv files. This information is periodically sent to Azure Information Protection so that authorized administrators for your tenant can view an aggregation of this information for your organization. For example, you will then be able to see:

- From the **Usage report**, where you can select a time period:
    
    - Which labels are being applied
    
    - How many documents and emails are being labeled
    
    - How many documents and emails are being protected
    
    - How many users and how many computers are labeling documents and emails
    
    - How often protection is removed
    
    - How often users are using custom permissions and user-defined permissions
    
    - Which applications are being used for labeling


- From the **Discovery and risk** report:

    - Which data repositories are configured to be scanned
    
    - The number of labeled files and protected files
    
    - The number of sensitive information types found
    
The reports use [Azure Log Analytics](/azure/log-analytics/log-analytics-overview) to display the data. If you are familiar with the query language, you can modify the queries, and even create new reports. You might find the following tutorial helpful to understand the query language: [Getting Started with the Analytics Portal](https://docs.loganalytics.io/docs/Learn/Getting-Started/Getting-started-with-the-Analytics-portal). 

### Information collected and sent to Microsoft

To generate these reports, the Azure Information Protection client and scanner sends the following types of information to Microsoft:

- The label action. For example, set a label, change a label, add or remove protection, automatic and recommended labels.

- Your organization's tenant ID.

- The user ID (email address or UPN).

- The file path and file name of documents that are labeled.

- The information type (not the content itself) that was matched for recommended or automatic classification.   

- The Azure Information Protection client version.

- The client operating system version.


## Prerequisites for the Azure Information Protection reports
To view the Azure Information Protection reports, make sure that the following requirements are in place.

|Requirement|More information|
|---------------|--------------------|
|The current preview version of the Azure Information Protection client.|If you haven't already installed the current preview version of the client, you can download and install it from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=53018).|
|For the **Discovery and risk** report: <br /><br />- You have deployed the Azure Information Protection scanner|For installation instructions, see [Deploying the Azure Information Protection scanner to automatically classify and protect files](deploy-aip-scanner.md). <br /><br />If you are upgrading from a previous version of the scanner, see [Upgrading the Azure Information Protection scanner](./rms-client/client-admin-guide.md#upgrading-the-azure-information-protection-scanner).|


## How to view the reports

1. If you haven't already done so, open a new browser window and [sign in to the Azure portal](configure-policy.md#signing-in-to-the-azure-portal). Then navigate to the **Azure Information Protection** blade. 
    
    For example, on the hub menu, click **All services** and start typing **Information** in the Filter box. Select **Azure Information Protection**.    
    
2. Locate the **DASHBOARDS (PREVIEW)** menu options, and select one of the following options:

    - **Usage report**: Use this report to see how your labels are being used. 

    - **Discovery and risk**: Use this report to see information about files that the scanner found.

## How to modify the reports

Select the query icon in the dashboard to open a **Log Search** blade: 

![Log Analytics icon to customize Azure Information Protection reports](./media/log-analytics-icon.png)


## Next steps
After reviewing the information in the reports, you might decide to make changes to your Azure Information Protection policy. For instructions, see [Configuring the Azure Information Protection policy](configure-policy.md).