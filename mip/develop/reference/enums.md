---
title: Enumerations
description: Enumerations.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference

ms.author: mbaldwin
ms.date: 11/1/2019
---

# Enumerations

## mip_cc_cache_storage_type

From [common_types_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/common_types_cc.h)

Storage type for caches

| Field | Description |
|---|---|
|  MIP_CACHE_STORAGE_TYPE_IN_MEMORY = 0         | In-memory storage  |
|  MIP_CACHE_STORAGE_TYPE_ON_DISK = 1           | On-disk storage  |
|  MIP_CACHE_STORAGE_TYPE_ON_DISK_ENCRYPTED = 2  | On-disk storage with encryption (if supported by the platform)  |


```c
typedef enum {
  MIP_CACHE_STORAGE_TYPE_IN_MEMORY = 0,        
  MIP_CACHE_STORAGE_TYPE_ON_DISK = 1,          
  MIP_CACHE_STORAGE_TYPE_ON_DISK_ENCRYPTED = 2 
} mip_cc_cache_storage_type;

```

## mip_cc_content_format

From [common_types_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/common_types_cc.h)

Content format

| Field | Description |
|---|---|
|  MIP_CONTENT_FORMAT_DEFAULT = 0  | Standard file format  |
|  MIP_CONTENT_FORMAT_EMAIL = 1    | Email  |


```c
typedef enum {
  MIP_CONTENT_FORMAT_DEFAULT = 0, 
  MIP_CONTENT_FORMAT_EMAIL = 1,   
} mip_cc_content_format;

```

## mip_cc_label_assignment_method

From [common_types_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/common_types_cc.h)

Describes how a new label is being applied

| Field | Description |
|---|---|
|  MIP_LABEL_ASSIGNMENT_METHOD_STANDARD = 0    | Standard label assignments will not override a previous privileged assignment.  |
|  MIP_LABEL_ASSIGNMENT_METHOD_PRIVILEGED = 1  | A privileged label assignment will not be overridden by future standard assignments.  |
|  MIP_LABEL_ASSIGNMENT_METHOD_AUTO = 2        | Reserved. Do not use.  |


```c
typedef enum {
  MIP_LABEL_ASSIGNMENT_METHOD_STANDARD = 0,   
  MIP_LABEL_ASSIGNMENT_METHOD_PRIVILEGED = 1, 
  MIP_LABEL_ASSIGNMENT_METHOD_AUTO = 2,       
} mip_cc_label_assignment_method;

```

## mip_cc_content_mark_alignment

From [common_types_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/common_types_cc.h)

Alignment for content marks (content header or content footer)

| Field | Description |
|---|---|
|  MIP_CONTENT_MARK_ALIGNMENT_LEFT = 0    | Content marking is aligned to the left  |
|  MIP_CONTENT_MARK_ALIGNMENT_RIGHT = 1   | Content marking is aligned to the right  |
|  MIP_CONTENT_MARK_ALIGNMENT_CENTER = 2  | Content marking is centered  |


```c
typedef enum {
  MIP_CONTENT_MARK_ALIGNMENT_LEFT = 0,   
  MIP_CONTENT_MARK_ALIGNMENT_RIGHT = 1,  
  MIP_CONTENT_MARK_ALIGNMENT_CENTER = 2, 
} mip_cc_content_mark_alignment;

```

## mip_cc_watermark_layout

From [common_types_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/common_types_cc.h)

Layout for watermarks

| Field | Description |
|---|---|
|  MIP_WATERMARK_LAYOUT_HORIZONTAL = 0  | Watermark layout is horizontal  |
|  MIP_WATERMARK_LAYOUT_DIAGONAL = 1    | Watermark layout is diagonal  |


```c
typedef enum {
  MIP_WATERMARK_LAYOUT_HORIZONTAL = 0, 
  MIP_WATERMARK_LAYOUT_DIAGONAL = 1,   
} mip_cc_watermark_layout;

```

## mip_cc_consent

From [consent_callback_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/consent_callback_cc.h)

Defines consent callback functions

| Field | Description |
|---|---|
|  MIP_CONSENT_ACCEPT_ALWAYS = 0  | Consent and remember this decision  |
|  MIP_CONSENT_ACCEPT = 1         | Consent just one time  |
|  MIP_CONSENT_REJECT = 2          | Do not consent  |


