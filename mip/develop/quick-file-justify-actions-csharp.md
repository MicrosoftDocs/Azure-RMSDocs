---
title: How to - Downgrade/Remove a label that needs a justification (C#)
description: This article will help you understand the scenario of how to downgrade or remove a label needing justification (C#).
author: msmbaldwin
ms.service: azure-information-protection
ms.topic: quickstart
ms.date: 04/10/2025
ms.author: mbaldwin
ms.custom: mode-api
---

# Microsoft Information Protection File SDK - Action Justification for lowering a sensitivity label on a file (C#)

This quickstart addresses handling of a downgrade label operation when the label policy requires justification.Here, we will use `IFileHandler` interface for changing the labels of a file. For further details consult [API reference](/dotnet/api/?term=microsoft.informationprotection).

## Prerequisites

If you haven't already, be sure to complete the following prerequisites before continuing:

- Complete [Quickstart: Set/get sensitivity labels(C#)](quick-file-set-get-label-csharp.md) which builds a starter Visual Studio solution to list an organization's sensitivity labels and to set and read sensitivity labels to/from a file. This "How to - Downgrade/Remove a label that needs a justification C#" Quickstart builds on the previous one.
- Optionally: Review [File handlers concepts](concept-handler-file-cpp.md) in the MIP SDK concepts.

## Add logic to set a lower label to a protected file

Add logic to set a sensitivity label on a file, using the File handler object.

1. Open the Visual Studio solution you created in the previous "Quickstart: Set/get sensitivity labels(C#).

2. Using Solution Explorer, open the .cs file in your project that contains the implementation of the `Main()` method. It defaults to the same name as the project containing it, which you specified during project creation.

3. Update the `<label-id>` value from previous quickstart to a sensitivity label which requires justification for lowering. During this quickstart run, we'll set this label first and then try to lower it via code snippets in further steps.

4. Toward the end of the `Main()` body, below `Console.ReadKey()` and above application shutdown block (where you left off in the previous Quickstart), insert the following code.

    ```csharp
    //Set paths and label ID
    string lowerInput = actualOutputFilePath;
    string lowerActualInput = lowerInput;
    string newLabelId = "<new-label-id>";
    string lowerOutput = "<downgraded-labled-output>";
    string lowerActualOutput = lowerOutput;

    //Create a file handler for that file
    var downgradeHandler = Task.Run(async () => await fileEngine.CreateFileHandlerAsync(lowerInput, lowerActualInput, true)).Result;

    //Set Labeling Options
    LabelingOptions options = new LabelingOptions()
    {
        AssignmentMethod = AssignmentMethod.Standard
    };

    try
    {
        //Try to set new label
        downgradeHandler.SetLabel(fileEngine.GetLabelById(newLabelId), options, new ProtectionSettings());
    }

    catch (Microsoft.InformationProtection.Exceptions.JustificationRequiredException)
    {
        //Request justification from user
        Console.Write("Please provide justification for downgrading a label: ");
        string justification = Console.ReadLine();

        options.IsDowngradeJustified = true;
        options.JustificationMessage = justification;

        //Set new label
        downgradeHandler.SetLabel(fileEngine.GetLabelById(newLabelId), options, new ProtectionSettings());
    }

    // Commit changes, save as outputFilePath
    var downgradedResult = Task.Run(async () => await downgradeHandler.CommitAsync(lowerActualOutput)).Result;

    // Create a new handler to read the labeled file metadata
    var commitHandler = Task.Run(async () => await fileEngine.CreateFileHandlerAsync(lowerOutput, lowerActualOutput, true)).Result;

    // Get the label from output file
    var newContentLabel = commitHandler.Label;
    Console.WriteLine(string.Format("Getting the new label committed to file: {0}", lowerOutput));
    Console.WriteLine(string.Format("File Label: {0} \r\nIsProtected: {1}", newContentLabel.Label.Name, newContentLabel.IsProtectionAppliedFromLabel.ToString()));
    Console.WriteLine("Press a key to continue.");
    Console.ReadKey();

    ```

5. Toward the end of Main() find the application shutdown block created in previous quickstart and add below handler lines to release resources.

    ````csharp
    downgradeHandler = null;
    commitHandler = null;
    ````

6. Replace the placeholder values in the source code using the following values:

   | Placeholder | Value |
   |:----------- |:----- |
   | \<downgraded-labled-output\> | The output file path you want to save modified file to. |
   | \<new-label-id\> | A template ID, copied from the console output in the previous Quickstart, for example: `bb7ed207-046a-4caf-9826-647cff56b990`. Make sure it has lower sensitivity than the previously protected file label. |

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

    Getting the label committed to file: c:\Test\Test_labeled.docx
    Name: Confidential
    IsProtected: True
    Press any key to continue . . .

    Please provide justification for downgrading a label: Lower label approved.
    Getting the new label committed to file: c:\Test\Test_downgraded.docx
    File Label: General
    IsProtected: False
    Press a key to continue.
   ```

Please note, similar approach also applies to `DeleteLabel()` operation, in case the label being deleted from a file requires a justification as per label policy.`DeleteLabel()` function throws a `JustificationRequiredException` exception and `IsDowngradeJustified` flag should be set to true in exception handling before deleting a label successfully.
