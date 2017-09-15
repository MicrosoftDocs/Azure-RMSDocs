---
# required metadata

title: Deploy the Azure Information Protection scanner
description: Instructions to install, configure, and run the Azure Information Protection scanner to discover, classify, and protect files on data stores.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 10/18/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 20d29079-2fc2-4376-b5dc-380597f65e8a

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: demizets
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Deploying the Azure Information Protection scanner to automatically classify and protect files

>*Applies to: Azure Information Protection, Windows Server 2016, Windows Server 2012 R2*

> [!NOTE]
> This feature is currently in preview and subject to change.

Use this information to learn about the Azure Information Protection scanner, and then how to successfully install, configure, and run it. This scanner lets you discover, classify, and protect files on data stores that use the Common Internet File System (CIFS) protocol, and on SharePoint Server 2016 and SharePoint Server 2013. 

By using the conditions that you configure for automatic classification in the Azure Information Protection policy, files that this scanner discovers can then be labeled. Labels apply classification, and optionally, apply protection or remove protection. 

## Overview of the Microsoft Rights Management connector






## Prerequisites for the Azure Information Protection scanner
Before you install the Azure Information Protection scanner, make sure that the following requirements are in place.

|Requirement|More information|
|---------------|--------------------|
|Windows Server 2016 or Windows Server 2012 R2:<br /><br />- A 64-bit physical or virtual computer running one of the following operating systems:  Windows Server 2016, Windows Server 2012 R2,  Windows Server 2012, or Windows Server 2008 R2.<br /><br />- At least 1 GB of RAM.<br /><br />- A minimum of 64 GB of disk space.<br /><br />- At least one network interface.<br /><br />- Access to the Internet via a firewall (or web proxy) that does not require authentication.<br /><br />- Must be in a forest or domain that trusts other forests in the organization that contain installations of Exchange or SharePoint servers that you want to use with the RMS connector.|For fault tolerance and high availability, you must install the RMS connector on a minimum of two computers.<br /><br />**Tip**: If you are using Outlook Web Access or mobile devices that use Exchange ActiveSync IRM and it is critical that you maintain access to emails and attachments that are protected by Azure RMS, we recommend that you deploy a load-balanced group of connector servers to ensure high availability.<br /><br />You do not need dedicated servers to run the connector but you must install it on a separate computer from the servers that will use the connector.<br /><br />**Important**: Do not install the connector on a computer that runs Exchange Server, SharePoint Server, or a file server that is configured for file classification infrastructure if you want to use the functionality from these services with Azure RMS. Also, do not install this connector on a domain controller.<br /><br />If you have server workloads that you want to use with the RMS connector but their servers are in domains that are not trusted by the domain from which you want to run the connector, you can install additional RMS connector servers in these untrusted domains or other domains in their forest. <br /><br />There is no limit to the number of connector servers that you can run for your organization and all connector servers installed in an organization share the same configuration. However, to configure the connector to authorize servers, you must be able to browse for the server or service accounts you want to authorize, which means that you must run the RMS administration tool in a forest from which you can browse those accounts.|



