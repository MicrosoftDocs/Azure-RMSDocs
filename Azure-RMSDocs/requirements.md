---
# required metadata

title: Requirements for Azure Information Protection - AIP
description: Identify the prerequisites required to deploy Azure Information Protection in your organization.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 05/25/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: dc78321d-d759-4653-8818-80da74b6cdeb

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: prereqs
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Azure Information Protection requirements

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

Before deploying Azure Information Protection, ensure that your system meets the following prerequisites:

- [Subscription for Azure Information Protection](#subscription-for-azure-information-protection)
- [Azure Active Directory](#azure-active-directory)
- [Client devices](#client-devices)
- [Applications](#applications)
- [Firewalls and network infrastructure](#firewalls-and-network-infrastructure)

## Subscription for Azure Information Protection

You must have one of the following, depending on the Azure Information Protection features you'll be using:

- **An [Azure Information Protection plan](https://azure.microsoft.com/pricing/details/information-protection/)**. Required for classification, labeling, and protection by using the Azure Information Protection scanner or client (classic, or unified labeling)

- **An [Office 365 plan that includes Azure Information Protection](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)**. Required for protection only.

To verify that your subscription includes the Azure Information Protection features you want to use, check the feature list at [Azure Information Protection pricing](https://azure.microsoft.com/pricing/details/information-protection).

If you have questions about licensing, read through the [frequently asked questions](https://azure.microsoft.com/pricing/details/information-protection#faq) for licensing.

> [!TIP]
> Looking to see if your Office 365 plan or Exchange Online standalone plan supports the [new capabilities from Office 365 Message Encryption](https://techcommunity.microsoft.com/t5/Security-Privacy-and-Compliance/Email-Encryption-and-Rights-Protection/ba-p/110801), to send protected emails to personal email addresses? For example, Gmail, Yahoo, and Microsoft. Check the following resources:
>
> - [Exchange Online Service Description](https://technet.microsoft.com/library/exchange-online-service-description.aspx)
>
> - [Office 365 Education](https://technet.microsoft.com/library/mt844095.aspx)
>
> - [Office 365 US Government](https://technet.microsoft.com/library/mt774581.aspx)

If you have questions about subscriptions or licensing, do not post them on this page. Instead, see if they are answered in the [frequently asked questions](https://azure.microsoft.com/pricing/details/information-protection#faq) for licensing. If your question is not answered there, contact your Microsoft Account Manager or [Microsoft Support](information-support.md#to-contact-microsoft-support).

## Azure Active Directory

To support authentication and authorization for Azure Information Protection, you must have an Azure Active Directory (AD). To use user accounts from your on-premises director (AD DS), you must also configure directory integration.

- **Single sign-on (SSO)** is supported for Azure Information Protection so that users are not repeatedly prompted for their credentials. If you use another vendor solution for federation, check with that vendor for how to configure it for Azure AD. WS-Trust is a common requirement for these solutions to support single sign-on. 

- **Multi-factor authentication (MFA)** is supported with Azure Information Protection when you have the required client software and have correctly configured the MFA-supporting infrastructure.

Conditional access is supported in preview for documents protected by Azure Information Protection. For more details see: [I see Azure Information Protection is listed as an available cloud app for conditional access—how does this work?](faqs.md#i-see-azure-information-protection-is-listed-as-an-available-cloud-app-for-conditional-accesshow-does-this-work)

For more details, see:

- [Azure Active Directory requirements for Azure Information Protection](requirements-azure-ad.md)

- [Preparing users and groups for Azure Information Protection](prepare.md)

## Client devices

Users computers or mobile devices must run on an operating system that supports Azure Information Protections.

### Supported operating systems for client devices

The following operating systems support both the Azure Information Protection unified labeling and the Azure Information Protection clients: 

- **Windows 10** (x86, x64). Handwriting is not supported in the Windows 10 RS4 build and later.
 
- **Windows 8.1** (x86, x64)

- **Windows 8** (x86, x64)

- **Windows Server 2019**

- **Windows Server 2016**

- **Windows Server 2012 R2** and **Windows Server 2012**

[Both clients](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients) let users classify and label their documents and emails.

For details about support in earlier versions of Windows, contact your Microsoft account or support representative.

> [!NOTE]
> When the Azure Information Protection clients protect the data by using the Azure Rights Management service, the data can be consumed by the [same devices](requirements-client-devices.md) that support the Azure Rights Management service.
>

### Virtual machines
If you're working with virtual machines, check whether the software vendor for your virtual desktop solution as additional configurations required for running the Azure Information Protection unified labeling or the Azure Information Protection client. 

For example, for Citrix solutions, you might need to [disable Citrix Application Programming Interface (API) hooks](https://support.citrix.com/article/CTX107825) for Office, the Azure Information Protection unified labeling client, or the Azure Information Protection client. 

These applications use the following files, respectively: **winword.exe**, **excel.exe**, **outlook.exe**, **powerpnt.exe**, **msip.app.exe**, **msip.viewer.exe**

### Server support

For each of the server versions listed above, Azure Information Protection clients are supported for Remote Desktop Services. 

If you delete user profiles when you use the Azure Information Protection clients with Remote Desktop Services, do not delete the **%Appdata%\Microsoft\Protect** folder.

Additionally, Server Core and Nano Server are not supported.

### Additional requirements per client

Each Azure Information Protection client has additional prerequisites. For details, see:

- [Azure Information Protection unified labeling client prerequisites](./rms-client/clientv2-admin-guide-install.md#additional-prerequisites-for-the-azure-information-protection-unified-labeling-client)

- [Azure Information Protection client prerequisites](./rms-client/client-admin-guide-install.md#additional-prerequisites-for-the-azure-information-protection-client)

## Applications

The Azure Information Protection clients can label and protect documents and emails by using Microsoft **Word**, **Excel**, **PowerPoint**, and **Outlook** from any of the following Office editions:

- **Office apps minimum version 1805**, build 9330.2078 from Office 365 Business or Microsoft 365 Business. 

    This edition is supported only when the user is assigned a license for Azure Rights Management, also known as Azure Information Protection for Office 365.

- **Office 365 ProPlus**

- **Office Professional Plus 2019**

- **Office Professional Plus 2016**

- **Office Professional Plus 2013 with Service Pack 1**

- **Office Professional Plus 2010 with Service Pack 2**

Other editions of Office cannot protect documents and emails by using a Rights Management service. For these editions, Azure Information Protection is supported for classification only, and labels that apply protection are not displayed for users. 

These labels would have otherwise been displayed on the Azure Information Protection bar or in the unified labeling client on the Office ribbon (from the **Protect** button in the classic client or the **Sensitivity** button in the unified labeling client). 

For more details, see [Applications that support Azure Rights Management data protection](requirements-applications.md).

### Office features and capabilities not supported

- The Azure Information Protection clients, including both classic and unified labeling, do not support multiple versions of Office on the same computer, or switching user accounts in Office.

- The Office [mail merge](https://support.office.com/article/use-mail-merge-for-bulk-email-letters-labels-and-envelopes-f488ed5b-b849-4c11-9cff-932c49474705) feature is not supported with any Azure Information Protection feature.

## Firewalls and network infrastructure

If you have a firewalls or similar intervening network devices that are configured to allow specific connections, the network connectivity requirements are listed in this Office article: [Office 365 URLs and IP address ranges > Microsoft 365 Common and Office Online](https://docs.microsoft.com/office365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online).

Azure Information Protection has the following additional requirements:

- **Unified labeling client**. To download labels and label policies, allow the following URL over HTTPS: ***.protection.outlook.com**

- **Web proxies**. If you use a web proxy that requires authentication, you must configure the proxy to use integrated Windows authentication with the user's Active Directory logon credentials.

    
- **TLS client-to-service connections**. Do not terminate any TLS client-to-service connections, for example to perform packet-level inspection, to the **aadrm.com** URL. Doing so breaks the certificate pinning that RMS clients use with Microsoft-managed CAs to help secure their communication with the Azure Rights Management service.
     
    To determine whether your client connection is terminated before it reaches the Azure Rights Management service, use the following PowerShell commands:

    ```ps
    $request = [System.Net.HttpWebRequest]::Create("https://admin.na.aadrm.com/admin/admin.svc")
    $request.GetResponse()
    $request.ServicePoint.Certificate.Issuer
    ```

    The result should show that the issuing CA is from a Microsoft CA, for example: `CN=Microsoft Secure Server CA 2011, O=Microsoft Corporation, L=Redmond, S=Washington, C=US`. 
    
    If you see an issuing CA name that is not from Microsoft, it is very likely that your secure client-to-service connection is being terminated and needs reconfiguration on your firewall.

- **TLS version 1.2 or higher** (unified labeling client only). The unified labeling client requires a TLS version of 1.2 or higher to ensure the  use of cryptographically secure protocols and align with Microsoft security guidelines.
    
### On-premises servers

The following on-premises servers are supported with the Azure Rights Management service from Azure Information Protection:

- **Exchange Server**

- **SharePoint Server**

- **Windows Server file servers** that support File Classification Infrastructure

For information about the additional requirements for this scenario, see [On-premises servers that support Azure Rights Management data protection](requirements-servers.md).

### Coexistence of AD RMS with Azure RMS

Using AD RMS and Azure RMS side-by-side, in the same organization, to protect content by the same user in the same organization, is **only** supported in AD RMS for [HYOK (hold your own key) protection](configure-adrms-restrictions.md) with Azure Information Protection.

This scenario is *not* supported during [migration](migrate-from-ad-rms-to-azure-rms.md).
 Supported migration paths include:

* [From AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md)

* [From Azure Information Protection to AD RMS](/powershell/module/aipservice/Set-AipServiceMigrationUrl)

> [!TIP]
> If you deploy Azure Information Protection and then decide that you no longer want to use this cloud service, see [Decommissioning and deactivating Azure Information Protection](decommission-deactivate.md).

For other, non-migration scenarios, where both services are active in the same organization, both services must be configured so that only one of them allows any given user to protect content. This can be configured as follows:

* Use redirections for an [AD RMS to Azure RMS migration](migrate-from-ad-rms-to-azure-rms.md)

* If both services must be active for different users at the same time, use service-side configurations to enforce exclusivity.  Use the Azure RMS onboarding controls in the cloud service, and an ACL on the Publish URL to set **Read-Only** mode for AD RMS.

### Service Tags

Make sure to allow access to all ports for the following Service Tags:

- **AzureInformationProtection**
- **AzureActiveDirectory**
- **AzureFrontDoor.FrontEnd**

The Azure Information Protection service also depends on two specific IP addresses:
 - **13.107.6.181** 
 - **13.107.9.181**

Make sure to create rules to allow outbound access to these specific IP addresses. 
