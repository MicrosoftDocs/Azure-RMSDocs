---
# required metadata

title: Manage personal data for Azure Information Protection
description: Information about the personal data that is used by Azure Information Protection and how you can view, export, and delete it.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 05/16/2018
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 99a51862-83e9-4a1e-873a-a84ae1465f07

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Manage personal data for Azure Information Protection

When you use and configure Azure Information Protection, email addresses and IP addresses are stored and used by the Azure Information Protection service. This personal data can be found in the following items:

- The Azure Information Protection policy

- Protection templates for the Azure Rights Management service

- Admin logs for the Azure Rights Management service

- User logs for the Azure Rights Management service

- Document tracking logs  


!INCLUDE(../includes/gdpr-intro-sentence.md)


## Viewing personal data that Azure Information Protection uses

When an Azure Information Protection label is configured to apply protection, you can use the Azure portal to view email addresses that an administrator has specified. For more information, see [How to configure a label for Rights Management protection](configure-policy-protection.md).

The same information can be found in protection templates, by using PowerShell cmdlets from the [AADRM module](/powershell/module/aadrm).

When the service is used, these email addresses and the users' IP addresses might be saved in log files. 

### Protection templates

Run the [Get-AadrmTemplate](/powershell/module/aadrm/get-aadrmtemplate) cmdlet to get a list of protection templates. You can use the template ID to get details of a specific template. The `RightsDefinitions` object displays the personal data, if any. 

Example:
```
PS C:\Users> Get-AadrmTemplate -TemplateId fcdbbc36-1f48-48ca-887f-265ee1268f51 | select *


TemplateId              : fcdbbc36-1f48-48ca-887f-265ee1268f51
Names                   : {1033 -> Confidential}
Descriptions            : {1033 -> This data includes sensitive business information. Exposing this data to
                          unauthorized users may cause damage to the business. Examples for Confidential information
                          are employee information, individual customer projects or contracts and sales account data.}
Status                  : Archived
RightsDefinitions       : {admin@aip500.onmicrosoft.com -> VIEW, VIEWRIGHTSDATA, EDIT, DOCEDIT, PRINT, EXTRACT,
                          REPLY, REPLYALL, FORWARD, EXPORT, EDITRIGHTSDATA, OBJMODEL, OWNER,
                          AllStaff-7184AB3F-CCD1-46F3-8233-3E09E9CF0E66@aip500.onmicrosoft.com -> VIEW,
                          VIEWRIGHTSDATA, EDIT, DOCEDIT, PRINT, EXTRACT, REPLY, REPLYALL, FORWARD, EXPORT,
                          EDITRIGHTSDATA, OBJMODEL, OWNER, admin2@aip500.onmicrosoft.com -> VIEW, VIEWRIGHTSDATA, EDIT,
                          DOCEDIT, PRINT, EXTRACT, REPLY, REPLYALL, FORWARD, EXPORT, EDITRIGHTSDATA, OBJMODEL, OWNER}
ContentExpirationDate   : 1/1/0001 12:00:00 AM
ContentValidityDuration : 0
ContentExpirationOption : Never
LicenseValidityDuration : 7
ReadOnly                : False
LastModifiedTimeStamp   : 1/26/2018 6:17:00 PM
ScopedIdentities        : {}
EnableInLegacyApps      : False
LabelId                 :
```

### Admin logs for the Azure Rights Management service

Run the [Get-AadrmAdminLog](/powershell/module/aadrm/get-aadrmadminlog) cmdlet to get a log of admin actions for the Azure Rights Management service, which protects data for Azure Information Protection. This log includes personal data in the form of email addresses and IP addresses. The log is in plaintext and after it is downloaded, the details of a specific administrator can be searched offline.

For example:
```
PS C:\Users> Get-AadrmAdminLog -Path '.\Desktop\admin.log' -FromTime 4/1/2018 -ToTime 4/30/2018 -Verbose
The Rights Management administration log was successfully generated and can be found at .\Desktop\admin.log.
```

### User logs for the Azure Rights Management service
Run the [Get-AadrmUserLog](/powershell/module/aadrm/get-aadrmuserlog) cmdlet to retrieve a log of end-user actions that use the Azure Rights Management service. This service protects data for Azure Information Protection. The log could include personal data in the form of email addresses and IP addresses. The log is in plaintext and after it is downloaded, the details of a specific administrator can be searched offline.

