---
title: Quickstart - Initialization for Microsoft Information Protection (MIP) SDK C++ clients
description: A quickstart showing you how to write the initialization logic for a Microsoft Information Protection (MIP) SDK client applications.
author: BryanLa
ms.service: information-protection
ms.topic: quickstart
ms.date: 09/27/2018
ms.author: bryanla
---

# Quickstart: Client application initialization (C++)

This quickstart will show you how to implement the client initialization pattern, used by the MIP C++ SDK at runtime. 

> [!NOTE]
> The steps outlined in this quickstart are required for any client application that uses the MIP File, Policy, or Protection APIs. Although this Quickstart demonstrates usage of the File APIs, this same pattern is applicable to clients using the Policy and Protection APIs. Future Quickstarts should be done serially, as each one builds on the previous one, with this one being the first.

## Prerequisites

If you haven't already, be sure to:

- Complete the steps in [Microsoft Information Protection (MIP) SDK setup and configuration](setup-configure-mip.md). This Quickstart relies on proper SDK setup and configuration.
- Optionally:
  - Review [Profile and engine objects](concept-profile-engine-cpp.md). The profile and engine objects are universal concepts, required by clients that use the MIP File/Policy/Protection APIs. 
  - Review [Authentication concepts](concept-authentication-cpp.md) to learn how authentication and consent are implemented by the SDK and client application.
  - Review [Observer concepts](concept-async-observers.md) to learn more about observers, and how they're implemented. The MIP SDK makes use of the observer pattern to implement asynchronous event notifications.

## Create a Visual Studio solution and project

First we create and configure the initial Visual Studio solution and project, upon which the Quickstarts will build. 

