---
# required metadata

title: How-to enable your service application to work with cloud based RMS | Azure RMS
description: This topic outlines steps for setting up your service application to use Azure Rights Management.
keywords:
author: lleonard-msft
ms.author: alleonar
manager: mbaldwin
ms.date: 02/23/2017
ms.topic: conceptual
ms.service: information-protection
ms.assetid: EA1457D1-282F-4CF3-A23C-46793D2C2F32
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# How-to: enable your service application to work with cloud based RMS

This topic outlines steps for setting up your service application to use Azure Rights Management. For more information, see [Getting started with Azure Rights Management](https://technet.microsoft.com/library/jj585016.aspx).

**Important**  
In order to use your Rights Management Services SDK 2.1 service application with Azure RMS, you'll need to create your own tenants. For more information, see [Azure RMS requirements: Cloud subscriptions that support Azure RMS](../requirements.md)

## Prerequisites

-   RMS SDK 2.1 must be installed and configured. For more information, see [Getting started with RMS SDK 2.1](getting-started-with-ad-rms-2-0.md).
-   You must [create a service identity via ACS](https://msdn.microsoft.com/library/gg185924.aspx) by using the symmetric key option, or through other means, and record the key information from that process.

## Connecting to the Azure Rights Management Service

-   Call [IpcInitialize](https://msdn.microsoft.com/library/jj127295.aspx).
-   Set [IpcSetGlobalProperty](https://msdn.microsoft.com/library/hh535270.aspx).

        C++
        int mode = IPC_API_MODE_SERVER;
        IpcSetGlobalProperty(IPC_EI_API_MODE, &(mode));


  **Note**  For more information, see [Setting the API security mode](setting-the-api-security-mode-api-mode.md)

     
-   The following steps are the setup for creating an instance of an [IPC\_PROMPT\_CTX](https://msdn.microsoft.com/library/hh535278.aspx) structure with the *pcCredential*  ([IPC\_CREDENTIAL](https://msdn.microsoft.com/library/hh535275.aspx)) member populated with connection information from the Azure Rights Management Service.
-   Use the information from your symmetric key service identity creation (see the prerequisites listed earlier in this topic) to set the *wszServicePrincipal*, *wszBposTenantId*, and *cbKey* parameters when you create an instance of an [IPC\_CREDENTIAL\_SYMMETRIC\_KEY](https://msdn.microsoft.com/library/dn133062.aspx) structure.

**Note** - Due to an existing condition with our discovery service, if you are not in North America, symmetric key credentials are not accepted from other regions therefore, you must specify your tenant URLs directly. This is done through the *pConnectionInfo* parameter, type [IPC\_CONNECTION\_INFO](https://msdn.microsoft.com/library/hh535274.aspx), on functions  [IpcGetTemplateList](https://msdn.microsoft.com/library/hh535267.aspx) or [IpcGetTemplateIssuerList](https://msdn.microsoft.com/library/hh535266.aspx).

## Generate a symmetric key and collect the needed information

### Instructions to generate a symmetric key

-   Install [Microsoft Online Sign-in Assistant](http://go.microsoft.com/fwlink/p/?LinkID=286152)
-   Install [Azure AD Powershell Module](https://bposast.vo.msecnd.net/MSOPMW/8073.4/amd64/AdministrationConfig-en.msi).

**Note** - You must be a tenant administrator to use the Powershell cmdlets.

- Start Powershell and run the following commands to generate a key

    `Import-Module MSOnline`

    `Connect-MsolService` (type-in your admin credentials)

    `New-MsolServicePrincipal` (type-in a display name)

- After it generates a symmetric key, it will output information about the key including the key itself and an *AppPrincipalId*.

      The following symmetric key was created as one was not supplied
      ZYbF/lTtwE28qplQofCpi2syWd11D83+A3DRlb2Jnv8=

      DisplayName : RMSTestApp
      ServicePrincipalNames : {7d9c1f38-600c-4b4d-8249-22427f016963}
      ObjectId : 0ee53770-ec86-409e-8939-6d8239880518
      AppPrincipalId : 7d9c1f38-600c-4b4d-8249-22427f016963


### Instructions to find out **TenantBposId** and **Urls**

-   Install [Azure RMS powershell module](https://technet.microsoft.com/library/jj585012.aspx).
-   Start Powershell and run the following commands to get the RMS configuration of the tenant.

    `Import-Module aadrm`

    `Connect-AipServiceService` (type-in your admin credentials)

    `Get-AipServiceConfiguration`


- Create an instance of an  [IPC\_CREDENTIAL\_SYMMETRIC\_KEY](https://msdn.microsoft.com/library/dn133062.aspx) and set a few members.

      // Create a key structure.
      IPC_CREDENTIAL_SYMMETRIC_KEY symKey = {0};

      // Set each member with information from service creation.
      symKey.wszBase64Key = "your service principal key";
      symKey.wszAppPrincipalId = "your app principal identifier";
      symKey.wszBposTenantId = "your tenant identifier";


For more information see, [IPC\_CREDENTIAL\_SYMMETRIC\_KEY](https://msdn.microsoft.com/library/dn133062.aspx).

-   Create an instance of an [IPC\_CREDENTIAL](https://msdn.microsoft.com/library/hh535275.aspx) structure containing your [IPC\_CREDENTIAL\_SYMMETRIC\_KEY](https://msdn.microsoft.com/library/dn133062.aspx) instance.

**Note** - The *connectionInfo* members are set with URLs from the previous call to `Get-AipServiceConfiguration` and noted here with those field names.

    // Create a credential structure.
    IPC_CREDENTIAL cred = {0};

    IPC_CONNECTION_INFO connectionInfo = {0};
    connectionInfo.wszIntranetUrl = LicensingIntranetDistributionPointUrl;
    connectionInfo.wszExtranetUrl = LicensingExtranetDistributionPointUrl;

    // Set each member.
    cred.dwType = IPC_CREDENTIAL_TYPE_SYMMETRIC_KEY;
    cred.pcCertContext = (PCCERT_CONTEXT)&symKey;

    // Create your prompt control.
    IPC_PROMPT_CTX promptCtx = {0};

    // Set each member.
    promptCtx.cbSize = sizeof(IPC_PROMPT_CTX);
    promptCtx.hwndParent = NULL;
    promptCtx.dwflags = IPC_PROMPT_FLAG_SILENT;
    promptCtx.hCancelEvent = NULL;
    promptCtx.pcCredential = &cred;

### Identify a template and then encrypt

-   Select a template to use for your encryption.
    Call [IpcGetTemplateList](https://msdn.microsoft.com/library/hh535267.aspx) passing in the same instance of [IPC\_PROMPT\_CTX](https://msdn.microsoft.com/library/hh535278.aspx).


    PCIPC_TIL pTemplates = NULL;
    IPC_TEMPLATE_ISSUER templateIssuer = (pTemplateIssuerList->aTi)[0];

    hr = IpcGetTemplateList(&(templateIssuer.connectionInfo),
           IPC_GTL_FLAG_FORCE_DOWNLOAD,
           0,
           &promptCtx,
           NULL,
           &pTemplates);


-   With the template from earlier in this topic, call [IpcfEncrcyptFile](https://msdn.microsoft.com/library/dn133059.aspx), passing in the same instance of [IPC\_PROMPT\_CTX](https://msdn.microsoft.com/library/hh535278.aspx).

Example use of [IpcfEncrcyptFile](https://msdn.microsoft.com/library/dn133059.aspx):

    LPCWSTR wszContentTemplateId = pTemplates->aTi[0].wszID;
    hr = IpcfEncryptFile(wszInputFilePath,
           wszContentTemplateId,
           IPCF_EF_TEMPLATE_ID,
           IPC_EF_FLAG_KEY_NO_PERSIST,
           &promptCtx,
           NULL,
           &wszOutputFilePath);

Example use of [IpcfDecryptFile](https://msdn.microsoft.com/library/dn133058.aspx):

    hr = IpcfDecryptFile(wszInputFilePath,
           IPCF_DF_FLAG_DEFAULT,
           &promptCtx,
           NULL,
           &wszOutputFilePath);

You have now completed the steps needed to enable your application to use Azure Rights Management.

## Related topics

* [Getting started with Azure Rights Management](https://technet.microsoft.com/library/jj585016.aspx)
* [Getting started with RMS SDK 2.1](getting-started-with-ad-rms-2-0.md)
* [Create a service identity via ACS](https://msdn.microsoft.com/library/gg185924.aspx)
* [IpcSetGlobalProperty](https://msdn.microsoft.com/library/hh535270.aspx)
* [IpcInitialize](https://msdn.microsoft.com/library/jj127295.aspx)
* [IPC\_PROMPT\_CTX](https://msdn.microsoft.com/library/hh535278.aspx)
* [IPC\_CREDENTIAL](https://msdn.microsoft.com/library/hh535275.aspx)
* [IPC\_CREDENTIAL\_SYMMETRIC\_KEY](https://msdn.microsoft.com/library/dn133062.aspx)
* [IpcGetTemplateIssuerList](https://msdn.microsoft.com/library/hh535266.aspx)
* [IpcGetTemplateList](https://msdn.microsoft.com/library/hh535267.aspx)
* [IpcfDecryptFile](https://msdn.microsoft.com/library/dn133058.aspx)
* [IpcfEncrcyptFile](https://msdn.microsoft.com/library/dn133059.aspx)
* [IpcCreateLicenseFromScratch](https://msdn.microsoft.com/library/hh535256.aspx)
* [IpcCreateLicenseFromTemplateID](https://msdn.microsoft.com/library/hh535257.aspx)
