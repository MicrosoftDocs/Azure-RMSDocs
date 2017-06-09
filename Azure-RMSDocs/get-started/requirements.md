---
# required metadata

title: Requirements for Azure Information Protection
description: Identify the prerequisites to deploy Azure Information Protection for your organization.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 06/09/2017
ms.topic: get-started-article
ms.prod:
ms.service: information-protection
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

# Requirements for Azure Information Protection

>*Applies to: Azure Information Protection, Office 365*

Before you deploy Azure Information Protection for your organization, make sure that you have the following prerequisites. 

|Requirement|More information|
|---------------|--------------------|
|A subscription for Azure Information Protection|For classification, labeling, and protection, you must have an [Azure Information Protection plan](https://www.microsoft.com/cloud-platform/azure-information-protection-pricing). For protection-only, you must have an [Office 365 plan that includes Rights Management](http://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf).<br /><br /> Review the [subscription information](https://www.microsoft.com/cloud-platform/azure-information-protection-pricing) and [feature list](https://www.microsoft.com/cloud-platform/azure-information-protection-features) from the Azure Information Protection site to make sure that your organization's subscription includes the Azure Information Protection features that you want to use.<br /><br />Note: If you have questions about subscriptions or licensing, do not post them on this page but instead, contact your Microsoft Account Manager or [Microsoft Support](information-support.md#to-contact-microsoft-support). |
|Azure Active Directory|Your organization must have an Azure Active Directory (Azure AD) to support user authentication and authorization for Azure Information Protection. In addition, if you want to use your user accounts from your on-premises directory (AD DS), you must also configure directory integration.<br /><br />Multi-factor authentication (MFA) is supported with Azure Information Protection when you have the required client software and correctly configured MFA supporting infrastructure.<br /><br />For more information about authentication requirements, see [Azure Active Directory requirements for Azure Information Protection](requirements-azure-ad.md). <br /><br />For more information about the requirements for user and group accounts for authorization, see [Preparing users and groups for Azure Information Protection](../plan-design/prepare.md).|
|Client devices|Users must have client devices (computer or mobile device) that run an operating system that supports Azure Information Protection.<br /><br />The following devices support the Azure Information Protection client, which lets users classify and label their Office documents and emails:<br /><br />- Windows 10 (x86, x64)<br /><br />- Windows 8.1 (x86, x64)<br /><br />- Windows 8 (x86, x64)<br /><br />- Windows 7 Service Pack 1 (x86, x64)<br /><br />- Windows Server 2016 <br /><br /> - Windows Server 2012 R2 and Windows Server 2012<br /><br />When this client protects the data by using the Azure Rights Management service, the data can be consumed by the same devices (Windows, Mac, iOS, Android), that support the Azure Rights Management service. <br /><br />For details about the devices that support the Azure Rights Management service, see [Client devices that support Azure Rights Management data protection](../get-started/requirements-client-devices.md).|
|Applications|The Azure Information Protection client can label and protect files and emails by using the Office applications **Word**, **Excel**, **PowerPoint**, and **Outlook** from any of the following Office editions:<br /><br /> - Office 365 ProPlus with 2016 apps or 2013 apps (Click-to-Run or Windows Installer-based installation)<br /><br />- Office Professional Plus 2016<br /><br />- Office Professional Plus 2013 with Service Pack 1<br /><br />- Office Professional Plus 2010 <br /><br />Other editions of Office cannot protect documents and emails. For these editions, Azure Information Protection is supported for classification only and labels that apply protection do not display on the Azure Information Protection bar. <br /><br />For information about which Office editions support the data protection service, see [Applications that support Azure Rights Management data protection](requirements-applications.md).|
|Infrastructure that supports connectivity to the Internet and dependent cloud services|If you have a firewall or similar intervening network devices that must be configured to allow specific connections, see the information for **Azure Rights Management (RMS)** in the [Office 365 portal and shared](https://support.office.com/en-us/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2?ui=en-US&rs=en-US&ad=US#bkmk_portal-identity) section from the following Office article: [Office 365 URLs and IP address ranges](https://support.office.com/en-US/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2).<br /><br />Use the instructions in this Office article to keep up-to-date with changes to this information, by subscribing to an RSS feed.<br /><br />In addition to the information in the Office article, specific to Azure Information Protection:<br /><br />- Allow HTTPS traffic on TCP 443 to **api.informationprotection.azure.com**.<br /><br />- Do not terminate the TLS client-to-service connection (for example, to do packet-level inspection). Doing so breaks the certificate pinning that RMS clients use with Microsoft-managed CAs to help secure their communication with Azure RMS.<br /><br />- If you use a web proxy that requires authentication, you must configure it to use integrated Windows authentication with the user's Active Directory logon credentials.|

If you want to use the Azure Rights Management service from Azure Information Protection with on-premises servers, the following products are supported:

-   Exchange Server

-   SharePoint Server

-   Windows Server file servers that support File Classification Infrastructure

For information about the additional requirements for this scenario, see [On-premises servers that support Azure Rights Management data protection](requirements-servers.md).

> [!IMPORTANT]
> The following deployment scenario is not supported unless you are using AD RMS protection with Azure Information Protection (the "hold your own key" or HYOK configuration):
> 
> -   Running AD RMS and Azure RMS side-by-side in the same organization, except during migration, as described in [Migrating from AD RMS to Azure Information Protection](../plan-design/migrate-from-ad-rms-to-azure-rms.md).
> 
> There is a supported migration path [from AD RMS to Azure Information Protection](http://technet.microsoft.com/library/Dn858447.aspx), and from [Azure Information Protection to AD RMS](/powershell/module/aadrm/Set-AadrmMigrationUrl). If you deploy Azure Information Protection and then decide that you no longer want to use this cloud service, see [Decommissioning and deactivating Azure Information Protection](../deploy-use/decommission-deactivate.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]


