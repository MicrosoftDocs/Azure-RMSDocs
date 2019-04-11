---
title: MIP SDK for C++ Reference structs and enums
description: Reference documentation for MIP C++ SDK structs and enums.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.collection: M365-security-compliance
ms.author: mbaldwin
ms.date: 01/28/2019
---

# Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
**Namespace `mip` :** |
enum ActionSource       |  defines what triggered the SetLabel event
enum ActionType       |  Different action types.
enum AssignmentMethod       |  The assignment method of the label on the document. Whether the Assignment of the label was done automatically, standard or as a privileged operation (The equivalent to an administrator operation).
enum Consent       |  A user's response when consent is requested to connect to a service endpoint.
enum ContentFormat       |  Content format.
enum ContentMarkAlignment       |  Alignment for content marks (content header or content footer).
enum DataState       |  Defines what state of the data is the application acting upon.
enum ErrorType       | _Not yet documented._
enum HttpRequestType       |  HTTP request type.
enum LogLevel       |  Different log levels used across the MIP SDK.
enum ProtectionHandlerCreationOptions       |  Bit flags that dictate additional policy creation behavior.
enum ProtectionType       |  Describes whether protection is based off a template or ad-hoc (custom)
enum WatermarkLayout       |  Layout for watermarks.
struct mip::ApplicationInfo  |  A struct that includes application specific information.
struct mip::PublishingLicenseContext  |  Holds the details of a Publishing License used to create a protection handler.
  
## Enumerations (`mip`)

### ActionSource

Defines what triggered the SetLabel event.

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
MANUAL            | Selected manually by user
AUTOMATIC            | Set by policy conditions
RECOMMENDED            | Set by user after label was recommended by policy conditions
DEFAULT            | Set by default in policy
MANDATORY            | Set by user after policy enforced to set a label



### ActionType enum

Different action types. CUSTOM is the generic action type. Every other action type is a specific action with a specific meaning.

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
ADD_CONTENT_FOOTER            | Add a content footer to the document action type.
ADD_CONTENT_HEADER            | Add a content header to the document action type.
ADD_WATERMARK            | Add a water mark to the entire document action type.
CUSTOM            | A custom defined action type.
JUSTIFY            | A justify action type.
METADATA            | A Meta data change action type.
PROTECT_ADHOC            | A protect by adhoc policy action type.
PROTECT_BY_TEMPLATE            | A protect by template action type.
PROTECT_DO_NOT_FORWARD            | A protect by do not forward action type.
REMOVE_CONTENT_FOOTER            | Remove content footer action type.
REMOVE_CONTENT_HEADER            | Remove content header action type.
REMOVE_PROTECTION            | Remove protection action type.
REMOVE_WATERMARK            | Remove watermarking action type.
APPLY_LABEL            | Apply label action type.
RECOMMEND_LABEL            | Recommend label action type.


### AssignmentMethod enum

The assignment method of the label on the document. Whether the Assignment of the label was done automatically, standard or as a privileged operation (The equivalent to an administrator operation).

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
STANDARD            | [Label](class_mip_label.md) assignment method is standard
PRIVILEGED            | [Label](class_mip_label.md) assignment method is privileged
AUTO            | [Label](class_mip_label.md) assignment method is automatic


### Consent enum

A user's response when consent is requested to connect to a service endpoint.

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
AcceptAlways            | Consent, and remember this decision
Accept            | Consent, just one time
Reject            | Do not consent


### ContentFormat enum

Content format.

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
DEFAULT            | Content format is standard file format
EMAIL            | Content format is email format

### ContentMarkAlignment enum

Alignment for content marks (content header or content footer).

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
LEFT            | Content marking is aligned to the left
RIGHT            | Content marking is aligned to the right
CENTER            | Content marking is centered
Alignment for content marks (content header or content footer).
 
