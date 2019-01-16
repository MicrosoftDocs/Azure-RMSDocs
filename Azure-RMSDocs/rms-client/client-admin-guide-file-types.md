---
# required metadata

title: File types supported by Azure Information Protection
description: Technical details about supported file types, file name extensions, and levels of protection for admins who are are responsible for the Azure Information Protection client for Windows.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 01/16/2019
ms.topic: conceptual
ms.service: information-protection
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


# Admin Guide: File types supported by the Azure Information Protection client

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*

The Azure Information Protection client can apply the following to documents and emails:

- Classification only

- Classification and protection

- Protection only

The Azure Information Protection client can also inspect the content of some file types using well-known sensitive information types or regular expressions that you define.

Use the following information to check which file types the Azure Information Protection client supports, understand the different levels of protection and how to change the default protection level, and to identify which files are automatically excluded (skipped) from classification and protection.

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

For example, in the current [default policy](../configure-policy-default.md), the **General** label applies classification and does not apply protection. You could apply the **General** label to a file named sales.pdf but you could not apply this label to a file named sales.txt. 

Also in the current default policy, the **Confidential \ All Employees** applies classification and protection. You could apply this label to a file named sales.pdf and a file named sales.txt. You could also apply just protection to these files, without classification.

## File types supported for protection

The Azure Information Protection client supports protection at two different levels, as described in the following table.

