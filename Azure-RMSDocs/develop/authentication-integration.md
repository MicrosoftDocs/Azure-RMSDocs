---
# required metadata

title: How to register your app with Azure AD - AIP
description: Describes the basics of user authentication for your RMS-enabled app.
keywords:
author: bryanla
ms.author: bryanla
manager: mbaldwin
ms.date: 03/13/2017
ms.topic: conceptual
ms.service: information-protection
ms.assetid: 200D9B23-F35D-4165-9AC4-C482A5CE1D28
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: kartikk
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# How to register and RMS enable your app with Azure AD

This topic will guide you through the basics of app registration and RMS enablement through the Azure portal followed by user authentication with the Azure Active Directory Authentication Library (ADAL).

## What is user authentication
User authentication is an essential step to establish communication between your device app and the RMS infrastructure. This authentication process uses the standard OAuth 2.0 protocol which requires key pieces of information about the current user and the authentication request.

## Registration via Azure portal
Begin by following this guide for configuring your app's registration through the Azure portal, [Configure Azure RMS for ADAL authentication](adal-auth.md). Be sure to copy and save the **Client ID** and **Redirect Uri** from this process for use later.

## Complete your Information Protection Integration Agreement (IPIA)
Before you can deploy your application, you must complete an IPIA with the Microsoft Information Protection team. For complete details, see the first section of the topic, [Deploy into production](deploying-your-application.md).

## Implement user authentication for your app
Each RMS API has a callback that must be implemented in order to enable the user's authentication. The RMS SDK 4.2 will then use your implementation of the callback when you do not provide an access token, when your access token needs to be refreshed or when the access token is expired.

