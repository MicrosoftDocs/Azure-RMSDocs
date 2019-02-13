---
title: Quickstart - Set and get a sensitivity label on a file using the C# MIP SDK
description: A quickstart showing you how to use the Microsoft Information Protection SDK .NET Wrapper to set and get a sensitivity label on a file.
services: information-protection
author: BryanLa
ms.service: information-protection
ms.topic: quickstart
ms.collection: M365-security-compliance
ms.date: 01/09/2019
ms.author: bryanla
#Customer intent: As a an application developer, I want to learn how to set labels with the MIP SDK, so that I can use the SDK APIs to apply labels and protection to my own files.
---

# Quickstart: Set and get a sensitivity label (C#)

This Quickstart shows you how to use more of the MIP File APIs. Using one of the sensitivity labels you listed in the previous Quickstart, you use a File handler to set/get the label on a file. The File handler class exposes various operations for setting/getting labels, or protection, for supported file types.

## Prerequisites

If you haven't already, be sure to complete the following prerequisites before continuing:

- Complete [Quickstart: List sensitivity labels (C#)](quick-file-list-labels-csharp.md) first, which builds a starter Visual Studio solution, to list an organization's sensitivity labels. This "Set and get a sensitivity label" Quickstart builds on the previous one.
- Optionally: Review [File handlers in the MIP SDK](concept-handler-file-cpp.md) concepts.

## Add logic to set and get a sensitivity label

Add logic to set and get a sensitivity label on a file, using the File engine object. 

1. Using **Solution Explorer**, open the .cs file in your project that contains the implementation of the Main()` method. It defaults to the same name as the project containing it, which you specified during project creation. 

2. Toward the end of the `Main()` body, below `Console.ReadKey()` and above `}` (where you left off in the previous Quickstart), insert the following code:

   ```csharp
     //Set paths and label ID
     string inputFilePath = "<input-file-path>";
     string labelId = "<label-id>";
     string outputFilePath = "<output-file-path>";

     //Create a file handler for that file
     //Note: the 2nd inputFilePath is used to provide a human-readable content identifier for admin auditing. 
     var handler = Task.Run(async () => await fileEngine.CreateFileHandlerAsync(inputFilePath, inputFilePath, ContentState.Rest, true)).Result;

     //Set Labeling Options
     LabelingOptions labelingOptions = new LabelingOptions()
     {
          ActionSource = ActionSource.Manual,
          AssignmentMethod = AssignmentMethod.Standard
     };

     // Set a label on input file
     handler.SetLabel(labelId, labelingOptions);

     // Commit changes, save as outputFilePath
     var result = Task.Run(async () => await handler.CommitAsync(outputFilePath)).Result;

     // Create a new handler to read the labeled file metadata
     var handlerModified = Task.Run(async () => await fileEngine.CreateFileHandlerAsync(outputFilePath, outputFilePath, ContentState.Rest, true)).Result;

     // Get the label from output file
     var contentLabel = handlerModified.Label;
     Console.WriteLine(string.Format("Getting the label committed to file: {0}", outputFilePath));
     Console.WriteLine(string.Format("File Label: {0} \r\nIsProtected: {1}", contentLabel.Label, contentLabel.IsProtectionAppliedFromLabel.ToString()));
     Console.WriteLine("Press a key to continue.");
     Console.ReadKey();
   ```

3. Replace the placeholder values in the source code that you just pasted in, using the following values:

   | Placeholder | Value |
   |:----------- |:----- |
   | \<input-file-path\> | The full path to a test input file, for example: `c:\\Test\\Test.docx`. |
   | \<label-id\> | A sensitivity label ID, copied from the console output in the previous Quickstart, for example: `f42a3342-8706-4288-bd31-ebb85995028z`. |
   | \<output-file-path\> | The full path to the output file, which will be a labeled copy of the input file, for example: `c:\\Test\\Test_labeled.docx`. |

## Build and test the application

Build and test your client application. 

1. Use CTRL-SHIFT-B (**Build Solution**) to build your client application. If you have no build errors, use F5 (**Start debugging**) to run your application.

2. If your project builds and runs successfully, the application *may* prompt for authentication via ADAL each time the SDK calls your `AcquireToken()` method. If cached credentials already exist, you won't be prompted to log on and see the list of labels, followed by the information on the applied label and modified file.

  ```console   
  Personal : 73c47c6a-eb00-4a6a-8e19-efaada66dee6
  Public : 73254501-3d5b-4426-979a-657881dfcb1e
  General : da480625-e536-430a-9a9e-028d16a29c59
  Confidential : 569af77e-61ea-4deb-b7e6-79dc73653959
        Recipients Only (C) : d98c4267-727b-430e-a2d9-4181ca5265b0
        All Employees (C) : 2096f6a2-d2f7-48be-b329-b73aaa526e5d
        Anyone (not protected) (C) : 63a945ec-1131-420d-80da-2fedd15d3bc0
  Highly Confidential : 905845d6-b548-439c-9ce5-73b2e06be157
        Recipients Only : 05ee72d9-1a75-441f-94e2-dca5cacfe012
        All Employees : 922b06ef-044b-44a3-a8aa-df12509d1bfe
        Anyone (not protected) : c83fc820-961d-40d4-ba12-c63f72a970a3
  Press a key to continue.

   Applying Label ID 074e457c-5848-4542-9a6f-34a182080e7z to c:\Test\Test.docx
   Committing changes
   
   Label committed to file: c:\Test\Test_labeled.docx
   Press any key to continue . . .
  
   Getting the label committed to file: c:\Test\Test_labeled.docx
   Name: Confidential
   Id: 074e457c-5848-4542-9a6f-34a182080e7z
   Press any key to continue . . .
   ```

You can verify the application of the label, by opening the output file and visually inspecting the document's information protection settings.

> [!NOTE]
> If you're labeling an Office document, but not signed in using an account from the Azure Active Directory (AD) tenant where the access token was obtained (and sensitivity labels are configured), you may be prompted to sign-in before you can open the labelled document. 
