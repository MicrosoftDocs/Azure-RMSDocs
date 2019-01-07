---
# required metadata

title: How-to install, configure and test with an RMS server | Azure RMS
description: Install and configure and RMS Sever for testing your rights-enabled application.
keywords:
author: bryanla
ms.author: bryanla
manager: mbaldwin
ms.date: 02/23/2017
ms.topic: conceptual
ms.service: information-protection
ms.assetid: 32C7F387-CF7E-4CE0-AFC9-4C63FE1E134A
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# How-to: install, configure and test with an RMS server

This topic covers the steps to connect to an RMS Sever or Azure RMS for testing your rights-enabled application.
 
## Instructions

### Step 1: Setup your RMS server

The following steps guide you in setting up your RMS server and include:

-   Install the server
-   Enroll the server

1.  **Install the server**

    Active Directory Rights Management Services (AD RMS) consists of separate client and server components. The server component is implemented as a set of web services that can be used to administer an RMS infrastructure, issue licenses to content consumers and publishers, and issue certificates to computers and users.

    Beginning with Windows Server 2008, both the client and the server components are included in the operating system. You can download the server components for prior operating systems from the following location.

    -   [RMS Server v1.0 SP2](https://go.microsoft.com/fwlink/p/?linkid=73722)

    To configure the server component on Windows Server 2008, you must install the AD RMS role. If you are developing applications against a prior server operating system, configure the registry after installing RMS server v1.0 SP2 but before provisioning the RMS service.

2.  **Enroll the server**

    You must enroll an Rights Management Services (RMS) server to identify it in the Pre-Production or Production hierarchy. The enrollment process leaves a server licensor certificate on the server computer. This certificate chains back to a Microsoft root of trust. How you enroll the server depends on which RMS version you are using.

    -   **Self enrollment**

        Beginning with Windows Server 2008, you can enroll an RMS server in the appropriate hierarchy without sending information to Microsoft. When you install the RMS role, a self-enrollment certificate and private key are also installed. These are used to automatically create the server licensor certificate. No information is exchanged with Microsoft.

    -   **Online enrollment**

        If you are using AD RMS v1.0 SP2, you can enroll the server online. Enrollment takes place behind the scenes during the provisioning process, but you must have an Internet connection.

        **HKEY\_LOCAL\_MACHINE**\\**Software**\\**Microsoft**\\**DRMS**\\**1.0**\\**UddiProvider** = 0e3d9bb8-b765-4a68-a329-51548685fed3

3. **Test with RMS Server**

    For testing with an RMS server, configure either server-side discovery or client-side discovery to enable the Rights Management Service Client 2.1 to discover and establish communication with your RMS server.

    > [!Note]
    > Testing with Azure RMS does not require discovery configuration.

  - In server-side discovery, an administrator registers a service connection point (SCP) for the RMS root cluster with Active Directory, and the client queries Active Directory to discover the SCP and establish a connection with the server.
  - In client-side discovery, you configure RMS Service Discovery settings in the registry on the computer where the RMS Client 2.1 is running. These settings point the RMS Client 2.1 to the RMS server to use. When they are present, server-side discovery is not performed.

  To configure client-side discovery, you can set the following registry keys to point to your RMS server. For information about how to configure service-side discovery, see [RMS Client 2.0 Deployment Notes](https://technet.microsoft.com/library/jj159267(WS.10).aspx).

1. **EnterpriseCertification**

        HKEY_LOCAL_MACHINE
          SOFTWARE
            Microsoft
              MSIPC
                ServiceLocation
                  EnterpriseCertification

   **Value**: (Default): [**http|https**]://RMSClusterName/**_wmcs/Certification**

2. **EnterprisePublishing**

        HKEY_LOCAL_MACHINE
          SOFTWARE
            Microsoft
              MSIPC
                ServiceLocation
                  EnterprisePublishing
                  
   **Value**: (Default): [**http|https**]://RMSClusterName/**_wmcs/Licensing**

>[!NOTE] 
> By default, these keys do not exist in the registry and must be created.

>[!IMPORTANT] 
> If you are running a 32-bit application on a 64-bit version of Windows, you must set these keys in the following key location:<p>
  ```    
  HKEY_LOCAL_MACHINE
    SOFTWARE
      Wow6432Node
        Microsoft
          MSIPC
            ```
