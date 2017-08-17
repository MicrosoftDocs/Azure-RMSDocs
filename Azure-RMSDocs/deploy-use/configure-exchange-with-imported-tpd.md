---
# required metadata

title: Configure Exchange Online IRM for the Azure Rights Management service from Azure Information Protection 
description: Information and instructions for admins to configure Exchange Online for the Azure Rights Management service when the Office 365 tenant does not support message protection. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 05/17/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Exchange Online IRM configuration when you have imported a trusted publishing domain

>*Applies to: Azure Information Protection, Office 365*

Use these instructions only if you have previously configured Exchange Online for IRM by importing your trusted publishing domain (TPD), and you need to be able to decrypt emails that were previously encrypted.

If neither of these conditions apply to you, do not use these instructions and instead, use [the Office instructions].

## Exchange Online IRM configuration if you have an imported TPD

To configure Exchange Online to support the Azure Rights Management service, you must configure the information rights management (IRM) service for Exchange Online. To do this, you use Windows PowerShell (no need to install a separate module), and run [PowerShell commands for Exchange Online](https://technet.microsoft.com/library/jj200677.aspx).

> [!NOTE]
> Until Microsoft migrates your Office 365 tenant, you cannot configure Exchange Online to support the Azure Rights Management service if you are using a customer-managed tenant key (BYOK) for Azure Information Protection, rather than the default configuration of a Microsoft-managed tenant key. 
>
> If you try to configure Exchange Online when the Azure Rights Management service is using BYOK, the command to import the key (step 5, in the following procedure) fails with the error message **[FailureCategory=Cmdlet-FailedToGetTrustedPublishingDomainFromRmsOnlineException]**.

The following steps provide a typical set of commands that you would run to enable Exchange Online to use the Azure Rights Management service for this scenario:

1.  If this is the first time that you have used Windows PowerShell for Exchange Online on your computer, you must configure Windows PowerShell to run signed scripts. Start your Windows PowerShell session by using the **Run as administrator** option, and then type:

    ```
    Set-ExecutionPolicy RemoteSigned
    ```

2.  In your Windows PowerShell session, sign in to Exchange Online by using an account that is enabled for remote Shell access. By default, all accounts that are created in Exchange Online are enabled for remote Shell access but this can be disabled  (and enabled) by using the [Set-User &lt;UserIdentity&gt; -RemotePowerShellEnabled](https://technet.microsoft.com/library/jj984292%28v=exchg.160%29.aspx) command.

    To sign in, type:

    ```
    $UserCredential = Get-Credential
    ```
    In the **Windows PowerShell credential request** dialog box, supply your Office 365 user name and password.

3.  Connect to the Exchange Online service by running the following two commands:

    ```
    $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
    ```

    ```
    Import-PSSession $Session
    ```

4.  Specify the location of the Azure Information Protection tenant key, according to according to where your organization's tenant was created:

    For North America:

    ```
    Set-IRMConfiguration -RMSOnlineKeySharingLocation "https://sp-rms.na.aadrm.com/TenantManagement/ServicePartner.svc"
    ```
    For Europe:

    ```
    Set-IRMConfiguration -RMSOnlineKeySharingLocation "https://sp-rms.eu.aadrm.com/TenantManagement/ServicePartner.svc"
    ```
    For Asia:

    ```
    Set-IRMConfiguration -RMSOnlineKeySharingLocation "https://sp-rms.ap.aadrm.com/TenantManagement/ServicePartner.svc"
    ```
    For South America:

    ```
    Set-IRMConfiguration -RMSOnlineKeySharingLocation "https://sp-rms.sa.aadrm.com/TenantManagement/ServicePartner.svc"
    ```
    For Office 365 Government (Government Community Cloud):

    ```
    Set-IRMConfiguration -RMSOnlineKeySharingLocation "https://sp-rms.govus.aadrm.com/TenantManagement/ServicePartner.svc"
    ```

5.  Import configuration data from the Azure Rights Management service to Exchange Online, in the form of the trusted publishing domain (TPD). This includes the Azure Information Protection tenant key and Azure Rights Management templates:

    ```
    Import-RMSTrustedPublishingDomain -RMSOnline -name "RMS Online"
    ```
    In this command, we used the name of **RMS Online** for the base name of the TPD for Azure Rights Management in Exchange Online. After the TPD is imported, it is named **RMS Online - 1** in Exchange Online.

6.  Enable the Azure Rights Management functionality so that IRM features are available for Exchange Online:

    ```
    Set-IRMConfiguration -InternalLicensingEnabled $true
    ```
    After running this command, Rights Management is automatically enabled for the Outlook client, the Outlook Web app, and Exchange Active Sync.

7.  Optionally, test that this configuration is successful by using the following command:

    ```
    Test-IRMConfiguration -Sender <user email address>
    ```
    For example: **Test-IRMConfiguration -Sender  adams@contoso.com**

    This command runs a series of checks that includes verifying connectivity to the service, retrieving the configuration, retrieving URIs, licenses, and any templates. In the Windows PowerShell session, you will see the results of each and at the end, if everything passes these checks: **OVERALL RESULT: PASS**

8.  Disconnect your remote PowerShell session:

    ```
    Remove-PSSession $Session
    ```

Users can now protect their email messages by using the Azure Rights Management service. For example, in the Outlook Web App, select **Set permissions** from the extended menu (**...**), and then choose **Do Not Forward** or one of the available templates to apply information protection to the email message and any attachments. However, because the Outlook Web App caches the UI for a day, wait for this time period to elapse before you try applying information protection to email messages and after running these configuration commands. Before the UI updates to reflect the new configuration, you will not see any options from the **Set permissions** menu.

> [!IMPORTANT]
> If you create new [custom templates](configure-custom-templates.md) for Azure Rights Management or update the templates, each time, you must run the following Exchange Online PowerShell command (if necessary, run steps 2 and 3 first) to synchronize these changes to Exchange Online: `Import-RMSTrustedPublishingDomain -Name "RMS Online - 1" -RefreshTemplates –RMSOnline`

As an Exchange administrator, you can now configure features that apply information protection automatically, such as [transport rules](https://technet.microsoft.com/library/dd302432.aspx), [data loss prevention (DLP) policies](https://technet.microsoft.com/library/jj150527%28v=exchg.150%29.aspx), and [protected voice mail](https://technet.microsoft.com/library/dn198211%28v=exchg.150%29.aspx) (Unified Messaging).


### Office 365 Message Encryption
Run the same steps as documented in the previous section, but if you don't want templates to be displayed, before step 6, run the following command to prevent IRM templates from being available in the Outlook Web App and Outlook client: `Set-IRMConfiguration -ClientAccessServerEnabled $false`

Then, you're ready to configure [transport rules](https://technet.microsoft.com/library/dd302432.aspx) to automatically modify the message security when recipients are located outside the organization, and select the **Apply Office 365 Message Encryption** option.

For more information about message encryption, see [Encryption in Office 365](https://technet.microsoft.com/library/dn569286.aspx) in the Exchange library.


[!INCLUDE[Commenting house rules](../includes/houserules.md)]
