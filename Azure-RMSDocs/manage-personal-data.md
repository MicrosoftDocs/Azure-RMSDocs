---
# required metadata

title: Manage personal data for Azure Information Protection
description: Information about the personal data that is used by Azure Information Protection and how you can view, export, and delete it.
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 10/04/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 99a51862-83e9-4a1e-873a-a84ae1465f07

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: aashishr
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Manage personal data for Azure Information Protection

[!INCLUDE [looking-for-mip](includes/looking-for-mip.md)]

When you configure and use Azure Information Protection, email addresses and IP addresses are stored and used by the Azure Information Protection service. This personal data can be found in the following items:

- Super users and delegated administrators for the protection service 

- Administration logs for the protection service

- Usage logs for the protection service

- Usage logs for the Microsoft Purview Information Protection client and RMS client 

[!INCLUDE [GDPR-related guidance](./includes/gdpr-intro-sentence.md)]

## Viewing personal data that Azure Information Protection uses

- **Microsoft Purview Information Protection client**:

    For the Microsoft Purview Information Protection client, sensitivity labels and label policies are configured in the Microsoft Purview portal or the Microsoft Purview compliance portal. For more information, see the [Microsoft Purview documentation](/purview/create-sensitivity-labels).

> [!NOTE]
> When the Microsoft Purview Information Protection client is used to classify and protect documents and emails, email addresses and the users' IP addresses might be saved in log files.
> 

### Super users and delegated administrators for the protection service

Run the [Get-AipServiceSuperUser](/powershell/module/aipservice/get-aipservicesuperuser) cmdlet and [get-aipservicerolebasedadministrator](/powershell/module/aipservice/get-aipservicerolebasedadministrator) cmdlet to see which users have been assigned the super user role or global administrator role for the protection service (Azure Rights Management) from Azure Information Protection. For users who have been assigned either of these roles, their email addresses are displayed.


### Administration logs for the protection service

Run the [Get-AipServiceAdminLog](/powershell/module/aipservice/get-aipserviceadminlog) cmdlet to get a log of admin actions for the protection service (Azure Rights Management) from Azure Information Protection. This log includes personal data in the form of email addresses and IP addresses. The log is in plaintext and after it is downloaded, the details of a specific administrator can be searched offline.

For example:
```PowerShell
PS C:\Users> Get-AipServiceAdminLog -Path '.\Desktop\admin.log' -FromTime 4/1/2018 -ToTime 4/30/2018 -Verbose
The Rights Management administration log was successfully generated and can be found at .\Desktop\admin.log.
```

### Usage logs for the protection service
Run the [Get-AipServiceUserLog](/powershell/module/aipservice/get-aipserviceuserlog) cmdlet to retrieve a log of end-user actions that use the protection service from Azure Information Protection. The log could include personal data in the form of email addresses and IP addresses. The log is in plaintext and after it is downloaded, the details of a specific administrator can be searched offline.

For example:
```PowerShell
PS C:\Users> Get-AipServiceUserLog -Path '.\Desktop\' -FromDate 4/1/2018 -ToDate 4/30/2018 -NumberOfThreads 10
Acquiring access to your user log…
Downloading the log for 2018-04-01.
Downloading the log for 2018-04-03.
Downloading the log for 2018-04-06.
Downloading the log for 2018-04-09.
Downloading the log for 2018-04-10.
Downloaded the log for 2018-04-01. The log is available at .\Desktop\rmslog-2018-04-01.log.
Downloaded the log for 2018-04-03. The log is available at .\Desktop\rmslog-2018-04-03.log.
Downloaded the log for 2018-04-06. The log is available at .\Desktop\rmslog-2018-04-06.log.
Downloaded the log for 2018-04-09. The log is available at .\Desktop\rmslog-2018-04-09.log.
Downloaded the log for 2018-04-10. The log is available at .\Desktop\rmslog-2018-04-10.log.
Downloading the log for 2018-04-12.
Downloading the log for 2018-04-13.
Downloading the log for 2018-04-14.
Downloading the log for 2018-04-16.
Downloading the log for 2018-04-18.
Downloaded the log for 2018-04-12. The log is available at .\Desktop\rmslog-2018-04-12.log.
Downloaded the log for 2018-04-13. The log is available at .\Desktop\rmslog-2018-04-13.log.
Downloaded the log for 2018-04-14. The log is available at .\Desktop\rmslog-2018-04-14.log.
Downloaded the log for 2018-04-16. The log is available at .\Desktop\rmslog-2018-04-16.log.
Downloaded the log for 2018-04-18. The log is available at .\Desktop\rmslog-2018-04-18.log.
Downloading the log for 2018-04-24.
Downloaded the log for 2018-04-24. The log is available at .\Desktop\rmslog-2018-04-24.log.
```   