```c
typedef enum {
  MIP_CONSENT_ACCEPT_ALWAYS = 0, 
  MIP_CONSENT_ACCEPT = 1,        
  MIP_CONSENT_REJECT = 2         
} mip_cc_consent;

```

## mip_cc_flighting_feature

From [flighting_feature_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/flighting_feature_cc.h)

Flighting feature definition

| Field | Description |
|---|---|
|  MIP_FLIGHTING_FEATURE_SERVICE_DISCOVERY = 0      | Rely on separate HTTP call to determine RMS service endpoints (default false) |
|  MIP_FLIGHTING_FEATURE_AUTH_INFO_CACHE = 1        | Cache OAuth2 challenges per domain/tenant to reduce unnecessary 401 responses. Disable for apps/services that manage their own HTTP auth (default true)  |
|  MIP_FLIGHTING_FEATURE_LINUX_ENCRYPTED_CACHE = 2  | Enable encrypted caching for Linux platforms (default false)  |
|  MIP_FLIGHTING_FEATURE_SINGLE_DOMAIN_NAME = 3     | Enable single company name for dns lookup. e.g. https://corprights  |
|  MIP_FLIGHTING_FEATURE_POLICY_AUTH = 4            | Enable automatic HTTP authentication for requests sent to Policy service. Disable for apps/services that manage their own HTTP auth (default true)  |


```c
typedef enum {
  MIP_FLIGHTING_FEATURE_SERVICE_DISCOVERY = 0,     
  MIP_FLIGHTING_FEATURE_AUTH_INFO_CACHE = 1,       
  MIP_FLIGHTING_FEATURE_LINUX_ENCRYPTED_CACHE = 2, 
  MIP_FLIGHTING_FEATURE_SINGLE_DOMAIN_NAME = 3,    
  MIP_FLIGHTING_FEATURE_POLICY_AUTH = 4,           
} mip_cc_flighting_feature;

```

## mip_cc_http_request_type

From [http_delegate_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/http_delegate_cc.h)

Defines HTTP callback functions

| Field | Description |
|---|---|
|  HTTP_REQUEST_TYPE_GET = 0   | HTTP GET  |
|  HTTP_REQUEST_TYPE_POST = 1  | HTTP POST  |


```c
typedef enum {
  HTTP_REQUEST_TYPE_GET = 0,  
  HTTP_REQUEST_TYPE_POST = 1, 
} mip_cc_http_request_type;

```

## mip_cc_http_result

From [http_delegate_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/http_delegate_cc.h)

Success/failure state of the HTTP operation

| Field | Description |
|---|---|
|  HTTP_RESULT_OK = 0       | HTTP operation was completed successfull  |
|  HTTP_RESULT_FAILURE = 1  | HTTP operation failed (e.g. timeout, network failure, etc.)  |


```c
typedef enum {
  HTTP_RESULT_OK = 0,      
  HTTP_RESULT_FAILURE = 1, 
} mip_cc_http_result;

```

## mip_cc_log_level

From [logger_delegate_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/logger_delegate_cc.h)

Defines logger callback functions

| Field | Description |
|---|---|
|  MIP_LOG_LEVEL_TRACE = 0   | Trace  |
|  MIP_LOG_LEVEL_INFO        | Info  |
|  MIP_LOG_LEVEL_WARNING     | Warning  |
|  MIP_LOG_LEVEL_ERROR       | Error  |


```c
typedef enum {
  MIP_LOG_LEVEL_TRACE = 0,  
  MIP_LOG_LEVEL_INFO,       
  MIP_LOG_LEVEL_WARNING,    
  MIP_LOG_LEVEL_ERROR,      
} mip_cc_log_level;

```

## mip_cc_protection_type

From [protection_descriptor_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection_descriptor_cc.h)

Defines C-Style ProtectionDescriptor interface

| Field | Description |
|---|---|
|  MIP_PROTECTION_TYPE_TEMPLATE_BASED = 0  | Based on an RMS template  |
|  MIP_PROTECTION_TYPE_CUSTOM = 1          | Custom, ad-hoc protection  |


```c
typedef enum {
  MIP_PROTECTION_TYPE_TEMPLATE_BASED = 0, 
  MIP_PROTECTION_TYPE_CUSTOM = 1,         
} mip_cc_protection_type;

```

## mip_cc_result

From [result_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/result_cc.h)

Defines success/error result codes

