---
title: Structures
description: Structures.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference

ms.author: mbaldwin
ms.date: 9/22/2020
---

# Structures

## mip_cc_application_info

A struct that includes application specific information 

| Field | Description |
|---|---|
| applicationId | Application identifier as set in the AAD portal, (Should be a GUID without brackets).  |
| applicationName | Application name, (Should only contain valid ASCII character excluding ';')  |
| applicationVersion | The version of the application being used, (Should only contain valid ASCII character excluding ';')   |


```c
typedef struct {
  const char* applicationId;      
  const char* applicationName;    
  const char* applicationVersion; 
} mip_cc_application_info;

```

## mip_cc_oauth2_challenge

Information provided by a server to generate an OAuth2 token

| Field | Description |
|---|---|
| authority | OAuth2 authority  |
| resource | OAuth2 resource  |
| scope | OAuth2 scope  |


```c
typedef struct {
  const char* authority; 
  const char* resource;  
  const char* scope;     
} mip_cc_oauth2_challenge;

```

## mip_cc_handle

Opaque handle to MIP object

| Field | Description |
|---|---|
| typeId | Magic number uniquely identifying s specific handle type  |
| data | Raw handle data  |


```c
typedef struct {
  uint32_t typeId; 
  void* data;      
} mip_cc_handle;

```

## mip_cc_guid

GUID

```c
typedef struct {
  char guid[37];
} mip_cc_guid;

```

## mip_cc_kv_pair

Key/value pair

| Field | Description |
|---|---|
| key | Key  |
| value | Value  |


```c
typedef struct {
  const char* key;   
  const char* value; 
} mip_cc_kv_pair;

```

## mip_cc_error

Error information

```c
typedef struct {
  mip_cc_result result;
  char description[ERROR_STRING_BUFFER_SIZE];

  // MIP_RESULT_ERROR_NETWORK details
  mip_cc_network_error_category networkError_Category;
  int32_t networkError_ResponseCode;

  // MIP_RESULT_ERROR_NO_PERMISSIONS details
  char noPermissionsError_Owner[ERROR_STRING_BUFFER_SIZE];
  char noPermissionsError_Referrer[ERROR_STRING_BUFFER_SIZE];

  // MIP_RESULT_ERROR_SERVICE_DISABLED details
  mip_cc_service_disabled_error_extent serviceDisabledError_Extent;
} mip_cc_error;

```

## mip_cc_http_header

HTTP request/response header

| Field | Description |
|---|---|
| name | Header name/key  |
| value | Header value  |


```c
typedef struct {
  const char* name;  
  const char* value; 
} mip_cc_http_header;

```

## mip_cc_http_request

HTTP request

| Field | Description |
|---|---|
| id | Unique request ID--correlated with the same property in mip_cc_http_response  |
| type | HTTP request type (e.g. GET vs. POST)  |
| url | HTTP request URL  |
| bodySize | Size of HTTP request body in bytes  |
| body | Buffer containg HTTP request body  |
| headersCount | Number of HTTP request headers  |
| headers | Buffer containing HTTP request headers  |


```c
typedef struct {
  const char* id;                    
  mip_cc_http_request_type type;     
  const char* url;                   
  int64_t bodySize;                  
  const uint8_t* body;               
  int64_t headersCount;              
  const mip_cc_http_header* headers; 
} mip_cc_http_request;

```

## mip_cc_http_response

HTTP response

| Field | Description |
|---|---|
| id | Unique request ID--correlated with the same property in mip_cc_http_request  |
| statusCode | HTTP response status code  |
| bodySize | Size of HTTP response body in bytes  |
| body | Buffer containg HTTP response body  |
| headersCount | Number of HTTP response headers  |
| headers | Buffer containing HTTP response headers  |


```c
typedef struct {
  const char* id;                    
  int32_t statusCode;                
  int64_t bodySize;                  
  const uint8_t* body;               
  int64_t headersCount;              
  const mip_cc_http_header* headers; 
} mip_cc_http_response;

```

## mip_cc_identity

A struct that contains user identification info

| Field | Description |
|---|---|
| email | User email address  |
| name | User friendly name, used for content marking.  |


```c
typedef struct {
  const char* email;          
  const char* name;           
} mip_cc_identity;

```

## mip_cc_feature_override

