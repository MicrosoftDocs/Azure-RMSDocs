Development environment files
==================================================================

This topic shows the development environment files and their relative installation locations on your computer.

The Rights Management Services SDK 2.1 includes the following files, installed on your computer at the default location or the one you have specified: %MsipcSDKDir%.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">File/Path</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>ReadMe.htm</p>
<p>\</p></td>
<td align="left"><p>Contains link to RMS help and [Release notes](release_notes__rtm_.md).</p></td>
</tr>
<tr class="even">
<td align="left"><p>Isvtier5appsigningprivkey.dat</p>
<p>\bin</p></td>
<td align="left"><p>Contains the private key used to generate a manifest for use during development of an RMS–enabled application.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Isvtier5appsigningpubkey.dat</p>
<p>\bin</p></td>
<td align="left"><p>Contains the public key used to generate a manifest for use during development of an RMS–enabled application.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Isvtier5appsignsdk_client.xml</p>
<p>\bin</p></td>
<td align="left"><p>Used to generate a manifest for use during development of an RMS–enabled application.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>YourAppName.isv.mcf</p>
<p>\bin</p></td>
<td align="left"><p>A boilerplate manifest configuration file you can use to generate a manifest during development of an RMS–enabled application.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Ipcsecproc_isv.dll</p>
<p>\bin\x86</p></td>
<td align="left"><p>DLL used internally, for x86 applications, by the Active Directory Rights Management Services Client 2.1 when operating in the ISV hierarchy.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Ipcsecproc_ssp_isv.dll</p>
<p>\bin\x86</p></td>
<td align="left"><p>DLL used internally, for x86 applications, by the AD RMS Client 2.1 when operating in the ISV hierarchy.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Ipcsecproc_isv.dll</p>
<p>\bin\x64</p></td>
<td align="left"><p>DLL used internally, for x64 applications, by the AD RMS Client 2.1 when operating in the ISV hierarchy.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Ipcsecproc_ssp_isv.dll</p>
<p>\bin\x64</p></td>
<td align="left"><p>DLL used internally, for x64 applications, by the AD RMS Client 2.1 when operating in the ISV hierarchy.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Msipc.h</p>
<p>\inc</p></td>
<td align="left"><p>Main include file for the RMS SDK 2.1.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Ipcprot.h</p>
<p>\inc</p></td>
<td align="left"><p>Contains the public interface exported by the RMS SDK 2.1.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Ipcbase.h</p>
<p>\inc</p></td>
<td align="left"><p>Contains basic types and helper functions exported by the RMS SDK 2.1.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Ipcerror.h</p>
<p>\inc</p></td>
<td align="left"><p>Contains public error codes exported by RMS SDK 2.1.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Ipcfile.h</p>
<p>\inc</p></td>
<td align="left"><p>Contains the File API interfaces exported by the RMS SDK 2.1</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Msipc.lib</p>
<p>\lib</p></td>
<td align="left"><p>Library to link with when using the RMS SDK 2.1 to build x86 applications.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Msipc_s.lib</p>
<p>\lib</p></td>
<td align="left"><p>Provides entry point for [<strong>IpcInitialize</strong>](xref:msipc.ipcinitialize) for x86 applications.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Msipc.lib</p>
<p>\lib\x64</p></td>
<td align="left"><p>Library to link with when using the RMS SDK 2.1 to build x64 applications.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Msipc_s.lib</p>
<p>\lib\x64</p></td>
<td align="left"><p>Provides entry point for [<strong>IpcInitialize</strong>](xref:msipc.ipcinitialize) for x64 applications.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Genmanifest.exe</p>
<p>\tools</p></td>
<td align="left"><p>Generates a manifest for use during development of an RMS-enabled application.</p></td>
</tr>
</tbody>
</table>

 

 

 



