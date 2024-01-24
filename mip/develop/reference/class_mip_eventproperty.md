---
title: class EventProperty 
description: Documents the eventproperty::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/07/2023
---

# class EventProperty 
A single audit/telemetry property.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public EventPropertyType GetPropertyType() const  |  Get the underlying data type for this property.
public const std::string& GetName() const  |  Get name of property.
public Pii GetPii() const  |  Get personally-identifiable information (PII) classification, if any.
public bool IsAuditOnly() const  |  Get whether or not this property is restricted to the audit pipeline.
public double GetDouble() const  |  Get property value (double)
public int64_t GetInt64() const  |  Get property value (int64)
public const std::string& GetString() const  |  Get property value (string)
  
## Members
  
### GetPropertyType function
Get the underlying data type for this property.

  
**Returns**: Underlying data type
  
### GetName function
Get name of property.

  
**Returns**: Name of property
  
### GetPii function
Get personally-identifiable information (PII) classification, if any.

  
**Returns**: PII classification
  
### IsAuditOnly function
Get whether or not this property is restricted to the audit pipeline.

  
**Returns**: Whether or not this properties is restricted to the audit pipeline
If this is true, the property contains sensitive information and must not be written to file logs or to any pipeline except for audit until it is manually scrubbed.
  
### GetDouble function
Get property value (double)

  
**Returns**: Property value
  
### GetInt64 function
Get property value (int64)

  
**Returns**: Property value
  
### GetString function
Get property value (string)

  
**Returns**: Property value