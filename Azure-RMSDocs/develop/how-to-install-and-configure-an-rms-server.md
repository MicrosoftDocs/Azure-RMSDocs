---
# required metadata

title: Install and configure the server | Azure RMS
description: Install and configure and RMS Sever for testing your rights-enabled application.
keywords:
author: bruceperlerms
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: e51adc12-4ee1-4819-bd8e-08ccf654fa00

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
# Install and configure the server

This topic covers the steps to install and configure and RMS Sever for testing your rights-enabled application.

**Important**  If you are testing your application by running it on the 1-box RMS ISV environment, you do not need to install an RMS Server because one is already installed and configured on the 1-box environment.
For more information about the 1-box AD RMS ISV environment, see [Set up the test environment](how-to-set-up-your-test-environment.md).

 

## Instructions

### Step 1: Setup your RMS server

The following steps guide you in setting up your RMS server and include:

-   Configure the registry
-   Install the server
-   Enroll the server

1.  **Configure the registry**

    To specify that you are using the pre-production certificate hierarchy, set the following registry values.

    **Note**  If you are using Windows Server 2008 R2 or Windows Server 2008, set the registry values before installing the AD RMS service.

    If you are using AD RMS on Windows Server 2008 R2, you must set the following **REG\_DWORD** value. Change this value to 0 (zero) to switch to the production hierarchy.

    **Computer**\\**HKEY\_LOCAL\_MACHINE**\\**Software**\\**Microsoft**\\**DRMS**\\**Hierarchy** = 0x00000001

    If you are using AD RMS on Windows Server 2008 R2 and another AD RMS service is already deployed in Active Directory as a pre-production service, add the following empty string value to the registry.

    **Computer**\\**HKEY\_LOCAL\_MACHINE**\\**Software**\\**Microsoft**\\**DRMS**\\**GICURL** = ""

    If you are using AD RMS on Windows Server 2008, you must set the following **REG\_DWORD** value. Change this value to 0 (zero) to switch to the production hierarchy.

    **Computer**\\**HKEY\_LOCAL\_MACHINE**\\**Software**\\**Microsoft**\\**DRMS**\\**2.0**\\**Hierarchy** = 0x00000001

    If you are using AD RMS on Windows Server 2008 and another AD RMS service is already deployed in Active Directory as a pre-production service, add the following empty string value to the registry.

    **Computer**\\**HKEY\_LOCAL\_MACHINE**\\**Software**\\**Microsoft**\\**DRMS**\\**2.0**\\**GICURL** = ""

2.  **Install the server**

    Active Directory Rights Management Services (AD RMS) consists of separate client and server components. The server component is implemented as a set of web services that can be used to administer an RMS infrastructure, issue licenses to content consumers and publishers, and issue certificates to computers and users.

    Beginning with Windows Server 2008, both the client and the server components are included in the operating system. You can download the server components for prior operating systems from the following location.

    -   [RMS Server v1.0 SP2](http://go.microsoft.com/fwlink/p/?linkid=73722)

    To configure the server component on Windows Server 2008, you must install the AD RMS role. Before doing so, however, you must configure the registry to specify that you will be using the Pre-Production certificate hierarchy rather than the Production hierarchy. If, however, you are developing applications against a prior server operating system, configure the registry after installing RMS server v1.0 SP2 but before provisioning the RMS service.

    For more information, see the previous step, step 1, "Configure the registry".

3.  **Enroll the server**

    You must enroll an Rights Management Services (RMS) server to identify it in the Pre-Production or Production hierarchy. The enrollment process leaves a server licensor certificate on the server computer. This certificate chains back to a Microsoft root of trust. How you enroll the server depends on which RMS version you are using.

    -   **Self enrollment**

        Beginning with Windows Server 2008, you can enroll an RMS server in the appropriate hierarchy without sending information to Microsoft. When you install the RMS role, a self-enrollment certificate and private key are also installed. These are used to automatically create the server licensor certificate. No information is exchanged with Microsoft.

    -   **Online enrollment**If you are using AD RMS v1.0 SP2, you can enroll the server online. Enrollment takes place behind the scenes during the provisioning process, but you must have an Internet connection and you must specify the appropriate registry value to identify which hierarchy you are enrolling the server in. To enroll in the Pre-production hierarchy, add the following **REG\_SZ** value and provision the server. To enroll in the Production hierarchy, clear this value and provision the server.

        For more information, see the previous step, step 1, "Configure the registry".

        **HKEY\_LOCAL\_MACHINE**\\**Software**\\**Microsoft**\\**DRMS**\\**1.0**\\**UddiProvider** = 0e3d9bb8-b765-4a68-a329-51548685fed3

### Related topics

* [How-to use](how-to-use-msipc.md)
 

 



