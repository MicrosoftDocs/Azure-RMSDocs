---
title: Summary
description: Summary
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.date: 09/27/2018
ms.author: bryanla
---
# Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
**common** |
enum Consent       |  A user's response when consent is requested to connect to a service endpoint.
struct ApplicationInfo  |  A struct that includes application specific information.
**mip** |
enum ErrorType       | _Not yet documented._
enum HttpRequestType       |  HTTP request type.
enum LogLevel       |  Different log levels used across the MIP SDK.
enum ProtectionHandlerCreationOptions       |  Bit flags that dictate additional policy creation behavior.
enum ProtectionType       |  Describes whether protection is based off a template or ad-hoc (custom)
enum ActionType       |  Different action types.
struct mip::PublishingLicenseContext | Holds the details of a Publishing License used to create a protection handler.

  
## Enumerations (common)
  
### Consent
Represents a user's decision to consent to connect to a service endpoint.

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
AcceptAlways            | Consent, and remember this decision
Accept            | Consent, just one time
Reject            | Do not consent
  
## Enumerations (mip)

### ActionType

Different action types.

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
ADD_CONTENT_FOOTER            | Add a content footer to the document action type.
ADD_CONTENT_HEADER            | Add a content header to the document action type.
ADD_WATERMARK            | Add a water mark to the entire document action type.
CUSTOM            | A custom defined action type.
JUSTIFY            | A justify action type.
METADATA            | A Meta data change action type.
PROTECT_ADHOC            | A protect by ad-hoc policy action type.
PROTECT_BY_TEMPLATE            | A protect by template action type.
PROTECT_DO_NOT_FORWARD            | A protect by do not forward action type.
REMOVE_CONTENT_FOOTER            | Remove content footer action type.
REMOVE_CONTENT_HEADER            | Remove content header action type.
REMOVE_PROTECTION            | Remove protection action type.
REMOVE_WATERMARK            | Remove watermarking action type.
APPLY_LABEL            | Apply label action type.
RECOMMEND_LABEL            | Recommend label action type.

CUSTOM is the generic action type. Every other action type is a specific action with a specific meaning.

ActionType values can be combined using the following operators:

- And (&) operator for [Action](class_mip_action.md) (`operator &(ActionType a, ActionType b)`)
- Logical Or (Xor) (^) operator for [Action](class_mip_action.md). (`operator ^(ActionType a, ActionType b)`)


### ErrorType
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
BAD_INPUT_ERROR            | Caller passed bad input.
FILE_IO_ERROR            | General File IO error.
NETWORK_ERROR            | General network issues; e.g. unreachable service.
TRANSIENT_NETWORK_ERROR            | Transient network issues; e.g. bad gateway.
INTERNAL_ERROR            | Internal unexpected errors. e.g. in client-server protocol (received unexpected response).
JUSTIFICATION_REQUIRED            | Justification should be provided to complete the action on the file.
NOT_SUPPORTED_OPERATION            | The requested operation is not yet supported.
PRIVILEGED_REQUIRED            | Can't override privileged label when new label method is standard.
ACCESS_DENIED            | The user could not get access to the content. e.g. no permissions, content revoked etc.
CONSENT_DENIED            | An operation that required consent from user was not granted consent.
  
### HttpRequestType
HTTP request type.

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Get            | GET
Post            | POST
  
### LogLevel

Different log levels used across the MIP SDK.

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Trace            | 
Info            | 
Warning            | 
Error            | 
Different log levels used across the mip sdk.
  
### ProtectionHandlerCreationOptions

Bit flags that dictate additional policy creation behavior.

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
None            | None
OfflineOnly            | Do not allow UI and network operations.
AllowAuditedExtraction            | Content can be opened in a non-protection-SDK-aware app
PreferDeprecatedAlgorithms            | Use deprecated crypto algorithms (ECB) for backwards compatibility


### ProtectionType
Describes whether protection is based off a template or ad-hoc (custom)

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
TemplateBased            | Handle was created from a template
Custom            | Handle was created ad hoc

  
### ProtectionHandlerCreationOptions
ProtectionHandlerCreationOptions bitwise OR operator.

Parameters:  
* **a**: Left value 

* **b**: Right value

### ReleaseAllResources
Release all resources (threads, etc) prior to shutdown.
If MIP dynamic libraries are delay-loaded by an application, this function must be called prior to the application explicitly unloading those MIP libraries to avoid deadlock. For example, on win32, this function must be called prior to any calls to explictly unload MIP DLLs via FreeLibrary or \__FUnloadDelayLoadedDLL2. Applications must release references to all MIP objects (e.g. Profiles, Engines, Handlers) prior to calling this function.
  
**Returns**: Bitwise OR of parameters
  
## Structures

### ApplicationInfo 
A struct that includes application specific information.

 Fields                        | Descriptions                                
--------------------------------|---------------------------------------------
 public std::string applicationId  |  Application identifier as set in the Azure AD portal.
 public std::string applicationName  |  Application name
 public std::string applicationVersion  |  The version of the application being used
  
### mip::PublishingLicenseContext 
Holds the details of a Publishing License used to create a protection handler.
  
 Fields                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::vector<uint8_t> licenseInfo  | _Not yet documented._
public const std::vector<uint8_t> serializedPublishingLicense  | _Not yet documented._
public PublishingLicenseContext(const std::vector<uint8_t>& licenseInfo, const std::vector<uint8_t>& serializedPublishingLicense)  | _Not yet documented._
  
