---
# required metadata

title: Requirements for Azure Information Protection - AIP
description: Identify the prerequisites required to deploy Azure Information Protection in your organization.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 04/12/2021
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

>****Applies to***: [Azure Information Protection](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection)*
>
>***Relevant for**: [AIP unified labeling client and AIP classic client](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients).*
>

[!INCLUDE [AIP classic client is sunset](includes/classic-client-sunset.md)]

Before deploying Azure Information Protection, ensure that your system meets the following prerequisites:

- [Subscription for Azure Information Protection](#subscription-for-azure-information-protection)
- [Azure Active Directory](#azure-active-directory)
- [Client devices](#client-devices)
- [Applications](#applications)
- [Firewalls and network infrastructure](#firewalls-and-network-infrastructure)

To deploy Azure Information Protection, you must have the AIP client installed on any machines where you want to use AIP features. For more information, see [Install the Azure Information Protection unified labeling client for users](./rms-client/clientv2-admin-guide-install.md) and [The client side of Azure Information Protection](./rms-client/use-client.md).

## Subscription for Azure Information Protection

You must have an **Azure Information Protection plan** for classification, labeling, and protection using the Azure Information Protection scanner or client. For more information, see:

- [Microsoft 365 licensing guidance for security & compliance](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection)
- [Modern Work Plan Comparison](https://go.microsoft.com/fwlink/?linkid=2139145) (PDF download)

If your question is not answered there, contact your Microsoft Account Manager or [Microsoft Support](information-support.md#to-contact-microsoft-support).

## Azure Active Directory

To support authentication and authorization for Azure Information Protection, you must have an Azure Active Directory (AD). To use user accounts from your on-premises directory (AD DS), you must also configure directory integration.

- **Single sign-on (SSO)** is supported for Azure Information Protection so that users are not repeatedly prompted for their credentials. If you use another vendor solution for federation, check with that vendor for how to configure it for Azure AD. WS-Trust is a common requirement for these solutions to support single sign-on.

- **Multi-factor authentication (MFA)** is supported with Azure Information Protection when you have the required client software and have correctly configured the MFA-supporting infrastructure.

Conditional access is supported in preview for documents protected by Azure Information Protection. For more information, see: [I see Azure Information Protection is listed as an available cloud app for conditional access—how does this work?](faqs.md#i-see-azure-information-protection-is-listed-as-an-available-cloud-app-for-conditional-accesshow-does-this-work)

Additional prerequisites are required for specific scenarios, such as when using certificate-based or multi-factor authentication, or when UPN values don't match user email addresses.

For more information, see:

- [Additional Azure AD requirements for Azure Information Protection](requirements-azure-ad.md).
- [What is Azure AD Directory?](/azure/active-directory/fundamentals/active-directory-whatis)
- [Integrate on-premises Active Directory domains with Azure Active Directory](/azure/architecture/reference-architectures/identity/azure-ad).

## Client devices

User computers or mobile devices must run on an operating system that supports Azure Information Protection.

- [Supported operating systems for client devices](#supported-operating-systems-for-client-devices)
- [ARM64](#arm64)
- [Virtual machines](#virtual-machines)
- [Server support](#server-support)
- [Additional requirements per client](#additional-requirements-per-client)

### Supported operating systems for client devices

The Azure Information Protection clients for Windows are supported are the following operating systems:

- **Windows 11**

- **Windows 10** (x86, x64). Handwriting is not supported in the Windows 10 RS4 build and later.
 
- **Windows 8.1** (x86, x64)

- **Windows 8** (x86, x64)

- **Windows Server 2019**

- **Windows Server 2016**

- **Windows Server 2012 R2** and **Windows Server 2012**

For details about support in earlier versions of Windows, contact your Microsoft account or support representative.

> [!NOTE]
> When the Azure Information Protection clients protect the data by using the Azure Rights Management service, the data can be consumed by the [same devices](#client-devices) that support the Azure Rights Management service.
>


### ARM64 

ARM64 is **not** currently supported. 

### Virtual machines

If you're working with virtual machines, check whether the software vendor for your virtual desktop solution as additional configurations required for running the Azure Information Protection unified labeling or the Azure Information Protection client. 

For example, for Citrix solutions, you might need to [disable Citrix Application Programming Interface (API) hooks](https://support.citrix.com/article/CTX107825) for Office, the Azure Information Protection unified labeling client, or the Azure Information Protection client. 

These applications use the following files, respectively: **winword.exe**, **excel.exe**, **outlook.exe**, **powerpnt.exe**, **msip.app.exe**, **msip.viewer.exe**

### Server support

For each of the server versions listed above, Azure Information Protection clients are supported for Remote Desktop Services. 

If you delete user profiles when you use the Azure Information Protection clients with Remote Desktop Services, do not delete the **%Appdata%\Microsoft\Protect** folder.

Additionally, Server Core and Nano Server are not supported.

### Additional requirements per client

Each Azure Information Protection client has additional requirements. For details, see:

- [Azure Information Protection unified labeling client requirements](./rms-client/reqs-ul-client.md)

- [Azure Information Protection client requirements](./rms-client/client-admin-guide-install.md#additional-prerequisites-for-the-azure-information-protection-client)

## Applications

The Azure Information Protection clients can label and protect documents and emails by using Microsoft **Word**, **Excel**, **PowerPoint**, and **Outlook** from any of the following Office editions:

- **Office apps**, for the versions listed in the [table of supported versions for Microsoft 365 Apps by update channel](/officeupdates/update-history-microsoft365-apps-by-date), from Microsoft 365 Apps for Business or Microsoft 365 Business Premium, when the user is assigned a license for Azure Rights Management (also known as Azure Information Protection for Office 365)

- **Microsoft 365 Apps for Enterprise**

- **Office Professional Plus 2019**

- **Office Professional Plus 2016**

- **Office Professional Plus 2013 with Service Pack 1**

Other editions of Office cannot protect documents and emails by using a Rights Management service. For these editions, Azure Information Protection is supported for classification only, and labels that apply protection are not displayed for users. 

Labels are displayed in a bar displayed at the top of the Office document, accessible from the **Sensitivity** button in the unified labeling client, or the **Protect** button in the classic client.

For more information, see [Applications that support Azure Rights Management data protection](requirements-applications.md).

### Office features and capabilities not supported

- The Azure Information Protection clients for Windows do not support multiple versions of Office on the same computer, or switching user accounts in Office.

- The Office [mail merge](https://support.office.com/article/use-mail-merge-for-bulk-email-letters-labels-and-envelopes-f488ed5b-b849-4c11-9cff-932c49474705) feature is not supported with any Azure Information Protection feature.

## Firewalls and network infrastructure

If you have firewalls or similar intervening network devices that are configured to allow specific connections, the network connectivity requirements are listed in this Office article: [Microsoft 365 Common and Office Online](/office365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online).

Azure Information Protection has the following additional requirements:

- **Unified labeling client**. To download labels and label policies, allow the following URL over HTTPS: ***.protection.outlook.com**

- **Web proxies**. If you use a web proxy that requires authentication, you must configure the proxy to use integrated Windows authentication with the user's Active Directory sign in credentials.

    To support **Proxy.pac** files when using a proxy to acquire a token, add the following new registry key:

    - **Path**: `Computer\HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\MSIP\`
    - **Key**: `UseDefaultCredentialsInProxy`
    - **Type**: `DWORD`
    - **Value**: `1`
    
- **TLS client-to-service connections**. Do not terminate any TLS client-to-service connections, for example to perform packet-level inspection, to the **aadrm.com** URL. Doing so breaks the certificate pinning that RMS clients use with Microsoft-managed CAs to help secure their communication with the Azure Rights Management service.
     
    To determine whether your client connection is terminated before it reaches the Azure Rights Management service, use the following PowerShell commands:

    ```PowerShell
    $request = [System.Net.HttpWebRequest]::Create("https://admin.na.aadrm.com/admin/admin.svc")
    $request.GetResponse()
    $request.ServicePoint.Certificate.Issuer
    ```

    The result should show that the issuing CA is from a Microsoft CA, for example: `CN=Microsoft Secure Server CA 2011, O=Microsoft Corporation, L=Redmond, S=Washington, C=US`. 
    
    If you see an issuing CA name that is not from Microsoft, it is likely that your secure client-to-service connection is being terminated and needs reconfiguration on your firewall.

- **TLS version 1.2 or higher** (unified labeling client only). The unified labeling client requires a TLS version of 1.2 or higher to ensure the use of cryptographically secure protocols and align with Microsoft security guidelines.

- **Microsoft 365 Enhanced Configuration Service (ECS)**. AIP must have access to the **config.edge.skype.com** URL, which is a Microsoft 365 Enhanced Configuration Service (ECS).
 
    ECS provides Microsoft the ability to reconfigure AIP installations without the need for you to redeploy AIP. It’s used to control the gradual rollout of features or updates, while the impact of the rollout is monitored from diagnostic data being collected.
    
    ECS is also used to mitigate security or performance issues with a feature or update. ECS also supports configuration changes related to diagnostic data, to help ensure that the appropriate events are being collected. 
 
    Limiting the **config.edge.skype.com** URL may affect Microsoft’s ability to mitigate errors and may affect your ability to test preview features.
 
    For more information, see [Essential services for Office - Deploy Office](/deployoffice/privacy/essential-services).

- **Audit logging URL network connectivity**. AIP must be able to access the following URLs in order to support AIP audit logs:

    - `https://*.events.data.microsoft.com`
    - `https://*.aria.microsoft.com` (Android device data only)
    
    For more information, see [Prerequisites for AIP reporting](reports-aip.md#prerequisites).

### Coexistence of AD RMS with Azure RMS

Using AD RMS and Azure RMS side by side, in the same organization, to protect content by the same user in the same organization, is **only** supported in AD RMS for [HYOK (hold your own key) protection](configure-adrms-restrictions.md) with Azure Information Protection.

This scenario is *not* supported during [migration](migrate-from-ad-rms-to-azure-rms.md).
 Supported migration paths include:

* [From AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md)

* [From Azure Information Protection to AD RMS](/powershell/module/aipservice/Set-AipServiceMigrationUrl)

> [!TIP]
> If you deploy Azure Information Protection and then decide that you no longer want to use this cloud service, see [Decommissioning and deactivating Azure Information Protection](decommission-deactivate.md).

For other, non-migration scenarios, where both services are active in the same organization, both services must be configured so that only one of them allows any given user to protect content. Configure such scenarios as follows:

* Use redirections for an [AD RMS to Azure RMS migration](migrate-from-ad-rms-to-azure-rms.md)

* If both services must be active for different users at the same time, use service-side configurations to enforce exclusivity.  Use the Azure RMS onboarding controls in the cloud service, and an ACL on the Publish URL to set **Read-Only** mode for AD RMS.

### Service Tags

If you are using an Azure endpoint and an NSG, make sure to allow access to all ports for the following Service Tags:

- **AzureInformationProtection**
- **AzureActiveDirectory**
- **AzureFrontDoor.Frontend**

Additionally, in this case, the Azure Information Protection service also depends on the following IP addresses and port:

 - **13.107.9.198**
 - **13.107.6.198**
 - **2620:1ec:4::198**
 - **2620:1ec:a92::198**
 - **13.107.6.181** 
 - **13.107.9.181**
 - **Port 443**, for HTTPS traffic

Make sure to create rules that allow outbound access to these specific IP addresses, and via this port.

## Supported on-premises servers for Azure Rights Management data protection

The following on-premises servers are supported with Azure Information Protection when you use the Microsoft Rights Management connector.

This connector acts as a communications interface, and relays between on-premises servers and the Azure Rights Management service, which is used by Azure Information Protection to protect Office documents and emails. 

To use this connector, you must configure directory synchronization between your Active Directory forests and Azure Active Directory.

Supported servers include:

|Server type  |Supported versions  |
|---------|---------|
|**Exchange Server**     | - Exchange Server 2019 </br> - Exchange Server 2016 </br>- Exchange Server 2013       |
|**Office SharePoint Server**     |- Office SharePoint Server 2019 <br>- Office SharePoint Server 2016 </br>- Office SharePoint Server 2013         |
|**File servers that run Windows Server and use File Classification Infrastructure (FCI)**     |- Windows Server 2016 </br>- Windows Server 2012 R2 </br>- Windows Server 2012       |
| | |

For more information, see [Deploying the Microsoft Rights Management connector](deploy-rms-connector.md).

## Supported operating systems for Azure Rights Management

The following operating systems support the Azure Rights Management service, which provides data protection for AIP:

|OS  |Supported versions  |
|---------|---------|
|**Windows computers**     |- Windows 8 (x86, x64) </br>- Windows 8.1 (x86, x64) </br>- Windows 10 (x86, x64)       | 
|**macOS**     |   Minimum version of macOS 10.8 (Mountain Lion)     |
|**Android phones and tablets**     | Minimum version of Android 6.0        |
|**iPhone and iPad**     | Minimum version of iOS 11.0        |
|**Windows phones and tablets** | Windows 10 Mobile|
| | |

For more information, see [Applications that support Azure Rights Management data protection](requirements-applications.md). 


## Next steps

Once you've reviewed all AIP requirements and confirmed that your system complies, continue with [Preparing users and groups for Azure Information Protection](prepare.md).
