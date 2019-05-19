---
# required metadata

title: Registry settings for the Rights Management connector - AIP
description: Information about the registry settings on servers using the RMS connector. The recommended method to configure these settings is to use the server configuration tool for Microsoft RMS connector.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 12/06/2018
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: ed3e9a3d-0f7c-4abc-9d0b-aa3b18403d39

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---


# Registry setting for the Rights Management connector

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*


Use the tables in the following sections only if you want to manually add or check registry settings on the servers that run Exchange, SharePoint, or Windows Server. These registry settings configure the servers to use the [RMS connector](deploy-rms-connector.md). The recommended method to configure these servers is to use the server configuration tool for Microsoft RMS connector.

Instructions for when you use these settings:

-   *\<YourTenantURL>* is the Azure Rights Management service URL for your Azure Information Protection tenant. To find this value:

    1.  Run the [Get-AipServiceConfiguration](http://msdn.microsoft.com/library/windowsazure/dn629410.aspx) cmdlet for the Azure Rights Management service. If you haven’t already installed the Windows PowerShell module for Azure RMS, see [Installing the AIPService PowerShell module](install-powershell.md).

    2.  From the output, identify the **LicensingIntranetDistributionPointUrl** value.

        For example: **LicensingIntranetDistributionPointUrl   : https://5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com/_wmcs/licensing**

    3.  From the value, remove **/_wmcs/licensing** from this string. The remaining string is your Azure Rights Management service URL. In our example, the Azure Rights Management service URL would be the following value:

        **https://5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com**
        
        You can verify that you have correct value by running the following PowerShell command:
        
            (Get-AipServiceConfiguration).LicensingIntranetDistributionPointUrl -match "https:\/\/[0-9A-Za-z\.-]*" | Out-Null; $matches[0]

-   *\<ConnectorFQDN>* is the load-balancing name that you defined in DNS for the connector. For example, **rmsconnector.contoso.com**.

-   Use the HTTPS prefix for the connector URL if you have configured the connector to use HTTPS to communicate with your on-premises servers. For more information, see the [Configuring the RMS connector to use HTTPS](install-configure-rms-connector.md#configuring-the-rms-connector-to-use-https) section from the main instructions. The Azure Rights Management service URL always uses HTTPS.


## Exchange 2016 or Exchange 2013 registry settings

**Registry path:** HKEY_LOCAL_MACHINE\Software\Microsoft\MSDRM\ServiceLocation\Activation

**Type:** Reg_SZ

**Value:** Default

**Data:** https://*\<YourTenantURL>*/_wmcs/certification

---

**Registry path:** HKEY_LOCAL_MACHINE\Software\Microsoft\MSDRM\ServiceLocation\EnterprisePublishing

**Type:** Reg_SZ

**Value:** Default

**Data:** https://*\<YourTenantURL>*/_wmcs/Licensing

---

**Registry path:** HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ExchangeServer\v15\IRM\CertificationServerRedirection

**Type:** Reg_SZ

**Value:** https://*\<YourTenantURL>*


**Data:** One of the following, depending on whether you are using HTTP or HTTPS from your Exchange server to the RMS connector:

- http://*<\ConnectorFQDN>*

- https://*<\ConnectorFQDN>*

---

**Registry path:** HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ExchangeServer\v15\IRM\LicenseServerRedirection

**Type:** Reg_SZ

**Value:** https://*<\YourTenantURL>*


**Data:** One of the following, depending on whether you are using HTTP or HTTPS from your Exchange server to the RMS connector:

- http://*<\ConnectorFQDN>*

- https://*<\ConnectorFQDN>*


## Exchange 2010 registry settings

**Registry path:** HKEY_LOCAL_MACHINE\Software\Microsoft\MSDRM\ServiceLocation\Activation

**Type:** Reg_SZ

**Value:** Default

**Data:** https://*<\YourTenantURL>*/_wmcs/certification

---

**Registry path:** HKEY_LOCAL_MACHINE\Software\Microsoft\MSDRM\ServiceLocation\EnterprisePublishing

**Type:** Reg_SZ

**Value:** Default

**Data:** https://*<\YourTenantURL>*/_wmcs/Licensing

---

**Registry path:** HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ExchangeServer\v14\IRM\CertificationServerRedirection

**Type:** Reg_SZ

**Value:** https://*<\YourTenantURL>*

**Data:** One of the following, depending on whether you are using HTTP or HTTPS from your Exchange server to the RMS connector:

- http://*<\ConnectorFQDN>*

- https://*<\ConnectorFQDN>*

---

**Registry path:** HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ExchangeServer\v14\IRM\LicenseServerRedirection

**Type:** Reg_SZ

**Value:** https://*<\YourTenantURL>*

**Data:** One of the following, depending on whether you are using HTTP or HTTPS from your Exchange server to the RMS connector:

- http://*<\ConnectorFQDN>*

- https://*<\ConnectorFQDN>*


## SharePoint 2016 or SharePoint 2013 registry settings

**Registry path:** HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSIPC\ServiceLocation\LicensingRedirection

**Type:** Reg_SZ

**Value:** https://*<\YourTenantURL>*/_wmcs/licensing


**Data:** One of the following, depending on whether you are using HTTP or HTTPS from your SharePoint server to the RMS connector:

- http://*<\ConnectorFQDN>*/_wmcs/licensing

- https://*<\ConnectorFQDN>*/_wmcs/licensing

---

**Registry path:** HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSIPC\ServiceLocation\EnterpriseCertification

**Type:** Reg_SZ

**Value:** Default

**Data:** One of the following, depending on whether you are using HTTP or HTTPS from your SharePoint server to the RMS connector:

- http://*<\ConnectorFQDN>*/_wmcs/certification

- https://*<\ConnectorFQDN>*/_wmcs/certification

---

**Registry path:** HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSIPC\ServiceLocation\EnterprisePublishing

**Type:** Reg_SZ

**Value:** Default


**Data:** One of the following, depending on whether you are using HTTP or HTTPS from your SharePoint server to the RMS connector:

- http://*<\ConnectorFQDN>*/_wmcs/licensing

- https://*<\ConnectorFQDN>*/_wmcs/licensing




## File server and File Classification Infrastructure registry settings

**Registry path:** HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSDRM\ServiceLocation\EnterprisePublishing

**Type:** Reg_SZ

**Value:** Default

**Data:** http://*<\ConnectorFQDN>*/_wmcs/licensing

---

**Registry path:** HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSDRM\ServiceLocation\Activation

**Type:** Reg_SZ

**Value:** Default

**Data:** http://*<\ConnectorFQDN>*/_wmcs/certification


Back to [Deploying the Azure Rights Management connector](deploy-rms-connector.md)
