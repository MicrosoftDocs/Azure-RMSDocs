---
title: struct TelemetryConfiguration 
description: Documents structures associated with the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 09/21/2020
---

# struct TelemetryConfiguration 
Custom telemetry settings (not commonly used)
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::string hostNameOverride  |  Host telemetry instance name. If not set, MIP will act as its own host.
public std::string libraryNameOverride  |  Alternate telemetry library (DLL) filename.
public std::shared_ptr\<HttpDelegate\> httpDelegateOverride  |  If set, HTTP handling will be managed by this instance
public std::shared_ptr\<TaskDispatcherDelegate\> taskDispatcherDelegateOverride  |  If set, async task handling will be managed by this instance, taskDispatcherDelegateOverides should not be shared as they can hold telemetry objects, and prevent their release until taskDispatcher is freed.
public bool isNetworkDetectionEnabled  |  If set, telemetry component will ping network status on background thread
public bool isLocalCachingEnabled  |  If set, telemetry component will use on-disk caching
public bool isTraceLoggingEnabled  |  If set, telemetry component will write warning/error logs to disk
public bool isTelemetryOptedOut  |  If set, only necessary service data telemetry will be sent
public bool isFastShutdownEnabled  |  If set, No events will be uploaded on shutdown, Audit events will be uploaded immediately upon logging
public std::map\<std::string, std::string\> customSettings  |  Custom telemetry settings >
public std::map\<std::string, std::vector\<std::string\>\> maskedProperties  |  Telemetry events/properties which should be masked
  
## Members
  
### hostNameOverride struct member
Host telemetry instance name. If not set, MIP will act as its own host.
  
### libraryNameOverride struct member
Alternate telemetry library (DLL) filename.
  
### HttpDelegate
If set, HTTP handling will be managed by this instance
  
### TaskDispatcherDelegate
If set, async task handling will be managed by this instance, taskDispatcherDelegateOverides should not be shared as they can hold telemetry objects, and prevent their release until taskDispatcher is freed.
  
### isNetworkDetectionEnabled struct member
If set, telemetry component will ping network status on background thread
  
### isLocalCachingEnabled struct member
If set, telemetry component will use on-disk caching
  
### isTraceLoggingEnabled struct member
If set, telemetry component will write warning/error logs to disk
  
### isTelemetryOptedOut struct member
If set, only necessary service data telemetry will be sent
  
### isFastShutdownEnabled struct member
If set, No events will be uploaded on shutdown, Audit events will be uploaded immediately upon logging
  
### customSettings struct member
Custom telemetry settings >
  
### maskedProperties struct member
Telemetry events/properties which should be masked