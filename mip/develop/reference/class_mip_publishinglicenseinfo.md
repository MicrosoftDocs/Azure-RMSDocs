---
title: class PublishingLicenseInfo 
description: Documents the publishinglicenseinfo::undefined class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/13/2021
---

# class PublishingLicenseInfo 
Holds the details of a Publishing License used to create a protection handler.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public PublishingLicenseInfo(const std::vector\<uint8_t\>& serializedPublishingLicense)  | _Not yet documented._
public PublishingLicenseInfo(const std::vector\<uint8_t\>& serializedPreLicense, const std::vector\<uint8_t\>& serializedPublishingLicense)  | _Not yet documented._
public void SetParsedData(const std::vector\<std::string\>& domains, const std::string& serverPublicCert, const std::string& contentId, const std::string& issuerId)  | _Not yet documented._
public void SetDoubleKeyData(const std::string& algorithm, const std::map\<std::string, std::string\>& doubleKeyApplicationData)  | _Not yet documented._
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
public const std::map\<std::string, std::string\>& GetDoubleKeyApplicationData() const  | _Not yet documented._
  
## Members
  
### PublishingLicenseInfo function
_Not documented yet._

  
### PublishingLicenseInfo function
_Not documented yet._

  
### SetParsedData function
_Not documented yet._

  
### SetDoubleKeyData function
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

  
### GetDoubleKeyApplicationData function
_Not documented yet._
