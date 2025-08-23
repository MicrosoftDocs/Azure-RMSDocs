---
# required metadata

title: Requirements for Azure Information Protection - AIP
description: Identify the prerequisites required to deploy Azure Information Protection in your organization.
author: aashishr
ms.author: aashishr
manager: aashishr
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

[!INCLUDE [looking-for-mip](includes/looking-for-mip.md)]

Before deploying Azure Information Protection, ensure that your system meets the following prerequisites:

- [Firewalls and network infrastructure](#firewalls-and-network-infrastructure)

## Firewalls and network infrastructure

If you have firewalls or similar intervening network devices that are configured to allow specific connections, the network connectivity requirements are listed in this Office article: [Microsoft 365 Common and Office Online](/office365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online).

Azure Information Protection has the following additional requirements:

- **Microsoft Purview Informaiton Protection client**. To download labels and label policies, allow the following URL over HTTPS: ***.protection.outlook.com**

- **Web proxies**. If you use a web proxy that requires authentication, you must configure the proxy to use integrated Windows authentication with the user's Active Directory sign in credentials.

    To support **Proxy.pac** files when using a proxy to acquire a token, add the following new registry key:

    - **Path**: `Computer\HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\MSIP\`
    - **Key**: `UseDefaultCredentialsInProxy`
    - **Type**: `DWORD`
    - **Value**: `1`
    
- **TLS client-to-service connections**. Don't terminate any TLS client-to-service connections, for example to perform packet-level inspection, to the **aadrm.com** URL. Doing so breaks the certificate pinning that RMS clients use with Microsoft-managed CAs to help secure their communication with the Azure Rights Management service.
     
    To determine whether your client connection is terminated before it reaches the Azure Rights Management service, use the following PowerShell commands:

    ```PowerShell
    $request = [System.Net.HttpWebRequest]::Create("https://admin.na.aadrm.com/admin/admin.svc")
    $request.GetResponse()
    $request.ServicePoint.Certificate.Issuer
    ```

    The result should show that the issuing CA is from a Microsoft CA, for example: `CN=Microsoft Secure Server CA 2011, O=Microsoft Corporation, L=Redmond, S=Washington, C=US`. 
    
    If you see an issuing CA name that isn't from Microsoft, it's likely that your secure client-to-service connection is being terminated and needs reconfiguration on your firewall.

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

Using AD RMS and Azure RMS side by side, in the same organization, to protect content by the same user in the same organization, is **only** supported in AD RMS for [HYOK (hold your own key) protection](/previous-versions/azure/information-protection/configure-adrms-restrictions) with Azure Information Protection.

This scenario is *not* supported during [migration](migrate-from-ad-rms-to-azure-rms.md).
 Supported migration paths include:

* [From AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md)

* [From Azure Information Protection to AD RMS](/powershell/module/aipservice/Set-AipServiceMigrationUrl)

> [!TIP]
> If you deploy Azure Information Protection and then decide that you no longer want to use this cloud service, see [Decommission and deactivate the Azure Rights Management service](/purview/deactivate-rights-management-service).

For other, non-migration scenarios, where both services are active in the same organization, both services must be configured so that only one of them allows any given user to protect content. Configure such scenarios as follows:

* Use redirections for an [AD RMS to Azure RMS migration](migrate-from-ad-rms-to-azure-rms.md)

* If both services must be active for different users at the same time, use service-side configurations to enforce exclusivity.  Use the Azure RMS onboarding controls in the cloud service, and an ACL on the Publish URL to set **Read-Only** mode for AD RMS.

### Service Tags

If you're using an Azure endpoint and an NSG, make sure to allow access to all ports for the following Service Tags:

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

To use this connector, you must configure directory synchronization between your Active Directory forests and Microsoft Entra ID.

Supported servers include:

|Server type  |Supported versions  |
|---------|---------|
|**Exchange Server**     | - Exchange Server 2019 </br> - Exchange Server 2016 </br>- Exchange Server 2013       |
|**Office SharePoint Server**     |- Office SharePoint Server 2019 <br>- Office SharePoint Server 2016 </br>- Office SharePoint Server 2013         |
|**File servers that run Windows Server and use File Classification Infrastructure (FCI)**     |- Windows Server 2016 </br>- Windows Server 2012 R2 </br>- Windows Server 2012       |

For more information, see [Deploying the Microsoft Rights Management connector](deploy-rms-connector.md).

## Supported operating systems for Azure Rights Management

The following operating systems support the Azure Rights Management service, which provides data protection for AIP:

|OS  |Supported versions  |
|---------|---------|
|**Windows computers**     |- Windows 10 (x86, x64) </br>- Windows 11 (x86, x64)       |
|**macOS**     |   Minimum version of macOS 10.8 (Mountain Lion)     |
|**Android phones and tablets**     | Minimum version of Android 6.0        |
|**iPhone and iPad**     | Minimum version of iOS 11.0        |
|**Windows phones and tablets** | Windows 10 Mobile|

## Next steps

Once you've reviewed all AIP requirements and confirmed that your system complies, continue with [Preparing users and groups for Azure Information Protection](prepare.md).


