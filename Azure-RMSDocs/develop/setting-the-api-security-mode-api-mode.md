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
ms.assetid: b3acfcd5-1af5-4f3a-912b-962198c59103

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
# Setting the API security mode

You can choose which security mode your File API application runs in by using the [**IpcSetGlobalProperty**](xref:msipc.ipcsetglobalproperty) function.

To initialize your application to run in *server mode*, call the [**IpcSetGlobalProperty**](xref:msipc.ipcsetglobalproperty) function and set the security mode to [**IPC\_API\_MODE\_SERVER**](xref:msipc.api_mode_values). By default, your application will run in *client mode*, **IPC\_API\_MODE\_CLIENT**.

For more information on *server mode*, see [Application types](application-types.md).

**Important**  The security mode should be set before any other Rights Management Services SDK 2.1 function is called. After the security mode has been set, it cannot be changed for the current process.

 

### Related topics

* [Application types](application-types.md)
* [Developer concepts](ad-rms-concepts-nav.md)
* [**API mode values**](xref:msipc.api_mode_values)
* [**IpcSetGlobalProperty**](xref:msipc.ipcsetglobalproperty)
 

 



