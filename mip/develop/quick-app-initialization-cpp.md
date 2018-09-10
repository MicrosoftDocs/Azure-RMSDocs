---
title: Quickstart - Initialization for Microsoft Information Protection (MIP) SDK C++ clients
description: A quickstart showing you how to write the initialization logic for a Microsoft Information Protection (MIP) SDK client applications.
services: information-protection
author: BryanLa
ms.service: information-protection
ms.topic: quickstart
ms.date: 09/10/2018
ms.author: bryanla
---

# Quickstart: Client application initialization (C++)

This quickstart illustrates the patterns used by MIP C++ SDK clients for initialization. The steps outlined in this quickstart are required for any client application that uses the MIP File, Policy, or Protection APIs.

> [!NOTE]
> Although this quickstart uses File API examples, this same pattern is applicable to clients using the Policy and Protection APIs.

## Prerequisites

If you haven't already, complete the following before continuing with this quickstart:

- Complete the steps in [Microsoft Information Protection (MIP) SDK setup and configuration](setup-configure-mip.md).
- Review [Observers in the MIP SDK](concepts-async-observers.md), as the MIP SDK is designed to be almost entirely asynchronous.

## Observers

(TBD) Not sure if we need this?

https://github.com/MicrosoftDocs/Azure-RMSDocs-pr/blob/release-mip/mip/develop/tutorial-file/observer.md

## Authentication

Authentication in the MIP SDK is performed by extending the `mip::AuthDelegate` delegate class, to implement your preferred method of authentication.

`mip::AuthDelegate` contains two classes:

- `mip::AuthDelegate::OAuth2Challenge`
- `mip::AuthDelegate::OAuth2Token`

`AuthDelegate` has a virtual function called `mip::AuthDelegate::AcquireOAuth2Token`. This virtual function should be extended by developers to use their preferred method of access token acquisition. 

`mip::AuthDelegate::AcquireOAuth2Token` accepts three parameters:

- `mip::Identity`: The identity of the user or service to be authenticated, if known.
- `mip::AuthDelegate::OAuth2Challenge`: Accepts two parameters, **authority** and **resource**. **Authority** is the service the token will be generated against. **Resource** is the service we're trying to access. The SDK will handle passing these parameters in to the delegate when called.
- `mip::AuthDelegate::OAuth2Token`: We will write the token result to this object. It will be consumed by the SDK when the engine is loaded. Outside of our authentication implementation, it shouldn't be necessary to get or set this value anywhere.

`AcquireOAuth2Token` returns a bool that indicates whether token acquisition was successful.

**Important:** Applications won't ever have to call `AcquireOAuth2Token` directly. The SDK will call this on the auth delegate implementation when required.

### Implement an authentication delegate 



## Consent (TBD - since QS, should probably leave in concepts and point to it)

The `mip::Consent` enum class implements an easy-to-use approach that permits application developers to provide a custom consent experience based on the endpoint that is being accessed by the SDK. The notification can inform a user of the data that will be collected, how to get the data removed, or any other information that is required by law or compliance policies. Once the user grants consent, the application can continue. 

GDPR info here? 
Exception details?

### Implement a consent delegate

Consent is implemented by extending the `mip::Consent` base class and implementing `GetUserConsent` to return one of the `mip::Consent` enum values. 

The object derived from `mip::Consent` is passed in to the `mip::FileProfile::Settings` or `mip::ProtectionProfile::Settings` constructor.

When a user performs an operation that would require providing consent, the SDK calls the `GetUserConsent` method, passing in the destination URL as the parameter. It's in this method where one would implement displaying the necessary information to the user, allowing them to make a decision on whether or not they consent to using the service. 

Operations that will trigger the consent flow are (TBD):

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

### Sample Consent Delegate Implementation

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

## Profile creation

From: https://github.com/tommoser/build-ILL-mip-sdk/wiki/Build-2018-Workshop-Instructions#fileprofile 
From: https://github.com/MicrosoftDocs/Azure-RMSDocs-pr/blob/release-mip/mip/develop/tutorial-file/profile.md 


## Engine creation

From: https://github.com/tommoser/build-ILL-mip-sdk/wiki/Build-2018-Workshop-Instructions#engine 
From: https://github.com/MicrosoftDocs/Azure-RMSDocs-pr/blob/release-mip/mip/develop/tutorial-file/engine.md 

## Next Steps

Now you're ready for the next quickstart, where you'll start to experience the MIP File APIs.

> [!div class="nextstepaction"]
> [List sensitivity labels](quick-file-list-labels-cpp.md)