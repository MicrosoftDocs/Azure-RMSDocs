---
title: File SDK - Process email .msg files (C++)
description: This article will help you understand the scenario of how to use MIP File SDK to process .msg files (C++).
author: msmbaldwin
ms.service: azure-information-protection
ms.topic: quickstart
ms.date: 04/10/2025
ms.author: mbaldwin
ms.custom: mode-api
---

# File SDK - Process email .msg files (C++)

File SDK supports labeling operations for .msg files in a manner identical to any other file type, except that the SDK needs the application to enable MSG feature flag. Here, we'll see how to set this flag.

As discussed previously, instantiation of `mip::FileEngine` requires a setting object, `mip::FileEngineSettings`. FileEngineSettings can be used to pass parameters for custom settings the application needs to set for a particular instance. `CustomSettings` property of the `mip::FileEngineSettings` is used to set the flag for `enable_msg_file_type` to enable processing of .msg files.

## Prerequisites

If you haven't already, be sure to complete the following prerequisites before continuing:

- Complete [Quickstart: File SDK application initialization (C++)](quick-app-initialization-cpp.md) first, which builds a starter Visual Studio solution. This "How to - process email message .msg files (C++)" quickstart builds on the previous one.
- Review [Quickstart: List sensitivity labels (C++)](quick-file-list-labels-cpp.md).
- Review [Quickstart: Set/get sensitivity labels (C++)](quick-file-set-get-label-cpp.md).
- Review [Email files MIP SDK](concept-email.md) concepts.
- Optionally: Review [File engines in the MIP SDK](concept-profile-engine-file-engine-cpp.md) concepts.
- Optionally: Review [File handlers in the MIP SDK](concept-handler-file-cpp.md) concepts.

## Prerequisite implementation steps

1. Open the Visual Studio solution you created in the previous "Quickstart: Client application initialization (C++)" article.

2. Create a PowerShell script to generate access tokens as explained in Quickstart "[List sensitivity labels (C++)](quick-file-list-labels-cpp.md#create-a-powershell-script-to-generate-access-tokens)".

3. Implement observer class to monitor `mip::FileHandler` as explained in Quickstart "[Set/get sensitivity labels (C++)](quick-file-set-get-label-cpp.md#implement-an-observer-class-to-monitor-the-file-handler-object)".

## Set enable_msg_file_type and use File SDK to label .msg file

Add the file engine construction code below to set `enable_msg_file_type flag` and use the file engine to label a .msg file.

1. Using *Solution Explorer*, open the .cpp file in your project that contains the implementation of the `main()` method. It defaults to the same name as the project containing it, which you specified during project creation.

2. Add the following #include and using directives, below the corresponding existing directives, at the top of the file:

    ```cpp
    #include "filehandler_observer.h" 
    #include "mip/file/file_handler.h" 
    #include <iostream>    
    using mip::FileHandler;   
    using std::endl;
    ```

3. Remove the implementation of `main()` function from previous quickstart. Inside the `main()` body, insert the following code. In below code block `enable_msg_file_type` flag is set during file engine creation, a .msg file can then be processed by `mip::FileHandler` objects created using the file engine.

