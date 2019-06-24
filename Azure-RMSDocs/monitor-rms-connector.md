---
# required metadata

title: Monitor the Rights Management connector - AIP
description: Information to help you monitor the connector and your organization's use of the Azure Rights Management service from Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 06/18/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
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

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*

After you install and configure the RMS connector, you can use the following methods and information to help you monitor the connector and your organization’s use of the Azure Rights Management service from Azure Information Protection.

## Application event log entries

The RMS connector uses the Application event log to record entries for the **Microsoft RMS connector**. 

For example, Information events such as:

- ID 1000 confirm that the connector service has started

- ID 1002 when a server successfully connects to the RMS connector

- ID 1004 each time the list of authorized accounts (each account is listed) is downloaded to the connector 

If you have not configured the connector to use HTTPS, expect to see a Warning ID 2002 that a client is using a non-secure (HTTP) connection.

If the connector fails to connect to the Azure Rights Management service, you will most likely see Error 3001. For example, this connection failure might be as a result of a DNS problem or lack of Internet access for one or more servers running the RMS connector. 

> [!TIP]
> When RMS connector servers can't connect to Azure Rights Management service, web proxy configurations are often the reason.

As with all event log entries, drill in to the message for more details.

In addition to checking the event log when you first deploy the connector, check for warnings and errors on an ongoing basis. The connector might be working as expected initially, but other administrators might change dependent configurations. For example, another administrator changes the web proxy server configuration so that RMS connector servers can no longer access the Internet (Error 3001) or removes a computer account from a group that you specified as authorized to use the connector (Warning 2001).

### Event log IDs and descriptions

Use the following sections to identify the possible event IDs, descriptions, and any additional information.

-----

Information **1000**

**The Microsoft RMS connector web service has started.**

This event is logged when the RMS connector first attempts to start.

----

Information **1001**

**The Microsoft RMS connector web service has stopped.**

This event is logged when the RMS connector stops as a result of normal operation. For example, IIS is restarted or the computer is shut down. 

----

Information **1002**

**Access to the Microsoft RMS connector has been allowed for an authorized server.**

This event is logged when an account from an on-premises server first connects to the RMS connector, after the account has been authorized by the Azure RMS administrator in the RMS connector administrator tool. The SID, account name, and the name of the computer making the connection is contained in the event message.

----

Information **1003**

**The connection from the client listed below has switched from a non-secure (HTTP) connection to a secure (HTTPS) connection.**

This event is logged when an on-premises server changes its connection to the RMS connector from HTTP (less secure) to HTTPS (more secure). The SID, account name, and the name of the computer making the connection is contained in the event message.

----

Information **1004**

**The list of authorized accounts has been updated.**

This event is logged when the RMS connector has downloaded the latest list of accounts (existing accounts and any changes) that are authorized to use the RMS connector. This list is downloaded every 15 minutes, providing the RMS connector can communicate with the Azure Rights Management service.

----

Warning **2000**

**The user principal in the HTTP context is missing or invalid, please verify that the Microsoft RMS connector web site has Anonymous Authentication disabled in IIS and only Windows Authentication is enabled.**

This event is logged when the RMS connector can't uniquely identify the  account trying to connect to the RMS connector. This might be a result of anonymous authentication incorrectly configured for IIS or the account is from an untrusted forest.

----

Warning **2001**

**Unauthorized access attempt to Microsoft RMS connector.**

This event is logged when an account tries to connect to the RMS connector but fails. The most typical reason for this warning is because the account that makes the connection is not in the downloaded list of authorized accounts that the RMS connector downloads from the Azure Rights Management service. For example, the latest list is not yet downloaded (this event happens every 15 minutes) or the account is missing from the list. 

Another reason can be if you installed the RMS connector on the same server that is configured to use the connector. For example, you install the RMS connector on a server that runs Exchange Server and you authorize an Exchange account to use the connector. This configuration is not supported because the RMS connector cannot correctly identify the account when it attempts to connect.

The event message contains information about the account and computer trying to connect to the RMS connector:

