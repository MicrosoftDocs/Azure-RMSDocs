---
# required metadata

title: File types supported - Azure Information Protection unified labeling client
description: Technical details about supported file types, file name extensions, and levels of protection for admins who are are responsible for the Azure Information Protection unified labeling client for Windows.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 08/21/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: v2client
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---


# Admin Guide: File types supported by the Azure Information Protection unified labeling client

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*>
>
> *Instructions for: [Azure Information Protection unified labeling client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-client-and-the-azure-information-protection-unified-labeling-client)*

The Azure Information Protection unified labeling client can apply the following to documents and emails:

- Classification only

- Classification and protection

- Protection only

The Azure Information Protection unified labeling client can also inspect the content of some file types using well-known sensitive information types or regular expressions that you define.

Use the following information to check which file types the Azure Information Protection unified labeling client supports, understand the different levels of protection and how to change the default protection level, and to identify which files are automatically excluded (skipped) from classification and protection.

For the listed file types, WebDav locations are not supported.

## File types supported for classification only

The following file types can be classified even when they are not protected.

- **Adobe Portable Document Format**: .pdf

- **Microsoft Project**: .mpp, .mpt

- **Microsoft Publisher**: .pub

- **Microsoft XPS**: .xps .oxps

- **Images**: .jpg, .jpe, .jpeg, .jif, .jfif, .jfi. png, .tif, .tiff

- **Autodesk Design Review 2013**: .dwfx

- **Adobe Photoshop**: .psd

- **Digital Negative**: .dng

- **Microsoft Office**: File types in the following table.

    The supported file formats for these file types are the 97-2003 file formats and Office Open XML formats for the following Office programs: Word, Excel, and PowerPoint.

    |Office file type|Office file type|
    |----------------------------------|----------------------------------|
    |.doc<br /><br />.docm<br /><br />.docx<br /><br />.dot<br /><br />.dotm<br /><br />.dotx<br /><br />.potm<br /><br />.potx<br /><br />.pps<br /><br />.ppsm<br /><br />.ppsx<br /><br />.ppt<br /><br />.pptm<br /><br />.pptx<br /><br />.vdw<br /><br />.vsd|.vsdm<br /><br /> .vsdx<br /><br />.vss<br /><br />.vssm<br /><br />.vst<br /><br />.vstm<br /><br />.vssx<br /><br />.vstx<br /><br />.xls<br /><br />.xlsb<br /><br />.xlt<br /><br />.xlsm<br /><br />.xlsx<br /><br />.xltm<br /><br />.xltx|

