---
title: class DirectoryObject 
description: Documents the directoryobject::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/07/2023
---

# class DirectoryObject 
The directory object information which includes- type, email, objectId and PUID.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public DirectoryObject(const DirectoryObjectType type, const std::string& email, const std::string& objectId, const std::string& puid)  |  DirectoryObject constructor.
public const DirectoryObjectType GetDirectoryObjectType() const  |  Gets type of directory object.
public const std::string& GetEmail() const  |  Gets email address of directory object.
public const std::string& GetObjectId() const  |  Gets object ID of directory object.
public const std::string& GetPuid() const  |  Gets GUID of directory object.
enum DirectoryObjectType  |  Describes the type of directory object.
  
## Members
  
### DirectoryObject function
DirectoryObject constructor.

Parameters:  
* **type**: The type of directory object 


* **email**: The email of directory object 


* **objectId**: The object ID of directory object 


* **puid**: The PUID of directory object


  
### GetDirectoryObjectType function
Gets type of directory object.

  
**Returns**: Type of directory object
  
### GetEmail function
Gets email address of directory object.

  
**Returns**: Email address of directory object
  
### GetObjectId function
Gets object ID of directory object.

  
**Returns**: Object ID of directory object
  
### GetPuid function
Gets GUID of directory object.

  
**Returns**: GUID of directory object
  
### DirectoryObjectType enum

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
UNKNOWN            | 
INTERNAL            | Internal user - ANYONE
USER            | individual user
GROUP            | group object
Describes the type of directory object.
