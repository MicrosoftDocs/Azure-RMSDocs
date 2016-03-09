Enable your service application to work with cloud based RMS
===========================================================================================================================

This topic outlines steps for setting up your service application to use Azure Rights Management. For more information, see [Getting started with Azure Rights Management](https://technet.microsoft.com/en-us/library/jj585016.aspx).

**Important**  
It is a recommended best practice to test your Rights Management Services SDK 2.1 application first with the RMS pre-production environment against an RMS Server. Then, should you want your customer to have the ability to use your application with the Azure RMS Service, move to testing with that environment.

In order to use your RMS SDK 2.1 service application with Azure RMS, you will need to request an Azure RMS Tenant, if you don’t already have one. Send mail to <rmcstbeta@microsoft.com> with your tenant request.

 

<span id="Prerequisites"></span><span id="prerequisites"></span><span id="PREREQUISITES"></span>Prerequisites
-------------------------------------------------------------------------------------------------------------

-   RMS SDK 2.1 must be installed and configured. For more information, see [Getting started with RMS SDK 2.1](getting_started_with_ad_rms_2_0.md).
-   You must [create a service identity via ACS](https://msdn.microsoft.com/en-us/library/gg185924.aspx) by using the symmetric key option, or through other means, and record the key information from that process.

<span id="Connecting_to_the_Azure_Rights_Management_Service"></span><span id="connecting_to_the_azure_rights_management_service"></span><span id="CONNECTING_TO_THE_AZURE_RIGHTS_MANAGEMENT_SERVICE"></span>Connecting to the Azure Rights Management Service
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-   Call [**IpcInitialize**](xref:msipc.ipcinitialize).
-   Set [**IpcSetGlobalProperty**](xref:msipc.ipcsetglobalproperty).
    <span codelanguage="ManagedCPlusPlus"></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">C++</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code>int mode = IPC_API_MODE_SERVER;
    IpcSetGlobalProperty(IPC_EI_API_MODE, &amp;(mode));</code></pre></td>
    </tr>
    </tbody>
    </table>

    **Note**  For more information, see [Setting the API security mode](setting_the_api_security_mode__api_mode_.md)

     

-   The following steps are the setup for creating an instance of an [**IPC\_PROMPT\_CTX**](xref:msipc.ipc_prompt_ctx) structure with the **pcCredential** ([**IPC\_CREDENTIAL**](xref:msipc.ipc_credential)) member populated with connection information from the Azure Rights Management Service.
    -   Use the information from your symmetric key service identity creation (see the prerequisites listed earlier in this topic) to set the **wszServicePrincipal**, **wszBposTenantId**, and **cbKey** parameters when you create an instance of an [**IPC\_CREDENTIAL\_SYMMETRIC\_KEY**](xref:msipc.ipc_credential_symmetric_key) structure.

        **Note**   Due to an existing condition with our discovery service, if you are not in North America, symmetric key credentials are not accepted from other regions therefore, you must specify your tenant URLs directly. This is done through the [**IPC\_CONNECTION\_INFO**](xref:msipc.ipc_connection_info) parameter of [**IpcGetTemplateList**](xref:msipc.ipcgettemplatelist) or [**IpcGetTemplateIssuerList**](xref:msipc.ipcgettemplateissuerlist).
        **Generate a symmetric key and collect the needed information**

        Instructions to generate a symmetric key

        -   Install [Microsoft Online Sign-in Assistant](http://go.microsoft.com/fwlink/p/?LinkID=286152)
        -   Install [Azure AD Powershell Module](https://bposast.vo.msecnd.net/MSOPMW/8073.4/amd64/AdministrationConfig-en.msi).
            **Note**  You must be a tenant administrator to use the Powershell cmdlets.

             

        -   Start Powershell and run the following commands to generate a key
            `Import-Module MSOnline`
            `Connect-MsolService` (type-in your admin credentials)
            `New-MsolServicePrincipal` (type-in a display name)
        -   After it generates a symmetric key, it will output information about key including the key itself and **AppPrincipalId**.

            ``` syntax
            The following symmetric key was created as one was not supplied 
            ZYbF/lTtwE28qplQofCpi2syWd11D83+A3DRlb2Jnv8=

            DisplayName : RMSTestApp
            ServicePrincipalNames : {7d9c1f38-600c-4b4d-8249-22427f016963}
            ObjectId : 0ee53770-ec86-409e-8939-6d8239880518
            AppPrincipalId : 7d9c1f38-600c-4b4d-8249-22427f016963
            ```

        Instructions to find out **TenantBposId** and **Urls**

        -   Install [Azure RMS powershell module](https://technet.microsoft.com/en-us/library/jj585012.aspx).
        -   Start Powershell and run the following commands to get the RMS configuration of the tenant.
            `Import-Module aadrm`
            `Connect-AadrmService` (type-in your admin credentials)
            `Get-AadrmConfiguration`

         

        <span codelanguage="ManagedCPlusPlus"></span>
        <table>
        <colgroup>
        <col width="100%" />
        </colgroup>
        <thead>
        <tr class="header">
        <th align="left">C++</th>
        </tr>
        </thead>
        <tbody>
        <tr class="odd">
        <td align="left"><pre><code>// Create a key structure.
        IPC_CREDENTIAL_SYMMETRIC_KEY symKey = {0};

        // Set each member with information from service creation.
        symKey.wszBase64Key = &quot;your service principal key&quot;;
        symKey.wszAppPrincipalId = &quot;your app principal identifier&quot;;
        symKey.wszBposTenantId = &quot;your tenent identifier&quot;;</code></pre></td>
        </tr>
        </tbody>
        </table>

        For more information see, [**IPC\_CREDENTIAL\_SYMMETRIC\_KEY**](xref:msipc.ipc_credential_symmetric_key).

    -   Create an instance of an [**IPC\_CREDENTIAL**](xref:msipc.ipc_credential) structure containing your [**IPC\_CREDENTIAL\_SYMMETRIC\_KEY**](xref:msipc.ipc_credential_symmetric_key) instance.
        **Note**  The *conectionInfo* members are set with URLs from the previous call to `Get-AadrmConfiguration` and noted here with those field names.

         

        <span codelanguage="ManagedCPlusPlus"></span>
        <table>
        <colgroup>
        <col width="100%" />
        </colgroup>
        <thead>
        <tr class="header">
        <th align="left">C++</th>
        </tr>
        </thead>
        <tbody>
        <tr class="odd">
        <td align="left"><pre><code>// Create a credential structure.
        IPC_CREDENTIAL cred = {0};

        IPC_CONNECTION_INFO connectionInfo = {0};
        connectionInfo.wszIntranetUrl = LicensingIntranetDistributionPointUrl;
        connectionInfo.wszExtranetUrl = LicensingExtranetDistributionPointUrl;

        // Set each member.
        cred.dwType = IPC_CREDENTIAL_TYPE_SYMMETRIC_KEY;
        cred.pcCertContext = (PCCERT_CONTEXT)&amp;symKey;

        // Create your prompt control.
        IPC_PROMPT_CTX promptCtx = {0};

        // Set each member.
        promptCtx.cbSize = sizeof(IPC_PROMPT_CTX);
        promptCtx.hwndParent = NULL;
        promptCtx.dwflags = IPC_PROMPT_FLAG_SILENT;
        promptCtx.hCancelEvent = NULL;
        promptCtx.pcCredential = &amp;cred;</code></pre></td>
        </tr>
        </tbody>
        </table>

<span id="Identify_a_template_and_then_encrypt"></span><span id="identify_a_template_and_then_encrypt"></span><span id="IDENTIFY_A_TEMPLATE_AND_THEN_ENCRYPT"></span>Identify a template and then encrypt
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-   Select a template to use for your encryption.
    Call [**IpcGetTemplateList**](xref:msipc.ipcgettemplatelist) passing in the same instance of [**IPC\_PROMPT\_CTX**](xref:msipc.ipc_prompt_ctx).
    <span codelanguage="ManagedCPlusPlus"></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">C++</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code>PCIPC_TIL pTemplates = NULL; 
    IPC_TEMPLATE_ISSUER templateIssuer = (pTemplateIssuerList-&gt;aTi)[0];

    hr = IpcGetTemplateList(&amp;(templateIssuer.connectionInfo),
           IPC_GTL_FLAG_FORCE_DOWNLOAD, 
           0, 
           &amp;promptCtx, 
           NULL, 
           &amp;pTemplates);</code></pre></td>
    </tr>
    </tbody>
    </table>

-   With the template from earlier in this topic, call [**IpcfEncrcyptFile**](xref:msipc.ipcfencryptfile), passing in the same instance of [**IPC\_PROMPT\_CTX**](xref:msipc.ipc_prompt_ctx).

    Example use of [**IpcfEncrcyptFile**](xref:msipc.ipcfencryptfile):

    <span codelanguage="ManagedCPlusPlus"></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">C++</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code>LPCWSTR wszContentTemplateId = pTemplates-&gt;aTi[0].wszID;
    hr = IpcfEncryptFile(wszInputFilePath, 
           wszContentTemplateId, 
           IPCF_EF_TEMPLATE_ID, 
           IPC_EF_FLAG_KEY_NO_PERSIST, 
           &amp;promptCtx, 
           NULL, 
           &amp;wszOutputFilePath);</code></pre></td>
    </tr>
    </tbody>
    </table>

    Example use of [**IpcfDecryptFile**](xref:msipc.ipcfdecryptfile):

    <span codelanguage="ManagedCPlusPlus"></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">C++</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code>hr = IpcfDecryptFile(wszInputFilePath, 
           IPCF_DF_FLAG_DEFAULT, 
           &amp;promptCtx,
           NULL,
           &amp;wszOutputFilePath);</code></pre></td>
    </tr>
    </tbody>
    </table>

You have now completed the steps needed to enable your application to use Azure Rights Management.

<span id="related_topics"></span>Related topics
-----------------------------------------------

* [Developer concepts](ad_rms_concepts-nav.md)
* [Getting started with Azure Rights Management](https://technet.microsoft.com/en-us/library/jj585016.aspx)
* [Getting started with RMS SDK 2.1](getting_started_with_ad_rms_2_0.md)
* [Create a service identity via ACS](https://msdn.microsoft.com/en-us/library/gg185924.aspx)
* [**IpcSetGlobalProperty**](xref:msipc.ipcsetglobalproperty)
* [**IpcInitialize**](xref:msipc.ipcinitialize)
* [**IPC\_PROMPT\_CTX**](xref:msipc.ipc_prompt_ctx)
* [**IPC\_CREDENTIAL**](xref:msipc.ipc_credential)
* [**IPC\_CREDENTIAL\_SYMMETRIC\_KEY**](xref:msipc.ipc_credential_symmetric_key)
* [**IpcGetTemplateIssuerList**](xref:msipc.ipcgettemplateissuerlist)
* [**IpcGetTemplateList**](xref:msipc.ipcgettemplatelist)
* [**IpcfDecryptFile**](xref:msipc.ipcfdecryptfile)
* [**IpcfEncrcyptFile**](xref:msipc.ipcfencryptfile)
* [**IpcCreateLicenseFromScratch**](xref:msipc.ipccreatelicensefromscratch)
* [**IpcCreateLicenseFromTemplateID**](xref:msipc.ipccreatelicensefromtemplateid)
 

 



