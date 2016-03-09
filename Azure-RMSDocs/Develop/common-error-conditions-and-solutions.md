Common error conditions and solutions
===================================================================================================

This topic includes the most common error messages that you might encounter when using the Rights Management Services SDK 2.1 developer tools. It also provides a recommended action to fix the error, where applicable.

**Important**  For error condition processing, always use a call to [**IpcGetErrorMessageText**](xref:msipc.ipcgeterrormessagetext) right after an SDK API call fails, so you get complete information about the nature of the error.

 

<span id="Common_error_conditions_and_solutions"></span><span id="common_error_conditions_and_solutions"></span><span id="COMMON_ERROR_CONDITIONS_AND_SOLUTIONS"></span>Common error conditions and solutions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Constant/description</th>
<th align="left">Action required to fix the error</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p><strong>IPCERROR_DEBUGGER_DETECTED</strong></p>
<p>A debugger was detected by RMS SDK 2.1</p></td>
<td align="left"><p>The developer version of RMS SDK 2.1 does not check for the presence of a debugger. If possible, debug your application by using this version of RMS SDK 2.1</p>
<p>If you must debug the production version of RMS SDK 2.1, use the following guidance.</p>
<p>Some RMS SDK 2.1 functions are designed to fail under a debugger:</p>
<ul>
<li>[<strong>IpcGetKey</strong>](xref:msipc.ipcgetkey)</li>
<li>[<strong>IpcGetTemplateList</strong>](xref:msipc.ipcgettemplatelist)</li>
<li>[<strong>IpcGetTemplateIssuerList</strong>](xref:msipc.ipcgettemplateissuerlist)</li>
</ul>
<p>To debug code following these function calls, you must break into the process and attach a debugger after the function calls have completed. One way to do this is to use an assert statement to break into the debugger. The _ASSERTE macro is included in the Crtdbg.h header.</p>
<p>For more information about _ASSERTE, see .[_ASSERT, _ASSERTE Macros](https://msdn.microsoft.com/en-us/library/ezb1wyez.aspx)</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>IPCERROR_BROKEN_CERT_CHAIN</strong></p>
<p>Certificate chain does not match.</p></td>
<td align="left"><p>Make sure the hierarchy key, <strong>HKEY_LOCAL_MACHINE</strong>\<strong>Software</strong>\<strong>Microsoft</strong>\<strong>MSIPC</strong>\<strong>Hierarchy</strong></p>
<dl>
<dt>            Data type</dt>
<dd>            dword
</dd>
</dl>
, contains the correct value based on the key you used to sign your AD RMS application manifest.
<p>Here are the signing keys and their associated values (hierarchy <strong>DWORD</strong>):</p>
<ul>
<li>ISV—1</li>
<li>Production—0 or not present</li>
</ul></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>IPCERROR_MACHINE_CERT_NOT_TRUSTED</strong></p>
<p>You are using an application signed with the ISV signing key, but it is trying to communicate with a production AD RMS server, or vice versa.</p></td>
<td align="left"><p>If you are using the developer version of AD RMS server, ensure that you are using the ISV signing key to sign your application.</p>
<p>If you are using the production version of AD RMS server, ensure that you are using the production signing key to sign your application.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>IPCERROR_APPLICATION_AUTH_ERROR_MANIFEST</strong></p>
<p>The application manifest is not valid.</p>
<p>This can be caused when the binary (application) was rebuilt, and the manifest was not regenerated.</p></td>
<td align="left"><p>Make sure you regenerate your application manifest every time you rebuild your application.</p></td>
</tr>
</tbody>
</table>

 

 

<span id="related_topics"></span>Related topics
-----------------------------------------------

* [Developer notes](developer_notes.md)
* [**IpcGetKey**](xref:msipc.ipcgetkey)
* [**IpcGetTemplateList**](xref:msipc.ipcgettemplatelist)
* [**IpcGetTemplateIssuerList**](xref:msipc.ipcgettemplateissuerlist)
* [\_ASSERT, \_ASSERTE Macros](https://msdn.microsoft.com/en-us/library/ezb1wyez.aspx)
 

 



