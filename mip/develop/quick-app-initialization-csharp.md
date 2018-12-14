---
title: Quickstart - Initialization for Microsoft Information Protection (MIP) SDK C# clients
description: A quickstart showing you how to write the initialization logic for a Microsoft Information Protection (MIP) SDK C# client applications.
author: tommoser
ms.service: information-protection
ms.topic: quickstart
ms.date: 12/13/2018
ms.author: tommos
---

# Quickstart: Client application initialization (C#)

This quickstart will show you how to implement the client initialization pattern, used by the MIP SDK .NET wrapper at runtime.

> [!NOTE]
> The steps outlined in this quickstart are required for any client application that uses the MIP C# wrapper's File or Policy APIs. The Protection API is not yet available. Although this Quickstart demonstrates usage of the File APIs, this same pattern is applicable to clients using the Policy and Protection APIs. Future Quickstarts should be done serially, as each one builds on the previous one, with this one being the first.

## Prerequisites

If you haven't already, be sure to:

- Complete the steps in [Microsoft Information Protection (MIP) SDK setup and configuration](setup-configure-mip.md). This "Client application initialization" Quickstart relies on proper SDK setup and configuration.
- Optionally:
  - Review [Profile and engine objects](concept-profile-engine-cpp.md). The profile and engine objects are universal concepts, required by clients that use the MIP File/Policy/Protection APIs. 
  - Review [Authentication concepts](concept-authentication-cpp.md) to learn how authentication and consent are implemented by the SDK and client application.
  - Review [Observer concepts](concept-async-observers.md) to learn more about observers, and how they're implemented. The MIP SDK makes use of the observer pattern to implement asynchronous event notifications.

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
  
     [![Visual Studio add NuGet package](media/quick-app-initialization-csharp/add-nuget-package.png)](media/quick-app-initialization-csharp/add-nuget-package.png#lightbox)

3. Repeat the steps above for adding the MIP SDK File API package, but instead add "Microsoft.IdentityModel.Clients.ActiveDirectory" to the application.

## Implement Wrapper Initialization

The MIP SDK .NET wrapper leverages [Platform Invoke (P/Invoke)](https://docs.microsoft.com/en-us/cpp/dotnet/how-to-call-native-dlls-from-managed-code-using-pinvoke?view=vs-2017) functionality to provide interoperability between the native DLLs and the managed wrapper. A function needs ot be added to the application to import these libraries. 

1. Add a `using` statement for `System.Runtime.InteropServices`

     ```csharp
     using System.Runtime.InteropServices;
     ```
2. Add a new internal static class called `UnsafeKernel32NativeMethods` and copy the snip below.

     ```csharp
     internal static class UnsafeKernel32NativeMethods
     {
          [DllImport("kernel32.dll", SetLastError = true, CharSet = CharSet.Unicode,
               CallingConvention = CallingConvention.StdCall)]
          internal static extern bool SetDllDirectory([In] [MarshalAs(UnmanagedType.LPWStr)] string lpPathName);
     }
     ```

The `SetDllDirectory()` function will be called later to tell the .NET application where to find the native libraries.

## Implement an authentication delegate

The MIP SDK implements authentication using class extensibility, which provides a mechanism to share authentication work with the client application. The client must acquire a suitable OAuth2 access token, and provide to the MIP SDK at runtime.

Now create an implementation for an authentication delegate, by extending the SDK's `Microsoft.InformationProtection.IAuthDelegate` interface, and overriding/implementing the `IAuthDelegate.AcquireToken()` virtual function. The authentication delegate is instantiated and used later, by the File profile and File engine objects.

1. Right-click the project name in Visual Studio, select **Add** then **Class**.
2. Enter "AuthDelegateImplemenation" in the **Name** field. Click **Add**.
3. Add using statements for the ADAL library and the MIP library:

     ```csharp
     using Microsoft.InformationProtection;
     using Microsoft.IdentityModel.Clients.ActiveDirectory;
     ```

4. Set `AuthDelegateImplementation` to inherit `Microsoft.InformationProtection.IAuthDelegate` and implement a private variable of `Microsoft.InformationProtection.ApplicationInfo` and a constructor that accepts the same type.

     ```csharp
     public class AuthDelegateImplemenation : IAuthDelegate
     {
        private ApplicationInfo _appInfo;

        public AuthDelegateImplemenation(ApplicationInfo appInfo)
        {
            _appInfo = appInfo;
        }
     }
     ```

The `ApplicationInfo` object contains two properties. The `_appInfo.ApplicationId` will be used in the `AuthDelegateImplementation` class to provide the client ID to the auth library.

5. Add the `public string AcquireToken()` class. This class should accept `Microsoft.InformationProtection.Identity`, and two strings: authority and resource. These string variables will be passed in to the authentication library. 

     ```csharp
     
     ```

## Implement a consent delegate

Now create an implementation for a consent delegate, by extending the SDK's `mip::ConsentDelegate` class, and overriding/implementing the `mip::AuthDelegate::GetUserConsent()` pure virtual function. The consent delegate is instantiated and used later, by the File profile and File engine objects.

1. Using the same Visual Studio "Add Class" feature we used previously, add another class to your project. This time, enter "consent_delegate" in the **Class Name** field. 

2. Now update each file to implement your new consent delegate class:

   - Update "consent_delegate.h", by replacing all of the generated `consent_delegate` class code with the following source. **Don't** remove the preprocessor directives generated by the previous step (#pragma, #include):

     ```cpp
     #include "mip/common_types.h"
     #include <string>

     class ConsentDelegateImpl final : public mip::ConsentDelegate {
     public:
          ConsentDelegateImpl() = default;
          virtual mip::Consent GetUserConsent(const std::string& url) override;
     };
     ```

   - Update "consent_delegate.cpp", by replacing all of the generated `consent_delegate` class implementation with the following source. **Don't** remove the preprocessor directives generated by the previous step (#pragma, #include). 

     ```cpp
     #include <iostream>
     using mip::Consent;
     using std::string;

     Consent ConsentDelegateImpl::GetUserConsent(const string& url) 
     {
          // Accept the consent to connect to the url
          std::cout << "SDK will connect to: " << url << std::endl;
          return Consent::AcceptAlways;
     }
     ``` 
3. Optionally, use F6 (**Build Solution**) to run a test compile/link of your solution, to make sure it builds successfully before continuing.

## Construct a File profile and engine

As mentioned, profile and engine object are required for SDK clients using MIP APIs. Complete the coding portion of this Quickstart, by adding code to instantiate the profile and engine objects: 

1. From **Solution Explorer**, open the .cpp file in your project that contains the implementation of the `main()` method. It defaults to the same name as the project containing it, which you specified during project creation.

2. Remove the generated implementation of `main()`. **Don't** remove preprocessor directives generated by Visual Studio during project creation (#pragma, #include). Append the following code after any preprocessor directives:

   ```cpp
   #include "auth_delegate.h"
   #include "consent_delegate.h"
   #include "profile_observer.h"

   using std::promise;
   using std::future;
   using std::make_shared;
   using std::shared_ptr;
   using std::string;
   using std::cout;
   using mip::ApplicationInfo; 
   using mip::FileProfile;
   using mip::FileEngine;

   int main()
   {
     // Construct/initialize objects required by the application's profile object
     ApplicationInfo appInfo{"<application-id>",                    // ApplicationInfo object (App ID, friendly name)
                 "<friendly-name>" };
     auto profileObserver = make_shared<ProfileObserver>();         // Observer object					
     auto authDelegateImpl = make_shared<AuthDelegateImpl>(         // Authentication delegate object (App ID)
                 "<application-id>");
     auto consentDelegateImpl = make_shared<ConsentDelegateImpl>(); // Consent delegate object
 
     // Construct/initialize profile object
     FileProfile::Settings profileSettings("",    // Path for logging/telemetry/state
       true,                                      // true = use in-memory state storage (vs disk)
       authDelegateImpl,							
       consentDelegateImpl,						
       profileObserver,							
       appInfo);									

     // Set up promise/future connection for async profile operations; load profile asynchronously
     auto profilePromise = make_shared<promise<shared_ptr<FileProfile>>>();
     auto profileFuture = profilePromise->get_future();
     mip::FileProfile::LoadAsync(profileSettings, profilePromise);
     auto profile = profileFuture.get();

     // Construct/initialize engine object
     FileEngine::Settings engineSettings(
       mip::Identity("<engine-account>"),         // Engine identity (account used for authentication)
       "<engine-state>",                          // User-defined engine state		
       "en-US");                                  // Locale (default = en-US)

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
       cout << "An exception occurred... is the access token incorrect/expired?\n\n"
        << e.what() << "'\n";
       system("pause");
       return 1;
     }

      return 0;
     }

   ``` 

3. Replace the placeholder values in the source code that you just pasted in, using the following values:

   | Placeholder | Value | Example |
   |:----------- |:----- |:--------|
   | \<application-id\> | The Azure AD Application ID assigned to the application registered in "MIP SDK setup and configuration" (2 instances).  | 0edbblll-8773-44de-b87c-b8c6276d41eb |
   | \<friendly-name\> | A user-defined friendly name for your application. | AppInitialization |
   | \<engine-account\> | The account used for the engine's identity. When you authenticate with a user account during token acquisition, it must match this value. | user1@tenant.onmicrosoft.com |
   | \<engine-state\> | User-defined state to be associated with the engine. | MyAppState |


4. Now do a final build of the application and resolve any errors. Your code should build successfully, but will not yet run correctly until you complete the next Quickstart. If you run the application, you will see output similar to the following. You won't have an access token to provide, until you complete the next Quickstart.

   ```console
   Run the PowerShell script to generate an access token using the following values, then copy/paste it below:
   Set $authority to: https://login.windows.net/common/oauth2/authorize
   Set $resourceUrl to: https://syncservice.o365syncservice.com/
   Be sure to sign in with user account:
   Enter access token:
   ```

## Next Steps

Now that your initialization code is complete, you're ready for the next quickstart, where you'll start to experience the MIP File APIs.

> [!div class="nextstepaction"]
> [List sensitivity labels](quick-file-list-labels-cpp.md)
