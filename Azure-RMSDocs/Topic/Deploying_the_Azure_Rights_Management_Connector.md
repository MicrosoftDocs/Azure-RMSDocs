---
title: Deploying the Azure Rights Management Connector
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 90e7e33f-9ecc-497b-89c5-09205ffc5066
author: Cabailey
---
# Deploying the Azure Rights Management Connector
Use this information to learn about the Microsoft Rights Management (RMS) connector and how you can use it to provide information protection with existing on-premises deployments that use Microsoft Exchange Server, Microsoft SharePoint Server, or file servers that run Windows Server and use the File Classification Infrastructure (FCI) capability of File Server Resource Manager.

> [!TIP]
> For a high-level example scenario with screenshots, see the [Automatically protecting files on file servers running Windows Server and File Classification Infrastructure](../Topic/What_is_Azure_Rights_Management_.md#BKMK_Example_FCI) section in the [What is Azure Rights Management?](../Topic/What_is_Azure_Rights_Management_.md) topic.

## <a name="OverviewConnector"></a>Overview of the Microsoft Rights Management connector
The Microsoft Rights Management (RMS) connector lets you quickly enable existing on-premises servers to use their Information Rights Management (IRM) functionality with the cloud-based Microsoft Rights Management service (Azure RMS). With this functionality, IT and users can easily protect documents and pictures both inside your organization and outside, without having to install additional infrastructure or establish trust relationships with other organizations. You can use this connector even if some of your users are connecting to online services, in a hybrid scenario. For example, some users' mailboxes use Exchange Online and some users' mailboxes use Exchange Server. After you install the RMS connector, all users can protect and consume emails and attachments by using Azure RMS, and information protection works seamlessly between the two deployment configurations.

The RMS connector is a small-footprint service that you install on-premises, on servers that run Windows Server 2012 R2, Windows Server 2012, or Windows Server 2008 R2. In addition to running the connector on physical computers, you can also run it on virtual machines, including Azure IaaS VMs. After you install and configure the connector, it acts as a communications interface (a relay) between the on-premises servers and the cloud service.

If you manage your own tenant key for Azure RMS (the bring you own key, or BYOK scenario), the RMS connector and the on-premises servers that use it do not access the hardware security module (HSM) that contains your tenant key. This is because all cryptographic operations that use the tenant key are performed in Azure RMS, and not on-premises.

![](../Image/RMS_connector.png)

The RMS connector supports the following on-premises servers: Exchange Server, SharePoint Server, and file servers that run Windows Server and use File Classification Infrastructure to classify and apply policies to Office documents in a folder. If you want to protect all files types using File Classification, do not use the RMS connector, but instead, use the [RMS Protection cmdlets](https://msdn.microsoft.com/library/azure/mt433195.aspx).

> [!NOTE]
> For supported versions of these on-premises servers, see “On-premises servers that support Azure RMS” in the [Applications that support Azure RMS](../Topic/Requirements_for_Azure_Rights_Management.md#BKMK_SupportedApplications) section of the [Requirements for Azure Rights Management](../Topic/Requirements_for_Azure_Rights_Management.md) topic.

Use the following sections to help you plan for, install, and configure the RMS connector. You must then do some post installation configuration so that your servers can use the connector.

-   [Prerequisites for the RMS connector](../Topic/Deploying_the_Azure_Rights_Management_Connector.md#BKMK_Prereqs)

-   **Step 1:**  [Installing the RMS connector](../Topic/Deploying_the_Azure_Rights_Management_Connector.md#BKMK_InstallingConnector)

-   **Step 2:**  [Entering credentials](../Topic/Deploying_the_Azure_Rights_Management_Connector.md#EnteringCredentials)

-   **Step 3:**  [Authorizing servers to use the RMS connector](../Topic/Deploying_the_Azure_Rights_Management_Connector.md#AuthorizingServers)

-   **Step 4:**  [Configuring load balancing and high availability](../Topic/Deploying_the_Azure_Rights_Management_Connector.md#ConfiguringConnector)

-   Optional: [Configuring the RMS connector to use HTTPS](../Topic/Deploying_the_Azure_Rights_Management_Connector.md#BKMK_ConfiguringHTTPS)

-   Optional: [Configuring the RMS connector for a web proxy server](../Topic/Deploying_the_Azure_Rights_Management_Connector.md#BKMK_ConfiguringWebProxy)

-   Optional: [Installing the RMS connector administration tool on administrative computers](../Topic/Deploying_the_Azure_Rights_Management_Connector.md#BKMK_InstallingStandaloneTool)

-   **Step 5:**  [Configuring servers to use the RMS connector](../Topic/Deploying_the_Azure_Rights_Management_Connector.md#ConfiguringServers)

    -   [Configuring an Exchange server to use the connector](../Topic/Deploying_the_Azure_Rights_Management_Connector.md#BKMK_ExchangeServer)

    -   [Configuring a SharePoint server to use the connector](../Topic/Deploying_the_Azure_Rights_Management_Connector.md#BKMK_ConfiguringSharePoint)

    -   [Configuring a file server for File Classification Infrastructure to use the connector](../Topic/Deploying_the_Azure_Rights_Management_Connector.md#BKMK_FileServer)

-   [Next steps](../Topic/Deploying_the_Azure_Rights_Management_Connector.md#BKMK_NextSteps)

## <a name="BKMK_Prereqs"></a>Prerequisites for the RMS connector
Before you install the RMS connector, make sure that the following requirements are in place.

|Requirement|More information|
|---------------|--------------------|
|The Rights Management (RMS) service is activated|[Activating Azure Rights Management](../Topic/Activating_Azure_Rights_Management.md)|
|Directory synchronization between your on-premises Active Directory forests and Azure Active Directory|After RMS is activated, Azure Active Directory must be configured to work with the users and groups in your Active Directory database.<br /><br />**Important**: You must do this directory synchronization step for the RMS connector to work, even for a test network. Although you can use Office 365 and Azure Active Directory by using accounts that you manually create in Azure Active Directory, this connector requires that the accounts in Azure Active Directory are synchronized with Active Directory Domain Services; manual password synchronization is not sufficient.<br /><br />For more information, see the following resources:<br /><br />[Instructions for configuring your Azure AD tenant](http://technet.microsoft.com/library/hh967611.aspx)<br /><br />[Instructions for enabling directory synchronization with AAD using DirSync](http://technet.microsoft.com/library/hh967642.aspx)|
|Optional but recommended:<br /><br />Enable federation between your on-premises Active Directory and Azure Active Directory|You can enable identity federation between your on-premises directory and Azure Active Directory. This configuration enables a more seamless user experience by using single sign-on to the RMS service. Without single sign on, users are prompted for their credentials before they can use rights-protected content.<br /><br />For instructions to configure federation by using Active Directory Federation Services (AD FS) between Active Directory Domain Services and Azure Active Directory, see the [Checklist: Use AD FS to implement and manage single sign-on](http://technet.microsoft.com/library/jj205462.aspx) in the Windows Server library.|
|A minimum of two member computers on which to install the RMS connector:<br /><br />A 64-bit physical or virtual computer running one of the following operating systems:  Windows Server 2012 R2,  Windows Server 2012, or Windows Server 2008 R2.<br /><br />At least 1 GB of RAM.<br /><br />A minimum of 64 GB of disk space<br /><br />At least one network interface.<br /><br />Access to the Internet via a firewall (or web proxy) that does not require authentication.<br /><br />Must be in a forest or domain that trusts other forests in the organization that contain installations of Exchange or SharePoint servers that you want to use with the RMS connector.|For fault tolerance and high availability, you must install the RMS connector on a minimum of two computers.<br /><br />**Tip**: If you are using Outlook Web Access or mobile devices that use Exchange ActiveSync IRM and it is critical that you maintain access to emails and attachments that are protected by Azure RMS, we recommend that you deploy a load-balanced group of connector servers to ensure high availability.<br /><br />You do not need dedicated servers to run the connector but you must install it on a separate computer from the servers that will use the connector.<br /><br />**Important**: Do not install the connector on a computer that runs Exchange Server, SharePoint Server, or a file server that is configured for file classification infrastructure if you want to use the functionality from these services with Azure RMS. Also, do not install this connector on a domain controller.|

## <a name="BKMK_InstallingConnector"></a>Installing the RMS connector
After you have confirmed the prerequisites in the preceding section, use the following instructions to install the RMS connector:

1.  Identify the computers (minimum of two) that will run the RMS connector. They must meet the minimum specification listed in the preceding section.

    > [!NOTE]
    > You will install a single RMS connector (consisting of multiple servers for high availability) per tenant (Office 365 tenant or Azure AD tenant). Unlike Active Directory RMS, you do not have to install an RMS connector in each forest.

2.  Download the source files for the RMS connector from the [Microsoft Download Center](http://go.microsoft.com/fwlink/?LinkId=314106).

    To install the RMS connector, download RMSConnectorSetup.exe.

    In addition:

    -   If you later want to configure the connector from a 32-bit computer, also download RMSConnectorAdminToolSetup_x86.exe.

    -   If you want to use the server configuration tool for the RMS connector, to automate the configuration of registry settings on you on-premises servers, also download GenConnectorConfig.ps1.

3.  On the computer on which you want to install the RMS connector, run **RMSConnectorSetup.exe** with Administrator privileges.

4.  On the Welcome page of the Microsoft Rights Management Connector Setup page, select **Install Microsoft Rights Management connector on the computer**, and then click **Next**.

5.  Read and agree to the RMS connector license terms, and then click **Next**.

To continue, enter an account and password to configure the RMS connector.

## <a name="EnteringCredentials"></a>Entering credentials
Before you can configure the RMS connector, you must enter credentials for an account that has sufficient privileges to configure the RMS connector.

In addition, if you have implemented [onboarding controls](https://technet.microsoft.com/library/jj658941.aspx), make sure that the account you specify is able to protect content. For example, if you restricted the ability to protect content to the “IT department” group, the account that you specify here must be a member of that group. If not, you will see the error message: **The attempt to discover the location of the administration service and organization failed. Make sure Microsoft Rights Management service is enabled for your organization.**

You can use an account that has one of the following privileges:

-   **Office 365 tenant administrator**: An account that is a global admin for your Office 365 tenant.

-   **Azure Rights Management global administrator**: An account with administrator privileges for the Azure RMS tenant.

-   **Microsoft RMS connector Administrator**: An account in Azure Active Directory that has been granted rights to install and administer the RMS connector for your organization.

    > [!NOTE]
    > If you want to use the Microsoft RMS connector Administrator account, you must first do the following to assign the RMS connector administrator role:
    > 
    > 1.  On the same computer, download and install Windows PowerShell for Rights Management. For more information, see [Installing Windows PowerShell for Azure Rights Management](../Topic/Installing_Windows_PowerShell_for_Azure_Rights_Management.md).
    > 
    >     Start Windows PowerShell with the **Run as administrator** command, and connect to the Azure RMS service by using the [Connect-AadrmService](https://msdn.microsoft.com/library/azure/dn629415.aspx) command:
    > 
    >     ```
    >     Connect-AadrmService                   //provide Office 365 tenant administrator or Azure RMS global administrator credentials
    >     ```
    > 2.  Then run the [Add-AadrmRoleBasedAdministrator](https://msdn.microsoft.com/library/azure/dn629417.aspx) command, using just one of the following parameters:
    > 
    >     ```
    >     Add-AadrmRoleBasedAdministrator -EmailAddress <email address> -Role "ConnectorAdministrator"
    >     ```
    > 
    >     ```
    >     Add-AadrmRoleBasedAdministrator -ObjectId <object id> -Role "ConnectorAdministrator"
    >     ```
    > 
    >     ```
    >     Add-AadrmRoleBasedAdministrator -SecurityGroupDisplayName <group Name> -Role "ConnectorAdministrator"
    >     ```
    >     For example, type: **Add-AadrmRoleBasedAdministrator -EmailAddress melisa@contoso.com -Role " ConnectorAdministrator "**
    > 
    >     Although these commands use the ConnectorAdministrator role, you could also use the GlobalAdministrator role here, as well.

During the RMS connector installation process, all prerequisite software is validated and installed, Internet Information Services (IIS) is installed if not already present, and the connector software is installed and configured. In addition, Azure RMS is prepared for configuration by creating the following:

-   An empty table of servers that are authorized to use the connector to communicate with Azure RMS. You will add servers to this table later.

-   A set of security tokens for the connector, which authorize operations with Azure RMS. These tokens are downloaded from Azure RMS and installed on the local computer in the registry. They are protected by using the data protection application programming interface (DPAPI) and the Local System account credentials.

On the final page of the wizard, do the following, and then click **Finish**:

-   If this is the first connector that you have installed, do not select **Launch connector administrator console to authorize servers** at this time. You will select this option after you have installed your second (or final) RMS connector. Instead, run the wizard again on at least one other computer. You must install a minimum of two connectors.

-   If you have installed your second (or final) connector, select **Launch connector administrator console to authorize servers**.

> [!TIP]
> At this point, there is a verification test that you can perform to test whether the web services for the RMS connector are operational:
> 
> -   From a web browser, connect to **http://&lt;connectoraddress&gt;/_wmcs/certification/servercertification.asmx**, replacing *&lt;connectoraddress&gt;* with the server address or name that has the RMS connector installed. A successful connection displays a **ServerCertificationWebService** page.

If you need to uninstall the RMS connector, run the wizard again and select the uninstall option.

## <a name="AuthorizingServers"></a>Authorizing servers to use the RMS connector
When you have installed the RMS connector on at least two computers, you are ready to authorize the servers and services that you want to use the RMS connector. For example, servers running Exchange Server 2013 or SharePoint Server 2013.

To define these servers, run the RMS connector administration tool and add entries to the list of allowed servers. You can run this tool when you select **Launch connector administration console to authorize servers** at the end of the Microsoft Rights Management connector Setup wizard, or you can run it separately from the wizard.

When you authorize these servers, be aware of the following considerations:

-   Servers that you add will be granted special privileges. All accounts that you specify for the Exchange Server role in the connector configuration will be granted the [super user role](https://technet.microsoft.com/library/mt147272.aspx) in Azure RMS, which gives them access to all content for this RMS tenant. The super user feature is automatically enabled at this point, if necessary. To avoid the security risk of elevation of privileges, be careful to specify only the accounts that are used by your organization’s Exchange servers. All servers configured as SharePoint servers or file servers that use FCI will be granted regular user privileges.

-   You can add multiple servers as a single entry by specifying an Active Directory security or distribution group, or a service account that is used by more than one server. When you use this configuration, the group of servers will share the same RMS certificates and will all be considered owners for content that any of them have protected. To minimize administrative overheads, we recommend that you use this configuration of a single group rather than individual servers to authorize your organization’s Exchange servers or a SharePoint server farm.

On the **Servers allowed to utilize the connector** page, click **Add**.

### <a name="BKMK_AddServer"></a>Add a server to the list of allowed servers
On the **Allow a server to utilize the connector** page, enter the name of the object, or browse to identify the object to authorize.

It is important that you authorize the correct object. For a server to use the connector, the account that runs the on-premises service (for example, Exchange or SharePoint) must be selected for authorization. For example, if the service is running as a configured service account, add the name of that service account to the list. If the service is running as Local System, add the name of the computer object (for example, SERVERNAME$). As a best practice, create a group that contains these accounts and specify the group instead of individual server names.

More information about the different server roles:

-   For servers that run Exchange: You must specify a security group and you can use the default group (**Exchange Servers**) that Exchange automatically creates and maintains of all Exchange servers in the forest.

-   For servers that run SharePoint:

    -   If a SharePoint 2010 server is configured to run as Local System (it's not using a service account), manually create a security group in Active Directory Domain Services, and add the computer name object for the server in this configuration to this group.

    -   If a SharePoint server is configured to use a service account (the recommended practice for SharePoint 2010 and the only option for SharePoint 2013), do the following:

        1.  Add the service account that runs the SharePoint Central Administration service to enable SharePoint to be configured from its administrator console.

        2.  Add the account that is configured for the SharePoint App Pool.

        > [!TIP]
        > If these two accounts are different, consider creating a single group that contains both accounts to minimize the administrative overheads.

-   For file servers that use File Classification Infrastructure, the associated services run as the Local System account, so you must authorize the computer account for the file servers (for example, SERVERNAME$) or a group that contains those computer accounts.

When you have finished adding servers to the list, click **Close**.

If you haven’t already done so, you must now configure load balancing for the servers that have the RMS connector installed, and consider whether to use HTTPS for the connections between these servers and the servers that you have just authorized.

## <a name="ConfiguringConnector"></a>Configuring load balancing and high availability
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

This name that you define for the load-balanced system (for the servers running the RMS connector service) is your organization’s RMS connector name that you will use later, when you configure the on-premises servers to use Azure RMS.

## <a name="BKMK_ConfiguringHTTPS"></a>Configuring the RMS connector to use HTTPS
> [!NOTE]
> This configuration step is optional, but recommended for additional security.

Although the use of TLS or SSL is optional for the RMS connector, we recommend it for any HTTP-based security-sensitive service. This configuration authenticates the servers running the connector to your Exchange and SharePoint servers that use the connector. In addition, all data that is sent from these servers to the connector is encrypted.

To enable the RMS connector to use TLS, on each server that runs the RMS connector, install a server authentication certificate that contains the name that you will use for the connector. For example, if your RMS connector name that you defined in DNS is **rmsconnector.contoso.com**, deploy a server authentication certificate that contains **rmsconnector.contoso.com** in the certificate subject as the common name. Or, specify **rmsconnector.contoso.com** in the certificate alternative name as the DNS value. The certificate does not have to include the name of the server. Then in IIS, bind this certificate to the Default Web Site.

If you use the HTTPS option, ensure that all servers that run the connector have a valid server authentication certificate that chains to a root CA that your Exchange and SharePoint servers trust. In addition, if the certification authority (CA) that issued the certificates for the connector servers publishes a certificate revocation list (CRL), the Exchange and SharePoint servers must be able to download this CRL.

> [!TIP]
> You can use the following information and resources to help you request and install a server authentication certificate, and to bind this certificate to the Default Web Site in IIS:
> 
> -   If you use Active Directory Certificate Services (AD CS) and an enterprise certification authority (CA) to deploy these server authentication certificates, you can duplicate and then use the Web Server certificate template. This certificate template uses **Supplied in the request** for the certificate subject name, which means that you can provide the FQDN of the RMS connector name for the certificate subject name or subject alternative name when you request the certificate.
> -   If you use a stand-alone CA or purchase this certificate from another company, see [Configuring Internet Server Certificates (IIS 7)](http://technet.microsoft.com/library/cc731977%28v=ws.10%29.aspx) in the [Web Server (IIS)](http://technet.microsoft.com/library/cc753433%28v=ws.10%29.aspx) documentation library on TechNet.
> -   To configure IIS to use the certificate, see [Add a Binding to a Site (IIS 7)](http://technet.microsoft.com/library/cc731692.aspx) in the in the [Web Server (IIS)](http://technet.microsoft.com/library/cc753433%28v=ws.10%29.aspx) documentation library on TechNet.

## <a name="BKMK_ConfiguringWebProxy"></a>Configuring the RMS connector for a web proxy server
If your connector servers are installed in a network that does not have direct Internet connectivity and requires manual configuration of a web proxy server for outbound Internet access, you must configure the registry on these servers for the RMS connector.

#### To configure the RMS connector to use a web proxy server

1.  On each server running the RMS connector, open a registry editor, such as Regedit.

2.  Navigate to **HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\AADRM\Connector**

3.  Add the string value of **ProxyAddress** and then set the Data for this value to be **http://&lt;MyProxyDomainOrIPaddress&gt;:&lt;MyProxyPort&gt;**

    For example: **http://proxyserver.contoso.com:8080**

4.  Close the registry editor, and then restart the server or perform an IISReset command to restart IIS.

## <a name="BKMK_InstallingStandaloneTool"></a>Installing the RMS connector administration tool on administrative computers
You can run the RMS connector administration tool from a computer that does not have the RMS connector installed, if that computer meets the following requirements:

-   A physical or virtual computer running Windows Server 2012 or Windows Server 2012 R2 (all editions), Windows Server 2008 R2 or Windows Server 2008 R2 Service Pack 1 (all editions), Windows 8.1, Windows 8, or Windows 7.

-   At least 1 GB of RAM.

-   A minimum of 64 GB of disk space.

-   At least one network interface.

-   Access to the Internet via a firewall (or web proxy).

To install the RMS connector administration tool, run the following files:

-   For a 32-bit computer: RMSConnectorAdminToolSetup_x86.exe

-   For a 64-bit computer: RMSConnectorSetup.exe

If you haven’t already downloaded these files, you can do so from the [Microsoft Download Center](http://go.microsoft.com/fwlink/?LinkId=314106).

## <a name="ConfiguringServers"></a>Configuring servers to use the RMS connector
After you have installed and configured the RMS connector, you are ready to configure your on-premises servers that will use Rights Management and connect to Azure RMS by using the connector. This means configuring the following servers:

-   For Exchange 2013: Client access servers and mailbox servers

-   For Exchange 2010: Client access servers and hub transport servers

-   For SharePoint: Front-end SharePoint webservers, including those hosting the Central Administration server

-   For File Classification Infrastructure: Windows Server computers that have installed File Resource Manager

This configuration requires registry settings. To do this, you have two options:

|Configuration option|Advantages|Disadvantages|
|------------------------|--------------|-----------------|
|Automatically by using the server configuration tool for Microsoft RMS connector|No direct editing of the registry. This is automated for you by using a script.<br /><br />No need to run a Windows PowerShell cmdlet to obtain your Microsoft RMS URL.<br /><br />The prerequisites are automatically checked for you (but not automatically remediated) if you run it locally.|When you run the tool, you must make a connection to a server that is already running the RMS connector.|
|Manually by editing the registry|No connectivity to a server running the RMS connector is required.|More administrative overheads that are error-prone.<br /><br />You must obtain your Microsoft RMS URL, which requires you to run a Windows PowerShell command.<br /><br />You must always make all the prerequisites checks yourself.|
> [!IMPORTANT]
> In both cases, you must manually install any prerequisites and configure Exchange, SharePoint, and File Classification Infrastructure to use Rights Management.

For most organizations, automatic configuration by using the server configuration tool for Microsoft RMS connector will be the better option, because it provides greater efficiency and reliability than manual configuration.

After making the configuration changes on these servers, you must restart them if they are running Exchange or SharePoint and previously configured to use AD RMS. There is no need to restart these servers if you are configuring them for Rights Management for the first time. You must always restart the file server that is configured to use File Classification Infrastructure after you make these configuration changes.

#### How to use the server configuration tool for Microsoft RMS connector

1.  If you haven’t already downloaded the script for the server configuration tool for Microsoft RMS connector (GenConnectorConfig.ps1), download it from the [Microsoft Download Center](http://go.microsoft.com/fwlink/?LinkId=314106).

2.  Save the GenConnectorConfig.ps1 file on the computer where you will run the tool. If you will run the tool locally, this must be the server that you want to configure to communicate with the RMS connector. Otherwise, you can save it on any computer.

3.  Decide how to run the tool:

    -   **Locally**: You can run the tool interactively, from the server to be configured to communicate with the RMS connector. This is useful for a one-off configuration, such as a testing environment.

    -   **Software deployment**: You can run the tool to produce registry files that you then deploy to one or more relevant servers by using a systems management application that supports software deployment, such as System Center Configuration Manager.

    -   **Group Policy**: You can run the tool to produce a script that you give to an administrator who can create Group Policy objects for the servers to be configured. This script creates one Group Policy object for each server type to be configured, which the administrator can then assign to the relevant servers.

    > [!NOTE]
    > This tool configures the servers that will communicate with the RMS connector and that are listed at the beginning of this section. Do not run this tool on the servers that run the RMS connector.

4.  Start Windows PowerShell with the **Run as an administrator** option, and use the Get-help command to read instructions how to the use the tool for your chosen configuration method:

    ```
    Get-help .\GenConnectorConfig.ps1 -detailed
    ```

To run the script, you must enter the URL of the RMS connector for your organization. Enter the protocol prefix (HTTP:// or HTTPS://) and the name of the connector that you defined in DNS for the load balanced address of your connector. For example, https://connector.contoso.com. The tool then uses that URL to contact the servers running the RMS connector and obtain other parameters that are used to create the required configurations.

> [!IMPORTANT]
> When you run this tool, make sure that you specify the name of the load-balanced RMS connector for your organization and not the name of a single server that runs the RMS connector service.

Use the following sections for specific information for each service type:

-   [Configuring an Exchange server to use the connector](../Topic/Deploying_the_Azure_Rights_Management_Connector.md#BKMK_ExchangeServer)

-   [Configuring a SharePoint server to use the connector](../Topic/Deploying_the_Azure_Rights_Management_Connector.md#BKMK_ConfiguringSharePoint)

-   [Configuring a file server for File Classification Infrastructure to use the connector](../Topic/Deploying_the_Azure_Rights_Management_Connector.md#BKMK_FileServer)

> [!NOTE]
> After these servers are configured to use the connector, client applications that are installed locally on these servers might not work with RMS. When this happens, it is because the applications try to use the connector rather than use RMS directly, which is not supported.
> 
> In addition, if Office 2010 is installed locally on an Exchange server, the client app’s IRM features might work from that computer after the server is configured to use the connector, but this is not supported.
> 
> In both scenarios, you must install the client applications on separate computers that are not configured to use the connector. They will then correctly use RMS directly.

### <a name="BKMK_ExchangeServer"></a>Configuring an Exchange server to use the connector
The following Exchange roles communicate with the RMS connector:

-   For Exchange 2013: Client access server and mailbox server

-   For Exchange 2010: Client access server and hub transport server

To use the RMS connector, these servers running Exchange must be running one of the following software versions:

-   Exchange Server 2013 with Exchange 2013 Cumulative Update 3

-   Exchange Server 2010 with Exchange 2010 Service Pack 3 Rollup Update 6

You will also need to install on these servers, a version of the RMS client that includes support for RMS Cryptographic Mode 2. The minimum version that is supported in Windows Server 2008 is included in the hotfix that you can download from [RSA key length is increased to 2048 bits for AD RMS in Windows Server 2008 R2 and in Windows Server 2008](http://support.microsoft.com/kb/2627272). The minimum version for Windows Server 2008 R2 can be downloaded from [RSA key length is increased to 2048 bits for AD RMS in Windows 7 or in Windows Server 2008 R2](http://support.microsoft.com/kb/2627273). Windows Server 2012 and Windows Server 2012 R2 natively support Cryptographic Mode 2.

> [!IMPORTANT]
> If these versions or later versions of Exchange and the RMS client are not installed, you will not be able to configure Exchange to use the connector. Check that these versions are installed before you continue.

##### To configure Exchange servers to use the connector

1.  On the Exchange server roles that communicate with the RMS connector, do one of the following:

    -   Run the server configuration tool for Microsoft RMS connector. For more information, see [How to use the server configuration tool for Microsoft RMS connector](../Topic/Deploying_the_Azure_Rights_Management_Connector.md#BKMK_HowToRunTheTool) in this topic.

        For example, to run the tool locally to configure a server running Exchange 2013:

        ```
        .\GenConnectorConfig.ps1 -ConnectorUri https://rmsconnector.contoso.com -SetExchange2013
        ```

    -   Make manual registry edits by using the tables in the following sections to manually add registry settings on the servers.

2.  Enable IRM functionality in Exchange. For more information, see [Information Rights Management Procedures](https://technet.microsoft.com/library/dd351212%28v=exchg.150%29.aspx) in the Exchange library.

Use the tables in the following sections only if you want to manually add or check registry settings on these servers, which configures the servers to use the RMS connector. Instructions for when you use these tables:

-   *MicrosoftRMSURL* is your organization’s Microsoft RMS service URL. To find this value:

    1.  Run the [Get-AadrmConfiguration](http://msdn.microsoft.com/library/windowsazure/dn629410.aspx) cmdlet for Azure RMS. If you haven’t already installed the Windows PowerShell module for Azure RMS, see [Installing Windows PowerShell for Azure Rights Management](../Topic/Installing_Windows_PowerShell_for_Azure_Rights_Management.md).

    2.  From the output, identify the **LicensingIntranetDistributionPointUrl** value.

        For example: **LicensingIntranetDistributionPointUrl   : https://5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com/_wmcs/licensing**

    3.  From the value, remove **/_wmcs/licensing** from this string. The remaining string is your Microsoft RMS URL. In our example, the Microsoft RMS URL would be the following value:

        **https://5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com**

-   *ConnectorFQDN* is the load-balancing name that you defined in DNS for the connector. For example, **rmsconnector.contoso.com**.

-   Use the HTTPS prefix for the connector URL if you have configured the connector to use HTTPS to communicate with your on-premises servers. For more information, see the [Configuring the RMS connector to use HTTPS](../Topic/Deploying_the_Azure_Rights_Management_Connector.md#BKMK_ConfiguringHTTPS) section in this topic. The Microsoft RMS URLs always use HTTPS.

#### Table for Exchange 2013 registry settings

|Registry path|Type|Value|Data|
|-----------------|--------|---------|--------|
|HKEY_LOCAL_MACHINE\Software\Microsoft\MSDRM\ServiceLocation\Activation|Reg_SZ|Default|https://*MicrosoftRMSURL/_wmcs/certification*|
|HKEY_LOCAL_MACHINE\Software\Microsoft\MSDRM\ServiceLocation\EnterprisePublishing|Reg_SZ|Default|https://MicrosoftRMSURL/_wmcs/Licensing|
|HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ExchangeServer\v15\IRM\CertificationServerRedirection|Reg_SZ|https://*MicrosoftRMSURL*|One of the following, depending on whether you are using HTTP or HTTPS from your Exchange server to the RMS connector:<br /><br />http://*ConnectorFQDN*<br /><br />https://*ConnectorFQDN*|
|HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ExchangeServer\v15\IRM\LicenseServerRedirection|Reg_SZ|https://*MicrosoftRMSURL*|One of the following, depending on whether you are using HTTP or HTTPS from your Exchange server to the RMS connector:<br /><br />http://*ConnectorFQDN*<br /><br />https://*ConnectorFQDN*|

#### Table for Exchange 2010 registry settings

|Registry path|Type|Value|Data|
|-----------------|--------|---------|--------|
|HKEY_LOCAL_MACHINE\Software\Microsoft\MSDRM\ServiceLocation\Activation|Reg_SZ|Default|https://*MicrosoftRMSURL*/_wmcs/certification|
|HKEY_LOCAL_MACHINE\Software\Microsoft\MSDRM\ServiceLocation\EnterprisePublishing|Reg_SZ|Default|https://*MicrosoftRMSURL*/_wmcs/Licensing|
|HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ExchangeServer\v14\IRM\CertificationServerRedirection|Reg_SZ|https://*MicrosoftRMSURL*|One of the following, depending on whether you are using HTTP or HTTPS from your Exchange server to the RMS connector:<br /><br />http://*ConnectorFQDN*<br /><br />https://*ConnectorFQDN*|
|HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ExchangeServer\v14\IRM\LicenseServerRedirection|Reg_SZ|https://*MicrosoftRMSURL*|One of the following, depending on whether you are using HTTP or HTTPS from your Exchange server to the RMS connector:<br /><br />http://*ConnectorFQDN*<br /><br />https://*ConnectorFQDN*|

### <a name="BKMK_ConfiguringSharePoint"></a>Configuring a SharePoint server to use the connector
The following SharePoint roles communicate with the RMS connector:

-   Front-end SharePoint webservers, including those hosting the Central Administration server

To use the RMS connector, these servers running SharePoint must be running one of the following software versions:

-   SharePoint Server 2013

-   SharePoint Server 2010

A SharePoint 2013 server must also be running a version of the MSIPC client 2.1 that is supported with the RMS connector. To make sure that you have a supported version, download the latest client from the [Microsoft Download Center](http://www.microsoft.com/download/details.aspx?id=38396).

> [!WARNING]
> There are multiple versions of the MSIPC 2.1 client, so make sure that you have version 1.0.2004.0 or later.
> 
> You can verify the client version by checking the version number of MSIPC.dll, which is located in **\Program Files\Active Directory Rights Management Services Client 2.1**. The properties dialog box  shows the version number of the MSIPC 2.1 client.

These servers running SharePoint 2010 must have installed a version of the MSDRM client that includes support for RMS Cryptographic Mode 2. The minimum version that is supported in Windows Server 2008 is included in the hotfix that you can download from [RSA key length is increased to 2048 bits for AD RMS in Windows Server 2008 R2 and in Windows Server 2008](http://support.microsoft.com/kb/2627272), and the minimum version for Windows Server 2008 R2 can be downloaded from [RSA key length is increased to 2048 bits for AD RMS in Windows 7 or in Windows Server 2008 R2](http://support.microsoft.com/kb/2627273). Windows Server 2012 and Windows Server 2012 R2 natively support Cryptographic Mode 2.

##### To configure SharePoint servers to use the connector

1.  On the SharePoint servers that communicate with the RMS connector, do one of the following:

    -   Run the server configuration tool for Microsoft RMS connector. For more information, see [How to use the server configuration tool for Microsoft RMS connector](../Topic/Deploying_the_Azure_Rights_Management_Connector.md#BKMK_HowToRunTheTool) in this topic.

        For example, to run the tool locally to configure a server running SharePoint 2013:

        ```
        .\GenConnectorConfig.ps1 -ConnectorUri https://rmsconnector.contoso.com -SetSharePoint2013
        ```

    -   If you are using SharePoint 2013, make manual registry edits by using the table in the following section to manually add registry settings on the servers.

2.  Enable IRM in SharePoint. For more information, see [Configure Information Rights Management (SharePoint Server 2010)](https://technet.microsoft.com/library/hh545607%28v=office.14%29.aspx) in the SharePoint library.

    When you follow these instructions, you must configure SharePoint to use the connector by specifying **Use this RMS server**, and then enter the load-balancing connector URL that you configured. Enter the protocol prefix (HTTP:// or HTTPS://) and the name of the connector that you defined in DNS for the load balanced address of your connector. For example, if your connector name is  https://connector.contoso.com, your configuration will look like the following picture:

    ![](../Image/AzRMS_SharePointConnector.png)

    After IRM is enabled on a SharePoint farm, you can enable IRM on individual libraries by using the **Information Rights Management** option on the **Library Settings** page for each of the libraries.

    > [!IMPORTANT]
    > For SharePoint to access RMS by using the connector, you must authorize the corresponding accounts in the RMS connector administration tool. If you haven’t already done this, see [Authorizing servers to use the RMS connector](../Topic/Deploying_the_Azure_Rights_Management_Connector.md#AuthorizingServers) in this topic.

Use the table in the following section only if you want to manually add or check registry settings on a server that runs SharePoint 2013.

#### Table for SharePoint 2013 registry settings
Instructions for when you use this table:

-   *MicrosoftRMSURL* is your organization’s Microsoft RMS service URL. To find this value:

    1.  Run the [Get-AadrmConfiguration](http://msdn.microsoft.com/library/windowsazure/dn629410.aspx) cmdlet for Azure RMS. If you haven’t already installed the Windows PowerShell module for Azure RMS, see [Installing Windows PowerShell for Azure Rights Management](../Topic/Installing_Windows_PowerShell_for_Azure_Rights_Management.md).

    2.  From the output, identify the **LicensingIntranetDistributionPointUrl** value.

        For example: **LicensingIntranetDistributionPointUrl   : https://5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com/_wmcs/licensing**

    3.  From the value, remove **/_wmcs/licensing** from this string. The remaining string is your Microsoft RMS URL. In our example, the Microsoft RMS URL would be the following value:

        **https://5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com**

-   *ConnectorFQDN* is the load-balancing name that you defined in DNS for the connector. For example, **rmsconnector.contoso.com**.

-   Use the HTTPS prefix for the connector URL if you have configured the connector to use HTTPS to communicate with your on-premises servers. For more information, see the [Configuring the RMS connector to use HTTPS](../Topic/Deploying_the_Azure_Rights_Management_Connector.md#BKMK_ConfiguringHTTPS) section in this topic. The Microsoft RMS URLs always use HTTPS.

|Registry path|Type|Value|Data|
|-----------------|--------|---------|--------|
|HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSIPC\ServiceLocation\LicensingRedirection|Reg_SZ|https://*MicrosoftRMSURL*/_wmcs/licensing|One of the following, depending on whether you are using HTTP or HTTPS from your SharePoint server to the RMS connector:<br /><br />http://*ConnectorFQDN*/_wmcs/licensing<br /><br />https://*ConnectorFQDN*/_wmcs/licensing|
|HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSIPC\ServiceLocation\EnterpriseCertification|Reg_SZ|Default|One of the following, depending on whether you are using HTTP or HTTPS from your SharePoint server to the RMS connector:<br /><br />http://*ConnectorFQDN*/_wmcs/certification<br /><br />https://*ConnectorFQDN*/_wmcs/certification|
|HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSIPC\ServiceLocation\EnterprisePublishing|Reg_SZ|Default|One of the following, depending on whether you are using HTTP or HTTPS from your SharePoint server to the RMS connector:<br /><br />http://*ConnectorFQDN*/_wmcs/licensing<br /><br />https://*ConnectorFQDN*/_wmcs/licensing|

### <a name="BKMK_FileServer"></a>Configuring a file server for File Classification Infrastructure to use the connector
To use the RMS connector and File Classification Infrastructure to protect Office documents, the file server must be running one of the following operating systems:

-   Windows Server 2012 R2

-   Windows Server 2012

##### To configure file servers to use the connector

1.  On the file servers configured for File Classification Infrastructure and that will communicate with the RMS connector, do one of the following:

    -   Run the server configuration tool for Microsoft RMS connector. For more information, see [How to use the server configuration tool for Microsoft RMS connector](../Topic/Deploying_the_Azure_Rights_Management_Connector.md#BKMK_HowToRunTheTool) in this topic.

        For example, to run the tool locally to configure a file server running FCI:

        ```
        .\GenConnectorConfig.ps1 -ConnectorUri https://rmsconnector.contoso.com -SetFCI2012
        ```

    -   Make manual registry edits by using the table in the following section to manually add registry settings on the servers.

2.  Create classification rules and file management tasks to protect documents with RMS Encryption, and then specify an RMS template to automatically apply RMS policies. For more information, see [File Server Resource Manager Overview](http://technet.microsoft.com/library/hh831701.aspx) in the Windows Server documentation library.

Use the table in the following section only if you want to manually add or check registry settings on a file server that uses the File Classification Infrastructure to protect documents.

#### Table for file server and File Classification Infrastructure registry settings
Instructions for when you use this table:

-   *ConnectorFQDN* is the load-balancing name that you defined in DNS for the connector. For example, **rmsconnector.contoso.com**.

-   Use the HTTPS prefix for the connector URL if you have configured the connector to use HTTPS to communicate with your on-premises servers. For more information, see the [Configuring the RMS connector to use HTTPS](../Topic/Deploying_the_Azure_Rights_Management_Connector.md#BKMK_ConfiguringHTTPS) section in this topic. The Microsoft RMS URLs always use HTTPS.

|Registry path|Type|Value|Data|
|-----------------|--------|---------|--------|
|HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSDRM\ServiceLocation\EnterprisePublishing|Reg_SZ|Default|http://*ConnectorFQDN*/_wmcs/licensing|
|HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSDRM\ServiceLocation\Activation|Reg_SZ|Default|http://*ConnectorFQDN*/_wmcs/certification|

## <a name="BKMK_NextSteps"></a>Next steps
Now that the RMS connector is installed and configured, and your servers are configured to use it, IT administrators and users can protect and consume email message and documents by using Azure RMS. To make this easy for users, deploy the RMS sharing application, which installs an add-on for Office and adds new right-click options to File Explorer. For more information, see the [Rights Management sharing application administrator guide](http://technet.microsoft.com/library/%20dn339003%28v=ws.10%29.aspx).

In addition, you might consider the following to help you monitor the RMS connector and your organization’s usage of Azure RMS:

-   The built-in **Microsoft Rights Management connector** performance counters.

-   The [RMS Analyzer tool](https://www.microsoft.com/en-us/download/details.aspx?id=46437), using the RMS connector option to help you monitor the health of the connector and identify any configuration issues.

-   [Logging and Analyzing Azure Rights Management Usage](../Topic/Logging_and_Analyzing_Azure_Rights_Management_Usage.md)

You can use the [Azure Rights Management Deployment Roadmap](../Topic/Azure_Rights_Management_Deployment_Roadmap.md) to check whether there are other configuration steps that you might want to do before you roll out [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] to users and administrators. If there are no other configuration steps that you need to do, see [Using Azure Rights Management](../Topic/Using_Azure_Rights_Management.md) for operational guidance to support a successful deployment for your organization.

## See Also
[Configuring Azure Rights Management](../Topic/Configuring_Azure_Rights_Management.md)