For example:
```
PS C:\Users> Get-AadrmUserLog -Path '.\Desktop\' -FromDate 4/1/2018 -ToDate 4/30/2018 -NumberOfThreads 10
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

### Document tracking logs

Run the [Get-AadrmDocumentLog](/powershell/module/aadrm/get-aadrmdocumentlog) cmdlet to retrieve information from the document tracking site about a specific user. To get tracking information associated with the document logs, use the [Get-AadrmTrackingLog](/powershell/module/aadrm/get-aadrmtrackinglog?view=azureipps) cmdlet.

For example:
```
PS C:\Users> Get-AadrmDocumentLog -UserEmail "admin@aip500.onmicrosoft.com"


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


PS C:\Users> Get-AadrmTrackingLog -UserEmail "admin@aip500.onmicrosoft.com"

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

There is no search by ObjectID. However, you are not restricted by the `-UserEmail` parameter and the email address you provide doesn't need to be part of your tenant. If the email adddress provided is stored anywhere in the document tracking logs, the docg the Azure portal. For more information, see [How to configure a label for Rights Management protection](configure-policy-protection.md).ument tracking entry is returned in the cmdlet output.

## Securing and controlling access to personal information
Personal data stored within the Azure Information Protection service is accessible only to Global Administrators and Security Administrators. These roles can be assigned in Azure Active Directory.

## Updating personal data
Personal data in the Azure Information Protection policy can be updated by usin
  
The same information can be updated in protection templates, by using PowerShell cmdlets from the [AADRM module](/powershell/module/aadrm).

### Protection templates

Run the [Set-AadrmTemplateProperty](/powershell/module/aadrm/set-aadrmtemplateproperty) cmdlet to update the protection template. Becuase the personal data is within the `RightsDefinitions` property, you will also need to use the [New-AadrmRightsDefinition](/powershell/module/aadrm/new-aadrmrightsdefinition) cmdlet to create a RightsDefinitions object with the updated information, and use the RightsDefinitions object with the `Set-AadrmTemplateProperty` cmdlet.


## Deleting personal data
Personal data in the Azure Information Protection policy can be deleted by using the Azure portal. For more information, see [How to configure a label for Rights Management protection](configure-policy-protection.md).
  
The same information can be deleted in protection templates, by using PowerShell cmdlets from the [AADRM module](/powershell/module/aadrm).

Personal data in document tracking logs, admin logs, or user logs can be deleted by raising a request with Microsoft Support.

### Steps to delete personal data with Microsoft Support

**Step 1: Initiate delete request**
[Contact Microsoft Support](../get-started/information-support.md#to-contact-microsoft-support) to open an Azure Information Protection support case with a request for deleting data from your tenant. You must prove that you are an administrator for your Azure Information Protection tenant and understand that this process takes several days to confirm. While submitting your request, you will need to provide additional information, depending on the data that needs to be deleted.

- To delete the admin log, you need to provide the **end date**. All admin logs until that end date will be deleted.
- To delete the user logs, you need to provide the **end date**. All user logs until that end date will be deleted.
- To delete the document tracking logs, you  need to provide the **UserEmail**. All document tracking information relating to the UserEmail will be deleted.

Deleting this data is a permanent action. There is no means to recover the data after a delete request has been processed. It is recommended that administrators export the required data before submitting a delete request.

**Step 2: Wait for verification**
Microsoft will verify that your request to delete one or more logs is legitimate. This process can take up to five working days.

**Step 3: Get confirmation of the deletion**
Microsoft Customer Support Services (CSS) will send you a confirmation email that the data has been deleted. 

## Exporting personal data
When you use the AADRM PowerShell cmdlets, the personal data is made available for search and export as a PowerShell object. The PowerShell object can be converted into JSON and saved by using the `ConvertTo-Json` cmdlet.

## Restricting the use of personal data for profiling or marketing without consent
Azure Information Protection follows Microsoft's [privacy terms](https://privacy.microsoft.com/privacystatement) for profiling or marketing based on personal data.

## Auditing and reporting
For search and export, all cmdlets must be run as a Global Administrator. These operations are recorded in the administrator log that is available for the administrator to download.

For delete, the support request acts as the auditing and reporting trail for the actions performed by Microsoft. After deletion, the deleted data will not be available for search and export, and the administrator can verify this using the AADRM PowerShell cmdlets.
