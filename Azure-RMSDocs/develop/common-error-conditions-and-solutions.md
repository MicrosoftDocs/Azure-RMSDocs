---
# required metadata

title: Common error conditions and solutions | Azure RMS
description: This topic includes the most common error messages that you might encounter when using the RMS SDK 2.1 developer tools.
keywords:
author: bruceperlerms
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: ac6453e1-e24f-480e-99bd-02ba9a49f468

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
# Common error conditions and solutions
This topic includes the most common error messages that you might encounter when using the Rights Management Services SDK 2.1 developer tools. It also provides a recommended action to fix the error, where applicable.

**Important** - For error condition processing, always use a call to [IpcGetErrorMessageText](xref:msipc.ipcgeterrormessagetext) right after an SDK API call fails, so you get complete information about the nature of the error.

 

## Error and action ##
The list below contains a list of error constants, thier associated description and a suggested action to address the error condition.

**ERROR** - *IPCERROR_DEBUGGER_DETECTED* - A debugger was detected by RMS SDK 2.1

**ACTION** - The developer version of RMS SDK 2.1 does not check for the presence of a debugger. If possible, debug your application by using this version of RMS SDK 2.1.
If you must debug the production version of RMS SDK 2.1, use the following guidance.

Some RMS SDK 2.1 functions are designed to fail under a debugger:
- [IpcGetKey</strong>](xref:msipc.ipcgetkey)
- [IpcGetTemplateList](xref:msipc.ipcgettemplatelist)
- [IpcGetTemplateIssuerList](xref:msipc.ipcgettemplateissuerlist)

To debug code following these function calls, you must break into the process and attach a debugger after the function calls have completed. One way to do this is to use an assert statement to break into the debugger. The ASSERTE macro is included in the *Crtdbg.h* header.
For more information about \_ASSERTE, see [\_ASSERT, \_ASSERTE Macros](https://msdn.microsoft.com/en-us/library/ezb1wyez.aspx)

**ERROR** - *IPCERROR_BROKEN_CERT_CHAIN* - Certificate chain does not match.

**ACTION** - Make sure the hierarchy key contains the correct value based on the key you used to sign your AD RMS application manifest.
These are the signing keys and their associated values (hierarchy **DWORD**):
- ISV—1
- Production—0 or not present

**ERROR** - *IPCERROR_MACHINE_CERT_NOT_TRUSTED* - You are using an application signed with the ISV signing key, but it is trying to communicate with a production AD RMS server, or vice versa.

- If you are using the developer version of AD RMS server, ensure that you are using the ISV signing key to sign your application.
- If you are using the production version of AD RMS server, ensure that you are using the production signing key to sign your application.

**ERROR** - *IPCERROR_APPLICATION_AUTH_ERROR_MANIFEST* - The application manifest is not valid. This can be caused when the binary (application) was rebuilt, and the manifest was not regenerated.

**ACTION** - Make sure you regenerate your application manifest every time you rebuild your application.

## Related topics ##
* [Developer notes](developer_notes.md)
* [IpcGetKey](xref:msipc.ipcgetkey)
* [IpcGetTemplateList](xref:msipc.ipcgettemplatelist)
* [IpcGetTemplateIssuerList](xref:msipc.ipcgettemplateissuerlist)
* [\_ASSERT, \_ASSERTE Macros](https://msdn.microsoft.com/en-us/library/ezb1wyez.aspx)
 

 
