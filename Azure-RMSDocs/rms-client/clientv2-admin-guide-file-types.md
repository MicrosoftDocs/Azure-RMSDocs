---
# required metadata

title: File types supported by the Azure Information Protection (AIP) unified labeling client
description: Learn about the file types and sizes supported for the Azure Information Protection (AIP) unified labeling client for Windows.
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 07/08/2021
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


# File types supported by the Azure Information Protection (AIP) unified labeling client

[!INCLUDE [looking-for-mip](../includes/looking-for-mip.md)]

This article lists the file types and sizes supported by the Azure Information Protection (AIP) unified labeling client. For the listed file types, WebDav locations are not supported.

> [!TIP]
> To protect generic file types, which do not have built-in support for protection, while ensuring that recipients will be able to access them as expected, we recommend that you define the recipient as a co-owner of the file. For more information, see [Protecting generic file types](clientv2-classify-protect.md#protecting-generic-file-types).
>

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

- **Microsoft Office**: The following file types, including 97-2003 file formats and Office Open XML formats for Word, Excel, and PowerPoint:

    :::row:::
       :::column span="":::
          .doc <br>
          .docm<br>
          .docx<br>
          .dot<br>
          .dotm<br>
          .dotx<br>
          .potm<br>
       :::column-end:::
       :::column span="":::
          .potx<br>
          .pps<br>
          .ppsm<br>
          .ppsx<br>
          .ppt<br>
          .pptm<br>
          .pptx<br>
          .vdw<br>
       :::column-end:::
       :::column span="":::
          .vsd<br>
          .vsdm<br>
          .vsdx<br>
          .vss<br>
          .vssm<br>
          .vst<br>
          .vstm<br>
          .vssx<br>
       :::column-end:::
       :::column span="":::
          .vstx<br>
          .xls<br>
          .xlsb<br>
          .xlt<br>
          .xlsm<br>
          .xlsx<br>
          .xltm<br>
          .xltx<br>
       :::column-end:::
    :::row-end:::

Other file types support classification when they are also protected. For these file types, see the [Supported file types for classification and protection](#supported-file-types-for-classification-and-protection) section.

Examples:

- If the **General** sensitivity label applies classification and does not apply protection: You could apply the **General** label to a file named sales.pdf but you could not apply this label to a file named sales.txt.

- If the **Confidential \ All Employees** sensitivity label applies classification and protection: You could apply this label to a file named sales.pdf and a file named sales.txt. You could also apply just protection to these files, without classification.


## File types supported for protection

The Azure Information Protection unified labeling client supports protection at two different levels, as described in the following table.

|Type of protection|Native|Generic|
|----------------------|----------|-----------|
|**Description**|For text, image, Microsoft Office (Word, Excel, PowerPoint) files, .pdf files, and other application file types that support a Rights Management service, native protection provides a strong level of protection that includes both encryption and enforcement of rights (permissions).|For other supported file types, generic protection provides a level of protection that includes both file encapsulation using the .pfile file type and authentication to verify if a user is authorized to open the file.|
|**Protection**|File protection is enforced in the following ways:<br /><br />- Before protected content is rendered, successful authentication must occur for those users who receive the file through email or are given access to it through file or share permissions.<br /><br />- Additionally, usage rights and policy that were set by the content owner when the files were protected are enforced when the content is rendered in either the Azure Information Protection viewer (for protected text and image files) or the associated application (for all other supported file types).|File protection is enforced in the following ways:<br /><br />- Before protected content is rendered, successful authentication must occur for people who are authorized to open the file and given access to it. If authorization fails, the file does not open.<br /><br />- Usage rights and policy set by the content owner are displayed to inform authorized users of the intended usage policy.<br /><br />- Audit logging of authorized users opening and accessing files occurs. However, usage rights are not enforced.|
|**Default for file types**|Default level of protection for the following file types:<br /><br />- Text and image files<br /><br />- Microsoft Office (Word, Excel, PowerPoint) files<br /><br />- Portable document format (.pdf)<br /><br />For more information, see the following section, [Supported file types for classification and protection](#supported-file-types-for-classification-and-protection).|Default protection for all other file types (such as .vsdx, .rtf, and so on) that are not supported by native protection.|

You cannot change the default protection level that the Azure Information Protection unified labeling client or the scanner applies. However, you can change which file types are protected. For more information, see [Change which file types to protect](clientv2-admin-guide-customizations.md#change-which-file-types-to-protect).

The protection can be applied automatically when a user selects a sensitivity label that an administrator has configured, or users can specify their own custom protection settings by using [permission levels](../configure-usage-rights.md#rights-included-in-permissions-levels).


## Supported file types for classification and protection

The following table lists a subset of file types that support native protection by the Azure Information Protection unified labeling client, and that can also be classified.

These file types are identified separately because when they are natively protected, the original file name extension is changed, and these files become read-only. When files are generically protected, the original file name extension is always changed to `.p<file-type>`.

> [!WARNING]
> If you have firewalls, web proxies, or security software that inspect and take action according to file name extensions, you might need to reconfigure these network devices and software to support these new file name extensions.

|Original file name extension|Protected file name extension|
|--------------------------------|-------------------------------------|
|.bmp|.pbmp|
|.gif|.pgif|
|.jfif|.pjfif|
|.jpe|.pjpe|
|.jpeg|.pjpeg|
|.jpg|.pjpg|
|.jt|.pjt|
|.png|.ppng|
|.tif|.ptif|
|.tiff|.ptiff|
|.txt|.ptxt|
|.xla |.pxla |
|.xlam |.pxlam |
|.xml|.pxml|

**File types supported by Office**

The following list includes the remaining file types that support native protection by the Azure Information Protection unified labeling client, and that can also be classified. You will recognize these as file types for Microsoft Office apps. The supported file formats for these file types are the 97-2003 file formats and Office Open XML formats for the following Office programs: Word, Excel, and PowerPoint.

For these files, the file name extension *remains the same* after the file is protected by a Rights Management service.

:::row:::
   :::column span="4":::
.doc

.docm

.docx

.dot

.dotm

.dotx

.potm

   :::column-end:::
   :::column span="":::

.potx

.pps

.ppsm

.ppsx

.ppt

.pptm

.pptx


   :::column-end:::
   :::column span="":::
.vsdm

.vsdx

.vssm

.vssx

.vstm

.vstx

.xls

   :::column-end:::
   :::column span="":::

.xlsb

.xlt

.xlsm

.xlsx

.xltm

.xltx

.xps
   :::column-end:::
:::row-end:::

## File types excluded from classification and protection

To help prevent users from changing files that are critical for computer operations, some file types and folders are automatically excluded from classification and protection. If users try to classify or protect these files by using the Azure Information Protection unified labeling client, they see a message that they are excluded.

- **Excluded file types**: .lnk, .exe, .com, .cmd, .bat, .dll, .ini, .pst, .sca, .drm, .sys, .cpl, .inf, .drv, .dat, .tmp, .msp, .msi, .pdb, .jar

- **Excluded folders**:
    - Windows
    - Program Files (\Program Files and \Program Files (x86))
    - \ProgramData
    - \AppData (for all users)


### File types that are excluded from classification and protection by the Azure Information Protection scanner

By default, the scanner also excludes the same file types as the Azure Information Protection unified labeling client. 

For the scanner, the following file types are also excluded: .msg, .rtf, and .rar

To change the file types included or excluded for file inspection by the scanner, configure the **File types to scan** in the [content scan job](../deploy-aip-scanner-configure-install.md#configure-the-scanner-settings).

> [!NOTE]
> If you include .rtf files for scanning, we recommend that you carefully monitor the scanner. Some .rtf files cannot be successfully inspected by the scanner and for these files, the inspection doesn't complete and the service must be restarted.

By default, the scanner protects only Office file types, and PDF files when they are protected by using the ISO standard for PDF encryption. To change this behavior for the scanner, use the PowerShell advanced setting, **PFileSupportedExtensions**. For more information, see [Use PowerShell to change which file types are protected](../deploy-aip-scanner-configure-install.md#change-which-file-types-to-protect) from the scanner deployment instructions.

### Files that cannot be protected by default

Any file that is password-protected cannot be natively protected by the Azure Information Protection unified labeling client unless the file is currently open in the application that applies the protection. You most often see PDF files that are password-protected but other applications, such as Office apps, also offer this functionality.

### Limitations for container files, such as .zip files

For more information, see the [Azure Information Protection known issues](../known-issues.md#client-support-for-container-files-such-as-zip-files).

## File types supported for inspection

Without any extra configuration, the Azure Information Protection unified labeling client uses Windows IFilter to inspect the contents of documents. Windows IFilter is used by Windows Search for indexing. As a result, the following file types can be inspected when you use the [Set-AIPFileClassification](/powershell/module/azureinformationprotection/set-aipfileclassification) PowerShell command.

|Application type|File type|
|--------------------------------|-------------------------------------|
|**Word**|.doc; docx; .docm; .dot; .dotx|
|**Excel**|.xls; .xlt; .xlsx; .xlsm; .xlsb|
|**PowerPoint**|.ppt; .pps; .pot; .pptx|
|**PDF** |.pdf|
|**Text**|.txt; .xml; .csv|

With extra configuration, other file types can also be inspected. For example, you can [register a custom file name extension to use the existing Windows filter handler for text files](/windows/desktop/search/-search-ifilter-registering-filters), and you can install other filters from software vendors.

To check what filters are installed, see the [Finding a Filter Handler for a Given File Extension](/windows/desktop/search/-search-ifilter-registering-filters#finding-a-filter-handler-for-a-given-file-extension) section from the Windows Search Developer's Guide.

The following sections have configuration instructions to inspect .zip files, and .tiff files.

### To scan .zip files

When your scanner is installed on a Windows server machine, you must also install the Microsoft Office iFilter in order to scan .zip files for sensitive information types. For more information, see the [Microsoft download site](https://www.microsoft.com/en-us/download/details.aspx?id=17062).

You can use the AIP scanner or the [Set-AIPFileClassification](/powershell/module/azureinformationprotection/set-aipfileclassification) PowerShell command to inspect .zip files.

After finding sensitive information, if the .zip file should be classified and protected with a label, specify the .zip file name extension with the PowerShell advanced setting, **PFileSupportedExtensions**, as described in [Use PowerShell to change which file types are protected](../deploy-aip-scanner-configure-install.md#change-which-file-types-to-protect) from the scanner deployment instructions.


**Example scenario**:

A file named **accounts.zip** contains Excel spreadsheets with credit card numbers. You have a sensitivity label named **Confidential \ Finance**, which is configured to discover credit card numbers and automatically apply the label with protection that restricts access to the Finance group.

After inspecting the file, the unified labeling client from your PowerShell session classifies this file as **Confidential \ Finance**, applies generic protection to the file so that only members of the Finance groups can unzip it, and renames the file **accounts.zip.pfile**.

### To scan .tiff files by using OCR

The [Set-AIPFileClassiciation](/powershell/module/azureinformationprotection/set-aipfileclassification) PowerShell command can use optical character recognition (OCR) to inspect TIFF images with a .tiff file name extension when you install the Windows TIFF IFilter feature, and then configure [Windows TIFF IFilter Settings](/previous-versions/windows/it-pro/windows-7/dd744701(v=ws.10)) on the computer running the PowerShell session.

For the scanner: After finding sensitive information, if the .tiff file should be classified and protected with a label, specify this file name extension with the PowerShell advanced setting, **PFileSupportedExtensions**, as described in [Use PowerShell to change which file types are protected](../deploy-aip-scanner-configure-install.md#change-which-file-types-to-protect) from the scanner deployment instructions.

## Supported file sizes

### Supported file sizes for the Office add-in

The following table lists maximum sizes supported for protection using Office with the AIP add-in:

|                                                     Office application                                                      |                                                Maximum file size supported                                                 |
|-----------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------|
|             **Word 2013<br /><br />Word 2016**             |                                          32-bit: 512 MB<br /><br />64-bit: 512 MB                                          |
|           **Excel 2013<br /><br />Excel 2016**           |                      32-bit: 2 GB<br /><br />64-bit: Limited only by available disk space and memory                       |
| **PowerPoint 2013<br /><br />PowerPoint 2016** | 32-bit: Limited only by available disk space and memory<br /><br />64-bit: Limited only by available disk space and memory |

### Supported file sizes for non-Office files

When protecting non-Office files, and opening them using the [AIP Viewer](clientv2-view-use-files.md), the maximum file size is limited only by available disk size and RAM, the lower of the two.

### Supported file sizes for the File Explorer and PowerShell

The following table lists the maximum sizes support for encryption and decryption using the File Explorer and PowerShell:

| Action |File Explorer  |PowerShell  |
|---------|---------|---------|
|**Encryption**     |  2 GB       |   2 GB      |
|**Decryption**     |   Up to the available disk size, RAM, or architecture limits (lowest of the three).     | Up to the available disk size or RAM, the lower of the two.        |

## Next steps

For more information, see:

- [Customizations](clientv2-admin-guide-customizations.md)

- [Client files and usage logging](clientv2-admin-guide-files-and-logging.md)

- [PowerShell commands](clientv2-admin-guide-powershell.md)
