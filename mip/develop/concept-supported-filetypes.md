---
title: File types supported - Microsoft Information Protection SDK
description: Technical details about supported file types, file name extensions, and levels of protection for admins who are responsible for the Microsoft Information Protection Software Development kit.
author: msmbaldwin
ms.author: mbaldwin
ms.date: 04/10/2025
ms.topic: conceptual
ms.service: information-protection

---

# File types supported by the Microsoft Information Protection SDK

The Microsoft Information Protection SDK can apply the following to documents and emails:

- Classification only

- Classification and protection

- Protection only

The Microsoft Information Protection SDK can also inspect the content of some file types using well-known sensitive information types or regular expressions that you define.

Use the following information to check which file types the Microsoft Information Protection SDK supports, understand the different levels of protection and how to change the default protection level, and to identify which files are automatically excluded (skipped) from classification and protection.

## File types supported for classification only

The following file types can be classified even when they are not protected.

- **Adobe Portable Document Format**: .pdf

- **Microsoft Power BI**: .pbit, .pbix

- **Microsoft Project**: .mpp, .mpt

- **Microsoft Publisher**: .pub

- **Microsoft XPS**: .xps .oxps

- **Images**: .jpg, .jpe, .jpeg, .jif, .jfif, .jfi, .png, .tif, .tiff

- **Autodesk Design Review 2013**: .dwfx

- **Adobe Photoshop**: .psd

- **Digital Negative**: .dng

- **Microsoft Office**: File types in the following table.

    The supported file formats for these file types are the 97-2003 file formats and Office Open XML formats for the following Office programs: Word, Excel, and PowerPoint.

    | Office file type                                                                                                                                                                                                                                               | Office file type                                                                                                                                                                                                                                 |
    | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
    | .doc<br /><br />.docm<br /><br />.docx<br /><br />.dot<br /><br />.dotm<br /><br />.dotx<br /><br />.potm<br /><br />.potx<br /><br />.pps<br /><br />.ppsm<br /><br />.ppsx<br /><br />.ppt<br /><br />.pptm<br /><br />.pptx<br /><br />.vdw<br /><br />.vsd | .vsdm<br /><br /> .vsdx<br /><br />.vss<br /><br />.vssm<br /><br />.vst<br /><br />.vstm<br /><br />.vssx<br /><br />.vstx<br /><br />.xls<br /><br />.xlsb<br /><br />.xlt<br /><br />.xlsm<br /><br />.xlsx<br /><br />.xltm<br /><br />.xltx |

