---
# required metadata

title: Requirements for Azure Rights Management | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: dc78321d-d759-4653-8818-80da74b6cdeb

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Requirements for Azure Rights Management
To deploy Microsoft Azure Rights Management (Azure RMS) in your organization, make sure that you have the following prerequisites. You can then use the [Azure Rights Management Deployment Roadmap](azure-rights-management-deployment-roadmap.md) to deploy Rights Management for your organization.

|Requirement|More information|
|---------------|--------------------|
|A cloud subscription for RMS|Your organization must have a cloud subscription that supports RMS.<br /><br />For licensing information, see [Cloud subscriptions that support Azure RMS](rms-requirements-cloud-subscriptions.md).|
|Azure AD directory|Your organization must have an Azure AD directory to support user authentication for RMS. In addition, if you want to use your user accounts from your on-premises directory (AD DS), you must also configure directory integration.<br /><br />Multi-factor authentication (MFA) is supported with Azure RMS when you have the required client software and correctly configured MFA supporting infrastructure.<br /><br />For more information, see [Azure AD directory](rms-requirements-aad-directory.md).|
|Client devices|Users must have a client devices (computer or mobile device) that run an operating system that supports RMS.<br /><br />For more information, see [Client devices that support Azure RMS](rms-requirements-client-devices.md).|
|Applications|Users must run applications that support RMS.<br /><br />For more information, see [Applications that support Azure RMS](rms-requirements-applications.md).|
|Infrastructure that supports connectivity to the Internet and dependent cloud services|If you have a firewall or similar intervening network devices that must be configured to allow specific connections, see [Office 365 URLs and IP address ranges](https://support.office.com/en-US/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2).<br /><br />The list of URLs and IP addresses in the The list of URLs and IP addresses in the **Office 365 portal and shared** and **Office 365 authentication and identity** sections apply to the Office 365 portal, Azure Active Directory resources, and Azure Rights Management. Use the instructions in this article to keep up-to-date with changes to this information, by subscribing to an RSS feed.<br /><br />In addition to the information in the Office article, specific to Azure RMS:<br /><br />Do not terminate the TLS client-to-service connection (for example, to do packet-level inspection). Doing so breaks the certificate pinning that RMS clients use with Microsoft-managed CAs to help secure their communication with Azure RMS.<br /><br />If you use a web proxy that requires authentication, you must configure it to use integrated Windows authentication with the user’s Active Directory logon credentials.|

If you want to use Azure RMS with on-premises servers, the following products are supported:

-   Exchange Server

-   SharePoint Server

-   Windows Server file servers that support File Classification Infrastructure

For information about the additional Azure RMS requirements for this scenario, see [On-premises servers that support Azure RMS](rms-requirements-onpremises-servers.md).

> [!IMPORTANT]
> The following deployment scenario is not supported:
> 
> -   Running AD RMS and Azure RMS side-by-side in the same organization, except during migration, as described in [Migrating from AD RMS to Azure Rights Management](migrating-from-ad-rms-to-azure-rights-management.md).
> 
> There is a supported migration path [from AD RMS to Azure RMS](http://technet.microsoft.com/library/Dn858447.aspx), and from [Azure RMS to AD RMS](http://msdn.microsoft.com/library/azure/dn629429.aspx). If you deploy Azure RMS and then decide that you no longer want to use this cloud service, see [Decommissioning and deactivating Azure Rights Management](decommissioning-and-deactivating-azure-rights-management.md).


## See Also
[Getting Started with Azure Rights Management](getting-started-with-azure-rights-management.md)

