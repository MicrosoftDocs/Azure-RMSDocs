---
title: class TelemetryDelegate 
description: Documents the telemetrydelegate::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class TelemetryDelegate 
A class that defines the interface to the MIP SDK telemetry notifications.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public void WriteEvent(const std::shared_ptr&lt;TelemetryEvent&gt;& event)  |  Log a diagnostic event.
public void WriteEvent(const std::shared_ptr&lt;TelemetryEvent&gt;& event, const mip::EventContext& eventContext)  |  Log a diagnostic event.
public void Flush()  |  Flush any queued events (e.g. due to shutdown)
  
## Members
  
### WriteEvent function
Log a diagnostic event.

Parameters:  
* **event**: [Event](#class_event) to be logged


  
### WriteEvent function
Log a diagnostic event.

Parameters:  
* **event**: [Event](class_mip_event.md) to be logged 


* **eventContext**: [EventContext](#class_event_context) associated with event


  
### Flush function
Flush any queued events (e.g. due to shutdown)n)