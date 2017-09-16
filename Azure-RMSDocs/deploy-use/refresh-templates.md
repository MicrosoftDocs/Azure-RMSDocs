---
# required metadata

title: Refresh Azure RMS templates - AIP
description: When you use the Azure Rights Management service, templates are automatically downloaded to client computers so that users can select them from their applications. However, you might need to take additional steps if you make changes to the templates.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 07/31/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 8c2064f0-dd71-4ca5-9040-1740ab8876fb

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---


# Refreshing templates for users and services

>*Applies to: Azure Information Protection, Office 365*

When you use the Azure Rights Management service of Azure Information Protection, templates are automatically downloaded to client computers so that users can select them from their applications. However, you might need to take additional steps if you make changes to the templates:

|Application or service|How templates are refreshed after changes|
|--------------------------|---------------------------------------------|
|Exchange Online<br /><br />Applicable for transport rules, DLP rules, and the Outlook web app|Manual configuration required to refresh templates.<br /><br />For the configuration steps, see the following section, [Exchange Online only: How to configure Exchange to download changed custom templates](#exchange-online-only-how-to-configure-exchange-to-download-changed-custom-templates).|
|Azure Information Protection client|Automatically refreshed whenever the Azure Information Protection policy is refreshed on the client:<br /><br /> - When an Office application opens that supports the Azure Information Protection bar. <br /><br /> - When you right-click to classify and protect a file or folder. <br /><br /> - When you run the PowerShell cmdlets for labeling and protection (Get-AIPFileStatus, Set-AIPFileClassification, and Set-AIPFileLabel).<br /><br /> - When the Azure Information Protection Scanner service starts and at the start of each cycle when the scanning type is set to Full.<br /><br /> - Every 24 hours.<br /><br /> Additionally, because the Azure Information Protection client is tightly integrated with Office, any refreshed templates for Office 2016 or Office 2013 will also be refreshed for the Azure Information Protection client.|
|Office 2016 and Office 2013<br /><br />RMS sharing application for Windows|Automatically refreshed - on a schedule:<br /><br />- For these later versions of Office: The default refresh interval  is every 7 days.<br /><br />- For the RMS sharing application for Windows: Starting with version 1.0.1784.0, the default refresh interval is every 1 day. Prior versions have a default refresh interval of every 7 days.<br /><br />To force a refresh sooner than the schedule, see the following section, [Office 2016, Office 2013, and RMS sharing application for Windows: How to force a refresh for a changed custom template](#office-2016--office-2013-and-rms-sharing-application-for-windows-how-to-force-a-refresh-for-a-changed-custom-template).|
|Office 2010|Automatically refreshed when users sign out from Windows, sign back in, and wait up to 1 hour.|
|Exchange on-premises with the Rights Management connector<br /><br />Applicable for transport rules and the Outlook web app|Automatically refreshed - no additional steps required. However, the Outlook web app caches the UI for a day.|
|Office 2016 for Mac|Automatically refreshed - no additional steps required.|
|RMS sharing app for Mac computers|Automatically refreshed - no additional steps required.|

When client applications need to download templates (initially or refreshed for changes), be prepared to wait up to 15 minutes before the download is complete and the new or updated templates are fully operational. The actual time will vary, according to factors such as the size and complexity of the template configuration, and the network connectivity. 

## Exchange Online only: How to configure Exchange to download changed custom templates
If you have already configured Information Rights Management (IRM) for Exchange Online, custom templates will not download for users until you make the following changes by using Windows PowerShell in Exchange Online.

> [!NOTE]
> For more information about how to use Windows PowerShell in Exchange Online, see [Using PowerShell with Exchange Online](https://technet.microsoft.com/library/jj200677%28v=exchg.160%29.aspx).

You must do this procedure each time you change a template.

### To update templates for Exchange Online

1.  Using Windows PowerShell in Exchange Online, connect to the service:

    1.  Supply your Office 365 user name and password:

        ```
        $UserCredential = Get-Credential
        ```

    2.  Connect to the Exchange Online service by running the following two commands:

        ```
        $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
        ```

        ```
        Import-PSSession $Session
        ```

2.  Use the [Import-RMSTrustedPublishingDomain](http://technet.microsoft.com/library/jj200724%28v=exchg.160%29.aspx) cmdlet to re-import your trusted publishing domain (TPD) from Azure RMS:

    ```
    Import-RMSTrustedPublishingDomain -Name "<TPD name>" -RefreshTemplates -RMSOnline
    ```
    For example, if your TPD name is **RMS Online - 1** (a typical name for many organizations), enter: **Import-RMSTrustedPublishingDomain -Name "RMS Online - 1" -RefreshTemplates -RMSOnline**

    > [!NOTE]
    > To verify your TPD name, you can use the [Get-RMSTrustedPublishingDomain](http://technet.microsoft.com/library/jj200707%28v=exchg.160%29.aspx) cmdlet.

3.  To confirm that the templates have imported successfully, wait a few minutes and then run the [Get-RMSTemplate](http://technet.microsoft.com/library/dd297960%28v=exchg.160%29.aspx) cmdlet and set the Type to All. For example:

    ```
    Get-RMSTemplate -TrustedPublishingDomain "RMS Online - 1" -Type All
    ```
    > [!TIP]
    > It's useful to keep a copy of the output so that you can easily copy the template names or GUIDs if you later archive a template.

4.  For each imported template that you want to be available in the Outlook Web App, you must use the [Set-RMSTemplate](http://technet.microsoft.com/library/hh529923%28v=exchg.160%29.aspx) cmdlet and set the Type to Distributed:

    ```
    Set-RMSTemplate -Identity "<name  or GUID of the template>" -Type Distributed
    ```
    Because Outlook Web Access caches the UI for 24 hours, users might not see the new template for up to a day.

In addition, if you archive a template (custom or default) and use Exchange Online with Office 365, users will continue to see the archived templates if they use the Outlook Web App or mobile devices that use the Exchange ActiveSync Protocol.

So that users no longer see these templates, connect to the service by using Windows PowerShell in Exchange Online, and then use the [Set-RMSTemplate](http://technet.microsoft.com/library/hh529923%28v=exchg.160%29.aspx) cmdlet by running the following command:

```
Set-RMSTemplate -Identity "<name or GUID of the template>" -Type Archived
```

## Office 2016,  Office 2013, and RMS sharing application for Windows: How to force a refresh for a changed custom template
By editing the registry on the computers running Office 2016, Office 2013, or the Rights Management (RMS) sharing application for Windows, you can change the automatic schedule so that changed templates are refreshed on computers more frequently than their default value. You can also force an immediate refresh by deleting the existing data in a registry value.

> [!WARNING]
> If you use the Registry Editor incorrectly, you might cause serious problems that might require you to reinstall the operating system. Microsoft cannot guarantee that you can solve problems that result from using the Registry Editor incorrectly. Use the Registry Editor at your own risk.

### To change the automatic schedule

1.  Using a registry editor, create and set one of the following registry values:

    - To set an update frequency in days (minimum of 1 day):  Create a new registry value named **TemplateUpdateFrequency** and define an integer value for the data, which specifies the frequency in days to download any changes to a downloaded template. Use the following information to locate the registry path to create this new registry value.

        **Registry path:** HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\MSIPC

        **Type:** REG_DWORD

        **Value:** TemplateUpdateFrequency

    - To set an update frequency in seconds (minimum of 1 second):  Create a new registry value named **TemplateUpdateFrequencyInSeconds** and define an integer value for the data, which specifies the frequency in seconds to download any changes to a downloaded template. Use the following information to locate the registry path to create this new registry value.

        **Registry path:** HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\MSIPC

        **Type:** REG_DWORD

        **Value:** TemplateUpdateFrequencyInSeconds

    Make sure that you create and set one of these registry values, not both. If both are present, **TemplateUpdateFrequency** is ignored.

2.  If you want to force an immediate refresh of the templates, go to the next procedure. Otherwise, restart your Office applications and instances of File Explorer now.

### To force an immediate refresh

1.  Using a registry editor, delete the data for the **LastUpdatedTime** value. For example, the data might display **2015-04-20T15:52**; delete 2015-04-20T15:52 so that no data is displayed. Use the following information to locate the registry path to delete this registry value data.

	**Registry path:** HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\MSIPC\<*MicrosoftRMS_FQDN*>\Template

	**Type:** REG_SZ

	**Value:** LastUpdatedTime

	> [!TIP]
	    > In the registry path, <*MicrosoftRMS_FQDN*> refers to your Microsoft RMS service FQDN. If you want to verify this value:

    > 1.  Run the [Get-AadrmConfiguration](https://msdn.microsoft.com/library/windowsazure/dn629410.aspx) cmdlet for Azure RMS. If you haven't already installed the Windows PowerShell module for Azure RMS, see [Installing Windows PowerShell for Azure Rights Management](install-powershell.md).
    > 2.  From the output, identify the **LicensingIntranetDistributionPointUrl** value.
    > 
    >     For example: **LicensingIntranetDistributionPointUrl   : https://5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com/_wmcs/licensing**
    > 3.  From the value, remove **https://** and **/_wmcs/licensing** from this string. The remaining value is your Microsoft RMS service FQDN. In our example, the Microsoft RMS service FQDN would be the following value:
    > 
    >     **5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com**

2.  Delete the following folder and all files it contains: **%localappdata%\Microsoft\MSIPC\Templates**

3.  Restart your Office applications and instances of File Explorer.


## See Also
[Configuring and managing templates in the Azure Information Protection policy](../deploy-use/configure-policy-templates.md)

[!INCLUDE[Commenting house rules](../includes/houserules.md)]