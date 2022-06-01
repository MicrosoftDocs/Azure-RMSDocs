---
title: class JsonDocument 
description: Documents the jsondocument::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 05/31/2022
---

# class JsonDocument 
JsonDocument abstraction class.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::shared_ptr&lt;JsonValue&gt; Root() const  |  Gets a pointer to the root node of the document.
public std::shared_ptr&lt;JsonValue&gt; CreateObjectValue()  |  Create an Object value to later be added as a child of this document.
public std::shared_ptr&lt;JsonValue&gt; CreateArrayValue()  |  Create an Array value to later be added as a child of this document.
  
## Members
  
### Root function
Gets a pointer to the root node of the document.

  
**Returns**: A pointer to the root node of the document.
  
### CreateObjectValue function
Create an Object value to later be added as a child of this document.

  
**Returns**: An Object value to later be added as a child of this document.
  
### CreateArrayValue function
Create an Array value to later be added as a child of this document.

  
**Returns**: An Array value to later be added as a child of this document.t.