```cpp
int main()
{
    // Construct/initialize objects required by the application's profile object
    ApplicationInfo appInfo { "<application-id>",                    // ApplicationInfo object (App ID, name, version)
                              "<application-name>", 
                              "1.0" 
    };

    std::shared_ptr<mip::MipConfiguration> mipConfiguration = std::make_shared<mip::MipConfiguration>(mAppInfo,
				                                                                                       "mip_data",
                                                                                        			   mip::LogLevel::Trace,
                                                                                                       false);

    std::shared_ptr<mip::MipContext> mMipContext = mip::MipContext::Create(mipConfiguration);

    auto profileObserver = make_shared<ProfileObserver>();                      // Observer object
    auto authDelegateImpl = make_shared<AuthDelegateImpl>("<application-id>");  // Authentication delegate object (App ID)
    auto consentDelegateImpl = make_shared<ConsentDelegateImpl>();              // Consent delegate object

    // Construct/initialize profile object
    FileProfile::Settings profileSettings(mipContext,mip::CacheStorageType::OnDisk,authDelegateImpl,
        consentDelegateImpl,profileObserver);

    // Set up promise/future connection for async profile operations; load profile asynchronously
    auto profilePromise = make_shared<promise<shared_ptr<FileProfile>>>();
    auto profileFuture = profilePromise->get_future();
    try
    {
        mip::FileProfile::LoadAsync(profileSettings, profilePromise);
    }
    catch (const std::exception& e)
    {
        std::cout << "An exception occurred. Are the Settings and ApplicationInfo objects populated correctly?\n\n"<< e.what() << "'\n";
        system("pause");
        return 1;
    }

    auto profile = profileFuture.get();

    // Construct/initialize engine object
    FileEngine::Settings engineSettings(
                            mip::Identity("<engine-account>"),      // Engine identity (account used for authentication)
                            "<engine-state>",                       // User-defined engine state
                            "en-US");                               // Locale (default = en-US)

    //Set enable_msg_file_type flag as true
    std::vector<std::pair<string, string>> customSettings;
    customSettings.emplace_back(mip::GetCustomSettingEnableMsgFileType(), "true");
    engineSettings.SetCustomSettings(customSettings);

    // Set up promise/future connection for async engine operations; add engine to profile asynchronously
    auto enginePromise = make_shared<promise<shared_ptr<FileEngine>>>();
    auto engineFuture = enginePromise->get_future();
    profile->AddEngineAsync(engineSettings, enginePromise);
    std::shared_ptr<FileEngine> engine;

    try
    {
        engine = engineFuture.get();
    }
    catch (const std::exception& e)
    {
        cout << "An exception occurred... is the access token incorrect/expired?\n\n"<< e.what() << "'\n";
        system("pause");
        return 1;
    }

    //Set file paths
    string inputFilePath = "<input-file-path>"; //.msg file to be labeled
    string actualFilePath = inputFilePath;
    string outputFilePath = "<output-file-path>"; //labeled .msg file
    string actualOutputFilePath = outputFilePath;

    //Create a file handler for original file
    auto handlerPromise = std::make_shared<std::promise<std::shared_ptr<FileHandler>>>();
    auto handlerFuture = handlerPromise->get_future();

    engine->CreateFileHandlerAsync(inputFilePath,
                                    actualFilePath,
                                    true,
                                    std::make_shared<FileHandlerObserver>(),
                                    handlerPromise);

    auto fileHandler = handlerFuture.get();

    //List labels available to the user    

    // Use mip::FileEngine to list all labels
    labels = mEngine->ListSensitivityLabels();

    // Iterate through each label, first listing details
    for (const auto& label : labels) {
        cout << label->GetName() << " : " << label->GetId() << endl;

        // get all children for mip::Label and list details
        for (const auto& child : label->GetChildren()) {
            cout << "->  " << child->GetName() << " : " << child->GetId() << endl;
        }
    }

    string labelId = "<labelId-id>"; //set a label ID to use

    // Labeling requires a mip::LabelingOptions object. 
    // Review API ref for more details. The sample implies that the file was labeled manually by a user.
    mip::LabelingOptions labelingOptions(mip::AssignmentMethod::PRIVILEGED);

    fileHandler->SetLabel(labelId, labelingOptions, mip::ProtectionSettings());

    // Commit changes, save as outputFilePath
    auto commitPromise = std::make_shared<std::promise<bool>>();
    auto commitFuture = commitPromise->get_future();

    if(fileHandler->IsModified())
    {
        fileHandler->CommitAsync(outputFilePath, commitPromise);
    }
    
    if (commitFuture.get()) {
        cout << "\n Label applied to file: " << outputFilePath << endl;
    }
    else {
        cout << "Failed to label: " + outputFilePath << endl;
        return 1;
    }

    // Create a new handler to read the label
    auto msgHandlerPromise = std::make_shared<std::promise<std::shared_ptr<FileHandler>>>();
    auto msgHandlerFuture = handlerPromise->get_future();

    engine->CreateFileHandlerAsync(inputFilePath,
                                    actualFilePath,
                                    true,
                                    std::make_shared<FileHandlerObserver>(),
                                    msgHandlerPromise);

    auto msgFileHandler = msgHandlerFuture.get();

    cout << "Original file: " << inputFilePath << endl;
    cout << "Labeled file: " << outputFilePath << endl;
    cout << "Label applied to file : " 
            << msgFileHandler->GetName() 
            << endl;
    
    // Application shutdown. Null out profile, engine, handler.
    // Application may crash at shutdown if resources aren't properly released.
    msgFileHandler = nullptr;
    fileHandler = nullptr;
    engine = nullptr;
    profile = nullptr;
    mipContext = nullptr;

    return 0;
}
```

For further details on file operations refer to the [File Handler concepts](concept-handler-file-cpp.md).

4. Replace the placeholder values in the source code using the following values:

   | Placeholder | Value |
   |:----------- |:----- |
   | \<application-id\> | The application ID as registered with Microsoft Entra tenant, for example: `0edbblll-8773-44de-b87c-b8c6276d41eb`. |
   | \<engine-account\> | The account used for engine's identity, for example: `user@tenant.onmicrosoft.com`. |
   | \<engine-state\> | User defined application state, for example: `My engine state`. |
   | \<input-file-path\> | The full path to a test input message file, for example: `c:\\Test\\message.msg`. |
   | \<output-file-path\> | The full path to the output file, which will be a labeled copy of the input file, for example: `c:\\Test\\message_labeled.msg`. |
   | \<label-id\> | The labelId retrieved using `ListSensitivityLabels`, for example: `667466bf-a01b-4b0a-8bbf-a79a3d96f720`. |

## Build and test the application

Use **F6** (Build Solution) to build your client application. If you have no build errors, use **F5** (Start debugging) to run your application.
