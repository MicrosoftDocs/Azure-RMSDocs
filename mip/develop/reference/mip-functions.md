# Functions

| Functions (scope)              | Descriptions                                |
|--------------------------------|---------------------------------------------|
**common**
public const std::string& GetCustomSettingPolicyDataName()       |  Name of the setting to explicitly specify policy data.
public const std::string& GetCustomSettingExportPolicyFileName()       |  Name of the setting to explicitly specify file path to export SCC policy data to.
public const std::string& GetCustomSettingPolicyDataFile()       |  Name of the setting to explicitly specify policy data file path.
 **mip functions** |
public std::shared_ptr<mip::Stream> CreateStreamFromBuffer(uint8_t* buffer, const int64_t size)       |  Creates an [Stream](class_mip_stream.md) from a buffer.
public std::shared_ptr<mip::Stream> CreateStreamFromStdStream(const std::shared_ptr<std::iostream>& stdIOStream)       |  Creates a [Stream](class_mip_stream.md) from a std::iostream.
public std::shared_ptr<mip::Stream> CreateStreamFromStdStream(const std::shared_ptr<std::istream>& stdIStream)       |  Creates a [Stream](class_mip_stream.md) from a std::istream.
public std::shared_ptr<mip::Stream> CreateStreamFromStdStream(const std::shared_ptr<std::ostream>& stdOStream)       |  Creates a [Stream](class_mip_stream.md) from a std::ostream.
public void ReleaseAllResources()       |  Release all resources (threads, etc) prior to shutdown.
**mip::Rights functions**|
public std::string AuditedExtract()       |  Gets string identifier for 'audited extract' right.
public std::string Comment()       |  Gets string identifier for 'comment' right.
public std::vector<std::string> CommonRights()       |  Gets a list of rights that apply in all scenarios.
public std::string Edit()       |  Gets string identifier for 'edit' right.
public std::vector<std::string> EditableDocumentRights()       |  Gets a list of rights that apply to documents.
public std::vector<std::string> EmailRights()       |  Gets a list of rights that apply to emails.
public std::string Export()       |  Gets string identifier for 'export' right.
public std::string Extract()       |  Gets string identifier for 'extract' right.
public std::string Forward()       |  Gets string identifier for 'forward' right.
public std::string Owner()       |  Gets string identifier for 'owner' right.
public std::string Print()       |  Gets string identifier for 'print' right.
public std::string Reply()       |  Gets string identifier for 'reply' right.
public std::string ReplyAll()       |  Gets string identifier for 'reply all' right.
public std::string View()       |  Gets string identifier for 'view' right.
**mip::Roles functions**|
public std::string Author()       |  Gets string identifier for 'author' role.
public std::string CoOwner()       |  Gets string identifier for 'co-owner' role.
public std::string Reviewer()       |  Gets string identifier for 'reviewer' role.
public std::string Viewer()       |  Gets string identifier for 'viewer' role.

  
## Functions (common)

### GetCustomSettingPolicyDataName
Name of the setting to explicitly specify policy data.

  
**Returns**: The custom settings key.
  
### GetCustomSettingExportPolicyFileName
Name of the setting to explicitly specify file path to export SCC policy data to.

  
**Returns**: The custom settings key.
  
### GetCustomSettingPolicyDataFile
Name of the setting to explicitly specify policy data file path.

  
**Returns**: The custom settings key.

## Functions (mip)

### mip::CreateStreamFromBuffer(buffer)

Creates an [Stream](class_mip_stream.md) from a buffer.

Parameters:  
* **buffer**: Pointer to a buffer

**Returns**: **Size** of buffer
  

### mip::CreateStreamFromStdStream(istream)

Creates a [Stream](class_mip_stream.md) from a std::istream.

Parameters:  

* **stdIStream**: Backing std::istream
  
**Returns**: [Stream](class_mip_stream.md) wrapping a std::istream
  
### mip::CreateStreamFromStdStream(iostream)

Creates a [Stream](class_mip_stream.md) from a std::iostream.

Parameters:  
* **stdIOStream**: Backing std::iostream
  
**Returns**: [Stream](class_mip_stream.md) wrapping a std::iostream
  
### mip::CreateStreamFromStdStream(ostream)

Creates a [Stream](class_mip_stream.md) from a std::ostream.

Parameters:  
* **stdOStream**: Backing std::ostream
  
**Returns**: [Stream](class_mip_stream.md) wrapping a std::ostream
  
### mip::ReleaseAllResources

Release all resources (threads, etc) before shutdown.  

If MIP dynamic libraries are delay-loaded by an application, this function must be called before the application explicitly unloading those MIP libraries to avoid deadlock. For example, on win32, this function must be called before any calls to explictly unload MIP DLLs via FreeLibrary or \__FUnloadDelayLoadedDLL2. Applications must release references to all MIP objects (for example, Profiles, Engines, Handlers) before calling this function.

## Functions (mip::rights)

### Owner
Gets string identifier for 'owner' right.

  
**Returns**: String identifier for 'owner' right
  
### AuditedExtract
Gets string identifier for 'audited extract' right.

  
**Returns**: String identifier for 'audited extract' right
  
### Comment
Gets string identifier for 'comment' right.

  
**Returns**: String identifier for 'comment' right
  
### CommonRights
Gets a list of rights that apply in all scenarios.

  
**Returns**: A list of rights that apply in all scenarios

### Edit
Gets string identifier for 'edit' right.

  
**Returns**: String identifier for 'edit' right
  
### EditableDocumentRights
Gets a list of rights that apply to documents.

  
**Returns**: A list of rights that apply to documents
  
### EmailRights
Gets a list of rights that apply to emails.

  
**Returns**: A list of rights that apply to emails
  
### Export
Gets string identifier for 'export' right.

  
**Returns**: String identifier for 'export' right
  
### Extract
Gets string identifier for 'extract' right.

  
**Returns**: String identifier for 'extract' right
  
### Forward
Gets string identifier for 'forward' right.

  
**Returns**: String identifier for 'forward' right
  
### Print
Gets string identifier for 'print' right.

  
**Returns**: String identifier for 'print' right
  
### Reply
Gets string identifier for 'reply' right.

  
**Returns**: String identifier for 'reply' right
  
### ReplyAll
Gets string identifier for 'reply all' right.

  
**Returns**: String identifier for 'reply all' right
  
### View
Gets string identifier for 'view' right.

  
**Returns**: String identifier for 'view' right
  

## Functions (mip::roles)

### Author
Gets string identifier for 'author' role.

An author can view, edit, copy, and print the content.
  
**Returns**: String identifier for 'author' role
  
### CoOwner
Gets string identifier for 'co-owner' role.

A co-owner has all permissions
  
**Returns**: String identifier for 'co-owner' role

### Reviewer
Gets string identifier for 'reviewer' role.

A reviewer can view and edit the content. They cannot copy, or print it.
  
**Returns**: String identifier for 'reviewer' role
  
### Viewer
Gets string identifier for 'viewer' role.

A viewer can only view the content. They cannot edit, copy, or print it.
  
**Returns**: String identifier for 'viewer' role
  
