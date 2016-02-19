---
title: Requirements for Azure Rights Management
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: dc78321d-d759-4653-8818-80da74b6cdeb
author: Cabailey
---
# Requirements for Azure Rights Management
To deploy Microsoft Azure Rights Management (Azure RMS) in your organization, make sure that you have the following prerequisites. You can then use the [Azure Rights Management Deployment Roadmap](azure-rights-management-deployment-roadmap.md) to deploy Rights Management for your organization.

|Requirement|More information|
|---------------|--------------------|
|A cloud subscription for RMS|Your organization must have a cloud subscription that supports RMS.<br /><br />For licensing information, see the [Cloud subscriptions that support Azure RMS](rms-requirements-cloud-subscriptions.md).|
|Azure AD directory|Your organization must have an Azure AD directory to support user authentication for RMS. In addition, if you want to use your user accounts from your on-premises directory (AD DS), you must also configure directory integration.<br /><br />Multi-factor authentication (MFA) is supported with Azure RMS when you have the required client software and correctly configured     MFA supporting infrastructure.<br /><br />For more information, see [Azure AD directory](rms-requirements-aad-directory.md).|
|Client devices|Users must have a client devices (computer or mobile device) that run an operating system that supports RMS.<br /><br />For more information, see the [Client devices that support Azure RMS](rms-requirements-client-devices.md).|
|Applications|Users must run applications that support RMS.<br /><br />For more information, see the [Applications that support Azure RMS](rms-requirements-applications.md) section in this topic.|
|Infrastructure that supports connectivity to the Internet and dependent cloud services|If you have a firewall or similar intervening network devices that must be configured to allow specific connections, see [Office 365 URLs and IP address ranges](https://support.office.com/en-US/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2).<br /><br />The list of URLs and IP addresses in the **Office 365 portal and identity** section apply to the Office 365 portal, Azure Active Directory resources, and Azure Rights Management. Use the instructions in this article to keep up-to-date with changes to this information, by subscribing to an RSS feed.<br /><br />In addition to the information in the Office article, specific to Azure RMS:<br /><br />Do not terminate the TLS client-to-service connection (for example, to do packet-level inspection). Doing so breaks the certificate pinning that RMS clients use with Microsoft-managed CAs to help secure their communication with Azure RMS.<br /><br />If you use a web proxy that requires authentication, you must configure it to use integrated Windows authentication with the user’s Active Directory logon credentials.|

If you want to use Azure RMS with on-premises servers, the following products are supported:

-   Exchange Server

-   SharePoint Server

-   Windows Server file servers that support File Classification Infrastructure

For information about the additional Azure RMS requirements for this scenario, see the [On-premises servers that support Azure RMS](requirements-for-azure-rights-management.md#BKMK_SupportedServers) section in this topic.

> [!IMPORTANT]
> The following deployment scenario is not supported:
> 
> -   Running AD RMS and Azure RMS side-by-side in the same organization, except during migration, as described in [Migrating from AD RMS to Azure Rights Management](migrating-from-ad-rms-to-azure-rights-management.md).
> 
> There is a supported migration path [from AD RMS to Azure RMS](migrating-from-ad-rms-to-azure-rights-management.md), and from [Azure RMS to AD RMS](http://msdn.microsoft.com/library/azure/dn629429.aspx). If you deploy Azure RMS and then decide that you no longer want to use this cloud service, see [Decommissioning and Deactivating Azure Rights Management](decommissioning-and-deactivating-azure-rights-management.md).



## On-premises servers that support Azure RMS

The following on-premises server products are supported with Azure RMS when you use the Azure RMS connector, which acts as a communications interface (a relay) between the on-premises servers and Azure RMS. In addition, this configuration requires that you configure directory synchronization between your Active Directory forests and Azure Active Directory.

-   **Exchange Server**:

    -   Exchange Server 2016

    -   Exchange Server 2013

    -   Exchange Server 2010

-   **Office SharePoint Server**:

    -   Office SharePoint Server 2013

    -   Office SharePoint Server 2010

-   **File servers that run Windows Server and use File Classification Infrastructure (FCI)**:

    -   Windows Server 2012 R2

    -   Windows Server 2012

    > [!NOTE]
    > Because file servers that run Windows Server 2008 R2 do not have a built-in file management task action to apply RMS protection, you cannot use the RMS connector for this scenario. However, you can use File Classification Infrastructure and Azure RMS on these operating systems if you configure a custom file management task to run an executable or script that can protect files by using Azure RMS. For example, a Windows PowerShell script that uses the [RMS Protection cmdlets](https://msdn.microsoft.com/library/azure/mt433195.aspx).
    > 
    > You can also use these cmdlets with servers running later versions of Windows Server, with the benefit that these cmdlets can protect all file types. The RMS connector protects Office files only. For how-to instructions, see [RMS Protection with Windows Server File Classification Infrastructure &#40;FCI&#41;](rms-protection-with-windows-server-file-classification-infrastructure-fci.md).

The RMS connector is supported on Windows Server 2012 R2, Windows Server 2012, and Windows Server 2008 R2.

For more information about how to configure the RMS connector for these on-premises servers, see [Deploying the Azure Rights Management Connector](deploying-the-azure-rights-management-connector.md).

## See Also
[Getting Started with Azure Rights Management](getting-started-with-azure-rights-management.md)

