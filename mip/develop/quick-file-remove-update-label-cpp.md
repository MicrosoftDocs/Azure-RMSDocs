---
title: Quickstart - Remove or update a sensitivity label on a file using the C++ MIP SDK
description: A quickstart showing you how to use the Microsoft Information Protection C++ SDK to remove or update a sensitivity label on a file.
services: information-protection
author: BryanLa
ms.service: information-protection
ms.topic: quickstart
ms.date: 09/27/2018
ms.author: bryanla
---

# Quickstart: Set and get a sensitivity label (C++)

This Quickstart shows you how to use more of the MIP File APIs. Using one of the sensitivity labels you listed in the previous Quickstart, you use a File handler to set/get the label on a file. The File handler class exposes various operations for setting/getting labels, or protection, for supported file types.

## Prerequisites

If you haven't already, be sure to complete the following prerequisites before continuing:

- Complete [Quickstart: List sensitivity labels (C++)](quick-file-list-labels-cpp.md) first, which builds a starter Visual Studio solution, to list an organization's sensitivity labels. This "Set and get a sensitivity label" Quickstart builds on the previous one.
- Complete [Quickstart: Set and get a sensitivity label (C++)](quick-file-set-get-label-cpp.md)
- Optionally: Review [File handlers in the MIP SDK](concept-handler-file-cpp.md) concepts.

## Add logic to set and get a sensitivity label

Add logic to set and get a sensitivity label on a file, using the File engine object. 

1. Using **Solution Explorer**, open the .cpp file in your project that contains the implementation of the `main()` method. It defaults to the same name as the project containing it, which you specified during project creation. 

2. Add the following `#include` and `using` directives, below the corresponding existing directives, at the top of the file:

   ```cpp
   #include "filehandler_observer.h" 
   #include "mip/file/file_handler.h" 

   using mip::FileHandler;
   ```
3. Toward the end of the `main()` body, below `system("pause");` and above `return 0;` (where you left off in the previous Quickstart), insert the following code:

   ```cpp
   // Set up async FileHandler for input file operations
   string filePathIn = "<input-file-path>";
   std::shared_ptr<FileHandler> handler;
   try
   {
        auto handlerPromise = std::make_shared<std::promise<std::shared_ptr<FileHandler>>>();
        auto handlerFuture = handlerPromise->get_future();
        engine->CreateFileHandlerAsync(filePathIn, mip::ContentState::REST, std::make_shared<FileHandlerObserver>(), handlerPromise);
        handler = handlerFuture.get();
   }
   catch (const std::exception& e)
   {
        cout << "An exception occurred... did you specify a valid input file path?\n\n" << e.what() << "'\n";
        system("pause");
        return 1;
   }

   // Set a label on input file
   try
   {
        string labelId = "<label-id>";
        cout << "\nApplying Label ID " << labelId << " to " << filePathIn << endl;
        mip::LabelingOptions labelingOptions(mip::AssignmentMethod::PRIVILEGED, mip::ActionSource::MANUAL);
        handler->SetLabel(labelId, labelingOptions);
   }
   catch (const std::exception& e)
   {
        cout << "An exception occurred... did you specify a valid label ID?\n\n" << e.what() << "'\n";
        system("pause");
        return 1;
   }

   // Commit changes, save as a different/output file
   string filePathOut = "<output-file-path>";
   try
   {
   		cout << "Committing changes" << endl;
        auto commitPromise = std::make_shared<std::promise<bool>>();
        auto commitFuture = commitPromise->get_future();
        handler->CommitAsync(filePathOut, commitPromise);
		if (commitFuture.get()) {
			cout << "\nLabel committed to file: " << filePathOut << endl;
		}
		else {
			cout << "Failed to label: " + filePathOut << endl;
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
   try
   {
        auto handlerPromise = std::make_shared<std::promise<std::shared_ptr<FileHandler>>>();
        auto handlerFuture = handlerPromise->get_future();
        engine->CreateFileHandlerAsync(filePathOut, mip::ContentState::REST, std::make_shared<FileHandlerObserver>(), handlerPromise);
        handler = handlerFuture.get();
   }
   catch (const std::exception& e)
   {
        cout << "An exception occurred... did you specify a valid output file path?\n\n" << e.what() << "'\n";
        system("pause");
        return 1;
   }

   // Get the label from output file
   try
   {
        cout << "\nGetting the label committed to file: " << filePathOut << endl;
        auto label = handler->GetLabel();
        cout << "Name: " + label->GetLabel()->GetName() << endl;
        cout << "Id: " + label->GetLabel()->GetId() << endl;
   }
   catch (const std::exception& e)
   {
        cout << "An exception occurred... did you specify a valid label ID?\n\n" << e.what() << "'\n";
        system("pause");
        return 1;
   }
   system("pause");
   ```

