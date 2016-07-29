---
# required metadata

title: Requirements for Azure Information Protection | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 07/29/2016
ms.topic: get-started-article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: aa4353e5-c5b0-47f6-a6f9-87d13e8f075f

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: eymanor
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Requirements for Azure Information Protection

>*Applies to: Azure Information Protection preview*

**[ This information is preliminary and subject to change. ]**

To evaluate the preview release of Azure Information Protection, make sure that you have the following prerequisites. 

|Requirement|More information|
|---------------|--------------------|
|A cloud subscription that includes Azure RMS|Your organization must have a cloud subscription that supports Rights Management.<br /><br />For more information and links to free trials, see [Cloud subscriptions that support Azure RMS](../get-started/requirements-subscriptions.md).|
|Azure AD directory|Your organization must have an Azure AD directory to support user authentication for Azure RMS and Azure Information Protection. In addition, if you want to use your user accounts from your on-premises directory (AD DS), you must also configure directory integration.<br /><br />Multi-factor authentication (MFA) is supported with Azure RMS when you have the required client software and correctly configured MFA supporting infrastructure.<br /><br />For more information, see [Azure AD directory](../get-started/requirements-azure-ad.md), where the information for Azure RMS also applies to Azure Information Protection.|
|Client devices|The following client devices are supported for this preview:<br /><br />- Windows 10 (x86, x64)<br /><br />- Windows 8.1 (x86, x64)<br /><br />- Windows 8 (x86, x64)<br /><br />- Windows 7 Service Pack 1 (x86, x64)<br /><br />When you protect the data, it can be consumed by the same devices (Windows, Mac, iOS, Android), that support Azure Rights Management. For details about these devices and the supported versions, see [Azure RMS requirements: Client devices that support Azure RMS](../get-started/requirements-client-devices.md).|
|Applications|For the preview release and at general availability (GA), Azure Information Protection supports labeling and protection of files and emails that are created by the following Office applications: **Word**, **Excel**, **PowerPoint**, and **Outlook** from the following Office suites:<br /><br />- Office Professional Plus 2016<br /><br />- Office Professional Plus 2013 with Service Pack 1<br /><br />- Office Professional Plus 2010<br /><br />After general availability, look for an announcement on the [Enterprise Mobility and Security Blog](https://blogs.technet.microsoft.com/enterprisemobility/?product=azure-rights-management-services) for when Azure Information Protection will support additional file types, such as PDF, audio, video, and image files.|
|Infrastructure that supports connectivity to the Internet and dependent cloud services|If you have a firewall or similar intervening network devices that must be configured to allow specific connections, see the information for **Azure Rights Management (RMS)** in the [Office 365 portal and shared](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#BKMK_Portal-identity) section from the following Office article: [Office 365 URLs and IP address ranges](https://support.office.com/en-US/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2)<br /><br />In addition:<br /><br />- Allow HTTPS traffic on TCP 443 to **rmsibizaapiprod.cloudapp.net**.<br /><br />- Do not terminate the TLS client-to-service connection (for example, to do packet-level inspection). <br /><br />- If you use a web proxy that requires authentication, you must configure it to use integrated Windows authentication with the user’s Active Directory logon credentials.|

## Next steps

If you meet these requirements, try our self-guided demo to configure and experience Azure Information Protection for yourself: [Quick start tutorial for Azure Information Protection](infoprotect-quick-start-tutorial.md).

