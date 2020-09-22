---
title: class PublishingLicenseInfo 
description: Documents the publishinglicenseinfo::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 09/21/2020
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
Not yet documented.

  
### PublishingLicenseInfo function
Not yet documented.

  
### SetParsedData function
Not yet documented.

  
### SetDoubleKeyData function
Not yet documented.

  
### GetSerializedPublishingLicense function
Not yet documented.

  
### GetPreLicense function
Not yet documented.

  
### GetDomains function
Not yet documented.

  
### GetServerPublicCertificate function
Not yet documented.

  
### GetIssuerId function
Not yet documented.

  
### GetContentId function
Not yet documented.

  
### IsLicenseParsed function
Not yet documented.

  
### HasPreLicense function
Not yet documented.

  
### GetIsDoubleKeyLicense function
Not yet documented.

  
### GetDoubleKeyAlgorithm function
Not yet documented.

  
### GetDoubleKeyApplicationData function
Not yet documented.
