---
title: class xml::XmlNode 
description: Documents the xml::xmlnode class of the Microsoft Information Protection SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 05/31/2022
---

# class xml::XmlNode 
brief defines abstraction over XML node. XmlNodes will be treated as memory managed by XmlDocument except for RemoveNodeFromDocument() which should handle its own memory clean up
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::string GetAttributeValue(const std::string& attributeName) const  | _Not yet documented._
public std::vector&lt;std::pair&lt;std::string, std::string&gt;&gt; GetAttributes() const  | _Not yet documented._
public std::shared_ptr&lt;XmlNode&gt; GetNextNode() const  | _Not yet documented._
public std::shared_ptr&lt;XmlNode&gt; GetFirstChild() const  | _Not yet documented._
public std::string GetName() const  | _Not yet documented._
public std::string GetContent() const  | _Not yet documented._
public std::string GetInnerText() const  | _Not yet documented._
public XmlNamespace GetNamespace() const  | _Not yet documented._
public XmlNodeType GetNodeType() const  |  Get the type of node this xml is represented as.
public bool IsNull() const  |  See if the object has been initialized with an underlying xml node.
public void AddAttribute(const std::string& attributeName, const std::string& attributeValue)  |  Add a property to an existing node.
public int RemoveAttribute(const std::string& attributeName)  |  Removes a node property by name.
public std::shared_ptr&lt;XmlNode&gt; AddNewChild(const std::string& name)  |  Add a child to this XmlNode. New child is inserted after any existing children.
public std::shared_ptr&lt;XmlNode&gt; AddNewChild(const std::string& name, const std::string& namespaceName)  |  Add a child to this XmlNode. New child is inserted after any existing children.
public bool AddContent(const std::string& content)  |  Add inner text to this xml node.
public bool RemoveNodeFromDocument()  |  Remove this node and children from the xml document.
  
## Members
  
### GetAttributeValue function
_Not documented yet._

  
### GetAttributes function
_Not documented yet._

  
### GetNextNode function
_Not documented yet._

  
### GetFirstChild function
_Not documented yet._

  
### GetName function
_Not documented yet._

  
### GetContent function
_Not documented yet._

  
### GetInnerText function
_Not documented yet._

  
### GetNamespace function
_Not documented yet._

  
### GetNodeType function
Get the type of node this xml is represented as.

  
**Returns**: A member of the enum describing the node type
  
### IsNull function
See if the object has been initialized with an underlying xml node.

  
**Returns**: True if underlying node. False if not.
  
### AddAttribute function
Add a property to an existing node.

Parameters:  
* **attributeName**: Name of the attribute to add 


* **attributeValue**: Value of the attribute to add


  
### RemoveAttribute function
Removes a node property by name.

Parameters:  
* **attributeName**: The property name to remove



  
**Returns**: 0 if the property was found and successfully removed and -1 otherwise
  
### AddNewChild function
Add a child to this XmlNode. New child is inserted after any existing children.

Parameters:  
* **name**: The name of the new node



  
**Returns**: A pointer to the node that was added or a nullptr if the operation failed.
  
### AddNewChild function
Add a child to this XmlNode. New child is inserted after any existing children.

Parameters:  
* **name**: The name of the new node 


* **namespaceName**: The namespace prefix to insert the new node under



  
**Returns**: A pointer to the node that was added or a nullptr if the operation failed.
  
### AddContent function
Add inner text to this xml node.

Parameters:  
* **content**: The string to add as inner text



  
**Returns**: True if content was added or false if the operation failed.
  
### RemoveNodeFromDocument function
Remove this node and children from the xml document.

  
**Returns**: True if node was successfully deleted or false if failed.
