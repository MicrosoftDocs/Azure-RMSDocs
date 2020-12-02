---
title: struct ApplicationInfo 
description: Documents the ApplicationInfo structure
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 09/21/2020
---

# struct ApplicationInfo 
A struct that includes application specific information.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::string applicationId  |  Application identifier as set in the AAD portal, (Should be a GUID without brackets).
public std::string applicationName  |  Application name, (Should only contain valid ASCII character excluding ';')
public std::string applicationVersion  |  The version of the application being used, (Should only contain valid ASCII character excluding ';')
  
## Members
  
### applicationId struct member
Application identifier as set in the AAD portal, (Should be a GUID without brackets).
  
### applicationName struct member
Application name, (Should only contain valid ASCII character excluding ';')
  
### applicationVersion struct member
The version of the application being used, (Should only contain valid ASCII character excluding ';')