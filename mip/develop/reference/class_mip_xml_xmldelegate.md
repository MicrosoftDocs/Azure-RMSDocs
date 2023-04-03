---
title: class xml::XmlDelegate 
description: Documents the xml::xmldelegate class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class xml::XmlDelegate 
Interface for overriding XML handling (must be capable of handling multiple threads)
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public XmlReaderResult CreateXmlReader(const std::string& xmlParserInput) const  |  Create an xml reader that can transverse the input. This method will throw an [XmlLoadException](#classxml_1_1_xml_load_exception) if it cannot initialize an XML reader, if the input is invalid, or if the input is too large to handle.
public XmlDocumentResult ParseData(const std::string& data) const  |  Parse an xml formatted buffer into an [XmlDocument](class_mip_xml_xmldocument.md).
  
## Members
  
### CreateXmlReader function
Create an xml reader that can transverse the input. This method will throw an [XmlLoadException](class_mip_xml_xmlloadexception.md) if it cannot initialize an XML reader, if the input is invalid, or if the input is too large to handle.

Parameters:  
* **xmlParserInput**: Input containing either xml in string format or a uri to xml



  
**Returns**: A delegate response that contains either a shared pointer to a reader that can look at each node of the xml sequentially, or an [XmlLoadException](class_mip_xml_xmlloadexception.md)
  
### ParseData function
Parse an xml formatted buffer into an [XmlDocument](class_mip_xml_xmldocument.md).

Parameters:  
* **data**: A string that should be in xml format


The [XmlDocument](class_mip_xml_xmldocument.md) returned should memory manage itself. That is, when it goes out of scope, it should take care of any free functions needed to release memory. In our native implementation, this is achieved with a unique_ptr with a specialized deleter function.

  
**Returns**: A delegate response that contains either a shared_ptr to an [XmlDocument](class_mip_xml_xmldocument.md) or an exception if parsing fails