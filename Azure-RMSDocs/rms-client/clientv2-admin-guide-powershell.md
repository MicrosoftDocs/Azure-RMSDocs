---
# required metadata

title: Use PowerShell with the Azure Information Protection unified labeling client
description: Instructions and information for admins to manage the Azure Information Protection unified labeling client by using PowerShell.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 09/19/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: v2client
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---


# Admin Guide: Using PowerShell with the Azure Information Protection unified client

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*
>
> *Instructions for: [Azure Information Protection unified labeling client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-client-and-the-azure-information-protection-unified-labeling-client)*

When you install the Azure Information Protection unified labeling client, PowerShell commands are automatically installed. This lets you manage the client by running commands that you can put into scripts for automation.

The cmdlets are installed with the PowerShell module **AzureInformationProtection**, which has cmdlets for labeling. For example:

|Labeling cmdlet|Example usage|
|----------------|---------------|
|[Get-AIPFileStatus](/powershell/module/azureinformationprotection/get-aipfilestatus)|For a shared folder, identify all files with a specific label.|
|[Set-AIPFileClassification](/powershell/module/azureinformationprotection/set-aipfileclassification)|For a shared folder, inspect the file contents and then automatically label unlabeled files, according to the conditions that you have specified.|
|[Set-AIPFileLabel](/powershell/module/azureinformationprotection/set-aipfilelabel)|For a shared folder, apply a specified label to all files that do not have a label.|
|[Set-AIPAuthentication](/powershell/module/azureinformationprotection/set-aipauthentication)|Label files interactively, by using a different user account to your own.|

