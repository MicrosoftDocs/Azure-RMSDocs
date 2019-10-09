---
# required metadata

title: Refresh Azure RMS templates - AIP
description: When you use the Azure Rights Management service, templates are automatically downloaded to client computers so that users can select them from their applications. However, you might need to take additional steps if you make changes to the templates.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 10/09/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 8c2064f0-dd71-4ca5-9040-1740ab8876fb

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: azurerms
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---


# Refreshing templates for users and services

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

When you use the Azure Rights Management service from Azure Information Protection, protection templates are automatically downloaded to client computers so that users can select them from their applications. However, you might need to take additional steps if you make changes to the templates:

|Application or service|How templates are refreshed after changes|
|--------------------------|---------------------------------------------|
|Exchange Online<br /><br />Applicable for transport rules and the Outlook web app |Automatically refreshed within an hour - no additional steps required.|
|Azure Information Protection client|Automatically refreshed whenever the Azure Information Protection policy is refreshed on the client:<br /><br /> - When an Office application opens that supports the Azure Information Protection bar. <br /><br /> - When you right-click to classify and protect a file or folder. <br /><br /> - When you run the PowerShell cmdlets for labeling and protection (Get-AIPFileStatus and Set-AIPFileLabel).<br /><br /> - When the Azure Information Protection Scanner service starts and the local policy is older than one hour. In addition, the scanner service checks for changes every hour and uses these changes for the next scan cycle.<br /><br /> - Every 24 hours.<br /><br /> Additionally, because this client is tightly integrated with Office, any refreshed templates for Office 365 apps, Office 2019, Office 2016, or Office 2013 will also be refreshed for the Azure Information Protection client.|
|Azure Information Protection unified labeling client|Automatically refreshed every 4 hours, per Office app.<br /><br /> Additionally, because this client is tightly integrated with Office, any refreshed templates for Office 365 apps, Office 2019, Office 2016, or Office 2013 will also be refreshed for the Azure Information Protection unified labeling client.|
|Office 365 apps, Office 2019, Office 2016, and Office 2013|Automatically refreshed - on a schedule:<br /><br />- For these later versions of Office: The default refresh interval  is every 7 days.<br /><br />To force a refresh sooner than the schedule, see the following section, [Office 365 apps, Office 2019, Office 2016, and Office 2013: How to force a refresh for templates](#office-365-apps-office-2019-office-2016-and-office-2013-how-to-force-a-refresh-for-templates).|
|Office 2010|Automatically refreshed when users sign out from Windows, sign back in, and wait up to 1 hour.|
|Exchange on-premises with the Rights Management connector<br /><br />Applicable for transport rules and the Outlook web app|Automatically refreshed - no additional steps required. However, the Outlook web app caches the UI for a day.|
|Office 2019 for Mac and Office 2016 for Mac|Automatically refreshed. However, if you need to force a refresh, see the following section, [Office 2019 for Mac and Office 2016 for Mac: How to force a refresh for templates](#office-2019-for-mac-and-office-2016-for-mac-how-to-force-a-refresh-for-templates)|
|RMS sharing app for Mac computers|Automatically refreshed - no additional steps required.|
|Office apps that [support the Sensitivity feature](https://support.office.com/article/apply-sensitivity-labels-to-your-documents-and-email-within-office-2f96e7cd-d5a4-403b-8bd7-4cc636bae0f9?ad=US&ui=en-US&rs=en-US#bkmk_whereavailable)|These clients do not download templates but access them online - no additional steps required.|

When client applications need to download templates (initially or refreshed for changes), be prepared to wait up to 30 minutes before the download is complete and the new or updated templates are fully operational. The actual time will vary, according to factors such as the size and complexity of the template configuration, and the network connectivity. 

## Office 365 apps, Office 2019, Office 2016, and Office 2013: How to force a refresh for templates
By editing the registry on the computers running Office 365 apps, Office 2019, Office 2016, or Office 2013, you can change the automatic schedule so that changed templates are refreshed on computers more frequently than their default value. You can also force an immediate refresh by deleting the existing data in a registry value.

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

1. Using a registry editor, delete the data for the **LastUpdatedTime** value. For example, the data might display **2015-04-20T15:52**; delete 2015-04-20T15:52 so that no data is displayed. Use the following information to locate the registry path to delete this registry value data.

   **Registry path:** HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\MSIPC\\<*MicrosoftRMS_FQDN*>\Template\\<*user_alias*>

   **Type:** REG_SZ

   **Value:** LastUpdatedTime

   > [!TIP]
   > In the registry path, <*MicrosoftRMS_FQDN*> refers to your Microsoft RMS service FQDN. If you want to verify this value:
   > 
   > Run the [Get-AipServiceConfiguration](/powershell/module/aipservice/get-aipserviceconfiguration) cmdlet for Azure Information Protection. If you haven't already installed the AIPService PowerShell module, see [Installing the AIPService PowerShell module](install-powershell.md).
   > 
   > From the output, identify the **LicensingIntranetDistributionPointUrl** value.
   > 
   > For example: **LicensingIntranetDistributionPointUrl   : https://5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com/_wmcs/licensing**
   > 
   > From the value, remove **https://** and **/_wmcs/licensing** from this string. The remaining value is your Microsoft RMS service FQDN. In our example, the Microsoft RMS service FQDN would be the following value:
   > 
   > **5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com**

2. Delete the following folder and all files it contains: **%localappdata%\Microsoft\MSIPC\Templates**

3. Restart your Office applications and instances of File Explorer.

## Office 2019 for Mac and Office 2016 for Mac: How to force a refresh for templates

In these versions of Office for Mac, templates refresh when you open protected content or you protect content by using a template. If you need to force a refresh of the templates, you can use the following instructions. However, the command in the instructions deletes the templates, the RMS token cache in the key chain, and local use licenses for any previously opened protected content. As a result, you will need to authenticate again and you must have an Internet connection to open the previously opened protected content.

1. Open Terminal, and enter the following command:
    
    	defaults write ~/Library/Containers/com.microsoft.Outlook/Data/Library/Preferences/com.microsoft.Outlook ResetRMSCache 1

2. Restart Outlook for Mac.

3. Create a new email and select **Encrypt**, and then **Verify Credentials**.


## See Also
[Configuring and managing templates in the Azure Information Protection policy](configure-policy-templates.md)

