---
# required metadata

title: Use PowerShell with the Azure Information Protection client
description: Instructions and information for admins to manage the Azure Information Protection client by using PowerShell.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 07/17/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 4f9d2db7-ef27-47e6-b2a8-d6c039662d3c

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: eymanor
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---


# Using PowerShell with the Azure Information Protection client

>*Applies to: Active Directory Rights Management Services, Azure Information Protection, Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012*

When you install the Azure Information Protection client, PowerShell commands are automatically installed so that you can manage the client by running commands that you can put into scripts for automation.

The cmdlets are installed with the PowerShell module **AzureInformationProtection**, which replaces the RMSProtection module that was installed with the RMS Protection Tool. If you have the RMSProtection tool installed when you install the Azure Information Protection client, the RMSProtection module is automatically uninstalled.

The AzureInformationProtection module includes all the Rights Management cmdlets from the RMS Protection Tool, and three new cmdlets that use the Azure Information Protection (AIP) service for labeling:

|Labeling cmdlet|Example usage|
|----------------|---------------|
|[Get-AIPFileStatus](/powershell/module/azureinformationprotection/get-aipfilestatus)|For a shared folder, identify all files with a specific label.|
|[Set-AIPFileClassification](/powershell/module/azureinformationprotection/set-aipfileclassification)|For a shared folder, inspect the file contents and then automatically label unlabeled files, according to the conditions that you have specified.|
|[Set-AIPFileLabel](/powershell/module/azureinformationprotection/set-aipfilelabel)|For a shared folder, apply a specified label to all files that do not have a label.|

For a list of all the cmdlets and their corresponding help, see [AzureInformationProtection Module](/powershell/module/azureinformationprotection). Within a PowerShell session, type `Get-Help <cmdlet name> -online` to see the latest help, and for supported languages other than English.  

This module installs in **\ProgramFiles (x86)\Microsoft Azure Information Protection** and adds this folder to the **PSModulePath** system variable. The .dll for this module is named **AIP.dll**.

As with the RMSProtection module, the current release of the AzureInformationProtection module has the following limitations:

- You can unprotect Outlook personal folders (.pst files), but you cannot currently natively protect these files or other container files by using this PowerShell module.

- You can unprotect Outlook protected email messages (.rpmsg files) when they are in a Outlook personal folder (.pst), but you cannot unprotect .rpmsg files outside a personal folder.

Before you start to use these cmdlets, see the additional prerequisites and instructions that corresponds to your deployment:

