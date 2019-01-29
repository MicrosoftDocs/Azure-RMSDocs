---
title: Functions
description: Functions
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.date: 01/28/2019
ms.author: bryanla
---
# Functions

## Summary

| Functions by namespace scope   | Descriptions                                |
|--------------------------------|---------------------------------------------|
**Namespace `mip` :** |
public std::string GetAssignmentMethodString(AssignmentMethod method)       |  Converts AssignmentMethod enum to a string description.
public static std::string GetActionSourceString(ActionSource actionSource)       |  Get the action source name.
public static std::string GetContentStateString(mip::ContentState state)       |  Get the content state name.
public const std::string& GetCustomSettingPolicyDataName()       |  Name of the setting to explicitly specify policy data.
public const std::string& GetCustomSettingExportPolicyFileName()       |  Name of the setting to explicitly specify file path to export SCC policy data to.
public const std::string& GetCustomSettingSensitivityTypesDataName()       |  Name of the setting to explicitly specify sensitivity data.
public const std::string& GetCustomSettingPolicyDataFile()       |  Name of the setting to explicitly specify policy data file path.
public const std::string& GetCustomSettingSensitivityTypesDataFile()       |  Name of the setting to explicitly specify sensitivity types data file path.
public MIP_API void __CDECL ReleaseAllResources()       |  Release all resources (threads, etc) before shutdown.
public MIP_API std::shared_ptr\<mip::Stream\> CreateStreamFromStdStream(const std::shared_ptr\<std::istream\>& stdIStream)       |  Creates a [Stream](class_mip_stream.md) from a std::istream.
public MIP_API std::shared_ptr\<mip::Stream\> CreateStreamFromStdStream(const std::shared_ptr\<std::ostream\>& stdOStream)       |  Creates a [Stream](class_mip_stream.md) from a std::ostream.
public MIP_API std::shared_ptr\<mip::Stream\> CreateStreamFromStdStream(const std::shared_ptr\<std::iostream\>& stdIOStream)       |  Creates a [Stream](class_mip_stream.md) from a std::iostream.
public MIP_API std::shared_ptr\<mip::Stream\> CreateStreamFromBuffer(uint8_t* buffer, const int64_t size)       |  Creates an [Stream](class_mip_stream.md) from a buffer.
 | 
**Namespace `mip::auditmetadatakeys` :** |
public std::string Sender()       |  Audit metadata keys in string representation.
public std::string Recipients()       | _Not yet documented._
public std::string LastModifiedBy()       | _Not yet documented._
public std::string LastModifiedDate()       | _Not yet documented._
 | 
**Namespace `mip::rights` :** |
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
 | 
**Namespace `mip::roles` :** |
public std::string Viewer()       |  Gets string identifier for 'viewer' role.
public std::string Reviewer()       |  Gets string identifier for 'reviewer' role.
public std::string Author()       |  Gets string identifier for 'author' role.
public std::string CoOwner()       |  Gets string identifier for 'co-owner' role.



## Namespace `mip`

### GetAssignmentMethodString function
Converts AssignmentMethod enum to a string description.

Parameters:  
* **method**: an assignment method. 



  
**Returns**: A string description of the assignment method.
  
### GetActionSourceString function
Get the action source name.

Parameters:  
* **actionSource**: The action source. 



  
**Returns**: A string representation of the action source.
  
### GetContentStateString function
Get the content state name.

Parameters:  
* **actionSource**: The state of the content being worked upon. 



  
**Returns**: A string representation of the content state.
  
### GetCustomSettingPolicyDataName function
Name of the setting to explicitly specify policy data.

  
**Returns**: The custom settings key.
  
### GetCustomSettingExportPolicyFileName function
Name of the setting to explicitly specify file path to export SCC policy data to.

  
**Returns**: The custom settings key.
  
### GetCustomSettingSensitivityTypesDataName function
Name of the setting to explicitly specify sensitivity data.

  
**Returns**: The custom settings key.
  
### GetCustomSettingPolicyDataFile function
Name of the setting to explicitly specify policy data file path.

  
**Returns**: The custom settings key.
  
### GetCustomSettingSensitivityTypesDataFile function
Name of the setting to explicitly specify sensitivity types data file path.

  
**Returns**: The custom settings key.
  