> [!TIP]
> To use cmdlets with path lengths greater than 260 characters, use the following [group policy setting](https://blogs.msdn.microsoft.com/jeremykuhne/2016/07/30/net-4-6-2-and-long-paths-on-windows-10/) that is available starting Windows 10, version 1607:<br /> **Local Computer Policy** > **Computer Configuration** > **Administrative Templates** > **All Settings** > **Enable Win32 long paths** 
> 
> For Windows Server 2016, you can use the same group policy setting when you install the latest Administrative Templates (.admx) for Windows 10.
>
> For more information, see the [Maximum Path Length Limitation](https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file#maximum-path-length-limitation) section from the Windows 10 developer documentation.

This module installs in **\ProgramFiles (x86)\Microsoft Azure Information Protection** and adds this folder to the **PSModulePath** system variable. The .dll for this module is named **AIP.dll**.

> [!IMPORTANT]
> The AzureInformationProtection module doesn't support configuring advanced settings for labels or label policies. For these settings, you need the Office 365 Security & Compliance Center PowerShell. For more information, see [Custom configurations for the Azure Information Protection unified labeling client](clientv2-admin-guide-customizations.md).

### Prerequisites for using the AzureInformationProtection module

In addition to the prerequisites for installing the AzureInformationProtection module, there are additional prerequisites for when you use the labeling cmdlets for Azure Information Protection:

1. The Azure Rights Management service must be activated.

2. To remove protection from files for others using your own account: 

    - The super user feature must be enabled for your organization and your account must be configured to be a super user for Azure Rights Management.

#### Prerequisite 1: The Azure Rights Management service must be activated

If your Azure Information Protection tenant is not activated, see the instructions for [[Activating the protection service from Azure Information Protection](../activate-service.md).

#### Prerequisite 2: To remove protection from files for others using your own account

Typical scenarios for removing protection from files for others include data discovery or data recovery. If you are using labels to apply the protection, you could remove the protection by setting a new label that doesn't apply protection or by removing the label.

You must have a Rights Management usage right to remove protection from files, or be a super user. For data discovery or data recovery, the super user feature is typically used. To enable this feature and configure your account to be a super user, see [Configuring super users for Azure Rights Management and Discovery Services or Data Recovery](../configure-super-users.md).

## How to label files non-interactively for Azure Information Protection

You can run the labeling cmdlets non-interactively by using the **Set-AIPAuthentication** cmdlet.

By default, when you run the cmdlets for labeling, the commands run in your own user context in an interactive PowerShell session. To run them unattended, create a new Azure AD user account for this purpose. Then, in the context of that user, run the Set-AIPAuthentication cmdlet to set and store credentials by using an access token from Azure AD. This user account is then authenticated and bootstrapped for the protection service from Azure Information Protection. The account downloads the Azure Information Protection policy and any protection templates that the labels use.

> [!NOTE]
> If you use label policies for different users, remember that you might need to add this account to a specific label policy.

The first time you run this cmdlet, you are prompted to sign in for Azure Information Protection. Specify the user account name and password that you created for the unattended account. After that, this account can then run the labeling cmdlets non-interactively until the authentication token in Azure AD expires. 

For the user account to be able to sign in interactively this first time, the account must have the **Log on locally** user right assignment. This right is standard for user accounts but your company policies might prohibit this configuration for service accounts. If that's the case, you can run Set-AIPAuthentication with the *OnBehalfOf* parameter so that authentication completes without the sign-in prompt.

When the token in Azure AD expires, run the cmdlet again to acquire a new token.

If you run this cmdlet without parameters, the account acquires an access token that is valid for 90 days or until your password expires.  

To control when the access token expires, run this cmdlet with parameters. This configuration lets you configure the access token in Azure AD for one year, two years, or to never expire. You require two applications registered in Azure Active Directory: A **Web app / API** application and a **native application**. The parameters for Set-AIPAuthentication use values from these applications.

After you have run this cmdlet, you can run the labeling cmdlets in the context of the service account that you created.

### To create and configure the Azure AD applications for Set-AIPAuthentication

> [!NOTE]
> This procedure is changed for the current preview version of the unified labeling client and the preview version of the scanner. For those new instructions, see [To create and configure the Azure AD applications for Set-AIPAuthentication - preview client](#to-create-and-configure-the-azure-ad-applications-for-set-aipauthentication---preview-client).

1. In a new browser window, sign in the [Azure portal](https://portal.azure.com/).

2. For the Azure AD tenant that you use with Azure Information Protection, navigate to **Azure Active Directory** > **Manage** > **App registrations**. 

3. Select **+ New registration**, to create your Web app /API application. On the **Register an application** blade, specify the following values, and then click **Register**:

   - **Name**: `AIPOnBehalfOf`
        
        If you prefer, specify a different name. It must be unique per tenant.
    
    - **Supported account types**: **Accounts in this organizational directory only**
    
    - **Redirect URI (optional)**: **Web** and `http://localhost`

4. On the **AIPOnBehalfOf** blade, copy the value for the **Application (client) ID**. The value looks similar to the following example: `57c3c1c3-abf9-404e-8b2b-4652836c8c66`. This value is used for the *WebAppId* parameter when you run the Set-AIPAuthentication cmdlet. Paste and save the value for later reference.

5. Still on the **AIPOnBehalfOf** blade, from the **Manage** menu, select **Authentication**.

6. On the **AIPOnBehalfOf - Authentication** blade, in the **Advanced settings** section, select the **ID tokens** checkbox, and then select **Save**.

7. Still on the **AIPOnBehalfOf - Authentication** blade, from the **Manage** menu, select **Certificates & secrets**.

8. On the **AIPOnBehalfOf - Certificates & secrets** blade, in the **Client secrets** section, select **+ New client secret**. 

9. For **Add a client secret**, specify the following, and then select **Add**:
    
    - **Description**: `Azure Information Protection client`
    - **Expires**: Specify your choice of duration (1 year, 2 years, or never expires)

9. Back on the **AIPOnBehalfOf - Certificates & secrets** blade, in the **Client secrets** section, copy the string for the **VALUE**. This string looks similar to the following example: `+LBkMvddz?WrlNCK5v0e6_=meM59sSAn`. To make sure you copy all the characters, select the icon to **Copy to clipboard**. 
    
    It's important that you save this string because it is not displayed again and it cannot be retrieved. As with any sensitive information that you use, store the saved value securely and restrict access to it.

10. Still on the **AIPOnBehalfOf - Certificates & secrets** blade, from the **Manage** menu, select **Expose an API**.

11. On the **AIPOnBehalfOf - Expose an API** blade, select **Set** for the **Application ID URI** option, and in the **Application ID URI** value, change **api** to **http**. This string looks similar to the following example: `http://d244e75e-870b-4491-b70d-65534953099e`. 
    
    Select **Save**.

12. Back on the **AIPOnBehalfOf - Expose an API** blade, select **+ Add a scope**.

13. On the **Add a scope** blade, specify the following, using the suggested strings as examples, and then select **Add scope**:
    - **Scope name**: `user-impersonation`
    - **Who can consent?**: **Admins and users**
    - **Admin consent display name**: `Access Azure Information Protection scanner`
    - **Admin consent description**: `Allow the application to access the scanner for the signed-in user`
    - **User consent display name**: `Access Azure Information Protection scanner`
    - **User consent description**: `Allow the application to access the scanner for the signed-in user`
    - **State**: **Enabled** (the default)

14. Back on the **AIPOnBehalfOf - Expose an API** blade, close this blade.

15. On the **App registrations** blade, select **+ New application registration** to now create your native application.

16. On the **Register an application** blade, specify the following settings, and then select **Register**:
    - **Name**: `AIPClient`
    - **Supported account types**: **Accounts in this organizational directory only**
    - **Redirect URI (optional)**: **Public client (mobile & desktop)** and `http://localhost`

17. On the **AIPClient** blade, copy the value of the **Application (client) ID**. The value looks similar to the following example: `8ef1c873-9869-4bb1-9c11-8313f9d7f76f`. 
    
    This value is used for the NativeAppId parameter when you run the Set-AIPAuthentication cmdlet. Paste and save the value for later reference.

18. Still on the **AIPClient** blade, from the **Manage** menu, select **Authentication**.

19. On the **AIPClient - Authentication** blade, specify the following, and then select **Save**:
    - In the **Advanced settings** section, select **ID tokens**.
    - In the **Default client type** section, select **Yes**.

20. Still on the **AIPClient - Authentication** blade, from the **Manage** menu, select **API permissions**.

21. On the **AIPClient - permissions** blade, select **+ Add a permission**.

22. On the **Request API permissions** blade, select **My APIs**.

23. In the **Select an API** section, select **APIOnBehalfOf**, then select the checkbox for **user-impersonation**, as the permission. Select **Add permissions**. 

24. Back on the **API permissions** blade, in the **Grant consent** section, select **Grant admin consent for \<*your tenant name*>** and select **Yes** for the confirmation prompt.

You've now completed the configuration of the two apps and you have the values that you need to run [Set-AIPAuthentication](/powershell/module/azureinformationprotection/set-aipauthentication) with the parameters *WebAppId*, *WebAppKey* and *NativeAppId*. From our examples:

`Set-AIPAuthentication -WebAppId "57c3c1c3-abf9-404e-8b2b-4652836c8c66" -WebAppKey "+LBkMvddz?WrlNCK5v0e6_=meM59sSAn" -NativeAppId "8ef1c873-9869-4bb1-9c11-8313f9d7f76f"`

Run this command in the context of the account that will label and protect the documents non-interactively. For example, a user account for your PowerShell scripts or the service account to run the Azure Information Protection scanner.

When you run this command for the first time, you are prompted to sign in, which creates and securely stores the access token for your account in %localappdata%\Microsoft\MSIP. After this initial sign-in, you can label and protect files non-interactively on the computer. However, if you use a service account to label and protect files, and this service account cannot sign in interactively, use the *OnBehalfOf* parameter with Set-AIPAuthentication:

1. Create a variable to store the credentials of an Active Directory account that is granted the user right assignment to sign in interactively. For example:
    
    	$pscreds = Get-Credential "scv_scanner@contoso.com"

2. Run the Set-AIPAuthentication cmdlet, with the *OnBeHalfOf* parameter, specifying as its value the variable that you just created. For example:
    
    	Set-AIPAuthentication -WebAppId "57c3c1c3-abf9-404e-8b2b-4652836c8c66" -WebAppKey "+LBkMvddz?WrlNCK5v0e6_=meM59sSAn" -NativeAppId "8ef1c873-9869-4bb1-9c11-8313f9d7f76f" -OnBehalfOf $pscreds


#### To create and configure the Azure AD applications for Set-AIPAuthentication - preview client

Use the following procedure as alternative instructions only if you have installed the preview version of the unified labeling client. 

For this version of the client, you must create a new app registration for the *AppId* and *AppSecret* parameters for Set-AIPAuthentication. If you upgraded from a previous version of the client and created an app registration for the previous *WebAppId* and *NativeAppId* parameters, they won't work with this version of the client.

1. In a new browser window, sign in the [Azure portal](https://portal.azure.com/).

2. For the Azure AD tenant that you use with Azure Information Protection, navigate to **Azure Active Directory** > **Manage** > **App registrations**. 

3. Select **+ New registration**. On the **Register an application** blade, specify the following values, and then click **Register**:

   - **Name**: `AIPv2OnBehalfOf`
        
        If you prefer, specify a different name. It must be unique per tenant.
    
    - **Supported account types**: **Accounts in this organizational directory only**
    
    - **Redirect URI (optional)**: **Web** and `https://localhost`

4. On the **AIPv2OnBehalfOf** blade, copy the value for the **Application (client) ID**. The value looks similar to the following example: `77c3c1c3-abf9-404e-8b2b-4652836c8c66`. This value is used for the *AppId* parameter when you run the Set-AIPAuthentication cmdlet. Paste and save the value for later reference.

5. Still on the **AIPv2OnBehalfOf** blade, from the **Manage** menu, select **Certificates & secrets**.

6. On the **AIPv2OnBehalfOf - Certificates & secrets** blade, in the **Client secrets** section, select **+ New client secret**.

7. For **Add a client secret**, specify the following, and then select **Add**:
    
    - **Description**: `Azure Information Protection unified labeling client`
    - **Expires**: Specify your choice of duration (1 year, 2 years, or never expires)

8. Back on the **AIPv2OnBehalfOf - Certificates & secrets** blade, in the **Client secrets** section, copy the string for the **VALUE**. This string looks similar to the following example: `OAkk+rnuYc/u+]ah2kNxVbtrDGbS47L4`. To make sure you copy all the characters, select the icon to **Copy to clipboard**. 
    
    It's important that you save this string because it is not displayed again and it cannot be retrieved. As with any sensitive information that you use, store the saved value securely and restrict access to it.

9. From the **Manage** menu, select **API permissions**.

10. On the **AIPv2OnBehalfOf - API permissions** blade, select **+ Add a permission**.

11. On the **Request API permissions** blade, select **Azure Rights Management Services** and when you're prompted for the type of permissions that your application requires, select **Application permissions**.

12. For **Select permissions**, expand **Content** and select the following:
    
    -  **Content.DelegatedWriter** (always required)
    -  **Content.Writer** (always required)
    -  **Content.SuperUser** (required if the [super user feature](../configure-super-users.md) is needed) 
    
    The super user feature allows the account to always decrypt content. For example, to reprotect files and inspect files that others have protected.

13. Select **Add permissions**.

14. Back on the **AIPv2OnBehalfOf - API permissions** blade, select **Grant admin consent for \<*your tenant name*>** and select **Yes** for the confirmation prompt.

You've now completed the registration of this app with a secret, you're ready to run [Set-AIPAuthentication](/powershell/module/azureinformationprotection/set-aipauthentication) with the parameters *AppId*, and *AppSecret*. Additionally, you'll need your tenant ID. You can quickly copy your tenant ID by using Azure portal: **Azure Active Directory** > **Manage** > **Properties** > **Directory ID**.

From our examples and an example tenant ID of 9c11c87a-ac8b-46a3-8d5c-f4d0b72ee29a:

`Set-AIPAuthentication -AppId "77c3c1c3-abf9-404e-8b2b-4652836c8c66" -AppSecret "OAkk+rnuYc/u+]ah2kNxVbtrDGbS47L4" -TenantId "9c11c87a-ac8b-46a3-8d5c-f4d0b72ee29a"`

Run this command in the context of the account that will label and protect the documents non-interactively. For example, a user account for your PowerShell scripts or the service account to run the Azure Information Protection scanner.

When you run this command for the first time, you are prompted to sign in, which creates and securely stores the access token for your account in %localappdata%\Microsoft\MSIP. After this initial sign-in, you can label and protect files non-interactively on the computer. However, if you use a service account to label and protect files, and this service account cannot sign in interactively, use the *OnBehalfOf* parameter with Set-AIPAuthentication:

1. Create a variable to store the credentials of an Active Directory account that is granted the user right assignment to sign in interactively. For example:
    
    	$pscreds = Get-Credential "scv_scanner@contoso.com"

2. Run the Set-AIPAuthentication cmdlet, with the *OnBeHalfOf* parameter, specifying as its value the variable that you just created. For example:
    
    	Set-AIPAuthentication -AppId "77c3c1c3-abf9-404e-8b2b-4652836c8c66" -AppSecret "OAkk+rnuYc/u+]ah2kNxVbtrDGbS47L4" -TenantId "9c11c87a-ac8b-46a3-8d5c-f4d0b72ee29a" -OnBehalfOf $pscreds


## Next steps
For cmdlet help when you are in a PowerShell session, type `Get-Help <cmdlet name> -online`. For example: 

    Get-Help Set-AIPFileLabel -online

See the following for additional information that you might need to support the Azure Information Protection client:

- [Customizations](clientv2-admin-guide-customizations.md)

- [Client files and usage logging](clientv2-admin-guide-files-and-logging.md)

- [File types supported](clientv2-admin-guide-file-types.md)
