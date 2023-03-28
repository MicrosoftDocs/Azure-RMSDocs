---
title: Enumerations
description: Enumerations
author: msmbaldwin
ms.service: information-protection
ms.topic: reference

ms.author: mbaldwin
ms.date: 11/14/2022
---

# Enumerations

## mip_cc_cache_storage_type

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

A user's response when consent is requested to connect to an unrecognized service endpoint

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

Defines new features by name

| Field | Description |
|---|---|
|  MIP_FLIGHTING_FEATURE_SERVICE_DISCOVERY = 0          | Rely on separate HTTP call to determine RMS service endpoints (default false) |
|  MIP_FLIGHTING_FEATURE_AUTH_INFO_CACHE = 1            | Cache OAuth2 challenges per domain/tenant to reduce unnecessary 401 responses. Disable for apps/services that manage their own HTTP auth (default true)  |
|  MIP_FLIGHTING_FEATURE_LINUX_ENCRYPTED_CACHE = 2      | Enable encrypted caching for Linux platforms (default false)  |
|  MIP_FLIGHTING_FEATURE_SINGLE_DOMAIN_NAME = 3         | Enable single company name for dns lookup (e.g. https://corprights)  |
|  MIP_FLIGHTING_FEATURE_POLICY_AUTH = 4                | Enable automatic HTTP authentication for requests sent to Policy service. Disable for apps/services that manage their own HTTP auth (default true)  |
|  MIP_FLIGHTING_FEATURE_URL_REDIRECT_CACHE = 5         | Cache URL redirects to reduce number of HTTP operations  |
|  MIP_FLIGHTING_FEATURE_PRE_LICENSE = 6                | Enable pre license api check  |
|  MIP_FLIGHTING_FEATURE_DOUBLE_KEY_PROTECTION = 7      | Enable double key protection feature to use a customer key to encrypt with  |
|  MIP_FLIGHTING_FEATURE_VARIABLE_POLICY_TTL = 8        | Enable variable policy ttl in storage  |
|  MIP_FLIGHTING_FEATURE_VARIABLE_TEXT_MARKING = 9      | Enable variable text marking  |
|  MIP_FLIGHTING_FEATURE_OPTIMIZE_PDF_MEMORY = 10       | Enable Optimize PDF Memory Creator in protect and unprotect PDF files  |
|  MIP_FLIGHTING_FEATURE_REMOVE_DELETED_LABEL_MD = 11   | Enable removing delete label's meta data  |
|  MIP_FLIGHTING_FEATURE_ENFORCE_TLS12 = 12             | Enforce TLS 1.2 for non-ADRMS HTTPS connections  |
|  MIP_FLIGHTING_FEATURE_KEEP_PDF_LINEARIZTION = 13     | Keep PDF file linearization after encrypted/decrypted by Optimize PDF Memory Creator |


```c
typedef enum {
  MIP_FLIGHTING_FEATURE_SERVICE_DISCOVERY = 0,         
  MIP_FLIGHTING_FEATURE_AUTH_INFO_CACHE = 1,           
  MIP_FLIGHTING_FEATURE_LINUX_ENCRYPTED_CACHE = 2,     
  MIP_FLIGHTING_FEATURE_SINGLE_DOMAIN_NAME = 3,        
  MIP_FLIGHTING_FEATURE_POLICY_AUTH = 4,               
  MIP_FLIGHTING_FEATURE_URL_REDIRECT_CACHE = 5,        
  MIP_FLIGHTING_FEATURE_PRE_LICENSE = 6,               
  MIP_FLIGHTING_FEATURE_DOUBLE_KEY_PROTECTION = 7,     
  MIP_FLIGHTING_FEATURE_VARIABLE_POLICY_TTL = 8,       
  MIP_FLIGHTING_FEATURE_VARIABLE_TEXT_MARKING = 9,     
  MIP_FLIGHTING_FEATURE_OPTIMIZE_PDF_MEMORY = 10,      
  MIP_FLIGHTING_FEATURE_REMOVE_DELETED_LABEL_MD = 11,  
  MIP_FLIGHTING_FEATURE_ENFORCE_TLS12 = 12,            
  MIP_FLIGHTING_FEATURE_KEEP_PDF_LINEARIZTION = 13,    
} mip_cc_flighting_feature;

```

## mip_cc_http_request_type

HTTP request type

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

Log level

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

A description of whether protection is defined by a template or ad-hoc

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

API success/failure result

| Field | Description |
|---|---|
|  MIP_RESULT_ERROR_UNKNOWN = 1                     | Unknown error  |
|  MIP_RESULT_ERROR_INSUFFICIENT_BUFFER = 2         | Buffer provided by application is too small  |
|  MIP_RESULT_ERROR_BAD_INPUT = 3                   | Application passed bad input  |
|  MIP_RESULT_ERROR_FILE_IO_ERROR = 4               | General file i/o error  |
|  MIP_RESULT_ERROR_NETWORK = 5                     | General network error (e.g. unreachable service)  |
|  MIP_RESULT_ERROR_INTERNAL = 6                    | Unexpected internal error  |
|  MIP_RESULT_ERROR_JUSTIFICATION_REQUIRED = 7      | Justification should be provided to complete the action on the file.  |
|  MIP_RESULT_ERROR_NOT_SUPPORTED_OPERATION = 8     | Opeation is not supported  |
|  MIP_RESULT_ERROR_PRIVILEGED_REQUIRED = 9         | Cannot override privileged label when with standard method  |
|  MIP_RESULT_ERROR_ACCESS_DENIED = 10              | User does not have rights to access the service  |
|  MIP_RESULT_ERROR_CONSENT_DENIED = 11             | An operation that required consent from the user was not granted consent  |
|  MIP_RESULT_ERROR_NO_PERMISSIONS = 12             | The user could not get access to the content (e.g. no permissions, content revoked)  |
|  MIP_RESULT_ERROR_NO_AUTH_TOKEN = 13              | The user could not get access to the content due to an empty auth token  |
|  MIP_RESULT_ERROR_SERVICE_DISABLED = 14           | The user could not get access to the content due to the service being disabled  |
|  MIP_RESULT_ERROR_PROXY_AUTH = 15                 | Proxy authentication failed  |
|  MIP_RESULT_ERROR_NO_POLICY = 16                  | No policy is configured for user/tenant  |
|  MIP_RESULT_ERROR_OPERATION_CANCELLED = 17        | Operation cancelled  |
|  MIP_RESULT_ERROR_ADHOC_PROTECTION_REQUIRED = 18  | Ad-hoc protection should be set to complete the action on the file  |
|  MIP_RESULT_ERROR_DEPRECATED_API = 19             | Caller invoked a deprecated API  |
|  MIP_RESULT_ERROR_TEMPLATE_NOT_FOUND = 20         | Template ID is not recognized  |
|  MIP_RESULT_ERROR_LABEL_NOT_FOUND = 21            | Label ID is not recognized  |
|  MIP_RESULT_ERROR_LABEL_DISABLED = 22             | Label is disabled or inactive  |
|  MIP_RESULT_ERROR_DOUBLE_KEY_DISABLED = 23        | The double key feature has not been enabled  |


```c
typedef enum {
  MIP_RESULT_SUCCESS = 0,

  // MIP C API errors
  MIP_RESULT_ERROR_UNKNOWN = 1,                    
  MIP_RESULT_ERROR_INSUFFICIENT_BUFFER = 2,        

  // MIP C++ exceptions
  MIP_RESULT_ERROR_BAD_INPUT = 3,                  
  MIP_RESULT_ERROR_FILE_IO_ERROR = 4,              
  MIP_RESULT_ERROR_NETWORK = 5,                    
  MIP_RESULT_ERROR_INTERNAL = 6,                   
  MIP_RESULT_ERROR_JUSTIFICATION_REQUIRED = 7,     
  MIP_RESULT_ERROR_NOT_SUPPORTED_OPERATION = 8,    
  MIP_RESULT_ERROR_PRIVILEGED_REQUIRED = 9,        
  MIP_RESULT_ERROR_ACCESS_DENIED = 10,             
  MIP_RESULT_ERROR_CONSENT_DENIED = 11,            
  MIP_RESULT_ERROR_NO_PERMISSIONS = 12,            
  MIP_RESULT_ERROR_NO_AUTH_TOKEN = 13,             
  MIP_RESULT_ERROR_SERVICE_DISABLED = 14,          
  MIP_RESULT_ERROR_PROXY_AUTH = 15,                
  MIP_RESULT_ERROR_NO_POLICY = 16,                 
  MIP_RESULT_ERROR_OPERATION_CANCELLED = 17,       
  MIP_RESULT_ERROR_ADHOC_PROTECTION_REQUIRED = 18, 
  MIP_RESULT_ERROR_DEPRECATED_API = 19,            
  MIP_RESULT_ERROR_TEMPLATE_NOT_FOUND = 20,        
  MIP_RESULT_ERROR_LABEL_NOT_FOUND = 21,           
  MIP_RESULT_ERROR_LABEL_DISABLED = 22,            
  MIP_RESULT_ERROR_DOUBLE_KEY_DISABLED = 23,       
} mip_cc_result;

```

## mip_cc_cipher_mode

Cipher mode identifier

| Field | Description |
|---|---|
|  MIP_CIPHER_MODE_CBC4K = 0               | CBC 4K mode with internal padding  |
|  MIP_CIPHER_MODE_ECB = 1                 | ECB mode  |
|  MIP_CIPHER_MODE_CBC512NOPADDING = 2     | CBC 512 mode with external (client) padding  |
|  MIP_CIPHER_MODE_CBC4KNOPADDING = 3       | CBC 4K mode with external (client) padding  |


```c
typedef enum {
  MIP_CIPHER_MODE_CBC4K = 0,              
  MIP_CIPHER_MODE_ECB = 1,                
  MIP_CIPHER_MODE_CBC512NOPADDING = 2,    
  MIP_CIPHER_MODE_CBC4KNOPADDING = 3      
} mip_cc_cipher_mode;

```

## mip_cc_pre_license_format

Defines pre-license format

| Field | Description |
|---|---|
|  MIP_PRE_LICENSE_FORMAT_XML = 0   | Legacy XML/SOAP format used by MSIPC  |
|  MIP_PRE_LICENSE_FORMAT_JSON = 1  | JSON/REST format used by MIP SDK and RMS SDK  |


```c
typedef enum {
  MIP_PRE_LICENSE_FORMAT_XML = 0,  
  MIP_PRE_LICENSE_FORMAT_JSON = 1, 
} mip_cc_pre_license_format;

```

## mip_cc_action_type

Action type bit mask

| Field | Description |
|---|---|
|  MIP_ACTION_TYPE_ADD_CONTENT_FOOTER = 1 &lt;&lt; 0         | Add a content footer to the document action type. |
|  MIP_ACTION_TYPE_ADD_CONTENT_HEADER = 1 &lt;&lt; 1         | Add a content header to the document action type. |
|  MIP_ACTION_TYPE_ADD_WATERMARK = 1 &lt;&lt; 2              | Add a water mark to the entire document action type. |
|  MIP_ACTION_TYPE_CUSTOM = 1 &lt;&lt; 3                     | A custom defined action type. |
|  MIP_ACTION_TYPE_JUSTIFY = 1 &lt;&lt; 4                    | A justify action type. |
|  MIP_ACTION_TYPE_METADATA = 1 &lt;&lt; 5                   | A Meta data change action type. |
|  MIP_ACTION_TYPE_PROTECT_ADHOC = 1 &lt;&lt; 6              | A protect by adhoc policy action type. |
|  MIP_ACTION_TYPE_PROTECT_BY_TEMPLATE = 1 &lt;&lt; 7        | A protect by template action type. |
|  MIP_ACTION_TYPE_PROTECT_DO_NOT_FORWARD = 1 &lt;&lt; 8     | A protect by do not forward action type. |
|  MIP_ACTION_TYPE_REMOVE_CONTENT_FOOTER = 1 &lt;&lt; 9      | Remove content footer action type. |
|  MIP_ACTION_TYPE_REMOVE_CONTENT_HEADER = 1 &lt;&lt; 10     | Remove content header action type. |
|  MIP_ACTION_TYPE_REMOVE_PROTECTION = 1 &lt;&lt; 11         | Remove protection action type. |
|  MIP_ACTION_TYPE_REMOVE_WATERMARK = 1 &lt;&lt; 12          | Remove watermarking action type. |
|  MIP_ACTION_TYPE_APPLY_LABEL = 1 &lt;&lt; 13               | Apply label action type. |
|  MIP_ACTION_TYPE_RECOMMEND_LABEL = 1 &lt;&lt; 14           | Recommend label action type. |
|  MIP_ACTION_TYPE_PROTECT_ADHOC_DK = 1 &lt;&lt; 15          | A protect by adhoc policy action type. |
|  MIP_ACTION_TYPE_PROTECT_DO_NOT_FORWARD_DK = 1 &lt;&lt; 17 | A protect by do not forward action type. |
|  MIP_ACTION_TYPE_PROTECT_BY_ENCRYPT_ONLY = 1 &lt;&lt; 18   | A protect by encryption action type. |


```c
typedef enum {
  MIP_ACTION_TYPE_ADD_CONTENT_FOOTER = 1 &lt;&lt; 0,        
  MIP_ACTION_TYPE_ADD_CONTENT_HEADER = 1 &lt;&lt; 1,        
  MIP_ACTION_TYPE_ADD_WATERMARK = 1 &lt;&lt; 2,             
  MIP_ACTION_TYPE_CUSTOM = 1 &lt;&lt; 3,                    
  MIP_ACTION_TYPE_JUSTIFY = 1 &lt;&lt; 4,                   
  MIP_ACTION_TYPE_METADATA = 1 &lt;&lt; 5,                  
  MIP_ACTION_TYPE_PROTECT_ADHOC = 1 &lt;&lt; 6,             
  MIP_ACTION_TYPE_PROTECT_BY_TEMPLATE = 1 &lt;&lt; 7,       
  MIP_ACTION_TYPE_PROTECT_DO_NOT_FORWARD = 1 &lt;&lt; 8,    
  MIP_ACTION_TYPE_REMOVE_CONTENT_FOOTER = 1 &lt;&lt; 9,     
  MIP_ACTION_TYPE_REMOVE_CONTENT_HEADER = 1 &lt;&lt; 10,    
  MIP_ACTION_TYPE_REMOVE_PROTECTION = 1 &lt;&lt; 11,        
  MIP_ACTION_TYPE_REMOVE_WATERMARK = 1 &lt;&lt; 12,         
  MIP_ACTION_TYPE_APPLY_LABEL = 1 &lt;&lt; 13,              
  MIP_ACTION_TYPE_RECOMMEND_LABEL = 1 &lt;&lt; 14,          
  MIP_ACTION_TYPE_PROTECT_ADHOC_DK = 1 &lt;&lt; 15,         
  // Reserved
  MIP_ACTION_TYPE_PROTECT_DO_NOT_FORWARD_DK = 1 &lt;&lt; 17,
  MIP_ACTION_TYPE_PROTECT_BY_ENCRYPT_ONLY = 1 &lt;&lt; 18,  
} mip_cc_action_type;

```

## mip_cc_label_action_state

Describes what the application is trying to do regarding the current label

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

Label-related actions an application understands and supports

| Field | Description |
|---|---|
|  MIP_LABEL_ACTION_TYPE_ADD_CONTENT_FOOTER = 1 &lt;&lt; 0      | Add a content footer to the document action type.  |
|  MIP_LABEL_ACTION_TYPE_ADD_CONTENT_HEADER = 1 &lt;&lt; 1      | Add a content header to the document action type.  |
|  MIP_LABEL_ACTION_TYPE_ADD_WATERMARK = 1 &lt;&lt; 2           | Add a water mark to the entire document action type.  |
|  MIP_LABEL_ACTION_TYPE_CUSTOM = 1 &lt;&lt; 3                  | A custom defined action type.  |
|  MIP_LABEL_ACTION_TYPE_JUSTIFY = 1 &lt;&lt; 4                 | A justify action type.  |
|  MIP_LABEL_ACTION_TYPE_METADATA = 1 &lt;&lt; 5                | A Meta data change action type.  |
|  MIP_LABEL_ACTION_TYPE_PROTECT_ADHOC = 1 &lt;&lt; 6           | A protect by adhoc policy action type.  |
|  MIP_LABEL_ACTION_TYPE_PROTECT_BY_TEMPLATE = 1 &lt;&lt; 7     | A protect by template action type.  |
|  MIP_LABEL_ACTION_TYPE_PROTECT_DO_NOT_FORWARD = 1 &lt;&lt; 8  | A protect by do not forward action type.  |
|  MIP_LABEL_ACTION_TYPE_REMOVE_CONTENT_FOOTER = 1 &lt;&lt; 9   | Remove content footer action type.  |
|  MIP_LABEL_ACTION_TYPE_REMOVE_CONTENT_HEADER = 1 &lt;&lt; 10  | Remove content header action type.  |
|  MIP_LABEL_ACTION_TYPE_REMOVE_PROTECTION = 1 &lt;&lt; 11      | Remove protection action type.  |
|  MIP_LABEL_ACTION_TYPE_REMOVE_WATERMARK = 1 &lt;&lt; 12       | Remove watermarking action type.  |
|  MIP_LABEL_ACTION_TYPE_APPLY_LABEL = 1 &lt;&lt; 13            | Apply label action type.  |
|  MIP_LABEL_ACTION_TYPE_RECOMMEND_LABEL = 1 &lt;&lt; 14        | Recommend label action type.  |
|  MIP_LABEL_ACTION_TYPE_PROTECT_ADHOC_DK = 1 &lt;&lt; 15       | A protect by adhoc policy action type. |
|  MIP_LABEL_ACTION_TYPE_PROTECT_DO_NOT_FORWARD_DK = 1 &lt;&lt; 17  | A protect by do not forward action type. |
|  MIP_LABEL_ACTION_TYPE_PROTECT_BY_ENCRYPT_ONLY = 1 &lt;&lt; 18    | A protect by encryption action type. |


```c
typedef enum {
  MIP_LABEL_ACTION_TYPE_ADD_CONTENT_FOOTER = 1 &lt;&lt; 0,     
  MIP_LABEL_ACTION_TYPE_ADD_CONTENT_HEADER = 1 &lt;&lt; 1,     
  MIP_LABEL_ACTION_TYPE_ADD_WATERMARK = 1 &lt;&lt; 2,          
  MIP_LABEL_ACTION_TYPE_CUSTOM = 1 &lt;&lt; 3,                 
  MIP_LABEL_ACTION_TYPE_JUSTIFY = 1 &lt;&lt; 4,                
  MIP_LABEL_ACTION_TYPE_METADATA = 1 &lt;&lt; 5,               
  MIP_LABEL_ACTION_TYPE_PROTECT_ADHOC = 1 &lt;&lt; 6,          
  MIP_LABEL_ACTION_TYPE_PROTECT_BY_TEMPLATE = 1 &lt;&lt; 7,    
  MIP_LABEL_ACTION_TYPE_PROTECT_DO_NOT_FORWARD = 1 &lt;&lt; 8, 
  MIP_LABEL_ACTION_TYPE_REMOVE_CONTENT_FOOTER = 1 &lt;&lt; 9,  
  MIP_LABEL_ACTION_TYPE_REMOVE_CONTENT_HEADER = 1 &lt;&lt; 10, 
  MIP_LABEL_ACTION_TYPE_REMOVE_PROTECTION = 1 &lt;&lt; 11,     
  MIP_LABEL_ACTION_TYPE_REMOVE_WATERMARK = 1 &lt;&lt; 12,      
  MIP_LABEL_ACTION_TYPE_APPLY_LABEL = 1 &lt;&lt; 13,           
  MIP_LABEL_ACTION_TYPE_RECOMMEND_LABEL = 1 &lt;&lt; 14,       
  MIP_LABEL_ACTION_TYPE_PROTECT_ADHOC_DK = 1 &lt;&lt; 15,      
  // Reserved
  MIP_LABEL_ACTION_TYPE_PROTECT_DO_NOT_FORWARD_DK = 1 &lt;&lt; 17, 
  MIP_LABEL_ACTION_TYPE_PROTECT_BY_ENCRYPT_ONLY = 1 &lt;&lt; 18,   
} mip_cc_label_action_type;

```

## mip_cc_data_state

Defines the state of the data as an application is acting upon it

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

