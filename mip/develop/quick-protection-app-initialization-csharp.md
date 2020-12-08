---
title: Quickstart - Client application initialization - Protection API (C#)
description: A quickstart showing you how to write the initialization logic for a Microsoft Information Protection (MIP) SDK - Protection API C# client applications (C#)
author: Pathak-Aniket
ms.service: information-protection
ms.topic: quickstart
ms.date: 03/30/2020
ms.author: v-anikep
#Customer intent: As a an application developer, I want to learn how to do SDK .NET wrapper initialization, so that I can use the SDK Protection API.
---

# Quickstart: Client application initialization for Protection APIs (C#)

This quickstart will show you how to implement the client initialization pattern, used by the MIP SDK .NET wrapper at runtime.

> [!NOTE]
> The steps outlined in this quickstart are required for any client application that uses the MIP .NET wrapper's Protection API. This Quickstarts should be done serially after Application Initialization and implementation of Authentication delegate and Consent delegate classes.

## Prerequisites

If you haven't already, be sure to:

- Complete the steps in [Microsoft Information Protection (MIP) SDK setup and configuration](setup-configure-mip.md). This "Protection Profile and Engine set up" Quickstart relies on proper SDK setup and configuration.
- Optionally:
  - Review [Profile and engine objects](concept-profile-engine-cpp.md). The profile and engine objects are universal concepts, required by clients that use the MIP File/Policy/Protection APIs.
  - Review [Authentication concepts](concept-authentication-cpp.md) to learn how authentication and consent are implemented by the SDK and client application.

## Create a Visual Studio solution and project

First we create and configure the initial Visual Studio solution and project, upon which the other Quickstarts will build.

1. Open Visual Studio 2017, select the **File** menu, **New**, **Project**. In the **New Project** dialog:
   - In the left pane, under **Installed**, **Visual C#**, select **Windows Desktop**.
   - In the center pane, select **Console App (.NET Framework)**
   - In the bottom pane, update the project **Name**, **Location**, and the containing **Solution name** accordingly.
   - When finished, click the **OK** button in the lower right.

     [![Visual Studio solution creation](media/quick-app-initialization-csharp/create-vs-solution.png)](media/quick-app-initialization-csharp/create-vs-solution.png#lightbox)

2. Add the Nuget package for the MIP SDK File API to your project:
   - In the **Solution Explorer**, right click on the project node (directly under the top/solution node), and select **Manage NuGet packages...**:
   - When the **NuGet Package Manager** tab opens in the Editor Group tabs area:
     - Select **Browse**.
     - Enter "Microsoft.InformationProtection" in the search box.
     - Select the "Microsoft.InformationProtection.File" package.
     - Click "Install", then click "OK" when the **Preview changes** confirmation dialog displays.

3. Repeat the steps above for adding the MIP SDK Protection API package, but instead add "Microsoft.IdentityModel.Clients.ActiveDirectory" to the application.

## Implement an authentication delegate and a consent delegate

If not already implemented, follow the steps listed in [File API application initialization](quick-app-initialization-csharp.md) for implementing authentication and consent delegate.

## Initialize the MIP SDK Managed Wrapper

1. From **Solution Explorer**, open the .cs file in your project that contains the implementation of the `Main()` method. It defaults to the same name as the project containing it, which you specified during project creation.

2. Remove the generated implementation of `main()`.

3. The managed wrapper includes a static class, `Microsoft.InformationProtection.MIP` used for initialization, creating a `MipContext`, loading profiles, and releasing resources. To initialize the wrapper for file API operations, call `MIP.Initialize()`, passing in `MipComponent.Protection` to load the libraries necessary for protection operations.

4. In `Main()` in *Program.cs* add the following, replacing **\<application-id\>** with the ID of the Azure AD Application Registration created previously.

```csharp
using System;
using System.Threading.Tasks;
using Microsoft.InformationProtection;
using Microsoft.InformationProtection.Exceptions;
using Microsoft.InformationProtection.Protection;

namespace mip_sdk_dotnet_quickstart
{
    class Program
    {
        private const string clientId = "<application-id>";
        private const string appName = "<friendly-name>";

        static void Main(string[] args)
        {
            //Initialize Wrapper for Protection API operations
            MIP.Initialize(MipComponent.Protection);
        }
    }
}
```

## Construct a Protection Profile and Engine

As mentioned, profile and engine objects are required for SDK clients using MIP APIs. Complete the coding portion of this Quickstart, by adding code to load the native DLLs and then instantiate the profile and engine objects.

```csharp
using System;
using System.Threading.Tasks;
using Microsoft.InformationProtection;
using Microsoft.InformationProtection.Exceptions;
using Microsoft.InformationProtection.Protection;

namespace mip_sdk_dotnet_quickstart
{
     class Program
     {
          private const string clientId = "<application-id>";
          private const string appName = "<friendly-name>";

          static void Main(string[] args)
          {
               // Initialize Wrapper for Protection API operations.
               MIP.Initialize(MipComponent.Protection);

               // Create ApplicationInfo, setting the clientID from Azure AD App Registration as the ApplicationId.
               ApplicationInfo appInfo = new ApplicationInfo()
               {
                    ApplicationId = clientId,
                    ApplicationName = appName,
                    ApplicationVersion = "1.0.0"
               };

               // Instantiate the AuthDelegateImpl object, passing in AppInfo.
               AuthDelegateImplementation authDelegate = new AuthDelegateImplementation(appInfo);

               MipContext mipContext = MIP.CreateMipContext(appInfo,
                                        "mip_data",
                                        LogLevel.Trace,
                                        null,
                                        null);

               // Initialize and instantiate the ProtectionProfile.
               // Create the ProtectionProfileSettings object.
               // Initialize protection profile settings to create/use local state.
               var profileSettings = new ProtectionProfileSettings(mipContext,
                                        CacheStorageType.OnDiskEncrypted,                                        
                                        new ConsentDelegateImplementation());

               // Load the Profile async and wait for the result.
               var protectionProfile = Task.Run(async () => await MIP.LoadProtectionProfileAsync(profileSettings)).Result;

               // Create a ProtectionEngineSettings object, then use that to add an engine to the profile.
               var engineSettings = new ProtectionEngineSettings("user1@tenant.com", authDelegate, "", "en-US");
               engineSettings.Identity = new Identity("user1@tenant.com");
               var protectionEngine = Task.Run(async () => await protectionProfile.AddEngineAsync(engineSettings)).Result;

               // Application Shutdown
               // handler = null; // This will be used in later quick starts.
               protectionEngine = null;
               protectionProfile = null;
               mipContext = null;
          }
     }
}
```

3. Replace the placeholder values in the source code that you pasted in, using the following values:

   | Placeholder | Value | Example |
   |:----------- |:----- |:--------|
   | \<application-id\> | The Azure AD Application ID assigned to the application registered in "MIP SDK setup and configuration" (2 instances).  | 0edbblll-8773-44de-b87c-b8c6276d41eb |
   | \<friendly-name\> | A user-defined friendly name for your application. | AppInitialization |


4. Now do a final build of the application and resolve any errors. Your code should build successfully.

## Next Steps

Now that your initialization code is complete, you're ready for the next quickstart, where you'll start to experience the MIP Protection APIs.

> [!div class="nextstepaction"]
> [List protection templates](quick-protection-list-templates-csharp.md)