Defines a single feature's enabled/disabled state

| Field | Description |
|---|---|
| feature | Feature name  |
| value | Enabled/disabled state  |


```c
typedef struct {
  mip_cc_flighting_feature feature; 
  bool value;                       
} mip_cc_feature_override;

```

## mip_cc_user_rights

A group of users and the rights associated with them

| Field | Description |
|---|---|
| users | List of users  |
| usersCount | Number of users  |
| rights | List of rights  |
| rightsCount | Number of rights  |


```c
typedef struct {
  const char** users;  
  int64_t usersCount;  
  const char** rights; 
  int64_t rightsCount; 
} mip_cc_user_rights;

```

## mip_cc_user_roles

A group of users and the roles associated with them

| Field | Description |
|---|---|
| users | List of users  |
| usersCount | Number of users  |
| roles | List of roles  |
| rolesCount | Number of roles  |


```c
typedef struct {
  const char** users;  
  int64_t usersCount;  
  const char** roles; 
  int64_t rolesCount; 
} mip_cc_user_roles;

```

## mip_cc_async_task

Defines a single async task dispatch request

| Field | Description |
|---|---|
| id | Task ID  |
| delayMs | Delay until task execution (in milliseconds)  |
| executeOnIndependentThread | Whether this task should execute on a completely independent thread or can re-use a shared thread  |


```c
typedef struct {
  const char* id;                   
  int64_t delayMs;                  
  bool executeOnIndependentThread;  
} mip_cc_async_task;

```

## mip_cc_application_action_state

Represents the current state of the application as it performs a label-related operation

| Field | Description |
|---|---|
| actionState | Describes if/how an application is attempting to change label state.  |
| newLabel | If 'actionType' is 'UPDATE': New label.  |
| newLabelExtendedProperties | If 'actionType' is 'UPDATE': Additional properties to be written to metadata.  |
| newLabelAssignmentMethod | If 'actionType' is 'UPDATE': The method of assignment of the new label.  |
| isDowngradeJustified | If 'actionType' is 'UPDATE': Whether or not a label downgrade has been justified by user.  |
| downgradeJustification | If 'actionType' is 'UPDATE': Label downgrade justification text provided by user.  |
| supportedActions | Enum mask describing the label-related actions an application is able to perform.  |


```c
typedef struct {
  mip_cc_label_action_state actionState;                    
  mip_cc_label newLabel;                                    
  mip_cc_dictionary newLabelExtendedProperties;             
  mip_cc_label_assignment_method newLabelAssignmentMethod;  
  bool isDowngradeJustified;                                
  const char* downgradeJustification;                       
  mip_cc_label_action_type supportedActions;                
} mip_cc_application_action_state;

```

## mip_cc_document_state

Callback function definition for retrieving document metatdata, filtered by name/prefix.

| Field | Description |
|---|---|
| dataState | State of document data as application interacts with it. |
| contentMetadataCallback | Document metadata callback. |
| protectionDescriptor | Protection descriptor if document is currently protected, else null.  |
| contentFormat | Format of document (file vs. email).  |
| auditMetadata | Optional application-specific metadata that is used when sending audit reports. Recognized values: 'Sender': Sender email address; 'Recipients': JSON array of email recipients; 'LastModifiedBy': Email address of the user who last modified a document; 'LastModifiedDate': Date a document was last modified  |
| contentMetadataVersion | Document metadata version, default should be 0.  |
| contentMetadataVersionFormat | Describes how metadata versioning is processed.  |

```c
typedef struct {

  const char* contentId;


  mip_cc_data_state dataState;

  mip_cc_metadata_callback contentMetadataCallback;

  mip_cc_protection_descriptor protectionDescriptor;

  mip_cc_content_format contentFormat;

  mip_cc_dictionary auditMetadata;

  uint32_t contentMetadataVersion;

  mip_cc_metadata_version_format contentMetadataVersionFormat;

} mip_cc_document_state;

```

## mip_cc_metadata_entry

Metadata entry

| Field | Description |
|---|---|
| key | Key entry |
| value | Value entry  |
| version | Version entry, should be initialized to 0 unless otherwise known |


```c
typedef struct {
  const char* key;        
  const char* value;      
  uint32_t version;       
} mip_cc_metadata_entry;

```

