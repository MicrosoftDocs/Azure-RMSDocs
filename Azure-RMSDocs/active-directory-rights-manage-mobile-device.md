---
# required metadata

title: Active Directory rights management services mobile device extension for AIP
description: Learn about Active Directory mobile device extensions for AIP
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 07/28/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection


# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Active Directory Rights Management Services Mobile Device Extension

> [!NOTE]
> We're retiring the RMS sharing app for MacOS and the Azure Information Protection app for iOS and Android starting May 30, 2025, and ending May 30, 2026. Instead, we recommend opening protected non-Office files in other productivity apps.
> 
> For more information, see the blog post announcement [Retirement notification for the Azure Information Protection mobile viewer and RMS Sharing App](https://techcommunity.microsoft.com/blog/microsoft-security-blog/retirement-notification-for-the-azure-information-protection-mobile-viewer-and-r/4416663).

You can download the Active Directory Rights Management Services (AD RMS) mobile device extension from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=43738) and install this extension on top of an existing AD RMS deployment. This lets users  protect and consume sensitive data when their device supports the latest API-enlightened apps. For example, users can do the following on their mobile devices:

- Use the Azure Information Protection app to consume protected text files in different formats (including .txt, .csv, and .xml).
- Use the Azure Information Protection app  to consume protected image files (including .jpg, .gif, and .tif).
- Use the Azure Information Protection app to open any file that has been generically protected (.pfile format).
- Use the Azure Information Protection app to open an Office file (Word, Excel, PowerPoint) that is a PDF copy (.pdf and .ppdf format).
- Use the Azure Information Protection app to open protected email messages (.rpmsg) and protected PDF files on Microsoft SharePoint.
- Use an AIP-enlightened PDF viewer for cross-platform viewing or to open PDF files that were protected with any AIP-enlightened application.
- Use your internally developed AIP-enlightened apps that were written by using the [MIP SDK](/information-protection/develop/).

> [!NOTE]
> You can download the Azure Information Protection app from the [Microsoft Rights Management](https://go.microsoft.com/fwlink/?linkid=303970) page of the Microsoft website. For information about other apps that are supported with the mobile device extension, see the table in the [Applications](./requirements-applications.md) page from this documentation. For more information about the different file types that RMS supports, see the [Supported file types and file name extensions](/rights-management/rms-client/sharing-app-admin-guide-technical#supported-file-types-and-file-name-extensions) section from the Rights Management sharing application administrator guide.

> [!IMPORTANT]
> Be sure to read and configure the prerequisites before you install the mobile device extension.

For additional information, download the "Microsoft Azure Information Protection" white paper and accompanying scripts from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=40333).

## Prerequisites for AD RMS mobile device extension

Before you install the AD RMS mobile device extension, make sure the following dependencies are in place.