### Usage logs for the Azure Information Protection clients and RMS client

When labels and protection are applied to documents and emails, email addresses and IP addresses can be stored in log files on a user's computer in the following locations:

- For the the Microsoft Purview Information Protection client: **%localappdata%\Microsoft\MSIP\Logs**

- For the RMS client: **%localappdata%\Microsoft\MSIPC\msip\Logs**

In addition, the Microsoft Purview Information Protection client logs this personal data to the local Windows event log **Applications and Services Logs** > **Microsoft Purview Information Protection**.

When the Microsoft Purview Information Protection client runs the scanner, personal data is saved to **%localappdata%\Microsoft\MSIP\Scanner\Reports** on the Windows Server computer that runs the scanner.

You can turn off logging information for the Microsoft Purview Information Protection client and the scanner by using the following configurations:

- For the Microsoft Purview Information Protection client: Edit the registry to [change the logging level](/purview/information-protection-client#change-the-local-logging-level to **Off**.

- For the Microsoft Purview Information Protection scanner: Use the [Set-ScannerConfiguration](/powershell/module/purviewinformationprotection/set-scannerconfiguration) cmdlet to set the *ReportLevel* parameter to **Off**.

[!INCLUDE [GDPR-related guidance](./includes/gdpr-hybrid-note.md)]


### Document tracking logs

**Relevant for**: Rights Management Service protection only with the legacy tracking portal

Run the [Get-AipServiceDocumentLog](/powershell/module/aipservice/get-aipservicedocumentlog) cmdlet to retrieve information from the document tracking site about a specific user. To get tracking information associated with the document logs, use the [Get-AipServiceTrackingLog](/powershell/module/aipservice/get-aipservicetrackinglog) cmdlet.

For example:
```PowerShell
PS C:\Users> Get-AipServiceDocumentLog -UserEmail "admin@aip500.onmicrosoft.com"


ContentId             : 6326fcb2-c465-4c24-a7f6-1cace7a9cb6f
Issuer                : admin@aip500.onmicrosoft.com
Owner                 : admin@aip500.onmicrosoft.com
ContentName           :
CreatedTime           : 3/6/2018 10:24:00 PM
Recipients            : {
                        PrimaryEmail: johndoe@contoso.com
                        DisplayName: JOHNDOE@CONTOSO.COM
                        UserType: External,
                        PrimaryEmail: alice@contoso0110.onmicrosoft.com
                        DisplayName: ALICE@CONTOSO0110.ONMICROSOFT.COM
                        UserType: External
                        }
TemplateId            :
PolicyExpires         :
EULDuration           :
SendRegistrationEmail : True
NotificationInfo      : Enabled: False
                        DeniedOnly: False
                        Culture:
                        TimeZoneId:
                        TimeZoneOffset: 0
                        TimeZoneDaylightName:
                        TimeZoneStandardName:

RevocationInfo        : Revoked: False
                        RevokedTime:
                        RevokedBy:


PS C:\Users> Get-AipServiceTrackingLog -UserEmail "admin@aip500.onmicrosoft.com"

ContentId            : 6326fcb2-c465-4c24-a7f6-1cace7a9cb6f
Issuer               : admin@aip500.onmicrosoft.com
RequestTime          : 3/6/2018 10:45:57 PM
RequesterType        : External
RequesterEmail       : johndoe@contoso.com
RequesterDisplayName : johndoe@contoso.com
RequesterLocation    : IP: 167.220.1.54
                       Country: US
                       City: redmond
                       Position: 47.6812453974602,-122.120736471666

Rights               : {VIEW,OBJMODEL}
Successful           : False
IsHiddenInfo         : False
```

There is no search by ObjectID. However, you are not restricted by the `-UserEmail` parameter and the email address you provide doesn't need to be part of your tenant. If the email address provided is stored anywhere in the document tracking logs, the document tracking entry is returned in the cmdlet output.

## Securing and controlling access to personal information

Personal data that you view and specify in the Azure portal is accessible only to users who have been assigned one of the following [administrator roles from Microsoft Entra ID](/azure/active-directory/active-directory-assign-admin-roles-azure-portal):
    
- **Azure Information Protection administrator**

- **Compliance administrator**

- **Compliance data administrator**

- **Security administrator**

- **Security reader**

- **Global administrator**

- **Global reader**

Personal data that you view and specify by using the AIPService module (or the older module, AADRM) is accessible only to users who have been assigned the **Azure Information Protection administrator**, **Compliance administrator**, **Compliance data administrator**, or **Global Administrator** roles from Microsoft Entra ID, or the global administrator role for the protection service.

## Updating personal data

Sensitivity labels and label policies are configured in the Microsoft Purview compliance portal. For more information, see the [Microsoft 365 documentation](/microsoft-365/compliance/sensitivity-labels).

For the protection settings, you can update the same information by using PowerShell cmdlets from the [AIPService module](/powershell/module/aipservice).

You cannot update email addresses for the super users and delegated administrators. Instead, remove the specified user account, and add the user account with the updated email address. 

### Super users and delegated administrators for the protection service

When you need update an email address for a super user:

1. Use [Remove-AipServiceSuperUser](/powershell/module/aipservice/Remove-AipServiceSuperUser) to remove the user and old email address.

2. Use [Add-AipServiceSuperUser](/powershell/module/aipservice/Add-AipServiceSuperUser) to add the user and new email address.

When you need update an email address for a delegated administrator:

1. Use [Remove-AipServiceRoleBasedAdministrator](/powershell/module/aipservice/Remove-AipServiceRoleBasedAdministrator) to remove the user and old email address.

2. Use [Add-AipServiceRoleBasedAdministrator](/powershell/module/aipservice/Add-AipServiceRoleBasedAdministrator) to add the user and new email address.

## Deleting personal data

Sensitivity labels and label policies are configured in the Microsoft Purview compliance portal. For more information, see the [Microsoft 365 documentation](/microsoft-365/compliance/sensitivity-labels).

For the protection settings, you can delete the same information by using PowerShell cmdlets from the [AIPService module](/powershell/module/aipservice).

To delete email addresses for super users and delegated administrators, remove these users by using the [Remove-AipServiceSuperUser](/powershell/module/aipservice/Remove-AipServiceSuperUser) cmdlet and [Remove-AipServiceRoleBasedAdministrator](/powershell/module/aipservice/Remove-AipServiceRoleBasedAdministrator). 

To delete personal data in document tracking logs, administration logs, or usage logs for the protection service, use the following section to raise a request with Microsoft Support.

To delete personal data in the client log files and scanner logs that are stored  on computers, use any standard Windows tools to delete the files or personal data within the files. 

### To delete personal data with Microsoft Support

Use the following three steps to request that Microsoft deletes personal data in document tracking logs, administration logs, or usage logs for the protection service. 

**Step 1: Initiate delete request**
[Contact Microsoft Support](information-support.md#to-contact-microsoft-support) to open an Azure Information Protection support case with a request for deleting data from your tenant. You must prove that you are an administrator for your Azure Information Protection tenant and understand that this process takes several days to confirm. While submitting your request, you will need to provide additional information, depending on the data that needs to be deleted.

- To delete the administration log, provide the **end date**. All admin logs until that end date will be deleted.
- To delete the usage logs, provide the **end date**. All usage logs until that end date will be deleted.
- To delete the document tracking logs, provide the **end date** and **UserEmail**. All document tracking information relating to the UserEmail until that end date will be deleted. Regular expression (Perl format) for UserEmail is supported.

Deleting this data is a permanent action. There is no means to recover the data after a delete request has been processed. It is recommended that administrators export the required data before submitting a delete request.

**Step 2: Wait for verification**
Microsoft will verify that your request to delete one or more logs is legitimate. This process can take up to five working days.

**Step 3: Get confirmation of the deletion**
Microsoft Customer Support Services (CSS) will send you a confirmation email that the data has been deleted. 

## Exporting personal data
When you use the AIPService or AADRM PowerShell cmdlets, the personal data is made available for search and export as a PowerShell object. The PowerShell object can be converted into JSON and saved by using the `ConvertTo-Json` cmdlet.

## Restricting the use of personal data for profiling or marketing without consent
Azure Information Protection follows Microsoft's [privacy terms](https://privacy.microsoft.com/privacystatement) for profiling or marketing based on personal data.

## Auditing and reporting
Only users who have been assigned [administrator permissions](#securing-and-controlling-access-to-personal-information) can use the AIPService or ADDRM module for search and export of personal data. These operations are recorded in the administration  log that can be downloaded.

For delete actions, the support request acts as the auditing and reporting trail for the actions performed by Microsoft. After deletion, the deleted data will not be available for search and export, and the administrator can verify this using the Get cmdlets from the AIPService module.
