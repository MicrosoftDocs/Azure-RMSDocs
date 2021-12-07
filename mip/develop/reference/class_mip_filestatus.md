---
title: class FileStatus 
description: Documents the filestatus::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/15/2021
---

# class FileStatus 
Interface for all file status functions.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public bool IsProtected()  |  Checks if a file is protected or not.
public bool IsLabeled()  |  Checks if a file is labeled or not.
public bool ContainsProtectedObjects()  |  Checks if the unprotected container file contains protected objects. Returns false if this file is protected or not a container file
  
## Members
  
### IsProtected function
Checks if a file is protected or not.
  
### IsLabeled function
Checks if a file is labeled or not.
  
### ContainsProtectedObjects function
Checks if the unprotected container file contains protected objects. Returns false if this file is protected or not a container filele