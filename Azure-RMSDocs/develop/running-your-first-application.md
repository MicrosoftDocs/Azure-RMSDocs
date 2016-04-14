---
# required metadata

title: Testing your rights-enabled application | Azure RMS
description: Describes the steps you need to complete to test your RMS SDK 2.1 rights-enabled application.
keywords:
author: bruceperlerms
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 43b611a8-2cc0-49a8-9db9-e81321c38f7a

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
# Testing your rights-enabled application

This topic describes the steps you need to complete to test your Rights Management Services SDK 2.1 rights-enabled application.

To publish and consume protected content, an Rights Management Services (RMS) application makes use of several different types of certificates and licenses, each of which consists of a certificate chain that leads back ultimately to a Microsoft certification authority. Microsoft provides the following hierarchies:

-   The Pre-production hierarchy can be used to develop and test applications.
-   The Production hierarchy must be used by released applications

We recommend that you use the Pre-production hierarchy when developing an application. By doing so, you can work without signing a Production License Agreement with Microsoft.

> [!IMPORTANT]
> It is a recommended best practice to test your RMS SDK 2.1 application first with the RMS pre-production environment against an RMS Server. Then, should you want your customer to have the ability to use your application with the Azure RMS Service, move to testing with that environment. For more information see, [Enable your service application to work with cloud based RMS](how-to-use-file-api-with-aadrm-cloud.md).

 

### Prerequisites

-   An RMS SDK 2.1 development environment setup. For more information, see [Setting up the pre-production development environment](how_to_set_up_the_pre-production_development_environment.md).
-   For an example application, see [IPCHelloWorld - an example application](how-to-build-your-first-application.md).

Instructions

### Step 1:

Create and build a rights-enabled application. See the above Prerequisites section for options.

### Step 2: Generate an application manifest using the pre-production certificate chain

You must generate a manifest for your application before running it.

**Note**  If your application uses Server API Mode (**IPC\_API\_MODE\_SERVER**), you are not required to use an application manifest. You can test your application against a production AD RMS server and you are not required to obtain a production license when switching to production environment. For more information on server mode applications, see [Application types](application-types.md).

 

This process is also known as signing your application. You can generate the manifest using either a production certificate chain or the pre-production certificate chain that is installed with the SDK. We recommend that you use the pre-production certificate chain during development.

For more information about keys and certificate chains, see [Understanding certificate chains](understanding-certificate-chains.md).

For information about how to sign an application with a production certificate chain, see [Switching to the production environment](switching_to_the_production_environment.md).

To generate the application manifest using the pre-production certificate chain, perform these steps on your development computer:

1.  Copy the following files from their installation directories to the same folder as your application.

    %MSIPCSdkDir%\\Tools\\Genmanifest.exe

    %MSIPCSdkDir%\\bin\\Isvtier5appsigningprivkey.dat

    %MSIPCSdkDir%\\bin\\Isvtier5appsigningpubkey.dat

    %MSIPCSdkDir%\\bin\\Isvtier5appsignsdk\_client.xml

    %MSIPCSdkDir%\\bin\\YourAppName.isv.mcf

2.  In your application folder, rename the manifest configuration file, YourAppName.isv.mcf, to the name of your application with the .mcf file name extension appended. For example if your application is named MyApp.exe, rename YourAppName.isv.mcf to MyApp.exe.mcf.

3.  Use a text editor to add your application to the manifest configuration file. To do this, replace the &lt;YourAppName&gt;.exe place holder text in the module list inside your .mcf file with the name of your application; for example, MyApp.exe.

    The signing process will generate an error if the .mcf file is used without modification.

4.  Run Genmanifest.exe to generate the application manifest. This is also known as signing your application. The output of this operation should be a .man file. For example, if your application is named MyApp.exe and your manifest configuration file is named MyApp.exe.mcf, run the following command:

    **genmanifest.exe -chain isvtier5appsignsdk\_client.xml MyApp.exe.mcf MyApp.exe.man**

### Step 3: Run your application

You can run your application from any directory, but the application manifest (MyApp.exe.man) must be in the same directory as the executable (MyApp.exe).

-   **Using the RMS 1-Box Environment**

    If you are using the RMS 1-box environment to test your application, copy your application executable and the application manifest to any directory on the 1-box environment and then run your application.

    For information about the RMS 1-box environment, see [Set up the test environment](how_to_set_up_your_test_environment.md).

-   **Using a pre-production Server configuration**

    If you are testing your application against an RMS server that is configured for pre-production, make sure that you have configured the Active Directory Rights Management Services Client 2.1 on the computer where the application will be running; for example, on your development computer. Then make sure that both the application executable and the application manifest are located in the same directory on that computer and run your application.

    For information about how to configure the client on your computer, see [Configure the client](how_to_configure_the_ad-rms-client_2_0.md). For information about installing an RMS server, see [Install and configure the server](how-to-install-and-configure-an-rms-server.md).

### Related topics

* [How-to use](how-to-use-msipc.md)
* [Configure the client](how_to_configure_the_ad-rms-client_2_0.md)
* [Install and configure the server](how-to-install-and-configure-an-rms-server.md)
* [IPCHelloWorld - an example application](how-to-build-your-first-application.md)
* [Setting up the pre-production development environment](how_to_set_up_the_pre-production_development_environment.md)
* [Switching to the production environment](switching_to_the_production_environment.md)
* [Set up the test environment](how_to_set_up_your_test_environment.md)
* [Understanding certificate chains](understanding-certificate-chains.md)
 

 



