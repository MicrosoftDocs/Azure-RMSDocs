---
title: class mip::ProtectionHandler 
description: Documents the mip::protectionhandler class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 07/02/2019
---

# class mip::ProtectionHandler 
Manages protection-related actions for a specific protection configuration.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::shared_ptr\<Stream\> CreateProtectedStream(const std::shared_ptr\<Stream\>& backingStream, int64_t contentStartPosition, int64_t contentSize)  |  Create a protected stream that will allow for encryption/decryption of content.
public int64_t EncryptBuffer(int64_t offsetFromStart, const uint8_t* inputBuffer, int64_t inputBufferSize, uint8_t* outputBuffer, int64_t outputBufferSize, bool isFinal)  |  Encrypt a buffer.
public int64_t DecryptBuffer(int64_t offsetFromStart, const uint8_t* inputBuffer, int64_t inputBufferSize, uint8_t* outputBuffer, int64_t outputBufferSize, bool isFinal)  |  Decrypt a buffer.
public int64_t GetProtectedContentLength(int64_t unprotectedLength, bool includesFinalBlock)  |  Calculates size (in bytes) of content if it were to be encrypted with this [ProtectionHandler](class_mip_protectionhandler.md).
public int64_t GetBlockSize()  |  Gets the block size (in bytes) for the cipher mode used by this [ProtectionHandler](class_mip_protectionhandler.md).
public std::vector\<std::string\> GetRights() const  |  Gets the rights granted to the user/identity associated with this [ProtectionHandler](class_mip_protectionhandler.md).
public bool AccessCheck(const std::string& right) const  |  Checks if protection handler grants user access to the specified right.
public const std::string GetIssuedTo()  |  Gets user associated with the protection handler.
public const std::string GetOwner()  |  Gets email address of content owner.
public bool IsIssuedToOwner()  |  Gets if the current user is the content owner or not.
public std::shared_ptr\<ProtectionDescriptor\> GetProtectionDescriptor()  |  Gets protection details.
public const std::string GetContentId()  |  Gets unique identifier for the document/content.
public bool DoesUseDeprecatedAlgorithms()  |  Gets if protection handler uses deprecated crypto algorithms (ECB) for backward compatibility or not.
public bool IsAuditedExtractAllowed()  |  Gets if protection handler grants user 'audited extract' right or not.
public const std::vector\<uint8_t\> GetSerializedPublishingLicense()  |  Serialize [ProtectionHandler](class_mip_protectionhandler.md) into a publishing license (PL)
public const std::vector\<uint8_t\> GetSerializedProtectionInfo()  |  Gets protection info.
  
## Members
  
### CreateProtectedStream function
Create a protected stream that will allow for encryption/decryption of content.

Parameters:  
* **backingStream**: Backing stream from which to read/write 


* **contentStartPosition**: Starting position (in bytes) within the backing stream where protected content begins 


* **contentSize**: Size (in bytes) of protected content within backing stream



  
**Returns**: Protected stream
  
### EncryptBuffer function
Encrypt a buffer.

Parameters:  
* **offsetFromStart**: Relative position of inputBuffer from the very beginning of the cleartext content 


* **inputBuffer**: Buffer of cleartext content that will be encrypted 


* **inputBufferSize**: Size (in bytes) of input buffer 


* **outputBuffer**: Buffer into which encrypted content will be copied 


* **outputBufferSize**: Size (in bytes) of output buffer 


* **isFinal**: If input buffer contains the final cleartext bytes or not



  
**Returns**: Actual size (in bytes) of encrypted content
  
### DecryptBuffer function
Decrypt a buffer.

Parameters:  
* **offsetFromStart**: Relative position of inputBuffer from the very beginning of the encrypted content 


* **inputBuffer**: Buffer of encrypted content that will be decrypted 


* **inputBufferSize**: Size (in bytes) of input buffer 


* **outputBuffer**: Buffer into which decrypted content will be copied 


* **outputBufferSize**: Size (in bytes) of output buffer 


* **isFinal**: If input buffer contains the final encrypted bytes or not



  
**Returns**: Actual size (in bytes) of decrypted content
  
### GetProtectedContentLength function
Calculates size (in bytes) of content if it were to be encrypted with this [ProtectionHandler](class_mip_protectionhandler.md).

Parameters:  
* **unprotectedLength**: Size (in bytes) of unprotected content 


* **includesFinalBlock**: Describes if the unprotected content in question includes the final block or not. For example, in CBC4k encryption mode, non-final protected blocks are the same size as unprotected blocks, but final protected blocks are larger than their unprotected counterparts.



  
**Returns**: Size (in bytes) of protected content
  
### GetBlockSize function
Gets the block size (in bytes) for the cipher mode used by this [ProtectionHandler](class_mip_protectionhandler.md).

  
**Returns**: Block size (in bytes)
  
### GetRights function
Gets the rights granted to the user/identity associated with this [ProtectionHandler](class_mip_protectionhandler.md).

  
**Returns**: Rights granted to the user
  
### AccessCheck function
Checks if protection handler grants user access to the specified right.

Parameters:  
* **right**: Right to check



  
**Returns**: If protection handler grants user access to the specified right or not
  
### GetIssuedTo function
Gets user associated with the protection handler.

  
**Returns**: User associated with protection handler
  
### GetOwner function
Gets email address of content owner.

  
**Returns**: Email address of content owner
  
### IsIssuedToOwner function
Gets if the current user is the content owner or not.

  
**Returns**: If the current user is the content owner or not
  
### GetProtectionDescriptor function
Gets protection details.

  
**Returns**: Protection details
  
### GetContentId function
Gets unique identifier for the document/content.

  
**Returns**: Unique content identifier
  
### DoesUseDeprecatedAlgorithms function
Gets if protection handler uses deprecated crypto algorithms (ECB) for backward compatibility or not.

  
**Returns**: If protection handler uses deprecated crypto algorithms or not
  
### IsAuditedExtractAllowed function
Gets if protection handler grants user 'audited extract' right or not.

  
**Returns**: If protection handler grants user 'audited extract' right or not
  
### GetSerializedPublishingLicense function
Serialize [ProtectionHandler](class_mip_protectionhandler.md) into a publishing license (PL)

  
**Returns**: Serialized publishing license
  
### GetSerializedProtectionInfo function
Gets protection info.

  
**Returns**: Serialized protection info