---
title: class JsonDelegate 
description: Documents the jsondelegate::undefined class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 11/15/2021
---

# class JsonDelegate 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public mip::JsonResult CreateJsonObjectDocument() const  |  Creates a blank json document with an Object as the root.
public mip::JsonResult Parse(const std::string& value) const  |  parse value as json document.
  
## Members
  
### CreateJsonObjectDocument function
Creates a blank json document with an Object as the root.

  
**Returns**: A delegate response which either contains a pointer to a blank json document with an Object as the root, or an exception.
  
### Parse function
parse value as json document.

  
**Returns**: A delegate response which either contains a pointer to a json document of the parsed data, or an exception.