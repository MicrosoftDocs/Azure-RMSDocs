---
# required metadata

title: Deploying the Azure Rights Management connector | Azure RMS
description: Use this information to learn about the Azure Rights Management (RMS) connector and how you can use it to provide information protection with existing on-premises deployments that use Microsoft Exchange Server, Microsoft SharePoint Server, or file servers that run Windows Server and use the File Classification Infrastructure (FCI) capability of File Server Resource Manager.
author: cabailey
manager: mbaldwin
ms.date: 05/20/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 90e7e33f-9ecc-497b-89c5-09205ffc5066

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Deploying the Azure Rights Management connector

*Applies to: Azure Rights Management, Windows Server 2012, Windows Server 2012 R2*

Use this information to learn about the Azure Rights Management (RMS) connector and how you can use it to provide information protection with existing on-premises deployments that use Microsoft Exchange Server, Microsoft SharePoint Server, or file servers that run Windows Server and use the File Classification Infrastructure (FCI) capability of File Server Resource Manager.

> [!TIP]
> For a high-level example scenario with screenshots, see the [Automatically protecting files on file servers running Windows Server and File Classification Infrastructure](../understand-explore/what-admins-users-see.md#automatically-protecting-files-on-file-servers-running-windows-server-and-file-classification-infrastructure) section in the [Azure RMS in action](../understand-explore/what-admins-users-see.md) article.

## Overview of the Microsoft Rights Management connector
The Microsoft Rights Management (RMS) connector lets you quickly enable existing on-premises servers to use their Information Rights Management (IRM) functionality with the cloud-based Microsoft Rights Management service (Azure RMS). With this functionality, IT and users can easily protect documents and pictures both inside your organization and outside, without having to install additional infrastructure or establish trust relationships with other organizations. You can use this connector even if some of your users are connecting to online services, in a hybrid scenario. For example, some users' mailboxes use Exchange Online and some users' mailboxes use Exchange Server. After you install the RMS connector, all users can protect and consume emails and attachments by using Azure RMS, and information protection works seamlessly between the two deployment configurations.

The RMS connector is a small-footprint service that you install on-premises, on servers that run Windows Server 2012 R2, Windows Server 2012, or Windows Server 2008 R2. In addition to running the connector on physical computers, you can also run it on virtual machines, including Azure IaaS VMs. After you install and configure the connector, it acts as a communications interface (a relay) between the on-premises servers and the cloud service.

If you manage your own tenant key for Azure RMS (the bring you own key, or BYOK scenario), the RMS connector and the on-premises servers that use it do not access the hardware security module (HSM) that contains your tenant key. This is because all cryptographic operations that use the tenant key are performed in Azure RMS, and not on-premises.

![RMS connector architecture overview](../media/RMS_connector.png)

The RMS connector supports the following on-premises servers: Exchange Server, SharePoint Server, and file servers that run Windows Server and use File Classification Infrastructure to classify and apply policies to Office documents in a folder. If you want to protect all files types using File Classification, do not use the RMS connector, but instead, use the [RMS Protection cmdlets](https://msdn.microsoft.com/library/azure/mt433195.aspx).

> [!NOTE]
> For supported versions of these on-premises servers, see [On-premises servers that support Azure RMS](..\get-started\requirements-servers.md).

Use the following information to help you plan for, install, and configure the RMS connector. You must then do some post installation configuration so that your servers can use the connector.

-   [Prerequisites for the RMS connector](deploy-rms-connector.md#prerequisites-for-the-rms-connector)

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


## Prerequisites for the RMS connector
Before you install the RMS connector, make sure that the following requirements are in place.

|Requirement|More information|
|---------------|--------------------|
|The Rights Management (RMS) service is activated|[Activating Azure Rights Management](activate-service.md)|
|Directory synchronization between your on-premises Active Directory forests and Azure Active Directory|After RMS is activated, Azure Active Directory must be configured to work with the users and groups in your Active Directory database.<br /><br />**Important**: You must do this directory synchronization step for the RMS connector to work, even for a test network. Although you can use Office 365 and Azure Active Directory by using accounts that you manually create in Azure Active Directory, this connector requires that the accounts in Azure Active Directory are synchronized with Active Directory Domain Services; manual password synchronization is not sufficient.<br /><br />For more information, see the following resources:<br /><br />[Integrating your on-premises identities with Azure Active Directory](/active-directory/active-directory-aadconnect)<br /><br />[Hybrid Identity directory integration tools comparison](/active-directory/active-directory-hybrid-identity-design-considerations-tools-comparison)|
|Optional but recommended:<br /><br />Enable federation between your on-premises Active Directory and Azure Active Directory|You can enable identity federation between your on-premises directory and Azure Active Directory. This configuration enables a more seamless user experience by using single sign-on to the RMS service. Without single sign on, users are prompted for their credentials before they can use rights-protected content.<br /><br />For instructions to configure federation by using Active Directory Federation Services (AD FS) between Active Directory Domain Services and Azure Active Directory, see the [Checklist: Use AD FS to implement and manage single sign-on](http://technet.microsoft.com/library/jj205462.aspx) in the Windows Server library.|
|A minimum of two member computers on which to install the RMS connector:<br /><br />- A 64-bit physical or virtual computer running one of the following operating systems:  Windows Server 2012 R2,  Windows Server 2012, or Windows Server 2008 R2.<br /><br />- At least 1 GB of RAM.<br /><br />- A minimum of 64 GB of disk space.<br /><br />- At least one network interface.<br /><br />- Access to the Internet via a firewall (or web proxy) that does not require authentication.<br /><br />- Must be in a forest or domain that trusts other forests in the organization that contain installations of Exchange or SharePoint servers that you want to use with the RMS connector.|For fault tolerance and high availability, you must install the RMS connector on a minimum of two computers.<br /><br />**Tip**: If you are using Outlook Web Access or mobile devices that use Exchange ActiveSync IRM and it is critical that you maintain access to emails and attachments that are protected by Azure RMS, we recommend that you deploy a load-balanced group of connector servers to ensure high availability.<br /><br />You do not need dedicated servers to run the connector but you must install it on a separate computer from the servers that will use the connector.<br /><br />**Important**: Do not install the connector on a computer that runs Exchange Server, SharePoint Server, or a file server that is configured for file classification infrastructure if you want to use the functionality from these services with Azure RMS. Also, do not install this connector on a domain controller.|

## Next steps

Go to [Installing and configuring the Azure Rights Management connector](install-configure-rms-connector.md).