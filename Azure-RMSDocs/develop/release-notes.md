---
# required metadata

title: What's new and release notes | Azure RMS
description: Outlines important changes and features in this new version of the RMS SDK.
keywords:
author: bruceperlerms
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 3b482c5f-fd40-47d5-acdc-13d2e80d5171

# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

﻿
# What's new and release notes

## What's new
Microsoft Rights Management SDK 4.2 takes RMS application enablement to a new level of ease and flexibility. This topic outlines important changes and features in this new version of the RMS SDK.

-   [New for our December 2015 Update](#new_for_our_december_2015_update)
-   [July 2015 Update - Adds support for Linux / C++ development](#july_2015_update_-_adds_support_for_linux___c___development)
-   [May 2015 Update - Adds logging control](#may_2015_update_-_adds_logging_control)
-   [February 2015 Update - Adds Windows Store application support](#february_2015_update_-_adds_windows_store_application_support)
-   [January 2015 Update - Adds WinPhone platform support](#january_2015_update_-_adds_winphone_platform_support)
-   [October 2014 Update - Upgrade to Microsoft RMS SDK 4.1](#october_2014_update_-_upgrade_to_microsoft_rms_sdk_4.1)
-   [Release notes](#release_notes)
-   [Frequently asked questions](#frequently_asked_questions)

### New for our December 2015 Update

With this release, the RMS SDK for devices is now at version 4.2 and adds:

-   Document tracking, RMS On-line only, for iOS/OS X and Android operating systems.

    For details and usage guidance on iOS/OS X, see the [**MSLicenseMetadata**](xref:msipcthin2.mslicensemetadata_class_objc) class which provides tracking information and the additional document tracking registration method on [**MSUserPolicy**](xref:msipcthin2.msuserpolicy_interface_objc). There are similar additions for Android to [**LicenseMetadata**](xref:msipcthin2.licensemetadata_interface_java) and [**UserPolicy**](xref:msipcthin2.userpolicy_class_java).

    For a detailed description of the document tracking feature, see [**How to: Use document tracking**](how-to-use-document-tracking.md).

-   A set of synchronous methods that parallel the asynchronous versions for the Android API:

    [**CustomProtectedInputStream.create synchronous method**](xref:msipcthin2.customprotectedinputstream_create_synchronous_method_java)

    [**CustomProtectedOutputStream.create synchronous method**](xref:msipcthin2.customprotectedoutputstream_create_synchronous_method)

    [**ProtectedFileInputStream.create synchronous method**](xref:msipcthin2.protectedfileinputstream_create_synchronous_method)

    [**ProtectedFileOutputStream.create synchronous method**](xref:msipcthin2.protectedfileoutputstream_create_synchronous_method_java)

    [**TemplateDescriptor.getTemplates synchronous method**](xref:msipcthin2.templatedescriptor_gettemplates_synchronous_method_java)

    [**UserPolicy.acquire synchronous method**](xref:msipcthin2.userpolicy_acquire_synchronous_method_java)

    [**UserPolicy.create (PolicyDescriptor…) synchronous method**](xref:msipcthin2.userpolicy_create_policydescriptor_______synchronous_method_java)

    [**UserPolicy.create (TempalteDescriptor…) synchronous method**](xref:msipcthin2.userpolicy_create_templatedescriptor_______synchronous_method_java)

-   A new [**ProtectedBuffer**](xref:msipcthin2.protectedbuffer_class) class has been added to the Android API.
-   Updates to improve error messaging and troubleshooting experience.
-   Significant performance improvements for cryptographic operations.

### July 2015 Update - Adds support for Linux / C++ development

This release adds the following:

-   RMS SDK 4.1 for Linux platforms

    For more information, see [Get started](get-started.md).

### May 2015 Update - Adds logging control

This release adds support for the following:

-   iOS

    App encrypt and decrypt can operate independently and in parallel.

    For more information, see [**MSProtector**](xref:msipcthin2.msprotector_class_objc).

    Log level control settings enabled.

    For more information, see [How to: Enable error and performance logging](enabling-logging.md)

    Cache clearing support added.

    For more information, see [**MSProtection:resetStateWithCompletionBlock**](xref:msipcthin2.msprotection_resetstatewithcompletionblock_method_objc).

### February 2015 Update - Adds Windows Store application support

This release adds support for Windows Store applications and provides functional parity with the Windows Phone, Android and iOS/OS X release of the RMS SDK 4.1.

### January 2015 Update - Adds WinPhone platform support

This release adds support for the Windows Phone operating system and provides functional parity with the Android and iOS/OS X release of the RMS SDK 4.1.

## October 2014 Update - Upgrade to Microsoft RMS SDK 4.1

The version 4.1 release of the RMS SDK adds the following new features to the Google Android and Apple iOS / OS X.

-   Android and iOS/OS X SDK API extensions for *user consent* processing, allowing user confirmation of SDK behaviors. Currently, document tracking and accessing unknown AD RMS service URLs are the supported consent types.

    For more information, see as example, the Android API version of [**ConsentCallback interface**](xref:msipcthin2.consentcallback_interface_java).

-   iOS 8 and OS X 10.10 (Yosemite) are now supported. There have also been a few property name changes required by Xcode 6.

    Example; MSUserPolicy.name changed to [**MSUserPolicy.policyName**](xref:msipcthin2.mspolicydescriptor_name_property_objc).

## Release notes

This section outlines information about the current and previous releases of the Microsoft Rights Management SDK 4.x APIs that you, as a developer, want to be aware of.

**AD RMS SDK 4.1 - iOS / OS X and Android platforms Global Availability Release**

-   **AD RMS support** - IT administrators can use RMS enabled apps on mobile devices with the new AD RMS server's mobile device extensions.
-   **Offline Consumption** - end-users can access RMS protected data offline.
-   **Segregated Auth** - developers can use their own authentication library for Azure RMS and AD RMS (or use the recommended [Azure AD Authentication Library (ADAL)](https://MSDN.Microsoft.Com/en-us/library/jj573266.aspx)).
-   **Segregated UI** - developers can build their user interface to protect and consume RMS protected documents.
-   **Re-designed API** - developers can now enjoy a simple and transparent encryption and decryption API, which provides consistent RMS behaviors and user experience, with minimum effort.

**Common to all platforms**

-   The RMS SDK 4.x APIs are not *thread-safe*.

**Android**

-   When you use a sample app on an Amazon® Kindle device to view .ptxt attachments, you must first download the file before you view it.

    **Solution** - This is a known issue and will be addressed later.

-   An application that uses the SDK may crash if multi-instance is allowed.

    **Solution** - Make sure the application does not allow multi-instance calls to the Android API.

-   When I use the [**ProtectedFileOutputStream**](xref:msipcthin2.protectedfileoutputstream_class_java)**.write(byte\[\] array, int offset, int length)** method with a length different from the *array.length* value, I am not able to consume the content later using the SDK.

    **Solution** - This is a known issue. To mitigate it, either always pass a **byte \[\]** array with the same length value as the length parameter, or use the [**ProtectedFileOutputStream**](xref:msipcthin2.protectedfileoutputstream_class_java)**.write(byte\[\] array)** method.

**iOS and OS X**

-   There are two dialects of Portuguese that our iOS and OS X SDKs support. Unfortunately, due to a bug, we do not currently support the 1st localization completely. Because of this bug, Portuguese is not fully supported. Most of the text is translated, but not the UI.

    1. Portuguese

    2. Portuguese (Portugal)

**iOS only**

-   The RMS SDK 4.x does not show the network activity indicator.

    This is a known optional behavior for iOS according to the Apple Human Interface Guidelines .

**OS X only**

-   The RMS SDK 4.x does not show the network activity indicator.

    This is a known optional behavior for OS X according to the Apple Human Interface Guidelines .

-   **Solution** - To create a multiple document interface (MDI) application using our OS X SDK, use the following guidance.

    The following methods must not be run concurrently. In order to monitor for execution completion; use the completion block approach as noted.

    - [**protectedDataWithProtectedFile**](xref:msipcthin2.msprotecteddata_protecteddatawithprotectedfile_completionblock_method_objc)
    - [**customProtectedDataWithPolicy**](xref:msipcthin2.mscustomprotecteddata_customprotecteddatawithpolicy_protecteddata_contentstartposition_contentsize_completionblock_method_objc)



**Note**  MDI applications are not supported by our iOS API.

## Frequently asked questions

**All platforms**

**Q**: I don’t see a **Custom Permissions** selection UI in the protection workflow. Why?

**A**: This is a known issue and will be addressed later.

**Q**: How do I get new organizational tenants to try out the SDK and sample applications?

**A**: To request credentials for Azure AD RMS test organizations, please send email to <rmcstbeta@microsoft.com>.

**Q**: I don’t see any test hierarchy discussion here in the documentation. Why?

**A**: There is no test hierarchy concept with the new AD RMS SDKs. You will always work with the production hierarchy.

**Q**: In the 2.1 version of the RMS SDK a generated manifest was needed for each application implementing information protection, is this still true for the 4.0 and later versions of the SDK?

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

**Q**: Sample app framework is adapted to Xcode 5, can I work with Xcode 4.6 ?

**A**:The OS X SDK works with Xcode 4.6 and later only, as well as OS X 10.8 and later.

 

 
