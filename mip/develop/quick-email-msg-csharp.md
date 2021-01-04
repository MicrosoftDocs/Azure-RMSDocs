---
title: File API - Process email .msg files (C#)
description: This article will help you understand the scenario of how to use MIP SDK file API to process .msg files (C#).
author: msmbaldwin
ms.service: information-protection
ms.topic: quickstart
ms.date: 04/08/2020
ms.author: mbaldwin
---

# File API - Process email .msg files (C#)

File API supports protection operations for .msg files in a manner identical to any other file type, except that the SDK needs the application to enable MSG feature flag. Here, we'll see how to set this flag.

As discussed previously, instantiation of `IFileEngine` requires a setting object, `FileEngineSettings`. FileEngineSettings can be used to pass parameters for custom settings the application needs to set for a particular instance. `CustomSettings` property of the `FileEngineSettings` is used to set the flag for `enable_msg_file_type` to enable processing of .msg files.

## Prerequisites

If you haven't already, be sure to complete the following prerequisites before continuing:

- Complete [Quickstart: File API application initialization (C#)](quick-app-initialization-csharp.md) first, which builds a starter Visual Studio solution. This "How to - process email message .msg files (C#)" quickstart builds on the previous one.
- Review [Email files MIP SDK](concept-email.md) concepts.
- Optionally: Review [File engines in the MIP SDK](concept-profile-engine-file-engine-cpp.md) concepts.
- Optionally: Review [File handlers in the MIP SDK](concept-handler-file-cpp.md) concepts.

## Set enable_msg_file_type and use File API for protecting .msg file

In continuation of File AI application initialization quickstart, modify the file engine construction code to set `enable_msg_file_type flag` and then use the file engine to protect a .msg file.

1. Open the Visual Studio solution you created in the previous "Quickstart: File API application initialization (C#)".

2. Using Solution Explorer, open the .cs file in your project that contains the implementation of the `Main()` method. It defaults to the same name as the project containing it, which you specified during project creation.

3. Remove the implementation of `Main()` function from previous quickstart. Inside the `Main()` body, insert the following code. In below code block `enable_msg_file_type` flag is set during file engine creation, a .msg file can then be processed by `IFileHandler` objects created using the file engine.

    ```csharp
    static void Main(string[] args)
    {
        // Initialize Wrapper for File API operations.
        MIP.Initialize(MipComponent.File);

        // Create ApplicationInfo, setting the clientID from Azure AD App Registration as the ApplicationId.
        ApplicationInfo appInfo = new ApplicationInfo()
        {
                ApplicationId = clientId,
                ApplicationName = appName,
                ApplicationVersion = "1.0.0"
        };

        // Instantiate the AuthDelegateImpl object, passing in AppInfo.
        AuthDelegateImplementation authDelegate = new AuthDelegateImplementation(appInfo);

        MipContext mipContext = MIP.CreateMipContext(appInfo,"mip_data",LogLevel.Trace,null,null);

        // Initialize and instantiate the File Profile.
        // Create the FileProfileSettings object.
        // Initialize file profile settings to create/use local state.
        var profileSettings = new FileProfileSettings(mipContext, 
                                    CacheStorageType.OnDiskEncrypted, 
                                    new ConsentDelegateImplementation());

        // Load the Profile async and wait for the result.
        var fileProfile = Task.Run(async () => await MIP.LoadFileProfileAsync(profileSettings)).Result;

        // Create a FileEngineSettings object, then use that to add an engine to the profile.
        var customSettings = new List<KeyValuePair<string, string>>();
        customSettings.Add(new KeyValuePair<string, string>("enable_msg_file_type", "true"));

        // Create a FileEngineSettings object, then use that to add an engine to the profile.
        var engineSettings = new FileEngineSettings("user1@tenant.com", authDelegate, "", "en-US");
        engineSettings.Identity = new Identity("user1@tenant.com");
        //set custom settings for the engine
        engineSettings.CustomSettings = customSettings;

        //Add fileEngine to profile
        var fileEngine = Task.Run(async () => await fileProfile.AddEngineAsync(engineSettings)).Result;

        //Set file paths
        string inputFilePath = "<input-file-path>"; //.msg file to be protected
        string actualFilePath = inputFilePath;
        string outputFilePath = "<output-file-path>"; //protected .msg file
        string actualOutputFilePath = outputFilePath;

        //Create a file handler for original file
        var fileHandler = Task.Run(async () => await fileEngine.CreateFileHandlerAsync(inputFilePath, 
                                                                    actualFilePath, 
                                                                    true)).Result;

        // List templates available to the user and use one of them to protect the mail file.

            /// Listing of protection templates has to be performed by creating protection engine as described in protection quick start

        string templateId = "<template-id>"; //protection template retrieved using protection engine

        // Construct a protection descriptor on input file and use the same to set protection to the file
        ProtectionDescriptor descriptor = new ProtectionDescriptor(templateId);
        fileHandler.SetProtection(descriptor, new ProtectionSettings());

        // Commit changes, save as outputFilePath
        var result = Task.Run(async () => await fileHandler.CommitAsync(outputFilePath)).Result;

        // Create a new handler to read the protected file metadata
        var handlerModified = Task.Run(async () => await fileEngine.CreateFileHandlerAsync(outputFilePath, 
                                                                        actualOutputFilePath, 
                                                                        true)).Result;

        Console.WriteLine(string.Format("Original file: {0}", inputFilePath));
        Console.WriteLine(string.Format("Protected file: {0}", outputFilePath));
        Console.WriteLine(string.Format("TemplateID applied to file: {0} \r\nProtectionOwner: {1}", 
            handlerModified.Protection.ProtectionDescriptor.TemplateId,handlerModified.Protection.Owner));
        Console.WriteLine("Press a key to continue.");
        Console.ReadKey();

        // Application Shutdown
        fileHandler = null;
        handlerModified = null;
        fileEngine = null;
        fileProfile = null;
        mipContext = null;
    }

    ```

    For further details on file operations refer to the [File Handler concepts](concept-handler-file-cpp.md).

4. Replace the placeholder values in the source code using the following values:

   | Placeholder | Value |
   |:----------- |:----- |
   | \<input-file-path\> | The full path to a test input message file, for example: `c:\\Test\\message.msg`. |
   | \<output-file-path\> | The full path to the output file, which will be a labeled copy of the input file, for example: `c:\\Test\\message_protected.msg`. |
   | \<template-id\> | The templateId retrieved using protection engine, for example: `667466bf-a01b-4b0a-8bbf-a79a3d96f720`. |

## Build and test the application

Use **F6** (Build Solution) to build your client application. If you have no build errors, use **F5** (Start debugging) to run your application.

```Console
    Original file: C:\Test.msg
    Protected file: C:\Test_protected.msg
    TemplateID applied to file: 667466bf-a01b-4b0a-8bbf-a79a3d96f720
    ProtectionOwner: user1@tenant.com
    Press a key to continue.
```

## Troubleshooting

### Problems during execution of C# application

| Summary | Error message | Solution |
|---------|---------------|----------|
| NetworkException: RMS service detected bad input in request. RMS error code: Microsoft.RightsManagement.Exceptions.BadInputException | * Parameters are invalid if both TemplateID and Policy are null., CorrelationId=f265b189-ebf6-4b30-a191-41539cdff215, CorrelationId.Description=FileHandler, HttpRequest.Id=04990d53-cf12-4969-9c80-06e365b312f2;d5fb4794-ac84-4445-abc6-647e41df62b2, HttpRequest.SanitizedUrl=https://api.aadrm.com/my/v2/publishinglicenses, HttpResponse.StatusCode=400, NetworkError.Category=FailureResponseCode* | If your project builds successfully, but you see output similar to the left, you likely have an invalid templateID. Go back to code block and correct protection template ID, and rebuild/retest. |
| TemplateNotFoundException | *Unrecognized template ID., CorrelationId=abb2ef59-ad09-4aa0-b731-f59a92711dad, CorrelationId.Description=FileHandler, HttpRequest.Id=8c688752-ccd2-4dca-ace3-b67b44176689;78538a57-a9fd-4717-8924-33581a04598b* | If your project builds successfully, but you see output similar to the left, you likely have an invalid templateID. Go back to code block and correct protection template ID, and rebuild/retest. |
