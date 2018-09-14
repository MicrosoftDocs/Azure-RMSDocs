---
title: Quickstart - Initialization for Microsoft Information Protection (MIP) SDK C++ clients
description: A quickstart showing you how to write the initialization logic for a Microsoft Information Protection (MIP) SDK client applications.
services: information-protection
author: BryanLa
ms.service: information-protection
ms.topic: quickstart
ms.date: 09/27/2018
ms.author: bryanla
---

# Quickstart: Client application initialization (C++)

This quickstart illustrates the client initialization pattern used by the MIP C++ SDK at runtime. 

> [!NOTE]
> The steps outlined in this quickstart are required for any client application that uses the MIP File, Policy, or Protection APIs. Although this quickstart demonstrates usage of the File APIs, this same pattern is applicable to clients using the Policy and Protection APIs.

## Prerequisites

If you haven't already, be sure to:

- Complete the steps in [Microsoft Information Protection (MIP) SDK setup and configuration](setup-configure-mip.md).
- Review [Profile and engine objects](concept-profile-engine-cpp.md). The profile and engine objects are universal concepts, required by clients that use the MIP File/Policy/Protection APIs. 
- Review [Authentication concepts](concept-authentication-cpp.md) to learn how authentication and consent are implemented by the SDK and client application.
- Optional: review [Observer concepts](concept-async-observers.md) to learn more about observers, and how they're implemented. The MIP SDK makes use of the observer pattern to implement asynchronous event notifications.

## Create a Visual Studio solution and project

Here we create the initial Visual Studio solution, upon which the following Quickstarts will build. 