| Field | Description |
|---|---|
|  MIP_RESULT_ERROR_UNKNOWN                    | Unknown error  |
|  MIP_RESULT_ERROR_INSUFFICIENT_BUFFER        | Buffer provided by application is too small  |
|  MIP_RESULT_ERROR_BAD_INPUT                  | Application passed bad input  |
|  MIP_RESULT_ERROR_FILE_IO_ERROR              | General file i/o error  |
|  MIP_RESULT_ERROR_NETWORK                    | General network error (e.g. unreachable service)  |
|  MIP_RESULT_ERROR_TRANSIENT_NETWORK          | Transient network error (e.g. bad gateway)  |
|  MIP_RESULT_ERROR_INTERNAL                   | Unexpected internal error  |
|  MIP_RESULT_ERROR_JUSTIFICATION_REQUIRED     | Justification should be provided to complete the action on the file.  |
|  MIP_RESULT_ERROR_NOT_SUPPORTED_OPERATION    | Opeation is not supported  |
|  MIP_RESULT_ERROR_PRIVILEGED_REQUIRED        | Cannot override privileged label when with standard method  |
|  MIP_RESULT_ERROR_ACCESS_DENIED              | User does not have rights to access the service  |
|  MIP_RESULT_ERROR_CONSENT_DENIED             | An operation that required consent from the user was not granted consent  |
|  MIP_RESULT_ERROR_POLICY_SYNC                | An attempt to sync policy data failed  |
|  MIP_RESULT_ERROR_NO_PERMISSIONS             | The user could not get access to the content (e.g. no permissions, content revoked)  |
|  MIP_RESULT_ERROR_NO_AUTH_TOKEN              | The user could not get access to the content due to an empty auth token  |
|  MIP_RESULT_ERROR_SERVICE_DISABLED           | The user could not get access to the content due to the service being disabled  |
|  MIP_RESULT_ERROR_PROXY_AUTH                 | Proxy authentication failed  |
|  MIP_RESULT_ERROR_NO_POLICY                  | No policy is configured for user/tenant  |
|  MIP_RESULT_ERROR_OPERATION_CANCELLED        | Operation cancelled  |
|  MIP_RESULT_ERROR_ADHOC_PROTECTION_REQUIRED  | Ad-hoc protection should be set to complete the action on the file  |
|  MIP_RESULT_ERROR_DEPRECATED_API             | Caller invoked a deprecated API  |
|  MIP_RESULT_ERROR_TEMPLATE_NOT_FOUND         | Template ID is not recognized  |
|  MIP_RESULT_ERROR_LABEL_NOT_FOUND            | Label ID is not recognized  |
|  MIP_RESULT_ERROR_LABEL_DISABLED             | Label is disabled or inactive  |


```c
typedef enum {
  MIP_RESULT_SUCCESS = 0,

  // MIP C API errors
  MIP_RESULT_ERROR_UNKNOWN,                   
  MIP_RESULT_ERROR_INSUFFICIENT_BUFFER,       

  // MIP C++ exceptions
  MIP_RESULT_ERROR_BAD_INPUT,                 
  MIP_RESULT_ERROR_FILE_IO_ERROR,             
  MIP_RESULT_ERROR_NETWORK,                   
  MIP_RESULT_ERROR_TRANSIENT_NETWORK,         
  MIP_RESULT_ERROR_INTERNAL,                  
  MIP_RESULT_ERROR_JUSTIFICATION_REQUIRED,    
  MIP_RESULT_ERROR_NOT_SUPPORTED_OPERATION,   
  MIP_RESULT_ERROR_PRIVILEGED_REQUIRED,       
  MIP_RESULT_ERROR_ACCESS_DENIED,             
  MIP_RESULT_ERROR_CONSENT_DENIED,            
  MIP_RESULT_ERROR_POLICY_SYNC,               
  MIP_RESULT_ERROR_NO_PERMISSIONS,            
  MIP_RESULT_ERROR_NO_AUTH_TOKEN,             
  MIP_RESULT_ERROR_SERVICE_DISABLED,          
  MIP_RESULT_ERROR_PROXY_AUTH,                
  MIP_RESULT_ERROR_NO_POLICY,                 
  MIP_RESULT_ERROR_OPERATION_CANCELLED,       
  MIP_RESULT_ERROR_ADHOC_PROTECTION_REQUIRED, 
  MIP_RESULT_ERROR_DEPRECATED_API,            
  MIP_RESULT_ERROR_TEMPLATE_NOT_FOUND,        
  MIP_RESULT_ERROR_LABEL_NOT_FOUND,           
  MIP_RESULT_ERROR_LABEL_DISABLED,            
} mip_cc_result;

```

