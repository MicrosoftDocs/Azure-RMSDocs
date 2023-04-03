---
title: class GetTemplatesSettings 
description: Documents the gettemplatessettings::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class GetTemplatesSettings 
Settings to use when obtaining templates.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public void SetDelegatedUserEmail(const std::string& delegatedUserEmail)  |  Sets the delegated user.
public const std::string& GetDelegatedUserEmail() const  |  Gets the delegated user.
public void ForceRefresh(bool enabled)  |  Can enable force refresh of templates, ignoring former cached response.
public bool ShouldRefreshTemplates() const  |  Can enable force refresh of templates, ignoring former cached response.
public void EnableCaching(bool cachingAllowed)  |  Can disable caching of template response. Will cache by default.
public bool ShouldCacheResponse() const  |  Can cache templates or not.
  
## Members
  
### SetDelegatedUserEmail function
Sets the delegated user.

Parameters:  
* **delegatedUserEmail**: the delegation email.


A delegated user is specified when the authenticating user/application is acting on behalf of another user
  
### GetDelegatedUserEmail function
Gets the delegated user.

  
**Returns**: Delegated user
A delegated user is specified when the authenticating user/application is acting on behalf of another user
  
### ForceRefresh function
Can enable force refresh of templates, ignoring former cached response.

Parameters:  
* **enabled**: True to force the refresh. False to use the cached templates if available.


  
### ShouldRefreshTemplates function
Can enable force refresh of templates, ignoring former cached response.

  
**Returns**: True to ignore cached templates. False to use if available.
  
### EnableCaching function
Can disable caching of template response. Will cache by default.

Parameters:  
* **cachingAllowed**: False to disallow template caching.


  
### ShouldCacheResponse function
Can cache templates or not.

  
**Returns**: True to cache templates. False to not.