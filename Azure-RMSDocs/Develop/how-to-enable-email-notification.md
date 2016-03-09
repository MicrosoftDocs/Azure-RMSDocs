Enabling email notification
=====================================================================================

\[Some information relates to pre-released product which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.\]

Email notification allows for a protected content owner to be notified when his or her content is accessed.

To setup your email notification for a given license, use [**IpcSetLicenseProperty**](xref:msipc.ipcsetlicenseproperty) with the property type parameter, *dwPropID*, as [**IPC\_LI\_APP\_SPECIFIC\_DATA**](xref:msipc.license_property_types) and the application data fields formatted as an [**IPC\_NAME\_VALUE\_LIST**](xref:msipc.ipc_name_value_list).

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
<td align="left"><pre><code>...

int numDataPairs = 3;

IPC_NAME_VALUE propertyValuePairs [numDataPairs];

// lcid field set to 0 causes the default lcid to be used

propertyValuePairs[0] = {&quot;MS.Conetent.Name&quot;, 0, &quot;FinancialReport.docx&quot;};
propertyValuePairs[1] = {&quot;MS.Notify.Enabled&quot;,0 , &quot;true&quot;};
propertyValuePairs[2] = {&quot;MS.Notify.Culture&quot;,0 , “en-US”};

IPC_NAME_VALUE_LIST emailNotificationAppData = {numDataPairs, propertyValuePairs};

result = IpcSetLicenseProperty( licenseHandle, FALSE, IPC_LI_APP_SPECIFIC_DATA, emailNotificationAppData);

...</code></pre></td>
</tr>
</tbody>
</table>

The following table contains the application data fields, property name and value pairs, for RMS email notification.

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Property name</th>
<th align="left">Data type</th>
<th align="left">Example value</th>
<th align="left">Notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>MS.Content.Name</p></td>
<td align="left"><p><strong>string</strong></p></td>
<td align="left"><p>“FinancialReport.docx”</p></td>
<td align="left"><p>This is an identifier associated with the protected content.</p>
<p>For protected files this value should be the name of the file without any path information.</p>
<p>For other types of content such as an email message it might be the subject of the email or it might be empty.</p></td>
</tr>
<tr class="even">
<td align="left"><p>MS.Notify.Enabled</p></td>
<td align="left"><p><strong>string</strong></p></td>
<td align="left"><p>“true” | “false”</p></td>
<td align="left"><p>If this value is set to “true” a notification email will be sent to the owner of the publishing license when someone attempts to use it to obtain an end user license.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>MS.Notify.Culture</p></td>
<td align="left"><p><strong>string</strong></p></td>
<td align="left"><p>“en-US”</p></td>
<td align="left"><p><strong>Source:</strong> System.Globalization.CultureInfo.CurrentUICulture.Name</p>
<p>This value is used to determine the localized language of the notification email and the date/time and number formatting that should be used in the email message.</p>
<p>It should be set based on user settings of the machine that the publish license is created on, or based on the preferred culture of the owner of the publish license.</p></td>
</tr>
<tr class="even">
<td align="left"><p>MS.Notify.TZID</p></td>
<td align="left"><p><strong>string</strong></p></td>
<td align="left"><p>“Pacific Standard Time”</p></td>
<td align="left"><p><strong>Source:</strong> TimeZoneInfo.Local.Id - Windows time zone ID.</p>
<p>This value is the Microsoft Windows OS time zone identifier describing a particular time zone and its characteristics.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>MS.Notify.TZO</p></td>
<td align="left"><p><strong>string</strong></p></td>
<td align="left"><p>“-480”</p></td>
<td align="left"><p>This is the publish license owner’s time zone offset in terms of minutes from UTC time.</p>
<p>If a valid TZID value is provided the offset of the time zone specified by it will be used and this value will be ignored.</p>
<p>This value will more than likely be used by non-windows based publishing platforms that do not have access to the list of Windows OS time zone ID values.</p>
<p>If a TZID value is not provided this value will be used to calculate the time offset in notification messages, and the TZSN will be used (regardless of the time zone value) to indicate the name of the time zone. This will result time zone being fixed and not updating for daylight savings when it is applicable.</p>
<p>For example:</p>
<p>If TXID is blank and TZ0 is set to “-420” and the TZSN is set to “Pacific Daylight Time” all values shown in the notification email will be adjusted to &quot;Pacific Daylight Time” and displayed as such even if daylight savings is no longer in affect currently.</p>
<p>On the other hand if a TZID is supplied along with both TZSN and TZDN, then the times specified in the notification email will be adjusted and displayed based on whether the date and time should be displayed in Daylight mode or Standard mode.</p></td>
</tr>
<tr class="even">
<td align="left"><p>MS.Notify.TZSN</p></td>
<td align="left"><p><strong>string</strong></p></td>
<td align="left"><p>“Pacific Standard Time”</p></td>
<td align="left"><p><strong>Source:</strong> TimeZoneInfo.Local.StandardName - Standard Time Zone name.</p>
<p>This should the localized name of the time zone’s standard time zone name.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>MS.Notify.TZDN</p></td>
<td align="left"><p><strong>string</strong></p></td>
<td align="left"><p>“Pacific Daylight Time”</p></td>
<td align="left"><p><strong>Source:</strong> TimeZoneInfo.Local.DaylightName - Daylight Time Zone name.</p>
<p>This should be the localized name of the time zone’s daylight savings name. It can be the same as the standard name if the time zone does not support daylight savings.</p></td>
</tr>
</tbody>
</table>

 

<span id="related_topics"></span>Related topics
-----------------------------------------------

* [**IpcSetLicenseProperty**](xref:msipc.ipcsetlicenseproperty)
* [**IPC\_LI\_APP\_SPECIFIC\_DATA**](xref:msipc.license_property_types)
* [**IPC\_NAME\_VALUE\_LIST**](xref:msipc.ipc_name_value_list)
 

 



