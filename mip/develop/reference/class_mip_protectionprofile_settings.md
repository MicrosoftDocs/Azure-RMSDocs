---
title: class ProtectionProfile::Settings 
description: Documents the protectionprofile::settings class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 08/23/2021
---

# class ProtectionProfile::Settings 
Settings used by ProtectionProfile during its creation and throughout its lifetime.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Settings(const std::shared_ptr\<MipContext\>& mipContext, CacheStorageType cacheStorageType, const std::shared_ptr\<ConsentDelegate\>& consentDelegate, const std::shared_ptr\<ProtectionProfile::Observer\>& observer)  |  ProtectionProfile::Settings constructor that specifies an observer to be used for async operations.
public Settings(const std::shared_ptr\<MipContext\>& mipContext, CacheStorageType cacheStorageType, const std::shared_ptr\<ConsentDelegate\>& consentDelegate)  |  ProtectionProfile::Settings constructor, used for synchronous operations.
public CacheStorageType GetCacheStorageType() const  |  Get whether caches are stored in memory or on disk.
public std::shared_ptr\<ConsentDelegate\> GetConsentDelegate() const  |  Gets the consent delegate used for connecting to services.
public std::shared_ptr\<ProtectionProfile::Observer\> GetObserver() const  |  Gets the observer that receives notifications of events related to ProtectionProfile.
public std::shared_ptr\<MipContext\> GetMipContext() const  |  Get MIP context which represents shared state across all profiles.
public std::shared_ptr\<HttpDelegate\> GetHttpDelegate() const  |  Get the HTTP delegate (if any) provided by the application.
public void SetHttpDelegate(const std::shared_ptr\<HttpDelegate\>& httpDelegate)  |  Override default HTTP stack with client's own.
public std::shared_ptr\<StorageDelegate\> GetStorageDelegate() const  |  Get the StorageDelegate (if any) provided by the application.
public void SetStorageDelegate(const std::shared_ptr\<StorageDelegate\>& storageDelegate)  |  Override default storage cache with client's own implementation.
public std::shared_ptr\<TaskDispatcherDelegate\> GetTaskDispatcherDelegate() const  |  Get the TaskDispatcher delegate (if any) provided by the application.
public void SetTaskDispatcherDelegate(const std::shared_ptr\<TaskDispatcherDelegate\>& taskDispatcherDelegate)  |  Override default asynchonous task dispatching handling with client's own.
public void SetSessionId(const std::string& sessionId)  |  Sets the session ID.
public const std::string& GetSessionId() const  |  Gets the session ID.
public void SetCanCacheLicenses(bool canCacheLicenses)  |  Configures whether or not end user licenses (EULs) will be cached locally.
public bool CanCacheLicenses() const  |  Gets whether or not end user licenses (EULs) are cached locally.
public void SetCustomSettings(const std::vector\<std::pair\<std::string, std::string\>\>& customSettings)  |  Set the custom settings, used for feature gating and testing.
public const std::vector\<std::pair\<std::string, std::string\>\>& GetCustomSettings() const  |  Get the custom settings, used for feature gating and testing.
public const std::shared_ptr\<void\>& GetLoggerContext() const  |  Get logger context that will be opaquely passed to the logger delegate for logs associated with the created profile.
public void SetLoggerContext(const std::shared_ptr\<void\>& loggerContext)  |  Sets the logger context that will be opaquely passed to the logger delegate for logs associated with the created profile.
public void AddRedirectionUri(const std::string& originalUri, const std::string& redirectUri)  |  Adds a redirect uri.
public const std::map\<std::string, std::string\>& GetRedirectionUris() const  |  Gets the redirection uris.
  
## Members
  
### Settings function
ProtectionProfile::Settings constructor that specifies an observer to be used for async operations.

Parameters:  
* **mipContext**: Global context settings 


* **cacheStorageType**: Store any cached state in memory or on disk 


* **consentDelegate**: Delegate used to obtain user permission to access external resources 


* **observer**: Observer instance that will receive notifications of events related to ProtectionProfile


* **applicationInfo**: Info about application that is consuming the protection SDK


  
### Settings function
ProtectionProfile::Settings constructor, used for synchronous operations.

Parameters:  
* **mipContext**: Global context settings 


* **cacheStorageType**: Store any cached state in memory or on disk 


* **consentDelegate**: Delegate used to obtain user permission to access external resources 


* **applicationInfo**: Info about application which is consuming the protection SDK


  
### GetCacheStorageType function
Get whether caches are stored in memory or on disk.

  
**Returns**: Storage type used
  
### GetConsentDelegate function
Gets the consent delegate used for connecting to services.

  
**Returns**: Consent delegate used for connecting to services
  
### GetObserver function
Gets the observer that receives notifications of events related to ProtectionProfile.

  
**Returns**: Observer that receives notifications of events related to ProtectionProfile
  
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


  
### GetStorageDelegate function
Get the StorageDelegate (if any) provided by the application.

  
**Returns**: StorageDelegate to be used for caching
  
### SetStorageDelegate function
Override default storage cache with client's own implementation.

Parameters:  
* **storageDelegate**: StorageDelegate interface implemented by client application


  
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
  
### GetLoggerContext function
Get logger context that will be opaquely passed to the logger delegate for logs associated with the created profile.

  
**Returns**: The logger context
  
### SetLoggerContext function
Sets the logger context that will be opaquely passed to the logger delegate for logs associated with the created profile.

Parameters:  
* **loggerContext**: The logger context


  
### AddRedirectionUri function
Adds a redirect uri.

Parameters:  
* **originalUri**: The uri that should be redirected from 


* **redirectUri**: The uri that will replace the originalUri


Use this function to provide a domain that should be redirected to another Uri The originalUri will be normalized before comparison with the domain for the current request. If the domain of the current request matches that of the originalUri then the redirectUri will be used instead This redirection will occur before DNS lookup redirection
  
### GetRedirectionUris function
Gets the redirection uris.

  
**Returns**: Map of redirection uris