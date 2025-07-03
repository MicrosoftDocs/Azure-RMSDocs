---
title: How to - Republishing scenario C++
description: This article will help you understand the scenario of how to re-use protection handler for republishing scenarios (C++).
author: msmbaldwin
ms.service: information-protection
ms.topic: quickstart
ms.date: 04/10/2025
ms.author: mbaldwin
ms.custom: mode-api
---

# File SDK Re-publishing Quickstart (C++)

## Overview

For an overview on this scenario and where it may be used, refer to [Republishing in MIP SDK](concept-republishing.md).

## Prerequisites

If you haven't already, be sure to complete the following prerequisites before continuing:

- Complete [Quickstart: Set/get sensitivity labels(C++)](quick-file-set-get-label-cpp.md) first, which builds a starter Visual Studio solution, to list an organization's sensitivity labels, to set and read sensitivity labels to/from a file. This "How to - Downgrade/Remove a label that needs a justification C++" Quickstart builds on the previous one.
- Optionally: Review [File handlers](concept-handler-file-cpp.md) in the MIP SDK concepts.
- Optionally: Review [Protection handlers](concept-handler-protection-cpp.md) in the MIP SDK concepts.

## Add logic to FileHandler Observer class

To be able to use Decrypt a protected file by using `GetDecryptedTemporaryFileAsync()` method exposed by `mip::FileHandler`, callbacks for the async method for success and failure have to be defined as below.

1. Open the Visual Studio solution you created in the previous "Quickstart: Set/get sensitivity labels(C++).

2. Using Solution Explorer, open the `filehandler_observer.h` file for in your project. Towards the end of FileHandler definition, before `};` add below lines for method declaration.

    ```cpp
        void OnGetDecryptedTemporaryFileSuccess(const std::string& decryptedFilePath, const std::shared_ptr<void>& context) override;
        void OnGetDecryptedTemporaryFileFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context) override;
    ```

3. Using Solution Explorer, open the `filehandler_observer.cpp` file in your project. Towards the end of the file, add below lines for method definitions.

    ```cpp

        void FileHandlerObserver::OnGetDecryptedTemporaryFileSuccess(const std::string& decryptedFilePath, const std::shared_ptr<void>& context) {
        auto promise = std::static_pointer_cast<std::promise<std::string>>(context);
        promise->set_value(decryptedFilePath);
        }

        void FileHandlerObserver::OnGetDecryptedTemporaryFileFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context) {
        auto promise = std::static_pointer_cast<std::promise<std::string>>(context);
        promise->set_exception(error);
        }
    ```

## Add logic to edit and republish a protected file

1. Using Solution Explorer, open the .cpp file in your project that contains the implementation of the `main()` method. It defaults to the same name as the project containing it, which you specified during project creation.

2. Toward the end of the main() body, below system("pause"); and above return 0; (where you left off in the previous Quickstart), insert the following code:

