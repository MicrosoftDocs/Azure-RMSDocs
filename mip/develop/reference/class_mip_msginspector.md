---
title: class MsgInspector 
description: Documents the msginspector::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/14/2022
---

# class MsgInspector 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::vector&lt;uint8_t&gt;& GetBody() const  |  Get the body of the msg. if TXT/HTML formatted as utf8.
public unsigned int GetCodePage() const  |  Get body encoding code page, relevant for txt, html body formats.
public BodyType GetBodyType() const  |  Get body type.
public const std::vector&lt;std::shared_ptr&lt;MsgAttachmentData&gt;&gt;& GetAttachments() const  |  Get a list of attachment as msg attachment data objects.
public InspectorType GetInspectorType() const  |  Get file types,.
public std::shared_ptr&lt;Stream&gt; GetFileStream() const  |  Get the file stream.
  
## Members
  
### GetBody function
Get the body of the msg. if TXT/HTML formatted as utf8.

  
**Returns**: A vector of bytes.
  
### GetCodePage function
Get body encoding code page, relevant for txt, html body formats.

  
**Returns**: An unsigned code page. 
  
**See also**: [/windows/win32/intl/code-page-identifiers](/windows/win32/intl/code-page-identifiers)
  
### GetBodyType function
Get body type.

  
**Returns**: The message's body type.
  
### GetAttachments function
Get a list of attachment as msg attachment data objects.

  

**Returns**: A vector of std::unique_ptr\<MsgAttachmentData\>

  
### GetInspectorType function
Get file types,.

  
**Returns**: InspectorType.
  
### GetFileStream function
Get the file stream.

  
**Returns**: A shared ptr to the file stream.
