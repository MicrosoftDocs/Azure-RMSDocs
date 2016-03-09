Understanding certificate chains
=========================================================================================

Developing a rights-enabled application requires a public key pair and a certificate chain that leads back to a Microsoft certificate at the root of trust.

<span id="Certificate_Types"></span><span id="certificate_types"></span><span id="CERTIFICATE_TYPES"></span>Certificate Types
-----------------------------------------------------------------------------------------------------------------------------

Every license and certificate used in an Rights Management Services (RMS) environment consists of a chain of certificates that leads back to a Microsoft certification authority (CA) certificate. Microsoft provides two chains into which a license or certificate can be nested, a pre-production certificate chain and a production chain. We recommend that you use the pre-production hierarchy when developing an application so that you can work without signing a *Production License Agreement* with Microsoft. Note that the RMS server must also be configured for pre-production.

You must switch to a production chain before releasing your application. Content protected by a pre-production certificate is less secure than a production certificate.

The public and private keys and the pre-production certificate are included with the SDK in the following files located in the `%MsipcSDKDir%\Bin` folder.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">File Name</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>ISVTier5AppSigningPrivKey.dat</p></td>
<td align="left"><p>Contains the private key used to sign a manifest for use during application development.</p></td>
</tr>
<tr class="even">
<td align="left"><p>ISVTier5AppSigningPubKey.dat</p></td>
<td align="left"><p>Contains the public key signed into the pre-production certificate hierarchy.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>ISVTier5AppSignSDK_Client.xml</p></td>
<td align="left"><p>Contains the pre-production certificate used to generate a manifest for use during application development.</p></td>
</tr>
</tbody>
</table>

 

You use the certificate and the private key to create and sign a manifest that identifies the files that can or must be loaded into the process space of your application and those that must not be loaded. The manifest is then loaded by the platform.

Whether or not you have used a pre-production certificate during application development, when you are ready to release the application, you must generate a new key pair, acquire a production certificate from Microsoft and use the new private key and certificate to create and sign an application manifest.

For more information on working with certificate chains and application signing, see [Switching to the production environment](switching_to_the_production_environment.md).

<span id="related_topics"></span>Related topics
-----------------------------------------------

* [Developer concepts](ad_rms_concepts-nav.md)
* [Switching to the production environment](switching_to_the_production_environment.md)
 

 