## mip_cc_action_type

From [upe/action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/action_cc.h)

Contains C API definitions for label policy actions

| Field | Description |
|---|---|
|  MIP_ACTION_TYPE_ADD_CONTENT_FOOTER = 1 << 0      | Add a content footer to the document action type. |
|  MIP_ACTION_TYPE_ADD_CONTENT_HEADER = 1 << 1      | Add a content header to the document action type. |
|  MIP_ACTION_TYPE_ADD_WATERMARK = 1 << 2           | Add a water mark to the entire document action type. |
|  MIP_ACTION_TYPE_CUSTOM = 1 << 3                  | A custom defined action type. |
|  MIP_ACTION_TYPE_JUSTIFY = 1 << 4                 | A justify action type. |
|  MIP_ACTION_TYPE_METADATA = 1 << 5                | A Meta data change action type. |
|  MIP_ACTION_TYPE_PROTECT_ADHOC = 1 << 6           | A protect by adhoc policy action type. |
|  MIP_ACTION_TYPE_PROTECT_BY_TEMPLATE = 1 << 7     | A protect by template action type. |
|  MIP_ACTION_TYPE_PROTECT_DO_NOT_FORWARD = 1 << 8  | A protect by do not forward action type. |
|  MIP_ACTION_TYPE_REMOVE_CONTENT_FOOTER = 1 << 9   | Remove content footer action type. |
|  MIP_ACTION_TYPE_REMOVE_CONTENT_HEADER = 1 << 10  | Remove content header action type. |
|  MIP_ACTION_TYPE_REMOVE_PROTECTION = 1 << 11      | Remove protection action type. |
|  MIP_ACTION_TYPE_REMOVE_WATERMARK = 1 << 12       | Remove watermarking action type. |
|  MIP_ACTION_TYPE_APPLY_LABEL = 1 << 13            | Apply label action type. |
|  MIP_ACTION_TYPE_RECOMMEND_LABEL = 1 << 14        | Recommend label action type. |


```c
typedef enum {
  MIP_ACTION_TYPE_ADD_CONTENT_FOOTER = 1 << 0,     
  MIP_ACTION_TYPE_ADD_CONTENT_HEADER = 1 << 1,     
  MIP_ACTION_TYPE_ADD_WATERMARK = 1 << 2,          
  MIP_ACTION_TYPE_CUSTOM = 1 << 3,                 
  MIP_ACTION_TYPE_JUSTIFY = 1 << 4,                
  MIP_ACTION_TYPE_METADATA = 1 << 5,               
  MIP_ACTION_TYPE_PROTECT_ADHOC = 1 << 6,          
  MIP_ACTION_TYPE_PROTECT_BY_TEMPLATE = 1 << 7,    
  MIP_ACTION_TYPE_PROTECT_DO_NOT_FORWARD = 1 << 8, 
  MIP_ACTION_TYPE_REMOVE_CONTENT_FOOTER = 1 << 9,  
  MIP_ACTION_TYPE_REMOVE_CONTENT_HEADER = 1 << 10, 
  MIP_ACTION_TYPE_REMOVE_PROTECTION = 1 << 11,     
  MIP_ACTION_TYPE_REMOVE_WATERMARK = 1 << 12,      
  MIP_ACTION_TYPE_APPLY_LABEL = 1 << 13,           
  MIP_ACTION_TYPE_RECOMMEND_LABEL = 1 << 14,       
} mip_cc_action_type;

```

## mip_cc_label_action_state

From [upe/application_action_state_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/application_action_state_cc.h)

Describes application state when performing a label-releated operation

| Field | Description |
|---|---|
|  MIP_LABEL_ACTION_STATE_NO_CHANGE = 0  | The current label should not change.  |
|  MIP_LABEL_ACTION_STATE_REMOVE = 1     | The current label should be removed.  |
|  MIP_LABEL_ACTION_STATE_UPDATE = 2     | The current label should be changed.  |


```c
typedef enum {
  MIP_LABEL_ACTION_STATE_NO_CHANGE = 0, 
  MIP_LABEL_ACTION_STATE_REMOVE = 1,    
  MIP_LABEL_ACTION_STATE_UPDATE = 2,    
} mip_cc_label_action_state;

```

## mip_cc_label_action_type

From [upe/application_action_state_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/application_action_state_cc.h)

Label-related actions an application understands and supports

