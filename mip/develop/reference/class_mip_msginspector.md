---
title: class mip::MsgInspector 
description: Documents the mip::msginspector class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 07/16/2019
---

# class mip::MsgInspector 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::vector\<uint8_t\>& GetBody()  |  Get the body of the msg. if TXT/HTML formatted as utf8.
public BodyType GetBodyType() const  |  Get body type.
public const std::vector\<std::unique_ptr\<MsgAttachmentData\>\>& GetAttachments() const  |  Get a list of attachment as msg attachment data objects.
public InspectorType GetInspectorType() const  |  Get file types,.
public std::shared_ptr\<Stream\> GetFileStream() const  |  Get the file stream.
  
## Members
  
### GetBody function
Get the body of the msg. if TXT/HTML formatted as utf8.

  
**Returns**: A vector of bytes.
  
### GetBodyType function
Get body type.

  
**Returns**: The message's body type.
  
### GetAttachments function
Get a list of attachment as msg attachment data objects.

  
**Returns**: A vector of std::unique_ptr<MsgAttachmentData>
  
### GetInspectorType function
Get file types,.

  
**Returns**: InspectorType.
  
### GetFileStream function
Get the file stream.

  
**Returns**: A shared ptr to the file stream.