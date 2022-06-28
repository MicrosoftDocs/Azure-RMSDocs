---
title: class TelemetryDelegate 
description: Documents the telemetrydelegate::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 05/31/2022
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
* **event**: Event to be logged


  
### WriteEvent function
Log a diagnostic event.

Parameters:  
* **event**: Event to be logged 


* **eventContext**: EventContext associated with event.


  
### Flush function
Flush any queued events (e.g. due to shutdown).
