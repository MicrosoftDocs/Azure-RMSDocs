---
title: class StorageDelegate 
description: Documents the storagedelegate::undefined class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 05/31/2022
---

# class StorageDelegate 
A class that defines the interface to the MIP SDK storage for caching.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public mip::StorageTableResult CreateStorageTable(const std::string& path, const MipComponent mipComponent, const std::string& tableName, const std::vector\<std::string\>& allColumns, const std::vector\<std::string\>& encryptedColumns, const std::vector\<std::string\>& keyColumns) const  |  Creates an instance of a storage table that MIP uses for caching. If a table already exists & schema doesnt match with `allColumns` , implementatiion should drop the table and re-create new one.
public StorageSettings GetSettings() const  |  Gets settings used by StorageDelegate.
  
## Members
  
### CreateStorageTable function
Creates an instance of a storage table that MIP uses for caching. If a table already exists & schema doesnt match with `allColumns` , implementatiion should drop the table and re-create new one.

Parameters:  
* **path**: Default path for mip storage. 


* **mipComponent**: MipComponent associated with this table. 


* **tableName**: Name of the table to create. 


* **allColumns**: All columns represented in the table. 


* **encryptedColumns**: Represents the set of columns within **allColumns** that need to be encrypted. This argument is only populated if CacheStorageType (configured via the profile settings) is not **OnDiskEncrypted**, otherwise the MIP SDK will internally encrypt the column data for these columns and modify their name with an 'encrypt_' prefix. 


* **keyColumns**: Key columns used to identify unique table entries.



  
**Returns**: A delegate response which either contains an instance of StorageTable or an exception.
  
### GetSettings function
Gets settings used by StorageDelegate.

  
**Returns**: Settings used by StorageDelegate.