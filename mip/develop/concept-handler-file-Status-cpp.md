---
title: Concepts - Fetching File Status
description: This article will help you understand how to fetch file status using the `mip::FileHandler::GetFileStatus()` API
author: GRDININ
ms.service: azure-information-protection
ms.topic: conceptual
ms.date: 04/10/2025
ms.author: GRDININ
---
# Microsoft Information Protection SDK - Fetching the status of a file

In the MIP SDK File API, the `mip::FileHandler::GetFileStatus()` static function allows the developer to fetch the status of a file without the requirement of creating a File Engine Object, authentication and even connectivity.
All that is required is the filename and the creation of mipContext along with a file path and stream.

## Supported file types

- Office File Formats based on OCP (Office 2010 and later)
- Legacy Office File Formats (Office 2007)
- PDF
- Generic PFILE support
- Files that support Adobe XMP
- E-Mail - .MSG Format

## GetFileStatus() Function

`mip::FileHandler::GetFileStatus()` allows developer to fetch the status of a file. For the full list, consult the [API reference](https://microsoftdocs.github.io/mip-sdk-docs/cpp/classFileHandler.html#a1afcf4f00a9a9be42f8f7e228d43079b).

In this article, the following methods will be covered:

- `mip::FileHandler::GetFileStatus()` static function
- FileStatus object containing labeling and or protection details of a file or container
- `IsProtected()` Property
- `IsLabeled()` Property
- `ContainsProtectedObject()` Property

## Requirements

Creating a `FileHandler` to work with a specific file requires:

- A `mipContext`
- No file engine creation required

## Fetching the status of a file

To use the `mip::FileHandler::GetFileStatus()` static function, the developer will need to pass in a File Path or File Stream and mipContext
to execute this function. Executing this function doesn't require the creation a file engine, authentication, or a connection to the internet.
This function is especially helpful for:

- Getting the protection status of a file for decryption scenarios before creating an engine. Knowing the protection status ahead of time can allow the developer to skip the overhead of creating an engine if the file is already protected
- Getting the status of a file that may already have a label before creating an engine to try to read the label (time saver)
- Getting the status of an MSG file that has attachments and that may need to be parsed or decrypted along with the MSG file itself

The `GetFileStatus()` returns a `fileStatus` Object with the following properties:

- `IsProtected()` Property - returns a bool - The file is protected/encrypted
- `IsLabeled()` Property - returns a bool - The file is Labeled
- `ContainsProtectedObject()` Property - returns a bool - The File/Container/Message contains protected object.

The recommendation is that all three properties are interrogated as a file can have zero to all three properties and permutations in between.
Additionally, since the `GetFileStatus()` function doesn't require authentication, or an engine to execute, the `IsProtected()`, `IsLabeled()`, and `ContainsProtectedObject()` methods reflect if labeling or protection is present in a file. It doesn't validate if the labeling and or protection exists within a tenant or is useable by a user. Validation of the label and or protection would require going through the authentication and engine creation process to validate.

```cpp
    if (options.count("getfilestatus")) {
      auto fileStatus = GetFileStatus(filePath, fileStream, mipContext);
      if (fileStatus->IsProtected()) {
        cout << "File is protected" << endl;
      } 
      if (fileStatus->IsLabeled()) {
        cout << "File is labeled" << endl;
      } 
      if (fileStatus->ContainsProtectedObjects()) {
        cout << "File contains protected objects" << endl;
      }    
      GetLabel(fileHandler);
      return EXIT_SUCCESS;
    }
```

```csharp
    if (options.GetFileStatus) {
      var fileStatus = FileHandler.GetFileStatus(options.FilePath, mipContext);
      if (fileStatus.IsProtected()) {
        Console.WriteLine("The file is protected.");
      }
      if (fileStatus.IsLabeled()) {
        Console.WriteLine("The file is labeled.");
      }
      if (fileStatus.ContainsProtectedObjects()) {
        Console.WriteLine("The file contains protected objects.");
      }
      return true;
    }
```

```java
 if (options.count("getfilestatus")) {
      auto fileStatus = GetFileStatus(filePath, fileStream, mipContext);
      if (fileStatus->IsProtected()) {
        cout << "File is protected" << endl;
      } 
      if (fileStatus->IsLabeled()) {
        cout << "File is labeled" << endl;
      } 
      if (fileStatus->ContainsProtectedObjects()) {
        cout << "File contains protected objects" << endl;
      }    
      GetLabel(fileHandler);
      return EXIT_SUCCESS;
    }
```
