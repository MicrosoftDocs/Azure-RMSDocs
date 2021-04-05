---
# required metadata

title: Known issues - Azure Information Protection
description: Search and browse through known issues and limitations for Azure Information Protection.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 04/05/2021
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

>***Applies to**: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*
>
>***Relevant for**: [AIP unified labeling client and classic client](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

[!INCLUDE [AIP classic client is deprecated](includes/classic-client-deprecation.md)]

Use the lists and tables below to find details about known issues and limitations related to Azure Information Protection features.

## Third-party digital signing apps

Azure Information Protection cannot protect or decrypt files that are digitally signed.

## Client support for container files, such as .zip files

Container files are files that include other files, with a typical example being .zip files that contain compressed files. Other examples include .rar, .7z, .msg files, and PDF documents that include attachments.

You can classify and protect these container files, but the classification and protection is not applied to each file inside the container.

If you have a container file that includes classified and protected files, you must first extract the files to change their classification or protection settings. However, you can remove the protection for all files in supported container files by using the [Unprotect-RMSFile](/powershell/module/azureinformationprotection/unprotect-rmsfile) cmdlet.

The Azure Information Protection viewer cannot open attachments in a protected PDF document. In this scenario, when the document is opened in the viewer, the attachments are not visible.

For more information, see [Admin Guide: File types supported by the Azure Information Protection client](rms-client/client-admin-guide-file-types.md).

## Known issues for AIP and Exploit Protection

The Azure Information Protection client is not supported on machines that have .NET 2 or 3, where [Exploit protection](/windows/security/threat-protection/microsoft-defender-atp/enable-exploit-protection) is enabled, and will cause Office apps to behave unexpectedly.

In such cases, we recommend that you upgrade your .NET version. For more information, see [Microsoft .NET Framework requirements](rms-client/reqs-ul-client.md#microsoft-net-framework-requirements).

If you must keep your .NET version 2 or 3, make sure to disable Exploit protection before installing AIP. 

To disable Exploit protection via PowerShell, run the following:

```PowerShell
Set-ProcessMitigation -Name "OUTLOOK.EXE" -Disable EnableExportAddressFilterPlus, EnableExportAddressFilter, EnableImportAddressFilter
```

## PowerShell support for the Azure Information Protection client

The current release of the **AzureInformationProtection** PowerShell module that's installed with the Azure Information Protection client has the following known issues:

- **Outlook personal folders (*.pst* files)**. Natively protecting *.pst* files is not supported using the **AzureInformationProtection** module.

- **Outlook protected email messages *(.rpmsg* files)**. Unprotecting Outlook protected email messages is supported by the **AzureInformationProtection** module only if they are inside an Outlook personal folder *(.pst* file).

    Unprotecting email messages outside of a *.pst* file is not supported.

For more information, see [Admin Guide: Using PowerShell with the Azure Information Protection client](rms-client/client-admin-guide-powershell.md).

## AIP known issues in Office applications

|Feature  |Known issues  |
|---------|---------|
|**Multiple versions of Office<br> <br> Multiple Office accounts**    | The Azure Information Protection clients, including both classic and unified labeling, do not support:  <br><br>-	Multiple versions of Office on the same computer <br>-	Multiple Office accounts, or switching user accounts in Office <br>-	Shared mailboxes     |
|**Multiple displays** |If you're using multiple displays and have an Office application open: <br><br>- You may experience performance issues in your Office apps.<br>- The Azure Information Protection bar may appear to float in the middle of the Office screen, on one or both displays <br><br>To ensure consistent performance, and that the bar remains in the correct location, open the **Options** dialog for your Office application, and under **General**, select **Optimize for compatibility** instead of **Optimize for best appearance**.    |
|**IRM support in Office 2016**| The [DRMEncryptProperty](/deployoffice/security/protect-sensitive-messages-and-documents-by-using-irm-in-office#office-2016-irm-registry-key-options) registry setting, which controls metadata encryption in Office 2016, is not supported for Azure Information Protection labels.|
|**Outlook object model access** | - The [PromptOOMAddressBookAccess](/outlook/troubleshoot/security/information-about-email-security-settings#configure-a-prompt-when-a-program-accesses-an-address-book-by-using-the-outlook-object-model) registry setting, which controls the prompts that display when address books are accessed via the Outlook object model, is not supported with Azure Information Protection labels. <br><br>- The [PromptOOMAddressInformationAccess](/outlook/troubleshoot/security/information-about-email-security-settings#configure-a-prompt-when-a-program-reads-address-information-by-using-the-outlook-object-model) registry setting, which controls the prompts that display when a program reads address information, is not supported for Azure Information Protection labels.|
|**Content markings in Word**    | AIP [content markings](configure-policy-markings.md) in Microsoft Word headers or footers may be offset or placed incorrectly, or may be hidden entirely, when that same header or footer also contains a table.<br><br>For more information, see [When visual markings are applied](configure-policy-markings.md#when-visual-markings-are-applied). |
|**Files attached to emails** |Due to a limitation in recent Windows updates, when [Microsoft Outlook is protected by Azure Rights Management](office-apps-services-support.md), files attached to emails may be locked after opening the file. |
|**Mail merge**    |  The Office [mail merge](https://support.office.com/article/use-mail-merge-for-bulk-email-letters-labels-and-envelopes-f488ed5b-b849-4c11-9cff-932c49474705) feature is not supported with any Azure Information Protection feature.       |
| **S/MIME emails** | Opening S/MIME emails in Outlook's Reading Pane may cause performance issues. <br><br>To prevent performance issues with S/MIME emails, enable the [**OutlookSkipSmimeOnReadingPaneEnabled**](rms-client/clientv2-admin-guide-customizations.md#prevent-outlook-performance-issues-with-smime-emails) advanced property. <br><br>**Note**: Enabling this property prevents the AIP bar or the email classification from being displayed in Outlook's Reading Pane. |
|**Send to File Explorer option** |If you choose to right-click on any file in the File Explorer and select **Send to > Mail recipient**, the Outlook message that opens with the file attached may not display the AIP toolbar. <br><br>If this occurs and you need to use the AIP toolbar options, start your email from within Outlook and then browse to and attach the file you want to send.|
|**Co-authoring** |Co-authoring support is provided by a [dedicated installation](rms-client/unifiedlabelingclient-version-release-history.md#version-210460-for-co-authoring-public-preview) of the Azure Information Protection client, and is currently in public preview. <br><br>For more information, see [Known issues for co-authoring (Public preview)](#known-issues-for-co-authoring-public-preview). |
| | |

### Known issues for co-authoring (Public preview)

- [Use in testing environments only](#use-in-testing-environments-only)
- [Supported versions for co-authoring and sensitivity labels](#supported-versions-for-co-authoring-and-sensitivity-labels)
- [Policy updates](#policy-updates)
- [AIP analytics and audit logs](#aip-analytics-and-audit-logs)
- [Labels with user-defined permissions](#labels-with-user-defined-permissions)
- [Unsupported features for co-authoring](#unsupported-features-for-co-authoring)

> [!IMPORTANT]
> Co-authoring and sensitivity labels cannot be deployed to some users only, as any new labels will not be visible to users with an older version of the Office client.
> 
For more information about co-authoring support, including limitations and known issues for the public preview, see the [Microsoft 365 documentation](/microsoft-365/compliance/sensitivity-labels-coauthoring).

#### Use in testing environments only

To avoid conflicts between your labeled files, co-authoring cannot be turned off without assistance from customer support during the public preview period.

For this reason, we recommend that you currently turn co-authoring on for your system in testing environments only.

#### Supported versions for co-authoring and sensitivity labels

All apps, services, and operation tools in your tenant must support co-authoring.

Before you start, make sure that your system complies with the version requirements listed in the [Microsoft 365 prerequisites for co-authoring](/microsoft-365/compliance/sensitivity-labels-coauthoring#prerequisites).

> [!NOTE]
> While sensitivity labels can be applied on files in Office 97-2003 formats, such as  **.doc**, **.ppt**, and **.xls**, co-authoring for these file types is not supported. Once a label is applied on a newly-created file, or a file in the advanced file format, such as **.docx**, **.pptx**, and **.xlsx**, saving the file in an Office 97-2003 format will cause the label to be removed.
> 

#### Policy updates

If your labeling policy was updated while an Office application was opened with Azure Information Protection, any new labels are displayed, but applying them will result in an error. 

If this occurs, close and reopen your Office application to be able to apply your labels.

#### AIP analytics and audit logs

When co-authoring is enabled, the Azure Information Protection client doesn't send any [audit logs](audit-logs.md).

#### Labels with user-defined permissions

In Microsoft Word, Excel, and PowerPoint, labels with user-defined permissions are still available and can be applied to documents, but are not supported for co-authoring features. 

This means that applying a label with user-defined permissions will prevent you from working on the document with others at the same time.

#### Unsupported features for co-authoring

The following features are not supported when working with co-authoring and sensitivity labels:

- **DKE templates and DKE user-defined properties**. For more information, see [Double Key Encryption (DKE)](plan-implement-tenant-key.md#double-key-encryption-dke).

- **Removing external content marking in apps**. For more information, see [The client side of Azure Information Protection](rms-client/use-client.md).

- The following advanced settings:

    - **customPropertiesByLabel**. For more information, see [Applying a custom property when a label is applied](rms-client/clientv2-admin-guide-customizations.md#apply-a-custom-property-when-a-label-is-applied).

    - **labelByCustomProperties** and **EnableLabelBySharePointProperties**. For more information, see [Migrate labels from Secure Islands and other labeling solutions](rms-client/clientv2-admin-guide-customizations.md#migrate-labels-from-secure-islands-and-other-labeling-solutions).

## Known issues in policies

Publishing policies may take up to 24 hours.

## Maximum file sizes

Files of over 2 GB are supported for protection, but not decryption.

## Known issues for the AIP viewer

- [Landscape views](#landscape-views-in-the-aip-viewer)
- [External users](#external-users-and-the-aip-viewer)

For more information, see [**Unified labeling client**: View protected files with the Azure Information Protection viewer](rms-client/clientv2-view-use-files.md).
### Landscape views in the AIP viewer

The AIP viewer displays images in portrait mode, and some wide, landscape-view images may appear to be stretched.

For example, an original image is shown below on the left, with a stretched, portrait version in the AIP viewer on the right. 

:::image type="content" source="media/client-viewer-stretched-images.PNG" alt-text="Stretched image in client viewer":::

### External users and the AIP viewer 

If an external user already has a guest account in Azure AD, the AIP Viewer may display an error when the user opens a protected document, telling them that they cannot sign in with a personal account.

If such an error appears, the user must install [Adobe Acrobat DC with the MIP extension](https://helpx.adobe.com/il_en/acrobat/kb/mip-plugin-download.html) in order to open the protected document.

When opening the protected document after installing Adobe Acrobat DC with the MIP extension, the user may still see an error showing that the selected user account does not exist in the tenant, and prompting them to select an account. 

This is an expected error. In the prompt window, select **Back** to continue opening the protected document.

## Known issues for track and revoke features (Public preview)

Tracking and revoking document access using the unified labeling client has the following known issues:

- [Password-protected documents](#password-protected-documents)
- [Multiple attachments in a protected email](#multiple-attachments-in-a-protected-email)
- [Documents accessed via SharePoint or OneDrive](#documents-accessed-via-sharepoint-or-onedrive)

For more information, see the [Admin Guide](rms-client/track-and-revoke-admin.md) and [User Guide](rms-client/revoke-access-user.md) procedures.

> [!NOTE]
> Track and revoke features are supported for Office file types only, and not for other file types, such as image files or PDFs.
#### Password-protected documents

Password-protected documents are not supported by track and revoke features.
#### Multiple attachments in a protected email

If you attach multiple documents to an email, and then protect the email and send it, each of the attachments get the same ContentID value.

This ContentID value will be returned only with the first file that had been opened. Searching for the other attachments will not return the ContentID value required to get tracking data.

Additionally, revoking access for one of the attachments also revokes access for the other attachments in the same protected email.

#### Documents accessed via SharePoint or OneDrive

- Protected documents that are uploaded to SharePoint or OneDrive lose their **ContentID** value, and access cannot be tracked or revoked.

- If a user downloads the file from SharePoint or OneDrive and accesses it from their local machine, a new **ContentID** is applied to the document when they open it locally.

    Using the original **ContentID** value to track data will not include any access performed for the user's downloaded file. Additionally, revoking access based on the original **ContentID** value will not revoke access for any of the downloaded files.

    In such cases, administrators may be able to locate the downloaded files using PowerShell to find the new **ContentID** values to track or revoke access.

### Known issues for the AIP client and OneDrive

If you have documents stored in OneDrive with a sensitivity label applied, and an administrator changes the label in the labeling policy to add protection, the newly applied protection is not automatically applied to the labeled document. 

In such cases, re-label the document manually to apply the protection as needed.
## AIP and legacy Windows and Office versions

- [**Windows 7 extended supported ended on January 14, 2020**](https://support.microsoft.com/help/13853/windows-lifecycle-fact-sheet).

    We strongly encourage you to upgrade to a newer version of Windows 10.

    However, if you have Extended Security Updates (ESU) and a support contract, AIP support is available to continue keeping your Windows 7 systems secure.

    For more information, check with your support contact.

- [**Office 2010 extended support ended on October 13, 2020**](https://support.microsoft.com/lifecycle/search?alpha=office%202010).

    This support will not be extended, and ESU will not be offered for Office 2010.

    We strongly encourage you to upgrade to a newer version of Office 365.

    For more information, check with your support contact.

## AIP-based Conditional Access policies

External users who receive content protected by [Conditional Access policies](/azure/active-directory/conditional-access/concept-conditional-access-policy-common) must have an Azure Active Directory (Azure AD) business-to-business (B2B) collaboration guest user account in order to view the content.

While you can invite external users to activate a guest user account, allowing them to authenticate and pass the conditional access requirements, it may be difficult to ensure that this occurs for all external users required.

We recommend enabling AIP-based conditional access policies for your internal users only.

**Enable conditional access policies for AIP for internal users only**:

1.	In the Azure portal, navigate to the **Conditional Access** blade, and select the conditional access policy you wish to modify.
2.	Under **Assignments**, select **Users and groups**, and then select **All users**. Make sure that the **All guest and external users** option is *not* selected.
3.	Save your changes.

You can also entirely disable CA within Azure Information Protection if the functionality is not required for your organization, in order to avoid this potential issue.

For more information, see the [Conditional Access documentation](/azure/active-directory/conditional-access/concept-conditional-access-users-groups).

## More information

The following additional articles may be helpful in answering questions about known issues in Azure Information Protection:

- [Frequently asked questions for Azure Information Protection](faqs.md)
- [Frequently asked questions about data protection in Azure Information Protection](faqs-rms.md)
- [Frequently asked questions about classification and labeling in Azure Information Protection](faqs-infoprotect.md)
- [FAQs for Microsoft Azure Information Protection app for iOS and Android](rms-client/mobile-app-faq.md)