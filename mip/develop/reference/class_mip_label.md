---
title: class Label 
description: Documents the label::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/14/2022
---

# class Label 
Abstraction for a single Microsoft Purview Information Protection label.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::string& GetId() const  |  Get the label ID.
public const std::string& GetName() const  |  Get the label name.
public const std::string& GetDescription() const  |  Get the label description.
public const std::string& GetColor() const  |  Get the color the label should be displayed.
public int GetSensitivity() const  |  Get the Sensitivity of the label.
public const std::string& GetTooltip() const  |  Get the tooltip description of the label.
public const std::string& GetAutoTooltip() const  |  Get the tooltip description of the classification that cause this label to be applied.
public bool IsActive() const  |  Gets a boolean signaling if the label is active.
public std::weak_ptr&lt;Label&gt; GetParent() const  |  Get the parent label.
public const std::vector&lt;std::shared_ptr&lt;Label&gt;&gt;& GetChildren() const  |  Get the children labels of the current label.
public const std::vector&lt;std::pair&lt;std::string, std::string&gt;&gt;& GetCustomSettings() const  |  Get the custom settings of a label.
public ActionSource GetActionSource() const  |  Gets the action source of the label.
public const std::vector&lt;std::string&gt;& GetContentFormats() const  |  Gets content types.
  
## Members
  
### GetId function
Get the label ID.

  
**Returns**: The label ID.
  
### GetName function
Get the label name.

  
**Returns**: The label name.
  
### GetDescription function
Get the label description.

  
**Returns**: The label description.
  
### GetColor function
Get the color the label should be displayed.

  
**Returns**: Color value the string format. "#RRGGBB" where each of RR, GG, BB is a hexadecimal 0-f.
  
### GetSensitivity function
Get the Sensitivity of the label.

  
**Returns**: A numerical value. Higher value defines higher Sensitivity.
  
### GetTooltip function
Get the tooltip description of the label.

  
**Returns**: A tooltip string.
  
### GetAutoTooltip function
Get the tooltip description of the classification that cause this label to be applied.

  
**Returns**: A tooltip string.
  
### IsActive function
Gets a boolean signaling if the label is active.
Only active labels can be applied. Inactive labels cannot be applied, and are used for display purposes only. 

  
**Returns**: True if label is active, else false.
  
### GetParent function
Get the parent label.

  
**Returns**: A weak pointer to the parent label if exists else an empty pointer.
  
### GetChildren function
Get the children labels of the current label.

  
**Returns**: A vector of shared pointers to labels.
  
### GetCustomSettings function
Get the custom settings of a label.

  
**Returns**: A vector of key value pairs representing custom settings.
  
### GetActionSource function
Gets the action source of the label.

  
**Returns**: Action source
  
### GetContentFormats function
Gets content types.

  

&lt;Returns&gt;

