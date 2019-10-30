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

## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
enum WatermarkLayout       |  Layout for watermarks.
enum ContentMarkAlignment       |  Alignment for content marks (content header or content footer).
enum AssignmentMethod       |  The assignment method of the label on the document. Whether the Assignment of the label was done automatically, standard or as a privileged operation (The equivalent to an administrator operation).
enum ActionSource       |  defines what triggered the SetLabel event
enum DataState       |  Defines what state of the data is the application acting upon.
enum ContentFormat       |  Content format.
enum LabelFilterType       |  Label filter types, optional set of properties that can be used to filter labels when calling list sensitivity labels.
enum Consent       |  A user's response when consent is requested to connect to a service endpoint.
enum CacheStorageType       |  Storage type for the caches.
enum PFileExtensionBehavior       |  Describes PFile extensions behavior.
enum ErrorType       | Not yet documented.
enum InspectorType       |  Inspector type correlating to supported file types.
enum BodyType       |  Body type enumerator.
enum FlightingFeature       |  Defines new features by name.
enum HttpRequestType       |  HTTP request type.
enum LogLevel       |  Different log levels used across the MIP SDK.
enum ProtectionType       |  Describes whether protection is based off a template or ad-hoc (custom)
enum ActionType       |  Different action types.
enum LabelState       | Not yet documented.
enum ActionDataType       | Not yet documented.
enum ConditionDataType       | Not yet documented.
enum ContentMarkPlacement       | Not yet documented.
enum LabelActionDataType       | Not yet documented.
enum ProtectionActionType       | Not yet documented.
struct mip::ApplicationInfo  |  A struct that includes application specific information.
struct mip::TelemetryConfiguration  |  Custom telemetry settings (not commonly used)

### Members (mip)

#### WatermarkLayout enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
HORIZONTAL            | Watermark layout is horizontal
DIAGONAL            | Watermark layout is diagonal
Layout for watermarks.
  
#### ContentMarkAlignment enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
LEFT            | Content marking is aligned to the left
RIGHT            | Content marking is aligned to the right
CENTER            | Content marking is centered
Alignment for content marks (content header or content footer).
  
#### AssignmentMethod enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
STANDARD            | Label assignment method is standard
PRIVILEGED            | Label assignment method is privileged
AUTO            | Label assignment method is automatic
The assignment method of the label on the document. Whether the Assignment of the label was done automatically, standard or as a privileged operation (The equivalent to an administrator operation).
  
#### ActionSource enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
MANUAL            | Selected manually by user
AUTOMATIC            | Set by policy conditions
RECOMMENDED            | Set by user after label was recommended by policy conditions
DEFAULT            | Set by default in policy
defines what triggered the SetLabel event
  
#### DataState enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
REST            | Inactive data stored physically in databases/file/warehouses
MOTION            | Data traversing a network or temporarily residing in computer memory to be read or updated
USE            | Active data under constant change stored physically in databases/file/warehouses etc
Defines what state of the data is the application acting upon.
  
#### ContentFormat enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
DEFAULT            | Content format is standard file format
EMAIL            | Content format is email format
Content format.
  
#### LabelFilterType enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
None            | Disable default labeling filtration
Custom            | Filter labels that may result in custom protection
TemplateProtection            | Filter labels that may result in do not forward
DoNotForwardProtection            | Filter labels that may result in template protection
AdhocProtection            | Filter labels that may result in adhoc protection
HyokProtection            | Filter labels that may result in hyok protection
PredefinedTemplate            | Filter labels that may result in predefined template protection
Label filter types, optional set of properties that can be used to filter labels when calling list sensitivity labels.
  
#### Consent enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
AcceptAlways            | Consent, and remember this decision
Accept            | Consent, just one time
Reject            | Do not consent
A user's response when consent is requested to connect to a service endpoint.
  
#### CacheStorageType enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
InMemory            | In Memory storage
OnDisk            | On Disk storage
OnDiskEncrypted            | On Disk storage with encryption (if supported by the platform)
Storage type for the caches.
  
#### PFileExtensionBehavior enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Default            | Extensions will become as SDK default behavior
PFileSuffix            | Extensions will become <EXT>.PFILE
PPrefix            | Extensions will become P<EXT>
Describes PFile extensions behavior.
  
#### ErrorType enum
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
LABEL_NOT_FOUND            | Label ID is not recognized
LABEL_DISABLED            | Label is disabled or inactive
  
#### InspectorType enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Unknown            | Unkown file inspector.
Msg            | Msg style file inspector, rpmsg / msg based.
Inspector type correlating to supported file types.
  
#### BodyType enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
UNKNOWN            | Unkown body type
TXT            | Text style body type, encoding is returned as utf8
HTML            | HTML style body type, encoding is returned as utf8
RTF            | RTF style body type, a binary format
Body type enumerator.
  
