---
title: class StorageDelegate::StorageSettings 
description: Documents the storagedelegate::storagesettings class of the Microsoft Information Protection SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/15/2021
---

# class StorageDelegate::StorageSettings 
Settings used by StorageDelegate.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public StorageSettings(bool isRemoteStorage, bool isInMemoryStorageSupported)  |  Interface for configuring the storage settings.
public bool IsRemoteStorage() const  |  Gets whether remote storage is used or not.
public bool IsInMemoryStorageSupported() const  |  Gets whether the delegate supports in-memory storage.
  
## Members
  
### StorageSettings function
Interface for configuring the storage settings.

Parameters:  
* **isRemoteStore**: represents if store is remote. This will be taken into account for internal encryption. 


* **isInMemoryStorageSupported**: Declares whether the delegate supports in-memory storage.


  
### IsRemoteStorage function
Gets whether remote storage is used or not.

  
**Returns**: Whether remote storage is used or not.
  
### IsInMemoryStorageSupported function
Gets whether the delegate supports in-memory storage.

  
**Returns**: True if the delegate supports in-memory storage.e.