- [Azure Information Protection service and Azure Rights Management service](#azure-information-protection-service-and-azure-rights-management-service)

	- Applicable if you use classification-only or classification with Rights Management protection: You have a subscription that includes Azure Information Protection (for example, Enterprise Mobility + Security).
	- Applicable if you use protection-only with the Azure Rights Management service: You have a subscription that includes the Azure Rights Management service (for example, Office 365 E3 and Office 365 E5).

- [Active Directory Rights Management Services](#active-directory-rights-management-services)

	- Applicable if you use protection-only with the on-premises version of Azure Rights Management; Active Directory Rights Management Services (AD RMS).


## Azure Information Protection service and Azure Rights Management service

Read this section before you start using the PowerShell commands when your organization uses Azure Information Protection and the Azure Rights Management data protection service, or just the the Azure Rights Management service.


### Prerequisites

In addition to the prerequisites for installing the AzureInformationProtection module, there are additional prerequisite for the Azure Information Protection service and the Azure Rights Management data protection service:

1. The Azure Rights Management service must be activated.

2. To remove protection from files for others using your own account: 
    
    - The super user feature must be enabled for your organization and your account must be configured to be a super user for Azure Rights Management.

3. To directly protect or unprotect files without user interaction: 
    
    - Create a service principal account, run Set-RMSServerAuthentication, and consider making this service principal a super user for Azure Rights Management.

4. For regions outside North America: 
    
    - Edit the registry for authentication to the service.

#### Prerequisite 1: The Azure Rights Management service must be activated

This prerequisite applies whether you apply the data protection by using labels or by directly connecting to the Azure Rights Management service to apply the data protection.

If your Azure Information Protection tenant is not activated, see the instructions for [Activating Azure Rights Management](../deploy-use/activate-service.md).

#### Prerequisite 2: To remove protection from files for others using your own account

Typical scenarios for removing protection from files for others include data discovery or data recovery. If you are using labels to apply the protection, you could remove the protection by setting a new label that doesn't apply protection or by removing the label. But you will more likely connect directly to the Azure Rights Management service to remove the protection.

You must have a Rights Management usage right to remove protection from files, or be a super user. For data discovery or data recovery, the super user feature is typically used. To enable this feature and configure your account to be a super user, see [Configuring super users for Azure Rights Management and Discovery Services or Data Recovery](../deploy-use/configure-super-users.md).

#### Prerequisite 3: To protect or unprotect files without user interaction

Currently, you cannot apply labels non-interactively but you can connect directly to the Azure Rights Management service non-interactively to protect or unprotect files.

You must use a service principal to connect to the Azure Rights Management service non-interactively, which you do by using the `Set-RMSServerAuthentication` cmdlet. You must do this for each Windows PowerShell session that runs cmdlets that directly connect to the Azure Rights Management service. Before you run this cmdlet, make sure that you have these three identifiers:

- BposTenantId

- AppPrincipalId

- Symmetric Key

The next sections explain how to get these identifiers.

##### To get the BposTenantId

Run the Get-AadrmConfiguration cmdlet from the Azure RMS
Windows PowerShell module:

1. If this module is not already installed on your computer, see
[Installing Windows PowerShell for Azure Rights Management](../deploy-use/install-powershell.md).

2. Start Windows PowerShell with the **Run as Administrator** option.

3. Use the `Connect-AadrmService` cmdlet to connect to the Azure Rights Management service:
    
    	Connect-AadrmService
    
    When prompted, enter your Azure Information Protection tenant administrator credentials (typically, you will use an account that is a global administrator for Azure Active Directory or Office 365).
    
4. Run `Get-AadrmConfiguration` and make a copy of the BPOSId value.
    
    The following is an example of output from Get-AadrmConfiguration:
    
		    BPOSId                                   : 23976bc6-dcd4-4173-9d96-dad1f48efd42
		
		    RightsManagement ServiceId               : 1a302373-f233-440600909-4cdf305e2e76
		
		    LicensingIntranetDistributionPointUrl    : https://1s302373-f233-4406-9090-4cdf305e2e76.rms.na.aadrm.com/_wmcs/licensing
		
		    LicensingExtranetDistributionPointUrl    : https://1s302373-f233-4406-9090-4cdf305e2e76.rms.na.aadrm.com/_wmcs/licensing
		
		    CertificationIntranetDistributionPointUrl: https://1s302373-f233-4406-9090-4cdf305e2e76.rms.na.aadrm.com/_wmcs/certification
		
		    CertificationExtranetDistributionPointUrl: https://1s302373-f233-4406-9090-4cdf305e2e76.rms.na.aadrm.com/_wmcs/certification

5. Disconnect from the service:
    
    	Disconnect-AadrmService

##### To get the AppPrincipalId and Symmetric Key

Create a new service principal by running the `New-MsolServicePrincipal` cmdlet from the MSOnline PowerShell module for Azure Active Directory and use the following instructions. 

> [!IMPORTANT]
> Do not use the newer Azure AD PowerShell cmdlet, New-AzureADServicePrincipal, to create this service principal. The Azure Rights Management services does not support New-AzureADServicePrincipal. 

1. If the MSOnline module is not already installed on your computer, run `Install-Module MSOnline`.

2. Start Windows PowerShell with the **Run as Administrator** option.

3. Use the **Connect-MsolService** cmdlet to connect to Azure AD:
    
    	Connect-MsolService
    
    When prompted, enter your Azure AD tenant administrator credentials (typically, you will use an account that is a global administrator for Azure Active Directory or Office 365).

4. Run the New-MsolServicePrincipal cmdlet to create a new service principal:
    
    	New-MsolServicePrincipal
    
    When prompted, enter your choice of a display name for this service principal that will help you identify its purpose later as an account for you to connect to the Azure Rights Management service so that you can protect and unprotect files.
    
    An example of the output of New-MsolServicePrincipal:
    
	    Supply values for the following parameters:
	    
	    DisplayName: AzureRMSProtectionServicePrincipal
	    The following symmetric key was created as one was not supplied
	    zIeMu8zNJ6U377CLtppkhkbl4gjodmYSXUVwAO5ycgA=
	    
	    Display Name: AzureRMSProtectionServicePrincipal
	    ServicePrincipalNames: (b5e3f7g1-b5c2-4c96-a594-a0807f65bba4)
	    ObjectId: 23720996-593c-4122-bfc7-1abb5a0b5109
	    AppPrincialId: b5e3f76a-b5c2-4c96-a594-a0807f65bba4
	    TrustedForDelegation: False
	    AccountEnabled: True
	    Addresses: ()
	    KeyType: Symmetric
	    KeyId: 8ef61651-ca11-48ea-a350-25834a1ba17c
	    StartDate: 3/7/2014 4:43:59 AM
	    EndDate: 3/7/2014 4:43:59 AM
	    Usage: Verify

5. From this output, make a note of the symmetric key and the AppPrincialId.

    It is particularly important that you make a copy of the symmetric key because you cannot retrieve it in full later so if you do not know it, you will have to create a new service principal the next time you need to authenticate to the Azure Rights Management service.

From these instructions and our examples, we have the three identifiers
required to run Set-RMSServerAuthentication:

- Tenant Id: **23976bc6-dcd4-4173-9d96-dad1f48efd42**

- Symmetric key: **zIeMu8zNJ6U377CLtppkhkbl4gjodmYSXUVwAO5ycgA=**

- AppPrincipalId: **b5e3f76a-b5c2-4c96-a594-a0807f65bba4**

Our example command would then look like the following:

	Set-RMSServerAuthentication -Key zIeMu8zNJ6U377CLtppkhkbl4gjodmYSXUVwAO5ycgA=-AppPrincipalId b5e3f76a-b5c2-4c96-a594-a0807f65bba4-BposTenantId 23976bc6-dcd4-4173-9d96-dad1f48efd42

As shown in the previous command, you can supply the values with a single command, or just type Set-RMSServerAuthentication, and supply the values one-by-one when prompted. When the command completes, you see "**The RmsServerAuthentication is set to ON**", which means that the client is now operating in "server mode". This message does not confirm that authentication was successful by using the values you supplied, but that the switch to server mode was successful.

Consider making this service principal a super user: To ensure that this service principal can always unprotect files for others, it can be configured to be a super user. In the same way as you configure a standard user account to be a super user, you use the same Azure RMS cmdlet, [Add-AadrmSuperUser](/powershell/aadrm/vlatest/Add-AadrmSuperUser.md) but specify the **-ServicePrincipalId** parameter with your AppPrincipalId value.

For more information about super users, see [Configuring super users for Azure Rights Management and discovery services or data recovery](../deploy-use/configure-super-users.md).

> [!NOTE]
> To use your own account to authenticate to the Azure Rights Management service, there's no need to run Set-RMSServerAuthentication before you protect or unprotect files, or get templates.

#### Prerequisite 4: For regions outside North America

For authentication outside the Azure North America region, you must edit the registry as follows. If your Azure Information Protection tenant is in North America, do not do this step:

1. Run the Get-AadrmConfiguration cmdlet again, and make a note of the values for **CertificationExtranetDistributionPointUrl** and **LicensingExtranetDistributionPointUrl**.

2. On each computer where you will run the AzureInformationProtection cmdlets, open the registry editor and navigate to: `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSIPC`

3. If you do not see a **ServiceLocation** key, create it, so that your registry path shows **HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSIPC\ServiceLocation**

4. For the **ServiceLocation** key, create two keys if they do not exist, named **EnterpriseCertification** and **EnterprisePublishing**. 
    
    When you create these REG_SZ keys, do not change the Name of "(Default)", but edit them to set the Value data:

    - For **EnterpriseCertification**, paste your CertificationExtranetDistributionPointUrl value.
    
    - For **EnterprisePublishing**, paste your LicensingExtranetDistributionPointUrl value.

5. Close the registry editor. There is no need to restart your computer. However, if you are using a service principal account rather than your own user account, you must run the Set-RMSServerAuthentication command after making this registry edit.

### Example scenarios for using the cmdlets for Azure Information protection and the Azure Rights Management service

It's more efficient to use labels to classify and protect files, because there are just two cmdlets that you need, which can be run by themselves or together: [Get-AIPFileStatus](/powershell/azureinformationprotection/vlatest/get-aipfilestatus) and  [Set-AIPFileLabel](/powershell/azureinformationprotection/vlatest/set-aipfilelabel). Use the help for both these cmdlets for more information and examples.

However, to protect or unprotect files by directly connecting to the Azure Rights Management service, you must typically run a series of cmdlets as described next.

First, if you need to authenticate to the Azure Rights Management service with a service principal rather than use your own account, in a Powershell session, type:

	Set-RMSServerAuthentication

When prompted, enter the three identifiers as described in [Prerequisite 3: To protect or unprotect files without user interaction](client-admin-guide-powershell.md#prerequisite-3-to-protect-or-unprotect-files-without-user-interaction).

Before you can protect files, you must download the Rights Management templates to your computer and identify which one to use and its corresponding ID number. From the output, you can then copy the template ID:

	Get-RMSTemplate
    
Your output might look similar to the following:

	TemplateId        : {82bf3474-6efe-4fa1-8827-d1bd93339119}
	CultureInfo       : en-US
	Description       : This content is proprietary information intended for internal users only. This content cannot be modified.
	Name              : Contoso, Ltd - Confidential View Only
	IssuerDisplayName : Contoso, Ltd
	FromTemplate      : True
	
	TemplateId        : {e6ee2481-26b9-45e5-b34a-f744eacd53b0}
	CultureInfo       : en-US
	Description       : This content is proprietary information intended for internal users only. This content can be modified but cannot be copied and printed.
	Name              : Contoso, Ltd - Confidential
	IssuerDisplayName : Contoso, Ltd
	FromTemplate      : True
	FromTemplate      : True

Note that if you didn't run the Set-RMSServerAuthentication command, you will be authenticated to the Azure Rights Management service by using your own user account. If you are on a domain-joined computer, your current credentials will always be used automatically. If you are on a workgroup computer, you will be prompted to sign in to Azure and these credentials are then cached for subsequent commands. In this scenario, if you later need to sign in as a different user, use the `Clear-RMSAuthentication` cmdlet.

Now you know the template ID, you can use it with the `Protect-RMSFile` cmdlet to protect a single file or all files in a folder. For example, if you want to protect a single file only and overwrite the original, by using the "Contoso, Ltd - Confidential" template:

	Protect-RMSFile -File C:\Test.docx -InPlace -TemplateId e6ee2481-26b9-45e5-b34a-f744eacd53b0

Your output might look similar to the following:

	InputFile             EncryptedFile
	---------             -------------
	C:\Test.docx          C:\Test.docx

To protect all files in a folder, use the **-Folder** parameter with a drive letter and path, or UNC path. For example:

	Protect-RMSFile -Folder \Server1\Documents -InPlace -TemplateId e6ee2481-26b9-45e5-b34a-f744eacd53b0

Your output might look similar to the following:

	InputFile                          EncryptedFile
	---------                          -------------
	\Server1\Documents\Test1.docx     \Server1\Documents\Test1.docx
	\Server1\Documents\Test2.docx     \Server1\Documents\Test2.docx
	\Server1\Documents\Test3.docx     \Server1\Documents\Test3.docx
	\Server1\Documents\Test4.docx     \Server1\Documents\Test4.docx

When the file name extension does not change after the protection is applied, you can always use the `Get-RMSFileStatus` cmdlet later to check whether the file is protected. For example:

	Get-RMSFileStatus -File \Server1\Documents\Test1.docx

Your output might look similar to the following:

	FileName                              Status
	--------                              ------
	\Server1\Documents\Test1.docx         Protected

To unprotect a file, you must have Owner or Extract rights from when the file was protected, or you must be running the cmdlets as a super user. Then, use the Unprotect cmdlet. For example:

	Unprotect-RMSFile C:\test.docx -InPlace

Your output might look similar to the following:

	InputFile                             DecryptedFile
	---------                             -------------
	C:\Test.docx                          C:\Test.docx

Note that if the Rights Management templates are changed, you must download them again with `Get-RMSTemplate -force`. 

## Active Directory Rights Management Services

Read this section before you start using the PowerShell commands to protect or unprotect files when your organization uses just Active Directory Rights Management Services.


### Prerequisites

In addition to the prerequisites for installing the AzureInformationProtection module, your account must have Read and Execute permissions to access ServerCertification.asmx:

1. Log on to an AD RMS server.

2. Click **Start**, and then click **Computer**.

3. In File Explorer, navigate to %systemdrive%\Initpub\wwwroot\_wmsc\Certification.

4. Right-click **ServerCertification.asmx**, then click **Properties**.

5. In the **ServerCertification.asmx Properties** dialog box, click the **Security** tab. 

6. Click the **Continue** button or the **Edit** button. 

7. In the **Permissions for ServerCertification.asmx** dialog box, click **Add**. 

8. Add your account name. If other AD RMS administrators will also use these cmdlets to protect and unprotect files, add their names as well.

9. In the **Allow** column, make sure that the **Read and Execute**, and the **Read** checkboxes are selected.

10.Click **OK** twice.

### Example scenarios for using the cmdlets for Active Directory Rights Management Services

A typical scenario for these cmdlets is to protect all files in a folder by using a rights policy template, or to unprotect a file. 

First, if you have more than one deployment of AD RMS, you will need the names of your AD RMS servers, which you do by using the Get-RMSServer cmdlet to display a list of available servers:

	Get-RMSServer

Your output might look similar to the following:

	Number of RMS Servers that can provide templates: 2 
	ConnectionInfo             DisplayName          AllowFromScratch
	--------------             -------------        ----------------
	Microsoft.InformationAnd…  RmsContoso                       True
	Microsoft.InformationAnd…  RmsFabrikam                      True

Before you can protect files, you need to get a list of RMS templates to identify which one to use and its corresponding ID number. Only when you have more than one AD RMS deployment will you need to specify the  RMS server as well. 

From the output, you can then copy the template ID:

	Get-RMSTemplate -RMSServer RmsContoso

Your output might look similar to the following:

	TemplateId        : {82bf3474-6efe-4fa1-8827-d1bd93339119}
	CultureInfo       : en-US
	Description       : This content is proprietary information intended for internal users only. This content cannot be modified.
	Name              : Contoso, Ltd - Confidential View Only
	IssuerDisplayName : Contoso, Ltd
	FromTemplate      : True
	
	
	TemplateId        : {e6ee2481-26b9-45e5-b34a-f744eacd53b0}
	CultureInfo       : en-US
	Description       : This content is proprietary information intended for internal users only. This content can be modified but cannot be copied and printed.
	Name              : Contoso, Ltd - Confidential
	IssuerDisplayName : Contoso, Ltd
	FromTemplate      : True
	FromTemplate      : True

Now you know the template ID, you can use it with the Protect-RMSFile cmdlet to protect a single file or all files in a folder. For example, if you want to protect a single file only and replace the original, by using the "Contoso, Ltd - Confidential" template:

	Protect-RMSFile -File C:\Test.docx -InPlace -TemplateId e6ee2481-26b9-45e5-b34a-f744eacd53b0

Your output might look similar to the following:

	InputFile             EncryptedFile
	---------             -------------
	C:\Test.docx          C:\Test.docx   

To protect all files in a folder, use the -Folder parameter with a drive letter and path, or UNC path. For example:

	Protect-RMSFile -Folder \\Server1\Documents -InPlace -TemplateId e6ee2481-26b9-45e5-b34a-f744eacd53b0

Your output might look similar to the following:

	InputFile                          EncryptedFile
	---------                          -------------
	\\Server1\Documents\Test1.docx     \\Server1\Documents\Test1.docx   
	\\Server1\Documents\Test2.docx     \\Server1\Documents\Test2.docx   
	\\Server1\Documents\Test3.docx     \\Server1\Documents\Test3.docx   
	\\Server1\Documents\Test4.docx     \\Server1\Documents\Test4.docx   

When the file name extension does not change after RMS protection is applied, you can always use the Get-RMSFileStatus cmdlet later to check whether the file is protected. For example: 

	Get-RMSFileStatus -File \\Server1\Documents\Test1.docx

Your output might look similar to the following:

	FileName                              Status
	--------                              ------
	\\Server1\Documents\Test1.docx        Protected

To unprotect a file, you must have Owner or Extract rights from when the  file was protected, or be super user for AD RMS. Then, use the Unprotect cmdlet. For example:

	Unprotect-RMSFile C:\test.docx -InPlace

Your output might look similar to the following:

	InputFile                             DecryptedFile
	---------                             -------------
	C:\Test.docx                          C:\Test.docx

## How to label files non-interactively for Azure Information Protection

Beginning with version 1.8.41.0 of the Azure Information Protection client (currently in preview), you can run the labeling cmdlets non-interactively by using the **Set-AIPAuthentication** cmdlet.

By default, when you run the cmdlets for labeling, the commands run in your own user context in an interactive PowerShell session. To run them unattended, create a new Azure AD user account for this purpose. Then, in the context of that user, run the Set-AIPAuthentication cmdlet to set and store credentials by using an access token from Azure AD. This user account is then authenticated and bootstrapped for the Azure Rights Management service. The account downloads the Azure Information Protection policy and any Rights Management templates that the labels use.

The first time you run this cmdlet, you are prompted to sign in for Azure Information Protection. Specify the user account name and password that you created for unattended user. After that, this account can then run the labeling cmdlets non-interactively until the authentication token expires. When the token expires, run the cmdlet again to acquire a new token:

If you run this cmdlet without parameters, the account acquires an access token that is valid for 90 days or until your password expires.  

To control when the access token expires, run this cmdlet with parameters. This lets you configure the access token for 1 year, 2 years, or to never expire. This configuration requires you to have two applications registered in Azure Active Directory: **A web app / API** application and a **native application**. The parameters for this cmdlet use values from these applications.

After you have run this cmdlet, you can run the labeling cmdlets in the context of the user account that you created. If you want to use more than one account, each account must have its own applications registered in Azure AD and therefore you must run this cmdlet for each account.

### To create and configure the Azure AD applications for Set-AIPAuthentication

1. In a new browser window, sign in the [Azure portal](https://portal.azure.com/) 

2. For the Azure AD tenant that you use with Azure Information Protection, navigate to **Azure Active Directory** > **App registrations**. 

3. Select **New application registration**, to create your Web app /API application. On the **Create** label, specify the following values, and then click **Create**:
    
    - Name: **AIPOnBehalfOf**
    
    - Application Type: **Web app /API**
    
    - Sign-on URL: **http://localhost**
    
4. Select the application that you've just created, **AIPOnBehalfOf**, and on the **Settings** blade, select **Properties**. From the **Properties** blade, copy the value for the **Application ID**, and then close this blade. 
    
    This value is used for the `WebAppId` parameter when you run the Set-AIPAuthentication cmdlet.

5. On the **Settings** blade, select **Keys**. Add a new key by specifying a description and your choice of duration (1 year, 2 years, or never expires). Then select **Save** and copy the string for the **Value** that displayed. It's important that you save this string because it is not displayed again and cannot be retrieved.
    
    This value is used for the `WebAppKey` parameter when you run the Set-AIPAuthentication cmdlet.

6. Back on the **App registrations** blade, select **New application registration**, to create your native application. On the **Create** label, specify the following values, and then click **Create**:
    
    - Name: **AIPClient**
    
    - Application Type: **Native**
    
    - Sign-on URL: **http://localhost**

7. Select the application that you've just created, **AIPClient**, and on the **Settings** blade, select **Properties**. From the **Properties** blade, copy the value for the **Application ID**, and then close this blade.
    
    This value is used for the `NativeAppId` parameter when you run the Set-AIPAuthentication cmdlet.

8. On the **Settings** blade, select **Required permissions**. 

9. On the **Required permissions** blade, click **Add**, and then click **Select an API**. In the search box, type **AIPOnBehalfOf** and select this value in the list box, and then click **Select**.

10. On the **Enable Access** blade, select **AIPOnBehalfOf**, click **Select**, and then click **Done**.
    
    You've now completed the configuration of the two apps and have the values that you need to run Set-AIPAuthentication with parameters.


## Next steps
For cmdlet help when you are in a PowerShell session, use the Get-Help <cmdlet name> cmdlet, where <cmdlet name> is the name of the cmdlet
that you want to research. For example: 

	Get-Help Get-RMSTemplate

See the following for additional information that you might need to support the Azure Information Protection client:

- [Customizations](client-admin-guide-customizations.md)

- [Client files and usage logging](client-admin-guide-files-and-logging.md)

- [Document tracking](client-admin-guide-document-tracking.md)

- [File types supported](client-admin-guide-file-types.md)


[!INCLUDE[Commenting house rules](../includes/houserules.md)]
