---
# required metadata

title: File API configuration | Azure RMS
description: The File API's behavior can be configured through settings in the registry.
keywords:
author: bryanla
ms.author: bryanla
manager: mbaldwin
ms.date: 10/11/2017
ms.topic: conceptual
ms.service: information-protection
ms.assetid: 930878C2-D2B4-45F1-885F-64927CEBAC1D
# optional metadata

#ROBOTS:
audience: developer
ms.reviewer: kartikk
ms.suite: ems


---

# File API configuration


The File API's behavior can be configured through settings in the registry.

The File API provides two kinds of protection; native protection and PFile protection.

-   **Native protection** - the file is protected to an AD RMS format based on its MIME type (file name extension).
-   **PFile protection** - the file is protected to the AD RMS Protected File (PFile) format.

For more information about supported file formats, see **File API File Support Details** in this article.

## Key/Key Value types and descriptions

The following sections describe the keys and key values that control encryption.

### `HKEY_LOCAL_MACHINE\Software\Microsoft\MSIPC\FileProtection`

**Type**: Key

**Description**: Contains general configuration for the File API.

### `HKEY_LOCAL_MACHINE\Software\Microsoft\MSIPC\FileProtection\<EXT>`

**Type**: Key

**Description**: Specifies configuration information for a specific file extension; for example, TXT, JPG, and so on.

- The wildcard character, '*', is allowed; however, a setting for a specific extension takes precedence over the wildcard setting. The wildcard character does not affect settings for Microsoft Office files; these must be explicitly disabled by file type.
- To specify files that do not have an extension, use '.'
- Do not specify the '.' character when specifying the key for a specific file extension; for example, use `HKEY_LOCAL_MACHINE\Software\Microsoft\MSIPC\FileProtection\TXT` to specify settings for .txt files. (Do not use `HKEY_LOCAL_MACHINE\Software\Microsoft\MSIPC\FileProtection\.TXT`).

To specify the protection behavior, set the **Encryption** value in the key. If the **Encryption** value is not set, the default behavior for the file type is observed.


### `HKEY_LOCAL_MACHINE\Software\Microsoft\MSIPC\FileProtection\<EXT>\Encryption*`

**Type**: REG_SZ

**Description**: Contains one of three values:

- **Off**: Encryption is disabled.

> [!Note]
> This setting has no bearing on decryption. Any encrypted file, whether encrypted using Native or Pfile protection, can be decrypted, as long as the user has the **EXTRACT** right.

- **Native**:  Native encryption is used. For Office files the encrypted file will have the same extension as the original file. For example, a file with the .docx file extension will be encrypted to a file with an extension of .docx. For other files that can have native protection applied, the file will be encrypted to a file with an extension of the format p*zzz*, where *zzz* is the original file extension. For example, .txt files will be encrypted to a file with an extension of .ptxt. A list of file extensions that can have native protection applied follows.

- **Pfile**: PFile encryption is used. The encrypted file will have .pfile appended to the original extension. For example, after encryption, a .txt file, will have an extension of .txt.pfile.


> [!Note]
> This setting has no bearing on Office file formats. For example, if the `HKEY_LOCAL_MACHINE\Software\Microsoft\MSIPC\FileProtection\DOCX\Encryption` value is set to &quot;Pfile”, .docx files will still be encrypted using native protection, and the encrypted file will still have a file extension of .docx.

Setting any other value or setting no value results in default behavior.

## Default behavior for different file formats

-   **Office files** Native encryption is enabled.
-   **txt, xml, jpg, jpeg, pdf, png, tiff, bmp, gif, giff, jpe, jfif, jif files** Native encryption is enabled (xxx becomes pxxx)
-   **All other files** Encryption is protected file (pfile) enabled (xxx become xxx.pfile)

If encryption is attempted on a file type that is blocked, an [IPCERROR\_FILE\_ENCRYPT\_BLOCKED](https://msdn.microsoft.com/library/hh535248.aspx) error occurs.

### File API - File Support Details

Native support can be added for any file type (extension). For instance, any extension &lt;ext&gt; (non-office), \*.p&lt;ext&gt; will be used if the admin configuration for that extension is "NATIVE".

**Office files**

-   File extensions: doc, dot, xla, xls, xlt, pps, ppt, docm, docx, dotm, dotx, xlam, xlsb, xlsm, xlsx, xltm, xltx, xps, potm, potx, ppsx, ppsm, pptm, pptx, thmx, vsdx, vsdm, vssx, vssm, vstx, and vstm. 
-   Protection type = Native (default): sample.docx is encrypted to sample.docx
-   Protection type = Pfile: For Office files, has the same effect as Native.
-   Off: Disables encryption.

**PDF files**

-   Protection type = Native: sample.pdf is encrypted and named sample.ppdf
-   Protection type = Pfile: sample.pdf is encrypted and named sample.pdf.pfile.
-   Off: Disables encryption.

**All other file formats**

-   Protection type = Pfile: sample.*zzz* is encrypted and named sample.*zzz*.pfile; where *zzz* is the original file extension.
-   Off: Disables encryption.

### Examples

The following settings enable PFile encryption for txt files. Office files will have native protection applied (by default), txt files will have PFile protection applied, and all other files will have protection blocked (by default).

```
HKEY_LOCAL_MACHINE
   Software
      Microsoft
         MSIPC
            FileProtection
               txt
                  Encryption = Pfile
```

The following settings enable PFile encryption for all non-Office files except txt files. Office files will have native protection applied (by default), txt files will have protection blocked, and all other files will have PFile protection applied.

```
HKEY_LOCAL_MACHINE
   Software
      Microsoft
         MSIPC
            FileProtection
               *
                  Encryption = Pfile
               txt
                  Encryption = Off
```

The following settings disable native encryption for docx files. Office files, except for docx files, will have native protection applied (by default) and all other files will have protection blocked (by default).

```
HKEY_LOCAL_MACHINE
   Software
      Microsoft
         MSIPC
            FileProtection
               docx
                  Encryption = Off
```

## Related articles

- [Developer notes](developer-notes.md)
- [IPCERROR\_FILE\_ENCRYPT\_BLOCKED](https://msdn.microsoft.com/library/hh535248.aspx)
