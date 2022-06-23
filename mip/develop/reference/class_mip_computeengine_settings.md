---
title: class ComputeEngine::Settings 
description: Documents the computeengine::settings class of the Microsoft Information Protection SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 05/31/2022
---

# class ComputeEngine::Settings 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Settings(const Identity& identity, const ApplicationInfo& applicationInfo, const std::shared_ptr&lt;TelemetryDelegate&gt;& telemetryDelegate, const std::shared_ptr&lt;AuditDelegate&gt;& auditDelegate, const std::shared_ptr&lt;DiagnosticEventFactory&gt;& eventFactory, LogLevel thresholdLogLevel, const std::shared_ptr&lt;LoggerDelegate&gt;& loggerDelegate, const std::string& hostName, const std::vector&lt;std::pair&lt;std::string, std::string&gt;&gt;& customProperties, const std::vector&lt;LabelFilterType&gt;& deprecatedFilters, const std::map&lt;FunctionalityFilterType, bool&gt;& configuredFunctionality)  | _Not yet documented._
public const Identity& GetIdentity() const  | _Not yet documented._
public void SetIdentity(const Identity& identity)  | _Not yet documented._
public const ApplicationInfo& GetApplicationInfo() const  | _Not yet documented._
public std::shared_ptr&lt;TelemetryDelegate&gt; GetTelemetryDelegate() const  | _Not yet documented._
public std::shared_ptr&lt;AuditDelegate&gt; GetAuditDelegate() const  | _Not yet documented._
public std::shared_ptr&lt;DiagnosticEventFactory&gt; GetEventFactory() const  | _Not yet documented._
public std::shared_ptr&lt;LoggerDelegate&gt; GetLoggerDelegate() const  | _Not yet documented._
public const std::string& GetHostName() const  | _Not yet documented._
public const std::vector&lt;std::pair&lt;std::string, std::string&gt;&gt;& GetCustomProperties() const  | _Not yet documented._
public void SetParentCorrelationId(const std::string correlationId, const std::string description)  | _Not yet documented._
public const std::string& GetParentCorrelationId() const  | _Not yet documented._
public const std::string& GetParentCorrelationIdDescription() const  | _Not yet documented._
public const std::vector&lt;LabelFilterType&gt;& GetDeprecatedLabelFilter() const  | _Not yet documented._
public const std::map&lt;FunctionalityFilterType, bool&gt;& GetConfiguredFunctionality() const  | _Not yet documented._
public void SetVariableTextMarkingType(VariableTextMarkingType variableTextMarkingType)  | _Not yet documented._
public VariableTextMarkingType GetVariableTextMarkingType() const  | _Not yet documented._
public LogLevel GetThresholdLogLevel() const  | _Not yet documented._
public const std::shared_ptr&lt;void&gt;& GetLoggerContext() const  |  Get logger context that will be opaquely passed to the logger delegate for logs associated with the created engine.
public void SetLoggerContext(const std::shared_ptr&lt;void&gt;& loggerContext)  |  Sets the logger context that will be opaquely passed to the logger delegate for logs associated with the created engine.
  
## Members
  
### Settings function
_Not documented yet._

  
### GetIdentity function
_Not documented yet._

  
### SetIdentity function
_Not documented yet._

  
### GetApplicationInfo function
_Not documented yet._

  
### GetTelemetryDelegate function
_Not documented yet._

  
### GetAuditDelegate function
_Not documented yet._

  
### GetEventFactory function
_Not documented yet._

  
### GetLoggerDelegate function
_Not documented yet._

  
### GetHostName function
_Not documented yet._

  
### GetCustomProperties function
_Not documented yet._

  
### SetParentCorrelationId function
_Not documented yet._

  
### GetParentCorrelationId function
_Not documented yet._

  
### GetParentCorrelationIdDescription function
_Not documented yet._

  
### GetDeprecatedLabelFilter function
_Not documented yet._

  
### GetConfiguredFunctionality function
_Not documented yet._

  
### SetVariableTextMarkingType function
_Not documented yet._

  
### GetVariableTextMarkingType function
_Not documented yet._

  
### GetThresholdLogLevel function
_Not documented yet._

  
### GetLoggerContext function
Get logger context that will be opaquely passed to the logger delegate for logs associated with the created engine.

  
**Returns**: The logger context
  
### SetLoggerContext function
Sets the logger context that will be opaquely passed to the logger delegate for logs associated with the created engine.

Parameters:  
* **loggerContext**: The logger context.
