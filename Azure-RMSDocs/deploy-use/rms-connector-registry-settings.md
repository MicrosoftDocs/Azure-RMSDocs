---
# required metadata

title: Registry settings for the Rights Management connector - AIP
description: Information about the registry settings on servers using the RMS connector. The recommended method to configure these settings is to use the server configuration tool for Microsoft RMS connector.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 02/23/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
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

>*Applies to: Azure Information Protection, Office 365*


Use the tables in the following sections only if you want to manually add or check registry settings on the servers running Exchange, SharePoint, or Windows Server, which configures the servers to use the [RMS connector](deploy-rms-connector.md). The recommended method to configure these servers is to use the server configuration tool for Microsoft RMS connector.

Instructions for when you use these settings:

-   *MicrosoftRMSURL* is your organization’s Microsoft RMS service URL. To find this value:

    1.  Run the [Get-AadrmConfiguration](http://msdn.microsoft.com/library/windowsazure/dn629410.aspx) cmdlet for Azure RMS. If you haven’t already installed the Windows PowerShell module for Azure RMS, see [Installing Windows PowerShell for Azure Rights Management](install-powershell.md).

    2.  From the output, identify the **LicensingIntranetDistributionPointUrl** value.

        For example: **LicensingIntranetDistributionPointUrl   : https://5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com/_wmcs/licensing**

    3.  From the value, remove **/_wmcs/licensing** from this string. The remaining string is your Microsoft RMS URL. In our example, the Microsoft RMS URL would be the following value:

        **https://5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com**

-   *ConnectorFQDN* is the load-balancing name that you defined in DNS for the connector. For example, **rmsconnector.contoso.com**.

-   Use the HTTPS prefix for the connector URL if you have configured the connector to use HTTPS to communicate with your on-premises servers. For more information, see the [Configuring the RMS connector to use HTTPS](install-configure-rms-connector.md#configuring-the-rms-connector-to-use-https) section from the main instructions. The Microsoft RMS URLs always use HTTPS.


## Exchange 2016 or Exchange 2013 registry settings

**Registry path:** HKEY_LOCAL_MACHINE\Software\Microsoft\MSDRM\ServiceLocation\Activation

**Type:** Reg_SZ

**Value:** Default

**Data:** https://*MicrosoftRMSURL*/_wmcs/certification

---

**Registry path:** HKEY_LOCAL_MACHINE\Software\Microsoft\MSDRM\ServiceLocation\EnterprisePublishing

**Type:** Reg_SZ

**Value:** Default

**Data:** https://*MicrosoftRMSURL*/_wmcs/Licensing

---

**Registry path:** HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ExchangeServer\v15\IRM\CertificationServerRedirection

**Type:** Reg_SZ

**Value:** https://*MicrosoftRMSURL*


**Data:** One of the following, depending on whether you are using HTTP or HTTPS from your Exchange server to the RMS connector:

- http://*ConnectorFQDN*

- https://*ConnectorFQDN*

---

**Registry path:** HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ExchangeServer\v15\IRM\LicenseServerRedirection

**Type:** Reg_SZ

**Value:** https://*MicrosoftRMSURL*


**Data:** One of the following, depending on whether you are using HTTP or HTTPS from your Exchange server to the RMS connector:

- http://*ConnectorFQDN*

- https://*ConnectorFQDN*


## Exchange 2010 registry settings

**Registry path:** HKEY_LOCAL_MACHINE\Software\Microsoft\MSDRM\ServiceLocation\Activation

**Type:** Reg_SZ

**Value:** Default

**Data:** https://*MicrosoftRMSURL*/_wmcs/certification

---

**Registry path:** HKEY_LOCAL_MACHINE\Software\Microsoft\MSDRM\ServiceLocation\EnterprisePublishing

**Type:** Reg_SZ

**Value:** Default

**Data:** https://*MicrosoftRMSURL*/_wmcs/Licensing

---

**Registry path:** HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ExchangeServer\v14\IRM\CertificationServerRedirection

**Type:** Reg_SZ

**Value:** https://*MicrosoftRMSURL*

**Data:** One of the following, depending on whether you are using HTTP or HTTPS from your Exchange server to the RMS connector:

- http://*ConnectorFQDN*

- https://*ConnectorFQDN*

---

**Registry path:** HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ExchangeServer\v14\IRM\LicenseServerRedirection

**Type:** Reg_SZ

**Value:** https://*MicrosoftRMSURL*

**Data:** One of the following, depending on whether you are using HTTP or HTTPS from your Exchange server to the RMS connector:

- http://*ConnectorFQDN*

- https://*ConnectorFQDN*


## SharePoint 2016 or SharePoint 2013 registry settings

**Registry path:** HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSIPC\ServiceLocation\LicensingRedirection

**Type:** Reg_SZ

**Value:** https://*MicrosoftRMSURL*/_wmcs/licensing


**Data:** One of the following, depending on whether you are using HTTP or HTTPS from your SharePoint server to the RMS connector:

- http://*ConnectorFQDN*/_wmcs/licensing

- https://*ConnectorFQDN*/_wmcs/licensing

---

**Registry path:** HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSIPC\ServiceLocation\EnterpriseCertification

**Type:** Reg_SZ

**Value:** Default

**Data:** One of the following, depending on whether you are using HTTP or HTTPS from your SharePoint server to the RMS connector:

- http://*ConnectorFQDN*/_wmcs/certification

- https://*ConnectorFQDN*/_wmcs/certification

---

**Registry path:** HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSIPC\ServiceLocation\EnterprisePublishing

**Type:** Reg_SZ

**Value:** Default


**Data:** One of the following, depending on whether you are using HTTP or HTTPS from your SharePoint server to the RMS connector:

- http://*ConnectorFQDN*/_wmcs/licensing

- https://*ConnectorFQDN*/_wmcs/licensing




## File server and File Classification Infrastructure registry settings

**Registry path:** HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSDRM\ServiceLocation\EnterprisePublishing

**Type:** Reg_SZ

**Value:** Default

**Data:** http://*ConnectorFQDN*/_wmcs/licensing

---

**Registry path:** HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSDRM\ServiceLocation\Activation

**Type:** Reg_SZ

**Value:** Default

**Data:** http://*ConnectorFQDN*/_wmcs/certification


Back to [Deploying the Azure Rights Management connector](deploy-rms-connector.md)

[!INCLUDE[Commenting house rules](../includes/houserules.md)]