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

# Enumerations and Structures

## Namespace mip

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
enum WatermarkLayout       |  Layout for watermarks.
enum ContentMarkAlignment       |  Alignment for content marks (content header or content footer).
enum AssignmentMethod       |  The assignment method of the label on the document. Whether the Assignment of the label was done automatically, standard or as a privileged operation (The equivalent to an administrator operation).
enum ActionSource       |  defines what triggered the SetLabel event
enum DataState       |  Defines what state of the data is the application acting upon.
enum ContentFormat       |  Content format.
enum Consent       |  A user's response when consent is requested to connect to a service endpoint.
enum CacheStorageType       |  Storage type for the caches.
enum ErrorType       | _Not yet documented._
enum InspectorType       |  Inspector type correlating to supported file types.
enum BodyType       |  Body type enumerator.
enum FlightingFeature       |  Defines new features by name.
enum HttpRequestType       |  HTTP request type.
enum LogLevel       |  Different log levels used across the MIP SDK.
enum ProtectionHandlerCreationOptions       |  Bit flags that dictate additional policy creation behavior.
enum ProtectionType       |  Describes whether protection is based off a template or ad-hoc (custom)
enum ActionType       |  Different action types.
enum LabelState       | _Not yet documented._
enum ActionDataType       | _Not yet documented._
enum ConditionDataType       | _Not yet documented._
enum ContentMarkPlacement       | _Not yet documented._
enum LabelActionDataType       | _Not yet documented._
enum ProtectionActionType       | _Not yet documented._
struct mip::ApplicationInfo  |  A struct that includes application specific information.
struct mip::TelemetryConfiguration  |  Custom telemetry settings (not commonly used)


## Enumerations (mip)

### WatermarkLayout enum

Values                         | Descriptions                                
--------------------------------|---------------------------------------------
HORIZONTAL            | Watermark layout is horizontal
DIAGONAL            | Watermark layout is diagonal

Layout for watermarks.
  
### ContentMarkAlignment enum
Values                         | Descriptions                                
--------------------------------|---------------------------------------------
LEFT            | Content marking is aligned to the left
RIGHT            | Content marking is aligned to the right
CENTER            | Content marking is centered
Alignment for content marks (content header or content footer).
  
### AssignmentMethod enum
Values                         | Descriptions                                
--------------------------------|---------------------------------------------
STANDARD            | [Label](class_mip_label.md) assignment method is standard
PRIVILEGED            | [Label](class_mip_label.md) assignment method is privileged
AUTO            | [Label](class_mip_label.md) assignment method is automatic
The assignment method of the label on the document. Whether the Assignment of the label was done automatically, standard or as a privileged operation (The equivalent to an administrator operation).
  
### ActionSource enum
Values                         | Descriptions                                
--------------------------------|---------------------------------------------
MANUAL            | Selected manually by user
AUTOMATIC            | Set by policy conditions
RECOMMENDED            | Set by user after label was recommended by policy conditions
DEFAULT            | Set by default in policy
defines what triggered the SetLabel event
  
### DataState enum
Values                         | Descriptions                                
--------------------------------|---------------------------------------------
REST            | Inactive data stored physically in databases/file/warehouses
MOTION            | Data traversing a network or temporarily residing in computer memory to be read or updated
USE            | Active data under constant change stored physically in databases/file/warehouses etc
Defines what state of the data is the application acting upon.
  
### ContentFormat enum
Values                         | Descriptions                                
--------------------------------|---------------------------------------------
DEFAULT            | Content format is standard file format
EMAIL            | Content format is email format
Content format.
  
### Consent enum
Values                         | Descriptions                                
--------------------------------|---------------------------------------------
AcceptAlways            | Consent, and remember this decision
Accept            | Consent, just one time
Reject            | Do not consent
A user's response when consent is requested to connect to a service endpoint.
  
### CacheStorageType enum
Values                         | Descriptions                                
--------------------------------|---------------------------------------------
InMemory            | In Memory storage
OnDisk            | On Disk storage
OnDiskEncrypted            | On Disk storage with encryption (if supported by the platform)
Storage type for the caches.
  
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
NO_POLICY            | No policy is configured for user/tenant
OPERATION_CANCELLED            | Operation cancelled
ADHOC_PROTECTION_REQUIRED            | Adhoc protection should be set to complete the action on the file
DEPRECATED_API            | Caller invoked a deprecated API
TEMPLATE_NOT_FOUND            | Template ID is not recognized
LABEL_NOT_FOUND            | [Label](class_mip_label.md) ID is not recognized
LABEL_DISABLED            | [Label](class_mip_label.md) is disabled or inactive
  
### InspectorType enum
Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Unknown            | Unkown file inspector.
Msg            | Msg style file inspector, rpmsg / msg based.
Inspector type correlating to supported file types.
  
