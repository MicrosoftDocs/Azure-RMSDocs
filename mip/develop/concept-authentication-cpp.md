---
title: Concepts - Authentication in the MIP SDK.
description: This article will help you understand how the MIP SDK implements authentication, and the requirements for client applications to provide OAuth2 access token acquisition logic.
author: BryanLa
ms.service: information-protection
ms.topic: conceptual
ms.date: 09/27/2018
ms.author: bryanla
---

# Authentication 

Authentication in the MIP SDK is performed by extending the class `mip::AuthDelegate` to implement your preferred method of authentication. `mip::AuthDelegate` contains:

- `mip::AuthDelegate::OAuth2Challenge` - a class that manages the OAuth2 authority info and provides to the client application.
- `mip::AuthDelegate::OAuth2Token` - a class manages OAuth2 access token acquisition (from the client application) and token storage.
- `mip::AuthDelegate::AcquireOAuth2Token()` - a pure virtual function, whose implementation determines the method of access token acquisition. After being called by the SDK, it acquires the access token, then provides it back to the SDK's authentication logic.

`mip::AuthDelegate::AcquireOAuth2Token` accepts the following parameters, and returns a bool indicating whether token acquisition was successful:

- `mip::Identity`: The identity of the user or service to be authenticated, if known.
- `mip::AuthDelegate::OAuth2Challenge`: Accepts two parameters, **authority** and **resource**. **Authority** is the service the token will be generated against. **Resource** is the service we're trying to access. The SDK will handle passing these parameters in to the delegate when called.
- `mip::AuthDelegate::OAuth2Token`: We will write the token result to this object. It will be consumed by the SDK when the engine is loaded. Outside of our authentication implementation, it shouldn't be necessary to get or set this value anywhere.

**Important:** Applications don't call `AcquireOAuth2Token` directly. The SDK will call this function when required.

## Consent

The `mip::Consent` enum class implements an easy-to-use approach that permits application developers to provide a custom consent experience based on the endpoint that is being accessed by the SDK. The notification can inform a user of the data that will be collected, how to get the data removed, or any other information that is required by law or compliance policies. Once the user grants consent, the application can continue. 


### Implementation

Consent is implemented by extending the `mip::Consent` base class and implementing `GetUserConsent` to return one of the `mip::Consent` enum values. 

The object derived from `mip::Consent` is passed in to the `mip::FileProfile::Settings` or `mip::ProtectionProfile::Settings` constructor.

When a user performs an operation that would require providing consent, the SDK calls the `GetUserConsent` method, passing in the destination URL as the parameter. It's in this method where one would implement displaying the necessary information to the user, allowing them to make a decision on whether or not they consent to using the service. 

Operations that will trigger the consent flow are:

- One
- Two

### Consent Options

- **AcceptAlways**: Consent and remember the decision.
- **Accept**: Consent once.
- **Reject**: Do not consent.

When the SDK requests user consent with this method, the client
application should present the URL to the user. Client applications should
provide some means of obtaining user consent and return the appropriate
Consent enum that corresponds to the user's decision.

### Sample implementation

#### consent_delegate_impl.h

```cpp
class ConsentDelegateImpl final : public mip::ConsentDelegate {
public:
  ConsentDelegateImpl() = default;
  
  virtual mip::Consent GetUserConsent(const std::string& url) override;

};
```

#### consent_delegate_impl.cpp

When the SDK requires consent, the `GetUserConsent` method is called *by the SDK*, and the URL passed in as a parameter. In the sample below, the user is notified that the SDK will connect to that provided URL, then returns `Consent::AcceptAlways`. This isn't a great example as the user wasn't presented with a real choice.

```cpp
Consent ConsentDelegateImpl::GetUserConsent(const string& url) {
  //Print the consent URL, ask user to choose
  std::cout << "SDK will connect to: " << url << std::endl;

  std::cout << "1) Accept Always" << std::endl;
  std::cout << "2) Accept" << std::endl;
  std::cout << "3) Reject" << std::endl;
  std::cout << "Select an option: ";
  char input;
  std::cin >> input;

  switch (input)
  {
  case '1':
    return Consent::AcceptAlways;
    break;
  case '2':
    return Consent::Accept;
    break;
  case '3':
    return Consent::Reject;
    break;
  default:
    return Consent::Reject;
  }  
}
```

## Next steps

For simplicity, samples demonstrating the delegate will implement token acquisition by calling an external script. This script can be replaced by any other type of script, an open source OAuth2 library, or a custom OAuth2 library.

- [Acquire an access token using PowerShell](concept-authentication-acquire-token-ps.md)
- [Acquire an access token using Python](concept-authentication-acquire-token-py.md)
