---
title: class xml::XmlDocument 
description: Documents the xml::xmldocument class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 11/15/2021
---

# class xml::XmlDocument 
Interface to interact with XML document.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::vector\<std::shared_ptr\<XmlNode\>\> SelectNodes(const std::string& xpath, const std::shared_ptr\<XmlNode\>& node) const  |  Get matching xml nodes from a specified xpath.
public std::string GetXmlContent() const  |  Parse an xml formatted buffer into an xmldocument.
public std::shared_ptr\<XmlNode\> GetRootNode() const  |  Get the node that is an ancestor of all other nodes.
  
## Members
  
### SelectNodes function
Get matching xml nodes from a specified xpath.

Parameters:  
* **xpath**: The path to search the xml document for the node 


* **node**: Specify children of a specific node



  
**Returns**: A vector of matching [XmlNode](undefined) shared pointers or an empty vector if none match
  
### GetXmlContent function
Parse an xml formatted buffer into an xmldocument.

  
**Returns**: A utf-8 xml formatted string of the content of this [XmlDocument](undefined)
  
### GetRootNode function
Get the node that is an ancestor of all other nodes.

  
**Returns**: A shared_ptr to an [XmlNode](undefined)