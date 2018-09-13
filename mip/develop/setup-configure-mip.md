---
title: Microsoft Information Protection (MIP) SDK setup and configuration
description: Provides the setup and configuration prerequisites, in order to use applications built with the Microsoft Information Protection SDK.
services: information-protection
author: BryanLa
ms.service: information-protection
ms.topic: quickstart
ms.date: 09/27/2018
ms.author: bryanla
---

# Microsoft Information Protection (MIP) SDK setup and configuration 

The Quickstart and Tutorial articles are centered around building applications that use the MIP SDK libraries and APIs. This article shows you how to set up and configure your Office 365 subscription and client workstation, in preparation for using the SDK.

Be sure to review the following topics before getting started:

* [What is Office 365 Security and Compliance Center?](https://docs.microsoft.com/office365/securitycompliance/security-and-compliance)
* [What is Azure Information Protection?](https://docs.microsoft.com/azure/information-protection/understand-explore/what-is-information-protection)
* [How does the protection work in Azure Information Protection?](https://docs.microsoft.com/azure/information-protection/understand-explore/what-is-information-protection#how-data-is-protected)

## Sign up for an Office 365 subscription

Many of the SDK samples require access to an Office 365 subscription. If you haven't already, be sure to sign up for one of the following subscription types:

| Name | Sign-up |
|------|---------|
| Office 365 Enterprise E3 Trial (30-day free trial) | https://go.microsoft.com/fwlink/p/?LinkID=403802 |
| Office 365 Enterprise E3 or E5 | https://products.office.com/business/office-365-enterprise-e3-business-software |
| Enterprise Mobility and Security E3 or E5 | https://www.microsoft.com/cloud-platform/enterprise-mobility-security |
| Azure Information Protection Premium P1 or P2 | https://azure.microsoft.com/pricing/details/information-protection/ |

(TBD) QUESTIONS:
- Should we add Microsoft 365 to the above?
- Is AIP Premium P1/P2 backed by an Azure AD tenant? Or does the user need to sign up for an Azure subscription first, and use that AAD account to get the AIP P1/P2 subscription?
- Do they still need a whitelisted tenant? per "Because the MIP SDK requires an Office 365 tenant with certain private preview features enabled, you must have an account from a properly configured preview tenant. If you need a test account, you can submit a request at https://aka.ms/mipsdkpreviewaccount. "

## Configure your client workstation

Next, complete the following steps to ensure your client computer is set up and configured correctly. 

>[!NOTE]
> The code examples in the Quickstart and Tutorial sections assume use of Visual Studio 2017 or greater.

### Windows 10

1. Using Windows Update, update your machine to Windows 10 Fall Creators Update (version 1709) or later. To  verify your current version:
    - Click the Windows icon in the lower left.
    - Type "About your PC" and press the "Enter" key.
    - Scroll down to **Windows specifications** and look under **Version**.
2. Install [Visual Studio 2017](https://visualstudio.microsoft.com/downloads/), with the following workloads and optional components:
    - **Universal Windows Platform development** Windows workload, plus the following optional components:
        - **C++ Universal Windows Platform tools**
        - **Windows 10 SDK 10.0.16299.0 SDK** or later, if not included by default
    - **Desktop development with C++** Windows workload, plus the following optional components:
        - **Windows 10 SDK 10.0.16299.0 SDK** or later, if not included by default 

        [![Visual Studio setup](media/setup-mip-client/visual-studio-install.png)](media/setup-mip-client/visual-studio-install.png#lightbox)

3. Download the SDK samples and binaries: 
    - (TBD) Samples 
        - First create a [GitHub profile](https://github.com/join), if you don't already have one.
        - Install the latest version of [Software Freedom Conservancy's Git client tools](https://git-scm.com/download/)
        - `git clone <repo-path>`
    - (TBD) Binaries [NOTE: will also impact the include/lib path instructions in the App Initialization quickstart]
        - Contained in Sample repo?
        - OR, download .zip and copy to a local/project directory? If so, https://aka.ms/mipsdkbins or https://aka.ms/MIPSDKPreviewBins?
        - OR, NuGet?
    - (TBD) Info on supported platforms, system requirements?
5. Ensure "Developer Mode" is enabled on your workstation:
    - Click the Windows icon in the lower left.
    - Type "Use developer features" and press the "Enter" key, when you see the **Use Developer Features** item show.
    - On the **Settings** dialog, **For developers** tab, under "Use developer features", select the **Developer mode** option.
    - Close the **Settings** dialog.

## Register a client application with Azure Active Directory

As part of the Office 365 subscription provisioning process, an associated Azure AD tenant is created. The Azure AD tenant provides identity and access management for Office 365 *user accounts* and *application accounts*. Applications that require access to secured APIs (such as MIP APIs), require an application account in order to sign in and authenticate.

Upon sign-in, accounts are represented by a *security principal*, which encapsulates the account's identity configuration for access control, etc. Security principals that represent an application account (such as an application built with the MIP SDK), are referred to as a [*service principal*](/azure/active-directory/develop/developer-glossary#service-principal-object). 

To create an application account for use with MIP SDK client applications:

  > [!IMPORTANT] 
  > To access Azure AD tenant management for account creation, you'll need to sign in to the Azure portal with a user account that is a member of the [Subscription administrator](/azure/billing/billing-add-change-azure-subscription-administrator) role. Depending on the configuration of your tenant, you may also need to be a member of the global admininstrator directory role to [register an application](https://ms.portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/RegisteredApps).
  > We recommend testing with a restricted account. Be sure the account only has rights to access the necessary SCC endpoints. Cleartext passwords passed via commandline may be collected by logging systems.

1. Follow the steps in [Integrating applications with Azure Active Directory, Add an application section](/azure/active-directory/develop/quickstart-v1-integrate-apps-with-azure-ad#adding-an-application). For testing purposes, use the following values for the given properties as you go through the guide: 
    - **Application type** - Select "Native", as the client applications demonstrated by the SDK are console applications. Console applications are considered "public" clients by OAuth2. Unlike a "confidential" server-based application, such as a web application, "public" clients are not able to register or use secure credentials.
    - **Redirect URI** - Since the SDK uses simple console client applications, use a URI in the format `<app-name>://authorize`.

2. When finished, you'll be returned to the **Registered app** page for your new application registration. Copy the GUID in the **Application ID** field, as you will need this later. 

3. Then click **Settings** to add the APIs and permissions to which the client will need access. On the **Settings** page, click **Required permissions**.

4. On the **Required permissions** page, click **Add**
   - On the **Add API access** page, click **Select an API**
     - On the **Select an API** Page, select the **Microsoft Rights Management Services** API, and click **Select**.
       - On the **Enable Access** page for the API's available permissions, select **Create and access protected content for users**, and click **Select**, then **Done**

5. Repeat step #4, but this time when you get to the **Select an API** page, you'll need to search for the API. 
   - In the search box, type **Microsoft Information Protection Sync Service** then select the service and click **Select**.
     - On the **Enable Access** page for the API's available permissions, select **Read all unified policies a user has access to**, and click **Select**, then **Done**

6. When you're back on the **Required Permissions** page, click **Grant Permissions**, then **Yes**. This step gives pre-consent to the application using this registration, to access the APIs under the specified permissions. If you signed in as a global administrator,  consent is recorded for all users in the tenant; otherwise, it applies only to your user account.

For more details on adding APIs and permissions to a registration, see [Updating an application, Configure a client application to access web APIs section](/azure/active-directory/develop/quickstart-v1-integrate-apps-with-azure-ad#updating-an-application). Here you'll find information on adding the APIs and permissions needed by a client application.  

TBD: Screen shot of perms page?

## TBD: Define Label Taxonomy and Protection Settings?

See [Classification label concepts](concept-classification-labels.md).

* Provide links to SCC configuration.
* Provide details on rights required to config labels.
* Provide details on labeling taxonomy best practices.

## Next Steps

- Before starting the Quickstarts section, be sure to read about [Observers in the MIP SDK](concept-async-observers.md), as the MIP SDK is designed to be almost entirely asynchronous.
- If you're ready to gets some hands-on experience with the SDK, start with [Quickstart: Client application initialization (C++)](quick-app-initialization-cpp.md).
