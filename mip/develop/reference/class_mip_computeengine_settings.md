---
title: class ComputeEngine::Settings 
description: Documents the computeengine::settings class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
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
Not yet documented.

  
### GetIdentity function
Not yet documented.

  
### SetIdentity function
Not yet documented.

  
### GetApplicationInfo function
Not yet documented.

  
### GetTelemetryDelegate function
Not yet documented.

  
### GetLoggerDelegate function
Not yet documented.

  
### GetHostName function
Not yet documented.

  
### GetCustomProperties function
Not yet documented.

  
### SetParentCorrelationId function
Not yet documented.

  
### GetParentCorrelationId function
Not yet documented.

  
### GetParentCorrelationIdDescription function
Not yet documented.

  
### GetDeprecatedLabelFilter function
Not yet documented.

  
### GetConfiguredFunctionality function
Not yet documented.

  
### SetVariableTextMarkingType function
Not yet documented.

  
### GetVariableTextMarkingType function
Not yet documented.

  
### GetThresholdLogLevel function
Not yet documented.

  
### SetClassifierEnabled function
Not yet documented.

  
### GetSupportedClassifiers function
Not yet documented.