|Type of protection|Native|Generic|
|----------------------|----------|-----------|
|Description|For text, image, Microsoft Office (Word, Excel, PowerPoint) files, .pdf files, and other application file types that support a Rights Management service, native protection provides a strong level of protection that includes both encryption and enforcement of rights (permissions).|For all other applications and file types, generic protection provides a level of protection that includes both file encapsulation using the .pfile file type and authentication to verify if a user is authorized to open the file.|
|Protection|Files protection is enforced in the following ways:<br /><br />- Before protected content is rendered, successful authentication must occur for those who receive the file through email or are given access to it through file or share permissions.<br /><br />- Additionally, usage rights and policy that were set by the content owner when the files were protected are enforced when the content is rendered in either the Azure Information Protection viewer (for protected text and image files) or the associated application (for all other supported file types).|File protection is enforced in the following ways:<br /><br />- Before protected content is rendered, successful authentication must occur for people who are authorized to open the file and given access to it. If authorization fails, the file does not open.<br /><br />- Usage rights and policy set by the content owner are displayed to inform authorized users of the intended usage policy.<br /><br />- Audit logging of authorized users opening and accessing files occurs. However, usage rights are not enforced.|
|Default for file types|This is the default level of protection for the following file types:<br /><br />- Text and image files<br /><br />- Microsoft Office (Word, Excel, PowerPoint) files<br /><br />- Portable document format (.pdf)<br /><br />For more information, see the following section, [Supported file types for classification and protection](#supported-file-types-for-classification-and-protection).|This is the default protection for all other file types (such as .vsdx, .rtf, and so on) that are not supported by native protection.|

You can change the default protection level that the Azure Information Protection client applies. You can change the default level of native to generic, from generic to native, and even prevent the Azure Information Protection client from applying protection. For more information, see the [Changing the default protection level of files](#changing-the-default-protection-level-of-files) section in this article.

The data protection can be applied automatically when a user selects a label that an administrator has configured, or users can specify their own custom protection settings by using [permission levels](../configure-usage-rights.md#rights-included-in-permissions-levels). 

### File sizes supported for protection

There are maximum file sizes that the Azure Information Protection client supports for protection.

- **For Office files:**


  |                                                     Office application                                                      |                                                Maximum file size supported                                                 |
  |-----------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------|
  |             Word 2007 (supported by AD RMS only)<br /><br />Word 2010<br /><br />Word 2013<br /><br />Word 2016             |                                          32-bit: 512 MB<br /><br />64-bit: 512 MB                                          |
  |           Excel 2007 (supported by AD RMS only)<br /><br />Excel 2010<br /><br />Excel 2013<br /><br />Excel 2016           |                      32-bit: 2 GB<br /><br />64-bit: Limited only by available disk space and memory                       |
  | PowerPoint 2007 (supported by AD RMS only)<br /><br />PowerPoint 2010<br /><br />PowerPoint 2013<br /><br />PowerPoint 2016 | 32-bit: Limited only by available disk space and memory<br /><br />64-bit: Limited only by available disk space and memory |


- **For all other files**: 

  - To protect other file types, and to open these file types in the Azure Information Protection viewer: The maximum file size is limited only by available disk space and memory.

  - To unprotect files by using the [Unprotect-RMSFile](/powershell/module/azureinformationprotection/unprotect-rmsfile) cmdlet: The maximum file size supported for .pst files is 5 GB. Other file types are limited only by available disk space and memory

    Tip: If you need to search or recover protected items in large .pst files, see [Guidance for using Unprotect-RMSFile for eDiscovery](../configure-super-users.md#guidance-for-using-unprotect-rmsfile-for-ediscovery).

### Supported file types for classification and protection

The following table lists a subset of file types that support native protection by the Azure Information Protection client, and that can also be classified. 

These file types are identified separately because when they are natively protected, the original file name extension is changed, and these files become read-only. Note that when files are generically protected, the original file name extension is always changed to .pfile.

> [!WARNING]
> If you have firewalls, web proxies, or security software that inspect and take action according to file name extensions, you might need to reconfigure these network devices and software to support these new file name extensions.

|Original file name extension|Protected file name extension|
|--------------------------------|-------------------------------------|
|.txt|.ptxt|
|.xml|.pxml|
|.jpg|.pjpg|
|.jpeg|.pjpeg|
|.pdf|.ppdf [[1]](#footnote-1)|
|.png|.ppng|
|.tif|.ptif|
|.tiff|.ptiff|
|.bmp|.pbmp|
|.gif|.pgif|
|.jpe|.pjpe|
|.jfif|.pjfif|
|.jt|.pjt|

###### Footnote 1
With the latest version of the Azure Information Protection client, [by default](client-admin-guide-customizations.md#dont-protect-pdf-files-by-using-the-iso-standard-for-pdf-encryption), the file name extension of the protected PDF document remains as .pdf.

The next table lists the remaining file types that support native protection by the Azure Information Protection client, and that can also be classified. You will recognize these as file types for Microsoft Office apps. The supported file formats for these file types are the 97-2003 file formats and Office Open XML formats for the following Office programs: Word, Excel, and PowerPoint.

For these files, the file name extension remains the same after the file is protected by a Rights Management service.

|File types supported by Office|File types supported by Office|
|----------------------------------|----------------------------------|
|.doc<br /><br />.docm<br /><br />.docx<br /><br />.dot<br /><br />.dotm<br /><br />.dotx<br /><br />.potm<br /><br />.potx<br /><br />.pps<br /><br />.ppsm<br /><br />.ppsx<br /><br />.ppt<br /><br />.pptm<br /><br />.pptx<br /><br />.vsdm|.vsdx<br /><br />.vssm<br /><br />.vssx<br /><br />.vstm<br /><br />.vstx<br /><br />.xla<br /><br />.xlam<br /><br />.xls<br /><br />.xlsb<br /><br />.xlt<br /><br />.xlsm<br /><br />.xlsx<br /><br />.xltm<br /><br />.xltx<br /><br />.xps|

### Changing the default protection level of files
You can change how the Azure Information Protection client protects files by editing the registry. For example, you can force files that support native protection to be generically protected by the Azure Information Protection client.

Reasons for why you might want to do this:

- To ensure that all users can open the file if they don’t have an application that supports native protection.

- To accommodate security systems that take action on files by their file name extension and can be reconfigured to accommodate the .pfile file name extension but cannot be reconfigured to accommodate multiple file name extensions for native protection.

Similarly, you can force the Azure Information Protection client to apply native protection to files that by default, would have generic protection applied. This action might be appropriate if you have an application that supports the RMS APIs. For example, a line-of-business application written by your internal developers or an application purchased from an independent software vendor (ISV).

You can also force the Azure Information Protection client to block the protection of files (not apply native protection or generic protection). For example, this action might be required if you have an automated application or service that must be able to open a specific file to process its contents. When you block protection for a file type, users cannot use the Azure Information Protection client to protect a file that has that file type. When they try, they see a message that the administrator has prevented protection and they must cancel their action to protect the file.

To configure the Azure Information Protection client to apply generic protection to all files that by default, would have native protection applied, make the following registry edits. Note if the FileProtection key does not exist, you must manually create it.

1. Create a new key named * for the following registry path, which denotes files with any file name extension:

    - For 32-bit version of Windows: **HKEY_LOCAL_MACHINE\Software\Microsoft\MSIPC\FileProtection**

    - For 64-bit version of Windows: **HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\MSIPC\FileProtection**

2. In the newly added key (for example, HKEY_LOCAL_MACHINE\Software\Microsoft\MSIPC\FileProtection\\\*), create a new string value (REG_SZ) named **Encryption** that has the data value of **Pfile**.

    This setting results in the Azure Information Protection client applying generic protection.

These two settings result in the Azure Information Protection client applying generic protection to all files that have a file name extension. If this is your goal, no further configuration is required. However, you can define exceptions for specific file types, so that they are still natively protected. To do this, you must make three additional registry edits for each file type:

1. For **HKEY_LOCAL_MACHINE\Software\Microsoft\MSIPC\FileProtection** (32-bit Windows) or **HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\MSIPC\FileProtection** (64-bit Windows): Add a new key that has the name of the file name extension (without the preceding period).

    For example, for files that have a .docx file name extension, create a key named **DOCX**.

2. In the newly added file type key (for example, **HKEY_LOCAL_MACHINE\Software\Microsoft\MSIPC\FileProtection\DOCX**), create a new DWORD Value named **AllowPFILEEncryption** that has a value of **0**.

3. In the newly added file type key (for example, **HKEY_LOCAL_MACHINE\Software\Microsoft\MSIPC\FileProtection\DOCX**), create a new String Value named **Encryption** that has a value of **Native**.

As a result of these settings, all files are generically protected except files that have a .docx file name extension. These files are natively protected by the Azure Information Protection client.

Repeat these three steps for other file types that you want to define as exceptions because they support native protection and you do not want them to be generically protected by the Azure Information Protection client.

You can make similar registry edits for other scenarios by changing the value of the **Encryption** string that supports the following values:

- **Pfile**: Generic protection

- **Native**: Native protection

- **Off**: Block protection

For more information, see [File API configuration](../develop/file-api-configuration.md) from the developer guidance. In this documentation for developers, generic protection is referred to as "PFile". 

## File types that are excluded from classification and protection

To help prevent users from changing files that are critical for computer operations, some file types and folders are automatically excluded from classification and protection. If users try to classify or protect these files by using the Azure Information Protection client, they see a message that they are excluded.

- **Excluded file types**: .lnk, .exe, .com, .cmd, .bat, .dll, .ini, .pst, .sca, .drm, .sys, .cpl, .inf, .drv, .dat, .tmp, .msg,.msp, .msi, .pdb, .jar


- **Excluded folders**: 
    - Windows
    - Program Files (\Program Files and \Program Files (x86))
    - \ProgramData 
    - \AppData (for all users)

### File types that are excluded from classification and protection by the Azure Information Protection scanner

By default, the scanner also excludes the same file types as the Azure Information Protection client with the following exceptions:

For the general availability version:

- .rtf, .rar, and .zip are also excluded

For the current preview version: 

    - .rtf, and .rar, are also excluded

You can change the file types included or excluded for file inspection by the scanner:

For the general availability version, use the following PowerShell cmdlets:

- [Set-AIPScannerScannedFileTypes](/powershell/module/azureinformationprotection/Set-AIPScannerScannedFileTypes)

- [Add-AIPScannerScannedFileTypes](/powershell/module/azureinformationprotection/Add-AIPScannerScannedFileTypes)

- [Remove-AIPScannerScannedFileTypes](/powershell/module/azureinformationprotection/Remove-AIPScannerScannedFileTypes)

For the current preview version:

- Configure **File types to scan** in the scanner profile, by [using the Azure portal](../deploy-aip-scanner-preview.md#configure-the-scanner-in-the-azure-portal).

> [!NOTE]
> If you include .rtf files for scanning, carefully monitor the scanner. Some .rtf files cannot be successfully inspected by the scanner and for these files, the inspection doesn't complete and the service must be restarted. 

By default, the scanner protects only Office file types, and PDF files when they are protected by using the ISO standard for PDF encryption. To change this behavior for the scanner, edit the registry and specify the additional file types that you want to be protected. For instructions, see [Editing the registry for the scanner](../deploy-aip-scanner.md#editing-the-registry-for-the-scanner) from the scanner deployment instructions.

### Files that cannot be protected by default

Any file that is password-protected cannot be natively protected by the Azure Information Protection client unless the file is currently open in the application that applies the protection. You most often see PDF files that are password-protected but other applications, such as Office apps, also offer this functionality.

If you change the [default behavior](client-admin-guide-customizations.md#dont-protect-pdf-files-by-using-the-iso-standard-for-pdf-encryption) of the Azure Information Protection client so that it protects PDF files with a .ppdf file name extension, the client cannot natively protect or unprotect PDF files in either of the following circumstances:

- A PDF file that is form-based.

- A protected PDF file that has a .pdf file name extension.

    The Azure Information Protection client can protect an unprotected PDF file, and it can unprotect and reprotect a protected PDF file when it has a .ppdf file name extension.

### Limitations for container files, such as .zip files

Container files are files that include other files, with a typical example being .zip files that contain compressed files. Other examples include .rar, .7z, and .msg.

You can classify and protect these container files, but the classification and protection is not applied to each file inside the container.

If you have a container file that includes classified and protected files, you must first extract the files to change their classification or protection settings. However, you can remove the protection for all files in supported container files by using the [Unprotect-RMSFile](/powershell/module/azureinformationprotection/unprotect-rmsfile) cmdlet.

## File types supported for inspection

Without any additional configuration, the Azure Information Protection client uses Windows IFilter to inspect the contents of documents. Windows IFilter is used by Windows Search for indexing. As a result, the following file types can be inspected when you use the [Azure Information Protection scanner](../deploy-aip-scanner.md), or the [Set-AIPFileClassiciation](/powershell/module/azureinformationprotection/set-aipfileclassification) PowerShell command.

|Application type|File type|
|--------------------------------|-------------------------------------|
|Word|.docx; .docm; .dotm; .dotx|
|Excel|.xls; .xlt; .xlsx; .xltx; .xltm; .xlsm; .xlsb|
|PowerPoint|.ppt; .pps; .pot; .pptx; .ppsx; .pptm; .ppsm; .potx; .potm|
|PDF |.pdf|
|Text|.txt; .xml; .csv|

With additional configuration, other file types can also be inspected. For example, you can [register a custom file name extension to use the existing Windows filter handler for text files](https://docs.microsoft.com/windows/desktop/search/-search-ifilter-registering-filters), and you can install additional filters from software vendors.

To check what filters are installed, see the [Finding a Filter Handler for a Given File Extension](https://docs.microsoft.com/windows/desktop/search/-search-ifilter-registering-filters#finding-a-filter-handler-for-a-given-file-extension) section from the Windows Search Developer's Guide.

The following sections have configuration instructions to inspect .zip files, and .tiff files.

### To inspect .zip files

The Azure Information Protection scanner and the [Set-AIPFileClassiciation](/powershell/module/azureinformationprotection/set-aipfileclassification) PowerShell command can inspect .zip files when you follow these instructions:

1. For the computer running the scanner or the PowerShell session, install the [Office 2010 Filter Pack SP2](https://support.microsoft.com/en-us/help/2687447/description-of-office-2010-filter-pack-sp2).

2. For the scanner: Unless you are running the current preview version of the scanner, include .zip files to be inspected, as described in the [Azure Information Protection scanner](#file-types-that-are-excluded-from-classification-and-protection-by-the-azure-information-protection-scanner) section.

3. For the scanner: After finding sensitive information, if the .zip file should be classified and protected with a label, add a registry entry for this file name extension to have generic protection (pfile), as described in [Editing the registry for the scanner](../deploy-aip-scanner.md#editing-the-registry-for-the-scanner) from the scanner deployment instructions.

Example scenario after doing these steps: 

A file named **accounts.zip** contains Excel spreadsheets with credit card numbers. Your Azure Information Protection policy has a label named **Confidential \ Finance**, which is configured to discover credit card numbers, and automatically apply the label with protection that restricts access to the Finance group. 

After inspecting the file, the scanner classifies this file as **Confidential \ Finance**, applies generic protection to the file so that only members of the Finance groups can unzip it, and renames the file **accounts.zip.pfile**.

### To inspect .tiff files by using OCR

The Azure Information Protection scanner and the [Set-AIPFileClassiciation](/powershell/module/azureinformationprotection/set-aipfileclassification) PowerShell command can use optical character recognition (OCR) to inspect TIFF images with a .tiff file name extension when you install the Windows TIFF IFilter feature, and then configure [Windows TIFF IFilter Settings](https://docs.microsoft.com/previous-versions/windows/it-pro/windows-7/dd744701%28v%3dws.10%29) on the computer running the scanner or the PowerShell session.

For the scanner: After finding sensitive information, if the .tiff file should be classified and protected with a label, add a registry entry for this file name extension to have native protection, as described in [Editing the registry for the scanner](../deploy-aip-scanner.md#editing-the-registry-for-the-scanner) from the scanner deployment instructions.

## Next steps
Now that you've identified the file types supported by the Azure Information Protection client, see the following resources for additional information that you might need to support this client:

- [Customizations](client-admin-guide-customizations.md)

- [Client files and usage logging](client-admin-guide-files-and-logging.md)

- [Document tracking](client-admin-guide-document-tracking.md)

- [PowerShell commands](client-admin-guide-powershell.md)

