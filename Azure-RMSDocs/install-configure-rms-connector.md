---
# required metadata

title: Install & configure the Rights Management connector - AIP
description: Information to help you install and configure the Azure Rights Management (RMS) connector. These procedures cover steps 1 though 4 from Deploying the Azure Rights Management connector.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 05/16/2018
ms.topic: conceptual
ms.service: information-protection
ms.assetid: 4fed9d4f-e420-4a7f-9667-569690e0d733

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Installing and configuring the Azure Rights Management connector

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*

Use the following information to help you install and configure the Azure Rights Management (RMS) connector. These procedures cover steps 1 though 4 from [Deploying the Azure Rights Management connector](deploy-rms-connector.md).

Before you begin, make sure that you have reviewed and checked the [prerequisites](deploy-rms-connector.md#prerequisites-for-the-rms-connector) for this deployment.


## Installing the RMS connector

1.  Identify the computers (minimum of two) that will run the RMS connector. They must meet the minimum specification listed in the prerequisites.

    > [!NOTE]
    > You install a single RMS connector (consisting of multiple servers for high availability) per tenant (Office 365 tenant or Azure AD tenant). Unlike Active Directory RMS, you do not have to install an RMS connector in each forest.

2.  Download the source files for the RMS connector from the [Microsoft Download Center](http://go.microsoft.com/fwlink/?LinkId=314106).

    To install the RMS connector, download RMSConnectorSetup.exe.

    In addition:

    -   If you later want to configure the connector from a 32-bit computer, also download RMSConnectorAdminToolSetup_x86.exe.

    -   If you want to use the server configuration tool for the RMS connector, to automate the configuration of registry settings on your on-premises servers, also download GenConnectorConfig.ps1.

3.  On the computer on which you want to install the RMS connector, run **RMSConnectorSetup.exe** with Administrator privileges.

4.  On the Welcome page of the Microsoft Rights Management Connector Setup, select **Install Microsoft Rights Management connector on the computer**, and then click **Next**.

5.  Read and agree to the RMS connector license terms, and then click **Next**.

To continue, enter an account and password to configure the RMS connector.

## Entering credentials
Before you can configure the RMS connector, you must enter credentials for an account that has sufficient privileges to configure the RMS connector. For example, you might type **admin@contoso.com** and then specify the password for this account.

This account must not require multi-factor authentication (MFA) because the Microsoft Rights Management administration tool does not support MFA for this account. 

The connector also has some character restrictions for this password. You cannot use a password that has any of the following characters: Ampersand ( **&** ); left angle bracket ( **[** ); right angle bracket ( **]** ); straight quotation ( **"** ); and apostrophe ( **'** ). If your password has any of these characters, authentication fails for the RMS connector and you see the error message **That user name and password combination is not correct**, even though you can successfully sign in using this account and password for other scenarios. If this scenario applies to your password, either use a different account with a password that does not have any of these special characters, or reset your password so it doesn't have any of these special characters.

In addition, if you have implemented [onboarding controls](activate-service.md#configuring-onboarding-controls-for-a-phased-deployment), make sure that the account you specify is able to protect content. For example, if you restricted the ability to protect content to the "IT department" group, the account that you specify here must be a member of that group. If not, you see the error message: **The attempt to discover the location of the administration service and organization failed. Make sure Microsoft Rights Management service is enabled for your organization.**

You can use an account that has one of the following privileges:

-   **Global administrator for your tenant**: An account that is a global administrator for your Office 365 tenant or Azure AD tenant.

-   **Azure Rights Management global administrator**: An account in Azure Active Directory that has been assigned the Azure RMS global administrator role.

-   **Azure Rights Management connector administrator**: An account in Azure Active Directory that has been granted rights to install and administer the RMS connector for your organization.

    > [!NOTE]
    > The Azure Rights Management global administrator role and Azure Rights Management connector administrator role are assigned to accounts by using the Azure RMS [Add-AipServiceRoleBasedAdministrator](/powershell/module/aipservice/add-aipservicerolebasedadministrator) cmdlet.
    > 
    > To run the RMS connector with least privileges, create a dedicated account for this purpose that you then assign the Azure RMS connector administrator role by doing the following:
    >
    > 1.  If you haven't already done so, download and install Windows PowerShell for Rights Management. For more information, see [Installing the AIPService PowerShell module](install-powershell.md).
    >
    >     Start Windows PowerShell with the **Run as administrator** command, and connect to the Azure RMS service by using the [Connect-AipService](/powershell/module/aipservice/connect-aipservice) command:
    >
    >     ```
    >     Connect-AipService                   //provide Office 365 tenant administrator or Azure RMS global administrator credentials
    >     ```
    > 2.  Then run the [Add-AipServiceRoleBasedAdministrator](/powershell/module/aipservice/add-aipservicerolebasedadministrator) command, using just one of the following parameters:
    >
    >     ```
    >     Add-AipServiceRoleBasedAdministrator -EmailAddress <email address> -Role "ConnectorAdministrator"
    >     ```
    >
    >     ```
    >     Add-AipServiceRoleBasedAdministrator -ObjectId <object id> -Role "ConnectorAdministrator"
    >     ```
    >
    >     ```
    >     Add-AipServiceRoleBasedAdministrator -SecurityGroupDisplayName <group Name> -Role "ConnectorAdministrator"
    >     ```
    >     For example, type: **Add-AipServiceRoleBasedAdministrator -EmailAddress melisa@contoso.com -Role "ConnectorAdministrator"**
    >
    >     Although these commands assign the connector administrator role, you could also use the GlobalAdministrator role here, as well.

During the RMS connector installation process, all prerequisite software is validated and installed, Internet Information Services (IIS) is installed if not already present, and the connector software is installed and configured. In addition, Azure RMS is prepared for configuration by creating the following:

-   An empty table of servers that are authorized to use the connector to communicate with Azure RMS. You add servers to this table later.

-   A set of security tokens for the connector, which authorize operations with Azure RMS. These tokens are downloaded from Azure RMS and installed on the local computer in the registry. They are protected by using the data protection application programming interface (DPAPI) and the Local System account credentials.

On the final page of the wizard, do the following, and then click **Finish**:

-   If this is the first connector that you have installed, do not select **Launch connector administrator console to authorize servers** at this time. You will select this option after you have installed your second (or final) RMS connector. Instead, run the wizard again on at least one other computer. You must install a minimum of two connectors.

-   If you have installed your second (or final) connector, select **Launch connector administrator console to authorize servers**.

> [!TIP]
> At this point, there is a verification test that you can perform to test whether the web services for the RMS connector are operational:
>
> -   From a web browser, connect to **http://&lt;connectoraddress&gt;/_wmcs/certification/servercertification.asmx**, replacing *&lt;connectoraddress&gt;* with the server address or name that has the RMS connector installed. A successful connection displays a **ServerCertificationWebService** page.

If you need to uninstall the RMS connector, run the wizard again and select the uninstall option.

If you experience any problems during the installation, check the installation log: **%LocalAppData%\Temp\Microsoft Rights Management connector_\<date and time>.log** 

As an example, your install log might look similar to C:\Users\Administrator\AppData\Local\Temp\Microsoft Rights Management connector_20170803110352.log

## Authorizing servers to use the RMS connector
When you have installed the RMS connector on at least two computers, you are ready to authorize the servers and services that you want to use the RMS connector. For example, servers running Exchange Server 2013 or SharePoint Server 2013.

To define these servers, run the RMS connector administration tool and add entries to the list of allowed servers. You can run this tool when you select **Launch connector administration console to authorize servers** at the end of the Microsoft Rights Management connector Setup wizard, or you can run it separately from the wizard.

When you authorize these servers, be aware of the following considerations:

- Servers that you add are granted special privileges. All accounts that you specify for the Exchange Server role in the connector configuration are granted the [super user role](configure-super-users.md) in Azure RMS, which gives them access to all content for this RMS tenant. The super user feature is automatically enabled at this point, if necessary. To avoid the security risk of elevation of privileges, be careful to specify only the accounts that are used by your organization’s Exchange servers. All servers configured as SharePoint servers or file servers that use FCI are granted regular user privileges.

- You can add multiple servers as a single entry by specifying an Active Directory security or distribution group, or a service account that is used by more than one server. When you use this configuration, the group of servers shares the same RMS certificates and are all be considered owners for content that any of them have protected. To minimize administrative overheads, we recommend that you use this configuration of a single group rather than individual servers to authorize your organization’s Exchange servers or a SharePoint server farm.

On the **Servers allowed to utilize the connector** page, click **Add**.

> [!NOTE]
> Authorizing servers is the equivalent configuration in Azure RMS to the AD RMS configuration of manually applying NTFS rights to ServerCertification.asmx for the service or server computer accounts, and manually granting user super rights to the Exchange accounts. Applying NTFS rights to ServerCertification.asmx is not required on the connector.


### Add a server to the list of allowed servers
On the **Allow a server to utilize the connector** page, enter the name of the object, or browse to identify the object to authorize.

It is important that you authorize the correct object. For a server to use the connector, the account that runs the on-premises service (for example, Exchange or SharePoint) must be selected for authorization. For example, if the service is running as a configured service account, add the name of that service account to the list. If the service is running as Local System, add the name of the computer object (for example, SERVERNAME$). As a best practice, create a group that contains these accounts and specify the group instead of individual server names.

More information about the different server roles:

-   For servers that run Exchange: You must specify a security group and you can use the default group (**Exchange Servers**) that Exchange automatically creates and maintains of all Exchange servers in the forest.

-   For servers that run SharePoint:

    -   If a SharePoint 2010 server is configured to run as Local System (it's not using a service account), manually create a security group in Active Directory Domain Services, and add the computer name object for the server in this configuration to this group.

    -   If a SharePoint server is configured to use a service account (the recommended practice for SharePoint 2010 and the only option for SharePoint 2016 and SharePoint 2013), do the following:

        1.  Add the service account that runs the SharePoint Central Administration service to enable SharePoint to be configured from its administrator console.

        2.  Add the account that is configured for the SharePoint App Pool.

        > [!TIP]
        > If these two accounts are different, consider creating a single group that contains both accounts to minimize the administrative overheads.

-   For file servers that use File Classification Infrastructure, the associated services run as the Local System account, so you must authorize the computer account for the file servers (for example, SERVERNAME$) or a group that contains those computer accounts.

When you have finished adding servers to the list, click **Close**.

If you haven’t already done so, you must now configure load balancing for the servers that have the RMS connector installed, and consider whether to use HTTPS for the connections between these servers and the servers that you have just authorized.

## Configuring load balancing and high availability
After you have installed the second or final instance of the RMS connector, define a connector URL server name and configure a load balancing system.

The connector URL server name can be any name under a namespace that you control. For example, you could create an entry in your DNS system for **rmsconnector.contoso.com** and configure this entry to use an IP address in your load balancing system. There are no special requirements for this name and it doesn’t need to be configured on the connector servers themselves. Unless your Exchange and SharePoint servers are going to be communicating with the connector over the Internet, this name doesn’t have to resolve on the Internet.

> [!IMPORTANT]
> We recommend that you don’t change this name after you have configured Exchange or SharePoint servers to use the connector, because you have to then clear these servers of all IRM configurations and then reconfigure them.

After the name is created in DNS and is configured for an IP address, configure load balancing for that address, which directs traffic to the connector servers. You can use any IP-based load balancer for this purpose, which includes  the Network Load Balancing (NLB) feature in Windows Server. For more information, see [Load Balancing Deployment Guide](http://technet.microsoft.com/library/cc754833%28v=WS.10%29.aspx).

Use the following settings to configure the NLB cluster:

-   Ports: 80 (for HTTP) or 443 (for HTTPS)

    For more information about whether to use HTTP or HTTPS, see the next section.

-   Affinity: None

-   Distribution method: Equal

This name that you define for the load-balanced system (for the servers running the RMS connector service) is your organization’s RMS connector name that you use later, when you configure the on-premises servers to use Azure RMS.

## Configuring the RMS connector to use HTTPS
> [!NOTE]
> This configuration step is optional, but recommended for additional security.

Although the use of TLS or SSL is optional for the RMS connector, we recommend it for any HTTP-based security-sensitive service. This configuration authenticates the servers running the connector to your Exchange and SharePoint servers that use the connector. In addition, all data that is sent from these servers to the connector is encrypted.

To enable the RMS connector to use TLS, on each server that runs the RMS connector, install a server authentication certificate that contains the name that you use for the connector. For example, if your RMS connector name that you defined in DNS is **rmsconnector.contoso.com**, deploy a server authentication certificate that contains **rmsconnector.contoso.com** in the certificate subject as the common name. Or, specify **rmsconnector.contoso.com** in the certificate alternative name as the DNS value. The certificate does not have to include the name of the server. Then in IIS, bind this certificate to the Default Web Site.

If you use the HTTPS option, ensure that all servers that run the connector have a valid server authentication certificate that chains to a root CA that your Exchange and SharePoint servers trust. In addition, if the certification authority (CA) that issued the certificates for the connector servers publishes a certificate revocation list (CRL), the Exchange and SharePoint servers must be able to download this CRL.

> [!TIP]
> You can use the following information and resources to help you request and install a server authentication certificate, and to bind this certificate to the Default Web Site in IIS:
>
> -   If you use Active Directory Certificate Services (AD CS) and an enterprise certification authority (CA) to deploy these server authentication certificates, you can duplicate and then use the Web Server certificate template. This certificate template uses **Supplied in the request** for the certificate subject name, which means that you can provide the FQDN of the RMS connector name for the certificate subject name or subject alternative name when you request the certificate.
> -   If you use a stand-alone CA or purchase this certificate from another company, see [Configuring Internet Server Certificates (IIS 7)](http://technet.microsoft.com/library/cc731977%28v=ws.10%29.aspx) in the [Web Server (IIS)](http://technet.microsoft.com/library/cc753433%28v=ws.10%29.aspx) documentation library on TechNet.
> -   To configure IIS to use the certificate, see [Add a Binding to a Site (IIS 7)](http://technet.microsoft.com/library/cc731692.aspx) in the [Web Server (IIS)](http://technet.microsoft.com/library/cc753433%28v=ws.10%29.aspx) documentation library on TechNet.

## Configuring the RMS connector for a web proxy server
If your connector servers are installed in a network that does not have direct Internet connectivity and requires manual configuration of a web proxy server for outbound Internet access, you must configure the registry on these servers for the RMS connector.

#### To configure the RMS connector to use a web proxy server

1.  On each server running the RMS connector, open a registry editor, such as Regedit.

2.  Navigate to **HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\AADRM\Connector**

3.  Add the string value of **ProxyAddress** and then set the Data for this value to be **http://&lt;MyProxyDomainOrIPaddress&gt;:&lt;MyProxyPort&gt;**

    For example: **http://proxyserver.contoso.com:8080**

4.  Close the registry editor, and then restart the server or perform an IISReset command to restart IIS.

## Installing the RMS connector administration tool on administrative computers
You can run the RMS connector administration tool from a computer that does not have the RMS connector installed, if that computer meets the following requirements:

-   A physical or virtual computer running Windows Server 2012 or Windows Server 2012 R2 (all editions), Windows Server 2008 R2 or Windows Server 2008 R2 Service Pack 1 (all editions), Windows 8.1, Windows 8, or Windows 7.

-   At least 1 GB of RAM.

-   A minimum of 64 GB of disk space.

-   At least one network interface.

-   Access to the Internet via a firewall (or web proxy).

To install the RMS connector administration tool, run the following files:

-   For a 32-bit computer: RMSConnectorAdminToolSetup_x86.exe

-   For a 64-bit computer: RMSConnectorSetup.exe

If you haven’t already downloaded these files, you can do so from the [Microsoft Download Center](http://go.microsoft.com/fwlink/?LinkId=314106).


## Next steps
Now that the RMS connector is installed and configured, you are ready to configure your on-premises servers to use it. Go to [Configuring servers for the Azure Rights Management connector](configure-servers-rms-connector.md).