1. Create a new Visual Studio solution and starter project:

   - Open Visual Studio 2017, select **File**, **New**, **Project**.
   - In the **New Project** dialog:
     - In the left pane, under **Installed**, **Other Languages**, select **Visual C++**.
     - In the center pane, select **Windows Console Application**
     - In the bottom pane, update the project **Name**, **Location**, and the containing **Solution name** accordingly.
     - When finished, click the **OK** button in the lower right.

     [![Visual Studio solution creation](media/quick-app-initialization-cpp/create-vs-solution.png)](media/quick-app-initialization-cpp/create-vs-solution.png#lightbox)

2. Configure the include and library directory paths in your project settings. These directories were established as part of the [MIP SDK setup and configuration](setup-configure-mip.md#configure-your-client-workstation) prerequisite:
   - In the **Solution Explorer**, right click on the project node (directly under the top/solution node), and select **Properties**.
   - On the **Property Pages** dialog, under **Configuration Properties**, select the **VC++ Directories** node.
   - Select the **Include Directories** row then click the drop-down on the right side, then **<Edit...>**, and enter the path(s) to the SDK include subdirectories in the top field. Click **OK**. Be sure to specify the `\include` subdirectories (but no deeper), within the directory where you installed the SDK.
   - Repeat the previous step for the **Library Directories** row, entering the path(s) to the SDK library subdirectories. Be sure to select the paths that match the current build configuration for your solution (debug/release target, and platform). Be sure to specify the `\bins\<target>\<platform>` subdirectories, within the directory where you installed the SDK.
   - Click **OK** on the **Property Pages** dialog when finished.

     [![Visual Studio solution creation](media/quick-app-initialization-cpp/set-include-lib-path-properties.png)](media/quick-app-initialization-cpp/set-include-lib-path-properties.png#lightbox)

3. Add the SDK binaries path to the PATH environment variable, to allow the SDK .DLL files to be found at runtime:
   - Click the Windows icon in the lower left.
   - Type "Path" and press the "Enter" key, when you see the **Edit the system environment variables** item show.
   - On the **System Properties** dialog, click **Environment Variables**.
   - Click the **Path** row under **User variables for \<user\>**, then click **Edit...**
   - Click **New**, enter the same `\bins\<target>\<platform>` subdirectory path(s) you entered earlier for the SDK libraries, and click **OK**.

## Implement an observer class

Now create a basic implementation for an observer class, by extending the SDK's `FileProfile::Observer` class. The observer is instantiated and used later, by the File profile and File engine objects.

1. Add a new class to your project, which generates both the header/.h and implementation/.cpp files for you:

   - In the **Solution Explorer**, right click on the project node, select **Add**, then select **Class**.
   - On the **Add Class** dialog:
     - In the **Class Name** field, enter "profile_observer". Notice that both the **.h file** and **.cpp file** fields are automatically populated, based on the name you enter.
     - When finished, click the **OK** button.

     [![Visual Studio add class](media/quick-app-initialization-cpp/add-class.png)](media/quick-app-initialization-cpp/add-class.png#lightbox)

2. After generating the .h and .cpp files for the class, both files are opened in Editor Group tabs. Now update each file to implement your new observer class:

   - Update "profile_observer.h", by selecting/deleting the generated `profile_observer` class. **Don't** remove the preprocessor directives generated in the previous step (#pragma, #include). Then copy/paste the following source into the file, after any remaining preprocessor directives:

     ```cpp
     #include <memory>
     #include "mip/file/file_profile.h"

     class ProfileObserver final : public mip::FileProfile::Observer {
     public:
          ProfileObserver() { }
	        void OnLoadSuccess(const std::shared_ptr<mip::FileProfile>& profile, const std::shared_ptr<void>& context) override;
	        void OnLoadFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context) override;
	        void OnAddEngineSuccess(const std::shared_ptr<mip::FileEngine>& engine, const std::shared_ptr<void>& context) override;
	        void OnAddEngineError(const std::exception_ptr& error, const std::shared_ptr<void>& context) override;
     };
     ```

   - Update "profile_observer.cpp", by selecting/deleting the generated implementation of the `profile_observer` class. **Don't** remove the preprocessor directives generated in the previous step (#pragma, #include). Then copy/paste the following source into the file, after any remaining preprocessor directives:

     ```cpp
     #include <future>

     using std::promise;
     using std::shared_ptr;
     using std::static_pointer_cast;
     using mip::FileEngine;
     using mip::FileProfile;

     void ProfileObserver::OnLoadSuccess(const shared_ptr<FileProfile>& profile, const shared_ptr<void>& context) {
          auto promise = static_pointer_cast<std::promise<shared_ptr<FileProfile>>>(context);
          promise->set_value(profile);
     }

     void ProfileObserver::OnLoadFailure(const std::exception_ptr& error, const shared_ptr<void>& context) {
          auto promise = static_pointer_cast<std::promise<shared_ptr<FileProfile>>>(context);
          promise->set_exception(error);
     }

     void ProfileObserver::OnAddEngineSuccess(const shared_ptr<FileEngine>& engine, const shared_ptr<void>& context) {
          auto promise = static_pointer_cast<std::promise<shared_ptr<FileEngine>>>(context);
          promise->set_value(engine);
     }

     void ProfileObserver::OnAddEngineError(const std::exception_ptr& error, const shared_ptr<void>& context) {
          auto promise = static_pointer_cast<std::promise<shared_ptr<FileEngine>>>(context);
          promise->set_exception(error);
     }
     ``` 

## Implement an authentication delegate

The MIP SDK implements authentication using class extensibility, providing a mechanism to share authentication work with the client application. The client application must acquire a suitable OAuth2 access token, when asked by the MIP SDK at runtime. Token acquisition is accomplished in the implementation of the client's authentication delegate class, by extending the `mip::AuthDelegate` class and implementing the `mip::AuthDelegate::AcquireOAuth2Token()` pure virtual function.

1. Using the same Visual Studio "Add class" feature we used in step #1 of the previous section, add another class to your project. This time, enter "auth_delegate" in the **Class Name** field. 

2. Now update each file to implement your new authentication delegate class:

   - Update "auth_delegate.h", by replacing all of the generated `auth_delegate` class code with the following source. **Don't** remove the preprocessor directives generated in the previous step (#pragma, #include):

     ```cpp
     #include <string>
     #include "mip/common_types.h"

     class AuthDelegateImpl final : public mip::AuthDelegate {
     public:
          AuthDelegateImpl() = delete;        // Prevents default constructor

	        AuthDelegateImpl(
            const std::string& appId)         // AppID for registered AAD app
		        : mAppId(appId) {};

          bool AcquireOAuth2Token(            // Called by MIP SDK to get a token
            const mip::Identity& identity,    // Identity of the account to be authenticated, if known
            const OAuth2Challenge& challenge, // Authority (AAD tenant issuing token), and resource (API being accessed; "aud" claim).
            OAuth2Token& token) override;     // Token handed back to MIP SDK
     private:
          std::string mAppId;
     };
     ```

   - Update "auth_delegate.cpp", by replacing all of the generated `auth_delegate` class implementation with the following source. **Don't** remove the preprocessor directives generated in the previous step (#pragma, #include). 

     > [!IMPORTANT]
     > Notice that the following token acquisition code is intentionally incomplete. We will test later with a static access token.  
     > In production, this code must dynamically acquire an access token, based on specified criteria:
     > - the appId and reply/redirect URI specified in your Azure AD app registration (reply/redirect URI **must** match your app registration)
     > - the authority and resource URI passed in by the SDK (resource URI **must** match your app registration's API/permissions)
     > - app/user credentials (OAuth2 "native" clients should prompt for user credentials and use the "authorization code" flow. OAuth2 "confidential clients" can use their own secure credentials with a flow like "client credentials" (such as a service), or prompt for user credentials using the "authorization code" flow (such as a web app)).
     >
     > OAuth2 token acquisition is a complex protocol, and as such, is normally accomplished by using a library. TokenAcquireOAuth2Token() is **only** called by the MIP SDK, as required.

     ```cpp
     using std::string;

     bool AuthDelegateImpl::AcquireOAuth2Token(const mip::Identity& identity, const OAuth2Challenge& challenge, OAuth2Token& token) 
     {
	        // TODO: replace with token acquisition code
	        const string authority = challenge.GetAuthority();
	        const string resourceURI = challenge.GetResource();
	        string accessToken = "<access-token>";

	        // Pass access token back to MIP SDK
	        token.SetAccessToken(accessToken);

          // True = successful token acquisition; False = failure
          return true;
     }
     ``` 

## Implement a consent delegate

Azure AD requires an application to be given consent, before it can access secured resources under the identity of an account. Consent is recorded as a permanent acknowledgement of permission in the tenant of the account, for the requested resource API/permissions, and a given account (user consent) or all accounts (admin consent). This occurs in various scenarios, based the level of permissions the application is seeking, and the account being used for sign-in and token acquisition: 

- accounts from the *same tenant* where your application is registered, if you or an administrator didn't explicitly pre-consent access via "Grant Permissions" to them (step #6 in [Register a client application with Azure AD](setup-configure-mip.md#register-a-client-application-with-azure-active-directory)).
- accounts from a *different tenant* if your application is registered as multi-tenant, and the tenant administrator hasn't pre-consented for all users in advance.

Fortunately, the SDK provides an easy-to-use approach for developers to implement a custom consent experience, based on the endpoint being accessed by the SDK. Once the user grants consent, the application can continue. 

1. Using the same Visual Studio "Add class" feature we used previously, add another class to your project. This time, enter "consent_delegate" in the **Class Name** field. 

2. Now update each file to implement your new consent delegate class:

   - Update "consent_delegate.h", by replacing all of the generated `consent_delegate` class code with the following source. **Don't** remove the preprocessor directives generated in the previous step (#pragma, #include):

     ```cpp
     #include "mip/common_types.h"
     #include <string>

     class ConsentDelegateImpl final : public mip::ConsentDelegate {
     public:
	        ConsentDelegateImpl() = default;

	        virtual mip::Consent GetUserConsent(const std::string& url) override;
     };
     ```

   - Update "consent_delegate.cpp", by replacing all of the generated `consent_delegate` class implementation with the following source. **Don't** remove the preprocessor directives generated in the previous step (#pragma, #include). 

     ```cpp
     #include <iostream>
     using mip::Consent;
     using std::runtime_error;
     using std::string;

     Consent ConsentDelegateImpl::GetUserConsent(const string& url) 
     {
          // Accept the consent to connect to the url
	       std::cout << "SDK will connect to: " << url << std::endl;
	       return Consent::AcceptAlways;
     }
     ``` 

## Implement a File profile and engine

As mentioned earlier, the profile and engine objects are universal concepts that apply to all SDK clients. Now you'll complete the coding portion of this Quickstart, by adding code that will instantiate the profile and engine. You'll also update `AcquireOAuth2Token()` to use a valid static token for testing. 

1. From **Solution Explorer**, open the .cpp file in your project that contains the implementation of the `main()` method. It will have the same as the project containing it, which you specified earlier during project/solution creation.

2. Replace your generated `main()` implementation with the following code:

   ```cpp

   ``` 

3. Generate a test token using the PowerShell `Get-ADALToken` cmdlet you installed earlier in MIP SDK Setup and configuration:

   ```powershell
   $authority = 'https://login.windows.net/common/oauth2/authorize'  # provided by MIP SDK
   $resourceUrl = 'https://syncservice.o365syncservice.com/'         # provided by MIP SDK; must match the URL of resource/API requested by the registered app
   $appId = '0edbcbed-8773-44de-b87c-b8c6276d41eb'                   # App ID of the registered app
   $redirectUri = 'bltest://authorize'                               # Must match the redirect URI of the registered app
   $response = Get-ADALToken -Resource $resourceUrl -ClientId $clientId -RedirectUri $redirectUri -Authority $authority -PromptBehavior:RefreshSession 
   $response.AccessToken | clip                                      # Copies the access token text to the clipboard
   ```

4. Paste the access token into the \<access-token\> placeholder, in the following line of your `AcquireOAuth2Token()` implementation, in "auth_delegate.cpp":

   ```cpp
   string accessToken = "<access-token>";
   ``` 

## Build and test the application

Finally, lets build and test your client application. Before we can do that though, you'll need to generate an access token, which we can use for testing.

- TBD - compile/build instructions
- If your code builds and runs successfully, you should see the following output in the console window. [TBD: REPLACE THIS]

```cmd
Non-Business : 87ba5c36-b7cf-4793-bbc2-bd5b3a9f95ca
Public : 87867195-f2b8-4ac2-b0b6-6bb73cb33afc
General : f42aa342-8706-4288-bd11-ebb85995028c
Confidential : 074e257c-5848-4582-9a6f-34a182080e71
->  Microsoft FTE : d9f23ae3-a239-45ea-bf23-f515f824c57b
->  Microsoft Extended : 9fbde396-1a24-4c79-8edf-9254a0f35055
Highly Confidential : f5dc2dea-db0f-47cd-8b20-a52e1590fb64
->  Microsoft FTE : f74878b7-c0ff-44a4-82ff-8ce29f7fccb5
->  Microsoft Extended : c179f820-d535-4b2f-b252-8a9c4ac14ec6
Press any key to continue . . .
```

## Next Steps

Now you're ready for the next quickstart, where you'll start to experience the MIP File APIs.

> [!div class="nextstepaction"]
> [List sensitivity labels](quick-file-list-labels-cpp.md)
