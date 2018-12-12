---
# required metadata

title: Migrate AD RMS-Azure Information Protection - phase 4
description: Phase 4 of migrating from AD RMS to Azure Information Protection, covering steps 8 through 9 from Migrating from AD RMS to Azure Information Protection
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 12/12/2018
ms.topic: conceptual
ms.service: information-protection
ms.assetid: 8b039ad5-95a6-4c73-9c22-78c7b0e12cb7


# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Migration phase 4 - supporting services configuration

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*


Use the following information for Phase 4 of migrating from AD RMS to Azure Information Protection. These procedures cover steps 8 through 9 from [Migrating from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md).



## Step 8. Configure IRM integration for Exchange Online

> [!IMPORTANT]
> Because you cannot control which recipients migrated users might select for protected emails, make sure that all users and mail-enabled groups in your organization have an account in Azure AD that can be used with Azure Information Protection. [More information](prepare.md)

Independently from the Azure Information Protection tenant key topology that you chose, do the following:

1. For Exchange Online to be able to decrypt emails that are protected by AD RMS, it needs to know that the AD RMS URL for your cluster corresponds to the key that’s available in your tenant. This is done with the DNS SRV record for your AD RMS cluster that is also used to reconfigure Office clients to use Azure Information Protection. If you did not create the DNS SRV record for client reconfiguration in step 7, create this record now to support Exchange Online. [Instructions](migrate-from-ad-rms-phase3.md#client-reconfiguration-by-using-dns-redirection)
    
    When this DNS record is in place, users using Outlook on the web and mobile email clients will be able to view AD RMS protected emails in those apps, and Exchange will be able to use the key you imported from AD RMS to decrypt, index, journal, and protect content that has been protected by AD RMS.  

2. Run the Exchange Online [Get-IRMConfiguration](https://technet.microsoft.com/library/dd776120(v=exchg.160\).aspx) command. If you need help running this command, see the step-by-step instructions from [Exchange Online: IRM Configuration](configure-office365.md#exchange-online-irm-configuration).
    
    From the output, check whether **AzureRMSLicensingEnabled** is set to **True**:
    
    - If AzureRMSLicensingEnabled is set to **True**, no further configuration is needed for this step. 
    
    - If AzureRMSLicensingEnabled is set **False**, run `Set-IRMConfiguration -AzureRMSLicensingEnabled $true` and then use the verification steps from [Set up new Office 365 Message Encryption capabilities built on top of Azure Information Protection](https://support.office.com/article/7ff0c040-b25c-4378-9904-b1b50210d00e) to confirm that Exchange Online is now ready to use the Azure Rights Management service. 

## Step 9. Configure IRM integration for Exchange Server and SharePoint Server

If you have used the Information Rights Management (IRM) functionality of Exchange Server or SharePoint Server with AD RMS, you will need to deploy the Rights Management (RMS) connector, which acts as a communications interface (a relay) between your on-premises servers and the protection service for Azure Information Protection.

This step covers installing and configuring the connector, disabling IRM for Exchange and SharePoint, and configuring these servers to use the connector. Finally, if you have imported AD RMS data configuration files (.xml) into Azure Information Protection that were used to protect email messages, you must manually edit the registry on the Exchange Server computers to redirect all trusted publishing domain URLs to the RMS connector.

> [!NOTE]
> Before you start, check the versions of the on-premises servers that the Azure Rights Management service supports, from [On-premises servers that support Azure RMS](./requirements-servers.md).

### Install and configure the RMS connector

Use the instructions in the [Deploying the Azure Rights Management connector](./deploy-rms-connector.md) article, and do steps 1 though 4. Do not start step 5 yet from the connector instructions. 

### Disable IRM on Exchange Servers and remove AD RMS configuration

1.  On each Exchange server, locate the following folder and delete all the entries in that folder: **\ProgramData\Microsoft\DRM\Server\S-1-5-18**

2. From one of the Exchange servers, run the following PowerShell commands to ensure that users will be able to read emails that are protected by using Azure Rights Management.

    Before you run these commands, substitute your own Azure Rights Management service URL for *\<Your Tenant URL>*.

		$irmConfig = Get-IRMConfiguration
		$list = $irmConfig.LicensingLocation 
		$list += "<Your Tenant URL>/_wmcs/licensing"
		Set-IRMConfiguration -LicensingLocation $list

3.  Now disable IRM features for messages that are sent to internal recipients:

    ```
    Set-IRMConfiguration -InternalLicensingEnabled $false
    ```

4. Then use the same cmdlet to disable IRM in Microsoft Office Outlook Web App and in Microsoft Exchange ActiveSync:

    ```
    Set-IRMConfiguration -ClientAccessServerEnabled $false
    ```

5.  Finally, use the same cmdlet to clear any cached certificates:

    ```
    Set-IRMConfiguration -RefreshServerCertificates
    ```

6.  On each Exchange Server, now reset IIS, for example, by running a command prompt as an administrator and typing **iisreset**.

### Disable IRM on SharePoint Servers and remove AD RMS configuration

1.  Make sure that there are no documents checked out from RMS-protected libraries. If there are, they will be become inaccessible at the end of this procedure.

2.  On the SharePoint Central Administration Web site, in the **Quick Launch** section, click **Security**.

3.  On the **Security** page, in the **Information Policy** section, click **Configure information rights management**.

4.  On the **Information Rights Management** page, in the **Information Rights Management** section, select **Do not use IRM on this server**, then click **OK**.

5.  On each of the SharePoint Server computers, delete the contents of the folder \ProgramData\Microsoft\MSIPC\Server\\<*SID of the account running SharePoint Server>*.

### Configure Exchange and SharePoint to use the connector

1. Return to the instructions for deploying the RMS connector: [Step 5: Configuring servers to use the RMS connector](./configure-servers-rms-connector.md)

    If you have SharePoint Server only, go straight to [Next steps](#next-steps) to continue the migration. 

2. On each Exchange Server, manually add the registry keys in the next section for each configuration data file (.xml) that you imported, to redirect the trusted publishing domain URLs to the RMS connector. These registry entries are specific to migration and are not added by the server configuration tool for Microsoft RMS connector.

    When you make these registry edits, use the following instructions:

    -   Replace *connector FQDN* with the name that you defined in DNS for the connector. For example, **rmsconnector.contoso.com**.

    -   Use the HTTP or HTTPS prefix for the connector URL, depending on whether you have configured the connector to use HTTP or HTTPS to communicate with your on-premises servers.

#### Registry edits for Exchange

For all Exchange servers, add the following registry values to LicenseServerRedirection, depending on your versions of Exchange:

---

For Exchange 2013 and Exchange 2016 - registry edit 1:


**Registry path:**

HKLM\SOFTWARE\Microsoft\ExchangeServer\v15\IRM\LicenseServerRedirection

**Type:** Reg_SZ

**Value:** https://\<AD RMS Intranet Licensing URL\>/_wmcs/licensing

**Data:**

One of the following, depending on whether you are using HTTP or HTTPS from your Exchange server to the RMS connector:

- http://\<connector FQDN\>/_wmcs/licensing

- https://\<connector FQDN\>/_wmcs/licensing


---

Exchange 2013 - registry edit 2:

**Registry path:**

HKLM\SOFTWARE\Microsoft\ExchangeServer\v15\IRM\LicenseServerRedirection 

**Type:** Reg_SZ

**Value:** https://\<AD RMS Extranet Licensing URL\>/_wmcs/licensing

**Data:**

One of the following, depending on whether you are using HTTP or HTTPS from your Exchange server to the RMS connector:

- http://\<connector FQDN\>/_wmcs/licensing

- https://\<connector FQDN\>/_wmcs/licensing

---

For Exchange 2010 - registry edit 1:


**Registry path:**

HKLM\SOFTWARE\Microsoft\ExchangeServer\v14\IRM\LicenseServerRedirection

**Type:** Reg_SZ

**Value:** https://\<AD RMS Intranet Licensing URL\>/_wmcs/licensing

**Data:**

One of the following, depending on whether you are using HTTP or HTTPS from your Exchange server to the RMS connector:

- http://\<connector FQDN\>/_wmcs/licensing

- https://\<connector Name\>/_wmcs/licensing


---

For Exchange 2010 - registry edit 2:


**Registry path:**

HKLM\SOFTWARE\Microsoft\ExchangeServer\v14\IRM\LicenseServerRedirection

**Type:** Reg_SZ

**Value:** https://\<AD RMS Extranet Licensing URL\>/_wmcs/licensing

**Data:**

One of the following, depending on whether you are using HTTP or HTTPS from your Exchange server to the RMS connector:

- http://\<connector FQDN\>/_wmcs/licensing

- https://\<connector FQDN\>/_wmcs/licensing

---


## Next steps
To continue the migration, go to [phase 5 -post migration tasks](migrate-from-ad-rms-phase5.md).
