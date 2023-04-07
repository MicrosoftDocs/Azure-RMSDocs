---
title: class PolicyProfile::Settings 
description: Documents the policyprofile::settings class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class PolicyProfile::Settings 
Settings used by [PolicyProfile](class_mip_policyprofile.md) during its creation and throughout its lifetime.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Settings(const std::shared_ptr&lt;MipContext&gt;& mipContext, CacheStorageType cacheStorageType, const std::shared_ptr&lt;PolicyProfile::Observer&gt;& observer)  |  Interface for configuring the profile.
public CacheStorageType GetCacheStorageType() const  |  Get whether caches are stored in memory or on disk.
public const std::shared_ptr&lt;PolicyProfile::Observer&gt;& GetObserver() const  |  Get the event observer.
public std::shared_ptr&lt;MipContext&gt; GetMipContext() const  |  Get MIP context which represents shared state across all profiles.
public std::shared_ptr&lt;HttpDelegate&gt; GetHttpDelegate() const  |  Get the HTTP delegate (if any) provided by the application.
public void SetHttpDelegate(const std::shared_ptr&lt;HttpDelegate&gt;& httpDelegate)  |  Override default HTTP stack with client's own.
public std::shared_ptr&lt;StorageDelegate&gt; GetStorageDelegate() const  |  Get the [StorageDelegate](class_mip_storagedelegate.md) (if any) provided by the application.
public void SetStorageDelegate(const std::shared_ptr&lt;StorageDelegate&gt;& storageDelegate)  |  Override default storage cache with client's own implementation.
public std::shared_ptr&lt;TaskDispatcherDelegate&gt; GetTaskDispatcherDelegate() const  |  Get the TaskDispatcher delegate (if any) provided by the application.
public void SetTaskDispatcherDelegate(const std::shared_ptr&lt;TaskDispatcherDelegate&gt;& taskDispatcherDelegate)  |  Override default asynchronous task dispatching handling with client's own.
public void SetSessionId(const std::string& sessionId)  | _Not yet documented._
public const std::string& GetSessionId() const  | _Not yet documented._
public void SetCustomSettings(const std::vector&lt;std::pair&lt;std::string, std::string&gt;&gt;& customSettings)  |  Set the custom settings, used for feature gating and testing.
public const std::vector&lt;std::pair&lt;std::string, std::string&gt;&gt;& GetCustomSettings() const  |  Get the custom settings, used for feature gating and testing.
public const std::shared_ptr&lt;void&gt;& GetLoggerContext() const  |  Get logger context that will be opaquely passed to the logger delegate for logs associated with the created profile.
public void SetLoggerContext(const std::shared_ptr&lt;void&gt;& loggerContext)  |  Sets the logger context that will be opaquely passed to the logger delegate for logs associated with the created profile.
public ~Settings()  | _Not yet documented._
  
## Members
  
### Settings function
Interface for configuring the profile.

Parameters:  
* **mipContext**: Global context settings 


* **cacheStorageType**: Store any cached state in memory or on disk 


* **observer**: A class implementing the [PolicyProfile::Observer](class_mip_policyprofile_observer.md) interface. Can be nullptr.


  
### GetCacheStorageType function
Get whether caches are stored in memory or on disk.

  
**Returns**: Storage type used
  
### GetObserver function
Get the event observer.

  
**Returns**: The event observer.
  
### GetMipContext function
Get MIP context which represents shared state across all profiles.

  
**Returns**: MIP context
  
### GetHttpDelegate function
Get the HTTP delegate (if any) provided by the application.

  
**Returns**: Http delegate to be used for HTTP operations
  
### SetHttpDelegate function
Override default HTTP stack with client's own.

Parameters:  
* **httpDelegate**: Http callback interface implemented by client application


  
### GetStorageDelegate function
Get the [StorageDelegate](class_mip_storagedelegate.md) (if any) provided by the application.

  
**Returns**: [StorageDelegate](class_mip_storagedelegate.md) to be used for cache operations
  
### SetStorageDelegate function
Override default storage cache with client's own implementation.

Parameters:  
* **storageDelegate**: [StorageDelegate](class_mip_storagedelegate.md) implemented by client application


  
### GetTaskDispatcherDelegate function
Get the TaskDispatcher delegate (if any) provided by the application.

  
**Returns**: TaskDispatcher delegate to be used for executing asynchronous tasks
  
### SetTaskDispatcherDelegate function
Override default asynchronous task dispatching handling with client's own.

Parameters:  
* **taskDispatcherDelegate**: Task dispatching callback interface implemented by client application


tasks can reference profile objects preventing its destruction as a result taskdispatcher queues should not be shared.
  
### SetSessionId function
_Not documented yet._

  
### GetSessionId function
_Not documented yet._

  
### SetCustomSettings function
Set the custom settings, used for feature gating and testing.

Parameters:  
* **customSettings**: List of name/value pairs.


  
### GetCustomSettings function
Get the custom settings, used for feature gating and testing.

  
**Returns**: List of name/value pairs.
  
### GetLoggerContext function
Get logger context that will be opaquely passed to the logger delegate for logs associated with the created profile.

  
**Returns**: The logger context
  
### SetLoggerContext function
Sets the logger context that will be opaquely passed to the logger delegate for logs associated with the created profile.

Parameters:  
* **loggerContext**: The logger context


  
### ~Settings function
_Not documented yet._
ocumented yet._
