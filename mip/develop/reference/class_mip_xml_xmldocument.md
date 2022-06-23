---
title: class xml::XmlDocument 
description: Documents the xml::xmldocument class of the Microsoft Information Protection SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 05/31/2022
---

# class xml::XmlDocument 
Interface to interact with XML document.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::vector&lt;std::shared_ptr&lt;XmlNode&gt;&gt; SelectNodes(const std::string& xpath, const std::shared_ptr&lt;XmlNode&gt;& node) const  |  Get matching xml nodes from a specified xpath. Will throw exception of type mip::BadInputError if xml nodes cannot be parsed, there is an invalid encoding, or the xpath cannot be interpreted.
public std::string GetXmlContent() const  |  Parse an xml formatted buffer into an xmldocument.
public std::shared_ptr&lt;XmlNode&gt; GetRootNode() const  |  Get the node that is an ancestor of all other nodes.
  
## Members
  
### SelectNodes function
Get matching xml nodes from a specified xpath. Will throw exception of type mip::BadInputError if xml nodes cannot be parsed, there is an invalid encoding, or the xpath cannot be interpreted.

Parameters:  
* **xpath**: The path to search the xml document for the node 


* **node**: Specify children of a specific node



  
**Returns**: A vector of matching XmlNode shared pointers or an empty vector if none match
  
### GetXmlContent function
Parse an xml formatted buffer into an xmldocument.

  
**Returns**: A utf-8 xml formatted string of the content of this XmlDocument
  
### GetRootNode function
Get the node that is an ancestor of all other nodes.

  
**Returns**: A shared_ptr to an XmlNode.
