---
title: Set up and configure your Microsoft Information Protection (MIP) client workstation
description: Instructions for configuring a client workstation, to use applications built with the Microsoft Information Protection SDK.
services: information-protection
author: BryanLa
ms.service: information-protection
ms.topic: quickstart
ms.date: 09/10/2018
ms.author: bryanla
---

# Set up and configure your Microsoft Information Protection (MIP) client workstation

The quickstart and tutorial articles are centered around building applications that use MIP SDK libraries and APIs. This article shows you how to configure your client workstation, in preparation for using the SDK.

## Prerequisites

Be sure to review the following topics before getting started:

* [What is Office 365 Security and Compliance Center?](https://support.office.com/article/overview-of-security-and-compliance-in-office-365-dcb83b2c-ac66-4ced-925d-50eb9698a0b2?redirectSourcePath=%252farticle%252f7fe448f7-49bd-4d3e-919d-0a6d1cf675bb&ui=en-US&rs=en-US&ad=US)
* [What is Azure Information Protection?](https://docs.microsoft.com/azure/information-protection/understand-explore/what-is-information-protection)
* [How does the protection work in Azure Information Protection?](https://docs.microsoft.com/azure/information-protection/understand-explore/what-is-information-protection#how-data-is-protected)

You also need access to an Office 365 subscription. You may use any of the following types of subscriptions:

| Name | Sign-up |
|------|---------|
| Office 365 Enterprise E3 Trial (30-day free trial) | https://go.microsoft.com/fwlink/p/?LinkID=403802 |
| Office 365 Enterprise E3 or E5 | https://products.office.com/business/office-365-enterprise-e3-business-software |
| Enterprise Mobility and Security E3 or E5 | https://www.microsoft.com/cloud-platform/enterprise-mobility-security |
| Azure Information Protection Premium P1 or P2 | https://azure.microsoft.com/pricing/details/information-protection/ |

QUESTIONS:
- Should we add Microsoft 365 to the above?
- Is AIP Premium P1/P2 backed by an Azure AD tenant? Or does the user need to sign up for an Azure subscription first, and use that AAD account to get the AIP P1/P2 subscription?

## Configure your client computer

The following steps cover items you need to complete to ensure your client computer is set up correctly. 

### Windows 10

1. Using Windows Update, update your machine to Windows 10 Fall Creators Update or later.

2. Ensure [Visual Studio 2017 is installed](https://visualstudio.microsoft.com/downloads/), with the following components (TBD, from //build):
    - Universal Windows Platform development with C++ Universal Windows Platform Tools
    - Windows 10 SDK 10.0.16299.0 for UWP or later
    - Desktop development with C++ components
    - Windows 10 SDK (10.0.16299.0 or later) for Desktop C++ 
3. Download the SDK binaries - TBD: 
    - https://aka.ms/mipsdkbins ? (Sep 2108)
    - Supported platforms, system requirements
4. Download the samples (TBD: might be part of above?)
    - First create a [GitHub profile](https://github.com/join), if you don't already have one.
    - Install the latest version of [Software Freedom Conservancy's Git client tools](https://git-scm.com/download/) for your platform. 
    - TBD: git clone of repo/repos?
5. If you're using a Windows 10 workstation, ensure "Developer Mode" is enabled:
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
