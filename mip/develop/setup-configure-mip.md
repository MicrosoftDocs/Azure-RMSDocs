---
title: Microsoft Information Protection (MIP) SDK setup and configuration
description: Provides the setup and configuration prerequisites, in order to use applications built with the Microsoft Information Protection SDK.
services: information-protection
author: BryanLa
ms.service: information-protection
ms.topic: quickstart
ms.date: 09/10/2018
ms.author: bryanla
---

# Microsoft Information Protection (MIP) SDK setup and configuration 

The MIP quickstart and tutorial articles are centered around building applications that use the MIP SDK libraries and APIs. This article shows you how to make sure your Office 365 subscription and client workstation, in preparation for using the SDK.

Be sure to review the following topics before getting started:

* [What is Office 365 Security and Compliance Center?](https://docs.microsoft.com/office365/securitycompliance/security-and-compliance)
* [What is Azure Information Protection?](https://docs.microsoft.com/azure/information-protection/understand-explore/what-is-information-protection)
* [How does the protection work in Azure Information Protection?](https://docs.microsoft.com/azure/information-protection/understand-explore/what-is-information-protection#how-data-is-protected)

## Sign up for an Office 365 subscription

You need access to an Office 365 subscription in order to run the SDK samples. You may use any of the following types of subscriptions:

| Name | Sign-up |
|------|---------|
| Office 365 Enterprise E3 Trial (30-day free trial) | https://go.microsoft.com/fwlink/p/?LinkID=403802 |
| Office 365 Enterprise E3 or E5 | https://products.office.com/business/office-365-enterprise-e3-business-software |
| Enterprise Mobility and Security E3 or E5 | https://www.microsoft.com/cloud-platform/enterprise-mobility-security |
| Azure Information Protection Premium P1 or P2 | https://azure.microsoft.com/pricing/details/information-protection/ |

QUESTIONS:
- Should we add Microsoft 365 to the above?
- Is AIP Premium P1/P2 backed by an Azure AD tenant? Or does the user need to sign up for an Azure subscription first, and use that AAD account to get the AIP P1/P2 subscription?
- Because the MIP SDK requires an Office 365 tenant with certain private preview features enabled, you must have an account from a properly flighted preview tenant. If you are doing the lab in-person at //Build, creds will be provided during the workshop but disabled after. If you're doing this lab outside of //Build, please head to https://aka.ms/mipsdkpreviewaccount and request an account. (TBD)

## Configure your client workstation

The following steps cover items you need to complete to ensure your client computer is set up correctly. 

### Windows 10

1. Using Windows Update, update your machine to Windows 10 Fall Creators Update (version 1709) or later. To  verify your current version:
    - Click the Windows icon in the lower left
    - Type "About your PC" and press the "Enter" key
    - Scroll down to **Windows specifications** and look under **Version**
2. Ensure [Visual Studio 2017 is installed](https://visualstudio.microsoft.com/downloads/), with the following workloads and components:
    - **Universal Windows Platform development** Windows workload, plus the following optional components:
        - **C++ Universal Windows Platform tools**
        - **Windows 10 SDK 10.0.16299.0 SDK** or later, if not included by default
    - **Desktop development with C++** Windows workload, plus the following optional components:
        - **Windows 10 SDK 10.0.16299.0 SDK** or later, if not included by default 

        ![Visual Studio setup](media/setup-mip-client/visual-studio-install.png)

3. Download the SDK binaries and samples: 
    - IF we're using a GitHub Repo (TBD)
        - First create a [GitHub profile](https://github.com/join), if you don't already have one.
        - Install the latest version of [Software Freedom Conservancy's Git client tools](https://git-scm.com/download/)
        - `git clone <repo-path>`
    - ELSE: https://aka.ms/mipsdkbins (Sep 2108)
    - Info on supported platforms, system requirements (TBD)
5. Ensure "Developer Mode" is enabled on your workstation:
    - Click the Windows icon in the lower left
    - Type "Use developer features" and press the "Enter" key
    - On the **Settings** dialog, **For developers** tab, under "Use developer features", select the **Developer mode** option.
    - Close the **Settings** dialog.

## Register a client application with Azure Active Directory

As part of the Office 365 subscription provisioning process, an Azure AD tenant is also created. The Azure AD tenant provides identity and access management for your Office 365 subscription, and is managed through the [Azure portal](https://portal.azure.com).

Among other things, Azure AD manages the identity and access for all user and application accounts. Accounts are represented by a security principal upon sign-in, which embodies the identity configuration for the account. An application security principal is referred to as a [service principal](/azure/active-directory/develop/developer-glossary#service-principal-object). 

The MIP SDK uses a service principal to authenticate and download the MIP policy. After following the steps above, a standard user account or service principal must be used to authenticate to the service.

**Important**: In any of the tutorials that require commandline parameters where a username and password is passed in, we recommend testing with a restricted account that has no rights outside of accessing the necessary SCC endpoints. Cleartext passwords passed via commandline may be collected by logging systems.

Authenticating to Azure Active Directory (AD) requires that the client application is registered, via the Azure AD Application Registration portal. [This process](https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-integrating-applications) describes the steps required.

MIP SDK-specific steps will be covered in a later tutorial. This link is intended to provide a high-level overview of the process.

## TBD: Define Label Taxonomy and Protection Settings?

* Provide links to SCC configuration.
* Provide details on rights required to config labels.
* Provide details on labeling taxonomy best practices.

## Next Steps

Now you're ready to begin the first quickstart.

> [!div class="nextstepaction"]
> [List sensitivity labels](quick-list-labels-cpp.md)
