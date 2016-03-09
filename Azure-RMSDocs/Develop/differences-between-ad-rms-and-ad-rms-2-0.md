How this SDK is better
========================================================================================

This topic describes how Rights Management Services SDK 2.1 is a significant improvement over the original [Active Directory Rights Management Services SDK](https://msdn.microsoft.com/library/Cc530379) in terms of required developer effort to create a rights-enabled application.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Area</th>
<th align="left">Descriptions</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>API surface</p></td>
<td align="left"><p>The API surface has been reduced significantly through abstraction, freeing you from many of the details of back-end implementation. From an API surface of 84 functions for RMS SDK, the RMS SDK 2.1 includes only 20 API functions. Most applications will need to use only a small subset of this API surface.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Ramp up time</p></td>
<td align="left"><p>With the RMS SDK 2.1, you will be able to follow a step-by-step guide to identify which of your application's resources are sensitive and how to protect them. This is unlike the RMS SDK, with which you had to have detailed knowledge of certificates, formats, and topologies and write complex code for multithreading.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Multi-topology support</p></td>
<td align="left"><p>RMS SDK 2.1 helps you minimize code rewriting; your application should work with all topologies as we abstract the topology complexity away from the developer. With the RMS SDK, you had to understand all supported topologies, then write and test specific code for each.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Future-proof</p></td>
<td align="left"><p>RMS SDK 2.1 helps you minimize rewriting your rights-enablement code; your application should work in any RMS environment and automatically take advantage of new features when updated core RMS features are released. This is unlike AD RMS SDK, where you had to update your application to take advantage of any new features explicitly.</p></td>
</tr>
</tbody>
</table>

 

**Important**  
All the topics in the original [Active Directory Rights Management Services SDK](https://msdn.microsoft.com/library/Cc530379) on MSDN Library now begin with the following support statement:

The AD RMS SDK leveraging functionality exposed by the client in Msdrm.dll is available for use in Windows Server 2008, Windows Vista, Windows Server 2008 R2, Windows 7, Windows Server 2012, and Windows 8. It may be altered or unavailable in subsequent versions. Instead, use [Active Directory Rights Management Services SDK 2.1](microsoft_information_protection_and_control_client_portal.md), which leverages functionality exposed by the client in Msipc.dll.

 

<span id="related_topics"></span>Related topics
-----------------------------------------------

* [Overview](ad_rms_overview.md)
* [Active Directory Rights Management Services SDK](https://msdn.microsoft.com/library/Cc530379)
* [Rights Management Services SDK 2.1](microsoft_information_protection_and_control_client_portal.md)
 

 



