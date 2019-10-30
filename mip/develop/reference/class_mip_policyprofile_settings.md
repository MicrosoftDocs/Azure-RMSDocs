---
title: class mip::PolicyProfile::Settings 
description: Documents the mip::policyprofile class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 10/29/2019
---

# class mip::PolicyProfile::Settings 
Settings used by PolicyProfile during its creation and throughout its lifetime.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Settings(const std::shared_ptr\<MipContext\>& mipContext, CacheStorageType cacheStorageType, const std::shared_ptr\<AuthDelegate\>& authDelegate, const std::shared_ptr\<PolicyProfile::Observer\>& observer)  |  Interface for configuring the profile.
public CacheStorageType GetCacheStorageType() const  |  Get whether caches are stored in memory or on disk.
public const std::shared_ptr\<AuthDelegate\>& GetAuthDelegate() const  |  Get the Auth Delegate.
public const std::shared_ptr\<PolicyProfile::Observer\>& GetObserver() const  |  Get the event observer.
public std::shared_ptr\<MipContext\> GetMipContext() const  |  Get MIP context which represents shared state across all profiles.
public std::shared_ptr\<HttpDelegate\> GetHttpDelegate() const  |  Get the HTTP delegate (if any) provided by the application.
public void SetHttpDelegate(const std::shared_ptr\<HttpDelegate\>& httpDelegate)  |  Override default HTTP stack with client's own.
public std::shared_ptr\<TaskDispatcherDelegate\> GetTaskDispatcherDelegate() const  |  Get the TaskDispatcher delegate (if any) provided by the application.
public void SetTaskDispatcherDelegate(const std::shared_ptr\<TaskDispatcherDelegate\>& taskDispatcherDelegate)  |  Override default asynchonous task dispatching handling with client's own.
public void SetSessionId(const std::string& sessionId)  | _Not yet documented._
public const std::string& GetSessionId() const  | _Not yet documented._
public void SetCustomSettings(const std::vector\<std::pair\<std::string, std::string\>\>& customSettings)  |  Set the custom settings, used for feature gating and testing.
public const std::vector\<std::pair\<std::string, std::string\>\>& GetCustomSettings() const  |  Get the custom settings, used for feature gating and testing.
public ~Settings()  | _Not yet documented._
  
## Members
  
### Settings function
Interface for configuring the profile.

Parameters:  
* **mipContext**: Global context settings 


* **cacheStorageType**: Store any cached state in memory or on disk 


* **authDelegate**: The authentication delegate used by the SDK to acquire authentication tokens. 


* **observer**: A class implementing the PolicyProfile::Observer interface. Can be nullptr.


  
### GetCacheStorageType function
Get whether caches are stored in memory or on disk.

  
**Returns**: Storage type used
  
### GetAuthDelegate function
Get the Auth Delegate.

  
**Returns**: The Auth Delegate.
  
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


  
### GetTaskDispatcherDelegate function
Get the TaskDispatcher delegate (if any) provided by the application.

  
**Returns**: TaskDispatcher delegate to be used for executing asynchronous tasks
  
### SetTaskDispatcherDelegate function
Override default asynchonous task dispatching handling with client's own.

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
  
### ~Settings function
_Not documented yet._
