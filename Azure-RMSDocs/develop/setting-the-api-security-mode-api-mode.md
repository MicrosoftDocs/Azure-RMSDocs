---
# required metadata

title: How-to set the API security mode | Azure RMS
description: Choose which security mode your File API application runs.
keywords:
author: bruceperlerms
manager: mbaldwin
ms.date: 09/25/2016
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 3B088F14-81C5-4C78-8DED-F5F153353EE0
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# How-to: set the API security mode

You can choose which security mode your File API application runs in by using the [**IpcSetGlobalProperty**](/information-protection/sdk/2.1/api/win/functions#msipc_ipcsetglobalproperty) function.

To initialize your application to run in *server mode*, call the [**IpcSetGlobalProperty**](/information-protection/sdk/2.1/api/win/functions#msipc_ipcsetglobalproperty) function and set the security mode to [**IPC\_API\_MODE\_SERVER**](/information-protection/sdk/2.1/api/win/api%20mode%20values#msipc_api_mode_values_IPC_API_MODE_SERVER). By default, your application will run in *client mode*, **IPC\_API\_MODE\_CLIENT**.

For more information on *server mode*, see [Application types](application-types.md).

**Important**  The security mode should be set before any other Rights Management Services SDK 2.1 function is called. After the security mode has been set, it cannot be changed for the current process.

## Related topics

* [Application types](application-types.md)
* [**API mode values**](/information-protection/sdk/2.1/api/win/api%20mode%20values#msipc_api_mode_values_IPC_API_MODE_SERVER)
* [**IpcSetGlobalProperty**](/information-protection/sdk/2.1/api/win/functions#msipc_ipcsetglobalproperty)
 

 
