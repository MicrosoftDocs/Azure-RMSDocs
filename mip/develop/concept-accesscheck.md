---
title: Access Check - Microsoft Information Protection SDK
description: Technical details about performing access checks with the Microsoft Purview Information Protection Software Development kit.
author: tommoser
ms.author: tommos
ms.date: 04/10/2025
ms.topic: conceptual
ms.service: information-protection

---

# Access checks in the Microsoft Purview Information Protection SDK

Enforcement of the information rights management rights [defined in the compliance portal](/microsoft-365/compliance/encryption-sensitivity-labels) is the responsibility of the application developer. The SDK provides an API and set of enumerators to simplify these access checks.

The examples and tables below will demonstrate which scenarios require an access check, the list of rights to check against, and how to perform the check.

## Rights list and outcomes

For a full list of the usage rights and descriptions, refer to [Configure usage rights for Azure Information Protection](/azure/information-protection/configure-usage-rights). This article defines the responsibilities of an application developer in rights enforcement and enabled functions when specific rights are, or are not, present. 

> [!IMPORTANT]
> It's the responsbility of application developers to both **check and enforce** rights. Failure to perform checks may result in data loss.

## Scenarios

Where and how your application performs access checks will depend upon the type of application you're building. Applications that handle full-file output and have no user interface will use the `EXTRACT` or `OWNER` rights most frequently. Applications with a user interface will require most granular controls, blocking access to user controls and export paths in the application. See the [performing access checks](#performing-access-checks) section for code examples.

### Applications without a user interface

Applications without a user interface are often service-based or commandline interfaces (CLI). When your application is handling files protected by Purview Information Protection, it **must** ensure that a user without the correct rights can't use the service or CLI to export the file in an unprotected format.

These applications should validate that the **OWNER** or **EXTRACT** rights are present. Users with **OWNER** can perform any operation. Users with **EXTRACT** can directly remove protection or save to a new format, even if that format doesn't support protection.

### Applications with a user interface

File SDK applications with a user interface must implement controls restricting access to operations the user isn't permitted to perform. One example of such an application is the Azure Information Protection Viewer. The viewer temporarily decrypts the file and renders contents in the application window. It performs granular access checks before displaying the document and disables user interface elements based on the results of the access checks.

A partial workflow of performing access checks could look like:

- Does the user have the **OWNER** right? If yes, enable all controls and stop processing other rights.
- Does the user have the **PRINT** right? If yes, enable the print control. If not, disable the print control.
- Does the user have the **EXPORT** right? If yes, enable export controls and UI elements. If not, disable these elements.
- Does the user have the **EXTRACT** right? If yes, enable copying and screenshots. If not, disable these functions.
- Does the user have the **EDIT** right? If yes, enable editing and saving the current item. If not, make the item read only.

These checks should be performed for all permissions in the [rights list and outcomes](#rights-list-and-outcomes) table, except for the **VIEW** right. The file won't be accessible without this right.

## Performing access checks

Patterns for performing the access check are similar across the File and Protection SDK for C++, .NET, and Java.

These code samples assume you've gone through the steps to initialize the SDK and have instantiated an engine and handler.

- [Quickstart: Client application initialization (C++)](quick-app-initialization-cpp.md)
- [Quickstart: Client application initialization (C#)](quick-app-initialization-csharp.md)
- [Quickstart: Client application initialization for Protection SDKs (C++)](quick-protection-app-initialization-cpp.md)
- [Quickstart: Client application initialization for Protection SDKs (C#)](quick-protection-app-initialization-csharp.md)

### Performing Access Checks in the File SDK with .NET

This code snip assumes that a FileHandler has been created and points to a valid file.

```csharp
// Validate that the file referred to by the FileHandler is protected.
if(handler.Protection != null)
{                
    // Validate that user has rights to remove protection from the file.                    
    if(handler.Protection.AccessCheck(Rights.Extract))
    {
        // If user has Extract right, remove protection and commit the change. Otherwise, throw exception. 
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

### Performing Access Checks in the Protection SDK with .NET

This code snip assumes that a ProtectionHandler has been created for consumption.

```csharp
// Validate that the file referred to by the FileHandler is protected.
if(protectionHandler != null)
{                
    // Validate that user has rights to remove protection from the file.                    
    if(protectionHandler.AccessCheck(Rights.Print))
    {
        // If the user has the print right, enable the control.
        // SetPrintControlEnabled() is an example and not a MIP SDK function.  
        SetPrintControlEnabled(true);
    }
    else
    {
        // If the user does not have the print right, disable the control.
        // SetPrintControlEnabled() is an example and not a MIP SDK function.  
        SetPrintControlEnabled(false);
    }
}
```

### Performing Access Checks in the File SDK with C++

This code snip assumes that a FileHandler has been created and points to a valid file.

```cpp
// Validate that the file referred to by the FileHandler is protected.
if (fileHandler->GetProtection() != nullptr)
{
    if (fileHandler->GetProtection()->AccessCheck(mip::rights::Extract()))
    {
        auto commitPromise = std::make_shared<std::promise<bool>>();
        auto commitFuture = commitPromise->get_future();
        fileHandler->RemoveProtection();
        fileHandler->CommitAsync(outputFile, commitPromise);
        result = commitFuture.get();
    }
    else
    {
        throw std::runtime_error("User doesn't have EXTRACT right.");
    }
}
```

### Performing Access Checks in the Protection SDK with C++

This code snip assumes that a ProtectionHandler has been created for consumption.

```cpp
// Validate that the file referred to by the FileHandler is protected.
if (protectionHandler != nullptr)
{
    if (protectionHandler->AccessCheck(mip::rights::Print()))
    {
        // If the user has the print right, enable the control.
        // SetPrintControlEnabled() is an example and not a MIP SDK function.  
        SetPrintControlEnabled(true);
    }
    else
    {
        // If the user does not have the print right, disable the control.
        // SetPrintControlEnabled() is an example and not a MIP SDK function.  
        SetPrintControlEnabled(false);
    }
}
```

## Next Steps

Now that you have an idea of how to properly perform access checks and to enforce the rights associated with those checks, continue with [file handler concepts](./concept-handler-file-cpp.md) to learn more about removing protection from files.
