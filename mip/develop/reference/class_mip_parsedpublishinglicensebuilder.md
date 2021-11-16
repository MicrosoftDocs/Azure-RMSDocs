---
title: class ParsedPublishingLicenseBuilder 
description: Documents the parsedpublishinglicensebuilder::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/15/2021
---

# class ParsedPublishingLicenseBuilder 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public void SetDomains(const std::vector\<std::string\>& domains)  |  Sets the license domains.
public void SetServerPublicCert(const std::string& serverPublicCert)  |  Sets the server public cert.
public void SetContentId(const std::string& contentId)  |  Sets the content id.
public void SetIssuerId(const std::string& issuerId)  |  Sets the issuer id.
public void SetDoubleKeyAlgorithm(const std::string& doubleKeyAlgorithm)  |  Sets the double key algorithm.
public void SetOwner(const std::string& owner)  |  Sets the owner.
public void SetConnectionInfo(std::shared_ptr\<LicenseConnectionInfo\> licenseConnectionInfo)  |  Sets the connection info.
public void SetDescriptor(std::shared_ptr\<LicenseDescriptor\> descriptor)  |  Sets the descriptor.
public void SetReferralInfoUrl(const std::string& referralInfoUrl)  |  Sets the referral info url.
public void SetSignedApplicationData(const std::vector\<std::shared_ptr\<LicenseApplicationData\>\>& signedApplicationData)  |  Sets the signed application data.
public void SetIssuedTime(const std::chrono::time_point\<std::chrono::system_clock\>& issuedTime)  |  Sets the issued time.
public std::shared_ptr\<ParsedPublishingLicense\> CreateParsedPublishingLicense()  |  Creates a ParsedPublishingLicense with the properties set on this object instance.
  
## Members
  
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

  
**Returns**: New ParsedPublishingLicense instancece