Additional file types support classification when they are also protected. For these file types, see the [Supported file types for classification and protection](#supported-file-types-for-classification-and-protection) section.

Examples:

- If the **General** sensitivity label applies classification and does not apply protection: You could apply the **General** label to a file named sales.pdf but you could not apply this label to a file named sales.txt. 

- If the **Confidential \ All Employees** sensitivity label applies classification and protection: You could apply this label to a file named sales.pdf and a file named sales.txt. You could also apply just protection to these files, without classification.

## File types supported for protection

The Azure Information Protection unified labeling client supports protection at two different levels, as described in the following table.

|Type of protection|Native|Generic|
|----------------------|----------|-----------|
|Description|For text, image, Microsoft Office (Word, Excel, PowerPoint) files, .pdf files, and other application file types that support a Rights Management service, native protection provides a strong level of protection that includes both encryption and enforcement of rights (permissions).|For all other applications and file types, generic protection provides a level of protection that includes both file encapsulation using the .pfile file type and authentication to verify if a user is authorized to open the file.|
|Protection|Files protection is enforced in the following ways:<br /><br />- Before protected content is rendered, successful authentication must occur for those who receive the file through email or are given access to it through file or share permissions.<br /><br />- Additionally, usage rights and policy that were set by the content owner when the files were protected are enforced when the content is rendered in either the Azure Information Protection viewer (for protected text and image files) or the associated application (for all other supported file types).|File protection is enforced in the following ways:<br /><br />- Before protected content is rendered, successful authentication must occur for people who are authorized to open the file and given access to it. If authorization fails, the file does not open.<br /><br />- Usage rights and policy set by the content owner are displayed to inform authorized users of the intended usage policy.<br /><br />- Audit logging of authorized users opening and accessing files occurs. However, usage rights are not enforced.|
|Default for file types|This is the default level of protection for the following file types:<br /><br />- Text and image files<br /><br />- Microsoft Office (Word, Excel, PowerPoint) files<br /><br />- Portable document format (.pdf)<br /><br />For more information, see the following section, [Supported file types for classification and protection](#supported-file-types-for-classification-and-protection).|This is the default protection for all other file types (such as .vsdx, .rtf, and so on) that are not supported by native protection.|

Currently, you cannot change the default protection level that the Azure Information Protection unified labeling client applies.

The protection can be applied automatically when a user selects a sensitivity label that an administrator has configured, or users can specify their own custom protection settings by using [permission levels](../configure-usage-rights.md#rights-included-in-permissions-levels). 

### File sizes supported for protection

There are maximum file sizes that the Azure Information Protection unified labeling client supports for protection.

- **For Office files:**


  |                                                     Office application                                                      |                                                Maximum file size supported                                                 |
  |-----------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------|
  |             Word 2010<br /><br />Word 2013<br /><br />Word 2016             |                                          32-bit: 512 MB<br /><br />64-bit: 512 MB                                          |
  |           Excel 2010<br /><br />Excel 2013<br /><br />Excel 2016           |                      32-bit: 2 GB<br /><br />64-bit: Limited only by available disk space and memory                       |
  | PowerPoint 2010<br /><br />PowerPoint 2013<br /><br />PowerPoint 2016 | 32-bit: Limited only by available disk space and memory<br /><br />64-bit: Limited only by available disk space and memory |


- **For all other files**: 

  - To protect other file types, and to open these file types in the Azure Information Protection viewer: The maximum file size is limited only by available disk space and memory.

  - To unprotect files by using the [Unprotect-RMSFile](/powershell/module/azureinformationprotection/unprotect-rmsfile) cmdlet: The maximum file size supported for .pst files is 5 GB. Other file types are limited only by available disk space and memory

    Tip: If you need to search or recover protected items in large .pst files, see [Guidance for using Unprotect-RMSFile for eDiscovery](../configure-super-users.md#guidance-for-using-unprotect-rmsfile-for-ediscovery).

### Supported file types for classification and protection

The following table lists a subset of file types that support native protection by the Azure Information Protection unified labeling client, and that can also be classified. 

These file types are identified separately because when they are natively protected, the original file name extension is changed, and these files become read-only. Note that when files are generically protected, the original file name extension is always changed to .pfile.

> [!WARNING]
> If you have firewalls, web proxies, or security software that inspect and take action according to file name extensions, you might need to reconfigure these network devices and software to support these new file name extensions.

|Original file name extension|Protected file name extension|
|--------------------------------|-------------------------------------|
|.txt|.ptxt|
|.xml|.pxml|
|.jpg|.pjpg|
|.jpeg|.pjpeg|
|.png|.ppng|
|.tif|.ptif|
|.tiff|.ptiff|
|.bmp|.pbmp|
|.gif|.pgif|
|.jpe|.pjpe|
|.jfif|.pjfif|
|.jt|.pjt|

The next table lists the remaining file types that support native protection by the Azure Information Protection unified labeling client, and that can also be classified. You will recognize these as file types for Microsoft Office apps. The supported file formats for these file types are the 97-2003 file formats and Office Open XML formats for the following Office programs: Word, Excel, and PowerPoint.

For these files, the file name extension remains the same after the file is protected by a Rights Management service.

|File types supported by Office|File types supported by Office|
|----------------------------------|----------------------------------|
|.doc<br /><br />.docm<br /><br />.docx<br /><br />.dot<br /><br />.dotm<br /><br />.dotx<br /><br />.potm<br /><br />.potx<br /><br />.pps<br /><br />.ppsm<br /><br />.ppsx<br /><br />.ppt<br /><br />.pptm<br /><br />.pptx<br /><br />.vsdm|.vsdx<br /><br />.vssm<br /><br />.vssx<br /><br />.vstm<br /><br />.vstx<br /><br />.xla<br /><br />.xlam<br /><br />.xls<br /><br />.xlsb<br /><br />.xlt<br /><br />.xlsm<br /><br />.xlsx<br /><br />.xltm<br /><br />.xltx<br /><br />.xps|


## File types that are excluded from classification and protection

To help prevent users from changing files that are critical for computer operations, some file types and folders are automatically excluded from classification and protection. If users try to classify or protect these files by using the Azure Information Protection unified labeling client, they see a message that they are excluded.

- **Excluded file types**: .lnk, .exe, .com, .cmd, .bat, .dll, .ini, .pst, .sca, .drm, .sys, .cpl, .inf, .drv, .dat, .tmp, .msg,.msp, .msi, .pdb, .jar


- **Excluded folders**: 
    - Windows
    - Program Files (\Program Files and \Program Files (x86))
    - \ProgramData 
    - \AppData (for all users)

### Files that cannot be protected by default

Any file that is password-protected cannot be natively protected by the Azure Information Protection unified labeling client unless the file is currently open in the application that applies the protection. You most often see PDF files that are password-protected but other applications, such as Office apps, also offer this functionality.

### Limitations for container files, such as .zip files

Container files are files that include other files, with a typical example being .zip files that contain compressed files. Other examples include .rar, .7z, .msg files, and PDF documents that include attachments.

You can classify and protect these container files, but the classification and protection is not applied to each file inside the container.

If you have a container file that includes classified and protected files, you must first extract the files to change their classification or protection settings.

The Azure Information Protection viewer cannot open attachments in a protected PDF document. In this scenario, when the document is opened in the viewer, the attachments are not visible.

## File types supported for inspection

Without any additional configuration, the Azure Information Protection unified labeling client uses Windows IFilter to inspect the contents of documents. Windows IFilter is used by Windows Search for indexing. As a result, the following file types can be inspected when you use the [Set-AIPFileClassification](/powershell/module/azureinformationprotection/set-aipfileclassification) PowerShell command.

|Application type|File type|
|--------------------------------|-------------------------------------|
|Word|.doc; docx; .docm; .dot; .dotm; .dotx|
|Excel|.xls; .xlt; .xlsx; .xltx; .xltm; .xlsm; .xlsb|
|PowerPoint|.ppt; .pps; .pot; .pptx; .ppsx; .pptm; .ppsm; .potx; .potm|
|PDF |.pdf|
|Text|.txt; .xml; .csv|

With additional configuration, other file types can also be inspected. For example, you can [register a custom file name extension to use the existing Windows filter handler for text files](https://docs.microsoft.com/windows/desktop/search/-search-ifilter-registering-filters), and you can install additional filters from software vendors.

To check what filters are installed, see the [Finding a Filter Handler for a Given File Extension](https://docs.microsoft.com/windows/desktop/search/-search-ifilter-registering-filters#finding-a-filter-handler-for-a-given-file-extension) section from the Windows Search Developer's Guide.

The following sections have configuration instructions to inspect .zip files, and .tiff files.

### To inspect .zip files

The [Set-AIPFileClassification](/powershell/module/azureinformationprotection/set-aipfileclassification) PowerShell command can inspect .zip files when you install the [Office 2010 Filter Pack SP2](https://support.microsoft.com/en-us/help/2687447/description-of-office-2010-filter-pack-sp2) the computer running the PowerShell session.

Example scenario after doing these steps: 

A file named **accounts.zip** contains Excel spreadsheets with credit card numbers. You have a sensitivity label named **Confidential \ Finance**, which is configured to discover credit card numbers and automatically apply the label with protection that restricts access to the Finance group. 

After inspecting the file, the unified labeling client from your PowerShell session classifies this file as **Confidential \ Finance**, applies generic protection to the file so that only members of the Finance groups can unzip it, and renames the file **accounts.zip.pfile**.

### To inspect .tiff files by using OCR

The [Set-AIPFileClassiciation](/powershell/module/azureinformationprotection/set-aipfileclassification) PowerShell command can use optical character recognition (OCR) to inspect TIFF images with a .tiff file name extension when you install the Windows TIFF IFilter feature, and then configure [Windows TIFF IFilter Settings](https://docs.microsoft.com/previous-versions/windows/it-pro/windows-7/dd744701%28v%3dws.10%29) on the computer running the PowerShell session.

## Next steps
Now that you've identified the file types supported by the Azure Information Protection unified labeling client, see the following resources for additional information that you might need to support this client:

- [Customizations](clientv2-admin-guide-customizations.md)

- [Client files and usage logging](clientv2-admin-guide-files-and-logging.md)

- [PowerShell commands](clientv2-admin-guide-powershell.md)

