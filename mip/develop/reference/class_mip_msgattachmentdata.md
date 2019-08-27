---
title: class mip::MsgAttachmentData 
description: Documents the mip::msgattachmentdata class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 08/27/2019
---

# class mip::MsgAttachmentData 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::vector\<uint8_t\>& GetBytes()  |  Get attachment as a binary byte vector.
public std::shared_ptr\<Stream\> GetStream() const  |  Get attachment as a binary stream.
public const std::string& GetName() const  |  Get attachment name as a string.
public const std::string& GetLongName() const  |  Get attachment long name as a string.
public const std::string& GetPath() const  |  Get attachment path name as a string. if path not empty then reference attachment.
public const std::string& GetLongPath() const  |  Get attachment long path name as a string. if path not empty then reference attachment.
  
## Members
  
### GetBytes function
Get attachment as a binary byte vector.
  
### GetStream function
Get attachment as a binary stream.
  
### GetName function
Get attachment name as a string.
  
### GetLongName function
Get attachment long name as a string.
  
### GetPath function
Get attachment path name as a string. if path not empty then reference attachment.
  
### GetLongPath function
Get attachment long path name as a string. if path not empty then reference attachment.