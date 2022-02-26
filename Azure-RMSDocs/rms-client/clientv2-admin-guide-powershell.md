---
# required metadata

title: Use PowerShell with the Azure Information Protection unified labeling client
description: Instructions and information for admins to manage the Azure Information Protection unified labeling client by using PowerShell.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 01/14/2021
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

>***Applies to**: [Azure Information Protection](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection), Windows 11, Windows 10, Windows 8.1, Windows 8, Windows Server 2019, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012*
>
>*If you have Windows 7 or Office 2010, see [AIP and legacy Windows and Office versions](../known-issues.md#aip-and-legacy-windows-and-office-versions).*
>
>***Relevant for**: [Azure Information Protection unified labeling client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients).*

When you install the Azure Information Protection unified labeling client, PowerShell commands are automatically installed as part of the [AzureInformationProtection](/powershell/module/azureinformationprotection) module, with cmdlets for labeling. 

The **AzureInformationProtection** module enables you to manage the client by running commands for automation scripts.

For example:

- [Get-AIPFileStatus](/powershell/module/azureinformationprotection/get-aipfilestatus): Gets the Azure Information Protection label and protection information for a specified file or files.
- [Set-AIPFileClassification](/powershell/module/azureinformationprotection/set-aipfileclassification): Scans a file to automatically set an Azure Information Protection label for a file, according to conditions that are configured in the policy.
- [Set-AIPFileLabel](/powershell/module/azureinformationprotection/set-aipfilelabel): Sets or removes an Azure Information Protection label for a file, and sets or removes the protection according to the label configuration or custom permissions.
- [Set-AIPAuthentication](/powershell/module/azureinformationprotection/set-aipauthentication): Sets the authentication credentials for the Azure Information Protection client.

The **AzureInformationProtection** module is installed in the **\ProgramFiles (x86)\Microsoft Azure Information Protection** folder, and then adds this folder to the **PSModulePath** system variable. The .dll for this module is named **AIP.dll**.

> [!IMPORTANT]
> The **AzureInformationProtection** module doesn't support configuring advanced settings for labels or label policies. 
>
>For these settings, you need the Office 365 Security & Compliance Center PowerShell. For more information, see [Custom configurations for the Azure Information Protection unified labeling client](clientv2-admin-guide-customizations.md).

> [!TIP]
> To use cmdlets with path lengths greater than 260 characters, use the following [group policy setting](/archive/blogs/jeremykuhne/net-4-6-2-and-long-paths-on-windows-10) that is available starting Windows 10, version 1607:<br /> **Local Computer Policy** > **Computer Configuration** > **Administrative Templates** > **All Settings** > **Enable Win32 long paths** 
> 
> For Windows Server 2016, you can use the same group policy setting when you install the latest Administrative Templates (.admx) for Windows 10.
>
> For more information, see the [Maximum Path Length Limitation](/windows/desktop/FileIO/naming-a-file#maximum-path-length-limitation) section from the Windows 10 developer documentation.

## Prerequisites for using the AzureInformationProtection module

In addition to the prerequisites for installing the **AzureInformationProtection** module, there are extra prerequisites for when you use the labeling cmdlets for Azure Information Protection:

- **The Azure Rights Management service must be activated**.

    If your Azure Information Protection tenant is not activated, see the instructions for [Activating the protection service from Azure Information Protection](../activate-service.md).

- **To remove protection from files for others using your own account**:

    - The [super user](../configure-super-users.md) feature must be enabled for your organization.
    - Your account must be configured to be a super user for Azure Rights Management.

    For example, you may want to remove protection for others for the sake of data discovery or recovery. If you are using labels to apply protection, you can remove that protection by setting a new label that doesn't apply protection, or you can remove the label.

    To remove protection, use the [Set-AIPFileLabel](/powershell/module/azureinformationprotection/set-aipfilelabel) cmdlet with the *RemoveProtection* parameter. In some cases, the remove protection capability may be disabled by default and must first be enabled using the [Set-LabelPolicy](clientv2-admin-guide-customizations.md#enable-removal-of-protection-from-compressed-files) cmdlet.

## RMS to unified labeling cmdlet mapping

If you've migrated from Azure RMS, note that RMS-related cmdlets have been deprecated for use in unified labeling. 

Some of the legacy cmdlets have been replaced with new cmdlets for unified labeling. For example, if you used **New-RMSProtectionLicense** with RMS protection and have migrated to unified labeling, use **New-AIPCustomPermissions** instead.

The following table maps RMS-related cmdlets with the updated cmdlets used for unified labeling:

|RMS cmdlet  |Unified labeling cmdlet  |
|---------|---------|
|[Get-RMSFileStatus](/powershell/module/azureinformationprotection/get-rmsfilestatus)     |  [Get-AIPFileStatus](/powershell/module/azureinformationprotection/get-aipfilestatus)        |
|[Get-RMSServer](/powershell/module/azureinformationprotection/get-rmsserver)     |  Not relevant for unified labeling.      |
|[Get-RMSServerAuthentication](/powershell/module/azureinformationprotection/get-rmsserverauthentication)      |   [Set-AIPAuthentication](/powershell/module/azureinformationprotection/set-aipauthentication)       |
|[Clear-RMSAuthentication](/powershell/module/azureinformationprotection/clear-rmsauthentication)     | [Set-AIPAuthentication](/powershell/module/azureinformationprotection/set-aipauthentication)       |
|[Set-RMSServerAuthentication](/powershell/module/azureinformationprotection/set-rmsserverauthentication)     |  [Set-AIPAuthentication](/powershell/module/azureinformationprotection/set-aipauthentication)      |
|[Get-RMSTemplate](/powershell/module/azureinformationprotection/get-rmstemplate)     |       Not relevant for unified labeling  |
|[New-RMSProtectionLicense](/powershell/module/azureinformationprotection/new-rmsprotectionlicense)     |  [New-AIPCustomPermissions](/powershell/module/azureinformationprotection/new-aipcustompermissions), and [Set-AIPFileLabel](/powershell/module/azureinformationprotection/set-aipfilelabel), with the **CustomPermissions** parameter      |
|[Protect-RMSFile](/powershell/module/azureinformationprotection/protect-rmsfile) |[Set-AIPFileLabel](/powershell/module/azureinformationprotection/set-aipfilelabel), with the **RemoveProtection** parameter |
| | |


## How to label files non-interactively for Azure Information Protection

By default, when you run the cmdlets for labeling, the commands run in your own user context in an interactive PowerShell session.

For more information, see:

- [Prerequisites for running AIP labeling cmdlets unattended](#prerequisites-for-running-aip-labeling-cmdlets-unattended)
- [Create and configure Azure AD applications for Set-AIPAuthentication](#create-and-configure-azure-ad-applications-for-set-aipauthentication)
- [Running the Set-AIPAuthentication cmdlet](#running-the-set-aipauthentication-cmdlet)

> [!NOTE]
> If the computer cannot have internet access, there's no need to create the app in Azure AD and run the **Set-AIPAuthentication** cmdlet. Instead, follow the instructions for [disconnected computers](clientv2-admin-guide-customizations.md#support-for-disconnected-computers).  

### Prerequisites for running AIP labeling cmdlets unattended

To run Azure Information Protection labeling cmdlets unattended, use the following access details:

- **A Windows account** that can sign in interactively.

- **An Azure AD account**, for delegated access. For ease of administration, use a single account that's synchronized from Active Directory to Azure AD.

    For the delegated user account:

    |Requirement  |Details  |
    |---------|---------|
    |**Label policy**     |  Make sure that you have a label policy assigned to this account and that the policy contains the published labels you want to use.   <br><br>If you use label policies for different users, you might need to create a new label policy that publishes all your labels, and publish the policy to just this delegated user account.    |
    |**Decrypting content**     |    If this account needs to decrypt content, for example, to reprotect files and inspect files that others have protected, make it a [super user](../configure-super-users.md) for Azure Information Protection and make sure the super user feature is enabled.     |
    |**Onboarding controls**     |    If you have implemented [onboarding controls](../activate-service.md#configuring-onboarding-controls-for-a-phased-deployment) for a phased deployment, make sure that this account is included in your onboarding controls you've configured.     |
    |     |         |

- **An Azure AD access token**, which sets and stores credentials for the delegated user to authenticate to Azure Information Protection. When the token in Azure AD expires, you must run the cmdlet again to acquire a new token. 

    The parameters for **Set-AIPAuthentication** use values from an app registration process in Azure AD. For more information, see [Create and configure Azure AD applications for Set-AIPAuthentication](#create-and-configure-azure-ad-applications-for-set-aipauthentication).

Run the labeling cmdlets non-interactively by first running the [Set-AIPAuthentication](/powershell/module/azureinformationprotection/set-aipauthentication) cmdlet.

The computer running the **AIPAuthentication** cmdlet downloads the labeling policy that's assigned to your delegated user account in the Microsoft 365 Compliance center.

### Create and configure Azure AD applications for Set-AIPAuthentication

The **Set-AIPAuthentication** cmdlet requires an app registration for the *AppId* and *AppSecret* parameters. 

For users who've recently migrated from the classic client, and had created an app registration for the previous *WebAppID* and *NativeAppId* parameters, you'll need to create a new app registration for the unified labeling client.

**To create a new app registration for the unified labeling client Set-AIPAuthentication cmdlet**:

1. In a new browser window, sign in the [Azure portal](https://portal.azure.com/) to the Azure AD tenant that you use with Azure Information Protection.

1. Navigate to **Azure Active Directory** > **Manage** > **App registrations**, and select **New registration**. 

1. On the **Register an application** pane, specify the following values, and then click **Register**:

    |Option  |Value  |
    |---------|---------|
    |**Name**     |  `AIP-DelegatedUser` <br>Specify a different name as needed. The name must be unique per tenant.       |
    |**Supported account types**     |   Select **Accounts in this organizational directory only**.      |
    |**Redirect URI (optional)**     |     Select **Web**, and then enter `https://localhost`.    |
    |     |         |

1. On the **AIP-DelegatedUser** pane, copy the value for the **Application (client) ID**. 

    The value looks similar to the following example: `77c3c1c3-abf9-404e-8b2b-4652836c8c66`. 

    This value is used for the *AppId* parameter when you run the **Set-AIPAuthentication cmdlet**. Paste and save the value for later reference.

1. From the sidebar, select **Manage** > **Certificates & secrets**.

    Then, on the **AIP-DelegatedUser - Certificates & secrets** pane, in the **Client secrets** section, select **New client secret**.

1. For **Add a client secret**, specify the following, and then select **Add**:

    |Field  |Value  |
    |---------|---------|
    |**Description**     |  `Azure Information Protection unified labeling client`       |
    |**Expires**     |   Specify your choice of duration (1 year, 2 years, or never expires)     |
    |     |         |

1. Back on the **AIP-DelegatedUser - Certificates & secrets** pane, in the **Client secrets** section, copy the string for the **VALUE**. 

    This string looks similar to the following example: `OAkk+rnuYc/u+]ah2kNxVbtrDGbS47L4`. 

    To make sure you copy all the characters, select the icon to **Copy to clipboard**. 
    
    > [!IMPORTANT]
    > It's important that you save this string because it is not displayed again and it cannot be retrieved. As with any sensitive information that you use, store the saved value securely and restrict access to it.
    > 

1. From the sidebar, select **Manage** > **API permissions**.

    On the **AIP-DelegatedUser - API permissions** pane, select **Add a permission**.

1. On the **Request API permissions** pane, make sure that you're on the **Microsoft APIs** tab, and select **Azure Rights Management Services**. 

    When you're prompted for the type of permissions that your application requires, select **Application permissions**.

1. For **Select permissions**, expand **Content** and select the following, and then select **Add permissions**.
    
    -  **Content.DelegatedReader** 
    -  **Content.DelegatedWriter**

1. Back on the **AIP-DelegatedUser - API permissions** pane, select **Add a permission** again.

    On the **Request AIP permissions** pane, select **APIs my organization uses**, and search for **Microsoft Information Protection Sync Service**.

1. On the **Request API permissions** pane, select **Application permissions**.
    
    For **Select permissions**, expand **UnifiedPolicy**, select **UnifiedPolicy.Tenant.Read**, and then select **Add permissions**.

1. Back on the **AIP-DelegatedUser - API permissions** pane, select **Grant admin consent for \<*your tenant name*>** and select **Yes** for the confirmation prompt.
    
    Your API permissions should look like the following image:

    :::image type="content" source="../media/api-permissions-app.png" alt-text="API permissions for the registered app in Azure AD":::

Now you've completed the registration of this app with a secret, you're ready to run [Set-AIPAuthentication](/powershell/module/azureinformationprotection/set-aipauthentication) with the parameters *AppId*, and *AppSecret*. Additionally, you'll need your tenant ID. 

> [!TIP]
>You can quickly copy your tenant ID by using Azure portal: **Azure Active Directory** > **Manage** > **Properties** > **Directory ID**.

### Running the Set-AIPAuthentication cmdlet

1. Open Windows PowerShell with the **Run as administrator option**. 

1. In your PowerShell session, create a variable to store the credentials of the Windows user account that will run non-interactively. For example, if you created a service account for the scanner:

    ```PowerShell
    $pscreds = Get-Credential "CONTOSO\srv-scanner"
    ```

    You're prompted for this account's password.

1. Run the **Set-AIPAuthentication** cmdlet, with the *OnBeHalfOf* parameter, specifying as its value the variable that you created. 

    Also specify your app registration values, your tenant ID, and the name of the delegated user account in Azure AD. For example:
    
    ```PowerShell
    Set-AIPAuthentication -AppId "77c3c1c3-abf9-404e-8b2b-4652836c8c66" -AppSecret "OAkk+rnuYc/u+]ah2kNxVbtrDGbS47L4" -TenantId "9c11c87a-ac8b-46a3-8d5c-f4d0b72ee29a" -DelegatedUser scanner@contoso.com -OnBehalfOf $pscreds
    ```
    
## Common parameters for PowerShell cmdlets

For information about common parameters, see [About common parameters](/powershell/module/microsoft.powershell.core/about/about_commonparameters).

## Next steps

For cmdlet help when you are in a PowerShell session, type `Get-Help <cmdlet name> -online`. For example: 

```PowerShell
Get-Help Set-AIPFileLabel -online
```

For more information, see:

- [Unified labeling client customizations](clientv2-admin-guide-customizations.md)

- [Client files and usage logging](clientv2-admin-guide-files-and-logging.md)

- [Supported file types](clientv2-admin-guide-file-types.md)
