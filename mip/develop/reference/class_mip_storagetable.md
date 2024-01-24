---
title: class StorageTable 
description: Documents the storagetable::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/07/2023
---

# class StorageTable 
A class that defines the interface to the MIP SDK storage table used for caching.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public virtual void Insert(const std::vector\<std::string\>& allColumnValues)  |  Adds a row to the table.
public void InsertOrReplace(const std::vector\<std::string\>& allColumnValues)  |  Adds a row to the table.
public std::vector\<std::vector\<std::string\>\> List()  |  List all the rows in the table.
public void Update(const std::vector\<std::string\>& updateColumns, const std::vector\<std::string\>& updateValues, const std::vector\<std::string\>& queryColumns, const std::vector\<std::string\>& queryValues)  |  Update a set of rows within the table.
public void Delete(const std::vector\<std::string\>& queryColumns, const std::vector\<std::string\>& queryValues)  |  Delete a set of rows specified by queryColumns and queryValues.
public std::vector\<std::vector\<std::string\>\> Find(const std::vector\<std::string\>& queryColumns, const std::vector\<std::string\>& queryValues)  |  Find a set of rows specified by `queryColumns` and `queryValues`. This method can return multiple rows based on the filter.
  
## Members
  
### Insert function
Adds a row to the table.

Parameters:  
* **allColumnValues**: All column values in sequence as represented in storage table.


> Deprecated: This method will soon be deprecated in favor of InsertOrReplace. If the new version has been implemented, there is no need to implement this version.
  
### InsertOrReplace function
Adds a row to the table.

Parameters:  
* **allColumnValues**: All column values in sequence as represented in storage table.


  
### List function
List all the rows in the table.

  
**Returns**: List of all rows where each row is a vector of column values
  
### Update function
Update a set of rows within the table.

Parameters:  
* **updateColumns**: List of column names that define the new row data. 


* **updateValues**: List of column values corresponding to **updateColumns**. 


* **queryColumns**: List of column names that identify the table rows to update. 


* **queryValues**: List of column values corresponding to **queryColumns**.


  
### Delete function
Delete a set of rows specified by queryColumns and queryValues.

Parameters:  
* **queryColumns**: List of column names that identify the table rows to delete. 


* **queryValues**: List of column values corresponding to **queryColumns**.


  
### Find function
Find a set of rows specified by `queryColumns` and `queryValues`. This method can return multiple rows based on the filter.

Parameters:  
* **queryColumns**: List of column names that identify the table rows to find. 


* **queryValues**: List of column values corresponding to **queryColumns**.



  
**Returns**: List of all rows where each row is a list containing column values