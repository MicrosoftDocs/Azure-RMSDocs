---
# required metadata

title: Migrating from AD RMS to Azure Rights Management - phase 3 | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
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

# Migration phase 3 - supporting services configuration

Use the following information for Phase 3 of migrating from AD RMS to Azure Rights Management (Azure RMS). These procedures cover steps 6 through 7 from [Migrating from AD RMS to Azure Rights Management](migrating-from-ad-rms-to-azure-rights-management.md).


## Step 6. Configure IRM integration for Exchange Online

If you have previously imported your TDP from AD RMS to Exchange Online, you must remove this TDP to avoid conflicting templates and policies after you have migrated to Azure RMS. To do this, use the [Remove-RMSTrustedPublishingDomain](https://technet.microsoft.com/en-us/library/jj200720%28v=exchg.150%29.aspx) cmdlet from Exchange Online.

If you chose an Azure RMS tenant key topology of **Microsoft managed**:

-   See the [Exchange Online: IRM configuration](../deploy-use/0365-configure-for-clients-online-services.md#exchange-online-irm-configuration) section in the [Office 365: Configuration for clients and online services](../deploy-use/0365-configure-for-clients-online-services) article. This section includes typical commands to run that connects to the Exchange Online service, imports the tenant key from Azure RMS, and enables IRM functionality for Exchange Online. After you complete these steps, you will have full RMS functionality with Exchange Online.

If you chose an Azure RMS tenant key topology of **customer-managed (BYOK)**:

-   You will  have reduced RMS functionality with Exchange Online, as described in the [BYOK pricing and restrictions](byok-pricing-and-restrictions.md) article.

## Step 7. Deploy the RMS connector
If you have used the Information Rights Management (IRM) functionality of Exchange Server or SharePoint Server with AD RMS, you must first disable IRM on these servers and remove AD RMS configuration. Then, deploy the Rights Management (RMS) connector, which acts as a communications interface (a relay) between the on-premises servers and Azure RMS.

Finally for this step, if you have imported multiple TPDs into Azure RMS that were used to protect email messages, you must manually edit the registry on the Exchange Server computers to redirect all TPDs URLs to the RMS connector.

> [!NOTE]
> Before you start, check the versions of the on-premises servers that Azure RMS supports, from [On-premises servers that support Azure RMS](../get-started/rms-requirements-onpremises-servers.md).

### Disable IRM on Exchange Servers and remove AD RMS configuration

1.  On each Exchange server, locate the following folder and delete all the entries in that folder: \ProgramData\Microsoft\DRM\Server\S-1-5-18

2.  From one of the Exchange servers, use the Exchange [Set_IRMConfiguration](http://technet.microsoft.com/library/dd979792.aspx) cmdlet to first disable IRM features for messages that are sent to internal recipients:

    ```
    Set-IRMConfiguration -InternalLicensingEnabled $false
    ```

3.  Then use the same cmdlet to disable IRM features for messages that are sent to external recipients:

    ```
    Set-IRMConfiguration -ExternalLicensingEnabled $false
    ```

4.  Next, use the same cmdlet to disable IRM in Microsoft Office Outlook Web App and in Microsoft Exchange ActiveSync:

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

5.  On each of the SharePoint Server computers, delete the contents of the folder \ProgramData\Microsoft\MSIPC\Server\*&lt;SID of the account running SharePoint Server&gt;*.

#### Install and configure the RMS connector

-   Use the instructions in the [Deploying the Azure Rights Management connector](../deploy-use/deploying-the-azure-rights-management-connector.md) article.

#### For Exchange only and multiple TPDs: Edit the registry

-   On each Exchange Server, manually add the following registry keys for each additional TPD that you imported, to redirect the TPD URLs to the RMS connector. These registry entries are specific to migration and are not added by the server configuration tool for Microsoft RMS connector.

    When you make these registry edits, use the following instructions:

    -   Replace *ConnectorFQDN* with the name that you defined in DNS for the connector. For example, **rmsconnector.contoso.com**.

    -   Use the HTTP or HTTPS prefix for the connector URL, depending on whether you have configured the connector to use HTTP or HTTPS to communicate with your on-premises servers.

For Exchange 2013 - registry edit 1:


**Registry path:**

HKLM\SOFTWARE\Microsoft\ExchangeServer\v15\IRM\LicenseServerRedirection

**Type:**

Reg_SZ

**Value:**

https://<AD RMS Intranet Licensing URL>/_wmcs/licensing

**Data:**

One of the following, depending on whether you are using HTTP or HTTPS from your Exchange server to the RMS connector:

- http://<connectorFQDN>/_wmcs/licensing

- https://<connectorName>/_wmcs/licensing


---

For Exchange 2013 - registry edit 2:

**Registry path:**

HKLM\SOFTWARE\Microsoft\ExchangeServer\v15\IRM\LicenseServerRedirection 


**Type:**

Reg_SZ

**Value:**

https://<AD RMS Extranet Licensing URL>/_wmcs/licensing


**Data:**

One of the following, depending on whether you are using HTTP or HTTPS from your Exchange server to the RMS connector:

- http://<connectorFQDN>/_wmcs/licensing

- https://<connectorFQDN>/_wmcs/licensing

---

For Exchange 2010 - registry edit 1:



**Registry path:**

HKLM\SOFTWARE\Microsoft\ExchangeServer\v14\IRM\LicenseServerRedirection

**Type:**

Reg_SZ

**Value:**

https://<AD RMS Intranet Licensing URL>/_wmcs/licensing

**Data:**

One of the following, depending on whether you are using HTTP or HTTPS from your Exchange server to the RMS connector:

- http://<connectorFQDN>/_wmcs/licensing

- https://<connectorName>/_wmcs/licensing


---

For Exchange 2010 - registry edit 2:


**Registry path:**

HKLM\SOFTWARE\Microsoft\ExchangeServer\v14\IRM\LicenseServerRedirection
 

**Type:**

Reg_SZ

**Value:**

https://<AD RMS Extranet Licensing URL>/_wmcs/licensing


**Data:**

One of the following, depending on whether you are using HTTP or HTTPS from your Exchange server to the RMS connector:

- http://<connectorFQDN>/_wmcs/licensing

- https://<connectorFQDN>/_wmcs/licensing

---

After you have completed these procedures, you are ready to read the **Next steps** section from the [Deploying the Azure Rights Management Connector](../use-use/deploying-the-azure-rights-management-connector.md) article.

## Next steps
Go continue the migration, go to [phase 4 -post migration tasks](migrating-from-ad-rms-to-azure-rights-management-phase4.md).