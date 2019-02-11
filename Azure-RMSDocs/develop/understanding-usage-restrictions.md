---
# required metadata

title: Understanding usage restrictions | Azure RMS
description: All RMS enabled applications must enforce usage restrictions.
keywords:
author: bryanla
ms.author: bryanla
manager: barbkess
ms.date: 02/23/2017
ms.topic: conceptual
ms.service: information-protection
ms.assetid: E388B16C-ECDA-4696-A040-D457D3C96766
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Understanding usage restrictions

All RMS enabled applications must enforce usage restrictions. A usage restriction is a condition that results when a user tries to take an action (ex. printing a document), but the RMS policy for that document does not grant them permission or right to perform that action (ex. the PRINT right).

A user's permissions for a document can be queried by using the [IpcAccessCheck](https://msdn.microsoft.com/library/hh535253.aspx) function.

## Designing with usage restrictions

-   Familiarize yourself with standard RMS rights

    For the full set of RMS rights your application may enforce, see [Usage restriction reference](#usage-restriction-reference).

    Note that application defined rights specific to your situation and that go beyond the standard RMS rights may be created.

-   Identify usage restriction enforcement points

    A *usage restriction enforcement point* is a place in your application's control flow where you need to enforce a usage restriction. The [Usage restriction reference](#usage-restriction-reference) topic gives several examples of common enforcement points.

    Evaluate your own application to determine which usage restriction enforcement points apply.

    Your application may not need all enforcement points described in [Usage restriction reference](#usage-restriction-reference). For example, if your application does not allow users to print content, it does not need to check for the **IPC\_GENERIC\_PRINT** right.

-   Update your code to perform an access check at each enforcement point

    For guidance about how to enforce specific rights, see [Usage restriction reference](#usage-restriction-reference).

## Usage restriction reference

Usage restrictions are defined by the following constants.

Each user right, listed in the AD RMS right column, has a description, an enforcement point, and suggested methods for enforcement.

| AD RMS right/description | How to enforce |
|--------------------------|----------------|
|**IPC_GENERIC_ALL** <br><br> Grants all rights to the user. <br><br> **Common Enforcement Points**: None |This right is used by the system and generally should not be checked directly. <br><br> [IpcAccessCheck](https://msdn.microsoft.com/library/hh535253.aspx) uses this right to determine whether to grant the user other rights as in this example.<br><br> `/* fAccessGranted is set to TRUE if either the IPC_GENERIC_WRITE or the IPC_GENERIC_ALL right is granted */` <br><br> `IpcAccessCheck(hKey, IPC_GENERIC_WRITE, &fAccessGranted);`|
|**IPC_GENERIC_READ** <br><br> The right to read document contents. <br><br> **Common Enforcement Points**: Document load|Don't load or present document contents|
|**IPC_GENERIC_WRITE** <br><br> The right to edit document contents <br><br> **Common Enforcement Points**: Document modification|Make any UI controls that can be used to modify document contents non-editable. <br><br> Disable any menu items that trigger document changes. **Edit** > **Cut**, **Edit** > **Paste**, and **Insert** are typical examples. <br><br>Disable any shortcut menu items that trigger document changes.|
|No AD RMS right <br><br> No description <br><br> **Common Enforcement Points**: Save | Disable the **File** > **Save** menu. <br><br> **Note** This right does not control **File** > **Save As** because that right does not represent a change to the original document.<br><br> Disable any keyboard shortcut that can be used to trigger a save (for example, Ctrl+S).<br><br> **Tip** A best practice is to update your core **File** > **Save** code to fail if the user doesn't have this right. This acts as a safety net if you miss any UX mechanisms that can be used to trigger a save. |
|**IPC_GENERIC_EXTRACT** <br><br> The right to extract content from a protected format and place it in an unprotected format. <br><br> **Common Enforcement Points**: Copy-to-clipboard | Disable the **Edit** > **Copy** menu. Disable the **Edit** > **Cut** menu. <br><br>Disable **Copy** and **Cut** from any shortcut menus.<br><br>Disable any keyboard shortcut that can be used to trigger a copy (for example, Ctrl+C or Ctrl+X).<br><br>Update window message handlers for [**WM_CUT**](https://msdn.microsoft.com/library/ms649023) to reject copying of data if the user does not have this right. If the window is using the default Windows-provided message handler, subclass this window and provide your own handlers for **WM_COPY** and **WM_CUT**. |
|No AD RMS right <br><br> No description <br><br> **Common Enforcement Points**: Save As |In your **Save As** dialog box, disable any file formats that would result in the document being saved without RMS protection.|
|No AD RMS right <br><br> No description <br><br> **Common Enforcement Points**: Alt+PrtScn|Call [IpcProtectWindow](https://msdn.microsoft.com/library/hh535268.aspx) on any windows that render document contents.|
|**IPC_GENERIC_EXPORT** <br><br> The right to extract content from a protected format and place it in a different AD RMS-protected format. <br><br> **Common Enforcement Points**: Save As|In your **Save As** dialog box, disable the ability to save to any other file formats.<br><br>**Tip**A best practice is to update your core **File** > **Save As** code to fail if the user attempts to save this file to a different format and doesn't have this right. This acts as a safety net if you miss any UX mechanisms that can be used to trigger a save as.|
|**IPC_GENERIC_PRINT** <br><br> The right to print document contents. <br><br> **Common Enforcement Points**: Print|Disable the **File** > **Print** menu.<br><br>Disable any keyboard shortcut that could be used to trigger a print (for example, Ctrl+P).<br><br>Disable shortcut menu items that could be used to trigger a print.<br><br>**Tip** A best practice is to update your core **File** > **Print** code to fail if the user doesn't have this right. This acts as a safety net if you miss any UX mechanisms that can be used to trigger a print.|
|**IPC_GENERIC_COMMENT** <br><br> Some applications support the ability to add comments and annotations to the document without updating core document contents.<br><br>This right grants the user access to this capability. <br><br> **Common Enforcement Points**: <br><br> Review > Insert comment <br><br> Review > Delete Comment | Disable any menu items that can be used to modify document comments or annotations. **Review** > **Insert comment** and **Review** > **Delete Comment** are examples. <br><br>Disable any keyboard shortcut that could trigger modification of document comments.<br><br>**Note** A default implementation requires both **IPC_GENERIC_COMMENT** and **IPC_GENERIC_WRITE** to persist new comments to a file. Applications may choose to add support for the case where the **IPC_GENERIC_COMMENT** right is granted and the **IPC_GENERIC_WRITE** right is not. In this case, it is permitted to allow Save, as long as document modifications are restricted to comments only.|
|**IPC_VIEW_RIGHTS** <br><br> No description <br><br> **Common Enforcement Points**: N/A|Enforced by the system. The system will not allow the developer to query the [**user rights list**](https://msdn.microsoft.com/library/hh535286.aspx) from a license unless this right is granted.
|**IPC_EDIT_RIGHTS** <br><br> Some applications allow users to modify the set of users and rights for AD RMS-protected content.<br><br>This right grants the user access to this capability. <br><br> **Common Enforcement Points**: Application rights editing UI control|Disable user access to any UI that can be used to edit the RMS policy for a document.|


## Related topics

* [IpcAccessCheck](https://msdn.microsoft.com/library/hh535253.aspx)
