---
# required metadata

title: Setting the API security mode | Azure RMS
description: Choose which security mode your File API application runs.
keywords:
author: bruceperlerms
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
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
** This SDK content is not current. For a short time, please find the [current version](https://msdn.microsoft.com/library/windows/desktop/hh535290(v=vs.85).aspx) of the documentation on MSDN. **
# Setting the API security mode

You can choose which security mode your File API application runs in by using the [**IpcSetGlobalProperty**](/rights-management/sdk/2.1/api/win/functions#msipc_ipcsetglobalproperty) function.

To initialize your application to run in *server mode*, call the [**IpcSetGlobalProperty**](/rights-management/sdk/2.1/api/win/functions#msipc_ipcsetglobalproperty) function and set the security mode to [**IPC\_API\_MODE\_SERVER**](/rights-management/sdk/2.1/api/win/api%20mode%20values#msipc_api_mode_values_IPC_API_MODE_SERVER). By default, your application will run in *client mode*, **IPC\_API\_MODE\_CLIENT**.

For more information on *server mode*, see [Application types](application-types.md).

**Important**  The security mode should be set before any other Rights Management Services SDK 2.1 function is called. After the security mode has been set, it cannot be changed for the current process.

 

## Related topics

* [Application types](application-types.md)
* [Developer concepts](ad-rms-concepts-nav.md)
* [**API mode values**](/rights-management/sdk/2.1/api/win/api%20mode%20values#msipc_api_mode_values_IPC_API_MODE_SERVER)
* [**IpcSetGlobalProperty**](/rights-management/sdk/2.1/api/win/functions#msipc_ipcsetglobalproperty)
 

 



