---
# required metadata

title: Usage restriction reference | Azure RMS
description: Usage restrictions are defined by the constants listed in this topic.
keywords:
author: bruceperlerms
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 16E36039-0FD6-4A0A-82C8-2C9DB19D27DD
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Usage restriction reference

Usage restrictions are defined by the constants listed in this topic.

Each user right, listed in the AD RMS right column, has a description, an enforcement point, and suggested methods for enforcement.

| AD RMS right/description | How to enforce |
|--------------------------|----------------|
|**IPC_GENERIC_ALL** <br><br> Grants all rights to the user. <br><br> **Common Enforcement Points**: None |This right is used by the system and generally should not be checked directly. <br><br> [**IpcAccessCheck**](/rights-management/sdk/2.1/api/win/functions#msipc_ipcaccesscheck) uses this right to determine whether to grant the user other rights as in this example.<br><br> `/* fAccessGranted is set to TRUE if either the IPC_GENERIC_WRITE or the IPC_GENERIC_ALL right is granted */` <br><br> `IpcAccessCheck(hKey, IPC_GENERIC_WRITE, &fAccessGranted);`|
|**IPC_GENERIC_READ** <br><br> The right to read document contents. <br><br> **Common Enforcement Points**: Document load|Don't load or present document contents|
|**IPC_GENERIC_WRITE** <br><br> The right to edit document contents <br><br> **Common Enforcement Points**: Document modification|Make any UI controls that can be used to modify document contents non-editable. <br><br> Disable any menu items that trigger document changes. **Edit** > **Cut**, **Edit** > **Paste**, and **Insert** are typical examples. <br><br>Disable any shortcut menu items that trigger document changes.|
|No AD RMS right <br><br> No description <br><br> **Common Enforcement Points**: Save | Disable the **File** > **Save** menu. <br><br> **Note** This right does not control **File** > **Save As** because that right does not represent a change to the original document.<br><br> Disable any keyboard shortcut that can be used to trigger a save (for example, Ctrl+S).<br><br> **Tip** A best practice is to update your core **File** > **Save** code to fail if the user doesn't have this right. This acts as a safety net if you miss any UX mechanisms that can be used to trigger a save. |
|**IPC_GENERIC_EXTRACT** <br><br> The right to extract content from a protected format and place it in an unprotected format. <br><br> **Common Enforcement Points**: Copy-to-clipboard | Disable the **Edit** > **Copy** menu. Disable the **Edit** > **Cut** menu. <br><br>Disable **Copy** and **Cut** from any shortcut menus.<br><br>Disable any keyboard shortcut that can be used to trigger a copy (for example, Ctrl+C or Ctrl+X).<br><br>Update window message handlers for [**WM_CUT**](https://msdn.microsoft.com/library/windows/desktop/ms649023) to reject copying of data if the user does not have this right. If the window is using the default Windows-provided message handler, subclass this window and provide your own handlers for **WM_COPY** and **WM_CUT**. |
|No AD RMS right <br><br> No description <br><br> **Common Enforcement Points**: Save As |In your **Save As** dialog box, disable any file formats that would result in the document being saved without RMS protection.|
|No AD RMS right <br><br> No description <br><br> **Common Enforcement Points**: Alt+PrtScn|Call [**IpcProtectWindow**](/rights-management/sdk/2.1/api/win/functions#msipc_ipcprotectwindow) on any windows that render document contents.|
|**IPC_GENERIC_EXPORT** <br><br> The right to extract content from a protected format and place it in a different AD RMS-protected format. <br><br> **Common Enforcement Points**: Save As|In your **Save As** dialog box, disable the ability to save to any other file formats.<br><br>**Tip**A best practice is to update your core **File** > **Save As** code to fail if the user attempts to save this file to a different format and doesn't have this right. This acts as a safety net if you miss any UX mechanisms that can be used to trigger a save as.|
|**IPC_GENERIC_PRINT** <br><br> The right to print document contents. <br><br> **Common Enforcement Points**: Print|Disable the **File** > **Print** menu.<br><br>Disable any keyboard shortcut that could be used to trigger a print (for example, Ctrl+P).<br><br>Disable shortcut menu items that could be used to trigger a print.<br><br>**Tip** A best practice is to update your core **File** > **Print** code to fail if the user doesn't have this right. This acts as a safety net if you miss any UX mechanisms that can be used to trigger a print.|
|**IPC_GENERIC_COMMENT** <br><br> Some applications support the ability to add comments and annotations to the document without updating core document contents.<br><br>This right grants the user access to this capability. <br><br> **Common Enforcement Points**: <br><br> Review > Insert comment <br><br> Review > Delete Comment | Disable any menu items that can be used to modify document comments or annotations. **Review** > **Insert comment** and **Review** > **Delete Comment** are examples. <br><br>Disable any keyboard shortcut that could trigger modification of document comments.<br><br>**Note** A default implementation requires both **IPC_GENERIC_COMMENT** and **IPC_GENERIC_WRITE** to persist new comments to a file. Applications may choose to add support for the case where the **IPC_GENERIC_COMMENT** right is granted and the **IPC_GENERIC_WRITE** right is not. In this case, it is permitted to allow Save, as long as document modifications are restricted to comments only.|
|**IPC_VIEW_RIGHTS** <br><br> No description <br><br> **Common Enforcement Points**: N/A|Enforced by the system. The system will not allow the developer to query the [**user rights list**](/rights-management/sdk/2.1/api/win/structures#msipc_ipc_user_rights_list) from a license unless this right is granted.
|**IPC_EDIT_RIGHTS** <br><br> Some applications allow users to modify the set of users and rights for AD RMS-protected content.<br><br>This right grants the user access to this capability. <br><br> **Common Enforcement Points**: Application rights editing UI control|Disable user access to any UI that can be used to edit the RMS policy for a document.|

 

 

 