4. Replace the placeholder values in the source code that you just pasted in, using the following values:

   | Placeholder | Value |
   |:----------- |:----- |
   | \<input-file-path\> | The full path to a test input file, for example: `c:\\Test\\Test.docx`. |
   | \<label-id\> | A sensitivity label ID, copied from the console output in the previous Quickstart, for example: `f42a3342-8706-4288-bd31-ebb85995028z`. |
   | \<output-file-path\> | The full path to the output file, which will be a labeled copy of the input file, for example: `c:\\Test\\Test_labeled.docx`. |

## Build and test the application

Build and test your client application. 

1. Use F6 (**Build Solution**) to build your client application. If you have no build errors, use F5 (**Start debugging**) to run your application.

2. If your project builds and runs successfully, the application will prompt for an access token, each time the SDK calls your `AcquireOAuth2Token()` method. As you did previously in the "List sensitivity labels" Quickstart, run your PowerShell script to acquire the token each time, using the values provided. `AcquireOAuth2Token()` will attempt to use a previously generated token, if the requested authority and resource are the same:

   ```console
   Run the PowerShell script to generate an access token using the following values, then copy/paste it below:
   Set $authority to: https://login.windows.net/common/oauth2/authorize
   Set $resourceUrl to: https://syncservice.o365syncservice.com/
   Sign in with user account: user1@tenant.onmicrosoft.com
   Enter access token: <paste-access-token-here>
   Press any key to continue . . .

   Sensitivity labels for your organization:
   Non-Business : 87ba5c36-17cf-14793-bbc2-bd5b3a9f95cz
   Public : 83867195-f2b8-2ac2-b0b6-6bb73cb33afz
   General : f42a3342-8706-4288-bd31-ebb85995028z
   Confidential : 074e457c-5848-4542-9a6f-34a182080e7z
   Highly Confidential : f55c2dea-db0f-47cd-8520-a52e1590fb6z
   Press any key to continue . . .

   Applying Label ID 074e457c-5848-4542-9a6f-34a182080e7z to c:\Test\Test.docx
   Committing changes

   Run the PowerShell script to generate an access token using the following values, then copy/paste it below:
   Set $authority to: https://login.windows.net/common/oauth2/authorize
   Set $resourceUrl to: https://aadrm.com
   Sign in with user account: user1@tenant.onmicrosoft.com
   Enter access token: <paste-access-token-here>
   Press any key to continue . . .

   Label committed to file: c:\Test\Test_labeled.docx
   Press any key to continue . . .

   Run the PowerShell script to generate an access token using the following values, then copy/paste it below:
   Set $authority to: https://login.windows.net/94f69844-8d34-4794-bde4-3ac89ad2b664/oauth2/authorize
   Set $resourceUrl to: https://aadrm.com
   Sign in with user account: user1@tenant.onmicrosoft.com
   Enter access token: <paste-access-token-here>
   Press any key to continue . . .

   Getting the label committed to file: c:\Test\Test_labeled.docx
   Name: Confidential
   Id: 074e457c-5848-4542-9a6f-34a182080e7z
   Press any key to continue . . .
   ```

You can verify the application of the label, by opening the output file and visually inspecting the document's information protection settings.

> [!NOTE]
> If you're labeling an Office document, but not signed in using an account from the Azure Active Directory (AD) tenant where the access token was obtained (and sensitivity labels are configured), you may be prompted to sign-in before you can open the labelled document. 



