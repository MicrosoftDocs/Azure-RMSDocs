---
# required metadata

title: Signing your application for production | Azure RMS
description: This topic leads you through the process of signing your application for production mode.
keywords:
author: bruceperlerms
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 09BA148C-7D1E-43C8-92EA-24BBB6EFDB19
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---
** This SDK content is not current. For a short time, please find the [current version](https://msdn.microsoft.com/library/windows/desktop/hh535290(v=vs.85).aspx) of the documentation on MSDN. **
# Signing your application for production

This topic leads you through the process of signing your application for production mode.

## Sign your rights-enabled application

These steps assume that you have already signed your application for a pre-production hierarchy. If you have not already done so, go through the process described in [Testing your rights-enabled application](running-your-first-application.md).

Once you have received the production certificate from Microsoft, you have the following files with you:

-   YourPrivateKey.dat
-   YourPublicKey.dat
-   ProductionCertificate.xml

Place them in the same directory with *GenManifest.exe* and your application binary (.exe).

-   The process below takes you through creating a new MCF file with production certificate:

    -   Create a new directory and place files in that new directory. Use Notepad.exe to create an MCF file for your application. The file should have the following contents.

        ``` syntax
        AUTO-GUID
        .\\YourPrivateKey.dat
        modulelist
        req     .\\<yourappname>.exe
        POLICYLIST
        INCLUSION
        PUBLICKEY .\\YourPublicKey.dat
        EXCLUSION
        ```

    -   Run the following command to sign your application:

        **genmanifest.exe -chain ProductionCertificate.xml** *YourAppName***.mcf** *YourAppName***.exe.man**

        If Genmanifest was successful, you'll see only the following text:

        If Genmanifest failed, you'll see an error message.

    -   Your *YourAppName*.exe.man should always be placed in the same directory as *YourAppName*.exe.

## Related topics

* [How-to use](how-to-use-msipc.md)
* [Testing your rights-enabled application](running-your-first-application.md)
 

 



