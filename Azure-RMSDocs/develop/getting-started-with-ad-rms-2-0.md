---
# required metadata

title: Getting started | Azure RMS
description: The RMS SDK 2.1 platform enables developers to build applications that leverage RMS information protection.
keywords:
author: bryanla
ms.author: bryanla
manager: barbkess
ms.date: 02/23/2017
ms.topic: conceptual
ms.service: information-protection
ms.assetid: 728113C9-FCF9-4280-BE1D-6AF5C15E449E
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---
# Getting started

The Rights Management Services SDK 2.1 platform enables developers to build applications that leverage RMS information protection via an RMS Server or Azure RMS. The platform handles complex security practices such as key management, encryption and decryption processing and, offers a simplified API for easy application development.

## Get started with RMS SDK 2.1

This topic will guide you through the process of setting up and running your rights-enabled application in a testing environment. The following topics discuss how to set up your development environment and are listed such that they suggest an order that you could perform the tasks.

## In this sections

| Topic | Description |
|-------|-------------|
| [Release Notes](release-notes-rtm.md) | This topic contains important information about this and previous releases of the RMS SDK 2.1.|
| [Install the SDK](install-the-rms-sdk.md) | This topic guides you through installing the developer tools.|
| [Configure Visual Studio](how-to-configure-a-visual-studio-project-to-use-the-ad-rms-sdk-2-0.md) | This topic contains instructions about how to configure a Visual Studio project to use the RMS SDK 2.1.|
| [Developing your application](developing-your-application.md) | This topic contains essential guidance on the core aspects of an RMS enabled application and can serve as the foundation of your own application development.|
| [Testing your application](how-to-set-up-your-test-environment.md) |This topic contains instructions about how to setup for your application testing.|
| [Deploy into production](deploying-your-application.md) |This topic guides you through deployment options for your rights-enabled application.|


Try using RMS SDK 2.1 by following the guidance in these topics:

- [Install the SDK](install-the-rms-sdk.md)
- [Configure Visual Studio](how-to-configure-a-visual-studio-project-to-use-the-ad-rms-sdk-2-0.md)
- [Developing your application](developing-your-application.md)
- [Testing your application](how-to-set-up-your-test-environment.md)
- [Deploy into production](deploying-your-application.md)

### Why use RMS SDK 2.1 for protecting your content

For developers who want to add RMS support to their new and existing applications, the RMS SDK 2.1 helps make it easier to:

-   Author manageable, compliant and robust RMS-aware applications.
-   Encrypt user data persistently. The data remains encrypted regardless of the environment, device, or operating system.
-   Enforce a rich set of usage restrictions, such as preventing screen captures of your sensitive data.
-   Support enterprise-managed protection policies.
-   Support new authentication mechanisms and encryption algorithms as they become available.

The RMS SDK 2.1 supports a range of important client and server platforms. For more information see, [Supported platforms](supported-platforms.md).

## Core principles

**Simplicity**—Feedback and usage patterns for the AD RMS SDK 1.0 were analyzed, and that data used to simplify or automate the most difficult programming tasks. RMS applications authored using the RMS SDK 2.1 typically require 5–10 times fewer lines of RMS code than RMS applications written using AD RMS SDK 1.0.
**Write once**—RMS SDK 2.1 applications do not need a code change or a recompile to work with the newest RMS features. New RMS features will become available in your existing application as they get added to the RMS server.
**Consistency**—RMS SDK 2.1 helps make it easy to write applications that consistently honor different RMS configurations. It also significantly reduces the amount of RMS user interface you, as the application developer, needs to author, encouraging a consistent look and feel and reducing the need for user education.

## Related topics

* [RMS Developers Guide](developers-guide.md)