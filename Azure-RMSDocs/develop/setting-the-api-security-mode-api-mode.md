---
# required metadata

title: How-to set the API security mode | Azure RMS
description: Learn how to set the API security mode by using the IpcSetGlobalProperty function to choose which security mode your File API application runs in.
keywords:
author: msmbaldwin
ms.author: mbaldwin
manager: barbkess
ms.date: 02/23/2017
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 3B088F14-81C5-4C78-8DED-F5F153353EE0
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: dev

---

# How-to: set the API security mode

You can choose which security mode your File API application runs in by using the [IpcSetGlobalProperty](/previous-versions/windows/desktop/msipc/ipcsetglobalproperty) function.

To initialize your application to run in *server mode*, call the [IpcSetGlobalProperty](/previous-versions/windows/desktop/msipc/ipcsetglobalproperty) function and set the security mode to [IPC\_API\_MODE\_SERVER](/previous-versions/windows/desktop/msipc/api-mode-values). By default, your application will run in *client mode*, **IPC\_API\_MODE\_CLIENT**.

For more information on *server mode*, see [Application types](application-types.md).

**Important**  The security mode should be set before any other Rights Management Services SDK 2.1 function is called. After the security mode has been set, it cannot be changed for the current process.

## Related topics

* [Application types](application-types.md)
* [API mode values](/previous-versions/windows/desktop/msipc/api-mode-values)
* [IpcSetGlobalProperty](/previous-versions/windows/desktop/msipc/ipcsetglobalproperty)