---
# required metadata

title: Monitor the Azure Rights Management connector | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 06/08/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 8a1b3e54-f788-4f84-b9d7-5d5079e50b4e

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Monitor the Azure Rights Management connector

*Applies to: Azure Rights Management, Windows Server 2012, Windows Server 2012 R2*

After you have installed and configured the RMS connector, you can use the following methods and information to help you monitor the connector and your organization’s use of Azure RMS.

## Application event log entries

The RMS connector uses the Application event log to record entries for the **Microsoft RMS connector**. 

For example, Information events such as ID 1000 confirm that the connector service has started, ID 1002 when a server successfully connects to the RMS connector, and ID 1004 each time the list of authorized accounts (each account is listed) is downloaded to the connector. 

If you have not configured the connector to use HTTPS, expect to see a Warning ID 2002 that a client is using a non-secure (HTTP) connection.

If the connector fails to connects to Azure RMS, you will most likely see Error 3001. For example, this might be as a result of a DNS problem or lack of Internet access for one or more servers running the RMS connector. 

> [!TIP]
> When RMS connector servers can't connect to Azure RMS, web proxy configurations are often the reason.

As with all event log entries, drill into the message for more details.

In addition to checking the event log when you first deploy the connector, check for warnings and errors on an ongoing basis. For example, the connector might be working as expected initially, but other administrators might change dependent configurations. For example, another administrator changes the web proxy server configuration so that RMS connector servers can no longer access the Internet (Error 3001) or removes a computer account from a group that you specified as authorized to use the connector (Warning 2001).

## Performance counters

When you install the RMS connector, it automatically creates **Microsoft Rights Management connector** performance counters that you might find useful to help you monitor the performance of using Azure RMS via the connector. 

For example, if you regularly experience delays when protecting documents or emails, or when opening protected documents or emails, the performance counters can help you determine whether the delay is due to processing time on the connector, processing time from Azure RMS, or network delays. To help you identify where the delay is occurring, look for counters that include average counts for **Connector Processing Time**, **Service Response Time**, and **Connector Response Time**. For example: **Licensing Successful Batched Request Average Connector Response Time**.

If you have recently added new server accounts to use the connector, a good counter to check is **Time since last authorization policy update** to confirm that the connector has downloaded the list since you updated it, or whether you need to wait a little longer (up to 15 minutes).

## RMS Analyzer

You can use the Rights Management Services Analyzer tool to help you monitor the health of the connector and identify any configuration issues.

If you haven't already downloaded this tool, you can do so from the [Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=46437) and then install it on any computer that has access to the Internet and that can connect to the RMS connector. Run the tool, and on the **Welcome** page, select the **Azure RMS connector** option.

For additional information and instructions, see the **Details** and **Install Instructions** on the download page.

## Logging

Usage logging helps you identify when emails and documents are protected and consumed. When this is done by using the RMS connector, the user ID field in the logs contains the service principal name that is automatically generated when you install the RMS connector.

For more information, see [Logging and analyzing Azure Rights Management usage](log-analyze-usage.md).

If you need more detailed logging for diagnosis purposes, you can use [Debugview](http://go.microsoft.com/fwlink/?LinkID=309277) from Windows Sysinternals and enable tracing for the RMS connector by modifying the web.config file for the Default site in IIS. To do this:

1. Locate the web.config file from **%programfiles%\Microsoft Rights Management connector\Web Service**.

2. Locate the following line:

    	<trace enabled="false" requestLimit="10" pageOutput="false" traceMode="SortByTime" localOnly="true"/>

3. Replace that line with the following:

    	<trace enabled="true" requestLimit="10" pageOutput="false" traceMode="SortByTime" localOnly="true"/>

4.  Stop and start IIS to activate tracing. 

5.  When you have captured the traces that you need, revert the line in step 3, and stop and start IIS again.