- If the account trying to connect to the RMS connector is a valid account, use the RMS connector administrator tool to add the account to the list of authorized accounts. For more information about which accounts must be authorized, see [Add a server to the list of allowed servers](install-configure-rms-connector.md#add-a-server-to-the-list-of-allowed-servers). 

- If the account trying to connect to the RMS connector is from the same computer as the RMS connector server, install the connector on a separate server. For more information about the prerequisites for the connector, see [Prerequisites for the RMS connector]( deploy-rms-connector.md#prerequisites-for-the-rms-connector).

----

Warning **2002**

**The connection from the client listed below is using a non-secure (HTTP) connection.**

This event is logged when an on-premises server makes a successful connection to the RMS connector, but the connection uses HTTP (less secure) instead of HTTPS (more secure). One event is logged per account rather than per connection. This event is triggered again if the account successfully switched to using HTTPS but reverts to HTTP.

The event message contains the account SID, account name, and the name of the computer that makes the connection to the RMS connector.

For information about how to configure the RMS connector for HTTPS connections, see [Configuring the RMS connector to use HTTPS](install-configure-rms-connector.md#configuring-the-rms-connector-to-use-https).

----

Warning **2003**

**The list of authorizations is empty. The service will not be usable until the list of authorized users and groups for the connector is populated.**

This event is logged when the RMS connector does not have a list of authorized accounts, so no on-premises servers can connect to it. The RMS connector downloads the list every 15 minutes from Azure RMS. 

To specify the accounts, use the RMS connector administrator tool. For more information, see [Authorizing servers to use the RMS connector]( install-configure-rms-connector.md#authorizing-servers-to-use-the-rms-connector). 

----

Error **3000**

**An unhandled exception occurred in the Microsoft RMS connector.**

This event is logged each time the RMS connector encounters an unexpected error, with the details of the error in the event message.

One possible cause can be identified by the text **The request failed with an empty response** in the event message. If you see this text, it might be because you have a network device that is doing SSL inspection on the packets between the on-premises servers and the RMS connector server. The Azure Rights Management service does not support this configuration and it results in a failed communication and this event log message.

----

Error **3001**

**An exception occurred while downloading authorization information.**

This event is logged if the RMS connector cannot download the latest list of accounts that are authorized to use the RMS connector. Details of the error are in the event message.



----

## Performance counters

When you install the RMS connector, it automatically creates **Microsoft Rights Management connector** performance counters that you might find useful to help you monitor and improve the performance of using the Azure Rights Management service. 

For example, you regularly experience delays when documents or emails are protected. Or, you experience delays when protected documents or emails are opened. For these cases, the performance counters can help you determine whether the delays are due to processing time on the connector, processing time from the Azure Rights Management service, or network delays. 

To help you identify where the delay is occurring, look for counters that include average counts for **Connector Processing Time**, **Service Response Time**, and **Connector Response Time**. For example: **Licensing Successful Batched Request Average Connector Response Time**.

If you have recently added new server accounts to use the connector, a good counter to check is **Time since last authorization policy update** to confirm that the connector has downloaded the list since you updated it, or whether you need to wait a little longer (up to 15 minutes).

## Logging

Usage logging helps you identify when emails and documents are protected and consumed. When the RMS connector is used to protect and consume content, the user ID field in the logs contains the service principal name of **Aadrm_S-1-7-0**. This name is automatically created for the RMS connector.

For more information about usage logging, see [Logging and analyzing the protection usage from Azure Information Protection](log-analyze-usage.md).

If you need more detailed logging for diagnosis purposes, you can use [Debugview](https://go.microsoft.com/fwlink/?LinkID=309277) from Windows Sysinternals. Enable tracing for the RMS connector by modifying the web.config file for the Default site in IIS:

1. Locate the web.config file from **%programfiles%\Microsoft Rights Management connector\Web Service**.

2. Locate the following line:

    	<trace enabled="false" requestLimit="10" pageOutput="false" traceMode="SortByTime" localOnly="true"/>

3. Replace that line with the following text:

    	<trace enabled="true" requestLimit="10" pageOutput="false" traceMode="SortByTime" localOnly="true"/>

4.  Stop and start IIS to activate tracing. 

5.  When you have captured the traces that you need, revert the line in step 3, and stop and start IIS again.

