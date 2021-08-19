---
title: Concepts - Fetching File Status
description: This article will help you understand how to fetch file status using the `mip::FileHandler::GetFileStatus()` API
author: GRDININ
ms.service: information-protection
ms.topic: conceptual
ms.date: 08/18/2021
ms.author: GRDININ
---
# Microsoft Information Protection SDK - Fetching the status of a file

In the MIP SDK File API, the `mip::FileHandler::GetFileStatus()` static function allows the developer to fetch the status of a file with out the requirement of creating a File Engine Object, authentication and even connectivity.
All that is required is the filename and an creation of mipContext along with a file path and stream.

## Supported file types

- Office File Formats based on OCP (Office 2010 and later)
- Legacy Office File Formats (Office 2007)
- PDF
- Generic PFILE support
- Files that support Adobe XMP
- E-Mail - .MSG Format

## GetFileStatus() Function

`mip::FileHandler::GetFileStatus()` allows developer to fetch the status of a file. For the full list, consult the [API reference](reference/TBD_XXXXX.md).

In this article, the following methods will be covered:

- `mip::FileHandler::GetFileStatus()` static function
- fileStatus Return Object
- `IsProtected()` Property
- `IsLabeled()` Property
- `ContainsProtctedObject()` Property

## Requirements

Creating a `FileHandler` to work with a specific file requires:

- A `mipContext`
- No file engine creation required

## Fetching the status of a file.

To use the `mip::FileHandler::GetFileStatus()` static function, you will need to pass in a File Path, File Stream and mipContext
To execute this function, the developer need not create a file engine, authenticate or be connected to the internet.
This function is especially helpful for:

- Getting the protection status of a file for decryption scenarios prior to creating an engine, potentially skipping the overhead engine creation process if the file is already protected
- Status of a file has a label before creating an engine to try to read the label (time saver)
- Status of an MSG file has attachments and that they may need to be parsed or decrypted in addition to the MSG file itself

The `GetFileStatus()` returns a `fileStatus` Object with the following properties:

- `IsProtected()` Property - returns a bool - The file is protected/encrypted
- `IsLabeled()` Property - returns a bool - The file is Labeled
- `ContainsProtctedObject()` Property - returns a bool - The File/Container/Message contians protected object.

It is recommended that all three properties are interrogated as a file can possess zero to all three properties and permutations in between.

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
