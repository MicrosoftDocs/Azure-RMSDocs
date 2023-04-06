---
title: class StorageDelegate 
description: Documents the storagedelegate::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class StorageDelegate 
A class that defines the interface to the MIP SDK storage for caching.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public mip::StorageTableResult CreateStorageTable(const std::string& path, const MipComponent mipComponent, const std::string& tableName, const std::vector&lt;std::string&gt;& allColumns, const std::vector&lt;std::string&gt;& encryptedColumns, const std::vector&lt;std::string&gt;& keyColumns) const  |  Creates an instance of a storage table that MIP uses for caching. If a table already exists & schema doesnt match with `allColumns` , implementatiion should drop the table and re-create new one.
public StorageSettings GetSettings() const  |  Gets settings used by [StorageDelegate](class_mip_storagedelegate.md).
  
## Members
  
### CreateStorageTable function
Creates an instance of a storage table that MIP uses for caching. If a table already exists & schema doesnt match with `allColumns` , implementatiion should drop the table and re-create new one.

Parameters:  
* **path**: Default path for mip storage. Will end in file extension returned from [StorageSettings::OnDiskExtension()](#class_storage_delegate_1_1_storage_settings_1a48050a5a152f5e0b5ea85033a0124722)


* **mipComponent**: [MipComponent](#storage__delegate_8h_1a96a7b2207da23bc5c9800d75a120fa49) associated with this table. 


* **tableName**: Name of the table to create. 


* **allColumns**: All columns represented in the table. 


* **encryptedColumns**: Represents the set of columns within **allColumns** that need to be encrypted. This argument is only populated if [CacheStorageType](#common__types_8h_1a174ba9275624a6880ce3be3fdbaa6c5f) (configured via the profile settings) is not **OnDiskEncrypted**, otherwise the MIP SDK will internally encrypt the column data for these columns and modify their name with an 'encrypt_' prefix. 


* **keyColumns**: Key columns used to identify unique table entries.



  
**Returns**: A delegate response which either contains an instance of [StorageTable](#class_storage_table) or an exception.
  
### GetSettings function
Gets settings used by [StorageDelegate](class_mip_storagedelegate.md).

  
**Returns**: Settings used by [StorageDelegate](class_mip_storagedelegate.md).