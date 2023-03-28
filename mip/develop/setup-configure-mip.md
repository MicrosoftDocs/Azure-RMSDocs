﻿---
title: Microsoft Information Protection (MIP) SDK setup and configuration
description: Provides the setup and configuration prerequisites, in order to use applications built with the Microsoft Information Protection SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: quickstart
ms.date: 11/14/2022
ms.author: mbaldwin
ms.custom: has-adal-ref, mode-api
#Customer intent: As a an application developer, I want to learn about setup and configuration, so that I can use the SDK to build applications.
---

# Microsoft Information Protection (MIP) SDK setup and configuration

The Quickstart and Tutorial articles are centered around building applications that use the MIP SDK libraries and APIs. This article shows you how to set up and configure your Microsoft 365 subscription and client workstation, in preparation for using the SDK.

## Prerequisites

Be sure to review the following topics before getting started:

- [Microsoft Purview compliance portal](/microsoft-365/compliance/microsoft-365-compliance-center)
- [What is Azure Information Protection?](/azure/information-protection/understand-explore/what-is-information-protection)
- [How does the protection work in Azure Information Protection?](/azure/information-protection/understand-explore/what-is-information-protection#how-data-is-protected)

> [!IMPORTANT]
> **To honor user privacy, you must ask the user to consent before enabling automatic logging.** The following example is a standard message Microsoft uses for logging notification:
>
> *By turning on Error and Performance Logging, you are agreeing to send Error and Performance Data to Microsoft. Microsoft will collect error and performance data over the internet (“Data”). Microsoft uses this Data to provide and improve the quality, security and integrity of Microsoft products and services. For example, we analyze performance and reliability, such as what features you use, how quickly the features respond, device performance, user interface interactions, and any problems you experience with the product. Data will also include information about the configuration of your software like the software you are currently running, and the IP address.*

## Sign up for an Office 365 subscription

Many of the SDK samples require access to an Office 365 subscription. If you haven't already, be sure to sign up for one of the following subscription types:

| Name                                               | Sign-up                                                                         |
| -------------------------------------------------- | ------------------------------------------------------------------------------- |
| Office 365 Enterprise E3 Trial (30-day free trial) | https://go.microsoft.com/fwlink/p/?LinkID=403802                                |
| Office 365 Enterprise E3 or E5                     | https://products.office.com/business/office-365-enterprise-e3-business-software |
| Enterprise Mobility and Security E3 or E5          | https://www.microsoft.com/cloud-platform/enterprise-mobility-security           |
| Azure Information Protection Premium P1 or P2      | [Microsoft 365 licensing guidance for security & compliance](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection/)            |
| Microsoft 365 E3, E5, or F1                        | https://www.microsoft.com/microsoft-365/compare-all-microsoft-365-plans         |

## Configure sensitivity labels

If you're currently using Azure Information Protection, you must migrate your labels to Office 365 Security and Compliance Center. For more information on the process, see [How to migrate Azure Information Protection labels to the Office 365 Security & Compliance Center](/azure/information-protection/configure-policy-migrate-labels).

## Configure your client workstation

Next, complete the following steps to ensure your client computer is set up and configured correctly.

1. If you're using a Windows 10 workstation:

   Using Windows Update, update your machine to Windows 10 Fall Creators Update (version 1709) or later. To verify your current version:

   - Click the Windows icon in the lower left.
   - Type "About your PC" and press the "Enter" key.
   - Scroll down to **Windows specifications** and look under **Version**.

1. If you're using a Windows 11 or Windows 10 workstation:

   Ensure "Developer Mode" is enabled on your workstation:
   - Click the Windows icon in the lower left.
   - Type "Use developer features" and press the "Enter" key, when you see the **Use Developer Features** item show.
   - On the **Settings** dialog, **For developers** tab, under "Use developer features", select the **Developer mode** option.
   - Close the **Settings** dialog.

1. Install [Visual Studio 2019](https://visualstudio.microsoft.com/downloads/), with the following workloads and optional components:

   - **Universal Windows Platform development** Windows workload, plus the following optional components:
     - **C++ Universal Windows Platform tools**
     - **Windows 10 SDK 10.0.16299.0 SDK** or later, if not included by default
   - **Desktop development with C++** Windows workload, plus the following optional components:
     - **Windows 10 SDK 10.0.16299.0 SDK** or later, if not included by default

     [![Visual Studio setup](media/setup-mip-client/visual-studio-install.png)](media/setup-mip-client/visual-studio-install.png#lightbox)

1. Install the [ADAL.PS PowerShell Module](https://www.powershellgallery.com/packages/ADAL.PS/3.19.4.2):

   - Because administrator rights are required to install modules, first you need to either:

     - sign in to your computer with an account that has Administrator rights.
     - run the Windows PowerShell session with elevated rights (Run as Administrator).

   - Then run the `install-module -name adal.ps` cmdlet:

     ```powershell
     PS C:\WINDOWS\system32> install-module -name adal.ps

     Untrusted repository
     You are installing the modules from an untrusted repository. If you trust this repository, change its
     InstallationPolicy value by running the Set-PSRepository cmdlet. Are you sure you want to install the modules from
     'PSGallery'?
     [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A

     PS C:\WINDOWS\system32>
     ```

1. Download Files:

   The MIP SDK is supported on the following platforms, with separate downloads for each supported platform/language:

   [!INCLUDE [MIP SDK platform support](../includes/mip-sdk-platform-support.md)]

   **Tar.gz/.Zip downloads**

   Tar.gz and .Zip downloads contain compressed files, one for each API. The compressed files are named as follows, where \<API\> = `file`, `protection`, or `upe`, and \<OS\> = the platform: `mip_sdk_<API>_<OS>_1.0.0.0.zip (or .tar.gz)`. For example, the file for Protection SDK binaries and headers on Debian would be: `mip_sdk_protection_debian9_1.0.0.0.tar.gz`. Each contained .tar.gz/.zip is split into three directories:

   - **Bins:** Compiled binaries for each platform architecture, where applicable.
   - **Include:** Header files (C++).
   - **Samples:** Source code for sample applications.

   **NuGet packages**

   If you're doing Visual Studio development, the SDK can be also installed via the NuGet Package Manager Console:

    ```console
    Install-Package Microsoft.InformationProtection.File
    Install-Package Microsoft.InformationProtection.Policy
    Install-Package Microsoft.InformationProtection.Protection
    ```

1. If you're not using the NuGet package, add the paths of the SDK binaries to the PATH environment variable. The PATH variable allows the dependent binaries (DLLs) to be found at runtime, by client applications (OPTIONAL):

   If you're using a Windows 11 or Windows 10 workstation:

   - Click the Windows icon in the lower left.
   - Type "Path" and press the "Enter" key, when you see the **Edit the system environment variables** item show.
   - On the **System Properties** dialog, click **Environment Variables**.
   - On the **Environment Variables** dialog, click the **Path** variable row under **User variables for \<user\>**, then click **Edit...**.
   - On the **Edit environment variable** dialog, click **New**, which creates a new editable row. Using the full path to each of the `file\bins\debug\amd64`, `protection\bins\debug\amd64`, and `upe\bins\debug\amd64` subdirectories, add a new row for each. The SDK directories are stored in a `<API>\bins\<target>\<platform>` format, where:
     - \<API\> = `file`, `protection`, `upe`
     - \<target\> = `debug`, `release`
     - \<platform\> = `amd64` (x64), `x86`, etc.

   - When finished updating the **Path** variable, click **OK**. Then click **OK** when returned to the **Environment Variables** dialog.

1. Download SDK samples from GitHub (OPTIONAL):

   - If you don't have one already, first create a [GitHub profile](https://github.com/join).
   - Then install the latest version of [Software Freedom Conservancy's Git client tools (Git Bash)](https://git-scm.com/download/)
   - Using Git Bash, download the sample(s) of interest:
     - Use the following query to view the repositories: https://github.com/Azure-Samples?utf8=%E2%9C%93&q=MipSdk.
     - Using Git Bash, use `git clone https://github.com/azure-samples/<repo-name>` to download each sample repository.

## Register a client application with Azure Active Directory

As part of the Microsoft 365 subscription provisioning process, an associated Azure Active Directory (Azure AD) tenant is created. The Azure AD tenant provides identity and access management for Microsoft 365 *user accounts* and *application accounts*. Applications that require access to secured APIs (such as MIP APIs), require an application account.

For authentication and authorization at runtime, accounts are represented by a *security principal*, which is derived from the account's identity information. Security principals that represent an application account are referred to as a [*service principal*](/azure/active-directory/develop/developer-glossary#service-principal-object).

To register an application account in Azure AD for use with the Quickstarts and MIP SDK samples:

  > [!IMPORTANT]
  > To access Azure AD tenant management for account creation, you'll need to sign in to the Azure portal with a user account that is a member of the ["Owner" role on the subscription](/azure/billing/billing-add-change-azure-subscription-administrator). Depending on the configuration of your tenant, you may also need to be a member of the "Global Admininstrator" directory role to [register an application](https://ms.portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/RegisteredApps).
  > We recommend testing with a restricted account. Be sure the account only has rights to access the necessary SCC endpoints. Cleartext passwords passed via commandline may be collected by logging systems.

1. Follow the steps in [Register an app with Azure AD, Register a new application](/azure/active-directory/develop/quickstart-v1-integrate-apps-with-azure-ad#register-a-new-application-using-the-azure-portal) section. For testing purposes, use the following values for the given properties as you go through the guide steps:
    - **Supported Account Types** - Select "Accounts in this organizational directory only."
    - **Redirect URI** - Set the redirect URI type to "Public client (mobile & desktop)." If your application is using the Microsoft Authentication Library (MSAL), use `http://localhost`. Otherwise, use something in the format `<app-name>://authorize`.

2. When finished, you'll be returned to the **Registered app** page for your new application registration. Copy and save the GUID in the **Application (client) ID** field, as you will need it for the Quickstarts.

3. Then click **API permissions** to add the APIs and permissions to which the client will need access. Click **Add a permission** to open the "Request API permissions" blade.

4. Now you'll add the MIP APIs and permissions the application will require at runtime:
   - On the **Select an API** page, click **Azure Rights Management Services**.
   - On the **Azure Rights Management Services** API page, click **Delegated permissions**.
   - On the **Select permissions** section, check the **user_impersonation** permission. This right allows the application to create and access protected content on behalf of a user.
   - Click **Add permissions** to save.

5. Repeat step #4, but this time when you get to the **Select an API** page, you'll need to search for the API.
   - On the **Select an API** page, click **APIs my organization uses** then in the search box type "**Microsoft Information Protection Sync Service**", and select it.
   - On the **Microsoft Information Protection Sync Service** API page, click **Delegated permissions**.
   - Expand the **UnifiedPolicy** node and check **UnifiedPolicy.User.Read**
   - Click **Add permissions** to save.

6. When you're back on the **API permissions** page, click **Grant admin consent for (Tenant Name)**, then **Yes**. This step gives pre-consent to the application using this registration, to access the APIs under the specified permissions. If you signed in as a global administrator, consent is recorded for all users in the tenant that run the application; otherwise, it applies only to your user account.

When finished, application registration and API permissions should look similar to the following examples:

   [![Azure AD app registration](media/setup-mip-client/aad-app-registration-overview.png)](media/setup-mip-client/aad-app-registration-overview.png#lightbox)
   [![Azure AD app API permissions](media/setup-mip-client/aad-app-api-permissions.png)](media/setup-mip-client/aad-app-api-permissions.png#lightbox)

For more information on adding APIs and permissions to a registration, see [Configure a client application to access web APIs](/azure/active-directory/develop/quickstart-v1-update-azure-ad-app#configure-a-client-application-to-access-web-apis). Here you'll find information on adding the APIs and permissions needed by a client application.

## Request an Information Protection Integration Agreement (IPIA)

Before you can release an application developed with MIP to the public, you must apply for and complete a formal agreement with Microsoft. 

> [!NOTE]
> This agreement is not required for applications that are intended only for internal use. 

1. Obtain your IPIA by sending an email to [IPIA@microsoft.com](mailto:IPIA@microsoft.com?subject=Requesting%20IPIA%20for%20<company-name>) with the following information:

   **Subject:** Requesting IPIA for *Company Name*

   In the body of the email, include:
   - Application and product name
   - First and last name of the requester
   - Email address of the requester

2. Upon receipt of your IPIA request, we'll send you a form (as a Word document). Review the terms and conditions of the IPIA, and return the form to [IPIA@microsoft.com](mailto:IPIA@microsoft.com?subject=IPIA%20Response%20for%20<company-name>) with the following information:

   - Legal name of the Company
   - State/Province (US/Canada) or Country of Incorporation
   - Company URL
   - Email address of the contact person
   - Additional addresses of the company (optional)
   - Name of the Company Application
   - Brief Description of the Application
   - *Azure Tenant ID*
   - *App ID* for the application
   - Company contacts, email, and phone for Critical Situation Correspondence

3. When we receive your form, we'll send you the final IPIA link to digitally sign. After your signing, it will be signed by the appropriate Microsoft representative, completing the agreement.

### Already have a signed IPIA?

If you already have a signed IPIA and want to add a new *App ID*
for an application you are releasing, send an email to [IPIA@microsoft.com](mailto:IPIA@microsoft.com?subject=Updating%20IPIA%20for%20<company-name>) and provide us with the following information:

- Name of the Company Application
- Brief Description of the Application
- Azure Tenant ID (even if the same one as before)
- App ID for the application
- Company contacts, email, and phone for Critical Situation Correspondence

Upon the sending of the email, allow up to 72 hours for an acknowledgment of the receipt.

## Ensure your app has the required runtime

> [!NOTE]
> This step is necessary only if deploying the application to a machine without Visual Studio, or if the Visual Studio installation lacks the Visual C++ Runtime components.

Applications built with the MIP SDK require the Visual C++ 2015 or Visual C++ 2017 runtime to be installed, if not already present.
- [Microsoft Visual C++ 2015 Redistributable Update 3](https://www.microsoft.com/download/details.aspx?id=53587)
- [Microsoft Visual C++ Redistributable for Visual Studio 2017](https://visualstudio.microsoft.com/downloads/#microsoft-visual-c-redistributable-for-visual-studio-2017)

These will only work if the application has been built as Release. If the application is built as Debug, then the Visual C++ runtime debug DLLs must be included with the application or installed on the machine.

## Next Steps

- If you're a C++ developer
  - Be sure to read [Observers concepts](concept-async-observers.md) before you start the Quickstart section, to learn about the asynchronous nature of the C++ APIs.
  - When you're ready to get some experience with the SDK, start with [Quickstart: Client application initialization (C++)](quick-app-initialization-cpp.md).
- If you're a C# developer, when you're ready to get some experience with the SDK, start with [Quickstart: Client application initialization (C#)](quick-app-initialization-csharp.md).
