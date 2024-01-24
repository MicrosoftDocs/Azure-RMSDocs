---
title: class StorageDelegate::StorageSettings 
description: Documents the storagedelegate::storagesettings class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/07/2023
---

# class StorageDelegate::StorageSettings 
Settings used by StorageDelegate.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public StorageSettings(bool isRemoteStorage, bool isInMemoryStorageSupported, const std::string& onDiskExtension)  |  Interface for configuring the storage settings.
public bool IsRemoteStorage() const  |  Gets whether remote storage is used or not.
public bool IsInMemoryStorageSupported() const  |  Gets whether the delegate supports in-memory storage.
public std::string OnDiskExtension() const  |  Gets the extension that the delegate will use when storing a table on disk.
  
## Members
  
### StorageSettings function
Interface for configuring the storage settings.

Parameters:  
* **isRemoteStore**: represents if store is remote. This will be taken into account for internal encryption. 


* **isInMemoryStorageSupported**: Declares whether the delegate supports in-memory storage. 


* **onDiskExtension**: The file extension that will be used to store the data if it is needed. Should begin with ".".


  
### IsRemoteStorage function
Gets whether remote storage is used or not.

  
**Returns**: Whether remote storage is used or not.
  
### IsInMemoryStorageSupported function
Gets whether the delegate supports in-memory storage.

  
**Returns**: True if the delegate supports in-memory storage.
  
### OnDiskExtension function
Gets the extension that the delegate will use when storing a table on disk.

  
**Returns**: The extension that will be used. Default to ".sqlite3".
Extension will have "." preceding it