```cpp
//Originally protected file's path.
std::string protectedFilePath = "<protected-file-path>";

// Create file handler for the file
auto handlerPromise = std::make_shared<std::promise<std::shared_ptr<FileHandler>>>();
auto handlerFuture = handlerPromise->get_future();
engine->CreateFileHandlerAsync(protectedFilePath, 
                                protectedFilePath, 
                                true, 
                                std::make_shared<FileHandlerObserver>(), 
                                handlerPromise);
auto protectedFileHandler = handlerFuture.get();

// retieve and store protection handler from file
auto protectionHandler = protectedFileHandler->GetProtection();

//Check if the user has the 'Edit' right to the file and if so decrypt the file.
if (protectionHandler->AccessCheck("Edit")) {

    // Decrypt file to temp path using the same file handler
    auto tempPromise = std::make_shared<std::promise<string>>();
    auto tempFuture = tempPromise->get_future();
    protectedFileHandler->GetDecryptedTemporaryFileAsync(tempPromise);
    auto tempPath = tempFuture.get();

    /// Write code here to perform further operations for edit ///

    /// Follow steps below for re-protecting the edited file ///

    // Create a new file handler using the temporary file path.
    auto reprotectPromise = std::make_shared<std::promise<std::shared_ptr<FileHandler>>>();
    auto reprotectFuture = reprotectPromise->get_future();
    engine->CreateFileHandlerAsync(tempPath, 
                                    tempPath, 
                                    true, 
                                    std::make_shared<FileHandlerObserver>(), 
                                    reprotectPromise);
    auto republishHandler = reprotectFuture.get();

    // Set protection using the ProtectionHandler from the original consumption operation.
    republishHandler->SetProtection(protectionHandler);
    std::string reprotectedFilePath = "<protected-file-path>";

    // Commit changes
    auto republishPromise = std::make_shared<std::promise<bool>>();
    auto republishFuture = republishPromise->get_future();
    republishHandler->CommitAsync(reprotectedFilePath, republishPromise);

    // Validate republishing
    cout << "Protected File: " + protectedFilePath<<endl;
    cout << "Protected Label ID: " + protectedFileHandler->GetLabel()->GetLabel()->GetId() << endl;
    cout << "Protection Owner: " + protectedFileHandler->GetProtection()->GetOwner() << endl<<endl;

    cout << "Republished File: " + reprotectedFilePath<<endl;
    cout << "Republished Label ID: " + republishHandler->GetLabel()->GetLabel()->GetId() << endl;
    cout << "Republished Owner: " + republishHandler->GetProtection()->GetOwner() << endl;
}
```

3. Towards the end of Main() find the application shutdown block created in previous quickstart and add below handler lines to release resources.

    ````csharp
        protectedFileHandler = nullptr;
        protectionHandler = nullptr;

    ````

4. Replace the placeholder values in the source code using the following values:

   | Placeholder | Value |
   |:----------- |:----- |
   | \<protected-file-path\> | Protected file from previous quickstart. |
   | \<reprotected-file-path\> | The output file path for modified file to republish. |

## Build and test the application

Build and test your client application.

1. Use CTRL-SHIFT-B (**Build Solution**) to build your client application. If you have no build errors, use F5 (**Start debugging**) to run your application.

2. If your project builds and runs successfully, the application prompts for an access token, each time the SDK calls your `AcquireOAuth2Token()` method. As you did previously in the "Set/get Sensitivity Label" Quickstart, run your PowerShell script to acquire the token each time, using the values provided for $authority and $resourceUrl.

  ```console   
    Sensitivity labels for your organization:
    Non-Business : 87ba5c36-17cf-14793-bbc2-bd5b3a9f95cz
    Public : 83867195-f2b8-2ac2-b0b6-6bb73cb33afz
    General : f42a3342-8706-4288-bd31-ebb85995028z
    Confidential : 074e457c-5848-4542-9a6f-34a182080e7z
    Highly Confidential : f55c2dea-db0f-47cd-8520-a52e1590fb6z
    Press any key to continue . . .

    Applying Label ID 074e457c-5848-4542-9a6f-34a182080e7z to C:\Test\Test.docx
    Committing changes
    
    Label committed to file: C:\Test\Test_labeled.docx
    Press any key to continue . . .

    Run the PowerShell script to generate an access token using the following values, then copy/paste it below:
    Set $authority to: https://login.windows.net/37f4583d-9985-4e7f-a1ab-71afd8b55ba0
    Set $resourceUrl to: https://aadrm.com
    Sign in with user account: user1@tenant.onmicrosoft.com
    Enter access token: <paste-access-token-here>
    Press any key to continue . . .

    Getting the label committed to file: C:\Test\Test_labeled.docx
    Name: Confidential
    Id: 074e457c-5848-4542-9a6f-34a182080e7z
    Press any key to continue . . .
    Protected File: C:\Test\Test_labeled.docx
    Protected Label ID: 074e457c-5848-4542-9a6f-34a182080e7z
    Protection Owner: user1@tenant.onmicrosoft.com

    Republished File: c:\Test\Test_republished.docx
    Republished Label ID: 074e457c-5848-4542-9a6f-34a182080e7z
    Republished Owner: user1@tenant.onmicrosoft.com

    Press any key to close this window . . .

   ```
   
