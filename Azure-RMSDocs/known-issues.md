---
# required metadata

title: Known issues - Azure Information Protection
description: Search and browse through known issues and limitations for Azure Information Protection.
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 12/12/2021
ms.topic: reference
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin
---

# Known issues - Azure Information Protection

[!INCLUDE [looking-for-mip](includes/looking-for-mip.md)]

Use the lists and tables below to find details about known issues and limitations related to Azure Information Protection features.

## Other digital signing and encryption solutions

Azure Information Protection can't protect or decrypt files\emails that are digitally signed or encrypted with other solutions, such as removing protection from mails that are signed or encrypted with S/MIME.

## Client support for container files, such as .zip files

Container files are files that include other files, with a typical example being .zip files that contain compressed files. Other examples include .rar, .7z, .msg files and PDF documents that include attachments. 

You can classify and protect these container files, but the classification and protection isn't applied to each file inside the container.

If you have a container file that includes classified and protected files, you must first extract the files to change their classification or protection settings. However, you can remove the protection for all files in supported container files by using the [Set-AIPFileLabel](/powershell/module/azureinformationprotection/set-aipfilelabel) cmdlet. 

Encryption for .msg files is supported in the [MIP SDK](/information-protection/develop/concept-email) only.

The Azure Information Protection viewer can't open attachments in a protected PDF document. In this scenario, when the document is opened in the viewer, the attachments aren't visible.

For more information, see [Admin Guide: File types supported by the Azure Information Protection client](/previous-versions/azure/information-protection/rms-client/client-admin-guide-file-types).

## Known issues for AIP and Exploit Protection

The Azure Information Protection client isn't supported on machines that have .NET 2 or 3, where [Exploit protection](/windows/security/threat-protection/microsoft-defender-atp/enable-exploit-protection) is enabled, and will cause Office apps to behave unexpectedly.

