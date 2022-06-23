---
title: class JsonValue 
description: Documents the jsonvalue::undefined class of the Microsoft Information Protection SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 05/31/2022
---

# class JsonValue 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public bool IsString() const  |  check if value is a string.
public bool IsArray() const  |  check if value is a json array.
public bool IsObject() const  |  check if value is a json object.
public bool HasMember(const std::string& key) const  |  return true if object has a child with the specified key.
public void PushBack(const std::shared_ptr&lt;JsonValue&gt;& jsonValue)  |  Add a value member to an Array. The object should not be modified after being added.
public void PushBack(const std::string& member)  |  Add a string member to an Array with the specified value.
public void AddMember(const std::string& key, const std::shared_ptr&lt;JsonValue&gt;& jsonValue)  |  Add a value member to an Object. The object should not be modified after being added.
public void AddMember(const std::string& key, const std::string& member)  | _Not yet documented._
public void AddMember(const std::string& key, bool member)  |  Add a boolean member to an Object with the specified key and value.
public void AddMember(const std::string& key, int member)  |  Add a signed integer member to an Object with the specified key and value.
public void AddMember(const std::string& key, unsigned int member)  |  Add an unsigned integer member to an Object with the specified key and value.
public std::shared_ptr&lt;JsonValue&gt; GetMember(const std::string& key) const  |  return child value with the specified key if this is an Object.
public std::shared_ptr&lt;JsonValue&gt; GetMember(unsigned int index) const  |  return child value at specified index if this is an Array.
public size_t Size() const  |  return number of child elements.
public std::vector&lt;std::string&gt; GetStringArray() const  |  return value array as strings, skip non string elements.
public std::vector&lt;std::pair&lt;std::string, std::string&gt;&gt; GetStringObjectMembers() const  |  Return all string members of this object and their keys, skip non string elements. Example: for the json object {"a": "b", "c": "d", "e": 1, "f": {"g": "h"}} this method would return a vector of two pairs: ("a", "b") and ("c", "d").
public std::string GetString() const  |  If the current value is a string, return it.
public bool IsInt() const  |  Returns true if the current value is an int.
public int GetInt() const  |  If the current value is an int, return it.
public bool IsBool() const  |  Return true if the current value is a bool.
public bool IsUint() const  |  Return true if the current value is an unsigned int.
public unsigned int GetUint() const  |  If the current value is a uint, return it.
public bool IsNumber() const  |  Return true if the current value is a number of any type.
public double GetDouble() const  |  If the current value is a double, return it.
public bool GetBool() const  |  If the current value is a bool, return it.
public std::string SerializeToString() const  |  Serialize the value and all children as a string.
  
## Members
  
### IsString function
check if value is a string.

  
**Returns**: True if json value is string.
  
### IsArray function
check if value is a json array.

  
**Returns**: True if json value is a json array.
  
### IsObject function
check if value is a json object.

  
**Returns**: True if json value is a json object.
  
### HasMember function
return true if object has a child with the specified key.

  
**Returns**: True if object has a child with the specified key.
  
### PushBack function
Add a value member to an Array. The object should not be modified after being added.
  
### PushBack function
Add a string member to an Array with the specified value.

Parameters:  
* **member**: The value of the member to add.


  
### AddMember function
Add a value member to an Object. The object should not be modified after being added.
  
### AddMember function
_Not documented yet._

  
### AddMember function
Add a boolean member to an Object with the specified key and value.

Parameters:  
* **key**: The key of the member to add. 


* **member**: The value of the member to add.


  
### AddMember function
Add a signed integer member to an Object with the specified key and value.

Parameters:  
* **key**: The key of the member to add. 


* **member**: The value of the member to add.


  
### AddMember function
Add an unsigned integer member to an Object with the specified key and value.

Parameters:  
* **key**: The key of the member to add. 


* **member**: The value of the member to add.


  
### GetMember function
return child value with the specified key if this is an Object.

  
**Returns**: Child value with the specified key if this is an Object.
  
### GetMember function
return child value at specified index if this is an Array.

  
**Returns**: Child value at specified index if this is an Array.
  
### Size function
return number of child elements.

  
**Returns**: Number of child elements.
  
### GetStringArray function
return value array as strings, skip non string elements.

  
**Returns**: A vector of the string in a json array.
  
### GetStringObjectMembers function
Return all string members of this object and their keys, skip non string elements. Example: for the json object {"a": "b", "c": "d", "e": 1, "f": {"g": "h"}} this method would return a vector of two pairs: ("a", "b") and ("c", "d").

  
**Returns**: All string members of this object and their keys as a vector of pairs.
  
### GetString function
If the current value is a string, return it.

  
**Returns**: The current value if it is a string.
  
### IsInt function
Returns true if the current value is an int.

  
**Returns**: True if the current value is an int.
  
### GetInt function
If the current value is an int, return it.

  
**Returns**: The current value if it is an int.
  
### IsBool function
Return true if the current value is a bool.

  
**Returns**: True if the current value is a bool.
  
### IsUint function
Return true if the current value is an unsigned int.

  
**Returns**: True if the current value is an unsigned int.
  
### GetUint function
If the current value is a uint, return it.

  
**Returns**: The current value if it is a uint.
  
### IsNumber function
Return true if the current value is a number of any type.

  
**Returns**: True if the current value is a number of any type.
  
### GetDouble function
If the current value is a double, return it.

  
**Returns**: The current value if it is a double.
  
### GetBool function
If the current value is a bool, return it.

  
**Returns**: The current value if it is a bool.
  
### SerializeToString function
Serialize the value and all children as a string.

  
**Returns**: This json value and all children serialized as a string.