#### FlightingFeature enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
ServiceDiscovery            | Rely on separate HTTP call to determine RMS service endpoints
AuthInfoCache            | Cache OAuth2 challenges per domain/tenant to reduce unnecessary 401 responses. Disable for apps/services that manage their own HTTP auth (like SPO, Edge)
LinuxEncryptedCache            | Enable encrypted caching for Linux platforms (Please read the prerequisites for this feature)
SingleDomainName            | Enable single company name for dns lookup. e.g. [https://corprights](https://corprights)
PolicyAuth            | Enable automatic HTTP authentication for requests sent to Policy service. Disable for apps/services that manage their own HTTP auth (like SPO, Edge)
Defines new features by name.
  
#### HttpRequestType enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Get            | GET
Post            | POST
HTTP request type.
  
#### LogLevel enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Trace            | 
Info            | 
Warning            | 
Error            | 
Different log levels used across the MIP SDK.
  
#### ProtectionType enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
TemplateBased            | Handle was created from a template
Custom            | Handle was created ad hoc
Describes whether protection is based off a template or ad-hoc (custom)
  
#### ActionType enum
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
  
#### LabelState enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
NoChange            | 
Remove            | 
Update            | 
  
#### ActionDataType enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Custom            | 
Protection            | 
ContentMarking            | 
AddWatermark            | 
Label            | 
  
#### ConditionDataType enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Default            | 
Sensitivity            | 
  
#### ContentMarkPlacement enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Header            | 
Footer            | 
  
#### LabelActionDataType enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Recommend            | 
Apply            | 
  
#### ProtectionActionType enum
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

## namespace mip::auditmetadatakeys
  
### Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::string Sender()       |  Audit metadata keys in string representation.
public std::string Recipients()       | Not yet documented.
public std::string LastModifiedBy()       | Not yet documented.
public std::string LastModifiedDate()       | Not yet documented.
  
### Members
  
#### Sender function
Audit metadata keys in string representation.
  
#### Recipients function
_Not documented yet._

  
#### LastModifiedBy function
_Not documented yet._

  
#### LastModifiedDate function
_Not documented yet._

## namespace mip::rights
  
### Summary
 
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::string Owner()       |  Gets string identifier for 'owner' right.
public std::string View()       |  Gets string identifier for 'view' right.
public std::string AuditedExtract()       |  Gets string identifier for 'audited extract' right.
public std::string Edit()       |  Gets string identifier for 'edit' right.
public std::string Export()       |  Gets string identifier for 'export' right.
public std::string Extract()       |  Gets string identifier for 'extract' right.
public std::string Print()       |  Gets string identifier for 'print' right.
public std::string Comment()       |  Gets string identifier for 'comment' right.
public std::string Reply()       |  Gets string identifier for 'reply' right.
public std::string ReplyAll()       |  Gets string identifier for 'reply all' right.
public std::string Forward()       |  Gets string identifier for 'forward' right.
public std::vector\<std::string\> EmailRights()       |  Gets a list of rights that apply to emails.
public std::vector\<std::string\> EditableDocumentRights()       |  Gets a list of rights that apply to documents.
public std::vector\<std::string\> CommonRights()       |  Gets a list of rights that apply in all scenarios.
  
### Members
  
#### Owner function
Gets string identifier for 'owner' right.

  
**Returns**: String identifier for 'owner' right
  
#### View function
Gets string identifier for 'view' right.

  
**Returns**: String identifier for 'view' right
  
#### AuditedExtract function
Gets string identifier for 'audited extract' right.

  
**Returns**: String identifier for 'audited extract' right
  
#### Edit function
Gets string identifier for 'edit' right.

  
**Returns**: String identifier for 'edit' right
  
#### Export function
Gets string identifier for 'export' right.

  
**Returns**: String identifier for 'export' right
  
#### Extract function
Gets string identifier for 'extract' right.

  
**Returns**: String identifier for 'extract' right
  
#### Print function
Gets string identifier for 'print' right.

  
**Returns**: String identifier for 'print' right
  
#### Comment function
Gets string identifier for 'comment' right.

  
**Returns**: String identifier for 'comment' right
  
#### Reply function
Gets string identifier for 'reply' right.

  
**Returns**: String identifier for 'reply' right
  
#### ReplyAll function
Gets string identifier for 'reply all' right.

  
**Returns**: String identifier for 'reply all' right
  
#### Forward function
Gets string identifier for 'forward' right.

  
**Returns**: String identifier for 'forward' right
  
#### EmailRights function
Gets a list of rights that apply to emails.

  
**Returns**: A list of rights that apply to emails
  
#### EditableDocumentRights function
Gets a list of rights that apply to documents.

  
**Returns**: A list of rights that apply to documents
  
#### CommonRights function
Gets a list of rights that apply in all scenarios.

  
**Returns**: A list of rights that apply in all scenarios

## namespace mip::roles
  
### Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::string Viewer()       |  Gets string identifier for 'viewer' role.
public std::string Reviewer()       |  Gets string identifier for 'reviewer' role.
public std::string Author()       |  Gets string identifier for 'author' role.
public std::string CoOwner()       |  Gets string identifier for 'co-owner' role.
  
### Members
  
#### Viewer function
Gets string identifier for 'viewer' role.

  
**Returns**: String identifier for 'viewer' role
A viewer can only view the content. They cannot edit, copy, or print it.
  
#### Reviewer function
Gets string identifier for 'reviewer' role.

  
**Returns**: String identifier for 'reviewer' role
A reviewer can view and edit the content. They cannot copy, or print it.
  
#### Author function
Gets string identifier for 'author' role.

  
**Returns**: String identifier for 'author' role
An author can view, edit, copy, and print the content.
  
#### CoOwner function
Gets string identifier for 'co-owner' role.

  
**Returns**: String identifier for 'co-owner' role
A co-owner has all permissions

