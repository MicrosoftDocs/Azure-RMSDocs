---
# required metadata

title: Deploying your application - AIP
description: This topic outlines and guides you through deployment of your application
keywords: deploy, RMS, AIP
author: bryanla
ms.author: bryanla
manager: mbaldwin
ms.date: 03/13/2017
ms.topic: conceptual
ms.service: information-protection
ms.assetid: 4B785564-6839-49ED-A243-E2A6DFF88B2E
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: kartikk
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---
# Deploy into production

This topic guides you through the deployment process for your Azure Information Protection (AIP) / Rights Management Services (RMS) enabled application.

## Request an Information Protection Integration Agreement (IPIA)
Before you can release an application developed with AIP/RMS, you must apply for and complete a formal agreement with Microsoft.

### Begin the process
Obtain your IPIA by sending an email to <strong>IPIA@microsoft.com</strong> with the following information:

**Subject:** Requesting IPIA for *Company Name*

In the body of the email, include:
- Application and product name
- First and last name of the requester
- Email address of the requester

### Next steps
Upon receipt of your IPIA request, we will send you a form (as a Word document).
Review the terms and conditions of the IPIA, and return the form to <strong>IPIA@microsoft.com</strong> with the following information:
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

### Completing the agreement
When we receive your form, we'll send you the final IPIA link to digitally sign. After your signing, it will be signed by the appropriate Microsoft representative, completing the agreement.

### Already have a signed IPIA?
If you already have a signed IPIA and want to add a new *App ID*
for an application you are releasing, send an email to <strong>IPIA@microsoft.com</strong> and provide us with the following information:
- Name of the Company Application
- Brief Description of the Application
- Azure Tenant ID (even if it the same one as before)
- App ID for the application
- Company contacts, email, and phone for Critical Situation Correspondence

Upon the sending of the email, please allow up to 72 hours for an acknowledgement of the receipt.

## Deploying to the client environment

In order to deploy your application, built with Azure Information Protection (AIP) / Rights Management Services (RMS) tools, you will need to deploy the RMS Client 2.1 on the end-user's machine.

### RMS Client 2.1
The RMS Client 2.1 is designed to protect access to and usage of information flowing through AIP/RMS enabled applications, whether installed on your premises or in a Microsoft datacenter.

The RMS Client 2.1 is not a Windows operating system component. The client ships as an optional download which can be, with acknowledgment and acceptance of its license agreement, freely distributed with your application.

> [!IMPORTANT]
> The RMS Client 2.1 is architecture specific and must match the architecture of your target operating system.


## RMS Client 2.1 installation options

### Creating your deployment package

We recommend that you bundle the RMS Client installer package with your application or solution using your preferred installation technology. The RMS Client can be freely redistributed with other applications and solutions.

You can choose to install the RMS Client 2.1 interactively by starting the RMS Client 2.1 installer or silently installing it. The integration steps will be:

-   Download RMS Client 2.1 installer
-   Integrate the RMS Client 2.1 installer to run with your application installer

An example of integrating the RMS Client 2.1 with your application is the [Rights Protected Folder Explorer](https://technet.microsoft.com/library/rights-protected-folder-explorer(v=ws.10).aspx) package. Try installing it yourself to understand the approach.

### Make RMS Client 2.1 a pre-requisite for your application install

In this case, you will create a pre-requisite such that your application install will fail if RMS Client 2.1 is not present on the end-user machine.

If the client is not present, provide an error message informing the user where they can download a copy of the RMS Client 2.1

If the client is present, proceed with your application installation.

## Enabling Azure Information Protection Services with your application

> [!NOTE]
> If you have migrated to the new ADAL model for authentication, you don’t have to install **SIA**. For more information, see [ADAL authentication for your RMS enabled application](adal-auth.md).
> Also, you can **Certify your application for Windows 10** - By updating your application to use ADAL authentication rather than the Microsoft Online Sign-in Assistant, you and your customers will be able to:
> Utilize multi-factor authentication
> Install the RMS Client 2.1 without requiring administrative privileges to the machine

In order for your end-user to take advantage of Information Protection services, you must deploy the *Online Services Sign-in Assistant (SIA)*. As the application developer, you do not know whether the end-user will use Information Protection through RMS (on premises) or through Azure Information Protection.


> [!IMPORTANT]
> If you will be running your client application with Azure based RMS, you'll need to create your own tenants. For more information, see [Azure RMS requirements: Cloud subscriptions that support Azure RMS](../requirements.md).
> For more information on running with Azure RMS see, [Enable your service application to work with cloud based RMS](how-to-use-file-api-with-aadrm-cloud.md).

-   Download the [Microsoft Online Services Sign-In Assistant](https://www.microsoft.com/download/details.aspx?id=28177) from the Microsoft Download Center.
-   Ensure that your deployment of a rights-enabled application includes a pre-requisites check for this service selection.
-   For your own testing and for your end-users use of the on-line service see the TechNet topic, [Configuring Rights Management](https://TechNet.Microsoft.Com/library/jj585002.aspx).

You will also need to use this guide to configure your app - [How to configure your App Service application to use Azure Active Directory login](https://docs.microsoft.com/azure/app-service-mobile/app-service-mobile-how-to-configure-active-directory-authentication).

For more on enabling your application to use RMS for Azure Rights Management services see, [Enable your application to work with cloud based RMS](how-to-use-file-api-with-aadrm-cloud.md).

## Related topics

* [Microsoft Online Services Sign-In Assistant](https://www.microsoft.com/download/details.aspx?id=28177)
* [Configuring Rights Management](https://TechNet.Microsoft.Com/library/jj585002.aspx)
* [Enable your application to work with cloud based RMS](how-to-use-file-api-with-aadrm-cloud.md)

