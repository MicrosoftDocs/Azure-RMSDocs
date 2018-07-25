# File Handler - Protection

## Summary

In the MIP SDK File API, the `mip::FileHandler` exposes all of the various operations that can be used to read and write labels, or protection, across a set of file types for which support is built-in. Requests to extend the supported file types can be submitted at **TODO**.

### Supported File Types

- Office File Formats based on OCP (Office 2010 and later)
- Legacy Office File Formats (Office 2007)
- PDF
- Generic PFILE support
- Files that support Adobe XMP
- ?

### File Handler Functions

`mip::FileHandler` exposes methods for reading, writing, and removing both labels and protection information. For the full list, consult the [API reference](https://docs.microsoft.com/en-us/azure/information-protection/develop/mip/class_mip_filehandler).

In this exercise, the following methods will be covered:

- `GetProtectionAsync()`
- `SetCustomPermissions()`
- `RemoveProtection()`
- `CommitAsync()`

### Requirements

Creating a `FileHandler` to work with a specific file requires:

- A `FileProfile`
- A `FileEngine` added to the `FileProfile`
- A class that inherits `mip::FileHandler::Observer`, similar to the pattern outlined [here]().

### Create a File Handler

The first step required in managing any files in the File API is to create a `FileHandler` object. This class implements all of the functionality required to get, set, update, delete, and commit label changes to files.

Creating the `FileHandler` is as easy as calling the `FileEngine`'s `CreateFileHandlerAsync` function using the promise/future pattern.

`CreateFileHandlerAsync` accepts three parameters: The path to the file that should be read or modified, the `mip::FileHandler::Observer` for asynchronous event notifications, and the promise for the `FileHandler`.

**Note:** The `mip::FileHandler::Observer` class must be implemented in a derived class as `CreateFileHandler` requires the `Observer` object. Review [here]() for `Observer` details.

```cpp
auto createFileHandlerPromise = std::make_shared<std::promise<std::shared_ptr<mip::FileHandler>>>();
auto createFileHandlerFuture = createFileHandlerPromise->get_future();
fileEngine->CreateFileHandlerAsync(filePath, std::make_shared<FileHandlerObserver>(), createFileHandlerPromise);
auto handler = createFileHandlerFuture.get();
```

After successfully creating the `FileHandler` object, file protection operations can be performed.

***

### Reading Protection Information

#### GetLabelAsync()

```cpp
//TODO
```

Having created the handler to point to a specific file, we return to the promise/future pattern to asynchronously read the label. The promise is for a `mip::ContentLabel` object that contains all of the information about the applied label.

After instantiating the `promise` and `future` objects, we read the label by calling `handler->GetLabelAsync()` and providing the `promise` as the lone parameter. Finally, the label can be stored in a `mip::ContentLabel` object that will we get from the `future`.

```cpp
auto loadPromise = std::make_shared<std::promise<std::shared_ptr<mip::ContentLabel>>>();
auto loadFuture = loadPromise->get_future();
handler->GetLabelAsync(loadPromise);
auto label = loadFuture.get();
```

Label data can be read from the `label` object and passed to any other component or functionality in the application.

***

### Applying Custom Protection

```cpp
//TODO
```

Setting a label is a two part process. First, having created a handler that points to the file in question, the label can be set by calling `FileHandler->SetLabel()` with a couple of parameters.

```cpp
handler->SetLabel(label->GetId(), mip::LabelingOptions{ mip::AssignmentMethod::PRIVILEGED, "" });
```

The first parameters is simply the label identifier from `ListLabelsAsync()`. This value can be stored in a dedicated variable or by reading `mip::Label->GetId()`.

The example above assumes we've stored the desired `mip::Label` in an object called `label`.

### Remove Protection

```cpp

//TODO

auto handler = mEngine->CreateFileHandler(filePath, std::make_shared<FileHandlerObserverImpl>());
handler->DeleteLabel(mip::AssignmentMethod::PRIVILEGED, "Label unnecessary.");
auto commitPromise = std::make_shared<std::promise<bool>>();
auto commitFuture = commitPromise->get_future();
handler->CommitAsync(outputFile, commitPromise);
```

### Commit Changes

The final step in committing any change to a file in the MIP SDK is to **commit** the change. This is accomplished by using the `FileHandler->CommitAsync()` function. 

To implement the commitment function, we return to promise/future, creating a promise for a `bool`. The `CommitAsync()` function will return true if the operation succeeded or false if it failed for any reason. TODO: Update details on exception handling.

After creating the `promise` and `future`, `CommitAsync()` is called and two parameters provided: The output file path (`std::string`), and the promise. Lastly, the result is obtained by getting the value of the `future` object.

```cpp
auto commitPromise = std::make_shared<std::promise<bool>>();
auto commitFuture = commitPromise->get_future();
handler->CommitAsync(outputFile, commitPromise);
auto wasCommitted = commitFuture.get();
```

**Important:** The `FileHandler` will not update or overwrite existing files. It's up to the developer to implement **replacing** the file that is being labeled. 

If writing a label to **FileA.docx**, a copy of the file, **FileB.docx**, will be created with the label applied. Code must be written to remove/rename **FileA.docx** and rename **FileB.docx**.

***



## Next Steps

This article covered all of the **labeling** operations that can be performed by the `FileHandler`. `FileHandler` also implements protection handling capabilities that will be discussed in depth [here]().