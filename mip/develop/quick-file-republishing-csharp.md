---
title: How to - Republishing scenario C#
description: This article will help you understand the scenario of how to re-use protection handler for republishing scenarios (C#).
author: msmbaldwin
ms.service: information-protection
ms.topic: quickstart
ms.date: 04/10/2025
ms.author: mbaldwin
ms.custom: mode-api
---

# Microsoft Information Protection SDK - File SDK Republishing Quickstart (C#)

## Overview

For an overview on this scenario and where it may be used, refer to [Republishing in MIP SDK](concept-republishing.md).

## Prerequisites

If you haven't already, be sure to complete the following prerequisites before continuing:

- Complete [Quickstart: Set/get sensitivity labels(C#)](quick-file-set-get-label-csharp.md) first, which builds a starter Visual Studio solution, to list an organization's sensitivity labels, to set and read sensitivity labels to/from a file. This "How to - Republish a protected file - C#" Quickstart builds on the previous one.
- Optionally: Review [File handlers](concept-handler-file-cpp.md) in the MIP SDK concepts.
- Optionally: Review [Protection handlers](concept-handler-protection-cpp.md) in the MIP SDK concepts.

## Add logic to edit and republish a protected file

1. Open the Visual Studio solution you created in the previous "Quickstart: Set/get sensitivity labels(C#)" article.

2. Using Solution Explorer, open the .cs file in your project that contains the implementation of the `Main()` method. It defaults to the same name as the project containing it, which you specified during project creation.

3. Toward the end of the `Main()` body, below `Console.ReadKey()` and above application shutdown block (where you left off in the previous Quickstart), insert the following code.

```csharp
string protectedFilePath = "<protected-file-path>" // Originally protected file's path from previous quickstart.

//Create a fileHandler for consumption for the Protected File.
var protectedFileHandler = Task.Run(async () => 
                            await fileEngine.CreateFileHandlerAsync(protectedFilePath,// inputFilePath
                                                                    protectedFilePath,// actualFilePath
                                                                    false, //isAuditDiscoveryEnabled
                                                                    null)).Result; // fileExecutionState

// Store protection handler from file
var protectionHandler = protectedFileHandler.Protection;

//Check if the user has the 'Edit' right to the file
if (protectionHandler.AccessCheck("Edit"))
{
    // Decrypt file to temp path
    var tempPath = Task.Run(async () => await protectedFileHandler.GetDecryptedTemporaryFileAsync()).Result;

    /*
        Your own application code to edit the decrypted file belongs here. 
    */

    /// Follow steps below for re-protecting the edited file. ///
    // Create a new file handler using the temporary file path.
    var republishHandler = Task.Run(async () => await fileEngine.CreateFileHandlerAsync(tempPath, tempPath, false)).Result;

    // Set protection using the ProtectionHandler from the original consumption operation.
    republishHandler.SetProtection(protectionHandler);

    // New file path to save the edited file
    string reprotectedFilePath = "<reprotected-file-path>" // New file path for saving reprotected file.

    // Write changes
    var reprotectedResult = Task.Run(async () => await republishHandler.CommitAsync(reprotectedFilePath)).Result;

    var protectedLabel = protectedFileHandler.Label;
    Console.WriteLine(string.Format("Originally protected file: {0}", protectedFilePath));
    Console.WriteLine(string.Format("File LabelID: {0} \r\nProtectionOwner: {1} \r\nIsProtected: {2}", 
                        protectedLabel.Label.Id, 
                        protectedFileHandler.Protection.Owner, 
                        protectedLabel.IsProtectionAppliedFromLabel.ToString()));
    var reprotectedLabel = republishHandler.Label;
    Console.WriteLine(string.Format("Reprotected file: {0}", reprotectedFilePath));
    Console.WriteLine(string.Format("File LabelID: {0} \r\nProtectionOwner: {1} \r\nIsProtected: {2}", 
                        reprotectedLabel.Label.Id, 
                        republishHandler.Protection.Owner, 
                        reprotectedLabel.IsProtectionAppliedFromLabel.ToString()));
    Console.WriteLine("Press a key to continue.");
    Console.ReadKey();
}
```

4. Towards the end of Main() find the application shutdown block created in previous quickstart and add below handler lines to release resources.

    ````csharp
        protectedFileHandler = null;
        protectionHandler = null;
    ````

5. Replace the placeholder values in the source code using the following values:

   | Placeholder | Value |
   |:----------- |:----- |
   | \<protected-file-path\> | Protected file from previous quickstart. |
   | \<reprotected-file-path\> | The output file path for modified file to republish. |

## Build and test the application

Build and test your client application.

1. Use CTRL-SHIFT-B (**Build Solution**) to build your client application. If you have no build errors, use F5 (**Start debugging**) to run your application.

2. If your project builds and runs successfully, the application *may* prompt for authentication using Microsoft Authentication Library (MSAL) each time the SDK calls your `AcquireToken()` method. If cached credentials already exist, you won't be prompted to sign in and see the list of labels, followed by the information on the applied label and modified file.

  ```console
    Personal : 73c47c6a-eb00-4a6a-8e19-efaada66dee6
    Public : 73254501-3d5b-4426-979a-657881dfcb1e
    General : da480625-e536-430a-9a9e-028d16a29c59
    Confidential : 569af77e-61ea-4deb-b7e6-79dc73653959
    Highly Confidential : 905845d6-b548-439c-9ce5-73b2e06be157
    Press a key to continue.

    Getting the label committed to file: C:\Test\Test_protected.docx
    File Label: Confidential
    IsProtected: True
    Press a key to continue.
    Originally protected file: C:\Test\Test_protected.docx
    File LabelID: 569af77e-61ea-4deb-b7e6-79dc73653959
    ProtectionOwner: User1@Contoso.OnMicrosoft.com
    IsProtected: True
    Reprotected file: C:\Test\Test_reprotected.docx
    File LabelID: 569af77e-61ea-4deb-b7e6-79dc73653959
    ProtectionOwner: User1@Contoso.OnMicrosoft.com
    IsProtected: True
    Press a key to continue.
   ```
