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
public PublishingLicenseInfo(const std::vector\<uint8_t\>& serializedPublishingLicense)  | _Not yet documented._
public PublishingLicenseInfo(const std::vector\<uint8_t\>& serializedPreLicense, const std::vector\<uint8_t\>& serializedPublishingLicense)  | _Not yet documented._
public void SetParsedData(std::shared_ptr\<ParsedPublishingLicense\> parsedPublishingLicense)  | _Not yet documented._
public void SetParsedData(const std::vector\<std::string\>& domains, const std::string& serverPublicCert, const std::string& contentId, const std::string& issuerId)  | _Not yet documented._
public const std::vector\<uint8_t\>& GetSerializedPublishingLicense() const  | _Not yet documented._
public const std::vector\<uint8_t\>& GetPreLicense() const  | _Not yet documented._
public const std::vector\<std::string\>& GetDomains() const  | _Not yet documented._
public const std::string& GetServerPublicCertificate() const  | _Not yet documented._
public const std::string& GetIssuerId() const  | _Not yet documented._
public const std::string& GetContentId() const  | _Not yet documented._
public bool IsLicenseParsed() const  | _Not yet documented._
public bool HasPreLicense() const  | _Not yet documented._
public bool GetIsDoubleKeyLicense() const  | _Not yet documented._
public const std::string& GetDoubleKeyAlgorithm() const  | _Not yet documented._
public const std::string& GetOwner() const  | _Not yet documented._
public std::shared_ptr\<LicenseConnectionInfo\> GetConnectionInfo() const  | _Not yet documented._
public std::shared_ptr\<LicenseDescriptor\> GetDescriptor() const  | _Not yet documented._
public const std::string& GetReferralInfoUrl() const  | _Not yet documented._
public const std::vector\<std::shared_ptr\<LicenseApplicationData\>\>& GetSignedApplicationData() const  | _Not yet documented._
public const std::chrono::time_point\<std::chrono::system_clock\>& GetIssuedTime() const  | _Not yet documented._
public const mip::LabelInfo GetLabelInfo() const  | _Not yet documented._
public const std::vector\<uint8_t\>& GetEncryptedRightsData() const  | _Not yet documented._
  
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
