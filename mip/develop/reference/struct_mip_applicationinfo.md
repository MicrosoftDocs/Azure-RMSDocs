---
title: struct mip::ApplicationInfo 
description: Documents structures associated with the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 04/11/2019
---

# struct mip::ApplicationInfo 
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