How to: Enable error and performance logging
==========================================================================================

The Microsoft Rights Management SDK 4.2 manages diagnosis and performance logs upload through a single device property.

<span id="Overview"></span><span id="overview"></span><span id="OVERVIEW"></span>Overview
-----------------------------------------------------------------------------------------

You can improve your users' experience and troubleshooting by enabling automatic diagnostics and performance logging upload to Microsoft. In order to honor user privacy, you as the app developer, must ask the user to consent before enabling the automatic logging.

You will manager logging control through two properties.

-   Enable logging through the **IpcCustomerExperienceDataCollectionEnabled** property. The setting is persistent across device resets.
-   Control the logging level through the **IpcLogLevel** property using the following settings.
    1 - Verbose
    2 - Informational
    3 - Warning
    4 - Error
    5 - Critical

In each of the example code snippets following, the calling application can set or query the property.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"></td>
<td align="left">Android</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left"><p>Enable automatic logging</p></td>
<td align="left"><p></p>
<div class="code">
<span codelanguage=""></span>
<table>
<colgroup>
<col width="100%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><pre><code>SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(context);
SharedPreferences.Editor editor = preferences.edit();
editor.putBoolean(&quot;IpcCustomerExperienceDataCollectionEnabled&quot;, true); 
editor.commit();</code></pre></td>
</tr>
</tbody>
</table>
</div></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left"><p>Get current logging control flag setting</p></td>
<td align="left"><p></p>
<div class="code">
<span codelanguage=""></span>
<table>
<colgroup>
<col width="100%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><pre><code>SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(context);
Boolean isLogUploadEnabled = preferences.getBoolean(&quot;IpcCustomerExperienceDataCollectionEnabled&quot;, false);</code></pre></td>
</tr>
</tbody>
</table>
</div></td>
<td align="left"></td>
</tr>
</tbody>
</table>

 

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"></td>
<td align="left">iOS</td>
</tr>
<tr class="even">
<td align="left"><p>Enable automatic logging</p></td>
<td align="left"><p></p>
<div class="code">
<span codelanguage=""></span>
<table>
<colgroup>
<col width="100%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><pre><code>NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setBool:FALSE forKey:@&quot;IpcCustomerExperienceDataCollectionEnabled”];
        [[NSUserDefaults standardUserDefaults] synchronize];</code></pre></td>
</tr>
</tbody>
</table>
</div></td>
</tr>
<tr class="odd">
<td align="left"><p>Get current logging control flag setting</p></td>
<td align="left"><p></p>
<div class="code">
<span codelanguage=""></span>
<table>
<colgroup>
<col width="100%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><pre><code>[[NSUserDefaults standardUserDefaults] boolForKey:@&quot;IpcCustomerExperienceDataCollectionEnabled&quot;];</code></pre></td>
</tr>
</tbody>
</table>
</div></td>
</tr>
<tr class="even">
<td align="left"><p>Set log level control</p></td>
<td align="left"><p></p>
<div class="code">
<span codelanguage=""></span>
<table>
<colgroup>
<col width="100%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><pre><code>NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
[prefs setInteger:1 forKey:@&quot;IpcLogLevel”];
[[NSUserDefaults standardUserDefaults] synchronize];</code></pre></td>
</tr>
</tbody>
</table>
</div></td>
</tr>
<tr class="odd">
<td align="left"><p>Get log level control setting</p></td>
<td align="left"><p></p>
<div class="code">
<span codelanguage=""></span>
<table>
<colgroup>
<col width="100%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><pre><code>[[NSUserDefaults standardUserDefaults] boolForKey:@&quot;IpcLogLevel&quot;];</code></pre></td>
</tr>
</tbody>
</table>
</div></td>
</tr>
</tbody>
</table>

 

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"></td>
<td align="left">Windows</td>
</tr>
<tr class="even">
<td align="left"><p>Enable automatic logging</p></td>
<td align="left"><p></p>
<div class="code">
<span codelanguage=""></span>
<table>
<colgroup>
<col width="100%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><pre><code>CustomerExperienceConfiguration::Option = CustomerExperienceOptions::LoggingEnabledNow;</code></pre></td>
</tr>
</tbody>
</table>
</div>
<p>For more information on optional settings, see [<strong>CustomerExperienceOptions</strong>](xref:msipcthin2.customerexperienceoptions).</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Get current logging control flag setting</p></td>
<td align="left"><p></p>
<div class="code">
<span codelanguage=""></span>
<table>
<colgroup>
<col width="100%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><pre><code>CustomerExperienceOptions loggingOption = CustomerExperienceConfiguration::Option;</code></pre></td>
</tr>
</tbody>
</table>
</div></td>
</tr>
</tbody>
</table>

 

**Note**  The Windows code snips above are in C++. For C\#, update the syntax with ‘.’ in place of ‘::’.

 

**Linux / C++** - This SDK has some basic logging that is not as extensive as that of the other platforms. For more information see the **Troubleshooting** section of the "README.md" at [RMS SDK for portable C++](https://github.com/AzureAD/rms-sdk-for-cpp#troubleshooting).

 

 



