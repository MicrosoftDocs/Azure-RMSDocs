---
# required metadata

title: Known issues - Azure Information Protection
description: Search and browse through known issues and limitations for Azure Information Protection.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 08/10/2020
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

Use the lists and tables below to find details about known issues and limitations related to Azure Information Protection features.

> [!NOTE]
> This article refers to known issues in both the classic and unified labeling clients. Not sure of the difference between these clients? See [FAQs](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients).

<!--removed from this page
## HYOK known issues

HYOK has the following known issues:

- [Supported Microsoft Office versions](#supported-microsoft-office-versions)
- [Email recommendations for Office 365 and other online services](#email-recommendations-for-office-365-and-other-online-services)

### Supported Microsoft Office versions

HYOK for the Azure Information Protection classic client does not support versions of Office earlier than Office 2013.

### Email recommendations for Office 365 and other online services

We recommend that you do not use HYOK protection for emails in Office 365 and other online services.

Office 365 and other online services are not be able to decrypt HYOK-protected documents and emails. This limitation includes HYOK-protected documents and emails that have been protected with the Rights Management connector, and prevents these services from inspecting the content and taking action on them.

This loss of functionality for HYOK-protected email includes malware scanners, data loss prevention (DLP) solutions, mail routing rules, journaling, eDiscovery, archiving solutions, and Exchange ActiveSync.

Additionally, users may not understand why some devices cannot open their HYOK-protected emails, resulting in more calls to your help desk.
-->

## Client support for container files, such as .zip files

Container files are files that include other files, with a typical example being .zip files that contain compressed files. Other examples include .rar, .7z, .msg files, and PDF documents that include attachments.

You can classify and protect these container files, but the classification and protection is not applied to each file inside the container.

If you have a container file that includes classified and protected files, you must first extract the files to change their classification or protection settings. However, you can remove the protection for all files in supported container files by using the [Unprotect-RMSFile](/powershell/module/azureinformationprotection/unprotect-rmsfile) cmdlet.

The Azure Information Protection viewer cannot open attachments in a protected PDF document. In this scenario, when the document is opened in the viewer, the attachments are not visible.

For more information, see [Admin Guide: File types supported by the Azure Information Protection client](rms-client/client-admin-guide-file-types.md).

## PowerShell support for the Azure Information Protection client

The current release of the **AzureInformationProtection** PowerShell module that's installed with the Azure Information Protection client has the following known issues:

- **Outlook personal folders (*.pst* files)**. Natively protecting *.pst* files is not supported using the **AzureInformationProtection** module.

- **Outlook protected email messages *(.rpmsg* files)**. Unprotecting Outlook protected email messages is supported by the **AzureInformationProtection** module only if they are inside an Outlook personal folder *(.pst* file).

    Unprotecting email messages outside of a *.pst* file is not supported.

For more information, see [Admin Guide: Using PowerShell with the Azure Information Protection client](rms-client/client-admin-guide-powershell.md).

<!-- removed from this page
## Protection-only mode known issues

The following known issues apply for [Protection-only mode for the Azure Information Protection client](rms-client/client-protection-only-mode.md):

- In Office apps, the Azure Information Protection bar is not shown. When you click **Protect** > **Show Bar**, this menu option is unavailable.

- When you use the **Classify and protect - Azure Information Protection** dialog box with the File Explorer, labels for classification are not shown. Instead, you have an option select a Rights Management (RMS) template.
-->

## AIP known issues in Office applications

|Feature  |Known issues  |
|---------|---------|
|**Multiple versions of Office**    | The Azure Information Protection clients, including both classic and unified labeling, do not support multiple versions of Office on the same computer, or switching user accounts in Office.       |
|**Multiple displays** |If you're using multiple displays and have an Office application open: </br></br>- You may experience performance issues in your Office apps.</br>- The Azure Information Protection bar may appear to float in the middle of the Office screen, on one or both displays </br></br>To ensure consistent performance, and that the bar remains in the correct location, open the **Options** dialog for your Office application, and under **General,** select **Optimize for compatibility** instead of **Optimize for best appearance.**    |
|**IRM support in Office 2016**| The [DRMEncryptProperty](https://docs.microsoft.com/deployoffice/security/protect-sensitive-messages-and-documents-by-using-irm-in-office#office-2016-irm-registry-key-options) registry setting, which controls metadata encryption in Office 2016, is not supported for Azure Information Protection labels.|
|**Content markings in Word**    | Azure Information Protection content [markings](configure-policy-markings.md) may be hidden in Microsoft Word footers, when the footer also contains a table. For more information, see [When visual markings are applied](configure-policy-markings.md#when-visual-markings-are-applied). |
|**Files attached to emails** |Due to a limitation in recent Windows updates, when [Microsoft Outlook is protected by Azure Rights Management](office-apps-services-support.md), files attached to emails may be locked after opening the file. |
|**Mail merge**    |  The Office [mail merge](https://support.office.com/article/use-mail-merge-for-bulk-email-letters-labels-and-envelopes-f488ed5b-b849-4c11-9cff-932c49474705) feature is not supported with any Azure Information Protection feature.       |
| | |

<!-- removing b/c this is relevant for classic only. for UL, labels are configured in m365. so this is basically irrelevant for us.
## Known issues in labeling

Depending on your policy rule size limit, configuring more than 200 users or user groups for each label may cause unexpected errors. 
-->

## Known issues in policies

Publishing policies may take up to 24 hours.

## Known issues in the AIP client

- **Maximum file sizes. Files** of over 2 GB are supported for protection, but not decryption.

- **AIP viewer.** The AIP viewer displays images in portrait mode, and some wide, landscape-view images may appear to be stretched.

    For example, an original image is shown below on the left, with a stretched, portrait version in the AIP viewer on the right. 
    
    :::image type="content" source="media/client-viewer-stretched-images.PNG" alt-text="Stretched image in client viewer":::
    
    For more information, see:

    - [**Classic client**: View protected files with the Azure Information Protection viewer](rms-client/client-view-use-files.md)
    - [**Unified labeling client**: View protected files with the Azure Information Protection viewer](rms-client/clientv2-view-use-files.md)


## More information

The following additional articles may be helpful in answering questions about known issues in Azure Information Protection:

- [Frequently asked questions for Azure Information Protection](faqs.md)
- [Frequently asked questions about data protection in Azure Information Protection](faqs-rms.md)
- [Frequently asked questions about classification and labeling in Azure Information Protection](faqs-infoprotect.md)
- [FAQs for Microsoft Azure Information Protection app for iOS and Android](rms-client/mobile-app-faq.md)