### ReleaseAllResources function
Release all resources (threads, etc) before shutdown.
If MIP dynamic libraries are delay-loaded by an application, this function must be called before the application explicitly unloading those MIP libraries to avoid deadlock. For example, on win32, this function must be called before any calls to explictly unload MIP DLLs via FreeLibrary or __FUnloadDelayLoadedDLL2. Applications must release references to all MIP objects (for example, Profiles, Engines, Handlers) before calling this function.
  
### operator| function
ProtectionHandlerCreationOptions bitwise OR operator.

Parameters:  
* **a**: Left value 


* **b**: Right value



  
**Returns**: Bitwise OR of ProtectionHandlerCreationOptions
  
### CreateStreamFromStdStream function
Creates a [Stream](class_mip_stream.md) from a std::istream.

Parameters:  
* **stdIStream**: Backing std::istream



  
**Returns**: [Stream](class_mip_stream.md) wrapping a std::istream
  
### CreateStreamFromStdStream function
Creates a [Stream](class_mip_stream.md) from a std::ostream.

Parameters:  
* **stdOStream**: Backing std::ostream



  
**Returns**: [Stream](class_mip_stream.md) wrapping a std::ostream
  
### CreateStreamFromStdStream function
Creates a [Stream](class_mip_stream.md) from a std::iostream.

Parameters:  
* **stdIOStream**: Backing std::iostream



  
**Returns**: [Stream](class_mip_stream.md) wrapping a std::iostream
  
### CreateStreamFromBuffer function
Creates an [Stream](class_mip_stream.md) from a buffer.

Parameters:  
* **buffer**: Pointer to a buffer



  
**Returns**: Size Size of buffer
  



## Namespace `mip::auditmetadatakeys`

### Sender function
Audit metadata keys in string representation.
  
### Recipients function
_Not documented yet._

  
### LastModifiedBy function
_Not documented yet._
  
### LastModifiedDate function
_Not documented yet._





## Namespace `mip::rights`

### Owner function
Gets string identifier for 'owner' right.

  
**Returns**: String identifier for 'owner' right
  
### View function
Gets string identifier for 'view' right.

  
**Returns**: String identifier for 'view' right
  
### AuditedExtract function
Gets string identifier for 'audited extract' right.

  
**Returns**: String identifier for 'audited extract' right
  
### Edit function
Gets string identifier for 'edit' right.

  
**Returns**: String identifier for 'edit' right
  
### Export function
Gets string identifier for 'export' right.

  
**Returns**: String identifier for 'export' right
  
### Extract function
Gets string identifier for 'extract' right.

  
**Returns**: String identifier for 'extract' right
  
### Print function
Gets string identifier for 'print' right.

  
**Returns**: String identifier for 'print' right
  
### Comment function
Gets string identifier for 'comment' right.

  
**Returns**: String identifier for 'comment' right
  
### Reply function
Gets string identifier for 'reply' right.

  
**Returns**: String identifier for 'reply' right
  
### ReplyAll function
Gets string identifier for 'reply all' right.

  
**Returns**: String identifier for 'reply all' right
  
### Forward function
Gets string identifier for 'forward' right.

  
**Returns**: String identifier for 'forward' right
  
### EmailRights function
Gets a list of rights that apply to emails.

  
**Returns**: A list of rights that apply to emails
  
### EditableDocumentRights function
Gets a list of rights that apply to documents.

  
**Returns**: A list of rights that apply to documents
  
### CommonRights function
Gets a list of rights that apply in all scenarios.

  
**Returns**: A list of rights that apply in all scenarios




## Namespace `mip::roles`

### Viewer function
Gets string identifier for 'viewer' role.

  
**Returns**: String identifier for 'viewer' role
A viewer can only view the content. They cannot edit, copy, or print it.
  
### Reviewer function
Gets string identifier for 'reviewer' role.

  
**Returns**: String identifier for 'reviewer' role
A reviewer can view and edit the content. They cannot copy, or print it.
  
### Author function
Gets string identifier for 'author' role.

  
**Returns**: String identifier for 'author' role
An author can view, edit, copy, and print the content.
  
### CoOwner function
Gets string identifier for 'co-owner' role.

  
**Returns**: String identifier for 'co-owner' role
A co-owner has all permissions
