---
title: class TenantInformation 
description: Documents the tenantinformation::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class TenantInformation 
Tenant information from RMS.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::string& GetIssuerName() const  |  Get the issuer name.
public const std::string& GetExtranetUrl() const  |  Get the extranet Url of tenant.
public const std::string& GetIntranetUrl() const  |  Get intranet Url of tenant (Expected to match extranet url outside of ADRMS scenarios)
public const std::string& GetTenantId() const  |  Get Id of Tenant if applicable.
  
## Members
  
### GetIssuerName function
Get the issuer name.

  
**Returns**: The display name for the organization associated with this tenant
  
### GetExtranetUrl function
Get the extranet Url of tenant.

  
**Returns**: The URL used to obtain licenses for content outside an enterprise's intranet
  
### GetIntranetUrl function
Get intranet Url of tenant (Expected to match extranet url outside of ADRMS scenarios)

  
**Returns**: The URL used to obtain licenses for content within an enterprise's intranet. Same as extranet url for tenants that use Azure RMS.
  
### GetTenantId function
Get Id of Tenant if applicable.

  
**Returns**: The unique id used to refer to this tenant