---
title: Access Check - Microsoft Information Protection SDK
description: Technical details about performing access checks with the Microsoft Purview Information Protection Software Development kit.
author: tommoser
ms.author: tommos
ms.date: 08/16/2022
ms.topic: conceptual
ms.service: information-protection

---

# Access checks in the Microsoft Information Protection SDK

Enforcement of the rights defined by the encryption configuration in Complaince Center is the responsibility of the application developer. The SDK provides an API and set of enumerators to simplify these access checks. 

The examples and tables below will demonstrate which scenarios require the access check, the list of rights to check against, and how to perform the check.

## Rights List and Outcomes

For a full list of the usage rights and descriptions, refer to [Configure usage rights for Azure Information Protection](../../Azure-RMSDocs/configure-usage-rights.md).

This section defines the responsibilities of an **application** when specific rights are, or are not, present. 

> [!NOTE]
> It's the responsbility of application developers to both **check and enforce** rights. Failure to perform checks may result in data loss. 

| Right                                                                                                  | Permits                                                                                       | If Not Present                                      | Does Not Permit                                                          | Application Responsibility                                                           |
| ------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------- | --------------------------------------------------- | ------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ |
| OWNER                                                                                                  | Perform all operations, including remove protection.                                          | Review set of granular rights.                      | Not applicable.                                                          | Not applicable.                                                                      |
| EDIT                                                                                                   | User can edit the content and save changes. User cannot remove protection.                    | Cannot edit or save the document.                   | Print, export/save as, copy/extract, forward/reply/reply all.            | Prohibit all edit/save controls if EDIT not present.                                 |
| EXPORT                                                                                                 | User can save the file to a different format. The format does not need to support protection. | Cannot export to a different format.                | Print, edit/save, copy/extract, forward/reply/reply all.                 | Prohibit all export/save as controls if EXPORT not set.                              |
| PRINT                                                                                                  | User can print to a printer.                                                                  | Cannot print.                                       | edit/save, export/save as, copy/extract, forward/reply/reply all.        | Prohibit printing if PRINT right is not set.                                         |
| REPLY                                                                                                  | User can reply to an email.                                                                   | Cannot reply to or edit the email.                  | Print, edit/save, export/save as, copy/extract, forward/reply all.       | Prohibit user from replying to email, including editing or changing recipient lists. |
| REPLY ALL                                                                                              | User can reply all to an email.                                                               | Cannot reply all to the email.                      | Print, edit/save, export/save as, copy/extract, forward/reply.           | Prohibit user from using the reply all button.                                       |
| FORWARD                                                                                                | User can forward the email.                                                                   | Cannot forward the email. Recipient list is locked. | Print, edit/save, export/save as, copy/extract, reply/reply all.         | Prohibit the user from using the reply all button.                                                     |
| VIEW                                                                                                   | Viewing of the content. This is the base right required for access.                           | VIEW is required.                                   | Print, edit/save, export/save as, copy/extract, forward/reply/reply all. | Prohibit all screenshot, save, print, export, or any scenario that grants access to plaintext content. |

## Scenarios



## Performing Access Checks


```csharp
if(handler.Protection != null)
{                
    // Validate that user has rights to remove protection from the file.                    
    if(handler.Protection.AccessCheck(Rights.Extract))
    {
        // If user has Extract right, return decrypted copy. Otherwise, throw exception. 
        handler.RemoveProtection();
        bool result = handler.CommitAsync(outputPath).GetAwaiter().GetResult();     
        return result;   
    }
    else
    {
        throw new Microsoft.InformationProtection.Exceptions.AccessDeniedException("User lacks EXPORT right.");
    }
}
```

