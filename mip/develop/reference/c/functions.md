---
title: Functions
description: Functions.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference

ms.author: mbaldwin
ms.date: 4/16/2020
---

# Functions

## mip_cc_auth_callback

callback function definition for acquiring OAuth2 token

**Parameters**

Parameter | Description
|---|---|
| identity | The email address for whom token will be acquired |
| challenge | OAuth2 challenge |
| context | Opaque application context that was passed to the MIP API that resulted in this auth callback |
| tokenBuffer | [Output] Buffer into which token will be copied. If null, 'actualTokenSize' will be populated, but |
| tokenBufferSize | Size (in bytes) of output buffer |
| actualTokenSize | [Output] Actual size (in bytes) of token |

**Return**: True is token was retrieved, else false

```c
MIP_CC_CALLBACK(mip_cc_auth_callback,
    bool,
    const mip_cc_identity*,
    const mip_cc_oauth2_challenge*,
    const void*,
    uint8_t*,
    const int64_t,
    int64_t*);
```

## mip_cc_consent_callback

callback function definition for consent from user to access external service endpoint

**Parameters**

Parameter | Description
|---|---|
| url | The URL for which the SDK requires user consent |

**Return**: User consent response

```c
MIP_CC_CALLBACK(mip_cc_consent_callback,
    mip_cc_consent,
    const char*);
```

## MIP_CC_CreateDictionary

Create a dictionary of string keys/values

**Parameters**

Parameter | Description
|---|---|
| entries | Array of key/value pairs |
| count | Number of key/value pairs |
| dictionary | [Output] Newly-created dictionary |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: A mip_cc_dictionary must be freed by calling MIP_CC_ReleaseDictionary 

```c
mip_cc_result MIP_CC_CreateDictionary(
    const mip_cc_kv_pair* entries,
    const int64_t count,
    mip_cc_dictionary* dictionary,
    mip_cc_error* errorInfo);
```

## MIP_CC_Dictionary_GetEntries

Get key/value pairs that compose a dictionary

**Parameters**

Parameter | Description
|---|---|
| dictionary | Source dictionary |
| entries | [Output] Array of key/value pairs, memory owned by mip_cc_dictionary object |
| count | [Output] Number of key/value pairs |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: The memory for 'entries' is owned by the mip_cc_dictionary object, so it should not be freed independently 

```c
mip_cc_result MIP_CC_Dictionary_GetEntries(
    const mip_cc_dictionary dictionary,
    mip_cc_kv_pair** entries,
    int64_t* count,
    mip_cc_error* errorInfo);
```

## MIP_CC_ReleaseDictionary

Release resources associated with a dictionary

**Parameters**

Parameter | Description
|---|---|
| dictionary | Dictionary to be released |

```c
void MIP_CC_ReleaseDictionary(mip_cc_dictionary dictionary);
```

## mip_cc_http_send_callback_fn

Callback function definition for issuing an HTTP request

**Parameters**

Parameter | Description
|---|---|
| request | The HTTP request to be performed by the application |
| context | The same opaque context passed to MIP API call that resulted in this HTTP request |

```c
MIP_CC_CALLBACK(mip_cc_http_send_callback_fn,
    void,
    const mip_cc_http_request*,
    const void*);
```

## mip_cc_http_cancel_callback_fn

Callback function definition for cancelling an HTTP request

**Parameters**

Parameter | Description
|---|---|
| requestId | The ID of the HTTP request to be cancelled |

```c
MIP_CC_CALLBACK(mip_cc_http_cancel_callback_fn,
    void,
    const char*);
```

## MIP_CC_CreateHttpDelegate

Creates an HTTP delegate which can be used to override MIP's default HTTP stack

**Parameters**

Parameter | Description
|---|---|
| sendCallback | Function pointer for issuing HTTP requests |
| cancelCallback | Function pointer for cancelling HTTP requests |
| httpDelegate | [Output] Handle to HTTP delegate object |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_CreateHttpDelegate(
    const mip_cc_http_send_callback_fn sendCallback,
    const mip_cc_http_cancel_callback_fn cancelCallback,
    mip_cc_http_delegate* httpDelegate,
    mip_cc_error* errorInfo);
```

## MIP_CC_NotifyHttpDelegateResponse

Notifies an HTTP delegate that an HTTP response is ready

**Parameters**

Parameter | Description
|---|---|
| httpDelegate | Handle to HTTP delegate object |
| requestId | ID of HTTP request associated with this operation |
| result | Success/failure state of operation |
| response | The HTTP response if operation succeeded, else nullptr |

**Note**: This function must be called by the application when an HTTP operation has completed. The ID of the HTTP response must match the ID of the HTTP request to allow MIP to correlate a response with its request 

```c
void MIP_CC_NotifyHttpDelegateResponse(
    const mip_cc_http_delegate httpDelegate,
    const char* requestId,
    const mip_cc_http_result result,
    const mip_cc_http_response* response);
```

## MIP_CC_ReleaseHttpDelegate

Release resources associated with an HTTP delegate handle

**Parameters**

Parameter | Description
|---|---|
| httpDelegate | HTTP delegate to be released |

```c
void MIP_CC_ReleaseHttpDelegate(mip_cc_http_delegate httpDelegate);
```

## mip_cc_logger_init_callback_fn

Callback function definition for initialization of logger

**Parameters**

Parameter | Description
|---|---|
| storagePath | File path where logs may be stored |

```c
MIP_CC_CALLBACK(mip_cc_logger_init_callback_fn,
    void,
    const char*);
```

## mip_cc_logger_write_callback_fn

Callback function definition for writing a log statement

**Parameters**

Parameter | Description
|---|---|
| level | the log level for the log statement. |
| message | the message for the log statement. |
| function | the function name for the log statement. |
| file | the file name where log statement was generated. |
| line | the line number where the log statement was generated. |

```c
MIP_CC_CALLBACK(mip_cc_logger_write_callback_fn,
    void,
    const mip_cc_log_level,
    const char*,
    const char*,
    const char*,
    const int32_t);
```

## MIP_CC_CreateLoggerDelegate

Creates a logger delegate which can be used to override MIP's default logger

**Parameters**

Parameter | Description
|---|---|
| initCallback | Function pointer for initialization |
| flushCallback | Function pointer for flushing logs |
| writeCallback | Function pointer for writing a log statement |
| loggerDelegate | [Output] Handle to logger delegate object |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_CreateLoggerDelegate(
    const mip_cc_logger_init_callback_fn initCallback,
    const mip_cc_logger_flush_callback_fn flushCallback,
    const mip_cc_logger_write_callback_fn writeCallback,
    mip_cc_logger_delegate* loggerDelegate,
    mip_cc_error* errorInfo);
```

## MIP_CC_ReleaseLoggerDelegate

Release resources associated with an logger delegate handle

**Parameters**

Parameter | Description
|---|---|
| loggerDelegate | logger delegate to be released |

```c
void MIP_CC_ReleaseLoggerDelegate(mip_cc_logger_delegate loggerDelegate);
```

## MIP_CC_CreateMipContext

Create a MIP context to manage state shared across all profile instances

**Parameters**

Parameter | Description
|---|---|
| applicationInfo | Info about application that is consuming the protection SDK |
| path | File path under which logging, telemetry, and other protection collateral is stored |
| logLevel | Minimum log level for .miplog |
| isOfflineOnly | Enable/disable network operations (not all actions supported when offline) |
| loggerDelegateOverride | (Optional) Logger override implementation |
| telemetryOverride | (Optional) Overridden telemetry settings. If NULL, default settings will be used |
| mipContext | [Output] Newly-created MIP context instance |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_CreateMipContext(
    const mip_cc_application_info* applicationInfo,
    const char* path,
    const mip_cc_log_level logLevel,
    const bool isOfflineOnly,
    const mip_cc_logger_delegate loggerDelegateOverride,
    const mip_cc_telemetry_configuration telemetryOverride,
    mip_cc_mip_context* mipContext,
    mip_cc_error* errorInfo);
```

## MIP_CC_CreateMipContextWithCustomFeatureSettings

Create a MIP context to manage state shared across all profile instances

**Parameters**

Parameter | Description
|---|---|
| applicationInfo | Info about application that is consuming the protection SDK |
| path | File path under which logging, telemetry, and other protection collateral is stored |
| logLevel | Minimum log level for .miplog |
| isOfflineOnly | Enable/disable network operations (not all actions supported when offline) |
| loggerDelegateOverride | (Optional) Logger override implementation |
| telemetryOverride | (Optional) Overridden telemetry settings. If NULL, default settings will be used |
| featureSettings | (Optional) Array of custom feature overrides |
| featureSettingsSize | Size of custom feature overrides (in # of overrides) |
| mipContext | [Output] Newly-created MIP context instance |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_CreateMipContextWithCustomFeatureSettings(
    const mip_cc_application_info* applicationInfo,
    const char* path,
    const mip_cc_log_level logLevel,
    const bool isOfflineOnly,
    const mip_cc_logger_delegate loggerDelegateOverride,
    const mip_cc_telemetry_configuration telemetryOverride,
    const mip_cc_feature_override* featureSettings,
    const int64_t featureSettingsSize,
    mip_cc_mip_context* mipContext,
    mip_cc_error* errorInfo);
```

## MIP_CC_ReleaseMipContext

Release resources associated with a MIP context

**Parameters**

Parameter | Description
|---|---|
| mipContext | MIP context to be released |

```c
void MIP_CC_ReleaseMipContext(mip_cc_mip_context mipContext);
```

## MIP_CC_ProtectionDescriptor_GetProtectionType

Gets type of protection, whether it is defined by an RMS template or not

