---
title: Active Directory Rights Management Services Mobile Device Extension
ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.assetid: a69ead9d-7dd3-4b38-9830-4728e9757341
author: Cabailey
robots: noindex,nofollow
---
# Active Directory Rights Management Services Mobile Device Extension
The Active Directory Rights Management Services (AD RMS) mobile device extension runs on top of an existing AD RMS deployment. This lets users who have mobile devices protect and consume sensitive data when their device supports the latest RMS client and uses RMS-enlightened apps. For example, users on these device can do the following:

-   Use the RMS sharing app to consume protected text files in different formats (including .txt, .csv, and .xml).

-   Use the RMS sharing app to consume protected image files (including .jpg, .gif, and .tif.

-   Use the RMS sharing app to open any file that have been generically protected (.pfile format).

-   Use the RMS sharing app to protect image files on the device.

-   Use an RMS-enlightened PDF viewer for mobile devices to open PDF files that were protected with the RMS sharing application for Windows, or another RMS-enlightened application.

-   Use other apps from software vendors who provide RMS-enlightened apps that support file types that natively support RMS.

-   Use your internally developed RMS-enlightened apps that were written by using the RMS SDK.

> [!NOTE]
> You can download the RMS sharing app from the [Microsoft Rights Management](http://go.microsoft.com/fwlink/?LinkId=303970) page on the Microsoft website.
> 
> For more information about the different file types that RMS supports, see the [Supported file types and file name extensions](http://technet.microsoft.com/library/dn339003.aspx) section in the Rights Management sharing application administrator guide.

You don’t need the mobile device extension to consume or author protected email on devices if they use mail applications that support Exchange ActiveSync IRM. This native support for RMS and mobile devices was introduced with Exchange 2010 Service Pack 1.

Use the following sections to deploy the Active Directory Rights Management Services (AD RMS) mobile device extension:

-   [Prerequisites for the AD RMS mobile device extension](../Topic/Active-Directory-Rights-Management-Services-Mobile-Device-Extension.md#BKMK_Preqs)

    -   [Configuring AD FS for the AD RMS mobile device extension](../Topic/Active-Directory-Rights-Management-Services-Mobile-Device-Extension.md#BKMK_ADFS)

    -   [Configuring AD FS for the AD RMS mobile device extension](../Topic/Active-Directory-Rights-Management-Services-Mobile-Device-Extension.md#BKMK_ADFS)

-   [Specifying the DNS SRV records for the AD RMS mobile device extension](../Topic/Active-Directory-Rights-Management-Services-Mobile-Device-Extension.md#BKMK_SRV)

-   [Deploying the AD RMS mobile device extension](../Topic/Active-Directory-Rights-Management-Services-Mobile-Device-Extension.md#BKMK_Deploy)

## <a name="BKMK_Preqs"></a>Prerequisites for the AD RMS mobile device extension
Before you install the AD RMS mobile device extension, make sure that these dependencies are in place.

|Requirement|More information|
|---------------|--------------------|
|An existing AD RMS deployment on Windows Server 2012 R2 or Windows Server 2012. **Note:** AD RMS must be using a full Microsoft SQL Server-based database on a separate server and not the Windows Internal Database that is often used for testing on the same server.|For documentation about AD RMS, see [Active Directory Rights Management Services](http://technet.microsoft.com/library/hh831364.aspx) in the Windows Server library.|
|AD FS deployed on Windows Server 2012 R2|For documentation about AD FS, see [Windows Server 2012 R2 AD FS Deployment Guide](http://technet.microsoft.com/library/dn486820.aspx) in the Windows Server library.<br /><br />AD FS must be configured for the mobile device extension. For instructions, see the [Configuring AD FS for the AD RMS mobile device extension](../Topic/Active-Directory-Rights-Management-Services-Mobile-Device-Extension.md#BKMK_ADFS) section in this topic.|
|SRV records in DNS|Create one or more SRV records in your company domain or domains:<br /><br />-   One record for each email domain suffix that users will use<br />-   One record for every FQDN used by your RMS clusters to protect content<br /><br />When users supply their email address from their mobile device, the domain suffix is used to identify whether they should use an AD RMS infrastructure or Azure RMS. When the SRV record is found, clients are redirected to the AD RMS server that responds to that URL.<br /><br />When users consume protected content with a mobile device, the client application looks in DNS for a record that matches the FQDN in the URL of the cluster that protected the content. The device is then directed to the AD RMS cluster specified in the DNS record and acquires a license to open the content. In most cases, the RMS cluster will be the same RMS cluster that protected the content.<br /><br />For information about how to specify the SRV records, see the [Specifying the DNS SRV records for the AD RMS mobile device extension](../Topic/Active-Directory-Rights-Management-Services-Mobile-Device-Extension.md#BKMK_SRV) section in this topic.|
|Currently supported clients:<br /><br />-   Android devices using the latest version of the RMS sharing app for Android|Minimum version of Android 4.0.3.<br /><br />Download the RMS sharing app for Android from the [Microsoft Connect site](https://connect.microsoft.com/site1170/Downloads) and sideload it onto the device.|

### <a name="BKMK_ADFS"></a>Configuring AD FS for the AD RMS mobile device extension
You must first configure AD FS, and then authorize the RMS sharing app for Android.

##### Step 1: To configure AD FS

-   You can either run a Windows PowerShell script to automatically configure AD FS to support the AD RMS mobile device extension, or you can manually specify the configuration options and values:

    -   To automatically configure AD FS, copy and paste the following into a Windows PowerShell script file, and then run it:

        ```
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

    -   To manually configure AD FS, use these settings:

        |Configuration|Value|
        |-----------------|---------|
        |**Relying Party Trust**|api.rms.rest.com|
        |**Claim rule**|**Attribute store**:  Active Directory<br /><br />**E Mail-Addresses**:  E-Mail-Address<br /><br />**User-Principal-Name**:  UPN<br /><br />**Proxy-Address**:  https://schemas.xmlsoap.org/claims/ProxyAddresses|

##### Step 2: Authorize the RMS sharing app for Android

-   Run the following Windows PowerShell command to add support for Android devices:

    ```
    Add-AdfsClient -Name "RMSsharingAndroid" -ClientId "com.microsoft.ipviewer" -RedirectUri @("com.microsoft.ipviewer://authorize")
    ```

### <a name="BKMK_SRV"></a>Specifying the DNS SRV records for the AD RMS mobile device extension
You must create DNS SRV records for each email domain that your users use. If all your users use child domains from a single parent domain, and all users from this contiguous namespace use the same RMS cluster, you can use just one SRV record in the parent domain, and RMS will find the appropriate DNS records.

The SRV records have the following format: _rmsdisco._http._tcp. *&lt;emailsuffix&gt;**&lt;portnumber&gt;**&lt;RMSClusterFQDN&gt;*

For example, if your organization has users with the following email addresses:

-   user@contoso.com

-   user@sales.contoso.com

-   user@fabrikam.com

- and there are no other child domains for contoso.com that use a different RMS cluster than the one named **rmsserver.contoso.com**, create two DNS SRV records that have these values:

-   _rmsdisco._http._tcp.contoso.com 443 rmsserver.contoso.com

-   _rmsdisco._http._tcp.fabrikam.com 443 rmsserver.contoso.com

In addition to these DNS SRV records for your email domains, you must create another DNS SRV record in the user domains. This record must specify the URLs of your RMS cluster that protects content. Every file that is protected by RMS includes a URL to the cluster that protected that file. Mobile devices use the DNS SRV record and the URL FQDN specified in the record to find the corresponding RMS cluster that can support mobile devices.

For example, if your RMS cluster is **rmsserver.contoso.com**, create a DNS SRV record that has the following values: **_rmsdisco._http._tcp.rmsserver.contoso.com 443 rmsserver.contoso.com**

## <a name="BKMK_Deploy"></a>Deploying the AD RMS mobile device extension
Before you install the AD RMS mobile device extension, make sure that the prerequisites from the preceding section are first in place, and that you know the URL of your AD FS server. Then do the following:

1.  Download the AD RMS mobile device extension from the [Microsoft Connect site](http://go.microsoft.com/fwlink/?LinkId=397245).

2.  Run Setup.exe to start the Active Directory Rights Management Services Mobile Device Extension Setup Wizard.

3.  When prompted, enter the URL of the AD FS server that you configured previously.

4.  Complete the wizard.

Run this wizard on all the nodes in your RMS cluster.

