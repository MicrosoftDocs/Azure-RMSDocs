---
title: class ParsedPublishingLicense 
description: Documents the parsedpublishinglicense::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/14/2022
---

# class ParsedPublishingLicense 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::vector&lt;std::string&gt;& GetDomains()  |  Gets the license domains.
public const std::string& GetServerPublicCert()  |  Gets the server public cert.
public const std::string& GetContentId()  |  Gets the content id.
public const std::string& GetIssuerId()  |  Gets the issuer id.
public const std::string& GetDoubleKeyAlgorithm()  |  Gets the double key algorithm.
public const std::string& GetOwner()  |  Gets the owner.
public std::shared_ptr&lt;LicenseConnectionInfo&gt; GetConnectionInfo()  |  Gets the connection info.
public std::shared_ptr&lt;LicenseDescriptor&gt; GetDescriptor()  |  Gets the descriptor.
public const std::string& GetReferralInfoUrl()  |  Gets the referral info url.
public const std::vector&lt;std::shared_ptr&lt;LicenseApplicationData&gt;&gt;& GetSignedApplicationData()  |  Gets the signed application data.
public const std::chrono::time_point&lt;std::chrono::system_clock&gt;& GetIssuedTime()  |  Gets the issued time.
  
## Members
  
### GetDomains function
Gets the license domains.
  
### GetServerPublicCert function
Gets the server public cert.
  
### GetContentId function
Gets the content id.
  
### GetIssuerId function
Gets the issuer id.
  
### GetDoubleKeyAlgorithm function
Gets the double key algorithm.
  
### GetOwner function
Gets the owner.
  
### GetConnectionInfo function
Gets the connection info.
  
### GetDescriptor function
Gets the descriptor.
  
### GetReferralInfoUrl function
Gets the referral info url.
  
### GetSignedApplicationData function
Gets the signed application data.
  
### GetIssuedTime function
Gets the issued time.
