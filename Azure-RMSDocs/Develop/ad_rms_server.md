Server
============================================

This topic describes the purpose and functions of the RMS Server.

The server component of Rights Management Services (RMS) is implemented by a set of web services that run on [Microsoft Internet Information Services](http://www.iis.net/overview) (IIS). You can also use the cloud based implementation via RMS on Azure. For more on using the Azure Rights Management service, see [Enable your service application to work with cloud based RMS](how_to_use_file_api_with_aadrm__cloud_.md).

For on premise servers, beginning with Windows Server 2008, you can install and configure the RMS service by adding it as a role. To install the service on prior operating systems, download it from the Microsoft download center at [Microsoft Windows Rights Management Services with Service Pack 2](http://www.microsoft.com/download/en/details.aspx?id=4909).

Of the many web services installed, the following are important for application development.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Service</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Administration</p></td>
<td align="left"><p>Hosts the Administration website that enables you to manage RMS. The service runs on root certification servers and on licensing servers. You can use the [Active Directory Rights Management Services Scripting API](https://msdn.microsoft.com/library/Bb968797) to write administration scripts.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Account Certification</p></td>
<td align="left"><p>Creates machine certificates that identify computers in the RMS certificate hierarchy and rights account certificates that associate users with specific computers. For more information, see [Activating a User](https://msdn.microsoft.com/library/Cc530378).</p>
<p>This service runs on the root certification server.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Licensing</p></td>
<td align="left"><p>Issues an [<em>end-user license</em>](rm.e_gly#_rm_end_user_license_gly). The service runs on root certification servers and on licensing servers.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Publishing</p></td>
<td align="left"><p>Creates an [Creating an Issuance License](https://msdn.microsoft.com/library/Aa362355).</p>
<p>The service runs on root certification servers and on licensing servers.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Pre-certification</p></td>
<td align="left"><p>Enables a server to request a [<em>rights account certificate</em>](rm.r_gly#_rm_rights_account_certificate_gly) on behalf of a user. The service runs on root certification servers and on licensing servers.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Service Locator</p></td>
<td align="left"><p>Provides the URL of the account certification, licensing, and publishing services to Active Directory so that they can be discovered by RMS clients. The service runs on root certification servers and on licensing servers.</p></td>
</tr>
</tbody>
</table>

 

<span id="related_topics"></span>Related topics
-----------------------------------------------

* [Overview](ad_rms_overview.md)
* [Microsoft Internet Information Services](http://www.iis.net/overview)
* [Enable your service application to work with cloud based RMS](how_to_use_file_api_with_aadrm__cloud_.md)
* [Microsoft Windows Rights Management Services with Service Pack 2](http://www.microsoft.com/download/en/details.aspx?id=4909)
* [Active Directory Rights Management Services Scripting API](https://msdn.microsoft.com/library/Bb968797)
* [Activating a Computer](https://msdn.microsoft.com/library/Cc530377)
* [Activating a User](https://msdn.microsoft.com/library/Cc530378)
* [*end-user license*](rm.e_gly#_rm_end_user_license_gly)
* [Creating an Issuance License](https://msdn.microsoft.com/library/Aa362355)
* [*issuance license*](rm.i_gly#_rm_issuance_license_gly)
* [*rights account certificate*](rm.r_gly#_rm_rights_account_certificate_gly)
 

 



