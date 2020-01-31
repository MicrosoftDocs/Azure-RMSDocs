---
title: class mip::ProtectionProfile::Settings 
description: Documents the mip::protectionprofile class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/31/2020
---

# class mip::ProtectionProfile::Settings 
[Settings](undefined) used by [ProtectionProfile](undefined) during its creation and throughout its lifetime.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Settings(const std::shared_ptr\<MipContext\>& mipContext, CacheStorageType cacheStorageType, const std::shared_ptr\<AuthDelegate\>& authDelegate, const std::shared_ptr\<ConsentDelegate\>& consentDelegate, const std::shared_ptr\<ProtectionProfile::Observer\>& observer)  |  [ProtectionProfile::Settings](undefined) constructor that specifies an observer to be used for async operations.
public Settings(const std::shared_ptr\<MipContext\>& mipContext, CacheStorageType cacheStorageType, const std::shared_ptr\<AuthDelegate\>& authDelegate, const std::shared_ptr\<ConsentDelegate\>& consentDelegate)  |  [ProtectionProfile::Settings](undefined) constructor, used for synchronous operations.
public CacheStorageType GetCacheStorageType() const  |  Get whether caches are stored in memory or on disk.
public std::shared_ptr\<AuthDelegate\> GetAuthDelegate() const  |  Gets the auth delegate used for acquiring authentication tokens.
public std::shared_ptr\<ConsentDelegate\> GetConsentDelegate() const  |  Gets the consent delegate used for connecting to services.
public std::shared_ptr\<ProtectionProfile::Observer\> GetObserver() const  |  Gets the observer that receives notifications of events related to [ProtectionProfile](undefined).
public std::shared_ptr\<MipContext\> GetMipContext() const  |  Get MIP context which represents shared state across all profiles.
public std::shared_ptr\<HttpDelegate\> GetHttpDelegate() const  |  Get the HTTP delegate (if any) provided by the application.
public void SetHttpDelegate(const std::shared_ptr\<HttpDelegate\>& httpDelegate)  |  Override default HTTP stack with client's own.
public std::shared_ptr\<TaskDispatcherDelegate\> GetTaskDispatcherDelegate() const  |  Get the TaskDispatcher delegate (if any) provided by the application.
public void SetTaskDispatcherDelegate(const std::shared_ptr\<TaskDispatcherDelegate\>& taskDispatcherDelegate)  |  Override default asynchonous task dispatching handling with client's own.
public void SetSessionId(const std::string& sessionId)  |  Sets the session ID.
public const std::string& GetSessionId() const  |  Gets the session ID.
public void SetCanCacheLicenses(bool canCacheLicenses)  |  Configures whether or not end user licenses (EULs) will be cached locally.
public bool CanCacheLicenses() const  |  Gets whether or not end user licenses (EULs) are cached locally.
public void SetCustomSettings(const std::vector\<std::pair\<std::string, std::string\>\>& customSettings)  |  Set the custom settings, used for feature gating and testing.
public const std::vector\<std::pair\<std::string, std::string\>\>& GetCustomSettings() const  |  Get the custom settings, used for feature gating and testing.
  
## Members
  
### Settings function
[ProtectionProfile::Settings](undefined) constructor that specifies an observer to be used for async operations.

Parameters:  
* **mipContext**: Global context settings 


* **cacheStorageType**: Store any cached state in memory or on disk 


* **authDelegate**: Callback object to be used for authentication, implemented by client application 


* **consentDelegate**: Delegate used to obtain user permission to access external resources 


* **observer**: [Observer](undefined) instance that will receive notifications of events related to [ProtectionProfile](undefined)


* **applicationInfo**: Info about application that is consuming the protection SDK


  
### Settings function
[ProtectionProfile::Settings](undefined) constructor, used for synchronous operations.

Parameters:  
* **mipContext**: Global context settings 


* **cacheStorageType**: Store any cached state in memory or on disk 


* **authDelegate**: Callback object to be used for authentication, implemented by client application 


* **consentDelegate**: Delegate used to obtain user permission to access external resources 


* **applicationInfo**: Info about application which is consuming the protection SDK


  
### GetCacheStorageType function
Get whether caches are stored in memory or on disk.

  
**Returns**: Storage type used
  
### GetAuthDelegate function
Gets the auth delegate used for acquiring authentication tokens.

  
**Returns**: Auth delegate used for acquiring authentication tokens
  
### GetConsentDelegate function
Gets the consent delegate used for connecting to services.

  
**Returns**: Consent delegate used for connecting to services
  
### GetObserver function
Gets the observer that receives notifications of events related to [ProtectionProfile](undefined).

  
**Returns**: [Observer](undefined) that receives notifications of events related to [ProtectionProfile](undefined)
  
### GetMipContext function
Get MIP context which represents shared state across all profiles.

  
**Returns**: MIP context
  
### GetHttpDelegate function
Get the HTTP delegate (if any) provided by the application.

  
**Returns**: HTTP delegate to be used for HTTP operations
  
### SetHttpDelegate function
Override default HTTP stack with client's own.

Parameters:  
* **httpDelegate**: HTTP callback interface implemented by client application


  
### GetTaskDispatcherDelegate function
Get the TaskDispatcher delegate (if any) provided by the application.

  
**Returns**: TaskDispatcher delegate to be used for executing asynchronous tasks
  
### SetTaskDispatcherDelegate function
Override default asynchonous task dispatching handling with client's own.

Parameters:  
* **taskDispatcherDelegate**: Task dispatching callback interface implemented by client application


tasks can reference profile objects preventing its destruction as a result taskdispatcher queues should not be shared.
  
### SetSessionId function
Sets the session ID.

Parameters:  
* **sessionId**: Session ID that will be used to correlate logs/telemetry


  
### GetSessionId function
Gets the session ID.

  
**Returns**: Session ID that will be used to correlate logs/telemetry
  
### SetCanCacheLicenses function
Configures whether or not end user licenses (EULs) will be cached locally.

Parameters:  
* **canCacheLicenses**: Whether or not engine should cache a license when opening protected content


If true, opening protected content will cache the associated license locally. If false, opening protected content will always perform HTTP operation to acquire the license from the RMS service.
  
### CanCacheLicenses function
Gets whether or not end user licenses (EULs) are cached locally.

  
**Returns**: License caching configuration
  
### SetCustomSettings function
Set the custom settings, used for feature gating and testing.

Parameters:  
* **customSettings**: List of name/value pairs.


  
### GetCustomSettings function
Get the custom settings, used for feature gating and testing.

  
**Returns**: List of name/value pairs.