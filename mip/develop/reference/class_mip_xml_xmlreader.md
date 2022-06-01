---
title: class xml::XmlReader 
description: Documents the xml::xmlreader class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 05/31/2022
---

# class xml::XmlReader 
XmlReader abstraction class.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public bool Read()  |  Reads the next node of the element.
public XmlNodeType GetNodeType() const  |  Get current node type.
public std::string GetName() const  |  Returns the name if found, exception otherwise. empty name is possible.
public bool GetName(std::string& name) const  |  Returns if name was found. Sets name only when true. empty name is possible.
public bool Skip()  |  Skips current node until it finds a non empty node.
public bool GetValue(std::string& value) const  |  Returns if value was found. Sets value only when true. empty value is possible..
public std::string GetAncestors() const  |  Returns current node ancestors (for debug text), in the following purpose &lt;node grand parent attributes=...&gt;&gt;&lt;node parent&gt;&lt;node&gt;.
public bool IsEmptyElement() const  |  Returns whether the current node as an empty element.
public bool GetAttribute(const std::string& attributeName, std::string& attribute) const  |  Returns true if attributes was found. Sets attribute only when true. empty attribute is possible..
public bool HasAttributes() const  |  Returns whether the current node has attributes.
public bool MoveToFirstAttribute()  |  Move to first attribute.
public bool MoveToNextAttribute()  |  Move to Next attribute.
public bool MoveToElement()  |  Move from attribute to element.
public std::string DumpNode()  |  Method returns all node elements in an unmodified way from the original xml.
  
## Members
  
### Read function
Reads the next node of the element.
throws [XmlParserException](#classxml_1_1XmlParserException) on failure

  
**Returns**: True if read node successfully.
  
### GetNodeType function
Get current node type.

  
**Returns**: Xml Reader Node type.
  
### GetName function
Returns the name if found, exception otherwise. empty name is possible.
throws XmlParserException on failure

  
**Returns**: Node name.
  
### GetName function
Returns if name was found. Sets name only when true. empty name is possible.

  
**Returns**: Node name.
  
### Skip function
Skips current node until it finds a non empty node.
throws XmlParserException on failure

  
**Returns**: True if name successful.
  
### GetValue function
Returns if value was found. Sets value only when true. empty value is possible..

Parameters:  
* **value**: output value



  
**Returns**: True if value exists else false.
  
### GetAncestors function
Returns current node ancestors (for debug text), in the following purpose &lt;node grand parent attributes=...&gt;&gt;&lt;node parent&gt;&lt;node&gt;.
used for debugging purposes, and error logging.
  
### IsEmptyElement function
Returns whether the current node as an empty element.
throws XmlParserException on failure

  
**Returns**: True if element is empty.
  
### GetAttribute function
Returns true if attributes was found. Sets attribute only when true. empty attribute is possible..

Parameters:  
* **attributeName**: attribute name. 


* **attribute**: attribute value. 



  
**Returns**: True if successful
  
### HasAttributes function
Returns whether the current node has attributes.
throws XmlParserException on failure

  
**Returns**: True if the current node has attributes.
  
### MoveToFirstAttribute function
Move to first attribute.
throws XmlParserException on failure

  
**Returns**: True if successful
  
### MoveToNextAttribute function
Move to Next attribute.
throws XmlParserException on failure

  
**Returns**: True if successful
  
### MoveToElement function
Move from attribute to element.
throws XmlParserException on failure

  
**Returns**: True if successful
  
### DumpNode function
Method returns all node elements in an unmodified way from the original xml.
throws XmlParserException on failure

  
**Returns**: Entire serialized element.
moved to end of node.e.