1. Open Visual Studio 2017, select the **File** menu, **New**, **Project**. In the **New Project** dialog:
     - In the left pane, under **Installed**, **Other Languages**, select **Visual C++**.
     - In the center pane, select **Windows Console Application**
     - In the bottom pane, update the project **Name**, **Location**, and the containing **Solution name** accordingly.
     - When finished, click the **OK** button in the lower right.

     [![Visual Studio solution creation](media/quick-app-initialization-cpp/create-vs-solution.png)](media/quick-app-initialization-cpp/create-vs-solution.png#lightbox)


2. Configure the project settings:
   - In the **Solution Explorer**, right click on the project node (directly under the top/solution node), and select **Properties**. 
   - On the top/right of the **Property Pages** dialog, click **Configuration Manager...**. On the **Configuration Manager** dialog, set your  "Active solution configuration" to **Debug**, and "Active solution platform" target to **x64**. Click **Close** when finished.
   - Under **Configuration Properties** in the left pane, select the **VC++ Directories** node.
   - Select the **Include Directories** row, then click the drop-down on the right side, then **<Edit...>**, and enter the paths to the SDK include (.h) subdirectories in the top field. Specify the full paths to `file\include`, `protection\include`, `upe\include` subdirectories (but no deeper), within the path where you installed the SDK. You can create a new row for each, or seperate them with a semicolon (`;`) on a single row. Click **OK**. 

        [![Visual Studio set path properties](media/quick-app-initialization-cpp/set-include-lib-path-properties.png)](media/quick-app-initialization-cpp/set-include-lib-path-properties.png#lightbox)

   - Repeat the previous step for the **Library Directories** row, entering the paths to the SDK binary static libraries (.lib) subdirectories. Be sure to use the paths that match the current build configuration for your solution. For this Quickstart, specify the absolute or relative paths to the `file\bins\debug\amd64`, `protection\bins\debug\amd64`, `upe\bins\debug\amd64` subdirectories.

   - Under **Configuration Properties** in the left pane, open the **Linker** node, and select the **Input** node. 
   - Select the **Additional Dependencies** row, then click the drop-down on the right side, then **<Edit...>**. Here you add the names of the SDK static libraries. Add `mip_protection_sdk.lib;mip_file_sdk.lib;mip_upe_sdk.lib;` to the libraries list, in the top field. Click **OK**. 
   - Click **OK** on the **Property Pages** dialog when finished.

     [![Visual Studio set static libs](media/quick-app-initialization-cpp/set-static-libs.png)](media/quick-app-initialization-cpp/set-static-libs.png#lightbox)

## Implement an observer class to monitor the File profile and engine objects

Now create a basic implementation for a File profile observer class, by extending the SDK's `mip::FileProfile::Observer` class. The observer is instantiated and used later, to monitor the loading of the File profile object, and adding the engine object to the profile.

1. Add a new class to your project, which generates both the header/.h and implementation/.cpp files for you:

   - In the **Solution Explorer**, right click on the project node again, select **Add**, then select **Class**.
   - On the **Add Class** dialog:
     - In the **Class Name** field, enter "profile_observer". Notice that both the **.h file** and **.cpp file** fields are automatically populated, based on the name you enter.
     - When finished, click the **OK** button.

     [![Visual Studio add class](media/quick-app-initialization-cpp/add-class.png)](media/quick-app-initialization-cpp/add-class.png#lightbox)

2. After generating the .h and .cpp files for the class, both files are opened in Editor Group tabs. Now update each file to implement your new observer class:

   - Update "profile_observer.h", by selecting/deleting the generated `profile_observer` class. **Don't** remove the preprocessor directives generated by the previous step (#pragma, #include). Then copy/paste the following source into the file, after any existing preprocessor directives:

     ```cpp
     #include <memory>
     #include "mip/file/file_profile.h"

     class ProfileObserver final : public mip::FileProfile::Observer {
     public:
          ProfileObserver() { }
          void OnLoadSuccess(const std::shared_ptr<mip::FileProfile>& profile, const std::shared_ptr<void>& context) override;
          void OnLoadFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context) override;
          void OnAddEngineSuccess(const std::shared_ptr<mip::FileEngine>& engine, const std::shared_ptr<void>& context) override;
          void OnAddEngineFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context) override;
     };
     ```

   - Update "profile_observer.cpp", by selecting/deleting the generated `profile_observer` class implementation. **Don't** remove the preprocessor directives generated by the previous step (#pragma, #include). Then copy/paste the following source into the file, after any existing preprocessor directives:

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

     void ProfileObserver::OnAddEngineFailure(const std::exception_ptr& error, const shared_ptr<void>& context) {
          auto promise = static_pointer_cast<std::promise<shared_ptr<FileEngine>>>(context);
          promise->set_exception(error);
     }
     ```

3. Optionally, use F6 (**Build Solution**) to run a test compile/link of your solution, to make sure it builds successfully before continuing.

## Implement an authentication delegate

The MIP SDK implements authentication using class extensibility, which provides a mechanism to share authentication work with the client application. The client must acquire a suitable OAuth2 access token, and provide to the MIP SDK at runtime. 

Now create an implementation for an authentication delegate, by extending the SDK's `mip::AuthDelegate` class, and overriding/implementing the `mip::AuthDelegate::AcquireOAuth2Token()` pure virtual function. The authentication delegate is instantiated and used later, by the File profile and File engine objects.

1. Using the same Visual Studio "Add Class" feature we used in step #1 of the previous section, add another class to your project. This time, enter "auth_delegate" in the **Class Name** field. 

2. Now update each file to implement your new authentication delegate class:

   - Update "auth_delegate.h", by replacing all of the generated `auth_delegate` class code with the following source. **Don't** remove the preprocessor directives generated by the previous step (#pragma, #include):

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

   - Update "auth_delegate.cpp", by replacing all of the generated `auth_delegate` class implementation with the following source. **Don't** remove the preprocessor directives generated by the previous step (#pragma, #include). 

     > [!IMPORTANT]
     > The following token acquisition code is intentionally incomplete. We will test later with a static access token.  
     > In production, this must be replaced by code that dynamically prompts the user for authentication and acquires a token, using:
     > - the appId and reply/redirect URI specified in your Azure AD app registration (reply/redirect URI **must** match your app registration)
     > - the authority and resource URI passed by the SDK in the `challenge` argument (resource URI **must** match your app registration's API/permissions)
     > - app/user credentials (OAuth2 "native" clients should prompt for user credentials and use the "authorization code" flow. OAuth2 "confidential clients" can use their own secure credentials with the "client credentials" flow (such as a service), or prompt for user credentials using the "authorization code" flow (such as a web app)).
     >
     > OAuth2 token acquisition is a complex protocol, and normally accomplished by using a library. TokenAcquireOAuth2Token() is **only** called by the MIP SDK, as required.

     ```cpp
     using std::string;

     bool AuthDelegateImpl::AcquireOAuth2Token(const mip::Identity& identity, const OAuth2Challenge& challenge, OAuth2Token& token) 
     {
	        // TODO: replace with token acquisition code, using mAppId, identity, authority, and resourceURI
	        const string authority = challenge.GetAuthority();
	        const string resourceURI = challenge.GetResource();
	        string accessToken = "<access-token>";

	        // Pass access token back to MIP SDK
	        token.SetAccessToken(accessToken);

          // True = successful token acquisition; False = failure
          return true;
     }
     ``` 
3. Optionally, use F6 (**Build Solution**) to run a test compile/link of your solution, to make sure it builds successfully before continuing.

## Implement a consent delegate

Azure AD requires an application to be given consent, before it can access secured resources under the identity of an account. Consent is recorded as a permanent acknowledgement of permission in the tenant of the account, by a given account (user consent) or all accounts (admin consent), for the app to access the requested resource API/permissions. Consent occurs in various scenarios, based on the API and level of permissions the application is seeking, and the account being used for sign-in and token acquisition: 

- accounts from the *same tenant* where your application is registered, if you or an administrator didn't explicitly pre-consent access via the "Grant Permissions" feature.
- accounts from a *different tenant* if your application is registered as multi-tenant, and the tenant administrator hasn't pre-consented for all users in advance.

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
     // Construct/initialize objects used by the application's profile object
     ApplicationInfo appInfo{"<application-id>",	// ApplicationInfo object (App ID, friendly name)
                 "<friendly-name>" };
     auto profileObserver = make_shared<ProfileObserver>();			// Observer object					
     auto authDelegateImpl = make_shared<AuthDelegateImpl>(			// Authentication delegate object (App ID)
                 "<application-id>");
     auto consentDelegateImpl = make_shared<ConsentDelegateImpl>();	// Consent delegate object
 
     // Construct/initialize profile object
     FileProfile::Settings profileSettings("",		// Path for logging/telemetry/state; blank = C:
       true,										// true = use in-memory state storage (vs disk)
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
     FileEngine::Settings engineSettings("<engine-id>",		// User-defined engine ID
       "<engine-state>",								// User-defined engine state		
       "en-US");									// Locale (default = en-US)

     // Set up promise/future connection for async engine operations; add engine to profile asynchronously
     auto enginePromise = make_shared<promise<shared_ptr<FileEngine>>>();
     auto engineFuture = enginePromise->get_future();
     profile->AddEngineAsync(engineSettings, enginePromise);
     std::shared_ptr<FileEngine> engine; 
     try
     {
       engine = engineFuture.get();				// triggers AcquireOAuth2Token() call
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

   | Placeholder | Value |
   |:----------- |:----- |
   | \<application-id\> | The Azure AD Application ID assigned to the application registered in "MIP SDK setup and configuration" (2 instances).  |
   | \<friendly-name\> | A user-defined friendly name for your application. |
   | \<engine-id\> | A user-defined ID assigned to the engine. |
   | \<engine-state\> | User-defined state to be associated with the engine. |


4. Now do a final build of the application and resolve any errors. Your code should build successfully, but will not yet run correctly until you complete the next Quickstart. If you run the application, you will see an exception similar to the following:

   ```cmd
   An exception occurred... is the access token incorrect/expired?

   Failed acquiring policy, Request failed with http status code: 401, x-ms-diagnostics: [2000001;reason="OAuth token submitted with the request can not be parsed.";error_category="invalid_token"], correlationId:[5b731x67-6521-4cd8-b911-00009ab9cbez]'
   
   Press any key to continue . . .
   ```

## Next Steps

Now that your initialization code is complete, you're ready for the next quickstart, where you'll start to experience the MIP File APIs.

> [!div class="nextstepaction"]
> [List sensitivity labels](quick-file-list-labels-cpp.md)