|The Rights Management (RMS) service is activated|[Activating Azure Rights Management](activate-service.md)|
|The Rights Management (RMS) service is activated|[Activating Azure Rights Management](activate-service.md)|
|Directory synchronization between your on-premises Active Directory forests and Azure Active Directory|After RMS is activated, Azure Active Directory must be configured to work with the users and groups in your Active Directory database.<br /><br />**Important**: You must do this directory synchronization step for the RMS connector to work, even for a test network. Although you can use Office 365 and Azure Active Directory by using accounts that you manually create in Azure Active Directory, this connector requires that the accounts in Azure Active Directory are synchronized with Active Directory Domain Services; manual password synchronization is not sufficient.<br /><br />For more information, see the following resources:<br /><br />[Integrating your on-premises identities with Azure Active Directory](/active-directory/active-directory-aadconnect)<br /><br />[Hybrid Identity directory integration tools comparison](/active-directory/active-directory-hybrid-identity-design-considerations-tools-comparison)|
|Optional but recommended:<br /><br />Enable federation between your on-premises Active Directory and Azure Active Directory|You can enable identity federation between your on-premises directory and Azure Active Directory. This configuration enables a more seamless user experience by using single sign-on to the RMS service. Without single sign on, users are prompted for their credentials before they can use rights-protected content.<br /><br />For instructions to configure federation by using Active Directory Federation Services (AD FS) between Active Directory Domain Services and Azure Active Directory, see the [Checklist: Use AD FS to implement and manage single sign-on](http://technet.microsoft.com/library/jj205462.aspx) in the Windows Server library.|
|A minimum of two member computers on which to install the RMS connector:<br /><br />- A 64-bit physical or virtual computer running one of the following operating systems:  Windows Server 2016, Windows Server 2012 R2,  Windows Server 2012, or Windows Server 2008 R2.<br /><br />- At least 1 GB of RAM.<br /><br />- A minimum of 64 GB of disk space.<br /><br />- At least one network interface.<br /><br />- Access to the Internet via a firewall (or web proxy) that does not require authentication.<br /><br />- Must be in a forest or domain that trusts other forests in the organization that contain installations of Exchange or SharePoint servers that you want to use with the RMS connector.|For fault tolerance and high availability, you must install the RMS connector on a minimum of two computers.<br /><br />**Tip**: If you are using Outlook Web Access or mobile devices that use Exchange ActiveSync IRM and it is critical that you maintain access to emails and attachments that are protected by Azure RMS, we recommend that you deploy a load-balanced group of connector servers to ensure high availability.<br /><br />You do not need dedicated servers to run the connector but you must install it on a separate computer from the servers that will use the connector.<br /><br />**Important**: Do not install the connector on a computer that runs Exchange Server, SharePoint Server, or a file server that is configured for file classification infrastructure if you want to use the functionality from these services with Azure RMS. Also, do not install this connector on a domain controller.<br /><br />If you have server workloads that you want to use with the RMS connector but their servers are in domains that are not trusted by the domain from which you want to run the connector, you can install additional RMS connector servers in these untrusted domains or other domains in their forest. <br /><br />There is no limit to the number of connector servers that you can run for your organization and all connector servers installed in an organization share the same configuration. However, to configure the connector to authorize servers, you must be able to browse for the server or service accounts you want to authorize, which means that you must run the RMS administration tool in a forest from which you can browse those accounts.|


## Steps to deploy the RMS connector

The connector does not automatically check all the [prerequisites](deploy-rms-connector.md#prerequisites-for-the-rms-connector) that it needs for a successful deployment, so make sure that these are in place before you start. The deployment requires you to install the connector, configure the connector, and then configure the servers that you want to use the connector. 

-   **Step 1:**  [Installing the RMS connector](install-configure-rms-connector.md#installing-the-rms-connector)

-   **Step 2:**  [Entering credentials](install-configure-rms-connector.md#entering-credentials)

-   **Step 3:**  [Authorizing servers to use the RMS connector](install-configure-rms-connector.md#authorizing-servers-to-use-the-rms-connector)

-   **Step 4:**  [Configuring load balancing and high availability](install-configure-rms-connector.md#configuring-load-balancing-and-high-availability)

-   Optional: [Configuring the RMS connector to use HTTPS](install-configure-rms-connector.md#configuring-the-rms-connector-to-use-https)

-   Optional: [Configuring the RMS connector for a web proxy server](install-configure-rms-connector.md#configuring-the-rms-connector-for-a-web-proxy-server)

-   Optional: [Installing the RMS connector administration tool on administrative computers](install-configure-rms-connector.md#installing-the-rms-connector-administration-tool-on-administrative-computers)

-   **Step 5:**  [Configuring servers to use the RMS connector](configure-servers-rms-connector.md)

    -   [Configuring an Exchange server to use the connector](configure-servers-rms-connector.md#configuring-an-exchange-server-to-use-the-connector)

    -   [Configuring a SharePoint server to use the connector](configure-servers-rms-connector.md#configuring-a-sharepoint-server-to-use-the-connector)

    -   [Configuring a file server for File Classification Infrastructure to use the connector](configure-servers-rms-connector.md#configuring-a-file-server-for-file-classification-infrastructure-to-use-the-connector)


## Next steps

Go to Step 1: [Installing and configuring the Azure Rights Management connector](install-configure-rms-connector.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]