---
title: class ComputeEngine::Settings 
description: Documents the computeengine::settings class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 09/21/2020
---

# class ComputeEngine::Settings 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Settings(const Identity& identity, const ApplicationInfo& applicationInfo, const std::shared_ptr\<TelemetryDelegate\>& telemetryDelegate, LogLevel thresholdLogLevel, const std::shared_ptr\<LoggerDelegate\>& loggerDelegate, const std::string& hostName, const std::vector\<std::pair\<std::string, std::string\>\>& customProperties, const std::vector\<LabelFilterType\>& deprecatedFilters, const std::map\<LabelFilterType, bool\>& configuredFunctionality)  | _Not yet documented._
public const Identity& GetIdentity() const  | _Not yet documented._
public void SetIdentity(const Identity& identity)  | _Not yet documented._
public const ApplicationInfo& GetApplicationInfo() const  | _Not yet documented._
public std::shared_ptr\<TelemetryDelegate\> GetTelemetryDelegate() const  | _Not yet documented._
public std::shared_ptr\<LoggerDelegate\> GetLoggerDelegate() const  | _Not yet documented._
public const std::string& GetHostName() const  | _Not yet documented._
public const std::vector\<std::pair\<std::string, std::string\>\>& GetCustomProperties() const  | _Not yet documented._
public void SetParentCorrelationId(const std::string correlationId, const std::string description)  | _Not yet documented._
public const std::string& GetParentCorrelationId() const  | _Not yet documented._
public const std::string& GetParentCorrelationIdDescription() const  | _Not yet documented._
public const std::vector\<LabelFilterType\>& GetDeprecatedLabelFilter() const  | _Not yet documented._
public const std::map\<LabelFilterType, bool\>& GetConfiguredFunctionality() const  | _Not yet documented._
public void SetVariableTextMarkingType(VariableTextMarkingType variableTextMarkingType)  | _Not yet documented._
public VariableTextMarkingType GetVariableTextMarkingType() const  | _Not yet documented._
public LogLevel GetThresholdLogLevel() const  | _Not yet documented._
public void SetClassifierEnabled(Classifier classifierType, bool enabled)  | _Not yet documented._
public const std::map\<Classifier, bool\>& GetSupportedClassifiers() const  | _Not yet documented._
  
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

  
### SetClassifierEnabled function
_Not documented yet._

  
### GetSupportedClassifiers function
_Not documented yet._
