---
# required metadata

title: Configure the client | Azure RMS
description: Instructions about how to configure the Active Directory Rights Management Services Client 2.1.
keywords:
author: bruceperlerms
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 58051d42-5a0a-4b65-9e02-bcdbf17d3262

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
# Configure the client

This topic contains instructions about how to configure the Active Directory Rights Management Services Client 2.1.

**Important**  If you will be testing your application by running it on the 1-box RMS ISV environment, you do not need to configure the AD RMS Client 2.1. For more information, see [Testing your rights-enabled applications](running-your-first-application.md).

 

### Prerequisites

-   You must have the AD RMS Client 2.1 installed on the computer on which you will be testing your application.

    -   If you will be testing your application on your development computer then you should have already installed the Rights Management Services SDK 2.1. The AD RMS Client 2.1 will have been silently installed at this time.

        For information about how to install the RMS SDK 2.1, see [Install the SDK](create-your-first-rights-aware-application.md).

    -   If you will be testing your application on a computer other than your development computer, you can install the AD RMS Client 2.1 on that computer from the [AD RMS Client 2.1 download page](http://www.microsoft.com/en-us/download/details.aspx?id=38396).
        **Note**  If your application uses Server API Mode (**IPC\_API\_MODE\_SERVER**), you are not required to use an application manifest. You can test your application against a production RMS server and you are not required to obtain a production license when switching to production environment. For more information on server mode applications, see [Application types](application_types.md).

         

-   You must have an RMS server installed and configured for working in the pre-production environment. For more information, see [Install and configure the Server](how_to_install_and_configure_an_rms_server.md).

Instructions

### Step 1: How to set up the RMS Client 2.1 for the pre-production certificate hierarchy

The following steps describe how to install the developer runtime, configure the client to use the ISV certificate (pre-production) hierarchy, and set up service discovery on the client.

1.  Copy the developer runtime, Ipcsecproc\_isv.dll, from %MSIPCSDKDIR%\\bin\\x86 (for 32-bit versions of Windows) or %MSIPCSDKDIR\\bin\\x64 (for 64-bit versions of Windows) to C:\\Program Files\\Active Directory Rights Management Services Client 2.1.

    **Important**  If you are running a 32-bit application on a 64-bit version of Windows, you must copy Ipcsecproc\_isv.dll from %MSIPCSDKDIR%\\bin\\x86 to C:\\Program Files(x86)\\Active Directory Rights Management Services Client 2.1.

     

2.  Configure the AD RMS Client 2.1 to use the ISV certificate (pre-production) hierarchy by setting the **Hierarchy** registry key value to 1.

    ```
    HKEY_LOCAL_MACHINE
       SOFTWARE
          Microsoft
             MSIPC
                Hierarchy DWORD = 00000001
                Data type
                DWORD
    ```

    **Note**  Not having the **Hierarchy** value present in the registry is functionally the same as having its value set to 0 (zero), meaning that RMS SDK 2.1 will operate in production mode. For more information about keys and certificate chains, see [Understanding certificate chains](understanding_certificate_chains.md).

    **Important**  
    If you are running a 32-bit application on a 64-bit version of Windows you must set the **Hierarchy** value in the following key location:

    ```
    HKEY_LOCAL_MACHINE
        SOFTWARE
           Wow6432Node
              Microsoft
                MSIPC
    ```
     

3.  Configure either server-side discovery or client-side discovery to enable the AD RMS Client 2.1 to discover and establish communication with your pre-production RMS server.

    -   In server-side discovery, an administrator registers a service connection point (SCP) for the pre-production RMS root cluster with Active Directory, and the client queries Active Directory to discover the SCP and establish a connection with the server.
    -   In client-side discovery, you configure RMS Service Discovery settings in the registry on the computer where the AD RMS Client 2.1 is running. These settings point the AD RMS Client 2.1 to the RMS server to use. When they are present, server-side discovery is not performed.

    To configure client-side discovery, you can set the following registry keys to point to your pre-production RMS server. For information about how to configure service-side discovery, see [RMS Client 2.0 Deployment Notes](https://TechNet.Microsoft.Com/en-us/library/jj159267(WS.10).aspx).

|Key|Value|
|---|-----|
|`HKEY_LOCAL_MACHINE\`<br>`SOFTWARE\`<br>`Microsoft\`<br>`MSIPC\`<br>`ServiceLocation\`<br>`EnterpriseCertification`|(Default):<br><br> [**http**&#124;**https**]**://** *RMSClusterName* **/_wmcs/Certification**|
|`HKEY_LOCAL_MACHINE\`<br>`SOFTWARE\`<br>`Microsoft\`<br>`MSIPC\`<br>`ServiceLocation\`<br>`EnterprisePublishing`|(Default):<br><br> [**http**&#124;**https**]**://** *RMSClusterName* **/_wmcs/Licensing**|


**Note**   By default, these keys do not exist in the registry and must be created.
     
**Important**  
    If you are running a 32-bit application on a 64-bit version of Windows, you must set these keys in the following key location:


    HKEY_LOCAL_MACHINE
        SOFTWARE
           Wow6432Node
              Microsoft
                MSIPC
    

### Remarks

The guidance in this topic is not comprehensive. For detailed information about how to configure the AD RMS Client 2.1, see [RMS Client 2.0 Deployment Notes](https://TechNet.Microsoft.Com/en-us/library/jj159267(WS.10).aspx).

### Related topics


* [How-to use](how-to-use-msipc.md)
* [RMS Client 2.0 Deployment Notes](https://TechNet.Microsoft.Com/en-us/library/jj159267(WS.10).aspx)
* [Install the SDK](create-your-first-rights-aware-application.md)
* [Install and configure the server](how_to_install_and_configure_an_rms_server.md)
* [Testing your rights-enabled applications](running-your-first-application.md)
* [Understanding certificate chains](understanding_certificate_chains.md)
 

 
