---
# required metadata

title: How-to set the API security mode | Azure RMS
description: Choose which security mode your File API application runs.
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

You can choose which security mode your File API application runs in by using the [IpcSetGlobalProperty](https://msdn.microsoft.com/library/hh535270.aspx) function.

To initialize your application to run in *server mode*, call the [IpcSetGlobalProperty](https://msdn.microsoft.com/library/hh535270.aspx) function and set the security mode to [IPC\_API\_MODE\_SERVER](https://msdn.microsoft.com/library/hh535236.aspx). By default, your application will run in *client mode*, **IPC\_API\_MODE\_CLIENT**.

For more information on *server mode*, see [Application types](application-types.md).

**Important**  The security mode should be set before any other Rights Management Services SDK 2.1 function is called. After the security mode has been set, it cannot be changed for the current process.

## Related topics

* [Application types](application-types.md)
* [API mode values](https://msdn.microsoft.com/library/hh535236.aspx)
* [IpcSetGlobalProperty](https://msdn.microsoft.com/library/hh535270.aspx)