### BodyType enum
Values                         | Descriptions                                
--------------------------------|---------------------------------------------
UNKNOWN            | Unkown body type
TXT            | Text style body type, encoding is returned as utf8
HTML            | HTML style body type, encoding is returned as utf8
RTF            | RTF style body type, a binary format
Body type enumerator.
  
### FlightingFeature enum
Values                         | Descriptions                                
--------------------------------|---------------------------------------------
ServiceDiscovery            | Rely on separate HTTP call to determine RMS service endpoints
AuthInfoCache            | Cache OAuth2 challenges per domain/tenant to reduce unnecessary 401 responses. Disable for apps/services that manage their own HTTP auth (like SPO)
LinuxEncryptedCache            | Enable encrypted caching for Linux platforms (Please read the prerequisites for this feature)
Defines new features by name.
  
### HttpRequestType enum
Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Get            | GET
Post            | POST
HTTP request type.
  
### LogLevel enum
Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Trace            | 
Info            | 
Warning            | 
Error            | 
Different log levels used across the MIP SDK.
  
### ProtectionHandlerCreationOptions enum
Values                         | Descriptions                                
--------------------------------|---------------------------------------------
None            | None
OfflineOnly            | Do not allow UI and network operations
AllowAuditedExtraction            | Content can be opened in a non-protection-SDK-aware app
PreferDeprecatedAlgorithms            | Use deprecated crypto algorithms (ECB) for backwards compatibility
Bit flags that dictate additional policy creation behavior.
> Deprecated: This enum will soon be deprecated when CreateProtectionHandlerFromDescriptor and CreateProtectionHandlerFromPublishingLicense are removed
  
### ProtectionType enum
Values                         | Descriptions                                
--------------------------------|---------------------------------------------
TemplateBased            | Handle was created from a template
Custom            | Handle was created ad hoc
Describes whether protection is based off a template or ad-hoc (custom)
  
### ActionType enum
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
Different action types.
CUSTOM is the generic action type. Every other action type is a specific action with a specific meaning.
  
### LabelState enum
Values                         | Descriptions                                
--------------------------------|---------------------------------------------
NoChange            | 
Remove            | 
Update            | 
  
### ActionDataType enum
Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Custom            | 
Protection            | 
ContentMarking            | 
AddWatermark            | 
Label            | 
  
### ConditionDataType enum
Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Default            | 
Sensitivity            | 
  
### ContentMarkPlacement enum
Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Header            | 
Footer            | 
  
### LabelActionDataType enum
Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Recommend            | 
Apply            | 
  
### ProtectionActionType enum
Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Custom            | 
Template            | 
DoNotForward            | 
Adhoc            | 
DoNotForwardWithPrompt            | 
Hyok            | 
PredefinedTemplate            | 
RemoveProtection            | 
  


## Structures 

### mip::ApplicationInfo 
A struct that includes application specific information.
  
#### Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::string applicationId  |  Application identifier as set in the AAD portal, (Should be a GUID without brackets).
public std::string applicationName  |  Application name, (Should only containValid ASCII character excluding ';')
public std::string applicationVersion  |  The version of the application being used, (Should only containValid ASCII character excluding ';')
  
#### Members
  
##### applicationId struct member
Application identifier as set in the AAD portal, (Should be a GUID without brackets).
  
##### applicationName struct member
Application name, (Should only containValid ASCII character excluding ';')
  
##### applicationVersion struct member
The version of the application being used, (Should only containValid ASCII character excluding ';')

### mip::TelemetryConfiguration 
Custom telemetry settings (not commonly used)
  
#### Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::string hostNameOverride  |  Host telemetry instance name. If not set, MIP will act as its own host.
public std::string libraryNameOverride  |  Alternate telemetry library (DLL) filename.
public std::shared_ptr\<HttpDelegate\> httpDelegateOverride  |  If set, HTTP handling will be managed by this instance
public std::shared_ptr\<TaskDispatcherDelegate\> taskDispatcherDelegateOverride  |  If set, async task handling will be managed by this instance
public bool isNetworkDetectionEnabled  |  If set, telemetry component will ping network status on background thread
public bool isLocalCachingEnabled  |  If set, telemetry component will use on-disk caching
public bool isTelemetryOptedOut  |  If set, only necessary service data telemetry will be sent
  
#### Members
  
##### hostNameOverride struct member
Host telemetry instance name. If not set, MIP will act as its own host.
  
##### libraryNameOverride struct member
Alternate telemetry library (DLL) filename.
  
##### HttpDelegate
If set, HTTP handling will be managed by this instance
  
##### TaskDispatcherDelegate
If set, async task handling will be managed by this instance
  
##### isNetworkDetectionEnabled struct member
If set, telemetry component will ping network status on background thread
  
##### isLocalCachingEnabled struct member
If set, telemetry component will use on-disk caching
  
##### isTelemetryOptedOut struct member
If set, only necessary service data telemetry will be sent