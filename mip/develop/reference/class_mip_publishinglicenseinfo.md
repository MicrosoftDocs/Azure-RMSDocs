---
title: class PublishingLicenseInfo 
description: Documents the publishinglicenseinfo::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class PublishingLicenseInfo 
Holds the details of a Publishing License used to create a protection handler.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public PublishingLicenseInfo(const std::vector\&lt;uint8_t\&gt;& serializedPublishingLicense)  | _Not yet documented._
public PublishingLicenseInfo(const std::vector\&lt;uint8_t\&gt;& serializedPreLicense, const std::vector\&lt;uint8_t\&gt;& serializedPublishingLicense)  | _Not yet documented._
public void SetParsedData(std::shared_ptr\&lt;ParsedPublishingLicense\&gt; parsedPublishingLicense)  | _Not yet documented._
public void SetParsedData(const std::vector\&lt;std::string\&gt;& domains, const std::string& serverPublicCert, const std::string& contentId, const std::string& issuerId)  | _Not yet documented._
public const std::vector\&lt;uint8_t\&gt;& GetSerializedPublishingLicense() const  | _Not yet documented._
public const std::vector\&lt;uint8_t\&gt;& GetPreLicense() const  | _Not yet documented._
public const std::vector\&lt;std::string\&gt;& GetDomains() const  | _Not yet documented._
public const std::string& GetServerPublicCertificate() const  | _Not yet documented._
public const std::string& GetIssuerId() const  | _Not yet documented._
public const std::string& GetContentId() const  | _Not yet documented._
public bool IsLicenseParsed() const  | _Not yet documented._
public bool HasPreLicense() const  | _Not yet documented._
public bool GetIsDoubleKeyLicense() const  | _Not yet documented._
public const std::string& GetDoubleKeyAlgorithm() const  | _Not yet documented._
public const std::string& GetOwner() const  | _Not yet documented._
public std::shared_ptr\&lt;LicenseConnectionInfo\&gt; GetConnectionInfo() const  | _Not yet documented._
public std::shared_ptr\&lt;LicenseDescriptor\&gt; GetDescriptor() const  | _Not yet documented._
public const std::string& GetReferralInfoUrl() const  | _Not yet documented._
public const std::vector\&lt;std::shared_ptr\&lt;LicenseApplicationData\&gt;\&gt;& GetSignedApplicationData() const  | _Not yet documented._
public const std::chrono::time_point\&lt;std::chrono::system_clock\&gt;& GetIssuedTime() const  | _Not yet documented._
public const mip::LabelInfo GetLabelInfo() const  | _Not yet documented._
public const std::vector\&lt;uint8_t\&gt;& GetEncryptedRightsData() const  | _Not yet documented._
  
## Members
  
### PublishingLicenseInfo function
_Not documented yet._

  
### PublishingLicenseInfo function
_Not documented yet._

  
### SetParsedData function
_Not documented yet._

  
### SetParsedData function
_Not documented yet._

  
### GetSerializedPublishingLicense function
_Not documented yet._

  
### GetPreLicense function
_Not documented yet._

  
### GetDomains function
_Not documented yet._

  
### GetServerPublicCertificate function
_Not documented yet._

  
### GetIssuerId function
_Not documented yet._

  
### GetContentId function
_Not documented yet._

  
### IsLicenseParsed function
_Not documented yet._

  
### HasPreLicense function
_Not documented yet._

  
### GetIsDoubleKeyLicense function
_Not documented yet._

  
### GetDoubleKeyAlgorithm function
_Not documented yet._

  
### GetOwner function
_Not documented yet._

  
### GetConnectionInfo function
_Not documented yet._

  
### GetDescriptor function
_Not documented yet._

  
### GetReferralInfoUrl function
_Not documented yet._

  
### GetSignedApplicationData function
_Not documented yet._

  
### GetIssuedTime function
_Not documented yet._

  
### GetLabelInfo function
_Not documented yet._

  
### GetEncryptedRightsData function
_Not documented yet._
