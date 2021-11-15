---
title: class TelemetryDelegate 
description: Documents the telemetrydelegate::undefined class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 11/15/2021
---

# class TelemetryDelegate 
A class that defines the interface to the MIP SDK telemetry notifications.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public void WriteEvent(const std::shared_ptr\<TelemetryEvent\>& event)  |  Log a diagnostic event.
public void Flush()  |  Flush any queued events (e.g. due to shutdown)
  
## Members
  
### WriteEvent function
Log a diagnostic event.

Parameters:  
* **event**: [Event](undefined) to be logged


  
### Flush function
Flush any queued events (e.g. due to shutdown)