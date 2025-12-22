---
title: How to - Downgrade/Remove a label that needs a justification (C++)
description: This quickstart describes the steps to downgrade label operation when the label policy requires justification
author: msmbaldwin
ms.service: azure-information-protection
ms.topic: quickstart
ms.date: 04/10/2025
ms.author: mbaldwin
ms.custom: mode-api
---

# Microsoft Information Protection File SDK - Action Justification for lowering a sensitivity label on a file (C++)

This quickstart addresses handling of a downgrade label operation when the label policy requires justification. Here, we will use `mip::FileHandler` class for changing the labels of a file. For further details consult [Microsoft Information Protection (MIP) SDK for C++: Reference](https://microsoftdocs.github.io/mip-sdk-docs/cpp).

## Prerequisites

If you haven't already, be sure to complete the following prerequisites before continuing:

- Complete [Quickstart: Set/get sensitivity labels(C++)](quick-file-set-get-label-cpp.md) first, which builds a starter Visual Studio solution, to list an organization's sensitivity labels, to set and read sensitivity labels to/from a file. This "How to - Downgrade/Remove a label that needs a justification (C++)" Quickstart builds on the previous one.
- Optionally: Review [File handlers concepts](concept-handler-file-cpp.md) in the MIP SDK concepts.

## Add logic to set a lower label to a protected file

Add logic to set a sensitivity label on a file, using the `mip::FileHandler` object.

1. Open the Visual Studio solution you created in the previous [Quickstart: Set/get sensitivity labels(C++)](quick-file-set-get-label-cpp.md).

2. Using Solution Explorer, open the .cpp file in your project that contains the implementation of the `main()` method. It defaults to the same name as the project containing it, which you specified during project creation.

3. Add the following #include and using directives, below the corresponding existing directives, at the top of the file:

    ```cpp

        #include "mip/file/file_error.h"

        using mip::JustificationRequiredError;
        using std::cin;

    ```

4. Update the `<label-id>` value from previous quickstart to a sensitivity label which requires justification for lowering. During this quickstart run, we'll set this label first and then try to lower it via code snippets in further steps.

5. Toward the end of the `main()` body, below `system("pause");` and above shutdown block (where you left off in the previous Quickstart), insert the following code:

```cpp

// Downgrade label
// Set paths and lower label ID
// Set a new label on input file.

string lowerlabelId = "<lower-label-id>";
cout << "\nApplying new Label ID " << lowerlabelId << " to " << filePathOut << endl;
mip::LabelingOptions labelingOptions(mip::AssignmentMethod::PRIVILEGED);

// Try to apply a label with lower sensitivity.
try
{
    handler->SetLabel(engine->GetLabelById(lowerlabelId), labelingOptions, mip::ProtectionSettings());
}

catch (const mip::JustificationRequiredError& e)
{
    // Request justification from user.
    cout<<"Please provide justification for downgrading a label: "<<endl;
    string justification;
    cin >> justification;

    // Set Justification provided flag
    bool isDowngradeJustified = true;
    mip::LabelingOptions labelingOptions(mip::AssignmentMethod::PRIVILEGED);
    labelingOptions.SetDowngradeJustification(isDowngradeJustified,justification);

    //Set new label.
    handler->SetLabel(engine->GetLabelById(lowerlabelId), labelingOptions, mip::ProtectionSettings());
}

catch (const std::exception& e)
{
    cout << "An exception occurred... did you specify a valid label ID?\n\n" << e.what() << "'\n";
    system("pause");
    return 1;
}

// Commit changes, save as a different output file
string lowerFilePathOut = "<lower-output-file-path>";
try
{
    cout << "Committing changes" << endl;
    auto commitPromise = std::make_shared<std::promise<bool>>();
    auto commitFuture = commitPromise->get_future();
    handler->CommitAsync(lowerFilePathOut, commitPromise);
    if (commitFuture.get()) {
        cout << "\nLabel committed to file: " << lowerFilePathOut << endl;
    }
    else {
        cout << "Failed to label: " + lowerFilePathOut << endl;
        return 1;
    }
}
catch (const std::exception& e)
{
    cout << "An exception occurred... did you specify a valid commit file path?\n\n" << e.what() << "'\n";
    system("pause");
    return 1;
}
system("pause");

// Set up async FileHandler for output file operations
string lowerActualFilePath = "<lower-content-identifier>";
try
{
    auto handlerPromise = std::make_shared<std::promise<std::shared_ptr<FileHandler>>>();
    auto handlerFuture = handlerPromise->get_future();
    engine->CreateFileHandlerAsync(
        lowerFilePathOut,
        lowerActualFilePath,
        true,
        std::make_shared<FileHandlerObserver>(),
        handlerPromise);

    handler = handlerFuture.get();
}
catch (const std::exception& e)
{
    cout << "An exception occurred... did you specify a valid output file path?\n\n" << e.what() << "'\n";
    system("pause");
    return 1;
}

// Get the lowered label from output file
try
{
    cout << "\nGetting the label committed to file: " << lowerFilePathOut << endl;
    auto lowerLabel = handler->GetLabel();
    cout << "Name: " + lowerLabel->GetLabel()->GetName() << endl;
    cout << "Id: " + lowerLabel->GetLabel()->GetId() << endl;
}
catch (const std::exception& e)
{
    cout << "An exception occurred... did you specify a valid label ID?\n\n" << e.what() << "'\n";
    system("pause");
    return 1;
}
system("pause");

```

6. Replace the placeholder values in the source code using the following values:

   | Placeholder | Value |
   |:----------- |:----- |
   | \<lower-label-id\> | A label ID, copied from the console output in the previous Quickstart, for example: `bb7ed207-046a-4caf-9826-647cff56b990`. Make sure it has lower sensitivity than the previously protected file label. |
   | \<lower-output-file-path\> | The output file path you want to save modified file to. |
   | \<lower-content-identifier\> | A human-readable identifier for the content. |

## Build and test the application

Build and test your client application.

1. Use CTRL-SHIFT-B (**Build Solution**) to build your client application. If you have no build errors, use F5 (**Start debugging**) to run your application.

2. If your project builds and runs successfully, the application prompts for an access token, each time the SDK calls your `AcquireOAuth2Token()` method. 

  ```console   
    Non-Business : 87ba5c36-17cf-14793-bbc2-bd5b3a9f95cz
    Public : 83867195-f2b8-2ac2-b0b6-6bb73cb33afz
    General : f42a3342-8706-4288-bd31-ebb85995028z
    Confidential : 074e457c-5848-4542-9a6f-34a182080e7z
    Highly Confidential : f55c2dea-db0f-47cd-8520-a52e1590fb6z
    Press any key to continue . . .

    Applying Label ID f55c2dea-db0f-47cd-8520-a52e1590fb6z to c:\Test\Test.docx
    Committing changes


    Label committed to file: c:\Test\Test.docx
    Press any key to continue . . .

    Run the PowerShell script to generate an access token using the following values, then copy/paste it below:
    Set $authority to: https://login.windows.net/37f4583d-9985-4e7f-a1ab-71afd8b55ba0
    Set $resourceUrl to: https://aadrm.com
    Sign in with user account: user1@tenant.onmicrosoft.com
    Enter access token: <paste-access-token-here>
    Press any key to continue . . .

    Getting the label committed to file: c:\Test\Test_labeled.docx
    Name: Highly Confidential
    Id: f55c2dea-db0f-47cd-8520-a52e1590fb6z
    Press any key to continue . . . 

    Applying new Label ID f42a3342-8706-4288-bd31-ebb85995028z to c:\Test\Test_labeled.docx
    Please provide justification for downgrading a label:
    Need for sharing with wider audience.
    Committing changes

    Label committed to file: c:\Test\Test_downgraded.docx
    Press any key to continue . . .

    Getting the label committed to file: c:\Test\Test_downgraded.docx
    Name: General
    Id: f42a3342-8706-4288-bd31-ebb85995028z
    Press any key to continue . . .
   ```

Please note, in case the label being deleted from a file requires a justification as per label policy, similar approach should be followed for `DeleteLabel()` operation. `DeleteLabel()` function throws a `mip::JustificationRequiredError` exception. `isDowngradeJustified` flag should be set to true in exception handling before deleting the label successfully.
