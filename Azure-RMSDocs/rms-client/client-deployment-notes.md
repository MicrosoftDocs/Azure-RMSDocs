---
# required metadata

title: RMS client deployment notes - Azure Information Protection
description: Information about installation, supported operating systems, registry settings, and service discovery for the Rights Management Service client (RMS client) version 2, also known as the MSIPC client. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 12/12/2018
ms.topic: conceptual
ms.service: information-protection
ms.assetid: 03cc8c6f-3b63-4794-8d92-a5df4cdf598f

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# RMS client deployment notes

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 7 with SP1, Windows 8, Windows 8.1, Windows 10, Windows Server 2008 R2, Windows Server 2012, Windows Server 2012 R2, Windows Server 2016*

The Rights Management Service client (RMS client) version 2 is also known as the MSIPC client. It is software for Windows computers that communicates with Microsoft Rights Management services on-premises or in the cloud to help protect access to and usage of information as it flows through applications and devices, within the boundaries of your organization, or outside  those managed boundaries. 

In addition to shipping with the [Azure Information Protection client for Windows](aip-client.md), the RMS client is available [as an optional download](https://www.microsoft.com/download/details.aspx?id=38396) that can, with acknowledgment and acceptance of its license agreement, be freely distributed with  third-party software so that clients can protect and consume content that has been protected by Rights Management services.


## Redistributing the RMS client
The RMS client can be freely redistributed and bundled with other applications and IT solutions. If you are an application developer or solution provider and want to redistribute the  RMS client, you have two options:

- Recommended: Embed the RMS client installer in your application installation and run it in silent mode (the **/quiet** switch, detailed in the next section).

- Make the RMS client a prerequisite for your application. With this option, you might need to provide users with additional instructions for them to obtain, install, and update their computers with the client before they can use your application.

## Installing the RMS client
The RMS client is contained in an installer executable file named **setup_msipc_*\<arch\>*.exe**, where *\<arch>* is either **x86** (for 32-bit client computers) or **x64** (for 64-bit client computers). The 64-bit (x64) installer package installs both a 32-bit runtime executable for compatibility with 32-bit applications that run on a 64-bit operating system installation, as well as a 64-bit runtime executable for supporting native 64-bit applications. The 32-bit (x86) installer does not run on a 64-bit Windows installation.

> [!NOTE]
> You must have elevated privileges to install the RMS client, such as a member of the Administrators group on the local computer.

You can install the  RMS client by using either of the following installation methods:

- **Silent mode.** By using the **/quiet** switch as part of the command-line options, you can silently install the  RMS client on computers. The following  example  shows a silent mode installation for the  RMS client on a 64-bit client computer:

    ```
    setup_msipc_x64.exe /quiet
    ```

- **Interactive mode.** Alternately, you can install the RMS client by using the GUI-based setup program that's provided by the  RMS Client  Installation wizard. To install interactively, double-click the  RMS client installer package (**setup_msipc_*\<arch\>*.exe**) in the folder to which it was copied or downloaded on your local computer.

## Questions and answers about the RMS client
The following section contains frequently asked questions about the RMS client and the answers to them.

### Which operating systems support the RMS client?
The RMS client is supported with the following operating systems:

|Windows Server Operating System|Windows Client Operating System|
|-----------------------------------|-----------------------------------|
|Windows Server 2016|Windows 10|
|Windows Server 2012 R2|Windows 8.1|
|Windows Server 2012|Windows 8|
|Windows Server 2008 R2|Windows 7 with minimum of SP1|


### Which processors or platforms support the  RMS client?
The  RMS client is supported on x86 and x64 computing platforms.

### Where is the  RMS client installed?
By default, the RMS client is installed in %ProgramFiles%\Active Directory Rights Management Services Client 2.\<minor version number>.

### What files  are associated with the RMS client software?
The following files  are installed as part of the  RMS client software:

-   Msipc.dll

-   Ipcsecproc.dll

-   Ipcsecproc_ssp.dll

-   MSIPCEvents.man

In addition to these files, the RMS client also installs multilingual user interface (MUI) support files in 44 languages. To verify the languages supported, run the RMS client installation and when the installation is complete, review the contents of the multilingual support folders under the default path.

### Is the RMS client included by default when I install a supported operating system?
No. This version of the  RMS client ships as an optional download that can be installed separately on computers running supported versions of the Microsoft Windows operating system.

### Is the RMS client automatically updated by Microsoft Update?
If you installed this RMS client by using the silent installation option, the RMS client inherits your current Microsoft Update settings. If you installed the RMS client by using the GUI-based setup program, the RMS client installation wizard prompts you to enable Microsoft Update.

## RMS client settings
The following section contains settings information about the RMS client. This information might be helpful if you have problems with applications or services that use the RMS client.

> [!NOTE]
> Some settings depend on whether the RMS-enlightened application runs as a client mode application (such as Microsoft Word and Outlook, or the Azure Information Protection client with Windows File Explorer), or server mode application  (such as SharePoint and Exchange). In the following tables, these settings are identified as **Client Mode** and **Server Mode**, respectively.

### Where the RMS client stores licenses on client computers
The RMS client stores licenses on the local disk and also caches some  information in the Windows registry.

|Description|Client Mode Paths|Server Mode Paths|
|---------------|---------------------|---------------------|
|License store location|%localappdata%\Microsoft\MSIPC|%allusersprofile%\Microsoft\MSIPC\Server\\*\<SID\>*|
|Template store location|%localappdata%\Microsoft\MSIPC\Templates|%allusersprofile%\Microsoft\MSIPC\Server\\*\<SID\>*|
|Registry location|HKEY_CURRENT_USER<br /> \Software<br /> \Classes<br /> \Local Settings<br /> \Software<br /> \Microsoft<br /> \MSIPC|HKEY_CURRENT_USER<br /> \Software<br /> \Microsoft<br /> \MSIPC<br /> \Server<br /> \\*\<SID*\>|

> [!NOTE]
> *\<SID*> is the secure identifier (SID) for the account under which the server application is running. For example, if the application is running under the built-in Network Service account, replace *\<SID\>* with the value of the well-known SID for that account (S-1-5-20).

### Windows registry settings for the RMS client
You can use Windows registry keys to set or modify some RMS client configurations. For example, as an administrator for RMS-enlightened applications that communicate with AD RMS servers, you might want to update the enterprise service location (override the AD RMS server that is currently selected for publishing) depending on the client computer's current location within your Active Directory topology. Or, you might  want to enable  RMS tracing at the client computer, to help troubleshoot a problem with an RMS-enlightened application. Use the following table to identify the registry settings that you can change for the RMS client.


|                                                                                                  Task                                                                                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             Settings                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|                                                  If the client is version 1.03102.0221 or later:<br /><br />**To control application data collection**                                                  | **Important**: In order to honor user privacy, you as the administrator, must ask the user for consent before enabling data collection.<br /><br />If you enable data collection, you are agreeing to send data to Microsoft over the Internet. Microsoft uses this data to provide and improve the quality, security, and integrity of Microsoft products and services. For example, Microsoft analyzes performance and reliability, such as what features you use, how quickly the features respond, device performance, user interface interactions, and any problems you experience with the product. Data also includes information about the configuration of your software, such as the software that you are currently running, and the IP address.<br /><br />For version 1.0.3356 or later: <br /><br />HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft\MSIPC<br />REG_DWORD: DiagnosticAvailability<br /><br />For versions before 1.0.3356: <br /><br />HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft\MSIPC<br />REG_DWORD: DiagnosticState<br /><br />**Value:** 0 for Application defined (default) by using the environment property [IPC_EI_DATA_COLLECTION_ENABLED](https://msdn.microsoft.com/library/hh535247(v=vs.85).aspx), 1 for Disabled, 2 for Enabled<br /><br />**Note**: If your 32-bit MSIPC-based application is running on a 64-bit version of Windows, the location is HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\MSIPC. |
|                                                       AD RMS only:<br /><br />**To update the enterprise service location for a client computer**                                                       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               Update the following registry keys:<br /><br />HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSIPC\ServiceLocation\EnterpriseCertification<br />REG_SZ: default<br /><br />**Value:**\<http or https>://*RMS_Cluster_Name*/_wmcs/Certification<br /><br />HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSIPC\ServiceLocation\EnterprisePublishing<br />REG_SZ: default<br /><br />**Value:** \<http or https>://*RMS_Cluster_Name*/_wmcs/Licensing                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
|                                                                                    **To enable and disable tracing**                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Update the following registry key:<br /><br />HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSIPC<br />REG_DWORD: Trace<br /><br />**Value:** 1 to enable tracing, 0 to disable tracing (default)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|                                                                        **To change the frequency in days to refresh templates**                                                                         |                                                                                                                                                                                                                                                                                The following registry values specify how often templates  refresh on the user’s computer if the TemplateUpdateFrequencyInSeconds value is not set.  If neither of these values are set, the default refresh interval for applications using the RMS client  (version 1.0.1784.0) to download templates is 1 day. Prior versions have a default value of every 7 days.<br /><br />**Client Mode:**<br /><br />HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\MSIPC<br />REG_DWORD: TemplateUpdateFrequency<br /><br />**Value:** An integer value that specifies the number of days (minimum of 1) between downloads.<br /><br />**Server Mode:**<br /><br />HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSIPC\Server\\<SID\><br />REG_DWORD: TemplateUpdateFrequency<br /><br />**Value:** An integer value that specifies the number of days  (minimum of 1) between downloads.                                                                                                                                                                                                                                                                                 |
| **To change the frequency in seconds to refresh templates**<br /><br />Important: If this setting is specified, the value to refresh templates in days is ignored. Specify one or the other,  not both. |                                                                                                                                                                                                                                                                   The following registry values specify how often templates  refresh on the user’s computer. If this value or the value to change the frequency in days (TemplateUpdateFrequency) is not set, the default refresh interval for applications using the RMS client (version 1.0.1784.0) to download templates is 1 day. Prior versions have a default value of every 7 days.<br /><br />**Client Mode:**<br /><br />HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\MSIPC<br />REG_DWORD: TemplateUpdateFrequencyInSeconds<br /><br />**Value:** An integer value that specifies the number of seconds (minimum of 1) between downloads.<br /><br />**Server Mode:**<br /><br />HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSIPC\Server\\<*SID*><br />REG_DWORD: TemplateUpdateFrequencyInSeconds<br /><br />**Value:** An integer value that specifies the number of seconds (minimum of 1) between downloads.                                                                                                                                                                                                                                                                    |
|                                                      AD RMS only:<br /><br />**To download templates immediately at the next publishing request**                                                       |                                                                                                                                                                                                                                                                                                                                                                                                                 During testing and evaluations, you might want the RMS client to download templates as soon as possible. For this configuration, remove the following registry key and the RMS client then downloads templates immediately at the next publishing request rather than wait for the time specified by the TemplateUpdateFrequency registry setting:<br /><br />HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\MSIPC\\<*Server Name*>\Template <br /><br />**Note**: \<*Server Name*> could have both external (corprights.contoso.com) and internal (corprights) URLs and therefore two different entries.                                                                                                                                                                                                                                                                                                                                                                                                                  |
|                                                               AD RMS only:<br /><br />**To enable support for federated authentication**                                                                |                                                                                                                                                                                                                                                                             If the RMS client computer connects to an AD RMS cluster by using a federated trust, you must configure the federation home realm.<br /><br />HKEY_LOCAL_MACHINE\Software\Microsoft\MSIPC\Federation<br />REG_SZ: FederationHomeRealm<br /><br />**Value:** The value of this registry entry is the uniform resource identifier (URI) for the federation service (for example, "<http://TreyADFS.trey.net/adfs/services/trust>").<br /><br /> **Note**: It is important that you specify http and not https for this value. In addition, if your 32-bit MSIPC-based application is running on a 64-bit version of Windows, the location is HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\MSIPC\Federation. For an example configuration, see [Deploying Active Directory Rights Management Services with Active Directory Federation Services](https://technet.microsoft.com/library/dn758110.aspx).                                                                                                                                                                                                                                                                             |
|                                        AD RMS only:<br /><br />**To support partner federation servers that require forms-based authentication for user input**                                         |                                                                                                                                                                                                                                                                                                                                                             By default, the RMS client operates in silent mode and user input is not required. Partner federation servers, however, might be configured to require user input such as by way of forms-based authentication. In this case, you must configure the RMS client to ignore silent mode so that the federated authentication form appears in a browser window and the user is promoted for authentication.<br /><br />HKEY_LOCAL_MACHINE\Software\Microsoft\MSIPC\Federation<br />REG_DWORD: EnableBrowser<br /><br />**Note**: If the federation server is configured to use forms-based authentication, this key is required. If the federation server is configured to use integrated Windows authentication, this key is not required.                                                                                                                                                                                                                                                                                                                                                             |
|                                                                      AD RMS only:<br /><br />**To  block ILS service consumption**                                                                      |                                                                                                                                                                                                                                                                                                                                                                                                                 By default, the RMS client enables consuming content protected by the ILS service but you can configure the client to block this service by setting the following registry key. If this registry key is set to block the ILS service, any attempts to open and consume content protected by the ILS service returns the following error:<br />HRESULT_FROM_WIN32(ERROR_ACCESS_DISABLED_BY_POLICY)<br /><br />HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\MSIPC<br />REG_DWORD: **DisablePassportCertification**<br /><br />**Value:** 1 to block ILS consumption, 0 to allow ILS consumption (default)                                                                                                                                                                                                                                                                                                                                                                                                                  |

### Managing template distribution for the RMS client
Templates make it easy for users and administrators to quickly apply Rights Management protection and the RMS client automatically downloads templates from its RMS servers or service. If you put the templates in the following folder location, the RMS client does not download any templates from its default location and instead, download the templates that you have put in this folder. The RMS client might continue to download templates from other available RMS servers.

**Client Mode:** %localappdata%\Microsoft\MSIPC\UnmanagedTemplates

**Server Mode:** %allusersprofile%\Microsoft\MSIPC\Server\UnmanagedTemplates\\*\<SID\>*

When you use this folder, there is no special naming convention required except that the templates should be issued by the RMS server or service and they must have the  .xml file name extension. For example, Contoso-Confidential.xml or Contoso-ReadOnly.xml are valid names.

## AD RMS only: Limiting the RMS client to use trusted AD RMS servers
The RMS client can be limited to using only specific trusted AD RMS servers by making the following changes to the Windows registry on local computers.

**To enable limiting RMS client to use only trusted AD RMS servers**

-   HKEY_LOCAL_MACHINE\Software\Microsoft\MSIPC\TrustedServers\

    REG_DWORD:AllowTrustedServersOnly

    **Value:** If a non-zero value is specified, the RMS client trusts only the specified servers that are configured in the TrustedServers list and the  Azure  Rights Management service.

**To add members to the list of trusted AD RMS servers**

-   HKEY_LOCAL_MACHINE\Software\Microsoft\MSIPC\TrustedServers\

    REG_SZ:*\<URL_or_HostName>*

    **Value:** The string values in this registry key location can be either DNS domain name format (for example, **adrms.contoso.com**) or full URLs to trusted AD RMS servers (for example, **https://adrms.contoso.com**). If a specified URL starts with **https://**, the RMS client uses SSL or TLS to contact the specified AD RMS server.

## RMS service discovery
RMS service discovery lets the RMS client check which RMS server or service to communicate with before protecting content. Service discovery might also happen when the RMS client consumes protected content, but this type of discovery is less likely to happen because the policy attached to the content contains the preferred RMS server or service. Only if those sources are unsuccessful does the client then run service discovery.

To perform service discovery, the RMS client checks the following:

1. **The Windows registry on the local computer**: If service discovery settings are configured in the registry, these settings are tried first. 

    By default, these settings are not configured in the registry but an administrator can configure them for AD RMS as documented in a [following section](#enabling-client-side-service-discovery-by-using-the-windows-registry). An administrator typically configures these settings for the Azure Rights Management service during the [migration process](../migrate-from-ad-rms-phase2.md) from AD RMS to Azure Information Protection.

2. **Active Directory Domain Services**: A domain-joined computer queries Active Directory for a service connection point (SCP). 

    If an SCP is registered as documented in the [following section](#ad-rms-only-enabling-server-side-service-discovery-by-using-active-directory), the URL of the AD RMS server is returned to the RMS client to use.

3. **The Azure Rights Management discovery service**: The RMS client connects to **https://discover.aadrm.com**, which prompts the user to authenticate.

    When authentication is successful, the user name (and domain) from the authentication is used to identify the Azure Information Protection tenant to use. The Azure Information Protection URL to use for that user account is returned to the RMS client. The URL is in the following format: **https://**\<YourTenantURL\>**/_wmcs/licensing** 

    For example:  5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com/_wmcs/licensing

    *\<YourTenantURL\>* has the following format: **{GUID}.rms.[Region].aadrm.com**.You can find this value by identifying the **RightsManagementServiceId** value when you run the [Get-AadrmConfiguration](/powershell/module/aadrm/get-aadrmconfiguration) cmdlet for Azure RMS.

> [!NOTE]
> There are four important exceptions for this service discovery flow:
> 
> - Mobile devices are best suited to use a cloud service, so by default they use service discovery for the Azure Rights Management service (https://discover.aadrm.com). To override this default so that mobile devices use AD RMS rather than the Azure Rights Management service, specify SRV records in DNS and install the mobile device extension as documented in [Active Directory Rights Management Services Mobile Device Extension](https://technet.microsoft.com/library/dn673574\(v=ws.11\).aspx). 
>
> - When the Rights Management service is invoked by an Azure Information Protection label, service discovery is not performed. Instead, the URL is specified directly in the label setting that is configured in the Azure Information Protection policy. 
>  
> - When a user initiates sign in from an Office application, the user name (and domain) from the authentication is used to identify the Azure Information Protection tenant to use. In this case, registry settings are not needed and the SCP is not checked.
> 
> - When you have configured [DNS redirection](../migrate-from-ad-rms-phase3.md#client-reconfiguration-by-using-dns-redirection) for Office 2016 click-to-run desktop apps, the RMS client finds the Azure Rights Management service by being denied access to the AD RMS cluster that it previously found. This deny action triggers the client to look for the SRV record, which redirects the client to the Azure Rights Management service for your tenant. This SRV record also lets Exchange Online decrypt emails that have been protected by your AD RMS cluster. 

### AD RMS only: Enabling server-side service discovery by using Active Directory
If your account has  sufficient privileges (Enterprise Admins and  local administrator for the AD RMS server), you can automatically register a service connection point (SCP) when you install the AD RMS root cluster server. If an SCP already exists in the forest, you must first delete the existing SCP before you can register  a new one.

You can register and delete an SCP after AD RMS is installed by using the following procedure. Before you start, make sure that your account has the required privileges (Enterprise Admins and local administrator for the AD RMS server).

#### To enable AD RMS service discovery by registering an SCP in Active Directory

1.  Open the Active Directory Management Services console at the AD RMS server:

    - For Windows Server 2012 R2 or Windows Server 2012, in Server Manager, select **Tools** > **Active Directory Rights Management Services**.

    - For Windows Server 2008 R2, select **Start** > **Administrative Tools** > **Active Directory Rights Management Services**.

2.  In the AD RMS console, right-click the AD RMS cluster, and then click **Properties**.

3.  Click the **SCP** tab.

4.  Select the **Change SCP** check box.

5.  Select the **Set SCP to current certification cluster** option, and then click **OK**.

### Enabling client-side service discovery by using the Windows registry
As an alternative to using an SCP or where an SCP does not exist, you can configure the registry on the client computer so that the RMS client can locate its AD RMS server.

#### To enable client-side AD RMS service discovery by using the Windows registry

1. Open the Windows registry editor, Regedit.exe:

    - On the client computer, in the Run window, type **regedit**, and then press Enter to open the Registry Editor.

2. In Registry Editor, navigate to **HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSIPC**.

    > [!NOTE]
    > If you are running a 32-bit application on a 64-bit computer, navigate to **HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\MSIPC**

3. To create the ServiceLocation subkey, right-click **MSIPC**, point to **New**, click **Key**, and then type **ServiceLocation**.

4. To create the EnterpriseCertification subkey, right-click **ServiceLocation**, point to **New**, click **Key**, and then type **EnterpriseCertification**.

5. To set the enterprise certification URL, double-click the **(Default)** value, under the **EnterpriseCertification** subkey. When the **Edit String** dialog box appears, for **Value data**, type `<http or https>://<AD RMS_cluster_name>/_wmcs/Certification`, and then click **OK**.

6. To create the EnterprisePublishing subkey, right-click **ServiceLocation**, point to **New**, click **Key**, and then type `EnterprisePublishing`.

7. To set the enterprise publishing URL, double-click **(Default)** under the **EnterprisePublishing** subkey. When the **Edit String** dialog box appears, for **Value data**, type `<http or https>://<AD RMS_cluster_name>/_wmcs/Licensing`, and then click **OK**.

8.  Close Registry Editor.

If the RMS client can't find an SCP by querying Active Directory and it's not specified in the registry, service discovery calls for AD RMS fails.

### Redirecting licensing server traffic
In some cases, you might need to redirect traffic during service discovery, for example, when two organizations are merged and the old licensing server in one organization is retired and clients need to be redirected to a new licensing server. Or, you migrate from AD RMS to Azure RMS. To enable licensing redirection, use the following procedure.

#### To enable RMS licensing redirection by using the Windows registry

1.  Open the Windows registry editor, Regedit.exe.

2.  In Registry Editor, navigate to one of the following:

    -   For 64-bit version of Office on x64 platform: HKLM\SOFTWARE\Microsoft\MSIPC\Servicelocation

    -   For 32-bit version of Office on x64 platform: HKLM\SOFTWARE\Wow6432Node\Microsoft\MSIPC\Servicelocation

3.  Create a LicensingRedirection subkey, by right-clicking **Servicelocation**, point to **New**, click **Key**, and then type **LicensingRedirection**.

4.  To set the licensing redirection, right-click the **LicensingRedirection** subkey, select **New**, and then select **String value**.  For **Name**, specify the previous server licensing URL and for **Value** specify the new server licensing URL.

    For example, to redirect licensing from a server at Contoso.com to one at Fabrikam.com, you might enter the following values:

    **Name:** `https://contoso.com/_wmcs/licensing`

    **Value:** `https://fabrikam.com/_wmcs/licensing`

    > [!NOTE]
    > If the old licensing server has both intranet and extranet URLs specified, a new name and value mapping must be set for both these URLs under the **LicensingRedirection** key.

5.  Repeat the previous step for all servers that need to be redirected.

6.  Close Registry Editor.

