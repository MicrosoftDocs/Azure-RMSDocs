---
title: class ParsedPublishingLicenseBuilder 
description: Documents the parsedpublishinglicensebuilder::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 04/23/2021
---

# class ParsedPublishingLicenseBuilder 
  
## Summary

Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::shared_ptr\<ParsedPublishingLicense\> CreateParsedPublishingLicense()  |  Creates a [ParsedPublishingLicense](class_mip_parsedpublishinglicense.md) with the properties set on this object instance.

## Members

### CreateFromUserRights function

Creates a ProtectionDescriptorBuilder whose access permissions are defined by users and rights

Parameters:

* **usersAndRights** Collection of users-to-rights mappings

**Returns** New ProtectionDescriptorBuilder instance


### CreateFromUserRoles function

Creates a ProtectionDescriptorBuilder whose access permissions are defined by users and roles

Parameters:

* **usersAndRoles** Collection of users-to-roles mappings

**Returns** New ProtectionDescriptorBuilder instance


### CreateFromTemplate function

Creates a ProtectionDescriptorBuilder whose access permissions are defined by the protection template

Parameters:

* **templateId** protection template ID

**Returns** New ProtectionDescriptorBuilder instance


### CreateFromProtectionDescriptor function

Creates a ProtectionDescriptorBuilder whose access permissions are defined by a protection descriptor

Parameters:

* **protectionDescriptor** protection descriptor

**Returns** New ProtectionDescriptorBuilder instance

### Create function

Creates a ParsedPublishingLicenseBuilder

**Returns** New ParsedPublishingLicenseBuilder instance

### SetDomains function
Sets the license domains.

Parameters:  
* **domains**:


  
### SetServerPublicCert function
Sets the server public cert.

Parameters:  
* **serverPublicCert**:


  
### SetContentId function
Sets the content id.

Parameters:  
* **contentId**:


  
### SetIssuerId function
Sets the issuer id.

Parameters:  
* **issuerId**:


  
### SetDoubleKeyAlgorithm function
Sets the double key algorithm.

Parameters:  
* **doubleKeyAlgorithm**:


  
### SetOwner function
Sets the owner.

Parameters:  
* **owner**:


  
### SetConnectionInfo function
Sets the connection info.

Parameters:  
* **licenseConnectionInfo**:


  
### SetDescriptor function
Sets the descriptor.

Parameters:  
* **descriptor**:


  
### SetReferralInfoUrl function
Sets the referral info url.

Parameters:  
* **referralInfoUrl**:


  
### SetSignedApplicationData function
Sets the signed application data.

Parameters:  
* **signedApplicationData**:


  
### SetIssuedTime function
Sets the issued time.

Parameters:  
* **issuedTime**:


  
### CreateParsedPublishingLicense function
Creates a ParsedPublishingLicense with the properties set on this object instance.

  
**Returns**: New ParsedPublishingLicense instance