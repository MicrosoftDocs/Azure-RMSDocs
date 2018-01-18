---
# required metadata

title: Requirements for Azure Information Protection
description: Identify the prerequisites to deploy Azure Information Protection for your organization.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 01/18/2018
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

## Subscription for Azure Information Protection

For classification, labeling, and protection, you must have an [Azure Information Protection plan](https://www.microsoft.com/cloud-platform/azure-information-protection-pricing). 

For protection-only, you must have an [Office 365 plan that includes Rights Management](http://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf).

To make sure that your organization's subscription includes the Azure Information Protection features that you want to use, review the [subscription information](https://www.microsoft.com/cloud-platform/azure-information-protection-pricing) and [feature list](https://www.microsoft.com/cloud-platform/azure-information-protection-features) from the Azure Information Protection site.

> [!NOTE]
> If you have questions about subscriptions or licensing, do not post them on this page but instead, contact your Microsoft Account Manager or [Microsoft Support](information-support.md#to-contact-microsoft-support).

## Azure Active Directory

Your organization must have an Azure Active Directory (Azure AD) to support user authentication and authorization for Azure Information Protection. In addition, if you want to use your user accounts from your on-premises directory (AD DS), you must also configure directory integration.

Multi-factor authentication (MFA) is supported with Azure Information Protection when you have the required client software and correctly configured MFA supporting infrastructure.

Conditional access is supported in preview for documents protected by Azure Information Protection. For more information, see the following FAQ: [I see Azure Information Protection is listed as an available cloud app for conditional access—how does this work?](faqs.md#i-see-azure-information-protection-is-listed-as-an-available-cloud-app-for-conditional-accesshow-does-this-work)

For more information about authentication requirements, see [Azure Active Directory requirements for Azure Information Protection](requirements-azure-ad.md). 

For more information about the requirements for user and group accounts for authorization, see [Preparing users and groups for Azure Information Protection](../plan-design/prepare.md).

## Client devices

Users must have client devices (computer or mobile device) that run an operating system that supports Azure Information Protection.

The following devices support the Azure Information Protection client, which lets users classify and label their documents and emails:

- Windows 10 (x86, x64)

- Windows 8.1 (x86, x64)

- Windows 8 (x86, x64)

- Windows 7 Service Pack 1 (x86, x64)

- Windows Server 2016 

- Windows Server 2012 R2 and Windows Server 2012

- Windows Server 2008 R2 

For the listed server versions, the Azure Information Protection client is supported for Remote Desktop Services. If you delete user profiles when you use the Azure Information Protection client with Remote Desktop Services, do not delete the **%Appdata%\Microsoft\Protect** folder.

When the Azure Information Protection client protects the data by using the Azure Rights Management service, the data can be consumed by the [same devices](requirements-client-devices.md) that support the Azure Rights Management service.

## Applications

The Azure Information Protection client can label and protect documents and emails by using the Office applications **Word**, **Excel**, **PowerPoint**, and **Outlook** from any of the following Office editions:

- Office 365 ProPlus with 2016 apps or 2013 apps (Click-to-Run or Windows Installer-based installation)

- Office Professional Plus 2016

- Office Professional Plus 2013 with Service Pack 1

- Office Professional Plus 2010 with Service Pack 2

Other editions of Office cannot protect documents and emails by using a Rights Management service. For these editions, Azure Information Protection is supported for classification only. Labels that apply protection do not display on the Azure Information Protection bar. 

For information about which Office editions support the data protection service, see [Applications that support Azure Rights Management data protection](requirements-applications.md).

## Firewalls and network infrastructure

If you have a firewall or similar intervening network devices that are configured to allow specific connections, see the information for **Azure Rights Management (RMS)** in the [Office 365 portal and shared](https://support.office.com/en-us/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2?ui=en-US&rs=en-US&ad=US#bkmk_portal-identity) section from the following Office article: [Office 365 URLs and IP address ranges](https://support.office.com/en-US/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2).

Use the instructions in this Office article to keep up-to-date with changes to this information, by subscribing to an RSS feed.

In addition to the information in the Office article, specific to Azure Information Protection:

- Allow HTTPS traffic on TCP 443 to **api.informationprotection.azure.com**.

- If you use a web proxy that requires authentication, you must configure it to use integrated Windows authentication with the user's Active Directory logon credentials.

- Do not terminate the TLS client-to-service connection (for example, to do packet-level inspection). Doing so breaks the certificate pinning that RMS clients use with Microsoft-managed CAs to help secure their communication with the Azure Rights Management service.
    
    Tip: Because of how Chrome displays secure connections in the address bar, you can use this browser to quickly check whether your client connection is terminated before it reaches the Azure Rights Management service. Enter the following URL into the browser address bar: `https://admin.na.aadrm.com/admin/admin.svc` Don't worry about what the browser window displays. Instead, click the padlock in the address bar to view the site information. The site information lets you see the issuing certification authority (CA). If the certificate is not issued by a Microsoft CA, it is very likely your client-to-service connection is being terminated. The following picture shows an example of a Microsoft issuing CA. If you see an internal CA issued the certificate, this configuration is not compatible with Azure Information Protection.
    
    ![Checking the issued certificate for Azure Information Protection connections](../media/certificate-checking.png)
    

### On-premises servers

If you want to use the Azure Rights Management service from Azure Information Protection with on-premises servers, the following products are supported:

- Exchange Server

- SharePoint Server

- Windows Server file servers that support File Classification Infrastructure

For information about the additional requirements for this scenario, see [On-premises servers that support Azure Rights Management data protection](requirements-servers.md).

### Coexistence of AD RMS with Azure RMS

The following deployment scenario is not supported unless you are using AD RMS protection with Azure Information Protection (the "hold your own key" or HYOK configuration):

- Running AD RMS and Azure RMS side by side in the same organization, except during migration, as described in [Migrating from AD RMS to Azure Information Protection](../plan-design/migrate-from-ad-rms-to-azure-rms.md).

There is a supported migration path [from AD RMS to Azure Information Protection](http://technet.microsoft.com/library/Dn858447.aspx), and from [Azure Information Protection to AD RMS](/powershell/module/aadrm/Set-AadrmMigrationUrl). If you deploy Azure Information Protection and then decide that you no longer want to use this cloud service, see [Decommissioning and deactivating Azure Information Protection](../deploy-use/decommission-deactivate.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]


