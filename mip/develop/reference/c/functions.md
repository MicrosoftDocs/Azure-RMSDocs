---
title: Functions
description: Functions.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference

ms.author: mbaldwin
ms.date: 11/14/2022
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