| Field | Description |
|---|---|
|  MIP_LABEL_ACTION_TYPE_ADD_CONTENT_FOOTER = 1 << 0      | Add a content footer to the document action type.  |
|  MIP_LABEL_ACTION_TYPE_ADD_CONTENT_HEADER = 1 << 1      | Add a content header to the document action type.  |
|  MIP_LABEL_ACTION_TYPE_ADD_WATERMARK = 1 << 2           | Add a water mark to the entire document action type.  |
|  MIP_LABEL_ACTION_TYPE_CUSTOM = 1 << 3                  | A custom defined action type.  |
|  MIP_LABEL_ACTION_TYPE_JUSTIFY = 1 << 4                 | A justify action type.  |
|  MIP_LABEL_ACTION_TYPE_METADATA = 1 << 5                | A Meta data change action type.  |
|  MIP_LABEL_ACTION_TYPE_PROTECT_ADHOC = 1 << 6           | A protect by adhoc policy action type.  |
|  MIP_LABEL_ACTION_TYPE_PROTECT_BY_TEMPLATE = 1 << 7     | A protect by template action type.  |
|  MIP_LABEL_ACTION_TYPE_PROTECT_DO_NOT_FORWARD = 1 << 8  | A protect by do not forward action type.  |
|  MIP_LABEL_ACTION_TYPE_REMOVE_CONTENT_FOOTER = 1 << 9   | Remove content footer action type.  |
|  MIP_LABEL_ACTION_TYPE_REMOVE_CONTENT_HEADER = 1 << 10  | Remove content header action type.  |
|  MIP_LABEL_ACTION_TYPE_REMOVE_PROTECTION = 1 << 11      | Remove protection action type.  |
|  MIP_LABEL_ACTION_TYPE_REMOVE_WATERMARK = 1 << 12       | Remove watermarking action type.  |
|  MIP_LABEL_ACTION_TYPE_APPLY_LABEL = 1 << 13            | Apply label action type.  |
|  MIP_LABEL_ACTION_TYPE_RECOMMEND_LABEL = 1 << 14        | Recommend label action type.  |


```c
typedef enum {
  MIP_LABEL_ACTION_TYPE_ADD_CONTENT_FOOTER = 1 << 0,     
  MIP_LABEL_ACTION_TYPE_ADD_CONTENT_HEADER = 1 << 1,     
  MIP_LABEL_ACTION_TYPE_ADD_WATERMARK = 1 << 2,          
  MIP_LABEL_ACTION_TYPE_CUSTOM = 1 << 3,                 
  MIP_LABEL_ACTION_TYPE_JUSTIFY = 1 << 4,                
  MIP_LABEL_ACTION_TYPE_METADATA = 1 << 5,               
  MIP_LABEL_ACTION_TYPE_PROTECT_ADHOC = 1 << 6,          
  MIP_LABEL_ACTION_TYPE_PROTECT_BY_TEMPLATE = 1 << 7,    
  MIP_LABEL_ACTION_TYPE_PROTECT_DO_NOT_FORWARD = 1 << 8, 
  MIP_LABEL_ACTION_TYPE_REMOVE_CONTENT_FOOTER = 1 << 9,  
  MIP_LABEL_ACTION_TYPE_REMOVE_CONTENT_HEADER = 1 << 10, 
  MIP_LABEL_ACTION_TYPE_REMOVE_PROTECTION = 1 << 11,     
  MIP_LABEL_ACTION_TYPE_REMOVE_WATERMARK = 1 << 12,      
  MIP_LABEL_ACTION_TYPE_APPLY_LABEL = 1 << 13,           
  MIP_LABEL_ACTION_TYPE_RECOMMEND_LABEL = 1 << 14,       
} mip_cc_label_action_type;

```

## mip_cc_data_state

From [upe/document_state_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/document_state_cc.h)

Describes document state when performing a label-releated operation

| Field | Description |
|---|---|
|  MIP_DATA_STATE_REST = 0    | Inactive data stored physically in databases/file/warehouses  |
|  MIP_DATA_STATE_MOTION = 1  | Data traversing a network or temporarily residing in computer memory to be read or updated  |
|  MIP_DATA_STATE_USE = 2     | Active data under constant change stored physically in databases/file/warehouses etc  |


```c
typedef enum {
  MIP_DATA_STATE_REST = 0,   
  MIP_DATA_STATE_MOTION = 1, 
  MIP_DATA_STATE_USE = 2,    
} mip_cc_data_state;

```

