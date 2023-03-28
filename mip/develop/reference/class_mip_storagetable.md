---
title: class StorageTable 
description: Documents the storagetable::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/14/2022
---

# class StorageTable 
A class that defines the interface to the MIP SDK storage table used for caching.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public void Insert(const std::vector&lt;std::string&gt;& allColumnValues)  |  Adds a row to the table.
public std::vector&lt;std::vector&lt;std::string&gt;&gt; List()  |  List all the rows in the table.
public void Update(const std::vector&lt;std::string&gt;& updateColumns, const std::vector&lt;std::string&gt;& updateValues, const std::vector&lt;std::string&gt;& queryColumns, const std::vector&lt;std::string&gt;& queryValues)  |  Update a set of rows within the table.
public void Delete(const std::vector&lt;std::string&gt;& queryColumns, const std::vector&lt;std::string&gt;& queryValues)  |  Delete a set of rows specified by queryColumns and queryValues.
public std::vector&lt;std::vector&lt;std::string&gt;&gt; Find(const std::vector&lt;std::string&gt;& queryColumns, const std::vector&lt;std::string&gt;& queryValues)  |  Find a set of rows specified by `queryColumns` and `queryValues`. This method can return multiple rows based on the filter.
  
## Members
  
### Insert function
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



  
**Returns**: List of all rows where each row is a list containing column values.
