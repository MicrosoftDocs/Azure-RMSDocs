---
title: Structures
description: Structures.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference

ms.author: mbaldwin
ms.date: 11/1/2019
---

# Structures

## mip_cc_application_info

From [application_info_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/application_info_cc.h)

ApplicationInfo definition

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

From [auth_callback_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/auth_callback_cc.h)

Defines auth callback functions

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

## mip_cc_guid

From [common_types_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/common_types_cc.h)

A file Containing the common types used by the upe, file and protection modules.

```c
typedef struct {
  char guid[37];
} mip_cc_guid;

```

## mip_cc_kv_pair

From [dictionary_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/dictionary_cc.h)

Contains C API definitions for common string dictionary.

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

## mip_cc_http_header

From [http_delegate_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/http_delegate_cc.h)

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

From [http_delegate_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/http_delegate_cc.h)

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

From [http_delegate_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/http_delegate_cc.h)

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

From [identity_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/identity_cc.h)

Identity definition

| Field | Description |
|---|---|
| email | User email address  |


```c
typedef struct {
  const char* email;          
} mip_cc_identity;

```

## mip_cc_feature_override

From [mip_context_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/mip_context_cc.h)

Defines C-Style MipContext functions

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

From [protection_descriptor_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection_descriptor_cc.h)

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

From [protection_descriptor_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection_descriptor_cc.h)

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

From [task_dispatcher_delegate_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/task_dispatcher_delegate_cc.h)

Defines task dispatcher callback functions

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

From [upe/application_action_state_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/application_action_state_cc.h)

Represents the current state of the application as it performs a label-related operation

| Field | Description |
|---|---|
| actionState | Describes if/how an application is attempting to change label state.  |
| newLabel | If 'actionType' is 'UPDATE': New label.  |
| newLabelExtendedProperties | If 'actionType' is 'UPDATE': Additional properties to be written to metadata.  |
| newLabelAssignementMethod | If 'actionType' is 'UPDATE': The method of assignment of the new label.  |
| isDowngradeJustified | If 'actionType' is 'UPDATE': Whether or not a label downgrade has been justified by user.  |
| downgradeJustification | If 'actionType' is 'UPDATE': Label downgrade justification text provided by user.  |
| supportedActions | Enum mask describing the label-related actions an application is able to perform.  |


```c
typedef struct {
  mip_cc_label_action_state actionState;                    
  mip_cc_label newLabel;                                    
  mip_cc_dictionary newLabelExtendedProperties;             
  mip_cc_label_assignment_method newLabelAssignementMethod; 
  bool isDowngradeJustified;                                
  const char* downgradeJustification;                       
  mip_cc_label_action_type supportedActions;                
} mip_cc_application_action_state;

```

## mip_cc_document_state

From [upe/document_state_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/document_state_cc.h)

Callback function definition for retrieving document metatdata, filtered by name/prefix

```c
typedef struct {
  /**
   * Human-readable document description visible in tenant audit portal
   *     Example for a file: [path\filename]
   *     Example for an email: [Subject:Sender]
   */
  const char* contentId;

  /**
   * State of document data as application interacts with it
   */
  mip_cc_data_state dataState;

  /**
   * Document metadata callback
   */
  mip_cc_metadata_callback contentMetadataCallback;

  /**
   * Protection descriptor if document is currently protected, else null
   */
  mip_cc_protection_descriptor protectionDescriptor;

  /**
   * Format of document (file vs. email)
   */
  mip_cc_content_format contentFormat;

  /**
   * Optional application-specific metadata that is used when sending audit reports
   *     Recognized values:
   *       'Sender': Sender email address
   *       'Recipients': JSON array of email recipients
   *       'LastModifiedBy': Email address of the user who last modified a document
   *       'LastModifiedDate': Date a document was last modified
   */
  mip_cc_dictionary auditMetadata;
} mip_cc_document_state;

```

