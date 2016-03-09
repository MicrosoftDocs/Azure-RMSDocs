IPCHelloWorld - an example application
==================================================================================================

This topic contains instructions to create an example rights-enabled application.

This simple application, IPCHelloWorld, will help orient you to the basic concepts and code of a rights-enabled application.

Download the sample application, [Webinar\_Collateral.zip](https://connect.microsoft.com/site1170/Downloads/DownloadDetails.aspx?DownloadID=42440), from Microsoft Connect. The remaining downloadable items on the site are integrated here for your convenience.

**Note**  The IPCHelloWorld project is already configured for the Rights Management Services SDK 2.1. For information about how to configure a new project to use the RMS SDK 2.1, see [Configure Visual Studio](how_to_configure_a_visual_studio_project_to_use_the_ad_rms_sdk_2_0.md).

 

The following sections cover the key application steps and understandings needed.

<span id="Loading_MSIPC.dll"></span><span id="loading_msipc.dll"></span><span id="LOADING_MSIPC.DLL"></span>Loading MSIPC.dll
-----------------------------------------------------------------------------------------------------------------------------

Before you can call any RMS SDK 2.1 functions, you need to first call [**IpcInitialize**](xref:msipc.ipcinitialize) function to load the MSIPC.dll.

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
<td align="left"><pre><code>hr = IpcInitialize();

if (FAILED(hr)) { 
  wprintf(L&quot;Failed to initialize MSIPC. Are you sure the runtime is installed?\n&quot;);
goto exit;
}</code></pre></td>
</tr>
</tbody>
</table>

<span id="Enumerating_templates"></span><span id="enumerating_templates"></span><span id="ENUMERATING_TEMPLATES"></span>Enumerating templates
---------------------------------------------------------------------------------------------------------------------------------------------

An RMS template defines the policy used to protect the data, i.e. defines the users that are allowed to access the data and their rights. RMS templates are installed on the RMS server.

The following code snip enumerates the available RMS templates from the default RMS server.

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
<td align="left"><pre><code>hr = IpcGetTemplateList(NULL, 0, 0, NULL, NULL, &amp;pcTil);

if (FAILED(hr)) { 
  DisplayError(L&quot;IpcGetTemplateList failed&quot;, hr);
goto exit;
}</code></pre></td>
</tr>
</tbody>
</table>

This call will retrieve RMS templates installed on the default server and load the results in the [**IPC\_TIL**](xref:msipc.ipcinitialize) structure pointed by the *pcTil* variable, then display the templates.

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
<td align="left"><pre><code>if (0 == pcTil-&gt;cTi) { 
  wprintf(L&quot;*** No templates configured for your RMS server ***\n\n&quot;); 
  wprintf(L&quot;\\------------------------------------------------------\n\n&quot;);
goto exit;
} 

for (DWORD dw = 0; dw &lt; pcTil-&gt;cTi; dw++) { 
  wprintf(L&quot;Template #%d:\n&quot;, dw);
  wprintf(L&quot;    Name:         %s\n&quot;, pcTil-&gt;aTi[dw].wszName);
  wprintf(L&quot;    Issued by:    %s\n&quot;, pcTil-&gt;aTi[dw].wszIssuerDisplayName);
  wprintf(L&quot;    Description:  %s\n&quot;, pcTil-&gt;aTi[dw].wszDescription);
  wprintf(L&quot;\n&quot;);
}</code></pre></td>
</tr>
</tbody>
</table>

<span id="Serializing_a_License"></span><span id="serializing_a_license"></span><span id="SERIALIZING_A_LICENSE"></span>Serializing a License
---------------------------------------------------------------------------------------------------------------------------------------------

Before you can protect any data, you need to serialize a license and get a content key. The content key is used to encrypt the sensitive data. The serialized license is usually attached to the encrypted data and is used by the consumer of the protected data. The consumer will need to call the [**IpcGetKey**](xref:msipc.ipcgetkey) function using the serialized license to get the content key for decrypting the content and for getting the policy associated with the content.

For the sake of simplicity use the first RMS template returned by [**IpcGetTemplateList**](xref:msipc.ipcgettemplatelist) to serialize a license.

Normally, you would use a user interface dialog to allow the user to select the desired template.

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
<td align="left"><pre><code>hr = IpcSerializeLicense((LPCVOID)pcTil-&gt;aTi[0].wszID, IPC_SL_TEMPLATE_ID, 
0, NULL, &amp;hContentKey, &amp;pSerializedLicense);

if (FAILED(hr)) { 
  DisplayError(L&quot;IpcSerializeLicense failed&quot;, hr);
goto exit;
}</code></pre></td>
</tr>
</tbody>
</table>

After doing this you have the content key, *hContentKey*, and the serialized license, *pSerializedLicense*, that you need to attach to the protected data.

<span id="Protecting_Data"></span><span id="protecting_data"></span><span id="PROTECTING_DATA"></span>Protecting Data
---------------------------------------------------------------------------------------------------------------------

Now you are ready to encrypt the sensitive data using the [**IpcEncrypt**](xref:msipc.ipcencrypt) function. First, you need to ask the **IpcEncrypt** function how big the encrypted data is going to be.

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
<td align="left"><pre><code>cbText = (DWORD)(sizeof(WCHAR)*(wcslen(wszText)+1));
hr = IpcEncrypt(hContentKey, 0, TRUE, (PBYTE)wszText, cbText, 
NULL, 0, &amp;cbEncrypted);

if (FAILED(hr)) { 
  DisplayError(L&quot;IpcEncrypt failed&quot;, hr);
goto exit;
}</code></pre></td>
</tr>
</tbody>
</table>

Here *wszText* contains the plain text that you are going to protect. The [**IpcEncrypt**](xref:msipc.ipcencrypt) function returns the size of the encrypted data in the *cbEncrypted* parameter.

Now allocate memory for the encrypted data.

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
<td align="left"><pre><code>pbEncrypted = (PBYTE)LocalAlloc(LPTR, cbEncrypted);

if (NULL == pbEncrypted) { 
  wprintf(L&quot;Out of memory\n&quot;);
goto exit;
}</code></pre></td>
</tr>
</tbody>
</table>

Finally, you can do the actual encryption.

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
<td align="left"><pre><code>hr = IpcEncrypt(hContentKey, 0, TRUE, (PBYTE)wszText, cbText, 
pbEncrypted, cbEncrypted, &amp;cbEncrypted);

if (FAILED(hr)) { 
  DisplayError(L&quot;IpcEncrypt failed&quot;, hr);
goto exit;
}</code></pre></td>
</tr>
</tbody>
</table>

After this step you have the encrypted data, *pbEncrypted*, and the serialized license, *pSerializedLicense*, that will be used by consumers to decrypt the data.

<span id="Error_Handling"></span><span id="error_handling"></span><span id="ERROR_HANDLING"></span>Error Handling
-----------------------------------------------------------------------------------------------------------------

Throughout this example application the **DisplayError** function is being used to handle errors.

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
<td align="left"><pre><code>void DisplayError(LPCWSTR wszErrorInfo, HRESULT hrError)
{
    LPCWSTR wszErrorMessageText = NULL;

    if (SUCCEEDED(IpcGetErrorMessageText(hrError, 0, &amp;wszErrorMessageText))) {
      wprintf(L&quot;%s: 0x%08X (%s)\n&quot;, wszErrorInfo, hrError, wszErrorMessageText);
    } 
    else { 
      wprintf(L&quot;%s: 0x%08X\n&quot;, wszErrorInfo, hrError);
    }
}</code></pre></td>
</tr>
</tbody>
</table>

The **DisplayError** function uses the [**IpcGetErrorMessageText**](xref:msipc.ipcgeterrormessagetext) function to get the error message from the corresponding error code and prints it to the standard output.

<span id="Cleaning_up"></span><span id="cleaning_up"></span><span id="CLEANING_UP"></span>Cleaning up
-----------------------------------------------------------------------------------------------------

Before you are done, you also need to release all the allocated resources.

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
<td align="left"><pre><code>if (NULL != pbEncrypted) { 
  LocalFree((HLOCAL)pbEncrypted);
}

if (NULL != pSerializedLicense) { 
  IpcFreeMemory((LPVOID)pSerializedLicense);
}

if (NULL != hContentKey) { 
  IpcCloseHandle((IPC_HANDLE)hContentKey);
}

if (NULL != pcTil) { 
  IpcFreeMemory((LPVOID)pcTil);
}</code></pre></td>
</tr>
</tbody>
</table>

<span id="related_topics"></span>Related topics
-----------------------------------------------

* [Developer notes](developer_notes.md)
* [Configure Visual Studio](how_to_configure_a_visual_studio_project_to_use_the_ad_rms_sdk_2_0.md)
* [**IpcEncrypt**](xref:msipc.ipcencrypt)
* [**IpcGetErrorMessageText**](xref:msipc.ipcgeterrormessagetext)
* [**IpcGetKey**](xref:msipc.ipcgetkey)
* [**IpcGetTemplateList**](xref:msipc.ipcgettemplatelist)
* [**IpcInitialize**](xref:msipc.ipcinitialize)
* [**IPC\_TIL**](xref:msipc.ipcinitialize)
* [Webinar\_Collateral.zip](https://connect.microsoft.com/site1170/Downloads/DownloadDetails.aspx?DownloadID=42440)
 

 



