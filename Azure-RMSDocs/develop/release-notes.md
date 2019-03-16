---
# required metadata

title: What's new and release notes
description: Outlines important changes and features in this and previous versions.
author: msmbaldwin
ms.author: mbaldwin
manager: barbkess
ms.date: 12/11/2018
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 4fa1c686-b00b-4734-9abb-141ce582a6af
audience: developer
ms.reviewer: kartikk
ms.suite: ems
---

# What's new and Release notes

## What's new

This topic outlines important changes and features in this new version of the RMS  SDK v4.x.

-   [New for July 2017](#new-for-july-2017)
-   [October 2016 update](#October-2016-update)
-   [June 2016 update](#june-2016-update)
-   [December 2015 update](#december-2015-update)
-   [July 2015 update - Adds support for Linux / C++ development](#july-2015-update---adds-support-for-linux--c-development)
-   [May 2015 update - Adds logging control](#may-2015-update---adds-logging-control)
-   [February 2015 update - Adds Windows Store application support](#february-2015-update---adds-windows-store-application-support)
-   [January 2015 Update - Adds WinPhone platform support](#january-2015-update---adds-winphone-platform-support)
-   [October 2014 update - Upgrade to Microsoft RMS SDK 4.1](#october-2014-update---upgrade-to-microsoft-rms-sdk-41)
-   [Release notes](#release-notes)
-   [Frequently asked questions](#frequently-asked-questions)

### New for July 2017

The update for our July release included incrementing the revision of the SDK, now 4.2.5.

- Android SDK: Your app can now **set the logging level on-the-fly** with the Android SDK. For more information, see [How to: Enable error and performance logging](https://docs.microsoft.com/information-protection/develop/enabling-logging)
- The iOS SDK does not support logging level. 
- The SDK now returns an error for a NULL access token.

### October 2016 update

- Implement a few back-end bug fixes.
- Enable bitcode for the Apple iOS/OSX SDK.

### June 2016 update

- **Support for Modern Authentication** - brings Active Directory Authentication Library (ADAL)-based sign-in to RMS enlightened apps. It enables sign-in features like Multi-Factor Authentication (MFA), SAML-based third-party Identity Providers with RMS client applications, smart card, and certificate-based authentication and it removes the need for RMS enlightened apps to use the basic authentication protocol.
- **Document Tracking support** - developers can now enable document tracking when protecting document in their apps
- Performance improvements
- Bug fixes

### December 2015 update

With this release, the RMS SDK for devices is now at version 4.2 and adds:

-   Document tracking, RMS On-line only, for iOS/OS X and Android operating systems.

    For details and usage guidance on iOS/OS X, see the [MSLicenseMetadata](https://msdn.microsoft.com/library/mt573683.aspx) class, which provides tracking information and the additional document tracking registration method on [MSUserPolicy](https://msdn.microsoft.com/library/dn790796.aspx). There are similar additions for Android to [LicenseMetadata](https://msdn.microsoft.com/library/mt573675.aspx) and [UserPolicy](https://msdn.microsoft.com/library/dn790887.aspx).

    For a detailed description of the document tracking feature, see [How to: Use document tracking](how-to-use-document-tracking.md).

-   A set of synchronous methods that parallel the asynchronous versions for the Android API:

    [CustomProtectedInputStream.create synchronous method](https://msdn.microsoft.com/library/mt631362.aspx)

    [CustomProtectedOutputStream.create synchronous method](https://msdn.microsoft.com/library/mt631363.aspx)

    [ProtectedFileInputStream.create synchronous method](https://msdn.microsoft.com/library/mt631375.aspx)

    [ProtectedFileOutputStream.create synchronous method](https://msdn.microsoft.com/library/mt631376.aspx)

    [TemplateDescriptor.getTemplates synchronous method](https://msdn.microsoft.com/library/mt631380.aspx)

    [UserPolicy.acquire synchronous method](https://msdn.microsoft.com/library/mt631384.aspx)

    [UserPolicy.create (PolicyDescriptor…) synchronous method**](https://msdn.microsoft.com/library/mt631385.aspx)

    [UserPolicy.create (TempalteDescriptor…) synchronous method](https://msdn.microsoft.com/library/mt631386.aspx)

-   A new [ProtectedBuffer](https://msdn.microsoft.com/library/mt631369.aspx) class has been added to the Android API.
-   Updates to improve error messaging and troubleshooting experience.
-   Significant performance improvements for cryptographic operations.

### July 2015 Update - Adds support for Linux / C++ development

This release adds the following updates:

-   RMS SDK 4.1 for Linux platforms

    For more information, see [Get started](get-started.md).

### May 2015 Update - Adds logging control

This release adds support for the following updates:

-   iOS

    App encrypt and decrypt can operate independently and in parallel.

    For more information, see [MSProtector](https://msdn.microsoft.com/library/mt210993.aspx).

    Log level control settings enabled.

    For more information, see [How to: Enable error and performance logging](enabling-logging.md)

    Cache clearing support added.

    For more information, see [MSProtection:resetStateWithCompletionBlock](https://msdn.microsoft.com/library/mt210991.aspx).

### February 2015 Update - Adds Windows Store application support

This release adds support for Windows Store applications and provides functional parity with the Windows Phone, Android, and iOS/OS X release of the RMS SDK 4.1.

### January 2015 Update - Adds WinPhone platform support

This release adds support for the Windows Phone operating system and provides functional parity with the Android and iOS/OS X release of the RMS SDK 4.1.

### October 2014 Update - Upgrade to Microsoft RMS SDK 4.1

The version 4.1 release of the RMS SDK adds the following new features to the Google Android and Apple iOS / OS X.

-   Android and iOS/OS X SDK API extensions for *user consent* processing, allowing user confirmation of SDK behaviors. Currently, document tracking and accessing unknown AD RMS service URLs are the supported consent types.

    For more information, see as example, the Android API version of [ConsentCallback interface](https://msdn.microsoft.com/library/dn833503.aspx).

-   iOS 8 and OS X 10.10 (Yosemite) are now supported. There have also been a few property name changes required by Xcode 6.

    Example; MSUserPolicy.name changed to [MSUserPolicy.policyName](https://msdn.microsoft.com/library/dn790799.aspx).

## Release notes

This section outlines information about the current and previous releases of the Microsoft Rights Management SDK 4.x APIs that you, as a developer, want to be aware of.

**AD RMS SDK 4.1 - iOS / OS X and Android platforms Global Availability Release**

-   **AD RMS support** - IT administrators can use RMS enabled apps on mobile devices with the new AD RMS server's mobile device extensions.
-   **Offline Consumption** - end users can access RMS protected data offline.
-   **Segregated Auth** - developers can use their own authentication library for Azure RMS and AD RMS (or use the recommended [Azure AD Authentication Library (ADAL)](https://MSDN.Microsoft.Com/library/jj573266.aspx)).
-   **Segregated UI** - developers can build their user interface to protect and consume RMS protected documents.
-   **Redesigned API** - developers can now enjoy a straightforward and transparent encryption and decryption API, which provides consistent RMS behaviors and user experience, with minimum effort.

**Common to all platforms**

-   The RMS SDK 4.x APIs are not *thread-safe*.

**Android**

-   When you use a sample app on an Amazon® Kindle device to view .ptxt attachments, you must first download the file before you view it.

    **Solution** - a known issue that will be addressed later.

-   An application that uses the SDK may crash if multi-instance is allowed.

    **Solution** - Make sure the application does not allow multi-instance calls to the Android API.

-   When I use the [ProtectedFileOutputStream](https://msdn.microsoft.com/library/dn790855.aspx).write( byte\[\] array, int offset, int length ) method with a length different from the *array.length* value, I am not able to consume the content later using the SDK.

    **Solution** - This is a known issue. To mitigate it, either always pass a *byte \[\]* array with the same length value as the length parameter, or use the [ProtectedFileOutputStream](https://msdn.microsoft.com/library/dn790855.aspx).write(byte\[\] array) method.

**iOS and OS X**

-   There are two dialects of Portuguese that our iOS and OS X SDKs support. Unfortunately, due to a bug, we do not currently support the first localization completely. Because of this bug, Portuguese is not fully supported. Most of the text is translated, but not the UI.

    1. Portuguese

    2. Portuguese (Portugal)

**iOS only**

-   The RMS SDK 4.x does not show the network activity indicator.

    This is a known optional behavior for iOS according to the Apple Human Interface Guidelines.

**OS X only**

-   The RMS SDK 4.x does not show the network activity indicator.

    This is a known optional behavior for OS X according to the Apple Human Interface Guidelines.

-   **Solution** - To create a multiple document interface (MDI) application using our OS X SDK, use the following guidance.

    The following methods must not be run concurrently. In order to monitor for execution completion, use the completion block approach as noted.

    - [MSProtectedData.protectedDataWithProtectedFile](https://msdn.microsoft.com/library/dn758351.aspx)
    - [MSCustomProtectedData.customProtectedDataWithPolicy](https://msdn.microsoft.com/library/dn758315.aspx)



**Note**  MDI applications are not supported by our iOS API.

## Frequently asked questions

**All platforms**

**Q**: I don’t see a **Custom Permissions** selection UI in the protection workflow. Why?

**A**: This is a known issue and will be addressed later.

**Q**: How do I get new organizational tenants to try out the SDK and sample applications?

**A**: To request credentials for Azure AD RMS test organizations, send email to <rmcstbeta@microsoft.com>.

**Q**: I don’t see any test hierarchy discussion here in the documentation. Why?

**A**: There is no test hierarchy concept with the new AD RMS SDKs. You will always work with the production hierarchy.

**Q**: In the 2.1 version of the RMS SDK, a generated manifest was needed for each application implementing information protection. Is this still true for the 4.0 and later versions of the SDK?

**A**: No, manifests are no longer needed for the 3.0 and later versions of the Rights Management SDK.

**Android**

**Q**: Which development environments has the SDK been tested with?

**A**: Eclipse Juno using Google API 15 and above.

**Q**: Can I call cancel() a cancel method from the UI thread?
**A**: You should call cancel() from a non-UI thread, as it may abort network a connection.

**iOS**

**Q**: Which platforms were verified for SDK development?

**A**: Xcode 5.0 with iOS 7 and later.

**Q**: I called a cancel() method on an operation, however I still got notification that the operation completed. Why?

**A**: Not all operations can be canceled, so a cancellation operation is executed as best as is possible.

**OS x**

**Q**: Sample app framework is adapted to Xcode 5, can I work with Xcode 4.6?

**A**:The OS X SDK works with Xcode 4.6 and later only, as well as OS X 10.8 and later.
