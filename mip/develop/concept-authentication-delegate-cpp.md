---
title: Concepts - Authentication delegate implementation (C++)
description: This article will help you understand how to implement an authentication delegate in C++.
author: msmbaldwin
ms.service: information-protection
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.date: 09/27/2018
ms.author: mbaldwin
---
# Microsoft Information Protection SDK - Implementing an authentication delegate (C++)

The MIP SDK does implement an authentication delegate for handling authentication challenges and responding with a token. It does not itself implement token acquisition. The token acquisition process is up to the developer and is accomplished by extending the `mip::AuthDelegate` class, specifically the `AcquireOAuth2Token` member function.

## Building AuthDelegateImpl

To extend the base class `mip::AuthDelegate`, we create a new class called `sample::auth::AuthDelegateImpl`. This class implements the `AcquireOAuth2Token` functionality, and sets up the constructor to take in our authentication parameters.

### auth_delegate_impl.h

For this example, the default constructor accepts just username, password, and the application's [application ID](/azure/active-directory/develop/developer-glossary#application-id-client-id). These will be stored in the private variables `mUserName`, `mPassword`, and `mClientId`.

It's important to note that information such as the identity provider or resource URI aren't necessary to implement, at least not in the `AuthDelegateImpl` constructor. That information is passed as part of `AcquireOAuth2Token` in the `OAuth2Challenge` object. Instead, we'll pass those details to the `AcquireToken` call in `AcquireOAuth2Token`.

```cpp
//auth_delegate_impl.h
#include <string.h>
#include "mip/common_types.h"

namespace sample {
namespace auth {
class AuthDelegateImpl final : public mip::AuthDelegate { //extend mip::AuthDelegate base class
public:
  AuthDelegateImpl() = delete;

//constructor accepts username, password, and mip::ApplicationInfo.
  AuthDelegateImpl::AuthDelegateImpl(
    const mip::ApplicationInfo& applicationInfo,
    std::string& username,
    const std::string& password)
    : mApplicationInfo(applicationInfo),
      mUserName(username),
      mPassword(password) {
  }

  bool AcquireOAuth2Token(const mip::Identity& identity, const OAuth2Challenge& challenge, OAuth2Token& token) override;

  private:
    std::string mUserName;
    std::string mPassword;
    std::string mClientId;
    mip::ApplicationInfo mApplicationInfo;
};
}
}
```

### auth_delegate_impl.cpp

`AcquireOAuth2Token` is where the call to the OAuth2 provider will be made. In the example, below there are two calls to `AcquireToken()`. In practice, only one call would be made. These implementations will be covered in the sections provided under [Next Steps](#next-steps)

```cpp
//auth_delegate_impl.cpp
#include "auth_delegate_impl.h"
#include <stdexcept>
#include "auth.h" //contains the auth class used later for token acquisition

using std::runtime_error;
using std::string;

namespace sample {
namespace auth {

AuthDelegateImpl::AuthDelegateImpl(
    const string& userName,
    const string& password,
    const string& clientId)
    : mApplicationInfo(applicationInfo),
    mUserName(userName),
    mPassword(password) {
}

//Here we could simply add our token acquisition code to AcquireOAuth2Token
//Instead, that code is implemented in auth.h/cpp to demonstrate calling an external library
bool AuthDelegateImpl::AcquireOAuth2Token(
    const mip::Identity& /*identity*/, //This won't be used
    const OAuth2Challenge& challenge,
    const OAuth2Token& token) {

      //sample::auth::AcquireToken is the code where the token acquisition routine is implemented.
      //AcquireToken() returns a string that contains the OAuth2 token.

      //Simple example for getting hard coded token. Comment out if not used.
      string accessToken = sample::auth::AcquireToken();

      //Practical example for calling external OAuth2 library with provided authentication details.
      string accessToken = sample::auth::AcquireToken(mUserName, mPassword, mApplicationInfo.applicationId, challenge.GetAuthority(), challenge.GetResource());

      //set the passed in OAuth2Token value to the access token acquired by our provider
      token.SetAccessToken(accessToken);
      return true;
    }
}
}
```

## Next Steps

To complete the authentication implementation, it's necessary to build the code behind the `AcquireToken()` function. The examples below discuss a few ways to acquire the token.

- [Simple/PowerShell token acquisition example](concept-authentication-acquire-token-ps.md)
- [Python token acquisition example](concept-authentication-acquire-token-py.md)