|Requirement|More information|
|---------------|------------------------|
|An existing AD RMS deployment on Windows Server 2019, 2016, 2012 R2, or 2012, that includes the following:<br /><br /> - Your AD RMS cluster must be accessible from the Internet. <br /><br /> - AD RMS must be using a full Microsoft SQL Server-based database on a separate server and not the Windows Internal Database that is often used for testing on the same server. <br /><br />- The account that you will use to install the mobile device extension must have sysadmin rights for the SQL Server instance that you're using for AD RMS. <br /><br />- The AD RMS servers must be configured to use SSL/TLS with a valid x.509 certificate that is trusted by the mobile device clients.<br /><br /> - If the AD RMS servers are behind a firewall or published by using a reverse proxy, in addition to publishing the **/_wmcs** folder to the Internet, you must also publish the /my folder (for example: **_https:\/\/RMSserver.contoso.com/my**).|For details about AD RMS prerequisites and deployment information, see the prerequisites section of this article.|
|AD FS deployed on your Windows Server:<br /><br /> - Your AD FS server farm must be accessible from the Internet (you have deployed federation server proxies). <br /><br />- Forms-based authentication is not supported; you must use Windows Integrated Authentication <br /><br /> **Important**: AD FS must be running a different computer from the computer running AD RMS and the mobile device extension.|For documentation about AD FS, see the [Windows Server AD FS Deployment Guide](/office365/troubleshoot/active-directory/set-up-adfs-for-single-sign-on) in the Windows Server library.<br /><br /> AD FS must be configured for the mobile device extension. For instructions, see the **Configuring AD FS for the AD RMS mobile device extension** section in this topic.|
|Mobile devices must trust the PKI certificates on the RMS server (or servers)|When you purchase your server certificates from a public CA, such as VeriSign or Comodo, it's likely that mobile devices will already trust the root CA for these certificates, so that these devices will trust the server certificates without addition configuration.<br /><br /> However, if you use your own internal CA to deploy the server certificates for RMS, you must take additional steps to install the root CA certificate on the mobile devices. If don't do this, mobile devices will not be able to establish a successful connection with the RMS server.|
|SRV records in DNS|Create one or more SRV records in your company domain or domains:<br /><br />1: Create a record for each email domain suffix that users will use <br /><br />2: Create a record for every FQDN used by your RMS clusters to protect content, not including the cluster name <br /><br />These records must be resolvable from any network that the connecting mobile devices use, which includes the intranet if your mobile devices connect via the intranet.<br /><br /> When users supply their email address from their mobile device, the domain suffix is used to identify whether they should use an AD RMS infrastructure or Azure AIP. When the SRV record is found, clients are redirected to the AD RMS server that responds to that URL.<br /><br /> When users consume protected content with a mobile device, the client application looks in DNS for a record that matches the FQDN in the URL of the cluster that protected the content (without the cluster name). The device is then directed to the AD RMS cluster specified in the DNS record and acquires a license to open the content. In most cases, the RMS cluster will be the same RMS cluster that protected the content.<br /><br /> For information about how to specify the SRV records, see the **Specifying the DNS SRV records for the AD RMS mobile device extension** section in this topic.|
|Supported clients using applications that are developed by using the MIP SDK for this platform. |Download the supported apps for the devices that you use by using the links on the [Microsoft Azure Information Protection](https://www.microsoft.com/download/details.aspx?id=40333) download page.|

### Configuring AD FS for the AD RMS mobile device extension

You must first configure AD FS, and then authorize the AIP app for the devices that you want to use.

#### Step 1: To configure AD FS

- You can either run a Windows PowerShell script to automatically configure AD FS to support the AD RMS mobile device extension, or you can manually specify the configuration options and values:
    - To automatically configure AD FS for the AD RMS mobile device extension, copy and paste the following into a Windows PowerShell script file, and then run it:

```powershell
# This Script Configures the Microsoft Rights Management Mobile Device Extension and Claims used in the ADFS Server

# Check if Microsoft Rights Management Mobile Device Extension is configured on the Server
$CheckifConfigured = Get-AdfsRelyingPartyTrust -Identifier "api.rms.rest.com"
if ($CheckifConfigured)
{
Write-Host "api.rms.rest.com Identifer used for Microsoft Rights Management Mobile Device Extension is already configured on this Server"
Write-Host $CheckifConfigured
}
else
{
Write-Host "Configuring  Microsoft Rights Management Mobile Device Extension "

# TransformaRules used by Microsoft Rights Management Mobile Device Extension
# Claims: E-mail, UPN and ProxyAddresses
$TransformRules = @"
@RuleTemplate = "LdapClaims"
@RuleName = "Jwt Token"
c:[Type ==
"http://schemas.microsoft.com/ws/2008/06/identity/claims/windowsaccountname",
Issuer == "AD AUTHORITY"]
 => issue(store = "Active Directory", types =
("http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress",
"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/upn",
"http://schemas.xmlsoap.org/claims/ProxyAddresses"), query =
";mail,userPrincipalName,proxyAddresses;{0}", param = c.Value);

@RuleTemplate = "PassThroughClaims"
@RuleName = "JWT pass through"
c:[Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress"]
 => issue(claim = c);

@RuleTemplate = "PassThroughClaims"
@RuleName = "JWT pass through"
c:[Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/upn"]
 => issue(claim = c);

@RuleTemplate = "PassThroughClaims"
@RuleName = "JWT pass through Proxy addresses"
c:[Type == "http://schemas.xmlsoap.org/claims/ProxyAddresses"]
 => issue(claim = c);
"@

# AuthorizationRules used by Microsoft Rights Management Mobile Device Extension
# Allow All users
$AuthorizationRules = @"
@RuleTemplate = "AllowAllAuthzRule"
 => issue(Type = "http://schemas.microsoft.com/authorization/claims/permit",
Value = "true");
"@

# Add a Relying Part Truest with Name -"Microsoft Rights Management Mobile Device Extension" Identifier "api.rms.rest.com"
Add-ADFSRelyingPartyTrust -Name "Microsoft Rights Management Mobile Device Extension" -Identifier "api.rms.rest.com" -IssuanceTransformRules $TransformRules -IssuanceAuthorizationRules  $AuthorizationRules

Write-Host "Microsoft Rights Management Mobile Device Extension Configured"
}
```

- To manually configure AD FS for the AD RMS mobile device extension, use these settings:

|**Configuration**|**Value**|
|-----|-----|
|**Relying Party Trust**|_api.rms.rest.com|
|**Claim rule**|**Attribute store**: Active Directory <br /><br />**E-mail addresses**: E-mail-address<br /><br>**User-Principal-Name**: UPN<br /><br /> **Proxy-Address**: _https:\/\/schemas.xmlsoap.org/claims/ProxyAddresses|

> [!TIP]
> For step-by-step instructions for an example deployment of AD RMS with AD FS, see [Deploying Active Directory Rights Management Services with Active Directory Federation Services](/office365/troubleshoot/active-directory/set-up-adfs-for-single-sign-on).

#### Step 2: Authorize apps for your devices

- Run the following Windows PowerShell command after replacing the variables to add support for the **Azure Information Protection** app. Make sure to run both commands in the order shown:


```powershell
Add-AdfsClient -Name "R<your application name> " -ClientId "<YOUR CLIENT ID >" -RedirectUri @("<YOUR REDIRECT URI >")
```
```powershell
Grant-AdfsApplicationPermission -ClientRoleIdentifier '<YOUR CLIENT ID>' -ServerRoleIdentifier api.rms.rest.com -ScopeNames "openid"
```

**Powershell Example**
```powershell
Add-AdfsClient -Name "Fabrikam application for MIP" -ClientId "96731E97-2204-4D74-BEA5-75DCA53566C3" -RedirectUri @("com.fabrikam.MIPAPP://authorize")
```
```powershell
Grant-AdfsApplicationPermission -ClientRoleIdentifier '96731E97-2204-4D74-BEA5-75DCA53566C3' -ServerRoleIdentifier api.rms.rest.com -ScopeNames "openid"
```

- For the **Azure Information Protection unified labeling client**, run the following Windows PowerShell command to add support for the Azure Information Protection client on your devices:

```powershell
Add-AdfsClient -Name "Azure Information Protection Client" -ClientId "c00e9d32-3c8d-4a7d-832b-029040e7db99" -RedirectUri @("com.microsoft.azip://authorize")
Grant-AdfsApplicationPermission -ClientRoleIdentifier "c00e9d32-3c8d-4a7d-832b-029040e7db99" -ServerRoleIdentifier api.rms.rest.com -ScopeName "openid"
```
- To support **ADFS on Windows 2016 and 2019** and **ADRMS MDE** for third party products, run the following Windows PowerShell command:

```powershell
Add-AdfsClient -Name "YOUR APP" -ClientId 'YOUR CLIENT ID' -RedirectUri @("YOUR REDIRECT") 
Grant-AdfsApplicationPermission -ClientRoleIdentifier 'YOUR CLIENT ID' -ServerRoleIdentifier api.rms.rest.com -ScopeNames "openid"
```

To configure the AIP client on **Windows**, **Mac**, mobile and **Office Mobile** for **consuming HYOK or AD RMS protected content** with **AD FS on Windows Server 2012 R2 and newer**, use the following: 

- For Mac devices (using the RMS sharing app), make sure to run both commands in the order shown:

```powershell
Add-AdfsClient -Name "RMS Sharing App for macOS" -ClientId "96731E97-2204-4D74-BEA5-75DCA53566C3" -RedirectUri @("com.microsoft.rms-sharing-for-osx://authorize")
```
```powershell
Grant-AdfsApplicationPermission -ClientRoleIdentifier '96731E97-2204-4D74-BEA5-75DCA53566C3' -ServerRoleIdentifier api.rms.rest.com -ScopeNames "openid"
```

- For iOS devices (using the Azure Information Protection app), make sure to run both commands in the order shown:
```powershell
Add-AdfsClient -Name "Azure Information Protection app for iOS" -ClientId "9D7590FB-9536-4D87-B5AA-FAA863DCC3AB" -RedirectUri @("com.microsoft.rms-sharing-for-ios://authorize")
```

```powershell
Grant-AdfsApplicationPermission -ClientRoleIdentifier '9D7590FB-9536-4D87-B5AA-FAA863DCC3AB' -ServerRoleIdentifier api.rms.rest.com -ScopeNames "openid"
```

- For Android devices (using the Azure Information Protection app), make sure to run both commands in the order shown:
```powershell
Add-AdfsClient -Name "Azure Information Protection app for Android" -ClientId "ECAD3080-3AE9-4782-B763-2DF1B1373B3A" -RedirectUri @("com.microsoft.rms-sharing-for-android://authorize")
```
```powershell
Grant-AdfsApplicationPermission -ClientRoleIdentifier 'ECAD3080-3AE9-4782-B763-2DF1B1373B3A' -ServerRoleIdentifier api.rms.rest.com -ScopeNames "openid"
```

Run the following PowerShell commands to add support for Microsoft Office apps on your devices:
- For Mac, iOS, Android devices (make sure to run both commands in the order shown):

```powershell
Add-AdfsClient –Name "Office for Mac and Office Mobile" –ClientId "d3590ed6-52b3-4102-aeff-aad2292ab01c" –RedirectUri @("urn:ietf:wg:oauth:2.0:oob")
```

```powershell
Set-AdfsClient -TargetClientId d3590ed6-52b3-4102-aeff-aad2292ab01c -RedirectUri "urn:ietf:wg:oauth:2.0:oob","launch-word://com.microsoft.Office.Word","launch-excel://com.microsoft.Office.Excel","launch-ppt://com.microsoft.Office.Powerpoint"
```


```powershell
Grant-AdfsApplicationPermission -ClientRoleIdentifier d3590ed6-52b3-4102-aeff-aad2292ab01c -ServerRoleIdentifier api.rms.rest.com -ScopeNames "openid"
```

### Specifying the DNS SRV records for the AD RMS mobile device extension

You must create DNS SRV records for each email domain that your users use. If all your users use child domains from a single parent domain, and all users from this contiguous namespace use the same RMS cluster, you can use just one SRV record in the parent domain, and RMS will find the appropriate DNS records.
The SRV records have the following format: `_rmsdisco._http._tcp.<emailsuffix> <portnumber> <RMSClusterFQDN>`

> [!NOTE]
> Specify 443 for the \<portnumber>. Although can you specify a different port number in DNS, devices using the mobile device extension will always use 443.

For example, if your organization has users with the following email addresses:
- _user@contoso.com
  - _user@sales.contoso.com
  - _user@fabrikam.com
If there are no other child domains for _contoso.com that use a different RMS cluster than the one named _rmsserver.contoso.com, create two DNS SRV records that have these values:
- _rmsdisco._http._tcp.contoso.com 443 _rmsserver.contoso.com
- _rmsdisco._http._tcp.fabrikam.com 443 _rmsserver.contoso.com

If you use the DNS Server role on Windows Server, use the following tables as a guide for the SRV record properties in the DNS Manager console:

|Field|Value|
|------|------|
|Domain|_tcp.contoso.com
|Service|_rmsdisco
|Protocol|_http
|Priority|0
|Weight|0
|Port number|443
|Host offering this service|_rmsserver.contoso.com

|Field|Value|
|------|------|
|Domain|_tcp.fabrikam.com
|Service|_rmsdisco
|Protocol|_http
|Priority|0
|Weight|0
|Port number|443
|Host offering this service|_rmsserver.contoso.com|

In addition to these DNS SRV records for your email domain, you must create another DNS SRV record in the RMS cluster domain. This record must specify the FQDNs of your RMS cluster that protects content. Every file that is protected by RMS includes a URL to the cluster that protected that file. Mobile devices use the DNS SRV record and the URL FQDN specified in the record to find the corresponding RMS cluster that can support mobile devices.

For example, if your RMS cluster is **_rmsserver.contoso.com**, create a DNS SRV record that has the following values: **_rmsdisco._http._tcp.contoso.com 443 _rmsserver.contoso.com**

If you use the DNS Server role on Windows Server, use the following table as a guide for the SRV record properties in the DNS Manager console:

|Field|Value|
|------|------|
|Domain|_tcp.contoso.com
|Service|_rmsdisco
|Protocol|_http
|Priority|0
|Weight|0
|Port number|443
|Host offering this service|_rmsserver.contoso.com|

## Deploying the AD RMS mobile device extension

Before you install the AD RMS mobile device extension, make sure that the prerequisites from the preceding section are in place, and that you know the URL of your AD FS server. Then do the following:

1. Download the AD RMS mobile device extension (ADRMS.MobileDeviceExtension.exe) from the Microsoft Download Center.
1. Run **ADRMS.MobileDeviceExtension.exe** to start the Active Directory Rights Management Services Mobile Device Extension Setup Wizard.
When prompted, enter the URL of the AD FS server that you configured previously.
1. Complete the wizard.

Run this wizard on all the nodes in your RMS cluster.

If you have a proxy server between the AD RMS cluster and the AD FS servers, by default, your AD RMS cluster will not be able to contact the federated service. When this happens, AD RMS will be unable to verify the token that is received from the mobile client and will reject the request. If you have proxy server that blocks this communication, you must update the web.config file from the AD RMS mobile device extension website, so that AD RMS can bypass the proxy server when it needs to contact the AD FS servers.

#### Updating proxy settings for the AD RMS mobile device extension

1. Open the web.config file that is located in **\Program Files\Active Directory Rights Management Services Mobile Device Extension\Web Service**.

1. Add the following node to the file:

    ```PowerShell
       <system.net>
        <defaultProxy>
            <proxy  proxyaddress="http://<proxy server>:<port>"
                    bypassonlocal="true"
            />
            <bypasslist>
                <add address="<AD FS URL>" />
            </bypasslist>
        </defaultProxy>
    <system.net>
    ```
1. Make the following changes, and then save the file:
    - Replace \<proxy-server> with the name or address of your proxy server.
    - Replace \<port> with the port number that the proxy server is configured to use.
    - Replace \<AD FS URL> with the URL of the federation service. Do not include the HTTP prefix.

    > [!NOTE]
    > To learn more about overriding the proxy settings, see [Proxy Configuration](/dotnet/framework/network-programming/proxy-configuration) documentation.

1. Reset IIS, for example, by running **iisreset** as an administrator from a command prompt.

Repeat this procedure on all the nodes in your RMS cluster.