### DataState enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
REST            | Inactive data stored physically in databases/file/warehouses
MOTION            | Data traversing a network or temporarily residing in computer memory to be read or updated
USE            | Active data under constant change stored physically in databases/file/warehouses etc
Defines what state of the data is the application acting upon.

### ErrorType enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
BAD_INPUT_ERROR            | Caller passed bad input.
FILE_IO_ERROR            | General File IO error.
NETWORK_ERROR            | General network issues; for example, unreachable service.
TRANSIENT_NETWORK_ERROR            | Transient network issues; for example, bad gateway.
INTERNAL_ERROR            | Internal unexpected errors.
JUSTIFICATION_REQUIRED            | Justification should be provided to complete the action on the file.
NOT_SUPPORTED_OPERATION            | The requested operation is not yet supported.
PRIVILEGED_REQUIRED            | Can't override privileged label when new label method is standard.
ACCESS_DENIED            | The user could not get access to services.
CONSENT_DENIED            | An operation that required consent from user was not granted consent.
POLICY_SYNC_ERROR            | An attempt to sync policy data failed.
NO_PERMISSIONS            | The user could not get access to the content. For example, no permissions, content revoked
NO_AUTH_TOKEN            | The user could not get access to the content due to an empty auth token.
DISABLED_SERVICE            | The user could not get access to the content due to the service being disabled
PROXY_AUTH_ERROR            | Proxy authentication failed.
NO_POLICY_ERROR            | No policy is configured for user/tenant
OPERATION_CANCELLED            | Operation cancelled
ADHOC_PROTECTION_REQUIRED            | Adhoc protection should be set to complete the action on the file
  
### HttpRequestType enum

HTTP request type.

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Get            | GET
Post            | POST

  
### LogLevel enum

Different log levels used across the MIP SDK.

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Trace            | 
Info            | 
Warning            | 
  
### ProtectionHandlerCreationOptions enum

Bit flags that dictate additional policy creation behavior.

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
None            | None
OfflineOnly            | Do not allow UI and network operations.
AllowAuditedExtraction            | Content can be opened in a non-protection-SDK-aware app
PreferDeprecatedAlgorithms            | Use deprecated crypto algorithms (ECB) for backwards compatibility
Bit flags that dictate additional policy creation behavior.

### ProtectionType enum

Describes whether protection is based off a template or ad-hoc (custom).

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
TemplateBased            | Handle was created from a template
Custom            | Handle was created ad hoc
Describes whether protection is based off a template or ad-hoc (custom)
  
### WatermarkLayout enum

Layout for watermarks.

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
HORIZONTAL            | Watermark layout is horizontal
DIAGONAL            | Watermark layout is diagonal


## Structures 

### struct mip::ApplicationInfo 
A struct that includes application specific information.
  
#### Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::string applicationId  |  Application identifier as set in the AAD portal, (Should be a GUID without brackets).
public std::string applicationName  |  Application name, (Should only contain valid ASCII character excluding ';')
public std::string applicationVersion  |  The version of the application being used, (Should only contain valid ASCII character excluding ';')
  
#### Members
  
##### applicationId struct member
Application identifier as set in the AAD portal, (Should be a GUID without brackets).
  
##### applicationName struct member
Application name, (Should only contain valid ASCII character excluding ';')
  
##### applicationVersion struct member
The version of the application being used, (Should only contain valid ASCII character excluding ';')  

### struct mip::PublishingLicenseContext 
Holds the details of a Publishing License used to create a protection handler.
  
#### Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::vector\<uint8_t\> licenseInfo  | _Not yet documented._
public const std::vector\<uint8_t\> serializedPublishingLicense  | _Not yet documented._
public PublishingLicenseContext(const std::vector\<uint8_t\>& licenseInfo, const std::vector\<uint8_t\>& serializedPublishingLicense)  | _Not yet documented._
  
#### Members
  
##### licenseInfo struct member
_Not documented yet._

  
##### serializedPublishingLicense struct member
_Not documented yet._

  
##### PublishingLicenseContext function
_Not documented yet._
