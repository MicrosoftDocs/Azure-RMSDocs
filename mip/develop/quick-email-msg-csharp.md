---
title: File SDK - Process email .msg files (C#)
description: This article will help you understand the scenario of how to use MIP File SDK to process .msg files (C#).
author: msmbaldwin
ms.service: information-protection
ms.topic: quickstart
ms.date: 04/10/2025
ms.author: mbaldwin
ms.custom: mode-api
---

# File SDK - Process email .msg files (C#)

File SDK supports labeling operations for .msg files in a manner identical to any other file type, except that the SDK needs the application to enable MSG feature flag. Here, we'll see how to set this flag.

As discussed previously, instantiation of `IFileEngine` requires a setting object, `FileEngineSettings`. FileEngineSettings can be used to pass parameters for custom settings the application needs to set for a particular instance. `CustomSettings` property of the `FileEngineSettings` is used to set the flag for `enable_msg_file_type` to enable processing of .msg files.

## Prerequisites

If you haven't already, be sure to complete the following prerequisites before continuing:

- Complete [Quickstart: File SDK application initialization (C#)](quick-app-initialization-csharp.md) first, which builds a starter Visual Studio solution. This "How to - process email message .msg files (C#)" quickstart builds on the previous one.
- Review [Email files MIP SDK](concept-email.md) concepts.
- Optionally: Review [File engines in the MIP SDK](concept-profile-engine-file-engine-cpp.md) concepts.
- Optionally: Review [File handlers in the MIP SDK](concept-handler-file-cpp.md) concepts.

## Set enable_msg_file_type and use File SDK for labeling .msg file

In continuation of File API application initialization quickstart, modify the file engine construction code to set `enable_msg_file_type flag` and then use the file engine to label a .msg file.

1. Open the Visual Studio solution you created in the previous "Quickstart: File SDK application initialization (C#)".

2. Using Solution Explorer, open the .cs file in your project that contains the implementation of the `Main()` method. It defaults to the same name as the project containing it, which you specified during project creation.

3. Remove the implementation of `Main()` function from previous quickstart. Inside the `Main()` body, insert the following code. In below code block `enable_msg_file_type` flag is set during file engine creation, a .msg file can then be processed by `IFileHandler` objects created using the file engine.

    ```csharp
    static void Main(string[] args)
    {
        // Initialize Wrapper for File SDK operations.
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
        string inputFilePath = "<input-file-path>"; //.msg file to be labeled
        string actualFilePath = inputFilePath;
        string outputFilePath = "<output-file-path>"; //labeled .msg file
        string actualOutputFilePath = outputFilePath;

        //Create a file handler for original file
        var fileHandler = Task.Run(async () => await fileEngine.CreateFileHandlerAsync(inputFilePath, 
                                                                    actualFilePath, 
                                                                    true)).Result;

        // List labels available to the user and use one of them to label the MSG file.

        foreach (var label in fileEngine.SensitivityLabels)
        {
            Console.WriteLine(string.Format("{0} - {1}", label.Name, label.Id));

            if (label.Children.Count > 0)
            {
                foreach (Label child in label.Children)
                {
                    Console.WriteLine(string.Format("\t{0} - {1}", child.Name, child.Id));
                }
            }
        }
        
        string labelId = "<label-id>"; //label retrieved using file engine
        
        LabelingOptions labelingOptions = new LabelingOptions()
        {
            AssignmentMethod = options.AssignmentMethod
        };

        fileHandler.SetLabel(labelId, labelingOptions, new ProtectionSettings());

        // Commit changes, save as outputFilePath
        var result = Task.Run(async () => await fileHandler.CommitAsync(outputFilePath)).Result;

        // Create a new handler to read the labeled file metadata
        var handlerModified = Task.Run(async () => await fileEngine.CreateFileHandlerAsync(outputFilePath, 
                                                                        actualOutputFilePath, 
                                                                        true)).Result;

        Console.WriteLine(string.Format("Original file: {0}", inputFilePath));
        Console.WriteLine(string.Format("Labeled file: {0}", outputFilePath));
        Console.WriteLine(string.Format("Label applied to file: {0}", 
            handlerModified.Label.Name));
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
   | \<output-file-path\> | The full path to the output file, which will be a labeled copy of the input file, for example: `c:\\Test\\message_labeled.msg`. |
   | \<label-id\> | The labelId retrieved using file engine, for example: `667466bf-a01b-4b0a-8bbf-a79a3d96f720`. |

## Build and test the application

Use **F6** (Build Solution) to build your client application. If you have no build errors, use **F5** (Start debugging) to run your application.

```Console
    Original file: C:\Test.msg
    Labeled file: C:\Test_Labeled.msg
    Label applied to file: Confidential    
    Press a key to continue.
```