**Parameters**

Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| protectionType | [Output] Protection type |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionDescriptor_GetProtectionType(
    const mip_cc_protection_descriptor protectionDescriptor,
    mip_cc_protection_type* protectionType,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionDescriptor_GetOwnerSize

Gets size of buffer required to store owner

**Parameters**

Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| ownerSize | [Output] Size of buffer to hold owner (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionDescriptor_GetOwnerSize(
    const mip_cc_protection_descriptor protectionDescriptor,
    int64_t* ownerSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionDescriptor_GetOwner

Gets protection owner

**Parameters**

Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| ownerBuffer | [Output] Buffer the owner will be copied into. |
| ownerBufferSize | Size (in number of chars) of the ownerBuffer. |
| actualOwnerSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If ownerBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualOwnerSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_ProtectionDescriptor_GetOwner(
    const mip_cc_protection_descriptor protectionDescriptor,
    char* ownerBuffer,
    const int64_t ownerBufferSize,
    int64_t* actualOwnerSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionDescriptor_GetNameSize

Gets size of buffer required to store name

**Parameters**

Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| nameSize | [Output] Size of buffer to hold name (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionDescriptor_GetNameSize(
    const mip_cc_protection_descriptor protectionDescriptor,
    int64_t* nameSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionDescriptor_GetName

Gets protection name

**Parameters**

Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| nameBuffer | [Output] Buffer the name will be copied into. |
| nameBufferSize | Size (in number of chars) of the nameBuffer. |
| actualNameSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If nameBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualNameSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_ProtectionDescriptor_GetName(
    const mip_cc_protection_descriptor protectionDescriptor,
    char* nameBuffer,
    const int64_t nameBufferSize,
    int64_t* actualNameSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionDescriptor_GetDescriptionSize

Gets size of buffer required to store description

**Parameters**

Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| descriptionSize | [Output] Size of buffer to hold description (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionDescriptor_GetDescriptionSize(
    const mip_cc_protection_descriptor protectionDescriptor,
    int64_t* descriptionSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionDescriptor_GetDescription

Gets protection description

**Parameters**

Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| descriptionBuffer | [Output] Buffer the description will be copied into. |
| descriptionBufferSize | Size (in number of chars) of the descriptionBuffer. |
| actualDescriptionSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If descriptionBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualDescriptionSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_ProtectionDescriptor_GetDescription(
    const mip_cc_protection_descriptor protectionDescriptor,
    char* descriptionBuffer,
    const int64_t descriptionBufferSize,
    int64_t* actualDescriptionSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionDescriptor_GetTemplateId

Gets template ID

**Parameters**

Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| templateId | [Output] Template ID associated with protection |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionDescriptor_GetTemplateId(
    const mip_cc_protection_descriptor protectionDescriptor,
    mip_cc_guid* templateId,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionDescriptor_GetLabelId

Gets label ID

**Parameters**

Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| labelId | [Output] Label ID associated with protection |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionDescriptor_GetLabelId(
    const mip_cc_protection_descriptor protectionDescriptor,
    mip_cc_guid* labelId,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionDescriptor_GetContentId

Gets content ID

**Parameters**

Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| contentId | [Output] Content ID associated with protection |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionDescriptor_GetContentId(
    const mip_cc_protection_descriptor protectionDescriptor,
    mip_cc_guid* contentId,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionDescriptor_DoesContentExpire

Gets whether or not content has an expiration time or not

**Parameters**

Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| doesContentExpire | [Output] Whether or not content expires |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionDescriptor_DoesContentExpire(
    const mip_cc_protection_descriptor protectionDescriptor,
    bool* doesContentExpire,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionDescriptor_GetContentValidUntil

Gets protection expiration time (in seconds since epoch)

**Parameters**

Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| contentValidUntil | [Output] Content expiration time (in seconds since epoch) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionDescriptor_GetContentValidUntil(
    const mip_cc_protection_descriptor protectionDescriptor,
    int64_t* contentValidUntil,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionDescriptor_DoesAllowOfflineAccess

Gets whether or not offline access is allowed

**Parameters**

Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| doesAllowOfflineAccess | [Output] Whether or not offline access is allowed |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionDescriptor_DoesAllowOfflineAccess(
    const mip_cc_protection_descriptor protectionDescriptor,
    bool* doesAllowOfflineAccess,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionDescriptor_GetReferrerSize

Gets size of buffer required to store referrer

**Parameters**

Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| referrerSize | [Output] Size of buffer to hold referrer (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionDescriptor_GetReferrerSize(
    const mip_cc_protection_descriptor protectionDescriptor,
    int64_t* referrerSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionDescriptor_GetReferrer

Gets protection referrer

**Parameters**

Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| referrerBuffer | [Output] Buffer the referrer will be copied into. |
| referrerBufferSize | Size (in number of chars) of the referrerBuffer. |
| actualReferrerSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If referrerBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualReferrerSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_ProtectionDescriptor_GetReferrer(
    const mip_cc_protection_descriptor protectionDescriptor,
    char* referrerBuffer,
    const int64_t referrerBufferSize,
    int64_t* actualReferrerSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionDescriptor_GetDoubleKeyUrlSize

Gets size of buffer required to store double key URL

**Parameters**

Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| url | [Output] Size of buffer to hold double key URL (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionDescriptor_GetDoubleKeyUrlSize(
    const mip_cc_protection_descriptor protectionDescriptor,
    int64_t* urlSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionDescriptor_GetDoubleKeyUrl

Gets double key URL

**Parameters**

Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| urlBuffer | [Output] Buffer the url will be copied into. |
| urlBufferSize | Size (in number of chars) of the urlBuffer. |
| actualUrlSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If urlBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualUrlSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_ProtectionDescriptor_GetDoubleKeyUrl(
    const mip_cc_protection_descriptor protectionDescriptor,
    char* urlBuffer,
    const int64_t urlBufferSize,
    int64_t* actualUrlSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ReleaseProtectionDescriptor

Release resources associated with a protection descriptor

**Parameters**

Parameter | Description
|---|---|
| protectionDescriptor | Protection descriptor to be released |

```c
void MIP_CC_ReleaseProtectionDescriptor(mip_cc_protection_descriptor protectionDescriptor);
```

## MIP_CC_CreateStringList

Create a string list

**Parameters**

Parameter | Description
|---|---|
| strings | Array of strings |
| count | Number of strings |
| stringList | [Output] Newly-created string list |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: A mip_cc_string_list must be freed by calling MIP_CC_ReleaseStringList 

```c
mip_cc_result MIP_CC_CreateStringList(
    const char** strings,
    const int64_t count,
    mip_cc_string_list* stringList,
    mip_cc_error* errorInfo);
```

## MIP_CC_StringList_GetStrings

Get strings that compose a string list

**Parameters**

Parameter | Description
|---|---|
| stringList | Source string list |
| strings | [Output] Array of strings, memory owned by mip_cc_string_list object |
| count | [Output] Number of strings |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: The memory for 'strings' is owned by the mip_cc_string_list object, so it should not be freed independently 

```c
mip_cc_result MIP_CC_StringList_GetStrings(
    const mip_cc_string_list stringList,
    const char*** strings,
    int64_t* count,
    mip_cc_error* errorInfo);
```

## MIP_CC_ReleaseStringList

Release resources associated with a string list

**Parameters**

Parameter | Description
|---|---|
| stringList | String list to be released |

```c
void MIP_CC_ReleaseStringList(mip_cc_string_list stringList);
```

## mip_cc_dispatch_task_callback_fn

Callback function definition for dispatching an async task

**Parameters**

Parameter | Description
|---|---|
| taskId | Unique task identifier |

```c
MIP_CC_CALLBACK(mip_cc_dispatch_task_callback_fn,
    void,
    const mip_cc_async_task*);
```

## mip_cc_cancel_task_callback_fn

Callback function for canceling a background tasks

**Parameters**

Parameter | Description
|---|---|
| taskId | Unique task identifier |

**Return**: True if task was successfully cancelled, else false

```c
MIP_CC_CALLBACK(mip_cc_cancel_task_callback_fn,
    bool,
    const char*);
```

## MIP_CC_CreateTaskDispatcherDelegate

Creates a task dispatcher delegate which can be used to override MIP's default async task handling

**Parameters**

Parameter | Description
|---|---|
| dispatchTaskCallback | Function pointer for dispatching async tasks |
| cancelTaskCallback | Function pointer for cancelling background tasks |
| cancelAllTasksCallback | Function pointer for cancelling all background tasks |
| taskDispatcher | [Output] Handle to task dispatcher delegate object |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_CreateTaskDispatcherDelegate(
    const mip_cc_dispatch_task_callback_fn dispatchTaskCallback,
    const mip_cc_cancel_task_callback_fn cancelTaskCallback,
    const mip_cc_cancel_all_tasks_callback_fn cancelAllTasksCallback,
    mip_cc_task_dispatcher_delegate* taskDispatcher,
    mip_cc_error* errorInfo);
```

## MIP_CC_ExecuteDispatchedTask

Notifies a TaskDispatcher delegate that a task is scheduled to execute now on the current thread

**Parameters**

Parameter | Description
|---|---|
| taskDispatcher | Handle to task dispatcher delegate object |
| taskId | ID of async task associated with this operation |

**Note**: This function must be called by the application when a task is scheduled to execute. It will result in immediate execution of the task on the current thread. The ID should match that of a previously-dispatched, non-cancelled task. 

```c
void MIP_CC_ExecuteDispatchedTask(const mip_cc_task_dispatcher_delegate taskDispatcher, const char* taskId);
```

## MIP_CC_ReleaseTaskDispatcherDelegate

Release resources associated with an task dispatcher delegate handle

**Parameters**

Parameter | Description
|---|---|
| taskDispatcher | Task dispatcher delegate to be released |

```c
void MIP_CC_ReleaseTaskDispatcherDelegate(mip_cc_task_dispatcher_delegate taskDispatcher);
```

## MIP_CC_CreateTelemetryConfiguration

Create a settings object used to create a protection profile

**Parameters**

Parameter | Description
|---|---|
| telemetryConfig | [Output] Newly-created telemetry configuration instance containing default settings |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_CreateTelemetryConfiguration(
    mip_cc_telemetry_configuration* telemetryConfig,
    mip_cc_error* errorInfo);
```

## MIP_CC_TelemetryConfiguration_SetHostName

Set a telemetry host name which will override internal telemetry settings

**Parameters**

Parameter | Description
|---|---|
| telemetryConfig | Telemetry configuration |
| hostName | Host name |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: This property is set when a client application uses the same Aria/1DS telemetry component and wishes for its internal telemetry settings (caching, logging, priority etc.) to be used instead of MIP's default settings 

```c
mip_cc_result MIP_CC_TelemetryConfiguration_SetHostName(
    const mip_cc_telemetry_configuration telemetryConfig,
    const char* hostName,
    mip_cc_error* errorInfo);
```

## MIP_CC_TelemetryConfiguration_SetLibraryName

Set a telemetry shared library override

**Parameters**

Parameter | Description
|---|---|
| telemetryConfig | Telemetry configuration |
| libraryName | Name of DLL that implements the Aria/1DS SDK's C API |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: This property is set when a client has an existing telemetry DLL that implements the Aria/1DS SDK's C API that should be used instead of mip_ClientTelemetry.dll 

```c
mip_cc_result MIP_CC_TelemetryConfiguration_SetLibraryName(
    const mip_cc_telemetry_configuration telemetryConfig,
    const char* libraryName,
    mip_cc_error* errorInfo);
```

## MIP_CC_TelemetryConfiguration_SetHttpDelegate

Override default telemetry HTTP stack with client's own

**Parameters**

Parameter | Description
|---|---|
| telemetryConfig | Telemetry configuration |
| httpDelegate | HTTP callback instance implemented by client application |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If this property is not set, the telemetry component will use MIP's default HTTP stack 

```c
mip_cc_result MIP_CC_TelemetryConfiguration_SetHttpDelegate(
    const mip_cc_telemetry_configuration telemetryConfig,
    const mip_cc_http_delegate httpDelegate,
    mip_cc_error* errorInfo);
```

## MIP_CC_TelemetryConfiguration_SetTaskDispatcherDelegate

Override default async task dispatcher with client's own

**Parameters**

Parameter | Description
|---|---|
| telemetryConfig | Telemetry configuration |
| taskDispatcherDelegate | Task dispatcher callback instance implemented by client application |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_TelemetryConfiguration_SetTaskDispatcherDelegate(
    const mip_cc_telemetry_configuration telemetryConfig,
    const mip_cc_task_dispatcher_delegate taskDispatcherDelegate,
    mip_cc_error* errorInfo);
```

## MIP_CC_TelemetryConfiguration_SetIsNetworkDetectionEnabled

Sets whether or not the telemetry component is allowed ping network status on a background thread

**Parameters**

Parameter | Description
|---|---|
| telemetryConfig | Telemetry configuration |
| isCachingEnabled | Whether or not the telemetry component is allowed ping network status on a background thread |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: Default is 'true' 

```c
mip_cc_result MIP_CC_TelemetryConfiguration_SetIsNetworkDetectionEnabled(
    const mip_cc_telemetry_configuration telemetryConfig,
    const bool isNetworkDetectionEnabled,
    mip_cc_error* errorInfo);
```

## MIP_CC_TelemetryConfiguration_SetIsLocalCachingEnabled

Sets whether or not the telemetry component is allowed to write caches to disk

**Parameters**

Parameter | Description
|---|---|
| telemetryConfig | Telemetry configuration |
| isCachingEnabled | Whether or not the telemetry component is allowed to write caches to disk |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: Default is 'true' 

```c
mip_cc_result MIP_CC_TelemetryConfiguration_SetIsLocalCachingEnabled(
    const mip_cc_telemetry_configuration telemetryConfig,
    const bool isCachingEnabled,
    mip_cc_error* errorInfo);
```

## MIP_CC_TelemetryConfiguration_SetIsTraceLoggingEnabled

Sets whether or not the telemetry component is allowed to write logs to disk

**Parameters**

Parameter | Description
|---|---|
| telemetryConfig | Telemetry configuration |
| isTraceLoggingEnabled | Whether or not the telemetry component is allowed to write logs to disk |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: Default is 'true' 

```c
mip_cc_result MIP_CC_TelemetryConfiguration_SetIsTraceLoggingEnabled(
    const mip_cc_telemetry_configuration telemetryConfig,
    const bool isTraceLoggingEnabled,
    mip_cc_error* errorInfo);
```

## MIP_CC_TelemetryConfiguration_SetIsTelemetryOptedOut

Sets whether or not an application/user has opted out of optional telemetry

**Parameters**

Parameter | Description
|---|---|
| telemetryConfig | Telemetry configuration |
| isTelemetryOptedOut | Whether or not an application/user has opted out of optional telemetry |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: Default is 'false' 

```c
mip_cc_result MIP_CC_TelemetryConfiguration_SetIsTelemetryOptedOut(
    const mip_cc_telemetry_configuration telemetryConfig,
    const bool isTelemetryOptedOut,
    mip_cc_error* errorInfo);
```

## MIP_CC_TelemetryConfiguration_SetCustomSettings

Sets custom telemetry settings

**Parameters**

Parameter | Description
|---|---|
| telemetryConfig | Telemetry configuration |
| customSettings | Custom telemetry settings |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_TelemetryConfiguration_SetCustomSettings(
    const mip_cc_telemetry_configuration telemetryConfig,
    const mip_cc_dictionary customSettings,
    mip_cc_error* errorInfo);
```

## MIP_CC_TelemetryConfiguration_AddMaskedProperty

Sets a telemetry property to mask

**Parameters**

Parameter | Description
|---|---|
| telemetryConfig | Telemetry configuration |
| eventName | Event name |
| propertyName | Property name |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_TelemetryConfiguration_AddMaskedProperty(
    const mip_cc_telemetry_configuration telemetryConfig,
    const char* eventName,
    const char* propertyName,
    mip_cc_error* errorInfo);
```

## MIP_CC_ReleaseTelemetryConfiguration

Release resources associated with a protection profile settings

**Parameters**

Parameter | Description
|---|---|
| profileSettings | Protection profile settings to be released |

```c
void MIP_CC_ReleaseTelemetryConfiguration(mip_cc_telemetry_configuration telemetryConfig);
```

## MIP_CC_ReleaseProtectionEngine

Release resources associated with a protection engine

**Parameters**

Parameter | Description
|---|---|
| engine | Protection engine to release |

```c
void MIP_CC_ReleaseProtectionEngine(mip_cc_protection_engine engine);
```

## MIP_CC_ProtectionEngine_CreateProtectionHandlerForPublishing

Creates a protection handler for publishing new content

**Parameters**

Parameter | Description
|---|---|
| engine | Engine under which a handler will be created |
| settings | Protection handler settings |
| context | Client context that will be opaquely passed to HttpDelegate and AuthDelegate |
| handler | [Output] Newly-created protection handler instance |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionEngine_CreateProtectionHandlerForPublishing(
    const mip_cc_protection_engine engine,
    const mip_cc_protection_handler_publishing_settings settings,
    const void* context,
    mip_cc_protection_handler* handler,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionEngine_CreateProtectionHandlerForConsumption

Creates a protection handler for consuming existing content

**Parameters**

Parameter | Description
|---|---|
| engine | Engine under which a handler will be created |
| settings | Protection handler settings |
| context | Client context that will be opaquely passed to HttpDelegate and AuthDelegate |
| handler | [Output] Newly-created protection handler instance |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionEngine_CreateProtectionHandlerForConsumption(
  const mip_cc_protection_engine engine,
  const mip_cc_protection_handler_consumption_settings settings,
  const void* context,
  mip_cc_protection_handler* handler,
  mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionEngine_GetEngineIdSize

Gets size of buffer required to engine ID

**Parameters**

Parameter | Description
|---|---|
| engine | Protection engine |
| idSize | [Output] Size of buffer to hold engine ID (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionEngine_GetEngineIdSize(
    const mip_cc_protection_engine engine,
    int64_t* idSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionEngine_GetEngineId

Gets engine ID

**Parameters**

Parameter | Description
|---|---|
| engine | Protection engine |
| idBuffer | [Output] Buffer the id will be copied into. |
| idBufferSize | Size (in number of chars) of the idBuffer. |
| actualIdSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If idBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualIdSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_ProtectionEngine_GetEngineId(
    const mip_cc_protection_engine engine,
    char* idBuffer,
    const int64_t idBufferSize,
    int64_t* actualIdSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionEngine_GetTemplatesSize

Gets the number of RMS templates associated with a protection engine

**Parameters**

Parameter | Description
|---|---|
| engine | Protection engine |
| context | Client context that will be opaquely passed to HttpDelegate and AuthDelegate |
| templatesSize | [Output] Number of templates |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: This API may result in an independent HTTP operation. Consider using 'MIP_CC_ProtectionEngine_GetTemplates' directly with a pre-defined buffer to avoid unnecessary extra HTTP operations. 

```c
mip_cc_result MIP_CC_ProtectionEngine_GetTemplatesSize(
    const mip_cc_protection_engine engine,
    const void* context,
    int64_t* templatesSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionEngine_GetTemplates

Get collection of templates available to a user

**Parameters**

Parameter | Description
|---|---|
| engine | Protection engine |
| context | Client context that will be opaquely passed to HttpDelegate and AuthDelegate |
| mip_cc_template_descriptor | [Output] buffer to create template handlers. |
| templateBufferSize | Size (in number of items) of the templateBuffer. |
| actualTemplatesSize | [Output] Number of template IDs written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If templateBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualTemplateSize will be set to the minimum required buffer size. Each mip_cc_template_descriptor must be released by the caller by calling MIP_CC_ReleaseTemplateDescriptor(). 

```c
mip_cc_result MIP_CC_ProtectionEngine_GetTemplates(
    const mip_cc_protection_engine engine,
    const void* context,
    mip_cc_template_descriptor* templateDescriptors,
    const int64_t templateBufferSize,
    int64_t* actualTemplatesSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionEngine_GetRightsForLabelId

Get list of rights granted to a user for a label ID

**Parameters**

Parameter | Description
|---|---|
| engine | Protection engine |
| context | Client context that will be opaquely passed to HttpDelegate and AuthDelegate |
| documentId | Document ID assigned to the document |
| labelId | Label ID applied to the document |
| ownerEmail | Owner of the document |
| delagedUserEmail | Email of user if the authenticating user/application is acting on behalf of another user, empty if none |
| rights | [Output] List of rights granted to a user, memory owned by caller |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: The 'rights' variable must be released by the caller by calling MIP_CC_ReleaseStringList 

```c
mip_cc_result MIP_CC_ProtectionEngine_GetRightsForLabelId(
    const mip_cc_protection_engine engine,
    const void* context,
    const char* documentId,
    const char* labelId,
    const char* ownerEmail,
    const char* delegatedUserEmail,
    mip_cc_string_list* rights,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionEngine_GetClientDataSize

Gets the size of client data associated with a protection engine

**Parameters**

Parameter | Description
|---|---|
| engine | Protection engine |
| clientDataSize | [Output] Size of client data (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionEngine_GetClientDataSize(
    const mip_cc_protection_engine engine,
    int64_t* clientDataSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionEngine_GetClientData

Get client data associated with a protection engine

**Parameters**

Parameter | Description
|---|---|
| engine | Protection engine |
| clientDataBuffer | [Output] Buffer the client data will be copied into |
| clientDataBufferSize | Size (in number of chars) of clientDataBuffer. |
| actualClientDataSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If clientDataBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualClientDataSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_ProtectionEngine_GetClientData(
    const mip_cc_protection_engine engine,
    char* clientDataBuffer,
    const int64_t clientDataBufferSize,
    int64_t* actualClientDataSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_CreateProtectionEngineSettingsWithIdentity

Create a settings object used to create a brand new protection engine

**Parameters**

Parameter | Description
|---|---|
| identity | Identity that will be associated with ProtectionEngine |
| clientData | Customizable client data that is stored alongside the engine |
| locale | Locale in which text results will output |
| engineSettings | [Output] Newly-created settings instance |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_CreateProtectionEngineSettingsWithIdentity(
    const mip_cc_identity* identity,
    const char* clientData,
    const char* locale,
    mip_cc_protection_engine_settings* engineSettings,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionEngineSettings_SetClientData

Sets the client data that will be stored opaquely alongside this engine and persist across sessions

**Parameters**

Parameter | Description
|---|---|
| settings | Engine settings |
| clientData | Client data |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionEngineSettings_SetClientData(
    const mip_cc_protection_engine_settings engineSettings,
    const char* clientData,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionEngineSettings_SetCustomSettings

Configures custom settings, used for feature gating and testing.

**Parameters**

Parameter | Description
|---|---|
| engineSettings | Engine settings |
| customSettings | Key/value pairs of custom settings |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionEngineSettings_SetCustomSettings(
    const mip_cc_protection_engine_settings engineSettings,
    const mip_cc_dictionary customSettings,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionEngineSettings_SetSessionId

Sets the session ID that can be used to correlate logs and telemetry

**Parameters**

Parameter | Description
|---|---|
| settings | Engine settings |
| sessionId | Session ID that represents the lifetime of a protection engine |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionEngineSettings_SetSessionId(
    const mip_cc_protection_engine_settings engineSettings,
    const char* sessionId,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionEngineSettings_SetCloud

Sets cloud which affects endpoint URLs for all service requests

**Parameters**

Parameter | Description
|---|---|
| settings | Engine settings |
| cloud | Cloud identifier (default = Unknown) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If cloud is not specified, then it will be determined by DNS lookup of the engine's identity domain if possible, else fall back to global cloud. 

```c
mip_cc_result MIP_CC_ProtectionEngineSettings_SetCloud(
    const mip_cc_protection_engine_settings engineSettings,
    const mip_cc_cloud cloud,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionEngineSettings_SetCloudEndpointBaseUrl

Sets base URL for all service requests

**Parameters**

Parameter | Description
|---|---|
| settings | Engine settings |
| cloudEndpointBaseUrl | Base URL (e.g. 'https://api.aadrm.com') |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: This value will only be read and must be set for Cloud = MIP_CLOUD_CUSTOM 

```c
mip_cc_result MIP_CC_ProtectionEngineSettings_SetCloudEndpointBaseUrl(
    const mip_cc_protection_engine_settings engineSettings,
    const char* cloudEndpointBaseUrl,
    mip_cc_error* errorInfo);
```

## MIP_CC_ReleaseProtectionEngineSettings

Release resources associated with a protection engine settings

**Parameters**

Parameter | Description
|---|---|
| engineSettings | Protection engine settings to be released |

```c
void MIP_CC_ReleaseProtectionEngineSettings(mip_cc_protection_engine_settings engineSettings);
```

## MIP_CC_CreateProtectionHandlerPublishingSettings

Create a settings object used to create a protection handler for publishing new content

**Parameters**

Parameter | Description
|---|---|
| descriptor | Protection details |
| settings | [Output] Newly-created settings instance |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_CreateProtectionHandlerPublishingSettings(
    const mip_cc_protection_descriptor descriptor,
    mip_cc_protection_handler_publishing_settings* settings,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionHandlerPublishingSettings_SetIsDeprecatedAlgorithmPreferred

Sets whether or not deprecated crypto algorithm (ECB) is preferred for backwards compatibility

**Parameters**

Parameter | Description
|---|---|
| settings | Protection handler settings |
| isDeprecatedAlgorithmPreferred | Whether or not deprecated algorithm is preferred |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionHandlerPublishingSettings_SetIsDeprecatedAlgorithmPreferred(
    const mip_cc_protection_handler_publishing_settings settings,
    const bool isDeprecatedAlgorithmPreferred,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionHandlerPublishingSettings_SetIsAuditedExtractionAllowed

Sets whether or not non-MIP-aware applications are allowed to open protected content

**Parameters**

Parameter | Description
|---|---|
| settings | Protection handler settings |
| isAuditedExtractionAllowed | Whether or not non-MIP-aware applications are allowed to open protected content |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionHandlerPublishingSettings_SetIsAuditedExtractionAllowed(
    const mip_cc_protection_handler_publishing_settings settings,
    const bool isAuditedExtractionAllowed,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionHandlerPublishingSettings_SetIsPublishingFormatJson

Sets whether or not PL is in JSON format (default is XML)

**Parameters**

Parameter | Description
|---|---|
| settings | Protection handler settings |
| isPublishingFormatJson | Whether or not resulting PL should be in JSON format |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionHandlerPublishingSettings_SetIsPublishingFormatJson(
    const mip_cc_protection_handler_publishing_settings settings,
    const bool isPublishingFormatJson,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionHandlerPublishingSettings_SetDelegatedUserEmail

Sets delegated user

**Parameters**

Parameter | Description
|---|---|
| settings | Protection handler settings |
| delegatedUserEmail | Email address of delegated user |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: A delegated user is specified when the authenticating user/application is acting on behalf of another user 

```c
mip_cc_result MIP_CC_ProtectionHandlerPublishingSettings_SetDelegatedUserEmail(
    const mip_cc_protection_handler_publishing_settings settings,
    const char* delegatedUserEmail,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionHandlerPublishingSettings_SetPreLicenseUserEmail

Sets pre-license user

**Parameters**

Parameter | Description
|---|---|
| settings | Protection handler settings |
| preLicenseUserEmail | Email address of pre-license user |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: A pre-license user is specified when a pre-license should be fetched when publishing 

```c
mip_cc_result MIP_CC_ProtectionHandlerPublishingSettings_SetPreLicenseUserEmail(
    const mip_cc_protection_handler_publishing_settings settings,
    const char* preLicenseUserEmail,
    mip_cc_error* errorInfo);
```

## MIP_CC_CreateProtectionHandlerConsumptionSettings

Create a settings object used to create a protection handler for consuming existing content

**Parameters**

Parameter | Description
|---|---|
| publishingLicenseBuffer | Buffer containing raw publishing license |
| publishingLicenseBufferSize | Size of publishing license buffer |
| settings | [Output] Newly-created settings instance |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_CreateProtectionHandlerConsumptionSettings(
    const uint8_t* publishingLicenseBuffer,
    const int64_t publishingLicenseBufferSize,
    mip_cc_protection_handler_consumption_settings* settings,
    mip_cc_error* errorInfo);
```

## MIP_CC_CreateProtectionHandlerConsumptionSettingsWithPreLicense

Create a settings object used to create a protection handler for consuming existing content

**Parameters**

Parameter | Description
|---|---|
| preLicenseBuffer | Buffer containing raw pre license buffer |
| preLicenseBufferSize | Size of pre license buffer |
| publishingLicenseBuffer | Buffer containing raw publishing license |
| publishingLicenseBufferSize | Size of publishing license buffer |
| settings | [Output] Newly-created settings instance |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_CreateProtectionHandlerConsumptionSettingsWithPreLicense(
    const uint8_t* preLicenseBuffer,
    const int64_t preLicenseBufferSize,
    const uint8_t* publishingLicenseBuffer,
    const int64_t publishingLicenseBufferSize,
    mip_cc_protection_handler_consumption_settings* settings,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionHandlerConsumptionSettings_SetIsOfflineOnly

Sets whether or not protection handler creation permits online HTTP operations

**Parameters**

Parameter | Description
|---|---|
| settings | Protection handler settings |
| isOfflineOnly | True if HTTP operations are forbidden, else false |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If this is set to true, protection handler creation will only succeed if content has already been previously decrypted and its unexpired license is cached. A MIP_RESULT_ERROR_NETWORK result will be returned if cached content is not found. 

```c
mip_cc_result MIP_CC_ProtectionHandlerConsumptionSettings_SetIsOfflineOnly(
    const mip_cc_protection_handler_consumption_settings settings,
    const bool isOfflineOnly,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionHandlerConsumptionSettings_SetDelegatedUserEmail

Sets delegated user

**Parameters**

Parameter | Description
|---|---|
| settings | Protection handler settings |
| delegatedUserEmail | Email address of delegated user |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: A delegated user is specified when the authenticating user/application is acting on behalf of another user 

```c
mip_cc_result MIP_CC_ProtectionHandlerConsumptionSettings_SetDelegatedUserEmail(
    const mip_cc_protection_handler_consumption_settings settings,
    const char* delegatedUserEmail,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionHandler_GetSerializedPublishingLicenseSize

Gets size of publishing license (in bytes)

**Parameters**

Parameter | Description
|---|---|
| handler | Handler representing protected content |
| publishingLicenseBufferSize | [Output] Size of publishing license (in bytes) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionHandler_GetSerializedPublishingLicenseSize(
    const mip_cc_protection_handler handler,
    int64_t* publishingLicenseBufferSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionHandler_GetSerializedPublishingLicense

Gets publishing license

**Parameters**

Parameter | Description
|---|---|
| handler | Handler representing protected content |
| publishingLicenseBuffer | [Output] Buffer to which publishing license will be written |
| publishingLicenseBufferSize | Size of publishing license buffer |
| actualPublishingLicenseSize | [Output] Actual size of publishing license (in bytes) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If publishingLicenseBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualPublishingLicenseSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_ProtectionHandler_GetSerializedPublishingLicense(
    const mip_cc_protection_handler handler,
    uint8_t* publishingLicenseBuffer,
    const int64_t publishingLicenseBufferSize,
    int64_t* actualPublishingLicenseSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionHandler_GetSerializedPreLicenseSize

Gets size of pre-license (in bytes)

**Parameters**

Parameter | Description
|---|---|
| handler | Handler representing protected content |
| format | Pre-license format |
| preLicenseBufferSize | [Output] Size of pre-license (in bytes) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionHandler_GetSerializedPreLicenseSize(
    const mip_cc_protection_handler handler,
    mip_cc_pre_license_format format,
    int64_t* preLicenseBufferSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionHandler_GetSerializedPreLicense

Gets pre-license

**Parameters**

Parameter | Description
|---|---|
| handler | Handler representing protected content |
| format | Pre-license format |
| preLicenseBuffer | [Output] Buffer to which pre-license will be written |
| preLicenseBufferSize | Size of pre-license buffer |
| actualPreLicenseSize | [Output] Actual size of pre-license (in bytes) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If preLicenseBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualPreLicenseSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_ProtectionHandler_GetSerializedPreLicense(
    const mip_cc_protection_handler handler,
    mip_cc_pre_license_format format,
    uint8_t* preLicenseBuffer,
    const int64_t preLicenseBufferSize,
    int64_t* actualPreLicenseSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionHandler_GetProtectionDescriptor

Gets protection descriptor

**Parameters**

Parameter | Description
|---|---|
| handler | Handler representing protected content |
| descriptor | [Output] Protection descriptor |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionHandler_GetProtectionDescriptor(
    const mip_cc_protection_handler handler,
    mip_cc_protection_descriptor* descriptor,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionHandler_GetRights

Gets list of rights granted to a user

**Parameters**

Parameter | Description
|---|---|
| handler | Handler representing protected content |
| rights | [Output] List of rights granted to a user, memory owned by caller |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: The 'rights' variable must be released by the caller by calling MIP_CC_ReleaseStringList 

```c
mip_cc_result MIP_CC_ProtectionHandler_GetRights(
    const mip_cc_protection_handler handler,
    mip_cc_string_list* rights,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionHandler_GetProtectedContentSize

Calculates size of protected content, factoring in padding, etc.

**Parameters**

Parameter | Description
|---|---|
| handler | Handler representing protected content |
| unprotectedSize | Size of unprotected/cleartext content (in bytes) |
| includesFinalBlock | Describes if the unprotected content in question includes the final block or not. |
| protectedSize | [Output] Size of protected content |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionHandler_GetProtectedContentSize(
    const mip_cc_protection_handler handler,
    const int64_t unprotectedSize,
    const bool includesFinalBlock,
    int64_t* protectedSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionHandler_GetBlockSize

Gets the block size (in bytes) for the cipher mode used by a protection handler

**Parameters**

Parameter | Description
|---|---|
| handler | Handler representing protected content |
| blockSize | [Output] Block size (in bytes) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionHandler_GetBlockSize(
    const mip_cc_protection_handler handler,
    int64_t* blockSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionHandler_GetIssuedUserSize

Gets size of buffer required to store user that has been granted access to protected content

**Parameters**

Parameter | Description
|---|---|
| handler | Handler representing protected content |
| issuedUserSize | [Output] Size of buffer to hold issued user (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionHandler_GetIssuedUserSize(
    const mip_cc_protection_handler handler,
    int64_t* issuedUserSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionHandler_GetIssuedUser

Gets the user that has been granted access to protected content

**Parameters**

Parameter | Description
|---|---|
| handler | Handler representing protected content |
| issuedUserBuffer | [Output] Buffer the issued user will be copied into. |
| issuedUserBufferSize | Size (in number of chars) of the issuedUserBuffer. |
| actualIssuedUserSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If issuedUserBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualIssuedUserSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_ProtectionHandler_GetIssuedUser(
    const mip_cc_protection_handler handler,
    char* issuedUserBuffer,
    const int64_t issuedUserBufferSize,
    int64_t* actualIssuedUserSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionHandler_GetOwnerSize

Gets size of buffer required to store the owner of protected content

**Parameters**

Parameter | Description
|---|---|
| handler | Handler representing protected content |
| ownerSize | [Output] Size of buffer to hold issued user (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionHandler_GetOwnerSize(
    const mip_cc_protection_handler handler,
    int64_t* ownerSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionHandler_GetOwner

Gets the owner of protected content

**Parameters**

Parameter | Description
|---|---|
| handler | Handler representing protected content |
| ownerBuffer | [Output] Buffer the issued user will be copied into. |
| ownerBufferSize | Size (in number of chars) of the ownerBuffer. |
| actualOwnerSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If ownerBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualOwnerSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_ProtectionHandler_GetOwner(
    const mip_cc_protection_handler handler,
    char* ownerBuffer,
    const int64_t ownerBufferSize,
    int64_t* actualOwnerSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionHandler_GetContentId

Gets the content IE of protected content

**Parameters**

Parameter | Description
|---|---|
| handler | Handler representing protected content |
| contentId | [Output] Content ID |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionHandler_GetContentId(
    const mip_cc_protection_handler handler,
    mip_cc_guid* contentId,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionHandler_DoesUseDeprecatedAlgorithm

Gets whether or not protection handler uses deprecated crypto algorithm (ECB) for backwards compatibility

**Parameters**

Parameter | Description
|---|---|
| handler | Handler representing protected content |
| doesUseDeprecatedAlgorithm | [Output] Whether or not protection handler uses deprecated crypto algorithm |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionHandler_DoesUseDeprecatedAlgorithm(
    const mip_cc_protection_handler handler,
    bool* doesUseDeprecatedAlgorithm,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionHandler_DecryptBuffer

Decrypt a buffer

**Parameters**

Parameter | Description
|---|---|
| offsetFromStart | Relative position of inputBuffer from the very beginning of the encrypted content |
| inputBuffer | Buffer of encrypted content that will be decrypted |
| inputBufferSize | Size (in bytes) of input buffer |
| outputBuffer | [Output] Buffer into which decrypted content will be copied |
| outputBufferSize | Size (in bytes) of output buffer |
| isFinal | If input buffer contains the final encrypted bytes or not |
| actualDecryptedSize | [Output] Actual size of encrypted content (in bytes) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionHandler_DecryptBuffer(
    const mip_cc_protection_handler handler,
    const int64_t offsetFromStart,
    const uint8_t* inputBuffer,
    const int64_t inputBufferSize,
    uint8_t* outputBuffer,
    const int64_t outputBufferSize,
    const bool isFinal,
    int64_t *actualDecryptedSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ReleaseProtectionHandlerPublishingSettings

Release resources associated with a protection handler settings

**Parameters**

Parameter | Description
|---|---|
| settings | Protection handler settings to be released |

```c
void MIP_CC_ReleaseProtectionHandlerPublishingSettings(mip_cc_protection_handler_publishing_settings settings);
```

## MIP_CC_ReleaseProtectionHandlerConsumptionSettings

Release resources associated with a protection handler settings

**Parameters**

Parameter | Description
|---|---|
| settings | Protection handler settings to be released |

```c
void MIP_CC_ReleaseProtectionHandlerConsumptionSettings(mip_cc_protection_handler_consumption_settings settings);
```

## MIP_CC_ReleaseProtectionHandler

Release resources associated with a protection handler

**Parameters**

Parameter | Description
|---|---|
| handler | Protection handler to be released |

```c
void MIP_CC_ReleaseProtectionHandler(mip_cc_protection_handler handler);
```

## MIP_CC_LoadProtectionProfile

Load a profile

**Parameters**

Parameter | Description
|---|---|
| settings | Profile settings |
| profile | [Output] Newly-created protection profile instance |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_LoadProtectionProfile(
    const mip_cc_protection_profile_settings settings,
    mip_cc_protection_profile* profile,
    mip_cc_error* errorInfo);
```

## MIP_CC_ReleaseProtectionProfile

Release resources associated with a protection profile

**Parameters**

Parameter | Description
|---|---|
| profile | Protection profile to be released |

```c
void MIP_CC_ReleaseProtectionProfile(mip_cc_protection_profile profile);
```

## MIP_CC_CreateProtectionProfileSettings

Create a settings object used to create a protection profile

**Parameters**

Parameter | Description
|---|---|
| mipContext | Global context shared across all profiles |
| cacheStorageType | Storage cache configuration |
| authCallback | Callback object to be used for authentication, implemented by client application |
| consentCallback | Callback object to be used for consent, implemented by client application |
| settings | [Output] Newly-created settings instance |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_CreateProtectionProfileSettings(
    const mip_cc_mip_context mipContext,
    const mip_cc_cache_storage_type cacheStorageType,
    const mip_cc_auth_callback authCallback,
    const mip_cc_consent_callback consentCallback,
    mip_cc_protection_profile_settings* settings,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionProfileSettings_SetSessionId

Sets the session ID that can be used to correlate logs and telemetry

**Parameters**

Parameter | Description
|---|---|
| settings | Profile settings |
| sessionId | Session ID that represents the lifetime of a protection profile |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionProfileSettings_SetSessionId(
    const mip_cc_protection_profile_settings settings,
    const char* sessionId,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionProfileSettings_SetCanCacheLicenses

Configures whether or not end user licenses (EULs) will be cached locally

**Parameters**

Parameter | Description
|---|---|
| settings | Profile settings |
| canCacheLicenses | Whether or not engine should cache a license when opening protected content |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionProfileSettings_SetCanCacheLicenses(
    const mip_cc_protection_profile_settings settings,
    const bool canCacheLicenses,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionProfileSettings_SetHttpDelegate

Override default HTTP stack with client's own

**Parameters**

Parameter | Description
|---|---|
| settings | Profile settings to which HTTP delegate will be assigned |
| httpDelegate | HTTP callback instance implemented by client application |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionProfileSettings_SetHttpDelegate(
    const mip_cc_protection_profile_settings settings,
    const mip_cc_http_delegate httpDelegate,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionProfileSettings_SetTaskDispatcherDelegate

Override default async task dispatcher with client's own

**Parameters**

Parameter | Description
|---|---|
| settings | Profile settings to which task dispatcher delegate will be assigned |
| taskDispatcherDelegate | Task dispatcher callback instance implemented by client application |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionProfileSettings_SetTaskDispatcherDelegate(
    const mip_cc_protection_profile_settings settings,
    const mip_cc_task_dispatcher_delegate taskDispatcherDelegate,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectionProfileSettings_SetCustomSettings

Configures custom settings, used for feature gating and testing.

**Parameters**

Parameter | Description
|---|---|
| settings | Profile settings |
| customSettings | Key/value pairs of custom settings |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectionProfileSettings_SetCustomSettings(
    const mip_cc_protection_profile_settings settings,
    const mip_cc_dictionary customSettings,
    mip_cc_error* errorInfo);
```

## MIP_CC_ReleaseProtectionProfileSettings

Release resources associated with a protection profile settings

**Parameters**

Parameter | Description
|---|---|
| settings | Protection profile settings to be released |

```c
void MIP_CC_ReleaseProtectionProfileSettings(mip_cc_protection_profile_settings profilsettingseSettings);
```

## MIP_CC_TemplateDescriptor_GetId

Gets template ID

**Parameters**

Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| templateId | [Output] Template ID associated with protection |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_TemplateDescriptor_GetId(
    const mip_cc_template_descriptor protectionDescriptor,
    mip_cc_guid* templateId,
    mip_cc_error* errorInfo);
```

## MIP_CC_TemplateDescriptor_GetNameSize

Gets size of buffer required to store name

**Parameters**

Parameter | Description
|---|---|
| templateDescriptor | Descriptor associated with template |
| nameSize | [Output] Size of buffer to hold name (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_TemplateDescriptor_GetNameSize(
    const mip_cc_template_descriptor templateDescriptor,
    int64_t* nameSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_TemplateDescriptor_GetName

Gets Template name

**Parameters**

Parameter | Description
|---|---|
| templateDescriptor | Descriptor associated with template |
| nameBuffer | [Output] Buffer the name will be copied into. |
| nameBufferSize | Size (in number of chars) of the nameBuffer. |
| actualNameSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If NameBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualNameSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_TemplateDescriptor_GetName(
    const mip_cc_template_descriptor templateDescriptor,
    char* nameBuffer,
    const int64_t nameBufferSize,
    int64_t* actualNameSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_TemplateDescriptor_GetDescriptionSize

Gets size of buffer required to store description

**Parameters**

Parameter | Description
|---|---|
| templateDescriptor | Descriptor associated with template |
| descriptionSize | [Output] Size of buffer to hold description (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_TemplateDescriptor_GetDescriptionSize(
    const mip_cc_template_descriptor templateDescriptor,
    int64_t* descriptionSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_TemplateDescriptor_GetDescription

Gets Template description

**Parameters**

Parameter | Description
|---|---|
| templateDescriptor | Descriptor associated with template |
| descriptionBuffer | [Output] Buffer the description will be copied into. |
| descriptionBufferSize | Size (in number of chars) of the descriptionBuffer. |
| actualNameSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If descriptionBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualDescriptionSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_TemplateDescriptor_GetDescription(
    const mip_cc_template_descriptor templateDescriptor,
    char* nameBuffer,
    const int64_t nameBufferSize,
    int64_t* actualNameSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ReleaseTemplateDescriptor

Release resources associated with a template descriptor

**Parameters**

Parameter | Description
|---|---|
| templateDescriptor | Template descriptor to be released |

```c
void MIP_CC_ReleaseTemplateDescriptor(mip_cc_template_descriptor templateDescriptor);
```

## MIP_CC_Action_GetType

Gets an action's type

**Parameters**

Parameter | Description
|---|---|
| action | Action |
| actionType | [Output] Type of action |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_Action_GetType(
    const mip_cc_action action,
    mip_cc_action_type* actionType,
    mip_cc_error* errorInfo);
```

## MIP_CC_Action_GetId

Gets an action's ID

**Parameters**

Parameter | Description
|---|---|
| action | Action |
| id | [Output] Unique action ID |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_Action_GetId(
    const mip_cc_action action,
    mip_cc_guid* id,
    mip_cc_error* errorInfo);
```

## MIP_CC_ActionResult_GetActions

Get actions that compose an action result

**Parameters**

Parameter | Description
|---|---|
| actionResult | Source action result |
| actions | [Output] Array of actions, memory owned by mip_cc_action_result object |
| count | [Output] Number of key/value pairs |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: The memory for 'actions' is owned by the mip_cc_action_result object, so it should not be freed independently 

```c
mip_cc_result MIP_CC_ActionResult_GetActions(
    const mip_cc_action_result actionResult,
    mip_cc_action** actions,
    int64_t* count,
    mip_cc_error* errorInfo);
```

## MIP_CC_ReleaseActionResult

Release resources associated with an action result

**Parameters**

Parameter | Description
|---|---|
| actionResult | Action result to be released |

```c
void MIP_CC_ReleaseActionResult(mip_cc_action_result actionResult);
```

## MIP_CC_AddContentFooterAction_GetUIElementNameSize

Gets size of buffer required to store an "add content footer" action's UI element name

**Parameters**

Parameter | Description
|---|---|
| action | "add content footer" action |
| nameSize | [Output] Size of buffer to hold UI element name (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_AddContentFooterAction_GetUIElementNameSize(
    const mip_cc_action action,
    int64_t* nameSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddContentFooterAction_GetUIElementName

Gets an "add content footer" action's UI element name

**Parameters**

Parameter | Description
|---|---|
| action | "add content footer" action |
| nameBuffer | [Output] Buffer the UI element name will be copied into. |
| nameBufferSize | Size (in number of chars) of the nameBuffer. |
| actualNameSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If nameBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualNameSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_AddContentFooterAction_GetUIElementName(
    const mip_cc_action action,
    char* nameBuffer,
    const int64_t nameBufferSize,
    int64_t* actualNameSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddContentFooterAction_GetTextSize

Gets size of buffer required to store an "add content footer" action's text

**Parameters**

Parameter | Description
|---|---|
| action | "add content footer" action |
| nameSize | [Output] Size of buffer to hold text (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_AddContentFooterAction_GetTextSize(
    const mip_cc_action action,
    int64_t* textSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddContentFooterAction_GetText

Gets an "add content footer" action's text

**Parameters**

Parameter | Description
|---|---|
| action | "add content footer" action |
| textBuffer | [Output] Buffer the text will be copied into. |
| textBufferSize | Size (in number of chars) of the textBuffer. |
| actualTextSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If textBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualTextSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_AddContentFooterAction_GetText(
    const mip_cc_action action,
    char* textBuffer,
    const int64_t textBufferSize,
    int64_t* actualTextSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddContentFooterAction_GetFontNameSize

Gets size of buffer required to store an "add content footer" action's font name

**Parameters**

Parameter | Description
|---|---|
| action | "add content footer" action |
| nameSize | [Output] Size of buffer to hold font name (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_AddContentFooterAction_GetFontNameSize(
    const mip_cc_action action,
    int64_t* nameSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddContentFooterAction_GetFontName

Gets an "add content footer" action's font name

**Parameters**

Parameter | Description
|---|---|
| action | "add content footer" action |
| nameBuffer | [Output] Buffer the font name will be copied into. |
| nameBufferSize | Size (in number of chars) of the nameBuffer. |
| actualNameSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If nameBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualNameSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_AddContentFooterAction_GetFontName(
    const mip_cc_action action,
    char* nameBuffer,
    const int64_t nameBufferSize,
    int64_t* actualNameSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddContentFooterAction_GetFontSize

Gets the integer font size

**Parameters**

Parameter | Description
|---|---|
| action | "add content footer" action |
| fontSize | [Output] Font size |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_AddContentFooterAction_GetFontSize(
    const mip_cc_action action,
    int32_t* fontSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddContentFooterAction_GetFontColorSize

Gets size of buffer required to store an "add content footer" action's font color

**Parameters**

Parameter | Description
|---|---|
| action | "add content footer" action |
| colorSize | [Output] Size of buffer to hold font color (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_AddContentFooterAction_GetFontColorSize(
    const mip_cc_action action,
    int64_t* colorSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddContentFooterAction_GetFontColor

Gets an "add content footer" action's font color (for example, "#000000")

**Parameters**

Parameter | Description
|---|---|
| action | "add content footer" action |
| colorBuffer | [Output] Buffer the font color will be copied into. |
| colorBufferSize | Size (in number of chars) of the colorBuffer. |
| actualColorSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If colorBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualColorSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_AddContentFooterAction_GetFontColor(
    const mip_cc_action action,
    char* colorBuffer,
    const int64_t colorBufferSize,
    int64_t* actualColorSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddContentFooterAction_GetAlignment

Gets the alignment

**Parameters**

Parameter | Description
|---|---|
| action | "add content footer" action |
| alignment | [Output] Alignment |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_AddContentFooterAction_GetAlignment(
    const mip_cc_action action,
    mip_cc_content_mark_alignment* alignment,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddContentFooterAction_GetMargin

Gets the margin size

**Parameters**

Parameter | Description
|---|---|
| action | "add content footer" action |
| marginSize | [Output] Margin size (in mm) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_AddContentFooterAction_GetMargin(
    const mip_cc_action action,
    int32_t* marginSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddContentHeaderAction_GetUIElementNameSize

Gets size of buffer required to store an "add content header" action's UI element name

**Parameters**

Parameter | Description
|---|---|
| action | "add content header" action |
| nameSize | [Output] Size of buffer to hold UI element name (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_AddContentHeaderAction_GetUIElementNameSize(
    const mip_cc_action action,
    int64_t* nameSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddContentHeaderAction_GetUIElementName

Gets an "add content header" action's UI element name

**Parameters**

Parameter | Description
|---|---|
| action | "add content header" action |
| nameBuffer | [Output] Buffer the UI element name will be copied into. |
| nameBufferSize | Size (in number of chars) of the nameBuffer. |
| actualNameSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If nameBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualNameSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_AddContentHeaderAction_GetUIElementName(
    const mip_cc_action action,
    char* nameBuffer,
    const int64_t nameBufferSize,
    int64_t* actualNameSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddContentHeaderAction_GetTextSize

Gets size of buffer required to store an "add content header" action's text

**Parameters**

Parameter | Description
|---|---|
| action | "add content header" action |
| nameSize | [Output] Size of buffer to hold text (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_AddContentHeaderAction_GetTextSize(
    const mip_cc_action action,
    int64_t* textSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddContentHeaderAction_GetText

Gets an "add content header" action's text

**Parameters**

Parameter | Description
|---|---|
| action | "add content header" action |
| textBuffer | [Output] Buffer the text will be copied into. |
| textBufferSize | Size (in number of chars) of the textBuffer. |
| actualTextSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If textBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualTextSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_AddContentHeaderAction_GetText(
    const mip_cc_action action,
    char* textBuffer,
    const int64_t textBufferSize,
    int64_t* actualTextSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddContentHeaderAction_GetFontNameSize

Gets size of buffer required to store an "add content header" action's font name

**Parameters**

Parameter | Description
|---|---|
| action | "add content header" action |
| nameSize | [Output] Size of buffer to hold font name (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_AddContentHeaderAction_GetFontNameSize(
    const mip_cc_action action,
    int64_t* nameSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddContentHeaderAction_GetFontName

Gets an "add content header" action's font name

**Parameters**

Parameter | Description
|---|---|
| action | "add content header" action |
| nameBuffer | [Output] Buffer the font name will be copied into. |
| nameBufferSize | Size (in number of chars) of the nameBuffer. |
| actualNameSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If nameBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualNameSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_AddContentHeaderAction_GetFontName(
    const mip_cc_action action,
    char* nameBuffer,
    const int64_t nameBufferSize,
    int64_t* actualNameSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddContentHeaderAction_GetFontSize

Gets the integer font size

**Parameters**

Parameter | Description
|---|---|
| action | "add content header" action |
| fontSize | [Output] Font size |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_AddContentHeaderAction_GetFontSize(
    const mip_cc_action action,
    int32_t* fontSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddContentHeaderAction_GetFontColorSize

Gets size of buffer required to store an "add content header" action's font color

**Parameters**

Parameter | Description
|---|---|
| action | "add content header" action |
| colorSize | [Output] Size of buffer to hold font color (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_AddContentHeaderAction_GetFontColorSize(
    const mip_cc_action action,
    int64_t* colorSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddContentHeaderAction_GetFontColor

Gets an "add content header" action's font color (for example, "#000000")

**Parameters**

Parameter | Description
|---|---|
| action | "add content header" action |
| colorBuffer | [Output] Buffer the font color will be copied into. |
| colorBufferSize | Size (in number of chars) of the colorBuffer. |
| actualColorSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If colorBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualColorSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_AddContentHeaderAction_GetFontColor(
    const mip_cc_action action,
    char* colorBuffer,
    const int64_t colorBufferSize,
    int64_t* actualColorSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddContentHeaderAction_GetAlignment

Gets the alignment

**Parameters**

Parameter | Description
|---|---|
| action | "add content header" action |
| alignment | [Output] Alignment |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_AddContentHeaderAction_GetAlignment(
    const mip_cc_action action,
    mip_cc_content_mark_alignment* alignment,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddContentHeaderAction_GetMargin

Gets the margin size

**Parameters**

Parameter | Description
|---|---|
| action | "add content header" action |
| marginSize | [Output] Margin size (in mm) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_AddContentHeaderAction_GetMargin(
    const mip_cc_action action,
    int32_t* marginSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddWatermarkAction_GetUIElementNameSize

Gets size of buffer required to store an "add watermark" action's UI element name

**Parameters**

Parameter | Description
|---|---|
| action | "add watermark" action |
| nameSize | [Output] Size of buffer to hold UI element name (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_AddWatermarkAction_GetUIElementNameSize(
    const mip_cc_action action,
    int64_t* nameSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddWatermarkAction_GetUIElementName

Gets an "add watermark" action's UI element name

**Parameters**

Parameter | Description
|---|---|
| action | "add watermark" action |
| nameBuffer | [Output] Buffer the UI element name will be copied into. |
| nameBufferSize | Size (in number of chars) of the nameBuffer. |
| actualNameSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If nameBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualNameSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_AddWatermarkAction_GetUIElementName(
    const mip_cc_action action,
    char* nameBuffer,
    const int64_t nameBufferSize,
    int64_t* actualNameSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddWatermarkAction_GetLayout

Gets the watermark layout

**Parameters**

Parameter | Description
|---|---|
| action | "add watermark" action |
| layout | [Output] Watermark layout |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_AddWatermarkAction_GetLayout(
    const mip_cc_action action,
    mip_cc_watermark_layout* layout,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddWatermarkAction_GetTextSize

Gets size of buffer required to store an "add watermark" action's text

**Parameters**

Parameter | Description
|---|---|
| action | "add watermark" action |
| textSize | [Output] Size of buffer to hold text (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_AddWatermarkAction_GetTextSize(
    const mip_cc_action action,
    int64_t* textSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddWatermarkAction_GetText

Gets an "add watermark" action's text

**Parameters**

Parameter | Description
|---|---|
| action | "add watermark" action |
| textBuffer | [Output] Buffer the text will be copied into. |
| textBufferSize | Size (in number of chars) of the textBuffer. |
| actualTextSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If textBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualTextSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_AddWatermarkAction_GetText(
    const mip_cc_action action,
    char* textBuffer,
    const int64_t textBufferSize,
    int64_t* actualTextSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddWatermarkAction_GetFontNameSize

Gets size of buffer required to store an "add watermark" action's font name

**Parameters**

Parameter | Description
|---|---|
| action | "add watermark" action |
| nameSize | [Output] Size of buffer to hold font name (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_AddWatermarkAction_GetFontNameSize(
    const mip_cc_action action,
    int64_t* nameSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddWatermarkAction_GetFontName

Gets an "add watermark" action's font name

**Parameters**

Parameter | Description
|---|---|
| action | "add watermark" action |
| nameBuffer | [Output] Buffer the font name will be copied into. |
| nameBufferSize | Size (in number of chars) of the nameBuffer. |
| actualNameSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If nameBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualNameSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_AddWatermarkAction_GetFontName(
    const mip_cc_action action,
    char* nameBuffer,
    const int64_t nameBufferSize,
    int64_t* actualNameSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddWatermarkAction_GetFontSize

Gets the integer font size

**Parameters**

Parameter | Description
|---|---|
| action | "add watermark" action |
| fontSize | [Output] Font size |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_AddWatermarkAction_GetFontSize(
    const mip_cc_action action,
    int32_t* fontSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddWatermarkAction_GetFontColorSize

Gets size of buffer required to store an "add watermark" action's font color

**Parameters**

Parameter | Description
|---|---|
| action | "add watermark" action |
| colorSize | [Output] Size of buffer to hold font color (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_AddWatermarkAction_GetFontColorSize(
    const mip_cc_action action,
    int64_t* colorSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_AddWatermarkAction_GetFontColor

Gets an "add watermark" action's font color (for example, "#000000")

**Parameters**

Parameter | Description
|---|---|
| action | "add watermark" action |
| colorBuffer | [Output] Buffer the font color will be copied into. |
| colorBufferSize | Size (in number of chars) of the colorBuffer. |
| actualColorSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If colorBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualColorSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_AddWatermarkAction_GetFontColor(
    const mip_cc_action action,
    char* colorBuffer,
    const int64_t colorBufferSize,
    int64_t* actualColorSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ReleaseContentLabel

Release resources associated with a content label

**Parameters**

Parameter | Description
|---|---|
| contentLabel | Label to be released |

```c
void MIP_CC_ReleaseContentLabel(mip_cc_content_label contentLabel);
```

## MIP_CC_ContentLabel_GetCreationTime

Gets time when label was applied

**Parameters**

Parameter | Description
|---|---|
| contentLabel | Label |
| creationTime | [Output] Time when label was applied to document (in seconds since epoch) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ContentLabel_GetCreationTime(
    const mip_cc_content_label contentLabel,
    int64_t* creationTime,
    mip_cc_error* errorInfo);
```

## MIP_CC_ContentLabel_GetAssignmentMethod

Gets label assignment method

**Parameters**

Parameter | Description
|---|---|
| contentLabel | Label |
| assignmentMethod | [Output] Assignment method (e.g. 'standard' or 'privileged') |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ContentLabel_GetAssignmentMethod(
    const mip_cc_content_label contentLabel,
    mip_cc_label_assignment_method* assignmentMethod,
    mip_cc_error* errorInfo);
```

## MIP_CC_ContentLabel_GetExtendedProperties

Gets extended properties

**Parameters**

Parameter | Description
|---|---|
| contentLabel | Label |
| properties | [Output] Dictionary of extended properties, memory owned by caller |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: The 'properties' variable must be released by the caller by calling MIP_CC_ReleaseDictionary 

```c
mip_cc_result MIP_CC_ContentLabel_GetExtendedProperties(
    const mip_cc_content_label contentLabel,
    mip_cc_metadata_dictionary* properties,
    mip_cc_error* errorInfo);
```

## MIP_CC_ContentLabel_IsProtectionAppliedFromLabel

Gets whether or not a protection was applied by a label.

**Parameters**

Parameter | Description
|---|---|
| contentLabel | Label |
| isProtectionAppliedByLabel | [Output] If document is protected and the protection was explicitly applied by this label. |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ContentLabel_IsProtectionAppliedFromLabel(
    const mip_cc_content_label contentLabel,
    bool* isProtectionAppliedByLabel,
    mip_cc_error* errorInfo);
```

## MIP_CC_ContentLabel_GetLabel

Gets generic label properties from a content label instance

**Parameters**

Parameter | Description
|---|---|
| contentLabel | Label |
| label | [Output] Generic label, memory owned by caller |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: The 'label' variable must be released by the caller by calling MIP_CC_ReleaseLabel 

```c
mip_cc_result MIP_CC_ContentLabel_GetLabel(
    const mip_cc_content_label contentLabel,
    mip_cc_label* label,
    mip_cc_error* errorInfo);
```

## MIP_CC_CustomAction_GetNameSize

Gets size of buffer required to store a "custom" action's name

**Parameters**

Parameter | Description
|---|---|
| action | "custom" action |
| nameSize | [Output] Size of buffer to hold name (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_CustomAction_GetNameSize(
    const mip_cc_action action,
    int64_t* nameSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_CustomAction_GetName

Gets a "custom" action's name

**Parameters**

Parameter | Description
|---|---|
| action | "custom" action |
| nameBuffer | [Output] Buffer the name will be copied into. |
| nameBufferSize | Size (in number of chars) of the nameBuffer. |
| actualNameSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If nameBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualNameSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_CustomAction_GetName(
    const mip_cc_action action,
    char* nameBuffer,
    const int64_t nameBufferSize,
    int64_t* actualNameSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_CustomAction_GetProperties

Gets a "custom" action's properties

**Parameters**

Parameter | Description
|---|---|
| action | "custom" action |
| properties | [Output] Dictionary of properties, memory owned by caller |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: The 'properties' variable must be released by the caller by calling MIP_CC_ReleaseDictionary 

```c
mip_cc_result MIP_CC_CustomAction_GetProperties(
    const mip_cc_action action,
    mip_cc_dictionary* properties,
    mip_cc_error* errorInfo);
```

## mip_cc_metadata_callback

Callback function definition for retrieving document metatdata, filtered by name/prefix

**Parameters**

Parameter | Description
|---|---|
| names | Array of metadata key names to include in result |
| namesSize | Number of values in 'names' array |
| namePrefixes | Array of metadata key name prefixes to include in result |
| namePrefixesSize | Number of values in 'namesPrefixes' array |
| context | Application context opaquely passed from API call to callback |
| metadata | [Output] Dictionary of metadata key/values, created by client application. This dictionary will be released by MIP. |

```c
MIP_CC_CALLBACK(mip_cc_metadata_callback,
    void,
    const char**,
    const int64_t,
    const char**,
    const int64_t,
    const void*,
    mip_cc_metadata_dictionary*);
```

## MIP_CC_ReleaseLabel

Release resources associated with a label

**Parameters**

Parameter | Description
|---|---|
| label | Label to be released |

```c
void MIP_CC_ReleaseLabel(mip_cc_label label);
```

## MIP_CC_Label_GetId

Gets label ID

**Parameters**

Parameter | Description
|---|---|
| label | Label |
| labelId | [Output] Label ID |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_Label_GetId(
    const mip_cc_label label,
    mip_cc_guid* labelId,
    mip_cc_error* errorInfo);
```

## MIP_CC_Label_GetNameSize

Gets size of buffer required to store name

**Parameters**

Parameter | Description
|---|---|
| label | Label |
| nameSize | [Output] Size of buffer to hold name (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_Label_GetNameSize(
    const mip_cc_label label,
    int64_t* nameSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_Label_GetName

Gets label name

**Parameters**

Parameter | Description
|---|---|
| label | Label |
| nameBuffer | [Output] Buffer the name will be copied into. |
| nameBufferSize | Size (in number of chars) of the nameBuffer. |
| actualNameSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If nameBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualNameSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_Label_GetName(
    const mip_cc_label label,
    char* nameBuffer,
    const int64_t nameBufferSize,
    int64_t* actualNameSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_Label_GetDescriptionSize

Gets size of buffer required to store description

**Parameters**

Parameter | Description
|---|---|
| label | Label |
| descriptionSize | [Output] Size of buffer to hold description (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_Label_GetDescriptionSize(
    const mip_cc_label label,
    int64_t* descriptionSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_Label_GetDescription

Gets label description

**Parameters**

Parameter | Description
|---|---|
| label | Label |
| descriptionBuffer | [Output] Buffer the description will be copied into. |
| descriptionBufferSize | Size (in number of chars) of the descriptionBuffer. |
| actualDescriptionSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If descriptionBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualDescriptionSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_Label_GetDescription(
    const mip_cc_label label,
    char* descriptionBuffer,
    const int64_t descriptionBufferSize,
    int64_t* actualDescriptionSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_Label_GetColorSize

Gets size of buffer required to store color

**Parameters**

Parameter | Description
|---|---|
| label | Label |
| colorSize | [Output] Size of buffer to hold color (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_Label_GetColorSize(
    const mip_cc_label label,
    int64_t* colorSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_Label_GetColor

Gets label color

**Parameters**

Parameter | Description
|---|---|
| label | Label |
| colorBuffer | [Output] Buffer the color will be copied into (in #RRGGBB format). |
| colorBufferSize | Size (in number of chars) of the colorBuffer. |
| actualColorSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If colorBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualColorSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_Label_GetColor(
    const mip_cc_label label,
    char* colorBuffer,
    const int64_t colorBufferSize,
    int64_t* actualColorSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_Label_GetSensitivity

Gets sensitivity level of label. Higher value means more sensitive.

**Parameters**

Parameter | Description
|---|---|
| label | Label |
| sensitivity | [Output] Sensitivity level |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_Label_GetSensitivity(
    const mip_cc_label label,
    int32_t* sensitivity,
    mip_cc_error* errorInfo);
```

## MIP_CC_Label_GetTooltipSize

Gets size of buffer required to store tooltip

**Parameters**

Parameter | Description
|---|---|
| label | Label |
| tooltipSize | [Output] Size of buffer to hold tooltip (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_Label_GetTooltipSize(
    const mip_cc_label label,
    int64_t* tooltipSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_Label_GetTooltip

Gets label tooltip

**Parameters**

Parameter | Description
|---|---|
| label | Label |
| tooltipBuffer | [Output] Buffer the tooltip will be copied into. |
| tooltipBufferSize | Size (in number of chars) of the tooltipBuffer. |
| actualTooltipSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If tooltipBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualTooltipSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_Label_GetTooltip(
    const mip_cc_label label,
    char* tooltipBuffer,
    const int64_t tooltipBufferSize,
    int64_t* actualTooltipSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_Label_GetAutoTooltipSize

Gets size of buffer required to store auto-classification tooltip

**Parameters**

Parameter | Description
|---|---|
| label | Label |
| tooltipSize | [Output] Size of buffer to hold tooltip (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_Label_GetAutoTooltipSize(
    const mip_cc_label label,
    int64_t* tooltipSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_Label_GetAutoTooltip

Gets label auto-classification tooltip

**Parameters**

Parameter | Description
|---|---|
| label | Label |
| tooltipBuffer | [Output] Buffer the tooltip will be copied into. |
| tooltipBufferSize | Size (in number of chars) of the tooltipBuffer. |
| actualTooltipSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If tooltipBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualTooltipSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_Label_GetAutoTooltip(
    const mip_cc_label label,
    char* tooltipBuffer,
    const int64_t tooltipBufferSize,
    int64_t* actualTooltipSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_Label_IsActive

Gets whether or not a label is active

**Parameters**

Parameter | Description
|---|---|
| label | Label |
| isActive | [Output] Whether or not a label is considered active. |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: Only active labels can be applied. Inactivte labels cannot be applied and are used for display purposes only. 

```c
mip_cc_result MIP_CC_Label_IsActive(
    const mip_cc_label label,
    bool* isActive,
    mip_cc_error* errorInfo);
```

## MIP_CC_Label_GetParent

Gets the parent label, if any

**Parameters**

Parameter | Description
|---|---|
| label | Label |
| parent | [Output] Parent label, if any, else null |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_Label_GetParent(
    const mip_cc_label label,
    mip_cc_label* parent,
    mip_cc_error* errorInfo);
```

## MIP_CC_Label_GetChildrenSize

Gets the number of children labels

**Parameters**

Parameter | Description
|---|---|
| label | Label |
| childrenSize | [Output] Number of children |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_Label_GetChildrenSize(
    const mip_cc_label label,
    int64_t* childrenSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_Label_GetChildren

Gets the children labels

**Parameters**

Parameter | Description
|---|---|
| label | Label |
| childrenBuffer | [Output] Buffer the children labels will be copied into. Children labels |
| childrenBufferSize | Size (in number of labels) of the childrenBuffer. |
| actualChildrenSize | [Output] Number of children labels written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If childrenBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualChildrenSize will be set to the minimum required buffer size 

```c
mip_cc_result MIP_CC_Label_GetChildren(
    const mip_cc_label label,
    mip_cc_label* childrenBuffer,
    const int64_t childrenBufferSize,
    int64_t* actualChildrenSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_Label_GetCustomSettings

Gets policy-defined custom settings of a label

**Parameters**

Parameter | Description
|---|---|
| label | Label |
| settings | [Output] Dictionary of settings, owned by the caller |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: The 'settings' variable must be released by the caller by calling MIP_CC_ReleaseDictionary 

```c
mip_cc_result MIP_CC_Label_GetCustomSettings(
    const mip_cc_label label,
    mip_cc_dictionary* settings,
    mip_cc_error* errorInfo);
```

## MIP_CC_MetadataAction_GetMetadataToRemove

Gets a "metadata" action's metadata to remove

**Parameters**

Parameter | Description
|---|---|
| action | "metadata" action |
| metadataNames | [Output] Key names of metadata to remove, memory owned by caller |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: The 'metadataNames' variable must be released by the caller by calling MIP_CC_ReleaseStringList @note Removing metadata should be done before adding metadata 

```c
mip_cc_result MIP_CC_MetadataAction_GetMetadataToRemove(
    const mip_cc_action action,
    mip_cc_string_list* metadataNames,
    mip_cc_error* errorInfo);
```

## MIP_CC_MetadataAction_GetMetadataToAdd

Gets a "metadata" action's metadata to add

**Parameters**

Parameter | Description
|---|---|
| action | "metadata" action |
| metadata | [Output] list of metadata entries to add, memory owned by caller |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: The 'metadata' variable must be released by the caller by calling MIP_CC_ReleaseDictionary @note Removing metadata should be done before adding metadata 

```c
mip_cc_result MIP_CC_MetadataAction_GetMetadataToAdd(
    const mip_cc_action action,
    mip_cc_metadata_dictionary* metadata,
    mip_cc_error* errorInfo);
```

## MIP_CC_CreateMetadataDictionary

Create a dictionary of string keys/values

**Parameters**

Parameter | Description
|---|---|
| entries | Array of metadata entries |
| count | Number of metadata entries |
| dictionary | [Output] Newly-created dictionary |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: A mip_cc_dictionary must be freed by calling MIP_CC_ReleaseDictionary 

```c
mip_cc_result MIP_CC_CreateMetadataDictionary(
    const mip_cc_metadata_entry* entries,
    const int64_t count,
    mip_cc_metadata_dictionary* dictionary,
    mip_cc_error* errorInfo);
```

## MIP_CC_MetadataDictionary_GetEntries

Get metadata entries that compose a dictionary

**Parameters**

Parameter | Description
|---|---|
| dictionary | Source dictionary |
| entries | [Output] Array of metadata entries, memory owned by mip_cc_dictionary object |
| count | [Output] Number of metadata entries |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: The memory for 'entries' is owned by the mip_cc_dictionary object, so it should not be freed independently 

```c
mip_cc_result MIP_CC_MetadataDictionary_GetEntries(
    const mip_cc_metadata_dictionary dictionary,
    mip_cc_metadata_entry** entries,
    int64_t* count,
    mip_cc_error* errorInfo);
```

## MIP_CC_ReleaseMetadataDictionary

Release resources associated with a dictionary

**Parameters**

Parameter | Description
|---|---|
| dictionary | Dictionary to be released |

```c
void MIP_CC_ReleaseMetadataDictionary(mip_cc_metadata_dictionary dictionary);
```

## MIP_CC_ReleasePolicyEngine

Release resources associated with a policy engine

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine to release |

```c
void MIP_CC_ReleasePolicyEngine(mip_cc_policy_engine engine);
```

## MIP_CC_PolicyEngine_GetEngineIdSize

Gets size of buffer required to engine ID

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine |
| idSize | [Output] Size of buffer to hold engine ID (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_PolicyEngine_GetEngineIdSize(
    const mip_cc_policy_engine engine,
    int64_t* idSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngine_GetEngineId

Gets engine ID

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine |
| idBuffer | [Output] Buffer the id will be copied into. |
| idBufferSize | Size (in number of chars) of the idBuffer. |
| actualIdSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If idBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualIdSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_PolicyEngine_GetEngineId(
    const mip_cc_policy_engine engine,
    char* idBuffer,
    const int64_t idBufferSize,
    int64_t* actualIdSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngine_GetMoreInfoUrlSize

Gets the size of client data associated with a policy engine

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine |
| moreInfoUrlSize | [Output] Size of client data (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_PolicyEngine_GetMoreInfoUrlSize(
    const mip_cc_policy_engine engine,
    int64_t* moreInfoUrlSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngine_GetMoreInfoUrl

Get client data associated with a policy engine

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine |
| moreInfoUrlBuffer | [Output] Buffer the client data will be copied into |
| moreInfoUrlBufferSize | Size (in number of chars) of moreInfoUrlBuffer. |
| actualMoreInfoUrlSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If moreInfoUrlBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualMoreInfoUrlSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_PolicyEngine_GetMoreInfoUrl(
    const mip_cc_policy_engine engine,
    char* moreInfoUrlBuffer,
    const int64_t moreInfoUrlBufferSize,
    int64_t* actualMoreInfoUrlSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngine_IsLabelingRequired

Gets whether or not the policy dictates that a document must be labeled.

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine |
| isLabelingRequired | [Output] Whether or not policy dictates that a document must be labeled |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_PolicyEngine_IsLabelingRequired(
    const mip_cc_policy_engine engine,
    bool* isLabelingRequired,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngine_GetPolicyFileIdSize

Gets the size of client data associated with a policy engine

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine |
| policyFileIdSize | [Output] Size of client data (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_PolicyEngine_GetPolicyFileIdSize(
    const mip_cc_policy_engine engine,
    int64_t* policyFileIdSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngine_GetPolicyFileId

Get client data associated with a policy engine

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine |
| policyFileIdBuffer | [Output] Buffer the client data will be copied into |
| policyFileIdBufferSize | Size (in number of chars) of policyFileIdBuffer. |
| actualPolicyFileIdSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If policyFileIdBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualPolicyFileIdSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_PolicyEngine_GetPolicyFileId(
    const mip_cc_policy_engine engine,
    char* policyFileIdBuffer,
    const int64_t policyFileIdBufferSize,
    int64_t* actualPolicyFileIdSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngine_GetSensitivityFileIdSize

Gets the size of client data associated with a policy engine

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine |
| sensitivityFileIdSize | [Output] Size of client data (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_PolicyEngine_GetSensitivityFileIdSize(
    const mip_cc_policy_engine engine,
    int64_t* sensitivityFileIdSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngine_GetSensitivityFileId

Get client data associated with a policy engine

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine |
| sensitivityFileIdBuffer | [Output] Buffer the client data will be copied into |
| sensitivityFileIdBufferSize | Size (in number of chars) of sensitivityFileIdBuffer. |
| actualSensitivityFileIdSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If sensitivityFileIdBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualSensitivityFileIdSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_PolicyEngine_GetSensitivityFileId(
    const mip_cc_policy_engine engine,
    char* sensitivityFileIdBuffer,
    const int64_t sensitivityFileIdBufferSize,
    int64_t* actualSensitivityFileIdSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngine_HasClassificationRules

Gets whether or not the policy has automatic or recommendation rules

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine |
| hasClassificationRules | [Output] Whether or not policy has automatic or recommendation rules |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_PolicyEngine_HasClassificationRules(
    const mip_cc_policy_engine engine,
    bool* hasClassificationRules,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngine_GetLastPolicyFetchTime

Gets the time when the policy was last fetched

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine |
| lastPolicyFetchTime | [Output] Time when the policy was last fetched (in seconds since epoch) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_PolicyEngine_GetLastPolicyFetchTime(
    const mip_cc_policy_engine engine,
    int64_t* lastPolicyFetchTime,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngine_GetSensitivityLabelsSize

Gets the number of sensitivity labels associated with the policy engine

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine |
| labelsSize | [Output] Number of labels |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_PolicyEngine_GetSensitivityLabelsSize(
    const mip_cc_policy_engine engine,
    int64_t* labelsSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngine_GetSensitivityLabels

Gets the sensitivity labels associated with the policy engine

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine |
| labelBuffer | [Output] Buffer the labels will be copied into. Labels are owned by the client |
| labelBufferSize | Size (in number of labels) of the labelBuffer. |
| actualLabelsSize | [Output] Number of labels written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If labelBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualLabelsSize will be set to the minimum required buffer size 

```c
mip_cc_result MIP_CC_PolicyEngine_GetSensitivityLabels(
    const mip_cc_policy_engine engine,
    mip_cc_label* labelBuffer,
    const int64_t labelBufferSize,
    int64_t* actualLabelsSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngine_GetLabelById

Gets sensitivity label by ID

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine |
| labelId | Label ID |
| label | [Output] Sensitivity label. This value is owned by the caller and must be released with MIP_CC_ReleaseLabel. |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_PolicyEngine_GetLabelById(
    const mip_cc_policy_engine engine,
    const char* labelId,
    mip_cc_label* label,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngine_GetSensitivityTypesSize

Gets the number of sensitivity types associated with the policy engine

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine |
| sensitivityTypesSize | [Output] Number of sensitivity types |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_PolicyEngine_GetSensitivityTypesSize(
    const mip_cc_policy_engine engine,
    int64_t* sensitivityTypesSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngine_GetSensitivityTypes

Gets the sensitivity types associated with the policy engine

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine |
| sensitivityTypeBuffer | [Output] Buffer the sensitivity types will be copied into. Sensitivity |
| sensitivityTypeBufferSize | Size (in number of sensitivity types) of the sensitivityTypeBuffer. |
| actualSensitivityTypesSize | [Output] Number of sensitivity types written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If sensitivityTypeBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualSensitivityTypesSize will be set to the minimum required buffer size 

```c
mip_cc_result MIP_CC_PolicyEngine_GetSensitivityTypes(
    const mip_cc_policy_engine engine,
    mip_cc_sensitivity_type* sensitivityTypeBuffer,
    const int64_t sensitivityTypeBufferSize,
    int64_t* actualSensitivityTypesSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngine_CreatePolicyHandler

Create a Policy Handler to execute policy-related functions

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine |
| isAuditDiscoveryEnabled | Whether or not audit discovery is enabled |
| handler | [Output] Newly-created Policy Handler instance |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_PolicyEngine_CreatePolicyHandler(
    const mip_cc_policy_engine engine,
    const bool isAuditDiscoveryEnabled,
    mip_cc_policy_handler* handler,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngine_SendApplicationAuditEvent

Logs an application specific event to the audit pipeline

**Parameters**

Parameter | Description
|---|---|
| level | Level of the event: Info/Error/Warning |
| eventType | A description of the type of event |
| eventData | The data associated with the event |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_PolicyEngine_SendApplicationAuditEvent(
    const mip_cc_policy_engine engine,
    const char* level,
    const char* eventType,
    const char* eventData,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngine_GetTenantIdSize

Gets size of tenant ID

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine |
| tenantIdSize | [Output] Size of tenant ID (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_PolicyEngine_GetTenantIdSize(
    const mip_cc_policy_engine engine,
    int64_t* tenantIdSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngine_GetTenantId

Gets tenant ID

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine |
| tenantIdBuffer | [Output] Buffer the tenant ID will be copied into. |
| tenantIdBufferSize | Size (in number of chars) of the tenantIdBuffer. |
| actualTenantIdSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If tenantIdBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualTenantIdSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_PolicyEngine_GetTenantId(
    const mip_cc_policy_engine engine,
    char* tenantIdBuffer,
    const int64_t tenantIdBufferSize,
    int64_t* actualTenantIdSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngine_GetPolicyDataXmlSize

Gets size of policy data xml

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine |
| xmlSize | [Output] Size of policy data xml (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_PolicyEngine_GetPolicyDataXmlSize(
    const mip_cc_policy_engine engine,
    int64_t* xmlSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngine_GetPolicyDataXml

Gets policy data xml

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine |
| xmlBuffer | [Output] Buffer the xml will be copied into. |
| xmlBufferSize | Size (in number of chars) of the xmlBuffer. |
| actualXmlSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If xmlBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualXmlSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_PolicyEngine_GetPolicyDataXml(
    const mip_cc_policy_engine engine,
    char* xmlBuffer,
    const int64_t xmlBufferSize,
    int64_t* actualXmlSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngine_GetSensitivityTypesDataXmlSize

Gets size of sensitivity types data xml

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine |
| xmlSize | [Output] Size of policy data xml (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_PolicyEngine_GetSensitivityTypesDataXmlSize(
    const mip_cc_policy_engine engine,
    int64_t* xmlSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngine_GetSensitivityTypesDataXml

Gets sensitivity types data xml

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine |
| xmlBuffer | [Output] Buffer the xml will be copied into. |
| xmlBufferSize | Size (in number of chars) of the xmlBuffer. |
| actualXmlSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If xmlBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualXmlSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_PolicyEngine_GetSensitivityTypesDataXml(
    const mip_cc_policy_engine engine,
    char* xmlBuffer,
    const int64_t xmlBufferSize,
    int64_t* actualXmlSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngine_GetClientDataSize

Gets the size of client data associated with a policy engine

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine |
| clientDataSize | [Output] Size of client data (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_PolicyEngine_GetClientDataSize(
    const mip_cc_policy_engine engine,
    int64_t* clientDataSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngine_GetClientData

Get client data associated with a policy engine

**Parameters**

Parameter | Description
|---|---|
| engine | Policy engine |
| clientDataBuffer | [Output] Buffer the client data will be copied into |
| clientDataBufferSize | Size (in number of chars) of clientDataBuffer. |
| actualClientDataSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If clientDataBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualClientDataSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_PolicyEngine_GetClientData(
    const mip_cc_policy_engine engine,
    char* clientDataBuffer,
    const int64_t clientDataBufferSize,
    int64_t* actualClientDataSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_CreatePolicyEngineSettingsWithIdentity

Create a settings object used to create a brand new policy engine

**Parameters**

Parameter | Description
|---|---|
| identity | Identity that will be associated with PolicyEngine |
| clientData | Customizable client data that is stored alongside the engine |
| locale | Locale in which text results will output |
| loadSensitivityTypes | Whether or not sensitivity types data (for classification) should also be loaded |
| settings | [Output] Newly-created settings instance |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: 'loadSensitivityTypes' should be 'true' only if application expects to later call MIP_CC_PolicyEngine_GetSensitivityTypes. Otherwise, it should be false to avoid an unnecessary HTTP operation. 

```c
mip_cc_result MIP_CC_CreatePolicyEngineSettingsWithIdentity(
    const mip_cc_identity* identity,
    const char* clientData,
    const char* locale,
    bool loadSensitivityTypes,
    mip_cc_policy_engine_settings* settings,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngineSettings_SetClientData

Sets the client data that will be stored opaquely alongside this engine and persist across sessions

**Parameters**

Parameter | Description
|---|---|
| settings | Engine settings |
| clientData | Client data |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_PolicyEngineSettings_SetClientData(
    const mip_cc_policy_engine_settings settings,
    const char* clientData,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngineSettings_SetCustomSettings

Configures custom settings, used for feature gating and testing.

**Parameters**

Parameter | Description
|---|---|
| settings | Engine settings |
| customSettings | Key/value pairs of custom settings |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_PolicyEngineSettings_SetCustomSettings(
    const mip_cc_policy_engine_settings settings,
    const mip_cc_dictionary customSettings,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngineSettings_SetSessionId

Sets the session ID that can be used to correlate logs and telemetry

**Parameters**

Parameter | Description
|---|---|
| settings | Engine settings |
| sessionId | Session ID that represents the lifetime of a policy engine |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_PolicyEngineSettings_SetSessionId(
    const mip_cc_policy_engine_settings settings,
    const char* sessionId,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngineSettings_SetCloud

Sets cloud which affects endpoint URLs for all service requests

**Parameters**

Parameter | Description
|---|---|
| settings | Engine settings |
| cloud | Cloud identifier (default = Unknown) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If cloud is not specified, then it will default to global cloud. 

```c
mip_cc_result MIP_CC_PolicyEngineSettings_SetCloud(
    const mip_cc_policy_engine_settings settings,
    const mip_cc_cloud cloud,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngineSettings_SetCloudEndpointBaseUrl

Sets base URL for all service requests

**Parameters**

Parameter | Description
|---|---|
| settings | Engine settings |
| cloudEndpointBaseUrl | Base URL (e.g. 'https://dataservice.protection.outlook.com') |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: This value will only be read and must be set for Cloud = MIP_CLOUD_CUSTOM 

```c
mip_cc_result MIP_CC_PolicyEngineSettings_SetCloudEndpointBaseUrl(
    const mip_cc_policy_engine_settings settings,
    const char* cloudEndpointBaseUrl,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngineSettings_SetDelegatedUserEmail

Sets delegated user

**Parameters**

Parameter | Description
|---|---|
| settings | Engine settings |
| delegatedUserEmail | Email address of delegated user |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: A delegated user is specified when the authenticating user/application is acting on behalf of another user 

```c
mip_cc_result MIP_CC_PolicyEngineSettings_SetDelegatedUserEmail(
    const mip_cc_policy_engine_settings settings,
    const char* delegatedUserEmail,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyEngineSettings_SetLabelFilter

Sets label filter

**Parameters**

Parameter | Description
|---|---|
| settings | Engine settings |
| labelFilter | enum representing label filter, if not set default is hyok, doublekeyencryption |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_PolicyEngineSettings_SetLabelFilter(
    const mip_cc_policy_engine_settings settings,
    const mip_cc_label_filter labelFilter,
    mip_cc_error* errorInfo);
```

## MIP_CC_ReleasePolicyEngineSettings

Release resources associated with a policy engine settings

**Parameters**

Parameter | Description
|---|---|
| settings | Policy engine settings to be released |

```c
void MIP_CC_ReleasePolicyEngineSettings(mip_cc_policy_engine_settings settings);
```

## MIP_CC_ReleasePolicyHandler

Release resources associated with a policy handler

**Parameters**

Parameter | Description
|---|---|
| handler | Policy handler to release |

```c
void MIP_CC_ReleasePolicyHandler(mip_cc_policy_handler handler);
```

## MIP_CC_PolicyHandler_GetSensitivityLabel

Gets a document's current label

**Parameters**

Parameter | Description
|---|---|
| handler | Policy handler |
| documentState | Document state |
| context | Application context opaquely forwarded to any callbacks |
| contentLabel | Label currently applied to a document |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_PolicyHandler_GetSensitivityLabel(
    const mip_cc_policy_handler handler,
    const mip_cc_document_state* documentState,
    const void* context,
    mip_cc_content_label* contentLabel,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyHandler_ComputeActions

Executes policy rules based on the provided state and determines corresponding actions

**Parameters**

Parameter | Description
|---|---|
| handler | Policy handler |
| documentState | Document state |
| applicationState | Application action state |
| context | Application context opaquely forwarded to any callbacks |
| actionResult | [Output] Actions that should be taken by application, memory owned by caller |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: The 'actionResult' variable must be released by the caller by calling MIP_CC_ReleaseActionResult 

```c
mip_cc_result MIP_CC_PolicyHandler_ComputeActions(
    const mip_cc_policy_handler handler,
    const mip_cc_document_state* documentState,
    const mip_cc_application_action_state* applicationState,
    const void* context,
    mip_cc_action_result* actionResult,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyHandler_NotifyCommittedActions

Called by application after computed actions have been applied and data committed to disk

**Parameters**

Parameter | Description
|---|---|
| handler | Policy handler |
| documentState | Document state |
| applicationState | Application action state |
| context | Application context opaquely forwarded to any callbacks |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: A call to this function is necessary to transmit complete label audit data. 

```c
mip_cc_result MIP_CC_PolicyHandler_NotifyCommittedActions(
    const mip_cc_policy_handler handler,
    const mip_cc_document_state* documentState,
    const mip_cc_application_action_state* applicationState,
    const void* context,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyProfile_AcquireAuthToken

Trigger an authentication callback

**Parameters**

Parameter | Description
|---|---|
| profile | Profile |
| cloud | Azure cloud |
| authCallback | Authentication callback that will be invoked |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: MIP will not cache or do anything else with the value returned by the auth delegate. This function is recommended for applications that aren't "logged in" until after MIP requests an auth token. It allows an application to fetch a token before MIP actually requires one. 

```c
mip_cc_result MIP_CC_PolicyProfile_AcquireAuthToken(
    const mip_cc_policy_profile profile,
    const mip_cc_cloud cloud,
    const mip_cc_auth_callback authCallback,
    mip_cc_error* errorInfo);
```

## MIP_CC_LoadPolicyProfile

Load a profile

**Parameters**

Parameter | Description
|---|---|
| settings | Profile settings |
| profile | [Output] Newly-created policy profile instance |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_LoadPolicyProfile(
    const mip_cc_policy_profile_settings settings,
    mip_cc_policy_profile* profile,
    mip_cc_error* errorInfo);
```

## MIP_CC_ReleasePolicyProfile

Release resources associated with a policy profile

**Parameters**

Parameter | Description
|---|---|
| profile | Policy profile to be released |

```c
void MIP_CC_ReleasePolicyProfile(mip_cc_policy_profile profile);
```

## MIP_CC_CreatePolicyProfileSettings

Create a settings object used to create a policy profile

**Parameters**

Parameter | Description
|---|---|
| mipContext | Global context shared across all profiles |
| cacheStorageType | Storage cache configuration |
| authCallback | Callback object to be used for authentication, implemented by client application |
| settings | [Output] Newly-created settings instance |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_CreatePolicyProfileSettings(
    const mip_cc_mip_context mipContext,
    const mip_cc_cache_storage_type cacheStorageType,
    const mip_cc_auth_callback authCallback,
    mip_cc_policy_profile_settings* settings,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyProfileSettings_SetSessionId

Sets the session ID that can be used to correlate logs and telemetry

**Parameters**

Parameter | Description
|---|---|
| settings | Profile settings |
| sessionId | Session ID that represents the lifetime of a policy profile |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_PolicyProfileSettings_SetSessionId(
    const mip_cc_policy_profile_settings settings,
    const char* sessionId,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyProfileSettings_SetHttpDelegate

Override default HTTP stack with client's own

**Parameters**

Parameter | Description
|---|---|
| settings | Profile settings to which HTTP delegate will be assigned |
| httpDelegate | HTTP callback instance implemented by client application |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_PolicyProfileSettings_SetHttpDelegate(
    const mip_cc_policy_profile_settings settings,
    const mip_cc_http_delegate httpDelegate,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyProfileSettings_SetTaskDispatcherDelegate

Override default async task dispatcher with client's own

**Parameters**

Parameter | Description
|---|---|
| settings | Profile settings to which task dispatcher delegate will be assigned |
| taskDispatcherDelegate | Task dispatcher callback instance implemented by client application |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_PolicyProfileSettings_SetTaskDispatcherDelegate(
    const mip_cc_policy_profile_settings settings,
    const mip_cc_task_dispatcher_delegate taskDispatcherDelegate,
    mip_cc_error* errorInfo);
```

## MIP_CC_PolicyProfileSettings_SetCustomSettings

Configures custom settings, used for feature gating and testing.

**Parameters**

Parameter | Description
|---|---|
| settings | Profile settings |
| customSettings | Key/value pairs of custom settings |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_PolicyProfileSettings_SetCustomSettings(
    const mip_cc_policy_profile_settings settings,
    const mip_cc_dictionary customSettings,
    mip_cc_error* errorInfo);
```

## MIP_CC_ReleasePolicyProfileSettings

Release resources associated with a policy profile settings

**Parameters**

Parameter | Description
|---|---|
| settings | Policy profile settings to be released |

```c
void MIP_CC_ReleasePolicyProfileSettings(mip_cc_policy_profile_settings profileSettings);
```

## MIP_CC_ProtectAdhocDkAction_GetDoubleKeyEncryptionUrlSize

Gets size of buffer required to store the double key encryption url.

**Parameters**

Parameter | Description
|---|---|
| action | "protect by adhoc policy with double key" action |
| urlSize | [Output] Size of buffer to hold the url (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectAdhocDkAction_GetDoubleKeyEncryptionUrlSize(
    const mip_cc_action action,
    int64_t* urlSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectAdhocDkAction_GetDoubleKeyEncryptionUrl

Gets double key encryption url

**Parameters**

Parameter | Description
|---|---|
| action | "protect by adhoc policy with double key" action |
| urlBuffer | [Output] Buffer the url will be copied into. |
| urlBufferSize | Size (in number of chars) of the urlBuffer. |
| actualUrlSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If urlBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualUrlSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_ProtectAdhocDkAction_GetDoubleKeyEncryptionUrl(
    const mip_cc_action action,
    char* urlBuffer,
    const int64_t urlBufferSize,
    int64_t* actualUrlSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectByTemplateAction_GetTemplateId

Gets a "protect by template" action's template ID

**Parameters**

Parameter | Description
|---|---|
| action | "protect by template" action |
| templateId | [Output] ID of template that defines protections |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectByTemplateAction_GetTemplateId(
    const mip_cc_action action,
    mip_cc_guid* templateId,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectByTemplateDkAction_GetTemplateId

Gets a "protect by template with double key" action's template ID

**Parameters**

Parameter | Description
|---|---|
| action | "protect by template" action |
| templateId | [Output] ID of template that defines protections |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectByTemplateDkAction_GetTemplateId(
    const mip_cc_action action,
    mip_cc_guid* templateId,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectByTemplateDkAction_GetDoubleKeyEncryptionUrlSize

Gets size of buffer required to store the double key encryption url.

**Parameters**

Parameter | Description
|---|---|
| action | "protect by template with double key" action |
| urlSize | [Output] Size of buffer to hold the url (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectByTemplateDkAction_GetDoubleKeyEncryptionUrlSize(
    const mip_cc_action action,
    int64_t* urlSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectByTemplateDkAction_GetDoubleKeyEncryptionUrl

Gets double key encryption url

**Parameters**

Parameter | Description
|---|---|
| action | "protect by template with double key" action |
| urlBuffer | [Output] Buffer the url will be copied into. |
| urlBufferSize | Size (in number of chars) of the urlBuffer. |
| actualUrlSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If urlBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualUrlSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_ProtectByTemplateDkAction_GetDoubleKeyEncryptionUrl(
    const mip_cc_action action,
    char* urlBuffer,
    const int64_t urlBufferSize,
    int64_t* actualUrlSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectDoNotForwardDkAction_GetDoubleKeyEncryptionUrlSize

Gets size of buffer required to store the double key encryption url.

**Parameters**

Parameter | Description
|---|---|
| action | "protect by dp not forward policy with double key" action |
| urlSize | [Output] Size of buffer to hold the url (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_ProtectDoNotForwardDkAction_GetDoubleKeyEncryptionUrlSize(
    const mip_cc_action action,
    int64_t* urlSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_ProtectDoNotForwardDkAction_GetDoubleKeyEncryptionUrl

Gets double key encryption url

**Parameters**

Parameter | Description
|---|---|
| action | "protect by dp not forward policy with double key" action |
| urlBuffer | [Output] Buffer the url will be copied into. |
| urlBufferSize | Size (in number of chars) of the urlBuffer. |
| actualUrlSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If urlBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualUrlSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_ProtectDoNotForwardDkAction_GetDoubleKeyEncryptionUrl(
    const mip_cc_action action,
    char* urlBuffer,
    const int64_t urlBufferSize,
    int64_t* actualUrlSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_RemoveContentFooterAction_GetUIElementNames

Gets a "remove content footer" action's UI element names to remove

**Parameters**

Parameter | Description
|---|---|
| action | "remove content footer" action |
| names | [Output] Names of UI elements to remove, memory owned by caller |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: The 'names' variable must be released by the caller by calling MIP_CC_ReleaseStringList 

```c
mip_cc_result MIP_CC_RemoveContentFooterAction_GetUIElementNames(
    const mip_cc_action action,
    mip_cc_string_list* names,
    mip_cc_error* errorInfo);
```

## MIP_CC_RemoveContentHeaderAction_GetUIElementNames

Gets a "remove content header" action's UI element names to remove

**Parameters**

Parameter | Description
|---|---|
| action | "remove content header" action |
| names | [Output] Names of UI elements to remove, memory owned by caller |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: The 'names' variable must be released by the caller by calling MIP_CC_ReleaseStringList 

```c
mip_cc_result MIP_CC_RemoveContentHeaderAction_GetUIElementNames(
    const mip_cc_action action,
    mip_cc_string_list* names,
    mip_cc_error* errorInfo);
```

## MIP_CC_RemoveWatermarkAction_GetUIElementNames

Gets a "remove watermark" action's UI element names to remove

**Parameters**

Parameter | Description
|---|---|
| action | "remove watermark footer" action |
| names | [Output] Names of UI elements to remove, memory owned by caller |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: The 'names' variable must be released by the caller by calling MIP_CC_ReleaseStringList 

```c
mip_cc_result MIP_CC_RemoveWatermarkAction_GetUIElementNames(
    const mip_cc_action action,
    mip_cc_string_list* names,
    mip_cc_error* errorInfo);
```

## MIP_CC_ReleaseSensitivityType

Release resources associated with a sensitivity type

**Parameters**

Parameter | Description
|---|---|
| sensitivityType | Sensitivity type to be released |

```c
void MIP_CC_ReleaseSensitivityType(mip_cc_sensitivity_type sensitivityType);
```

## MIP_CC_SensitivityType_GetRulePackageIdSize

Gets size of buffer required to store a sensitivity type's rule package ID

**Parameters**

Parameter | Description
|---|---|
| sensitivityType | Sensitivity type |
| idSize | [Output] Size of buffer to hold rule package ID (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_SensitivityType_GetRulePackageIdSize(
    const mip_cc_sensitivity_type sensitivityType,
    int64_t* idSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_SensitivityType_GetRulePackageId

Gets a sensitivity type's rule package ID

**Parameters**

Parameter | Description
|---|---|
| sensitivityType | Sensitivity type |
| idBuffer | [Output] Buffer the ID will be copied into. |
| idBufferSize | Size (in number of chars) of the idBuffer. |
| actualIdSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If idBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualIdSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_SensitivityType_GetRulePackageId(
    const mip_cc_sensitivity_type sensitivityType,
    char* idBuffer,
    const int64_t idBufferSize,
    int64_t* actualIdSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_SensitivityType_GetRulePackageSize

Gets size of buffer required to store a sensitivity type's rule package

**Parameters**

Parameter | Description
|---|---|
| sensitivityType | Sensitivity type |
| rulePackageSize | [Output] Size of buffer to hold rule package (in number of chars) |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

```c
mip_cc_result MIP_CC_SensitivityType_GetRulePackageSize(
    const mip_cc_sensitivity_type sensitivityType,
    int64_t* rulePackageSize,
    mip_cc_error* errorInfo);
```

## MIP_CC_SensitivityType_GetRulePackage

Gets a sensitivity type's rule package

**Parameters**

Parameter | Description
|---|---|
| sensitivityType | Sensitivity type |
| rulePackageBuffer | [Output] Buffer the rule package will be copied into. |
| rulePackageBufferSize | Size (in number of chars) of the rulePackageBuffer. |
| actualRulePackageSize | [Output] Number of chars written to the buffer |
| errorInfo | [Output] (Optional) Failure info if operation result is error |

**Return**: Result code indicating success or failure

**Note**: If rulePackageBuffer is null or insufficient, MIP_RESULT_ERROR_INSUFFICIENT_BUFFER will be returned and actualRulePackageSize will be set to the minimum required buffer size. 

```c
mip_cc_result MIP_CC_SensitivityType_GetRulePackage(
    const mip_cc_sensitivity_type sensitivityType,
    char* rulePackageBuffer,
    const int64_t rulePackageBufferSize,
    int64_t* actualRulePackageSize,
    mip_cc_error* errorInfo);
```