In such cases, we recommend that you upgrade your .NET version. For more information, see [Microsoft .NET Framework requirements](rms-client/reqs-ul-client.md#microsoft-net-framework-requirements).

If you must keep your .NET version 2 or 3, make sure to disable Exploit protection before installing AIP. 

To disable Exploit protection via PowerShell, run the following:

```PowerShell
Set-ProcessMitigation -Name "OUTLOOK.EXE" -Disable EnableExportAddressFilterPlus, EnableExportAddressFilter, EnableImportAddressFilter
```

## Known issues for watermarks

When you're adding a watermark to a label, keep in mind that if you use font size 1, it will automatically adjust to fit the page. However, if you use any other font size, it will use the size you've specified in the font settings.

## PowerShell support for the Azure Information Protection client

The current release of the **AzureInformationProtection** PowerShell module that's installed with the Azure Information Protection client has the following known issues:

- **Outlook personal folders (*.pst* files)**. Natively protecting *.pst* files isn't supported using the **AzureInformationProtection** module.

- **Outlook protected email message (.msg files with a .rpmsg attachment)**. Unprotecting Outlook protected email messages is supported by the **AzureInformationProtection** module for messages inside an Outlook personal folder (.pst file), or on disk in an Outlook message file (.msg file).

-  **PowerShell 7**. Currently PowerShell 7 isn't supported by the AIP Client. using PS7 will result in the error: "Object reference not set to an instance of an object".

For more information, see [Admin Guide: Using PowerShell with the Azure Information Protection client](/previous-versions/azure/information-protection/rms-client/client-admin-guide-powershell).

## Known issues AIP Scanner authentication in version 2.16.73

If you're using version 2.16.73 of the AIP Scanner or installing it for the first time, you may encounter an error when trying to authenticate. The error message reads "Unable to authenticate and set up Microsoft Azure Information Protection". 

This issue is caused by a problem with MSAL authentication. To resolve it, you can add a registry key to the server. 

Path: Computer\HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\MSIP

DWORD: AuthenticateUsingAdal

Value: 1 

By adding this registry key, the Scanner will authenticate using ADAL instead.

## AIP known issues in Office applications

|Feature  |Known issues  |
|---------|---------|
|**Multiple versions of Office<br> <br> Multiple Office accounts**    | The Azure Information Protection unified labeling client doesn't support:  <br><br>-	Multiple versions of Office on the same computer <br>-	Multiple Office accounts, or switching user accounts in Office <br>-	Shared mailboxes     |
|**Multiple displays** |If you're using multiple displays and have an Office application open: <br><br>- You may experience performance issues in your Office apps.<br>- The Azure Information Protection bar may appear to float in the middle of the Office screen, on one or both displays <br><br>To ensure consistent performance, and that the bar remains in the correct location, open the **Options** dialog for your Office application, and under **General**, select **Optimize for compatibility** instead of **Optimize for best appearance**.    |
|**IRM support in Office 2016**| The [DRMEncryptProperty](/deployoffice/security/protect-sensitive-messages-and-documents-by-using-irm-in-office#office-2016-irm-registry-key-options) registry setting, which controls metadata encryption in Office 2016, isn't supported for Azure Information Protection labels.|
|**Outlook object model access** | - The [PromptOOMAddressBookAccess](/outlook/troubleshoot/security/information-about-email-security-settings#configure-a-prompt-when-a-program-accesses-an-address-book-by-using-the-outlook-object-model) registry setting, which controls the prompts that display when address books are accessed via the Outlook object model, isn't supported with Azure Information Protection labels. <br><br>- The [PromptOOMAddressInformationAccess](/outlook/troubleshoot/security/information-about-email-security-settings#configure-a-prompt-when-a-program-reads-address-information-by-using-the-outlook-object-model) registry setting, which controls the prompts that display when a program reads address information, is't supported for Azure Information Protection labels.|
|**Files attached to emails** |Due to a limitation in recent Windows updates, scanning Outlook messages (**.msg** files) may cause those files to be locked. To unlock the files, stop the scanner service. Starting the scanner service again doesn't lock the files again until the next time the messages are scanned. <br><br>To clarify whether your system is affected, you might want to start a scan on a specific folder with a single, sample message, and check to see if the file is locked after the scan is complete. <br><br>**Note**: This issue isn't relevant when applying and removing protection with PowerShell. |
|**Mail merge**    |  The Office [mail merge](https://support.office.com/article/use-mail-merge-for-bulk-email-letters-labels-and-envelopes-f488ed5b-b849-4c11-9cff-932c49474705) feature isn't supported with any Azure Information Protection feature.       |
| **S/MIME emails** | Opening S/MIME emails in Outlook's Reading Pane may cause performance issues. <br><br>To prevent performance issues with S/MIME emails, enable the [**OutlookSkipSmimeOnReadingPaneEnabled**](rms-client/clientv2-admin-guide-customizations.md#prevent-outlook-performance-issues-with-smime-emails) advanced property. <br><br>**Note**: Enabling this property prevents the AIP bar or the email classification from being displayed in Outlook's Reading Pane. |
|**Content markings in Word**    | AIP [content markings](/previous-versions/azure/information-protection/configure-policy-markings) in Microsoft Word headers or footers may be offset or placed incorrectly, or may be hidden entirely, when that same header or footer also contains a table.<br><br>For more information, see [When visual markings are applied](/previous-versions/azure/information-protection/configure-policy-markings#when-visual-markings-are-applied). |
|**Send to File Explorer option** |If you choose to right-click on any file in the File Explorer and select **Send to > Mail recipient**, the Outlook message that opens with the file attached may not display the AIP toolbar. <br><br>If this occurs and you need to use the AIP toolbar options, start your email from within Outlook and then browse to and attach the file you want to send.|

### Known issues for co-authoring

Known issues for co-authoring are relevant only when co-authoring is [enabled in your tenant](/microsoft-365/compliance/sensitivity-labels-coauthoring).

Known issues for co-authoring in AIP include:

- [Supported versions for co-authoring and sensitivity labels](#supported-versions-for-co-authoring-and-sensitivity-labels)
- [Policy updates](#policy-updates)
- [User interface changes when applying labels](#user-interface-changes-when-applying-labels)
- [Unsupported features for co-authoring](#unsupported-features-for-co-authoring)

> [!IMPORTANT]
> Co-authoring and sensitivity labels can't be deployed to some users only, as any new labels won't be visible to users with an older version of the Office client.
>
> For more information about co-authoring support, see the [Microsoft 365 documentation](/microsoft-365/compliance/sensitivity-labels-coauthoring), especially [documented limitations](/microsoft-365/compliance/sensitivity-labels-coauthoring).
>

#### Supported versions for co-authoring and sensitivity labels

All apps, services, and operation tools in your tenant must support co-authoring.

Before you start, make sure that your system complies with the version requirements listed in the [Microsoft 365 prerequisites for co-authoring](/microsoft-365/compliance/sensitivity-labels-coauthoring#prerequisites). 

We recommend that you always use the latest Office version available. Earlier versions may cause unexpected results, such as not being able to see labels in Azure Information Protection, or no policy enforcement.





> [!NOTE]
> While sensitivity labels can be applied on files in Office 97-2003 formats, such as  **.doc**, **.ppt**, and **.xls**, co-authoring for these file types isn't supported. Once a label is applied on a newly-created file, or a file in the advanced file format, such as **.docx**, **.pptx**, and **.xlsx**, saving the file in an Office 97-2003 format will cause the label to be removed.
>

#### Policy updates

If your labeling policy was updated while an Office application was opened with Azure Information Protection, any new labels are displayed, but applying them will result in an error.

If this occurs, close and reopen your Office application to be able to apply your labels.

#### User interface changes when applying labels

When co-authoring is enabled in your tenant, the user experience for labels that are configured for user-defined permissions changes to the experience for built-in labels.

Instead of seeing the Microsoft Azure Information Protection dialog box where users can select [permission levels](configure-usage-rights.md#rights-included-in-permissions-levels) such as **Viewer**, **Reviewer**, and **Only for me**, they see the same dialog box as if they had they selected the **File** tab > **Info** > **Protect Document** > **Restrict Access** > **Restricted Access**.  From this dialog box, they can specify their choice of permissions and users.  

For more information, see the [Word, PowerPoint, andCould you use contractions to make it less formal?
 Excel permissions](/microsoft-365/compliance/encryption-sensitivity-labels#word-powerpoint-and-excel-permissions) section from the Microsoft Purview documentation.

> [!NOTE]
> Unlike the Microsoft Azure Information Protection dialog box, the **Restricted Access** dialog box doesn't support specifying a domain name to automatically include all users in the organization.
>

#### Unsupported features for co-authoring

The following features aren't supported or are partially supported when [co-authoring is enabled](/microsoft-365/compliance/sensitivity-labels-coauthoring) for files encrypted with sensitivity labels:

- **DKE templates and DKE user-defined properties**. For more information, see [Double Key Encryption (DKE)](plan-implement-tenant-key.md#double-key-encryption-dke).

- **Labels with user-defined permissions**. In Microsoft Word, Excel, and PowerPoint, labels with user-defined permissions are still available and can be applied to documents, but aren't supported for co-authoring features.

    This means that applying a label with user-defined permissions will prevent you from working on the document with others at the same time.

- **Removing external content marking in apps**. External content marking is removed only when a label is applied, and not when the document is saved. For more information, see [The client side of Azure Information Protection](rms-client/use-client.md).

- Features listed in the [Microsoft 365 documentation](/microsoft-365/compliance/sensitivity-labels-coauthoring#limitations) as co-authoring limitations.

## Sharing external doc types across tenants

When users share external doc types, such as PDFs, across tenants, recipients receive a consent prompt that requires them to accept the sharing of the listed permissions. For example:

:::image type="content" source="media/cross-tenant-consent.png" alt-text="Cross-tenant consent prompt.":::

Depending on your application, you may see this prompt repeatedly for the same document. When the prompt appears, select **Accept** to continue to the shared document.

## Known issues in policies

Publishing policies may take up to 24 hours.
## Known issues for the AIP viewer

- [Landscape views](#landscape-views-in-the-aip-viewer)
- [External users](#external-users-and-the-aip-viewer)
- [ADRMS protected files on Android devices](#adrms-protected-files-on-android-devices)

For more information, see [**Unified labeling client**: View protected files with the Azure Information Protection viewer](rms-client/clientv2-view-use-files.md).
### Landscape views in the AIP viewer

The AIP viewer displays images in portrait mode, and some wide, landscape-view images may appear to be stretched.

For example, an original image is shown below on the left, with a stretched, portrait version in the AIP viewer on the right. 

:::image type="content" source="media/client-viewer-stretched-images.PNG" alt-text="Stretched image in client viewer":::

### External users and the AIP viewer 

If an external user already has a guest account in Azure AD, the AIP Viewer may display an error when the user opens a protected document, telling them that they can't sign in with a personal account.

If such an error appears, the user must install [Adobe Acrobat DC with the MIP extension](https://helpx.adobe.com/il_en/acrobat/kb/mip-plugin-download.html) in order to open the protected document.

When a user opens the protected document after installing Adobe Acrobat DC with the MIP extension, that user might still see an error showing that the selected user account doesn't exist in the tenant, and prompting them to select an account. 

This is an expected error. In the prompt window, select **Back** to continue opening the protected document.

>[!NOTE]
> The AIP Viewer supports guest *organizational* accounts in Azure AD, but not personal or Windows Live accounts.
>

### ADRMS protected files on Android devices

On Android devices, ADRMS-protected files can't be opened by the AIP Viewer app.

## Known issues for track and revoke features

Tracking and revoking document access using the unified labeling client has the following known issues:

- [Password-protected documents](#password-protected-documents)
- [Multiple attachments in a protected email](#multiple-attachments-in-a-protected-email)
- [Documents accessed via SharePoint or OneDrive](#documents-accessed-via-sharepoint-or-onedrive)

For more information, see the [Admin Guide](rms-client/track-and-revoke-admin.md) and [User Guide](rms-client/revoke-access-user.md) procedures.

#### Password-protected documents

Password-protected documents aren't supported by track and revoke features.
#### Multiple attachments in a protected email

If you attach multiple documents to an email, and then protect the email and send it, each of the attachments gets the same ContentID value.

This ContentID value will be returned only with the first file that had been opened. Searching for the other attachments won't return the ContentID value required to get tracking data.

Additionally, revoking access for one of the attachments also revokes access for the other attachments in the same protected email.

#### Documents accessed via SharePoint or OneDrive

- Protected documents that are uploaded to SharePoint or OneDrive lose their **ContentID** value, and access can't be tracked or revoked.

- If a user downloads the file from SharePoint or OneDrive and accesses it from their local machine, a new **ContentID** is applied to the document when they open it locally.

    Using the original **ContentID** value to track data won't include any access performed for the user's downloaded file. Additionally, revoking access based on the original **ContentID** value won't revoke access for any of the downloaded files.

    If administrators have access to the downloaded files, they can use PowerShell to identify a document's **ContentID** for track and revoke actions.

### Known issues for the AIP client and OneDrive

If you have documents stored in OneDrive with a sensitivity label applied, and an administrator changes the label in the labeling policy to add protection, the newly applied protection isn't automatically applied to the labeled document. 

In such cases, relabel the document manually to apply the protection as needed.





## AIP-based Conditional Access policies

External users who receive content protected by [Conditional Access policies](/azure/active-directory/conditional-access/concept-conditional-access-policy-common) must have an Azure Active Directory (Azure AD) business-to-business (B2B) collaboration guest user account in order to view the content.

While you can invite external users to activate a guest user account, allowing them to authenticate and pass the conditional access requirements, it may be difficult to ensure that this occurs for all external users required.

We recommend enabling AIP-based conditional access policies for your internal users only.

**Enable conditional access policies for AIP for internal users only**:

1.	In the Azure portal, navigate to the **Conditional Access** blade, and select the conditional access policy you wish to modify.
2.	Under **Assignments**, select **Users and groups**, and then select **All users**. Make sure that the **All guest and external users** option is *not* selected.
3.	Save your changes.

You can also entirely disable/exclude CA within Azure Information Protection if the functionality isn't required for your organization, in order to avoid this potential issue.

For more information, see the [Conditional Access documentation](/azure/active-directory/conditional-access/concept-conditional-access-users-groups).

## Cannot publish or use labels with sub-labels as standalone labels

If a label contains any sub-labels in the [Microsoft Purview compliance portal](/microsoft-365/compliance/sensitivity-labels#sensitivity-labels-and-azure-information-protection), this label must not be published as a standalone label to any AIP users. 

Similarly, AIP doesn’t support labels that contain sub-labels as default labels, and you can't configure automatic labeling for these labels.

Additionally, using a label with UDP (User Defined Permissions) as a default label isn't supported in the Unified Labeling Client. 

## More information

The following additional articles may be helpful in answering questions you have about Azure Information Protection:

- [File types supported by the Azure Information Protection unified labeling client](rms-client/clientv2-admin-guide-file-types.md)
- [Frequently asked questions for Azure Information Protection](faqs.md)
- [Frequently asked questions about data protection in Azure Information Protection](faqs-rms.md)
- [Frequently asked questions about classification and labeling in Azure Information Protection](faqs-infoprotect.md)
- [FAQs for Microsoft Azure Information Protection app for iOS and Android](rms-client/mobile-app-faq.md)


