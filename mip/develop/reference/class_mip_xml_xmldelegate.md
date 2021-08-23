---
title: class xml::XmlDelegate 
description: Documents the xml::xmldelegate class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 08/23/2021
---

# class xml::XmlDelegate 
Interface for overriding XML handling (must be capable of handling multiple threads)
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public XmlReaderResult CreateXmlReader(const std::string& xmlParserInput) const  |  Create an xml reader that can transverse the input.
public XmlDocumentResult ParseData(const std::string& data) const  |  Parse an xml formatted buffer into an XmlDocument.
  
## Members
  
### CreateXmlReader function
Create an xml reader that can transverse the input.

Parameters:  
* **xmlParserInput**: Input containing either xml in string format or a uri to xml



  
**Returns**: A delegate response that contains either a shared pointer to a reader that can look at each node of the xml sequentially, or an exception
  
### ParseData function
Parse an xml formatted buffer into an XmlDocument.

Parameters:  
* **data**: A string that should be in xml format



  
**Returns**: A delegate response that contains either a shared_ptr to an XmlDocument or an exception if parsing fails