---
title: Concepts - Consent in the MIP SDK.
description: This article will help you understand how the MIP SDK implements consent flows for users to agree to connecting to the RMS service.
author: msmbaldwin
ms.service: azure-information-protection
ms.topic: conceptual
ms.date: 04/10/2025
ms.author: mbaldwin
---

# Microsoft Information Protection SDK - Consent

The `mip::Consent` enum class implements an easy-to-use approach that permits application developers to provide a custom consent experience based on the endpoint that is being accessed by the SDK. The notification can inform a user of the data that will be collected, how to get the data removed, or any other information that is required by law or compliance policies. Once the user grants consent, the application can continue. This delegate is called only when attempting to access Active Directory Rights Management Services (AD RMS). It isn't called when accessing cloud services. If your application won't support AD RMS, you can implement a delegate that always returns `Consent.AcceptAlways`.

### Implementation

Consent is implemented by extending the `mip::Consent` base class and implementing `GetUserConsent` to return one of the `mip::Consent` enum values. 

The object derived from `mip::Consent` is passed in to the `mip::FileProfile::Settings` or `mip::ProtectionProfile::Settings` constructor.

When a user performs an operation that would require providing consent, the SDK calls the `GetUserConsent` method, passing in the destination URL as the parameter. It's in this method where one would implement displaying the necessary information to the user, allowing them to make a decision on whether or not they consent to using the service. 

### Consent Options

- **AcceptAlways**: Consent and remember the decision.
- **Accept**: Consent once.
- **Reject**: Don't consent.

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

When the SDK requires consent, the `GetUserConsent` method is called *by the SDK*, and the URL passed in as a parameter. In the sample below, the user is notified that the SDK will connect to that provided URL and provides the user with an option on the commandline. Based on the choice by the user, the user accepts or rejects consent and that is passed to the SDK. If the user declines to consent, the application will throw an exception, and no call is made to the protection service.

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

When in testing, or development, or when using only the cloud-based services, a basic `ConsentDelegate` can be implemented.

```cpp
Consent ConsentDelegateImpl::GetUserConsent(const string& url) {
  return Consent::AcceptAlways;
}
```

However, in production code the user may be required to be presented with a choice to consent, depending on regional or business requirements and regulations. 