Additional file types support classification when they are also protected. For these file types, see the [Supported file types for classification and protection](#supported-file-types-for-classification-and-protection) section.

For example, if a label **General**, applies classification and does not apply protection, you could apply the **General** label to a file named sales.pdf but you could not apply this label to a file named sales.txt.

Also, if a label **Confidential \ All Employees** applies classification and protection, you could apply this label to a file named sales.pdf and a file named sales.txt. You could also apply just protection to these files, without classification.

## File types supported for protection

The Microsoft Information Protection SDK supports protection at two different levels, as described in the following table.

| Type of protection     | Native                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | Generic                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Description            | For text, image, Microsoft Office (Word, Excel, PowerPoint) files, .pdf files, and other application file types that support a Rights Management service, native protection provides a strong level of protection that includes both encryption and enforcement of rights (permissions).                                                                                                                                                                                                                                                                                       | For all other applications and file types, generic protection provides a level of protection that includes both file encapsulation using the .pfile file type and authentication to verify if a user is authorized to open the file.                                                                                                                                                                                                                                                                                              |
| Protection             | Files protection is enforced in the following ways:<br /><br />- Before protected content is rendered, successful authentication must occur for those who receive the file through email or are given access to it through file or share permissions.<br /><br />- Additionally, usage rights and policy that were set by the content owner when the files were protected are enforced when the content is rendered in either the Microsoft Purview Information Protection viewer (for protected text and image files) or the associated application (for all other supported file types). | File protection is enforced in the following ways:<br /><br />- Before protected content is rendered, successful authentication must occur for people who are authorized to open the file and given access to it. If authorization fails, the file does not open.<br /><br />- Usage rights and policy set by the content owner are displayed to inform authorized users of the intended usage policy.<br /><br />- Audit logging of authorized users opening and accessing files occurs. However, usage rights are not enforced. |
| Default for file types | This is the default level of protection for the following file types:<br /><br />- Text and image files<br /><br />- Microsoft Office (Word, Excel, PowerPoint) files<br /><br />- Portable document format (.pdf)<br /><br />For more information, see the following section, [Supported file types for classification and protection](#supported-file-types-for-classification-and-protection).                                                                                                                                                                              | This is the default protection for all other file types (such as .vsdx, .rtf, and so on) that are not supported by native protection.                                                                                                                                                                                                                                                                                                                                                                                             |

You can change the default protection level that the Microsoft Information Protection SDK applies. You can change the default level of native to generic, from generic to native, and even prevent the Microsoft Information Protection SDK from applying protection.

### File sizes supported for protection

Starting in Microsoft Information Protection SDK 1.6, the default maximum file size is 6 GB. This setting can be overridden if required. Lesser defaults for legacy Office platforms still apply.


- **For Office files:**

  | Office application                                                                                                          | Maximum file size supported                                                                                                |
  | --------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
  | Word 2007 (supported by AD RMS only)<br /><br />Word 2010<br /><br />Word 2013<br /><br />Word 2016                         | 32-bit: 512 MB<br /><br />64-bit: 512 MB                                                                                   |
  | Excel 2007 (supported by AD RMS only)<br /><br />Excel 2010<br /><br />Excel 2013<br /><br />Excel 2016                     | 32-bit: 2 GB<br /><br />64-bit: Limited only by available disk space and memory                                            |
  | PowerPoint 2007 (supported by AD RMS only)<br /><br />PowerPoint 2010<br /><br />PowerPoint 2013<br /><br />PowerPoint 2016 | 32-bit: Limited only by available disk space and memory<br /><br />64-bit: Limited only by available disk space and memory |

- **Power BI**

The Microsoft Information Protection SDK supports labeling and protection of Power BI *.pbix* files. These files can be labeled via the File SDK and can be opened in Power BI Desktop or uploaded to the Power BI service.

- **For all other files**:

    To protect other file types, and to remove the protection on these file types using the SDK : The maximum file size is limited only by available disk space and memory.

### Supported file types for classification and protection

The following table lists a subset of file types that support native protection by the Microsoft Information Protection SDK, and that can also be classified.

These file types are identified separately because when they are natively protected, the original file name extension is changed, and these files become read-only. Note that when files are generically protected, the original file name extension is always changed to .pfile.

> [!WARNING]
> If you have firewalls, web proxies, or security software that inspect and take action according to file name extensions, you might need to reconfigure these network devices and software to support these new file name extensions.

| Original file name extension | Protected file name extension |
| ---------------------------- | ----------------------------- |
| .txt                         | .ptxt                         |
| .xml                         | .pxml                         |
| .jpg                         | .pjpg                         |
| .jpeg                        | .pjpeg                        |
| .pdf                         | .ppdf [[1]](#footnote-1)      |
| .png                         | .ppng                         |
| .tif                         | .ptif                         |
| .tiff                        | .ptiff                        |
| .bmp                         | .pbmp                         |
| .gif                         | .pgif                         |
| .jpe                         | .pjpe                         |
| .jfif                        | .pjfif                        |

> [!NOTE]
> When using the File SDK's FileHandler with an output stream, the stream must be opened with **read/write** access. Failure to use a read and write stream may result in an "Unknown Error." 

###### Footnote 1
With the latest version of the Microsoft Information Protection SDK, the file name extension of the protected PDF document remains as .pdf.

The next table lists the remaining file types that support native protection by the Microsoft Information Protection SDK, and that can also be classified. You will recognize these as file types for Microsoft Office apps. The supported file formats for these file types are the 97-2003 file formats and Office Open XML formats for the following Office programs: Word, Excel, and PowerPoint.

For these files, the file name extension remains the same after the file is protected by a Rights Management service.

| File types supported by Office                                                                                                                                                                                                                  | File types supported by Office                                                                                                                                                                                                                  |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| .doc<br /><br />.docm<br /><br />.docx<br /><br />.dot<br /><br />.dotm<br /><br />.dotx<br /><br />.potm<br /><br />.potx<br /><br />.pps<br /><br />.ppsm<br /><br />.ppsx<br /><br />.ppt<br /><br />.pptm<br /><br />.pptx<br /><br />.vsdm | .vsdx<br /><br />.vssm<br /><br />.vssx<br /><br />.vstm<br /><br />.vstx<br /><br />.xla<br /><br />.xlam<br /><br />.xls<br /><br />.xlsb<br /><br />.xlt<br /><br />.xlsm<br /><br />.xlsx<br /><br />.xltm<br /><br />.xltx<br /><br />.xps |

### Limitations for container files, such as .zip, .msg files

Container files are files that include other files, with a typical example being .zip files that contain compressed files. Other examples include .rar, .7z, .msg files, .rpmsg files and PDF documents that include attachments.

You can classify and protect these container files, but the classification and protection is not applied to each file inside the container. Similarly, a protected container file can be unprotected using the SDK, but the protection (if applied) to files inside the container will not be removed by protection removal operation on the container file recursively. The application developers are responsible for recursing and unprotecting any files within the containers.

If you have a container file that includes classified and protected files, you must first extract the files to change their classification or protection settings.
