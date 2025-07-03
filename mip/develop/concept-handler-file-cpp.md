---
title: Concepts - File handlers in the MIP SDK.
description: This article will help you understand how File SDK handlers are created and used for calling operations.
author: msmbaldwin
ms.service: information-protection
ms.topic: conceptual
ms.date: 04/10/2025
ms.author: mbaldwin
---
# Microsoft Information Protection SDK - File handler concepts

In the MIP File SDK, the `mip::FileHandler` exposes all of the various operations that can be used to read and write labels, or protection, across a set of file types for which support is built-in. 

## Supported file types

- Office File Formats based on OPC (Office 2010 and later)
- Legacy Office File Formats (Office 2007)
- PDF
- Generic PFILE support
- Files that support Adobe XMP

## File handler functions

`mip::FileHandler` exposes methods for reading, writing, and removing both labels and protection information. For the full list, consult the [API reference](https://microsoftdocs.github.io/mip-sdk-docs/cpp/classFileHandler.html).

In this article, the following methods will be covered:

- `GetLabelAsync()`
- `SetLabel()`
- `DeleteLabel()`
- `RemoveProtection()`
- `CommitAsync()`


## Requirements

Creating a `FileHandler` to work with a specific file requires:

- A `FileProfile`
- A `FileEngine` added to the `FileProfile`
- A class that inherits `mip::FileHandler::Observer`

## Create a file handler

The first step required in managing any files in the File SDK is to create a `FileHandler` object. This class implements all of the functionality required to get, set, update, delete, and commit label changes to files.

Creating the `FileHandler` is as easy as calling the `FileEngine`'s `CreateFileHandlerAsync` function using the promise/future pattern.

`CreateFileHandlerAsync` accepts three parameters: The path to the file that should be read or modified, the `mip::FileHandler::Observer` for asynchronous event notifications, and the promise for the `FileHandler`.

**Note:** The `mip::FileHandler::Observer` class must be implemented in a derived class as `CreateFileHandler` requires the `Observer` object.

```cpp
auto createFileHandlerPromise = std::make_shared<std::promise<std::shared_ptr<mip::FileHandler>>>();
auto createFileHandlerFuture = createFileHandlerPromise->get_future();
fileEngine->CreateFileHandlerAsync(filePath, std::make_shared<FileHandlerObserver>(), createFileHandlerPromise);
auto fileHandler = createFileHandlerFuture.get();
```

After successfully creating the `FileHandler` object, file operations (get/set/delete/commit) can be performed.

## Read a label

### Metadata requirements

There are a few requirements to successfully reading metadata from a file and translating in to something that can be used in applications.

- The label being read must still exist in the Microsoft 365 service. If it's been deleted entirely, the SDK will fail to obtain information about that label and will return an error.
- The file metadata must be intact. This metadata includes:
  - Attribute1
  - Attribute2

### GetLabelAsync()

Having created the handler to point to a specific file, we return to the promise/future pattern to asynchronously read the label. The promise is for a `mip::ContentLabel` object that contains all of the information about the applied label.

After instantiating the `promise` and `future` objects, we read the label by calling `fileHandler->GetLabelAsync()` and providing the `promise` as the lone parameter. Finally, the label can be stored in a `mip::ContentLabel` object that will we get from the `future`.

```cpp
auto loadPromise = std::make_shared<std::promise<std::shared_ptr<mip::ContentLabel>>>();
auto loadFuture = loadPromise->get_future();
fileHandler->GetLabelAsync(loadPromise);
auto label = loadFuture.get();
```

Label data can be read from the `label` object and passed to any other component or functionality in the application.

***

## Set a label

Setting a label is a two part process. First, having created a handler that points to the file in question, the label can be set by calling `FileHandler->SetLabel()` with some parameters: `mip::Label`, `mip::LabelingOptions`, and `mip::ProtectionOptions`. First, we must resolve the label ID to a label and then define the labeling options. 

### Resolve label ID to mip::Label

The **SetLabel** function's first parameter is a `mip::Label`. Often, the application is working with label identifiers rather than labels. The label identifier can be resolved to the `mip::Label` by calling **GetLabelById** on the file or policy engine:

```cpp
mip::Label label = mEngine->GetLabelById(labelId);
```

### Labeling options

The second parameter required to set the label is `mip::LabelingOptions`.

`LabelingOptions` specifies additional information about the label such as the `AssignmentMethod` and justification for an action.

- `mip::AssignmentMethod` is an enumerator that has three values: `STANDARD`, `PRIVILEGED`, or `AUTO`. Review the `mip::AssignmentMethod` reference for more details.
- Justification is required only if the service policy requires it *and* when lowering the *existing* sensitivity of a file.

This snip demonstrates creating the `mip::LabelingOptions` object and setting downgrade justification and message.

```cpp
auto labelingOptions = mip::LabelingOptions(mip::AssignmentMethod::STANDARD);
labelingOptions.SetDowngradeJustification(true, "Because I made an educated decision based upon the contents of this file.");
```

### Protection settings

Some applications may need to perform operations on behalf of a delegated user identity. The `mip::ProtectionSettings` class allows the application to define the delegated identity *per handler*. Previously, the delegation was performed by the engine classes. This had significant disadvantages in application overhead and service round trips. By moving the delegated user settings to `mip::ProtectionSettings` and making that part of the handler class, we eliminate this overhead, resulting in better performance for applications that are performing many operations on behalf of diverse sets of user identities. 

If delegation isn't required, then pass `mip::ProtectionSettings()` to the **SetLabel** function. If delegation is required, it can be achieved by creating a `mip::ProtectionSettings` object and setting the delegated mail address:

```cpp
mip::ProtectionSettings protectionSettings; 
protectionSettings.SetDelegatedUserEmail("alice@contoso.com");
```

### Set the label

Having fetched the `mip::Label` using the ID, set the labeling options, and, optionally, set the protection settings, the label can now be set on the handler.

If you didn't set protection settings, set the label by calling `SetLabel` on the handler:

```cpp
fileHandler->SetLabel(label, labelingOptions, mip::ProtectionSettings());
```

If you did require protection settings to perform a delegated operation, then:

```cpp
fileHandler->SetLabel(label, labelingOptions, protectionSettings);
```

Having now set the label on the file referenced by the handler, there's still one more step to commit the change and write a file to disk or create an output stream.

### Commit changes

The final step in committing any change to a file in the MIP SDK is to **commit** the change. This is accomplished by using the `FileHandler->CommitAsync()` function. 

To implement the commitment function, we return to promise/future, creating a promise for a `bool`. The `CommitAsync()` function will return true if the operation succeeded or false if it failed for any reason. 

After creating the `promise` and `future`, `CommitAsync()` is called and two parameters provided: The output file path (`std::string`), and the promise. Lastly, the result is obtained by getting the value of the `future` object.

```cpp
auto commitPromise = std::make_shared<std::promise<bool>>();
auto commitFuture = commitPromise->get_future();
fileHandler->CommitAsync(outputFile, commitPromise);
auto wasCommitted = commitFuture.get();
```

**Important:** The `FileHandler` won't update or overwrite existing files. It's up to the developer to implement **replacing** the file that is being labeled. 

If writing a label to **FileA.docx**, a copy of the file, **FileB.docx**, will be created with the label applied. Code must be written to remove/rename **FileA.docx** and rename **FileB.docx**.

***

### Delete a label

```cpp
auto fileHandler = mEngine->CreateFileHandler(filePath, std::make_shared<FileHandlerObserverImpl>());
fileHandler->DeleteLabel(mip::AssignmentMethod::PRIVILEGED, "Label unnecessary.");
auto commitPromise = std::make_shared<std::promise<bool>>();
auto commitFuture = commitPromise->get_future();
fileHandler->CommitAsync(outputFile, commitPromise);
```

### Remove protection

Your MIP File SDK application must validate that the user has rights to remove protection from the file being accessed. This can be accomplished by performing an [access check](./concept-accesscheck.md) prior to removing protection.

The `RemoveProtection()` function behaves in a manner similar to `SetLabel()` or `DeleteLabel()`. The method is called on the existing `FileHandler` object, then the change must be committed.

>[!IMPORTANT]
> As the application developer, it's your reponsibility to perform this access check. Failure to properly perform the access check can reuslt in data leakage.

C++ example: 

```cpp
// Validate that the file referred to by the FileHandler is protected.
if (fileHandler->GetProtection() != nullptr)
{
    // Validate that user is allowed to remove protection.
    if (fileHandler->GetProtection()->AccessCheck(mip::rights::Export() || fileHandler->GetProtection()->AccessCheck(mip::rights::Owner()))
    {
        auto commitPromise = std::make_shared<std::promise<bool>>();
        auto commitFuture = commitPromise->get_future();
        // Remove protection and commit changes to file.
        fileHandler->RemoveProtection();
        fileHandler->CommitAsync(outputFile, commitPromise);
        result = commitFuture.get();
    }
    else
    {
        // Throw an exception if the user doesn't have rights to remove protection.
        throw std::runtime_error("User doesn't have EXPORT or OWNER right.");
    }
}
```

.NET example: 

```csharp
if(handler.Protection != null)
{                
    // Validate that user has rights to remove protection from the file.                    
    if(handler.Protection.AccessCheck(Rights.Export) || handler.Protection.AccessCheck(Rights.Owner))
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