- Android -  [AuthenticationRequestCallback](https://msdn.microsoft.com/library/dn758255.aspx) and [AuthenticationCompletionCallback](https://msdn.microsoft.com/library/dn758250.aspx) interfaces.
- iOS / OS X -  [MSAuthenticationCallback](https://msdn.microsoft.com/library/dn758312.aspx) protocol.
-  Windows Phone / Window RT -  [IAuthenticationCallback](https://msdn.microsoft.com/library/microsoft.rightsmanagement.iauthenticationcallback.aspx) interface.
- Linux -  [IAuthenticationCallback](https://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1IAuthenticationCallback.html) interface.

### What library to use for authentication
In order to implement your authentication callback you will need to download an appropriate library and configure your development environment to use it. You will find the ADAL libraries on GitHub for these platforms.

Each of the following resources contains guidance to setup your environment and use the library.

-   [Windows Azure Active Directory Authentication Library (ADAL) for iOS](https://github.com/MSOpenTech/azure-activedirectory-library-for-ios/)
-   [Windows Azure Active Directory Authentication Library (ADAL) for Mac](https://github.com/MSOpenTech/azure-activedirectory-library-for-ios/)
-   [Windows Azure Active Directory Authentication Library (ADAL) for Android](https://github.com/MSOpenTech/azure-activedirectory-library-for-android)
-   [Windows Azure Active Directory Authentication Library (ADAL) for dotnet](https://github.com/AzureAD/azure-activedirectory-library-for-dotnet)
-   For Linux SDK, the ADAL library is packaged with the SDK source, available via [Github](https://github.com/AzureAD/rms-sdk-for-cpp).

> [!NOTE]
> We recommend that you use one of the ADAL although you may use other authentication libraries.

### Authentication parameters

ADAL requires several pieces of information to successfully authenticate a user to Azure RMS (or AD RMS). These are standard OAuth 2.0 parameters and are generally required of any Azure AD app. You will find the current guidelines for ADAL usage in the README file of the corresponding Github repositories, listed previously.

- **Authority** – the URL for the authentication end-point, usually AAD or ADFS.
- **Resource** - the URL/URI of the service application you are trying to access, usually Azure RMS or AD RMS.
- **User Id** – the UPN, usually email address, of the user who wants to access the app. This parameter can be empty if the user is not yet known, and is also used for caching the user token or requesting a token from the cache. It is also generally used as a *hint* for user prompting.
- **Client Id** – the ID of your client app. This must be a valid Azure AD application ID.
and comes from the previous registration step via the Azure portal.
- **Redirect Uri** – provides the authentication library with a URI target for the authentication code. Specific formats are required for iOS and Android. These are explained in the README files of the corresponding GitHub repositories of ADAL. This value comes from the previous registration step via the Azure  portal.

> [!NOTE]
> **Scope** is not currently used but may be and is therefore reserved for future use.

    Android: `msauth://packagename/Base64UrlencodedSignature`

    iOS: `<app-scheme>://<bundle-id>`

> [!NOTE]
> If your app does not follow these guidelines, Azure RMS and Azure AD workflows are likely to fail and will not be supported by Microsoft.com. Further, the Rights Management License Agreement (RMLA) may be violated if an invalid Client Id is used in a production app.

### What should an authentication callback implementation look like
**Authentication Code Examples** - This SDK has example code showing the use of authentication callbacks. For your convenience, these code examples are represented here as well as in each of the follow linked topics.

**Android user authentication** - for more information, see [Android code examples](android-code.md), **Step 2** of the first scenario, "Consuming an RMS protected file".


    class MsipcAuthenticationCallback implements AuthenticationRequestCallback
    {
    ...

    @Override
    public void getToken(Map<String, String> authenticationParametersMap,
                         final AuthenticationCompletionCallback authenticationCompletionCallbackToMsipc)
    {
        String authority = authenticationParametersMap.get("oauth2.authority");
        String resource = authenticationParametersMap.get("oauth2.resource");
        String userId = authenticationParametersMap.get("userId");
        mClientId = “12345678-ABCD-ABCD-ABCD-ABCDEFGHIJ”; // get your registered Azure AD application ID here
        mRedirectUri = “urn:ietf:wg:oauth:2.0:oob”;
        final String userHint = (userId == null)? "" : userId;
        AuthenticationContext authenticationContext = App.getInstance().getAuthenticationContext();
        if (authenticationContext == null || !authenticationContext.getAuthority().equalsIgnoreCase(authority))
        {
            try
            {
                authenticationContext = new AuthenticationContext(App.getInstance().getApplicationContext(), authority, …);
                App.getInstance().setAuthenticationContext(authenticationContext);
            }
            catch (NoSuchAlgorithmException e)
            {
                …
                authenticationCompletionCallbackToMsipc.onFailure();
            }
            catch (NoSuchPaddingException e)
            {
                …
                authenticationCompletionCallbackToMsipc.onFailure();
            }
       }
        App.getInstance().getAuthenticationContext().acquireToken(mParentActivity, resource, mClientId, mRedirectURI, userId, mPromptBehavior,
                       "&USERNAME=" + userHint, new AuthenticationCallback<AuthenticationResult>()
                        {
                            @Override
                            public void onError(Exception exc)
                            {
                                …
                                if (exc instanceof AuthenticationCancelError)
                                {
                                     …
                                    authenticationCompletionCallbackToMsipc.onCancel();
                                }
                                else
                                {
                                     …
                                    authenticationCompletionCallbackToMsipc.onFailure();
                                }
                            }

                            @Override
                            public void onSuccess(AuthenticationResult result)
                            {
                                …
                                if (result == null || result.getAccessToken() == null
                                        || result.getAccessToken().isEmpty())
                                {
                                     …
                                }
                                else
                                {
                                    // request is successful
                                    …
                                    authenticationCompletionCallbackToMsipc.onSuccess(result.getAccessToken());
                                }
                            }
                        });
                         }


**iOS/OS X user authentication** - for more information, see [iOS/OS X code examples](ios-os-x-code-examples.md),
*Step 2 of the first scenario, "Consuming an RMS protected file".*


    // AuthenticationCallback holds the necessary information to retrieve an access token.
    @interface MsipcAuthenticationCallback : NSObject<MSAuthenticationCallback>

    @end

    @implementation MsipcAuthenticationCallback

    - (void)accessTokenWithAuthenticationParameters:
         (MSAuthenticationParameters *)authenticationParameters
                                completionBlock:
         (void(^)(NSString *accessToken, NSError *error))completionBlock
    {
    ADAuthenticationError *error;
    ADAuthenticationContext* context = [ADAuthenticationContext authenticationContextWithAuthority:authenticationParameters.authority error:&error];

    NSString *appClientId = @”12345678-ABCD-ABCD-ABCD-ABCDEFGHIJ”;

    // get your registered Azure AD application ID here

    NSURL *redirectURI = [NSURL URLWithString:@”ms-sample://com.microsoft.sampleapp”];

    // get your <app-scheme>://<bundle-id> here
    // Retrieve token using ADAL
    [context acquireTokenWithResource:authenticationParameters.resource
                             clientId:appClientId
                          redirectUri:redirectURI
                               userId:authenticationParameters.userId
                      completionBlock:^(ADAuthenticationResult *result)
                      {
                          if (result.status != AD_SUCCEEDED)
                          {
                              NSLog(@"Auth Failed");
                              completionBlock(nil, result.error);
                          }
                          else
                          {
                              completionBlock(result.accessToken, result.error);
                          }
                      }

        ];
    }



**Linux user authentication** - for more information, see [Linux code examples](linux-c-code-examples.md).



    // Class Header
    class AuthCallback : public IAuthenticationCallback {
    private:

      std::shared_ptr<rmsauth::FileCache> FileCachePtr;
      std::string clientId_;
      std::string redirectUrl_;

      public:

      AuthCallback(const std::string& clientId,
               const std::string& redirectUrl);
      virtual std::string GetToken(shared_ptr<AuthenticationParameters>& ap) override;
    };

    class ConsentCallback : public IConsentCallback {
      public:

      virtual ConsentList Consents(ConsentList& consents) override;
    };

    // Class Implementation
    AuthCallback::AuthCallback(const string& clientId, const string& redirectUrl)
    : clientId_(clientId), redirectUrl_(redirectUrl) {
      FileCachePtr = std::make_shared<FileCache>();
    }

    string AuthCallback::GetToken(shared_ptr<AuthenticationParameters>& ap)
    {
      string redirect =
      ap->Scope().empty() ? redirectUrl_ : ap->Scope();

      try
      {
        if (redirect.empty()) {
        throw rmscore::exceptions::RMSInvalidArgumentException(
              "redirect Url is empty");
      }

      if (clientId_.empty()) {
      throw rmscore::exceptions::RMSInvalidArgumentException("client Id is empty");
      }

      AuthenticationContext authContext(
        ap->Authority(), AuthorityValidationType::False, FileCachePtr);

      auto result = authContext.acquireToken(ap->Resource(),
                                           clientId_, redirect,
                                           PromptBehavior::Auto,
                                           ap->UserId());
      return result->accessToken();
      }

      catch (const rmsauth::Exception& ex)
      {
        // out logs
        throw;
      }
    }
