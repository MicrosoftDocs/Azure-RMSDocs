---
title: Configuring Applications for Azure Rights Management
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: ea09cbc5-b98b-444e-8b60-5bc3cb199c36
author: Cabailey
---
# Configuring Applications for Azure Rights Management
> [!NOTE]
> This information is for IT administrators and consultants who have deployed Azure Rights Management. If you are looking for user help and information about how to use Rights Management for a specific application or how to open a file that is rights-protected, use the help and guidance that accompanies your application.
> 
> For example, for Office applications, click the Help icon and enter search terms such as **Rights Management** or **IRM**. For the RMS sharing application for Windows, see the [Rights Management sharing application user guide](http://technet.microsoft.com/library/dn339006.aspx).

After you have deployed Azure Rights Management (Azure RMS) for your organization, use the following information to configure applications and services to support Azure RMS. These include Office applications such as Word 2013 and Word 2010, and services such as Exchange Online (transport rules, data loss prevention, do not forward, and message encryption) and SharePoint Online (protected libraries). For information about how these applications and services support Rights Management, see [How Applications Support Azure Rights Management](../Topic/How_Applications_Support_Azure_Rights_Management.md).

> [!IMPORTANT]
> For information about supported versions and other requirements, see [Requirements for Azure Rights Management](../Topic/Requirements_for_Azure_Rights_Management.md).

-   [Office 365: Configuration for clients and online services](../Topic/Configuring_Applications_for_Azure_Rights_Management.md#BKMK_O365)

    -   [Exchange Online: IRM Configuration](../Topic/Configuring_Applications_for_Azure_Rights_Management.md#BKMK_ExchangeOnline)

    -   [SharePoint Online and OneDrive for Business: IRM Configuration](#BKMK_SharePointOnline)

-   [Office 2016 and Office 2013: Configuration for clients](#BKMK_Office2013Configuration)

-   [Office 2010: Configuration for clients](../Topic/Configuring_Applications_for_Azure_Rights_Management.md#BKMK_Office2010Configuration)

-   [Rights Management sharing application: Installation and configuration for clients](../Topic/Configuring_Applications_for_Azure_Rights_Management.md#BKMK_SharingApp)

    -   [The RMS sharing application for Windows: Installation and configuration](../Topic/Configuring_Applications_for_Azure_Rights_Management.md#BKMK_SharingAppforWindows)

    -   [The RMS sharing application for mobile platforms: Installation and management](../Topic/Configuring_Applications_for_Azure_Rights_Management.md#BKMK_SharingAppMovileDevices)

-   [Other applications that support the RMS APIs: Installation and configuration](../Topic/Configuring_Applications_for_Azure_Rights_Management.md#BKMK_RMSAPIs)

To configure on-premises servers such as Exchange Server and SharePoint Server, see [Deploying the Azure Rights Management Connector](../Topic/Deploying_the_Azure_Rights_Management_Connector.md).

> [!TIP]
> For high-level examples and screenshots of applications configured to use Azure RMS, see the [Azure RMS in action: What administrators and users see](../Topic/What_is_Azure_Rights_Management_.md#BKMK_RMSpictures) section from the [What is Azure Rights Management?](../Topic/What_is_Azure_Rights_Management_.md) topic.

## <a name="BKMK_O365"></a>Office 365: Configuration for clients and online services
Because Office 365 natively supports Azure RMS, no client computer configuration is required to support the information rights management (IRM) features for applications such as Word, Excel, PowerPoint, Outlook and the Outlook Web App. All users have to do is sign in to their Office applications with their [!INCLUDE[o365_1](../Token/o365_1_md.md)] credentials and they can protect files and emails, and use files and emails that have been protected by others.

However, we recommend that you supplement these applications with the Rights Management sharing application, so that users get the benefit of the Office add-in. For more information, see the [Rights Management sharing application: Installation and configuration for clients](../Topic/Configuring_Applications_for_Azure_Rights_Management.md#BKMK_SharingApp) section in this topic.

### <a name="BKMK_ExchangeOnline"></a>Exchange Online: IRM Configuration
To configure Exchange Online to support Azure RMS, you must configure the information rights management (IRM) service for Exchange Online. To do this, you use Windows PowerShell (no need to install a separate module), and run [PowerShell commands for Exchange Online](https://technet.microsoft.com/library/jj200677.aspx).

> [!NOTE]
> You cannot currently configure Exchange Online to support Azure RMS if you are using a customer-managed tenant key (BYOK) for Azure RMS, rather than the default configuration of a Microsoft-managed tenant key. For more information, see the [BYOK pricing and restrictions](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_Pricing) section in the [Planning and Implementing Your Azure Rights Management Tenant Key](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md) topic.
> 
> If you try to configure Exchange Online when Azure RMS is using BYOK, the command to import the key (step 5,  in the following procedure) fails with the error message **[FailureCategory=Cmdlet-FailedToGetTrustedPublishingDomainFromRmsOnlineException]**.

The following steps provide a typical set of commands that you would run to enable Exchange Online to use Azure RMS:

1.  If this is the first time that you have used Windows PowerShell for Exchange Online on your computer, you must configure Windows PowerShell to run signed scripts. Start your Windows PowerShell session by using the **Run as administrator** option, and then type:

    ```
    Set-ExecutionPolicy RemoteSigned
    ```

2.  In your Windows PowerShell session, sign in to Exchange Online by using an account that is enabled for remote Shell access. By default, all accounts that are created in Exchange Online are enabled for remote Shell access but this can be disabled  (and enabled) by using the   [Set-User &lt;UserIdentity&gt; -RemotePowerShellEnabled](https://technet.microsoft.com/library/jj984292%28v=exchg.160%29.aspx) command.

    To sign in, type:

    ```
    $Cred = Get-Credential
    ```
    In the **Windows PowerShell credential request** dialog box, supply your Office 365 user name and password.

3.  Connect to the Exchange Online service by running the following two commands:

    ```
    $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $Cred -Authentication Basic –AllowRedirection
    ```

    ```
    Import-PSSession $Session
    ```

4.  Specify the location of the Azure RMS tenant key, according to your region:

    For North America (and government subscriptions):

    ```
    Set-IRMConfiguration -RMSOnlineKeySharingLocation "https://sp-rms.na.aadrm.com/TenantManagement/ServicePartner.svc"
    ```
    For Europe:

    ```
    Set-IRMConfiguration -RMSOnlineKeySharingLocation "https://sp-rms.eu.aadrm.com/TenantManagement/ServicePartner.svc"
    ```
    For Asia:

    ```
    Set-IRMConfiguration -RMSOnlineKeySharingLocation "https://sp-rms.ap.aadrm.com/TenantManagement/ServicePartner.svc"
    ```
    For South America:

    ```
    Set-IRMConfiguration -RMSOnlineKeySharingLocation "https://sp-rms.sa.aadrm.com/TenantManagement/ServicePartner.svc"
    ```

5.  Import configuration data from Azure RMS to Exchange Online, in the form of the trusted publishing domain (TPD). This includes the Azure RMS tenant key and Azure RMS templates:

    ```
    Import-RMSTrustedPublishingDomain -RMSOnline -name "RMS Online"
    ```
    In this command, we used the name of **RMS Online** for the base name of the TPD for Azure RMS in Exchange Online. After the TPD is imported, it is named **RMS Online - 1** in Exchange Online.

6.  Enable Azure RMS functionality so that IRM features are available for Exchange Online:

    ```
    Set-IRMConfiguration -InternalLicensingEnabled $true
    ```
    After running this command, Rights Management is automatically enabled for the Outlook client, the Outlook Web app, and Exchange Active Sync.

7.  Optionally, test that this configuration is successful by using the following command:

    ```
    Test-IRMConfiguration -Sender <user email address>
    ```
    For example: **Test-IRMConfiguration -Sender  adams@contoso.com**

    This command runs a series of checks that includes verifying connectivity to the service, retrieving the configuration, retrieving URIs, licenses, and any templates. In the Windows PowerShell session, you will see the results of each and at the end, if everything passes these checks: **OVERALL RESULT: PASS**

8.  Disconnect your remote PowerShell session:

    ```
    Remove-PSSession $Session
    ```

Users can now protect their email messages by using Azure RMS. For example,  in the Outlook Web App, select **Set permissions** from the extended menu (**...**), and then choose **Do Not Forward** or one of the available templates to apply information protection to the email message and any attachments. However, because the Outlook Web App caches the UI for a day, wait for this time period to elapse before you try applying information protection to email messages and after running these configuration commands. Before the UI updates to reflect the new configuration, you will not see any options from the **Set permissions** menu.

> [!IMPORTANT]
> If you create new [custom templates](https://technet.microsoft.com/library/dn642472.aspx) for Azure RMS or update the templates, each time, you must run the following Exchange Online PowerShell command (if necessary, run steps 2 and 3 first) to synchronize these changes to Exchange Online: `Import-RMSTrustedPublishingDomain -Name "RMS Online - 1" -RefreshTemplates –RMSOnline`

As an Exchange administrator, you can now configure features that apply information protection automatically, such as [transport rules](https://technet.microsoft.com/library/dd302432.aspx), [data loss prevention (DLP) policies](https://technet.microsoft.com/library/jj150527%28v=exchg.150%29.aspx), and [protected voice mail](https://technet.microsoft.com/library/dn198211%28v=exchg.150%29.aspx) (Unified Messaging).

For detailed instructions to configure Exchange Online to enable IRM functionality, see the documentation in the Exchange library. For example:

-   [Connect to Exchange Online using remote PowerShell](https://technet.microsoft.com/library/jj984289%28v=exchg.160%29.aspx)

-   [Configure IRM to use Azure Rights Management](https://technet.microsoft.com/library/dn151475%28v=exchg.150%29.aspx)

#### Office 365 Message Encryption
Run the same steps as documented in the previous section, but if you don't want templates to be displayed, before step 6,  run the following command to prevent IRM templates from being available in the Outlook Web App and Outlook client: `Set-IRMConfiguration -ClientAccessServerEnabled $false`

Then, you're ready to configure [transport rules](https://technet.microsoft.com/library/dd302432.aspx) to automatically modify the message security when recipients are located outside the organization, and select the **Apply Office 365 Message Encryption** option.

For more information about message encryption, see [Encryption in Office 365](https://technet.microsoft.com/library/dn569286.aspx) in the Exchange library.

### <a name="BKMK_SharePointOnline"></a>SharePoint Online and OneDrive for Business: IRM Configuration
To configure SharePoint Online and OneDrive for Business to support Azure RMS, you must first enable the information rights management (IRM) service for SharePoint Online by using the SharePoint admin center. Then, site owners can  IRM-protect their SharePoint lists and document libraries, and users can IRM-protect their OneDrive for Business library so that documents that are saved there, and shared with others, are automatically protected by Azure RMS.

To enable the  information rights management (IRM) service for SharePoint Online, see the following instructions from the Office website:

-   [Set up Information Rights Management (IRM) in SharePoint admin center](http://office.microsoft.com/office365-sharepoint-online-enterprise-help/set-up-information-rights-management-irm-insharepoint-online-HA102895193.aspx)

This configuration is done by the Office 365 administrator.

#### Configuring IRM for libraries and lists
After you have enabled the   IRM service for SharePoint, site owners can  IRM-protect their SharePoint document libraries and lists. For instructions, see the following from the Office website:

-   [Apply Information Rights Management to a list or library](http://office.microsoft.com/sharepoint-help/apply-information-rights-management-to-a-list-or-library-HA102891460.aspx)

This configuration is done by the SharePoint site administrator.

#### <a name="BKMK_OneDrive"></a>Configuring IRM for OneDrive for Business
After you have enabled the   IRM service for SharePoint Online, users' OneDrive for Business document library can then be configured for  Rights Management protection.  Users can configure this for themselves by using the **Settings** icon in their OneDrive. Although administrators cannot configure Rights Management for users' OneDrive for Business by using the SharePoint admin center, you can do this by using Windows PowerShell.

> [!NOTE]
> For more information about configuring OneDrive for Business, see the Office documentation,[Set up OneDrive for Business in Office 365](https://support.office.com/article/Set-up-OneDrive-for-Business-in-Office-365-3e21f8f0-e0a1-43be-aa3e-8c0236bf11bb).

##### Configuration for users
Give users these instructions so that they can configure their OneDrive for Business and IRM-protect their business files.

1.  In OneDrive, click the **Settings** icon, to open the Settings menu, and then click **Site Contents**.

2.  Hover on the **Documents** tile, chose the ellipses (**...**), and then click **SETTINGS.**

3.  On the **Settings** page, in the **Permissions and Management** section, click **Information Rights Management**.

4.  On the **Information Rights Management Settings** page, select **Restrict permissions on this library on download** check box, specify your choice of  name and a description for the permissions, and optionally, click **SHOW OPTIONS** to configure optional configurations, and then click **OK**.

    For more information about the configuration options, see the instructions in [Apply Information Rights Management to a list or library](https://support.office.com/article/Apply-Information-Rights-Management-to-a-list-or-library-3bdb5c4e-94fc-4741-b02f-4e7cc3c54aa1) from the Office documentation.

Because this configuration relies on users rather than an administrator to IRM-protect their OneDrive for Business library, educate users about the  benefits of protecting their files and how to do this. For example, explain that when they share a document from OneDrive for Business, only people they authorize can access it with  any restrictions that they configure, even if the file is renamed and copied somewhere else.

##### Configuration for administrators
Although you cannot configure IRM for users' OneDrive for Business by using the SharePoint admin center, you can do this by using Windows PowerShell. To enable IRM for these libraries, follow these steps:

1.  Download and install the [SharePoint Online Client Components SDK](http://www.microsoft.com/en-us/download/details.aspx?id=42038).

2.  Download and install the [SharePoint Online Management Shell](http://www.microsoft.com/en-us/download/details.aspx?id=35588).

3.  Copy the contents of the following script and name the file Set-IRMOnOneDriveForBusiness.ps1 on your computer.

    *&#42;&#42;Disclaimer&#42;&#42;*: This sample script is not supported under any Microsoft standard support program or service. This sample script is provided AS IS without warranty of any kind.

    ```
    # Requires Windows PowerShell version 3

    <#
      Description:

        Configures IRM policy settings for OneDrive for Business and can also be used for SharePoint Online libraries and lists

     Script Installation Requirements: 

       SharePoint Online Client Components SDK
       http://www.microsoft.com/en-us/download/details.aspx?id=42038

       SharePoint Online Management Shell
       http://www.microsoft.com/en-us/download/details.aspx?id=35588

    ======
    #>

    # URL will be in the format https://<tenant-name>-admin.sharepoint.com
    $sharepointAdminCenterUrl = "https://contoso-admin.sharepoint.com"

    $tenantAdmin = "admin@contoso.com"

    $webUrls = @("https://contoso-my.sharepoint.com/personal/user1_contoso_com",
                 "https://contoso-my.sharepoint.com/personal/user2_contoso_com",
                 "https://contoso-my.sharepoint.com/personal/user3_contoso_com")

    <# As an alternative to specifying the URLs as an array, you can import them from a CSV file (no header, single value per row). 
       Then, use: $webUrls = Get-Content -Path "File_path_and_name.csv"

    #>

    $listTitle = "Documents"

    function Load-SharePointOnlineClientComponentAssemblies
    {
        [cmdletbinding()]
        param()

        process
        {
            # assembly location: C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI 
            try
            {
                Write-Verbose "Loading Assembly: Microsoft.Office.Client.Policy, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
                [System.Reflection.Assembly]::Load("Microsoft.Office.Client.Policy, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

                Write-Verbose "Loading Assembly: Microsoft.Office.Client.TranslationServices, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
                [System.Reflection.Assembly]::Load("Microsoft.Office.Client.TranslationServices, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

                Write-Verbose "Loading Assembly: Microsoft.SharePoint.Client, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
                [System.Reflection.Assembly]::Load("Microsoft.SharePoint.Client, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

                Write-Verbose "Loading Assembly: Microsoft.SharePoint.Client.DocumentManagement, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
                [System.Reflection.Assembly]::Load("Microsoft.SharePoint.Client.DocumentManagement, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

                Write-Verbose "Loading Assembly: Microsoft.SharePoint.Client.Publishing, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
                [System.Reflection.Assembly]::Load("Microsoft.SharePoint.Client.Publishing, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

                Write-Verbose "Loading Assembly: Microsoft.SharePoint.Client.Runtime, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
                [System.Reflection.Assembly]::Load("Microsoft.SharePoint.Client.Runtime, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

                Write-Verbose "Loading Assembly: Microsoft.SharePoint.Client.Search.Applications, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
                [System.Reflection.Assembly]::Load("Microsoft.SharePoint.Client.Search.Applications, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

                Write-Verbose "Loading Assembly: Microsoft.SharePoint.Client.Search, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
                [System.Reflection.Assembly]::Load("Microsoft.SharePoint.Client.Search, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

                Write-Verbose "Loading Assembly: Microsoft.SharePoint.Client.Taxonomy, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
                [System.Reflection.Assembly]::Load("Microsoft.SharePoint.Client.Taxonomy, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

                Write-Verbose "Loading Assembly: Microsoft.SharePoint.Client.UserProfiles, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
                [System.Reflection.Assembly]::Load("Microsoft.SharePoint.Client.UserProfiles, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

                return $true
            }
            catch
            {
                if($_.Exception.Message -match "Could not load file or assembly")
                {
                    Write-Error -Message "Unable to load the SharePoint Server 2013 Client Components.`nDownload Location: http://www.microsoft.com/en-us/download/details.aspx?id=42038"
                }
                else
                {
                    Write-Error -Exception $_.Exception
                }
                return $false
            }
        }
    }

    function Load-SharePointOnlineModule
    {
        [cmdletbinding()]
        param()

        process
        {
            do
            {
                # Installation location: C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell
                $spoModule = Get-Module -Name Microsoft.Online.SharePoint.PowerShell -ErrorAction SilentlyContinue

                if(-not $spoModule)
                {
                    try
                    {
                        Import-Module Microsoft.Online.SharePoint.PowerShell -DisableNameChecking
                        return $true
                    }
                    catch
                    {
                        if($_.Exception.Message -match "Could not load file or assembly")
                        {
                            Write-Error -Message "Unable to load the SharePoint Online Management Shell.`nDownload Location: http://www.microsoft.com/en-us/download/details.aspx?id=35588"
                        }
                        else
                        {
                            Write-Error -Exception $_.Exception
                        }
                        return $false
                    }
                }
                else
                {
                    return $true
                }
            }
            while(-not $spoModule)
        }
    }

    function Set-IrmConfiguration
    {
        [cmdletbinding()]
        param(
            [parameter(Mandatory=$true)][Microsoft.SharePoint.Client.List]$List,
            [parameter(Mandatory=$true)][string]$PolicyTitle,
            [parameter(Mandatory=$true)][string]$PolicyDescription,
            [parameter(Mandatory=$false)][switch]$IrmReject,
            [parameter(Mandatory=$false)][DateTime]$ProtectionExpirationDate,
            [parameter(Mandatory=$false)][switch]$DisableDocumentBrowserView,
            [parameter(Mandatory=$false)][switch]$AllowPrint,
            [parameter(Mandatory=$false)][switch]$AllowScript,
            [parameter(Mandatory=$false)][switch]$AllowWriteCopy,
            [parameter(Mandatory=$false)][int]$DocumentAccessExpireDays,
            [parameter(Mandatory=$false)][int]$LicenseCacheExpireDays,
            [parameter(Mandatory=$false)][string]$GroupName
        )

        process
        {
            Write-Verbose "Applying IRM Configuration on '$($List.Title)'"

            # reset the value to the default settings
            $list.InformationRightsManagementSettings.Reset()

            $list.IrmEnabled = $true

            # IRM Policy title and description

                $list.InformationRightsManagementSettings.PolicyTitle       = $PolicyTitle
                $list.InformationRightsManagementSettings.PolicyDescription = $PolicyDescription

            # Set additional IRM library settings

                # Do not allow users to upload documents that do not support IRM
                $list.IrmReject = $IrmReject.IsPresent

                $parsedDate = Get-Date
                if([DateTime]::TryParse($ProtectionExpirationDate, [ref]$parsedDate))
                {
                    # Stop restricting access to the library at <date>
                    $list.IrmExpire = $true
                    $list.InformationRightsManagementSettings.DocumentLibraryProtectionExpireDate = $ProtectionExpirationDate
                }

                # Prevent opening documents in the browser for this Document Library
                $list.InformationRightsManagementSettings.DisableDocumentBrowserView = $DisableDocumentBrowserView.IsPresent

            # Configure document access rights

                # Allow viewers to print 
                $list.InformationRightsManagementSettings.AllowPrint = $AllowPrint.IsPresent

                # Allow viewers to run script and screen reader to function on downloaded documents
                $list.InformationRightsManagementSettings.AllowScript = $AllowScript.IsPresent

                # Allow viewers to write on a copy of the downloaded document
                $list.InformationRightsManagementSettings.AllowWriteCopy = $AllowWriteCopy.IsPresent

                if($DocumentAccessExpireDays)
                {
                    # After download, document access rights will expire after these number of days (1-365)
                    $list.InformationRightsManagementSettings.EnableDocumentAccessExpire = $true
                    $list.InformationRightsManagementSettings.DocumentAccessExpireDays   = $DocumentAccessExpireDays
                }

            # Set group protection and credentials interval

                if($LicenseCacheExpireDays)
                {
                    # Users must verify their credentials using this interval (days)
                    $list.InformationRightsManagementSettings.EnableLicenseCacheExpire = $true
                    $list.InformationRightsManagementSettings.LicenseCacheExpireDays   = $LicenseCacheExpireDays
                }

                if($GroupName)
                {
                    # Allow group protection. Default group:
                    $list.InformationRightsManagementSettings.EnableGroupProtection = $true
                    $list.InformationRightsManagementSettings.GroupName             = $GroupName
                }
        }
        end
        {
            if($list)
            {
                Write-Verbose "Committing IRM configuration settings on '$($list.Title)'"
                $list.InformationRightsManagementSettings.Update()
                $list.Update()
                $script:clientContext.Load($list)
                $script:clientContext.ExecuteQuery()
            }
        }
    }

    function Get-CredentialFromCredentialCache
    {
        [cmdletbinding()]
        param([string]$CredentialName)

        #if( Test-Path variable:\global:CredentialCache )
        if( Get-Variable O365TenantAdminCredentialCache -Scope Global -ErrorAction SilentlyContinue )
        {
            if($global:O365TenantAdminCredentialCache.ContainsKey($CredentialName))
            {
                Write-Verbose "Credential Cache Hit: $CredentialName"
                return $global:O365TenantAdminCredentialCache[$CredentialName]
            }
        }
        Write-Verbose "Credential Cache Miss: $CredentialName"
        return $null
    }

    function Add-CredentialToCredentialCache
    {
        [cmdletbinding()]
        param([System.Management.Automation.PSCredential]$Credential)

        if(-not (Get-Variable CredentialCache -Scope Global -ErrorAction SilentlyContinue))
        {
            Write-Verbose "Initializing the Credential Cache"
            $global:O365TenantAdminCredentialCache = @{}
        }

        Write-Verbose "Adding Credential to the Credential Cache"
        $global:O365TenantAdminCredentialCache[$Credential.UserName] = $Credential
    }

    # load the required assemblies and Windows PowerShell modules

        if(-not ((Load-SharePointOnlineClientComponentAssemblies) -and (Load-SharePointOnlineModule)) ) { return }

    # Add the credentials to the client context and SharePoint Online service connection

        # check for cached credentials to use 
        $o365TenantAdminCredential = Get-CredentialFromCredentialCache -CredentialName $tenantAdmin

        if(-not $o365TenantAdminCredential)
        {
            # when credentials are not cached, prompt for the tenant admin credentials
            $o365TenantAdminCredential = Get-Credential -UserName $tenantAdmin -Message "Enter the password for the Office 365 admin"

            if(-not $o365TenantAdminCredential -or -not $o365TenantAdminCredential.UserName -or $o365TenantAdminCredential.Password.Length -eq 0 )
            { 
                Write-Error -Message "Could not validate the supplied tenant admin credentials"
                return 
            }

            # add the credentials to the cache
            Add-CredentialToCredentialCache -Credential $o365TenantAdminCredential
        }

    # connect to Office365 first, required for SharePoint Online cmdlets to run

        Connect-SPOService -Url $sharepointAdminCenterUrl -Credential $o365TenantAdminCredential

    # enumerate each of the specified site URLs

        foreach($webUrl in $webUrls)
        {
            $grantedSiteCollectionAdmin = $false

            try
            {
                # establish the client context and set the credentials to connect to the site
                $script:clientContext = New-Object Microsoft.SharePoint.Client.ClientContext($webUrl)
                $script:clientContext.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($o365TenantAdminCredential.UserName, $o365TenantAdminCredential.Password)

                # initialize the site and web context
                $script:clientContext.Load($script:clientContext.Site)
                $script:clientContext.Load($script:clientContext.Web)
                $script:clientContext.ExecuteQuery()

                # load and ensure the tenant admin user account if present on the target SharePoint site
                $tenantAdminUser = $script:clientContext.Web.EnsureUser($o365TenantAdminCredential.UserName)
                $script:clientContext.Load($tenantAdminUser)
                $script:clientContext.ExecuteQuery()

                # check if the tenant admin is a site admin
                if( -not $tenantAdminUser.IsSiteAdmin ) 
                {
                    try
                    {
                        # grant the tenant admin temporary admin rights to the site collection
                        Set-SPOUser -Site $script:clientContext.Site.Url -LoginName $o365TenantAdminCredential.UserName -IsSiteCollectionAdmin $true | Out-Null
                        $grantedSiteCollectionAdmin = $true
                    }
                    catch
                    {
                        Write-Error $_.Exception
                        return
                    }
                }

                try
                {
                    # load the list orlibrary using CSOM

                    $list = $null
                    $list = $script:clientContext.Web.Lists.GetByTitle($listTitle)
                    $script:clientContext.Load($list)
                    $script:clientContext.ExecuteQuery()

                    # **************  ADMIN INSTRUCTIONS  **************
                    # If necessary, modify the following Set-IrmConfiguration parameters to match your required values 
                    # The supplied options and values are for example only
                    # Example that shows the Set-IrmConfiguration command with all parameters: Set-IrmConfiguration -List $list -PolicyTitle "Protected Files" -PolicyDescription "This policy restricts access to authorized users" -IrmReject -ProtectionExpirationDate $(Get-Date).AddDays(180) -DisableDocumentBrowserView -AllowPrint -AllowScript -AllowWriteCopy -LicenseCacheExpireDays 25 -DocumentAccessExpireDays 90

                    Set-IrmConfiguration -List $list -PolicyTitle "Protected Files" -PolicyDescription "This policy restricts access to authorized users"  
                }
                catch
                {
                    Write-Error -Message "Error setting IRM configuration on site: $webUrl.`nError Details: $($_.Exception.ToString())"
                }
           }
           finally
           {
                if($grantedSiteCollectionAdmin)
                {
                    # remove the temporary admin rights to the site collection
                    Set-SPOUser -Site $script:clientContext.Site.Url -LoginName $o365TenantAdminCredential.UserName -IsSiteCollectionAdmin $false | Out-Null
                }
           }
        }

    Disconnect-SPOService -ErrorAction SilentlyContinue
    ```

4.  Review the script and make the following changes:

    1.  Search for `$sharepointAdminCenterUrl` and replace the example value with your own SharePoint admin center URL.

        You'll find this value as the base URL when you go into the SharePoint admin center, and it has the following format: https://*&lt;tenant_name&gt;*-admin.sharepoint.com

        For example, if the tenant name is "contoso", then you would specify: **https://contoso-admin.sharepoint.com**

    2.  Search for `$tenantAdmin` and replace the example value with your own fully qualified global administrator account for Office 365.

        This value is the same as the one you use to sign in to the Office 365 admin portal as the global administrator and has the following format: user_name@*&lt;tenant domain name&gt;*.com

        For example, if the Office 365 global administrator user name is "admin" for the "contoso.com" tenant domain, you would specify: **admin@contoso.com**

    3.  Search for `$webUrls` and replace the example values with your users' OneDrive for Business web URLs, adding or deleting as many entries as you need.

        Alternatively, see the comments in the script about how to replace this array by importing a .CSV file that contains all the URLs you need to configure.  We've provided another sample script to automatically search for and extract the URLs to populate this .CSV file. When you're ready to do this, expand the [Additional script to output all OneDrive for Business URLs to a .CSV file](#BKMK_Script_OD4B_URLS) section immediately after these steps.

        The web URL for the user's OneDrive for Business is in the following format: https://*&lt;tenant name&gt;*-my.sharepoint.com/personal/*&lt;user_name&gt;*_*&lt;tenant name&gt;*_com

        For example, if the user in the contoso tenant has a user name of "rsimone", you would specify: **https://contoso-my.sharepoint.com/personal/rsimone_contoso_com**

    4.  Because we are using the script to configure OneDrive for Business, do not change the value of **Documents** for the `$listTitle` variable.

    5.  Search for `ADMIN INSTRUCTIONS`. If you make no changes to this section, the user's OneDrive for Business will be configured for IRM with the policy title of "Protected Files" and the description of "This policy restricts access to authorized users".  No other IRM options will be set, which is probably appropriate for most environments. However, you can change the suggested policy title and description, and also add any other IRM options that are appropriate for your environment. See the commented example in the script to help you construct your own set of parameters for the Set-IrmConfiguration command.

5.  Save the script and sign it. If you do not sign the script (more secure), Windows PowerShell must be configured on your computer to run unsigned scripts. To do this, run a Windows PowerShell session with the **Run as Administrator** option, and type: **Set-ExecutionPolicy Unrestricted**. However, this configuration lets all unsigned scripts run (less secure).

    For more information about signing Windows PowerShell scripts, see [about_Signing](https://technet.microsoft.com/library/hh847874.aspx) in the PowerShell documentation library.

6.  Run the script and if prompted, supply the password for the Office 365 admin account. If you modify the script and run it in the same Windows PowerShell session, you won't be prompted for credentials.

> [!TIP]
> You can also use this script to configure IRM for a SharePoint Online library. For this configuration, you will likely want to enable the additional option **Do not allow users to upload documents that do not support IRM**, to ensure that the library contains only protected documents.    To do that, add the `-IrmReject` parameter to the Set-IrmConfiguration command in the script.
> 
> You would also need to modify the `$webUrls` variable (for example, **https://contoso.sharepoint.com**) and  `$listTitle` variable (for example, **$Reports**).

If you need to disable IRM for user's OneDrive for Business libraries, expand the [Script to disable IRM for OneDrive for Business](#BKMK_Script_OD4B_DisableIRM) section.

###### <a name="BKMK_Script_OD4B_URLS"></a>Additional script to output all OneDrive for Business URLs to a .CSV file
For step 4c above, you can use the following Windows PowerShell script to extract the URLs for all users' OneDrive for Business libraries, which you can then check, edit if necessary, and then import into the main script.

This script also requires the [SharePoint Online Client Components SDK](http://www.microsoft.com/en-us/download/details.aspx?id=42038) and the [SharePoint Online Management Shell](http://www.microsoft.com/en-us/download/details.aspx?id=35588). Follow the same instructions to copy and paste it, save the file locally (for example, "Report-OneDriveForBusinessSiteInfo.ps1"), modify the   `$sharepointAdminCenterUrl` and `$tenantAdmin` values as before, and then run the script.

*&#42;&#42;Disclaimer&#42;&#42;*: This sample script is not supported under any Microsoft standard support program or service. This sample script is provided AS IS without warranty of any kind.

```
# Requires Windows PowerShell version 3

<#
  Description:

    Queries the search service of an Office 365 tenant to retrieve all OneDrive for Business sites.  
    Details of the discovered sites are written to a .CSV file (by default,"OneDriveForBusinessSiteInfo_<date>.csv").

 Script Installation Requirements: 

   SharePoint Online Client Components SDK
   http://www.microsoft.com/en-us/download/details.aspx?id=42038

   SharePoint Online Management Shell
   http://www.microsoft.com/en-us/download/details.aspx?id=35588

======
#>

# URL will be in the format https://<tenant-name>-admin.sharepoint.com
$sharepointAdminCenterUrl = "https://contoso-admin.sharepoint.com"

$tenantAdmin = "admin@contoso.onmicrosoft.com"                           

$reportName = "OneDriveForBusinessSiteInfo_$((Get-Date).ToString("yyyy-MM-dd_hh.mm.ss")).csv"

$oneDriveForBusinessSiteUrls= @()
$resultsProcessed = 0

function Load-SharePointOnlineClientComponentAssemblies
{
    [cmdletbinding()]
    param()

    process
    {
        # assembly location: C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI 
        try
        {
            Write-Verbose "Loading Assembly: Microsoft.Office.Client.Policy, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
            [System.Reflection.Assembly]::Load("Microsoft.Office.Client.Policy, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

            Write-Verbose "Loading Assembly: Microsoft.Office.Client.TranslationServices, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
            [System.Reflection.Assembly]::Load("Microsoft.Office.Client.TranslationServices, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

            Write-Verbose "Loading Assembly: Microsoft.SharePoint.Client, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
            [System.Reflection.Assembly]::Load("Microsoft.SharePoint.Client, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

            Write-Verbose "Loading Assembly: Microsoft.SharePoint.Client.DocumentManagement, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
            [System.Reflection.Assembly]::Load("Microsoft.SharePoint.Client.DocumentManagement, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

            Write-Verbose "Loading Assembly: Microsoft.SharePoint.Client.Publishing, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
            [System.Reflection.Assembly]::Load("Microsoft.SharePoint.Client.Publishing, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

            Write-Verbose "Loading Assembly: Microsoft.SharePoint.Client.Runtime, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
            [System.Reflection.Assembly]::Load("Microsoft.SharePoint.Client.Runtime, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

            Write-Verbose "Loading Assembly: Microsoft.SharePoint.Client.Search.Applications, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
            [System.Reflection.Assembly]::Load("Microsoft.SharePoint.Client.Search.Applications, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

            Write-Verbose "Loading Assembly: Microsoft.SharePoint.Client.Search, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
            [System.Reflection.Assembly]::Load("Microsoft.SharePoint.Client.Search, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

            Write-Verbose "Loading Assembly: Microsoft.SharePoint.Client.Taxonomy, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
            [System.Reflection.Assembly]::Load("Microsoft.SharePoint.Client.Taxonomy, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

            Write-Verbose "Loading Assembly: Microsoft.SharePoint.Client.UserProfiles, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
            [System.Reflection.Assembly]::Load("Microsoft.SharePoint.Client.UserProfiles, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

            return $true
        }
        catch
        {
            if($_.Exception.Message -match "Could not load file or assembly")
            {
                Write-Error -Message "Unable to load the SharePoint Server 2013 Client Components.`nDownload Location: http://www.microsoft.com/en-us/download/details.aspx?id=42038"
            }
            else
            {
                Write-Error -Exception $_.Exception
            }
            return $false
        }
    }
}

function Load-SharePointOnlineModule
{
    [cmdletbinding()]
    param()

    process
    {
        do
        {
            # Installation location: C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell
            $spoModule = Get-Module -Name Microsoft.Online.SharePoint.PowerShell -ErrorAction SilentlyContinue

            if(-not $spoModule)
            {
                try
                {
                    Import-Module Microsoft.Online.SharePoint.PowerShell -DisableNameChecking
                    return $true
                }
                catch
                {
                    if($_.Exception.Message -match "Could not load file or assembly")
                    {
                        Write-Error -Message "Unable to load the SharePoint Online Management Shell.`nDownload Location: http://www.microsoft.com/en-us/download/details.aspx?id=35588"
                    }
                    else
                    {
                        Write-Error -Exception $_.Exception
                    }
                    return $false
                }
            }
            else
            {
                return $true
            }
        }
        while(-not $spoModule)
    }
}

function Get-CredentialFromCredentialCache
{
    [cmdletbinding()]
    param([string]$CredentialName)

    #if( Test-Path variable:\global:CredentialCache )
    if( Get-Variable O365TenantAdminCredentialCache -Scope Global -ErrorAction SilentlyContinue )
    {
        if($global:O365TenantAdminCredentialCache.ContainsKey($CredentialName))
        {
            Write-Verbose "Credential Cache Hit: $CredentialName"
            return $global:O365TenantAdminCredentialCache[$CredentialName]
        }
    }
    Write-Verbose "Credential Cache Miss: $CredentialName"
    return $null
}

function Add-CredentialToCredentialCache
{
    [cmdletbinding()]
    param([System.Management.Automation.PSCredential]$Credential)

    if(-not (Get-Variable CredentialCache -Scope Global -ErrorAction SilentlyContinue))
    {
        Write-Verbose "Initializing the Credential Cache"
        $global:O365TenantAdminCredentialCache = @{}
    }

    Write-Verbose "Adding Credential to the Credential Cache"
    $global:O365TenantAdminCredentialCache[$Credential.UserName] = $Credential
}

# load the required assemblies and Windows PowerShell modules

    if(-not ((Load-SharePointOnlineClientComponentAssemblies) -and (Load-SharePointOnlineModule)) ) { return }

# Add the credentials to the client context and SharePoint Online service connection

    # check for cached credentials to use 
    $o365TenantAdminCredential = Get-CredentialFromCredentialCache -CredentialName $tenantAdmin

    if(-not $o365TenantAdminCredential)
    {
        # when credentials are not cached, prompt for the tenant admin credentials
        $o365TenantAdminCredential = Get-Credential -UserName $tenantAdmin -Message "Enter the password for the Office 365 admin"

        if(-not $o365TenantAdminCredential -or -not $o365TenantAdminCredential.UserName -or $o365TenantAdminCredential.Password.Length -eq 0 )
        { 
            Write-Error -Message "Could not validate the supplied tenant admin credentials"
            return 
        }

        # add the credentials to the cache
        Add-CredentialToCredentialCache -Credential $o365TenantAdminCredential
    }

# establish the client context and set the credentials to connect to the site

    $clientContext = New-Object Microsoft.SharePoint.Client.ClientContext($sharepointAdminCenterUrl)
    $clientContext.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($o365TenantAdminCredential.UserName, $o365TenantAdminCredential.Password)

# run a query against the Office 365 tenant search service to retrieve all OneDrive for Business URLs

    do
    {
        # build the query object
	    $query = New-Object Microsoft.SharePoint.Client.Search.Query.KeywordQuery($clientContext)
	    $query.TrimDuplicates        = $false
	    $query.RowLimit              = 500
	    $query.QueryText             = "SPSiteUrl:'/personal/' AND contentclass:STS_Site"
	    $query.StartRow              = $resultsProcessed
	    $query.TotalRowsExactMinimum = 500000

        # run the query 
	    $searchExecutor = New-Object Microsoft.SharePoint.Client.Search.Query.SearchExecutor($clientContext)
	    $queryResults = $searchExecutor.ExecuteQuery($query)
	    $clientContext.ExecuteQuery()

        # enumerate the search results and store the site URLs
        $queryResults.Value[0].ResultRows | % {
            $oneDriveForBusinessSiteUrls += $_.Path
            $resultsProcessed++
        }
    }
    while($resultsProcessed -lt $queryResults.Value.TotalRows)

$oneDriveForBusinessSiteUrls | Out-File -FilePath $reportName
```

###### <a name="BKMK_Script_OD4B_DisableIRM"></a>Script to disable IRM for OneDrive for Business
Use the following sample script if you need to disable IRM for users' OneDrive for Business.

This script also requires the [SharePoint Online Client Components SDK](http://www.microsoft.com/en-us/download/details.aspx?id=42038) and the [SharePoint Online Management Shell](http://www.microsoft.com/en-us/download/details.aspx?id=35588). Copy and paste the contents, save the file locally (for example, "Disable-IRMOnOneDriveForBusiness.ps1"), and modify the   `$sharepointAdminCenterUrl` and `$tenantAdmin` values. Manually specify the OneDrive for Business URLs or use the script in the previous section so that you can import these, and then run the script.

*&#42;&#42;Disclaimer&#42;&#42;*: This sample script is not supported under any Microsoft standard support program or service. This sample script is provided AS IS without warranty of any kind.

```
# Requires Windows PowerShell version 3

<#
  Description:

    Disables IRM for OneDrive for Business and can also be used for SharePoint Online libraries and lists

 Script Installation Requirements: 

   SharePoint Online Client Components SDK
   http://www.microsoft.com/en-us/download/details.aspx?id=42038

   SharePoint Online Management Shell
   http://www.microsoft.com/en-us/download/details.aspx?id=35588

======
#>

$sharepointAdminCenterUrl = "https://contoso-admin.sharepoint.com"

$tenantAdmin = "admin@contoso.com"

$webUrls = @("https://contoso-my.sharepoint.com/personal/user1_contoso_com",
             "https://contoso-my.sharepoint.com/personal/user2_contoso_com",
             "https://contoso-my.sharepoint.com/personal/person3_contoso_com")

<# As an alternative to specifying the URLs as an array, you can import them from a CSV file (no header, single value per row). 
   Then, use: $webUrls = Get-Content -Path "File_path_and_name.csv"

#>

$listTitle = "Documents"

function Load-SharePointOnlineClientComponentAssemblies
{
    [cmdletbinding()]
    param()

    process
    {
        # assembly location: C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI 
        try
        {
            Write-Verbose "Loading Assembly: Microsoft.Office.Client.Policy, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
            [System.Reflection.Assembly]::Load("Microsoft.Office.Client.Policy, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

            Write-Verbose "Loading Assembly: Microsoft.Office.Client.TranslationServices, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
            [System.Reflection.Assembly]::Load("Microsoft.Office.Client.TranslationServices, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

            Write-Verbose "Loading Assembly: Microsoft.SharePoint.Client, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
            [System.Reflection.Assembly]::Load("Microsoft.SharePoint.Client, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

            Write-Verbose "Loading Assembly: Microsoft.SharePoint.Client.DocumentManagement, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
            [System.Reflection.Assembly]::Load("Microsoft.SharePoint.Client.DocumentManagement, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

            Write-Verbose "Loading Assembly: Microsoft.SharePoint.Client.Publishing, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
            [System.Reflection.Assembly]::Load("Microsoft.SharePoint.Client.Publishing, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

            Write-Verbose "Loading Assembly: Microsoft.SharePoint.Client.Runtime, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
            [System.Reflection.Assembly]::Load("Microsoft.SharePoint.Client.Runtime, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

            Write-Verbose "Loading Assembly: Microsoft.SharePoint.Client.Search.Applications, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
            [System.Reflection.Assembly]::Load("Microsoft.SharePoint.Client.Search.Applications, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

            Write-Verbose "Loading Assembly: Microsoft.SharePoint.Client.Search, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
            [System.Reflection.Assembly]::Load("Microsoft.SharePoint.Client.Search, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

            Write-Verbose "Loading Assembly: Microsoft.SharePoint.Client.Taxonomy, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
            [System.Reflection.Assembly]::Load("Microsoft.SharePoint.Client.Taxonomy, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

            Write-Verbose "Loading Assembly: Microsoft.SharePoint.Client.UserProfiles, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"
            [System.Reflection.Assembly]::Load("Microsoft.SharePoint.Client.UserProfiles, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c") | Out-Null

            return $true
        }
        catch
        {
            if($_.Exception.Message -match "Could not load file or assembly")
            {
                Write-Error -Message "Unable to load the SharePoint Server 2013 Client Components.`nDownload Location: http://www.microsoft.com/en-us/download/details.aspx?id=42038"
            }
            else
            {
                Write-Error -Exception $_.Exception
            }
            return $false
        }
    }
}

function Load-SharePointOnlineModule
{
    [cmdletbinding()]
    param()

    process
    {
        do
        {
            # Installation location: C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell
            $spoModule = Get-Module -Name Microsoft.Online.SharePoint.PowerShell -ErrorAction SilentlyContinue

            if(-not $spoModule)
            {
                try
                {
                    Import-Module Microsoft.Online.SharePoint.PowerShell -DisableNameChecking
                    return $true
                }
                catch
                {
                    if($_.Exception.Message -match "Could not load file or assembly")
                    {
                        Write-Error -Message "Unable to load the SharePoint Online Management Shell.`nDownload Location: http://www.microsoft.com/en-us/download/details.aspx?id=35588"
                    }
                    else
                    {
                        Write-Error -Exception $_.Exception
                    }
                    return $false
                }
            }
            else
            {
                return $true
            }
        }
        while(-not $spoModule)
    }
}

function Remove-IrmConfiguration
{
    [cmdletbinding()]
    param(
        [parameter(Mandatory=$true)][Microsoft.SharePoint.Client.List]$List
    )

    process
    {
        Write-Verbose "Disabling IRM Configuration on '$($List.Title)'"

        $List.IrmEnabled = $false
        $List.IrmExpire  = $false
        $List.IrmReject  = $false
        $List.InformationRightsManagementSettings.Reset()
    }
    end
    {
        if($List)
        {
            Write-Verbose "Committing IRM configuration settings on '$($list.Title)'"
            $list.InformationRightsManagementSettings.Update()
            $list.Update()
            $script:clientContext.Load($list)
            $script:clientContext.ExecuteQuery()
        }
    }
}

function Get-CredentialFromCredentialCache
{
    [cmdletbinding()]
    param([string]$CredentialName)

    #if( Test-Path variable:\global:CredentialCache )
    if( Get-Variable O365TenantAdminCredentialCache -Scope Global -ErrorAction SilentlyContinue )
    {
        if($global:O365TenantAdminCredentialCache.ContainsKey($CredentialName))
        {
            Write-Verbose "Credential Cache Hit: $CredentialName"
            return $global:O365TenantAdminCredentialCache[$CredentialName]
        }
    }
    Write-Verbose "Credential Cache Miss: $CredentialName"
    return $null
}

function Add-CredentialToCredentialCache
{
    [cmdletbinding()]
    param([System.Management.Automation.PSCredential]$Credential)

    if(-not (Get-Variable CredentialCache -Scope Global -ErrorAction SilentlyContinue))
    {
        Write-Verbose "Initializing the Credential Cache"
        $global:O365TenantAdminCredentialCache = @{}
    }

    Write-Verbose "Adding Credential to the Credential Cache"
    $global:O365TenantAdminCredentialCache[$Credential.UserName] = $Credential
}

# load the required assemblies and Windows PowerShell modules

    if(-not ((Load-SharePointOnlineClientComponentAssemblies) -and (Load-SharePointOnlineModule)) ) { return }

# Add the credentials to the client context and SharePoint Online service connection

    # check for cached credentials to use 
    $o365TenantAdminCredential = Get-CredentialFromCredentialCache -CredentialName $tenantAdmin

    if(-not $o365TenantAdminCredential)
    {
        # when credentials are not cached, prompt for the tenant admin credentials
        $o365TenantAdminCredential = Get-Credential -UserName $tenantAdmin -Message "Enter the password for the Office 365 admin"

        if(-not $o365TenantAdminCredential -or -not $o365TenantAdminCredential.UserName -or $o365TenantAdminCredential.Password.Length -eq 0 )
        { 
            Write-Error -Message "Could not validate the supplied tenant admin credentials"
            return 
        }

        # add the credentials to the cache
        Add-CredentialToCredentialCache -Credential $o365TenantAdminCredential
    }

# connect to Office365 first, required for SharePoint Online cmdlets to run

    Connect-SPOService -Url $sharepointAdminCenterUrl -Credential $o365TenantAdminCredential

# enumerate each of the specified site URLs

    foreach($webUrl in $webUrls)
    {
        $grantedSiteCollectionAdmin = $false

        try
        {
            # establish the client context and set the credentials to connect to the site
            $script:clientContext = New-Object Microsoft.SharePoint.Client.ClientContext($webUrl)
            $script:clientContext.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($o365TenantAdminCredential.UserName, $o365TenantAdminCredential.Password)

            # initialize the site and web context
            $script:clientContext.Load($script:clientContext.Site)
            $script:clientContext.Load($script:clientContext.Web)
            $script:clientContext.ExecuteQuery()

            # load and ensure the tenant admin user account if present on the target SharePoint site
            $tenantAdminUser = $script:clientContext.Web.EnsureUser($o365TenantAdminCredential.UserName)
            $script:clientContext.Load($tenantAdminUser)
            $script:clientContext.ExecuteQuery()

            # check if the tenant admin is a site admin
            if( -not $tenantAdminUser.IsSiteAdmin ) 
            {
                try
                {
                    # grant the tenant admin temporary admin rights to the site collection
                    Set-SPOUser -Site $script:clientContext.Site.Url -LoginName $o365TenantAdminCredential.UserName -IsSiteCollectionAdmin $true | Out-Null
                    $grantedSiteCollectionAdmin = $true
                }
                catch
                {
                    Write-Error $_.Exception
                    return
                }
            }

            try
            {
                # load the list orlibrary using CSOM

                $list = $null
                $list = $script:clientContext.Web.Lists.GetByTitle($listTitle)
                $script:clientContext.Load($list)
                $script:clientContext.ExecuteQuery()

               Remove-IrmConfiguration -List $list                 
            }
            catch
            {
                Write-Error -Message "Error setting IRM configuration on site: $webUrl.`nError Details: $($_.Exception.ToString())"
            }
       }
       finally
       {
            if($grantedSiteCollectionAdmin)
            {
                # remove the temporary admin rights to the site collection
                Set-SPOUser -Site $script:clientContext.Site.Url -LoginName $o365TenantAdminCredential.UserName -IsSiteCollectionAdmin $false | Out-Null
            }
       }
    }

Disconnect-SPOService -ErrorAction SilentlyContinue
```

## <a name="BKMK_Office2013Configuration"></a>Office 2016 and Office 2013: Configuration for clients
Because these later versions of Office  natively support Azure RMS, no client computer configuration is required to support the information rights management (IRM) features for applications such as Word, Excel, PowerPoint, Outlook and the Outlook Web App. All users have to do is sign in to their Office applications with their [!INCLUDE[o365_1](../Token/o365_1_md.md)] credentials and they can protect files and emails, and use files and emails that have been protected by others.

However, we recommend that you supplement these applications with the Rights Management sharing application, so that users get the benefit of the Office add-in. For more information, see the [Rights Management sharing application: Installation and configuration for clients](../Topic/Configuring_Applications_for_Azure_Rights_Management.md#BKMK_SharingApp) section in this topic.

## <a name="BKMK_Office2010Configuration"></a>Office 2010: Configuration for clients
For client computers to use Azure RMS with Office 2010, they must have installed the Rights Management sharing application for Windows. No further configuration is required other than users must sign in with their [!INCLUDE[o365_1](../Token/o365_1_md.md)] credentials and they can then protect files and use files that have been protected by others.

For more information about the Rights Management sharing application, see the [Rights Management sharing application: Installation and configuration for clients](../Topic/Configuring_Applications_for_Azure_Rights_Management.md#BKMK_SharingApp) section in this topic.

## <a name="BKMK_SharingApp"></a>Rights Management sharing application: Installation and configuration for clients
The Rights Management (RMS) sharing application is required for client computers to use Azure RMS with Office 2010, and recommended for all computers and mobile devices that support Azure RMS. The RMS sharing application integrates with Office applications by installing an Office add-in so that users can easily protect files and emails directly from the ribbon. It also offers generic protection for files types that are not natively supported by Azure RMS, and a document tracking site for users to track and revoke files that they have protected.

### <a name="BKMK_SharingAppforWindows"></a>The RMS sharing application for Windows: Installation and configuration
To install and configure the RMS sharing application for Windows for an enterprise deployment, see the [Rights Management sharing application administrator guide](http://technet.microsoft.com/library/dn339003.aspx).

> [!TIP]
> If you want to quickly install and test the RMS sharing application for a single computer, see [Download and install the Rights Management sharing application](http://technet.microsoft.com/library/dn574734.aspx) from the [Rights Management sharing application user guide](http://technet.microsoft.com/library/dn339006.aspx).

### <a name="BKMK_SharingAppMovileDevices"></a>The RMS sharing application for mobile platforms: Installation and management
To install the RMS sharing application for mobile platforms, you can download the relevant app by using the links on the [Microsoft Rights Management page](http://go.microsoft.com/fwlink/?LinkId=303970). No configuration is required to use Azure RMS with this app.

**If you have Microsoft Intune**: Because the RMS sharing app includes the Microsoft Intune App Software Development Kit, you have the following options:

-   For devices that are enrolled by Intune, you can  deploy and manage the RMS sharing app for devices that run iOS and Android.  For more information,  see [Control apps using mobile application management policies with Microsoft Intune](https://technet.microsoft.com/library/dn878026.aspx) in the Microsoft Intune TechNet library. For Step 2, use the instructions to publish a policy managed app.

-   For devices that are not enrolled by Intune, you can manage the RMS sharing app for devices that run Android. For more information, see [Create and deploy mobile app management policies with Microsoft Intune](https://technet.microsoft.com/library/mt627829.aspx).

## <a name="BKMK_RMSAPIs"></a>Other applications that support the RMS APIs: Installation and configuration
This category includes line-of-business applications that are written in-house by using the RMS SDK, and applications from software vendors that are written by using the RMS SDK. For these applications, follow the instructions that are provided with the application.

## Next steps
After you’ve configured your applications to support Azure Rights Management, use the [Azure Rights Management Deployment Roadmap](../Topic/Azure_Rights_Management_Deployment_Roadmap.md) to check whether there are other configuration steps that you might want to do before you roll out [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] to users and administrators. If not, see [Using Azure Rights Management](../Topic/Using_Azure_Rights_Management.md) for your next steps.

## See Also
[Configuring Azure Rights Management](../Topic/Configuring_Azure_Rights_Management.md)

