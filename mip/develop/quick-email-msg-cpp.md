---
title: File API - Process email .msg files (C++)
description: This article will help you understand the scenario of how to use MIP SDK file API to process .msg files (C++).
author: msmbaldwin
ms.service: information-protection
ms.topic: quickstart
ms.date: 04/08/2020
ms.author: mbaldwin
---

# File API - Process email .msg files (C++)

File API supports protection operations for .msg files in a manner identical to any other file type, except that the SDK needs the application to enable MSG feature flag. Here, we'll see how to set this flag.

As discussed previously, instantiation of `mip::FileEngine` requires a setting object, `mip::FileEngineSettings`. FileEngineSettings can be used to pass parameters for custom settings the application needs to set for a particular instance. `CustomSettings` property of the `mip::FileEngineSettings` is used to set the flag for `enable_msg_file_type` to enable processing of .msg files.

## Prerequisites

If you haven't already, be sure to complete the following prerequisites before continuing:

- Complete [Quickstart: File API application initialization (C++)](quick-app-initialization-cpp.md) first, which builds a starter Visual Studio solution. This "How to - process email message .msg files (C++)" quickstart builds on the previous one.
- Review [Quickstart: List sensitivity labels (C++)](quick-file-list-labels-cpp.md).
- Review [Quickstart: Set/get sensitivity labels (C++)](quick-file-set-get-label-cpp.md).
- Review [Email files MIP SDK](concept-email.md) concepts.
- Optionally: Review [File engines in the MIP SDK](concept-profile-engine-file-engine-cpp.md) concepts.
- Optionally: Review [File handlers in the MIP SDK](concept-handler-file-cpp.md) concepts.

## Prerequisite implementation steps

1. Open the Visual Studio solution you created in the previous "Quickstart: Client application initialization (C++)" article.

2. Create a PowerShell script to generate access tokens as explained in Quickstart "[List sensitivity labels (C++)](quick-file-list-labels-cpp.md#create-a-powershell-script-to-generate-access-tokens)".

3. Implement observer class to monitor `mip::FileHandler` as explained in Quickstart "[Set/get sensitivity labels (C++)](quick-file-set-get-label-cpp.md#implement-an-observer-class-to-monitor-the-file-handler-object)".

## Set enable_msg_file_type and use File API to protect .msg file

Add the file engine construction code below to set `enable_msg_file_type flag` and use the file engine to protect a .msg file.

1. Using *Solution Explorer*, open the .cpp file in your project that contains the implementation of the `main()` method. It defaults to the same name as the project containing it, which you specified during project creation.

2. Add the following #include and using directives, below the corresponding existing directives, at the top of the file:

    ```cpp
    #include "filehandler_observer.h" 
    #include "mip/file/file_handler.h" 
    #include <iostream>
    #include "mip/protection/protection_descriptor_builder.h"
    #include "mip/protection_descriptor.h"
    using mip::FileHandler;
    using mip::ProtectionDescriptor;
    using mip::ProtectionDescriptorBuilder;
    using mip::ProtectionSettings;
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

    auto mipContext = mip::MipContext::Create(appInfo,
                                                "file_sample",
                                                mip::LogLevel::Trace,
                                                false,
                                                nullptr /*loggerDelegateOverride*/,
                                                nullptr /*telemetryOverride*/);

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

    //Set enamble_msg_file_type flag as true
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
    string inputFilePath = "<input-file-path>"; //.msg file to be protected
    string actualFilePath = inputFilePath;
    string outputFilePath = "<output-file-path>"; //protected .msg file
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

    //List templates available to the user and use one of them to protect the mail file.

    ///Listing of protection templates must be performed by creating protection engine as described in protection quick start

    string templateId = "<template-id>"; //protection template retrieved using protection engine

    //Create a protection descriptor using templateID and use it to set protection to the file
    auto descriptorBuilder = mip::ProtectionDescriptorBuilder::CreateFromTemplate(templateId);
    const std::shared_ptr<mip::ProtectionDescriptor>& descriptor = descriptorBuilder->Build();
    fileHandler->SetProtection(descriptor, ProtectionSettings());

    // Commit changes, save as outputFilePath
    auto commitPromise = std::make_shared<std::promise<bool>>();
    auto commitFuture = commitPromise->get_future();
    fileHandler->CommitAsync(outputFilePath, commitPromise);
    if (commitFuture.get()) {
        cout << "\n Protection applied to file: " << outputFilePath << endl;
    }
    else {
        cout << "Failed to protect: " + outputFilePath << endl;
        return 1;
    }

    // Create a new handler to read the protected file metadata
    auto protectedHandlerPromise = std::make_shared<std::promise<std::shared_ptr<FileHandler>>>();
    auto protectedHandlerFuture = protectedHandlerPromise->get_future();
    engine->CreateFileHandlerAsync(outputFilePath, 
                                   actualOutputFilePath, 
                                   true, 
                                   std::make_shared<FileHandlerObserver>(), 
                                   protectedHandlerPromise);

    auto protectedFileHandler = protectedHandlerFuture.get();

    cout << "Original file: " << inputFilePath << endl;
    cout << "Protected file: " << outputFilePath << endl;
    cout << "TemplateID applied to protected file : " 
            << protectedFileHandler->GetProtection()->GetProtectionDescriptor()->GetTemplateId() 
            << endl;
    cout << "Protection Owner of protected file : " 
            << protectedFileHandler->GetProtection()->GetProtectionDescriptor()->GetOwner() 
            << endl;

    // Application shutdown. Null out profile and engine, call ReleaseAllResources();
    // Application may crash at shutdown if resources aren't properly released.
    protectedFileHandler = nullptr;
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
   | \<application-id\> | The application ID as registered with Azure AD tenant, for example: `0edbblll-8773-44de-b87c-b8c6276d41eb`. |
   | \<engine-account\> | The account used for engine's identity, for example: `user@tenant.onmicrosoft.com`. |
   | \<engine-state\> | User defined application state, for example: `My engine state`. |
   | \<input-file-path\> | The full path to a test input message file, for example: `c:\\Test\\message.msg`. |
   | \<output-file-path\> | The full path to the output file, which will be a labeled copy of the input file, for example: `c:\\Test\\message_protected.msg`. |
   | \<template-id\> | The templateId retrieved using protection engine, for example: `667466bf-a01b-4b0a-8bbf-a79a3d96f720`. |

## Build and test the application

Use **F6** (Build Solution) to build your client application. If you have no build errors, use **F5** (Start debugging) to run your application.

## Troubleshooting

### Problems during execution of C# application

| Summary | Error message | Solution |
|---------|---------------|----------|
| TemplateNotFoundException | Unrecognized template ID., CorrelationId=abb2ef59-ad09-4aa0-b731-f59a92711dad, CorrelationId.Description=FileHandler, HttpRequest.Id=8c688752-ccd2-4dca-ace3-b67b44176689;78538a57-a9fd-4717-8924-33581a04598b| If your project builds successfully, but you see output similar to the left, you likely have an invalid templateID. Go back to code block and correct protection template ID, and rebuild/retest. |