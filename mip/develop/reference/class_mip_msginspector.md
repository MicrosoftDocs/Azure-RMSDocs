---
title: class mip::MsgInspector 
description: Documents the mip::msginspector class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 10/29/2019
---

# class mip::MsgInspector 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::vector\<uint8_t\>& GetBody()  |  Get the body of the msg. if TXT/HTML formatted as utf8.
public BodyType GetBodyType() const  |  Get body type.
public const std::vector\<std::unique_ptr\<MsgAttachmentData\>\>& GetAttachments() const  |  Get a list of attachment as msg attachment data objects.
  
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