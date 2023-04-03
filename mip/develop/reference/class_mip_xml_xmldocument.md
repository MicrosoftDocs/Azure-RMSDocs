---
title: class xml::XmlDocument 
description: Documents the xml::xmldocument class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class xml::XmlDocument 
Interface to interact with XML document.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::vector\<std::shared_ptr\<XmlNode\>\> SelectNodes(const std::string& xpath, const std::shared_ptr\<XmlNode\>& node) const  |  Get matching xml nodes from a specified xpath. Will throw exception of type mip::BadInputError if xml nodes cannot be parsed, there is an invalid encoding, or the xpath cannot be interpreted.
public std::string GetXmlContent() const  |  Parse an xml formatted buffer into an xmldocument.
public std::shared_ptr\<XmlNode\> GetRootNode() const  |  Get the node that is an ancestor of all other nodes.
  
## Members
  
### SelectNodes function
Get matching xml nodes from a specified xpath. Will throw exception of type mip::BadInputError if xml nodes cannot be parsed, there is an invalid encoding, or the xpath cannot be interpreted.

Parameters:  
* **xpath**: The path to search the xml document for the node 


* **node**: Specify children of a specific node



  
**Returns**: A vector of matching [XmlNode](#classxml_1_1_xml_node) shared pointers or an empty vector if none match
  
### GetXmlContent function
Parse an xml formatted buffer into an xmldocument.

  
**Returns**: A utf-8 xml formatted string of the content of this [XmlDocument](undefined)
  
### GetRootNode function
Get the node that is an ancestor of all other nodes.

  
**Returns**: A shared_ptr to an [XmlNode](undefined)