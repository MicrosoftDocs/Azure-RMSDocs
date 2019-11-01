---
title: Functions
description: Functions.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference

ms.author: mbaldwin
ms.date: 11/1/2019
---

# Functions

## mip_cc_auth_callback

From [auth_callback_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/auth_callback_cc.h)

Defines auth callback functions

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
MIP_CC_CALLBACK(mip_cc_auth_callback /*typename*/,
    bool /*return*/,
    const mip_cc_identity* /*identity*/,
    const mip_cc_oauth2_challenge* /*challenge*/,
    const void* /*context*/,
    uint8_t* /*tokenBuffer*/,
    const int64_t /*tokenBufferSize*/,
    int64_t* /*actualTokenSize*/);
```

## mip_cc_consent_callback

From [consent_callback_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/consent_callback_cc.h)

Defines consent callback functions

**Parameters**

 Parameter | Description
|---|---|
| url | The URL for which the SDK requires user consent |

**Return**: User consent response

```c
MIP_CC_CALLBACK(mip_cc_consent_callback /*typename*/,
    mip_cc_consent /*return*/,
    const char* /*url*/);
```

## MIP_CC_CreateDictionary

From [dictionary_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/dictionary_cc.h)

Contains C API definitions for common string dictionary.

**Parameters**

 Parameter | Description
|---|---|
| entries | Array of key/value pairs |
| count | Number of key/value pairs |
| dictionary | [Output] Newly-created dictionary |

**Return**: Result code indicating success or failure

```c
MIP_CC_ReleaseDictionary
 */
MIP_CC_API(mip_cc_result) MIP_CC_CreateDictionary(
    const mip_cc_kv_pair* entries,
    const int64_t count,
    mip_cc_dictionary* dictionary);
```

## MIP_CC_Dictionary_GetEntries

From [dictionary_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/dictionary_cc.h)

Get key/value pairs that compose a dictionary

**Parameters**

 Parameter | Description
|---|---|
| dictionary | Source dictionary |
| entries | [Output] Array of key/value pairs, memory owned by mip_cc_dictionary object |
| count | [Output] Number of key/value pairs |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_Dictionary_GetEntries(
    const mip_cc_dictionary dictionary,
    mip_cc_kv_pair** entries,
    int64_t* count);
```

## MIP_CC_CreateHttpDelegate

From [http_delegate_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/http_delegate_cc.h)

Defines HTTP callback functions

**Parameters**

 Parameter | Description
|---|---|
| request | The HTTP request to be performed by the application |
| context | The same opaque context passed to MIP API call that resulted in this HTTP request |
| requestId | The ID of the HTTP request to be cancelled |
| sendCallback | Function pointer for issuing HTTP requests |
| cancelCallback | Function pointer for cancelling HTTP requests |
| httpDelegate | [Output] Handle to HTTP delegate object |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_CreateHttpDelegate(
    const mip_cc_http_send_callback_fn sendCallback,
    const mip_cc_http_cancel_callback_fn cancelCallback,
    mip_cc_http_delegate* httpDelegate);
```

## MIP_CC_CreateLoggerDelegate

From [logger_delegate_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/logger_delegate_cc.h)

Defines logger callback functions

**Parameters**

 Parameter | Description
|---|---|
| storagePath | File path where logs may be stored |
| level | the log level for the log statement. |
| message | the message for the log statement. |
| function | the function name for the log statement. |
| file | the file name where log statement was generated. |
| line | the line number where the log statement was generated. |
| initCallback | Function pointer for initialization |
| flushCallback | Function pointer for flushing logs |
| writeCallback | Function pointer for writing a log statement |
| loggerDelegate | [Output] Handle to logger delegate object |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_CreateLoggerDelegate(
    const mip_cc_logger_init_callback_fn initCallback,
    const mip_cc_logger_flush_callback_fn flushCallback,
    const mip_cc_logger_write_callback_fn writeCallback,
    mip_cc_logger_delegate* loggerDelegate);
```

## MIP_CC_CreateMipContext

From [mip_context_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/mip_context_cc.h)

Defines C-Style MipContext functions

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

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_CreateMipContext(
    const mip_cc_application_info* applicationInfo,
    const char* path,
    const mip_cc_log_level logLevel,
    const bool isOfflineOnly,
    const mip_cc_logger_delegate loggerDelegateOverride,
    const mip_cc_telemetry_configuration telemetryOverride,
    mip_cc_mip_context* mipContext);
```

## MIP_CC_CreateMipContextWithCustomFeatureSettings

From [mip_context_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/mip_context_cc.h)

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

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_CreateMipContextWithCustomFeatureSettings(
    const mip_cc_application_info* applicationInfo,
    const char* path,
    const mip_cc_log_level logLevel,
    const bool isOfflineOnly,
    const mip_cc_logger_delegate loggerDelegateOverride,
    const mip_cc_telemetry_configuration telemetryOverride,
    const mip_cc_feature_override* featureSettings,
    const int64_t featureSettingsSize,
    mip_cc_mip_context* mipContext);
```

## MIP_CC_CreateProtectionDescriptorFromTemplate

From [protection_descriptor_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection_descriptor_cc.h)

Defines C-Style ProtectionDescriptor interface

**Parameters**

 Parameter | Description
|---|---|
| templateId | Template ID |
| signedAppData | App-specific data (cleartext) that is signed into the publishing license |
| protectionDescriptor | [Output] Newly-created protection descriptor instance |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_CreateProtectionDescriptorFromTemplate(
    const char* templateId,
    const mip_cc_dictionary signedAppData,
    mip_cc_protection_descriptor* protectionDescriptor);
```

## MIP_CC_CreateProtectionDescriptorFromUserRights

From [protection_descriptor_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection_descriptor_cc.h)

Creates a protection descriptor whose access permissions are defined by users and rights

**Parameters**

 Parameter | Description
|---|---|
| userRights | Groups of users and their rights |
| userRightsCount | Number of user/rights groups |
| name | Protection name |
| referrer | Referrer address (a URI displayable to a user that provides information on how to gain access) |
| contentValidUntil | Protection expiration time |
| allowOfflineAccess | Determines whether a license to consume content can be cached locally |
| encryptedAppData | App-specific data (cleartext) that is encrypted into the publishing license |
| signedAppData | App-specific data (cleartext) that is signed into the publishing license |
| protectionDescriptor | [Output] Newly-created protection descriptor instance |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_CreateProtectionDescriptorFromUserRights(
    const mip_cc_user_rights* userRights,
    const int64_t userRightsCount,
    const char* name,
    const char* description,
    const char* referrer,
    const time_t* contentValidUntil,
    const bool allowOfflineAccess,
    const mip_cc_dictionary encryptedAppData,
    const mip_cc_dictionary signedAppData,
    mip_cc_protection_descriptor* protectionDescriptor);
```

## MIP_CC_CreateProtectionDescriptorFromUserRoles

From [protection_descriptor_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection_descriptor_cc.h)

Creates a protection descriptor whose access permissions are defined by users and roles

**Parameters**

 Parameter | Description
|---|---|
| userRoles | Groups of users and their roles |
| userRolesCount | Number of user/roles groups |
| name | Protection policy name |
| referrer | Referrer address (a URI displayable to a user that provides information on how to gain access) |
| contentValidUntil | Protection expiration time |
| allowOfflineAccess | Determines whether a license to consume content can be cached locally |
| encryptedAppData | App-specific data (cleartext) that is encrypted into the publishing license |
| signedAppData | App-specific data (cleartext) that is signed into the publishing license |
| protectionDescriptor | [Output] Newly-created protection descriptor instance |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_CreateProtectionDescriptorFromUserRoles(
    const mip_cc_user_roles* userRoles,
    const int64_t userRolesCount,
    const char* name,
    const char* description,
    const char* referrer,
    const time_t* contentValidUntil,
    const bool allowOfflineAccess,
    const mip_cc_dictionary encryptedAppData,
    const mip_cc_dictionary signedAppData,
    mip_cc_protection_descriptor* protectionDescriptor);
```

## MIP_CC_ProtectionDescriptor_GetProtectionType

From [protection_descriptor_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection_descriptor_cc.h)

Gets type of protection, whether it is defined by an RMS template or not

**Parameters**

 Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| protectionType | [Output] Protection type |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionDescriptor_GetProtectionType(
    const mip_cc_protection_descriptor protectionDescriptor,
    mip_cc_protection_type* protectionType);
```

## MIP_CC_ProtectionDescriptor_GetOwnerSize

From [protection_descriptor_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection_descriptor_cc.h)

Gets size of buffer required to store owner

**Parameters**

 Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| ownerSize | [Output] Size of buffer to hold owner (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionDescriptor_GetOwnerSize(
    const mip_cc_protection_descriptor protectionDescriptor,
    int64_t* ownerSize);
```

## MIP_CC_ProtectionDescriptor_GetOwner

From [protection_descriptor_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection_descriptor_cc.h)

Gets protection owner

**Parameters**

 Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| ownerBuffer | [Output] Buffer the owner will be copied into. |
| ownerBufferSize | Size (in number of chars) of the ownerBuffer. |
| actualOwnerSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionDescriptor_GetOwner(
    const mip_cc_protection_descriptor protectionDescriptor,
    char* ownerBuffer,
    const int64_t ownerBufferSize,
    int64_t* actualOwnerSize);
```

## MIP_CC_ProtectionDescriptor_GetNameSize

From [protection_descriptor_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection_descriptor_cc.h)

Gets size of buffer required to store name

**Parameters**

 Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| nameSize | [Output] Size of buffer to hold name (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionDescriptor_GetNameSize(
    const mip_cc_protection_descriptor protectionDescriptor,
    int64_t* nameSize);
```

## MIP_CC_ProtectionDescriptor_GetName

From [protection_descriptor_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection_descriptor_cc.h)

Gets protection name

**Parameters**

 Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| nameBuffer | [Output] Buffer the name will be copied into. |
| nameBufferSize | Size (in number of chars) of the nameBuffer. |
| actualNameSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionDescriptor_GetName(
    const mip_cc_protection_descriptor protectionDescriptor,
    char* nameBuffer,
    const int64_t nameBufferSize,
    int64_t* actualNameSize);
```

## MIP_CC_ProtectionDescriptor_GetDescriptionSize

From [protection_descriptor_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection_descriptor_cc.h)

Gets size of buffer required to store description

**Parameters**

 Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| descriptionSize | [Output] Size of buffer to hold description (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionDescriptor_GetDescriptionSize(
    const mip_cc_protection_descriptor protectionDescriptor,
    int64_t* descriptionSize);
```

## MIP_CC_ProtectionDescriptor_GetDescription

From [protection_descriptor_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection_descriptor_cc.h)

Gets protection description

**Parameters**

 Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| descriptionBuffer | [Output] Buffer the description will be copied into. |
| descriptionBufferSize | Size (in number of chars) of the descriptionBuffer. |
| actualDescriptionSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionDescriptor_GetDescription(
    const mip_cc_protection_descriptor protectionDescriptor,
    char* descriptionBuffer,
    const int64_t descriptionBufferSize,
    int64_t* actualDescriptionSize);
```

## MIP_CC_ProtectionDescriptor_GetTemplateId

From [protection_descriptor_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection_descriptor_cc.h)

Gets template ID

**Parameters**

 Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| templateId | [Output] Template ID associated with protection |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionDescriptor_GetTemplateId(
    const mip_cc_protection_descriptor protectionDescriptor,
    mip_cc_guid* templateId);
```

## MIP_CC_ProtectionDescriptor_GetLabelId

From [protection_descriptor_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection_descriptor_cc.h)

Gets label ID

**Parameters**

 Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| labelId | [Output] Label ID associated with protection |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionDescriptor_GetLabelId(
    const mip_cc_protection_descriptor protectionDescriptor,
    mip_cc_guid* labelId);
```

## MIP_CC_ProtectionDescriptor_GetContentId

From [protection_descriptor_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection_descriptor_cc.h)

Gets content ID

**Parameters**

 Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| contentId | [Output] Content ID associated with protection |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionDescriptor_GetContentId(
    const mip_cc_protection_descriptor protectionDescriptor,
    mip_cc_guid* contentId);
```

## MIP_CC_ProtectionDescriptor_DoesContentExpire

From [protection_descriptor_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection_descriptor_cc.h)

Gets whether or not content has an expiration time or not

**Parameters**

 Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| doesContentExpire | [Output] Whether or not content expires |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionDescriptor_DoesContentExpire(
    const mip_cc_protection_descriptor protectionDescriptor,
    bool* doesContentExpire);
```

## MIP_CC_ProtectionDescriptor_GetContentValidUntil

From [protection_descriptor_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection_descriptor_cc.h)

Gets protection expiration time (in seconds since epoch)

**Parameters**

 Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| contentValidUntil | [Output] Content expiration time (in seconds since epoch) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionDescriptor_GetContentValidUntil(
    const mip_cc_protection_descriptor protectionDescriptor,
    int64_t* contentValidUntil);
```

## MIP_CC_ProtectionDescriptor_DoesAllowOfflineAccess

From [protection_descriptor_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection_descriptor_cc.h)

Gets whether or not offline access is allowed

**Parameters**

 Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| doesAllowOfflineAccess | [Output] Whether or not offline access is allowed |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionDescriptor_DoesAllowOfflineAccess(
    const mip_cc_protection_descriptor protectionDescriptor,
    bool* doesAllowOfflineAccess);
```

## MIP_CC_ProtectionDescriptor_GetReferrerSize

From [protection_descriptor_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection_descriptor_cc.h)

Gets size of buffer required to store referrer

**Parameters**

 Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| referrerSize | [Output] Size of buffer to hold referrer (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionDescriptor_GetReferrerSize(
    const mip_cc_protection_descriptor protectionDescriptor,
    int64_t* referrerSize);
```

## MIP_CC_ProtectionDescriptor_GetReferrer

From [protection_descriptor_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection_descriptor_cc.h)

Gets protection referrer

**Parameters**

 Parameter | Description
|---|---|
| protectionDescriptor | Descriptor associated with protected content |
| referrerBuffer | [Output] Buffer the referrer will be copied into. |
| referrerBufferSize | Size (in number of chars) of the referrerBuffer. |
| actualReferrerSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionDescriptor_GetReferrer(
    const mip_cc_protection_descriptor protectionDescriptor,
    char* referrerBuffer,
    const int64_t referrerBufferSize,
    int64_t* actualReferrerSize);
```

## MIP_CC_CreateStringList

From [string_list_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/string_list_cc.h)

Contains C API definitions for common string list.

**Parameters**

 Parameter | Description
|---|---|
| strings | Array of strings |
| count | Number of strings |
| stringList | [Output] Newly-created string list |

**Return**: Result code indicating success or failure

```c
MIP_CC_ReleaseStringList
 */
MIP_CC_API(mip_cc_result) MIP_CC_CreateStringList(
    const char** strings,
    const int64_t count,
    mip_cc_string_list* stringList);
```

## MIP_CC_StringList_GetStrings

From [string_list_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/string_list_cc.h)

Get strings that compose a string list

**Parameters**

 Parameter | Description
|---|---|
| stringList | Source string list |
| strings | [Output] Array of strings, memory owned by mip_cc_string_list object |
| count | [Output] Number of strings |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_StringList_GetStrings(
    const mip_cc_string_list stringList,
    const char*** strings,
    int64_t* count);
```

## mip_cc_cancel_task_callback_fn

From [task_dispatcher_delegate_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/task_dispatcher_delegate_cc.h)

Defines task dispatcher callback functions

**Parameters**

 Parameter | Description
|---|---|
| taskId | Unique task identifier |
| taskId | Unique task identifier |

**Return**: True if task was successfully cancelled, else false

```c
MIP_CC_CALLBACK(mip_cc_cancel_task_callback_fn /*typename*/,
    bool /*return*/,
    const char* /*taskId*/);
```

## MIP_CC_CreateTaskDispatcherDelegate

From [task_dispatcher_delegate_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/task_dispatcher_delegate_cc.h)

Callback function for canceling all background tasks

**Parameters**

 Parameter | Description
|---|---|
| dispatchTaskCallback | Function pointer for dispatching async tasks |
| cancelTaskCallback | Function pointer for cancelling background tasks |
| cancelAllTasksCallback | Function pointer for cancelling all background tasks |
| taskDispatcher | [Output] Handle to task dispatcher delegate object |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_CreateTaskDispatcherDelegate(
    const mip_cc_dispatch_task_callback_fn dispatchTaskCallback,
    const mip_cc_cancel_task_callback_fn cancelTaskCallback,
    const mip_cc_cancel_all_tasks_callback_fn cancelAllTasksCallback,
    mip_cc_task_dispatcher_delegate* taskDispatcher);
```

## MIP_CC_CreateTelemetryConfiguration

From [telemetry_configuration_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/telemetry_configuration_cc.h)

Defines custom telemetry settings

**Parameters**

 Parameter | Description
|---|---|
| telemetryConfig | [Output] Newly-created telemetry configuration instance containing default settings |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_CreateTelemetryConfiguration(mip_cc_telemetry_configuration* telemetryConfig);
```

## MIP_CC_TelemetryConfiguration_SetHostName

From [telemetry_configuration_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/telemetry_configuration_cc.h)

Set a telemetry host name which will override internal telemetry settings

**Parameters**

 Parameter | Description
|---|---|
| telemetryConfig | Telemetry configuration |
| hostName | Host name |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_TelemetryConfiguration_SetHostName(
    const mip_cc_telemetry_configuration telemetryConfig,
    const char* hostName);
```

## MIP_CC_TelemetryConfiguration_SetLibraryName

From [telemetry_configuration_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/telemetry_configuration_cc.h)

Set a telemetry shared library override

**Parameters**

 Parameter | Description
|---|---|
| telemetryConfig | Telemetry configuration |
| libraryName | Name of DLL that implements the Aria/1DS SDK's C API |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_TelemetryConfiguration_SetLibraryName(
    const mip_cc_telemetry_configuration telemetryConfig,
    const char* libraryName);
```

## MIP_CC_TelemetryConfiguration_SetHttpDelegate

From [telemetry_configuration_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/telemetry_configuration_cc.h)

Override default telemetry HTTP stack with client's own

**Parameters**

 Parameter | Description
|---|---|
| telemetryConfig | Telemetry configuration |
| httpDelegate | HTTP callback instance implemented by client application |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_TelemetryConfiguration_SetHttpDelegate(
    const mip_cc_telemetry_configuration telemetryConfig,
    const mip_cc_http_delegate httpDelegate);
```

## MIP_CC_TelemetryConfiguration_SetIsNetworkDetectionEnabled

From [telemetry_configuration_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/telemetry_configuration_cc.h)

Sets whether or not the telemetry component is allowed ping network status on a background thread

**Parameters**

 Parameter | Description
|---|---|
| telemetryConfig | Telemetry configuration |
| isCachingEnabled | Whether or not the telemetry component is allowed ping network status on a background thread |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_TelemetryConfiguration_SetIsNetworkDetectionEnabled(
    const mip_cc_telemetry_configuration telemetryConfig,
    const bool isNetworkDetectionEnabled);
```

## MIP_CC_TelemetryConfiguration_SetIsLocalCachingEnabled

From [telemetry_configuration_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/telemetry_configuration_cc.h)

Sets whether or not the telemetry component is allowed to write caches to disk

**Parameters**

 Parameter | Description
|---|---|
| telemetryConfig | Telemetry configuration |
| isCachingEnabled | Whether or not the telemetry component is allowed to write caches to disk |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_TelemetryConfiguration_SetIsLocalCachingEnabled(
    const mip_cc_telemetry_configuration telemetryConfig,
    const bool isCachingEnabled);
```

## MIP_CC_TelemetryConfiguration_SetIsTraceLoggingEnabled

From [telemetry_configuration_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/telemetry_configuration_cc.h)

Sets whether or not the telemetry component is allowed to write logs to disk

**Parameters**

 Parameter | Description
|---|---|
| telemetryConfig | Telemetry configuration |
| isTraceLoggingEnabled | Whether or not the telemetry component is allowed to write logs to disk |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_TelemetryConfiguration_SetIsTraceLoggingEnabled(
    const mip_cc_telemetry_configuration telemetryConfig,
    const bool isTraceLoggingEnabled);
```

## MIP_CC_TelemetryConfiguration_SetIsTelemetryOptedOut

From [telemetry_configuration_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/telemetry_configuration_cc.h)

Sets whether or not an application/user has opted out of optional telemetry

**Parameters**

 Parameter | Description
|---|---|
| telemetryConfig | Telemetry configuration |
| isTelemetryOptedOut | Whether or not an application/user has opted out of optional telemetry |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_TelemetryConfiguration_SetIsTelemetryOptedOut(
    const mip_cc_telemetry_configuration telemetryConfig,
    const bool isTelemetryOptedOut);
```

## MIP_CC_TelemetryConfiguration_SetIsFastShutdownEnabled

From [telemetry_configuration_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/telemetry_configuration_cc.h)

Sets whether fast telemetry shutdown is enabled or not

**Parameters**

 Parameter | Description
|---|---|
| telemetryConfig | Telemetry configuration |
| isFastShutdownEnabled | Whether or not the telemetry fast shutdown is enabled |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_TelemetryConfiguration_SetIsFastShutdownEnabled(
    const mip_cc_telemetry_configuration telemetryConfig, 
    const bool isFastShutdownEnabled);
```

## MIP_CC_TelemetryConfiguration_SetCustomSettings

From [telemetry_configuration_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/telemetry_configuration_cc.h)

Sets custom telemetry settings

**Parameters**

 Parameter | Description
|---|---|
| telemetryConfig | Telemetry configuration |
| customSettings | Custom telemetry settings |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_TelemetryConfiguration_SetCustomSettings(
    const mip_cc_telemetry_configuration telemetryConfig,
    const mip_cc_dictionary customSettings);
```

## MIP_CC_ProtectionEngine_CreateProtectionHandlerForPublishing

From [protection/protection_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_engine_cc.h)

Defines C-Style ProtectionEngine functions

**Parameters**

 Parameter | Description
|---|---|
| engine | Protection engine to release |
| engine | Engine under which a handler will be created |
| settings | Protection handler settings |
| context | Client context that will be opaquely passed to HttpDelegate and AuthDelegate |
| handler | [Output] Newly-created protection handler instance |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionEngine_CreateProtectionHandlerForPublishing(
    const mip_cc_protection_engine engine,
    const mip_cc_protection_handler_publishing_settings settings,
    const void* context,
    mip_cc_protection_handler* handler);
```

## MIP_CC_ProtectionEngine_CreateProtectionHandlerForConsumption

From [protection/protection_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_engine_cc.h)

Creates a protection handler for consuming existing content

**Parameters**

 Parameter | Description
|---|---|
| engine | Engine under which a handler will be created |
| settings | Protection handler settings |
| context | Client context that will be opaquely passed to HttpDelegate and AuthDelegate |
| handler | [Output] Newly-created protection handler instance |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionEngine_CreateProtectionHandlerForConsumption(
  const mip_cc_protection_engine engine,
  const mip_cc_protection_handler_consumption_settings settings,
  const void* context,
  mip_cc_protection_handler* handler);
```

## MIP_CC_ProtectionEngine_GetEngineIdSize

From [protection/protection_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_engine_cc.h)

Gets size of buffer required to engine ID

**Parameters**

 Parameter | Description
|---|---|
| engine | Protection engine |
| idSize | [Output] Size of buffer to hold engine ID (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionEngine_GetEngineIdSize(
    const mip_cc_protection_engine engine,
    int64_t* idSize);
```

## MIP_CC_ProtectionEngine_GetEngineId

From [protection/protection_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_engine_cc.h)

Gets engine ID

**Parameters**

 Parameter | Description
|---|---|
| engine | Protection engine |
| idBuffer | [Output] Buffer the id will be copied into. |
| idBufferSize | Size (in number of chars) of the idBuffer. |
| actualIdSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionEngine_GetEngineId(
    const mip_cc_protection_engine engine,
    char* idBuffer,
    const int64_t idBufferSize,
    int64_t* actualIdSize);
```

## MIP_CC_ProtectionEngine_GetTemplatesSize

From [protection/protection_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_engine_cc.h)

Gets the number of RMS templates associated with a protection engine

**Parameters**

 Parameter | Description
|---|---|
| engine | Protection engine |
| context | Client context that will be opaquely passed to HttpDelegate and AuthDelegate |
| templatesSize | [Output] Number of templates |

**Return**: Result code indicating success or failure

```c
MIP_CC_ProtectionEngine_GetTemplates'
 *       directly with a pre-defined buffer to avoid unnecessary extra HTTP operations.
 */
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionEngine_GetTemplatesSize(
    const mip_cc_protection_engine engine,
    const void* context,
    int64_t* templatesSize);
```

## MIP_CC_ProtectionEngine_GetTemplates

From [protection/protection_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_engine_cc.h)

Get collection of templates available to a user

**Parameters**

 Parameter | Description
|---|---|
| engine | Protection engine |
| context | Client context that will be opaquely passed to HttpDelegate and AuthDelegate |
| templateBuffer | [Output] Buffer the templates will be copied into. |
| templateBufferSize | Size (in number of items) of the templateBuffer. |
| actualTemplatesSize | [Output] Number of template IDs written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionEngine_GetTemplates(
    const mip_cc_protection_engine engine,
    const void* context,
    mip_cc_guid* templateBuffer,
    const int64_t templateBufferSize,
    int64_t* actualTemplatesSize);
```

## MIP_CC_ProtectionEngine_GetRightsForLabelId

From [protection/protection_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_engine_cc.h)

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

**Return**: Result code indicating success or failure

```c
MIP_CC_ReleaseStringList
 */
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionEngine_GetRightsForLabelId(
    const mip_cc_protection_engine engine,
    const void* context,
    const char* documentId,
    const char* labelId,
    const char* ownerEmail,
    const char* delegatedUserEmail,
    mip_cc_string_list* rights);
```

## MIP_CC_ProtectionEngine_GetClientDataSize

From [protection/protection_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_engine_cc.h)

Gets the size of client data associated with a protection engine

**Parameters**

 Parameter | Description
|---|---|
| engine | Protection engine |
| clientDataSize | [Output] Size of client data (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionEngine_GetClientDataSize(
    const mip_cc_protection_engine engine,
    int64_t* clientDataSize);
```

## MIP_CC_ProtectionEngine_GetClientData

From [protection/protection_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_engine_cc.h)

Get client data associated with a protection engine

**Parameters**

 Parameter | Description
|---|---|
| engine | Protection engine |
| clientDataBuffer | [Output] Buffer the client data will be copied into |
| clientDataBufferSize | Size (in number of chars) of clientDataBuffer. |
| actualClientDataSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionEngine_GetClientData(
    const mip_cc_protection_engine engine,
    char* clientDataBuffer,
    const int64_t clientDataBufferSize,
    int64_t* actualClientDataSize);
```

## MIP_CC_CreateProtectionEngineSettingsWithIdentity

From [protection/protection_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_engine_cc.h)

Create a settings object used to create a brand new protection engine

**Parameters**

 Parameter | Description
|---|---|
| identity | Identity that will be associated with ProtectionEngine |
| clientData | Customizable client data that is stored alongside the engine |
| locale | Locale in which text results will output |
| engineSettings | [Output] Newly-created settings instance |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_CreateProtectionEngineSettingsWithIdentity(
    const mip_cc_identity* identity,
    const char* clientData,
    const char* locale,
    mip_cc_protection_engine_settings* engineSettings);
```

## MIP_CC_CreateProtectionEngineSettingsWithEngineId

From [protection/protection_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_engine_cc.h)

Create a settings object used to load an existing protection engine by engine ID if it

**Parameters**

 Parameter | Description
|---|---|
| engineId | ID of existing cached engine |
| identity | (Optional) Identity that will be associated with ProtectionEngine |
| clientData | Customizable client data that is stored alongside the engine |
| locale | Locale in which text results will output |
| engineSettings | [Output] Newly-created settings instance |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_CreateProtectionEngineSettingsWithEngineId(
    const char* engineId,
    const mip_cc_identity* identity,
    const char* clientData,
    const char* locale,
    mip_cc_protection_engine_settings* engineSettings);
```

## MIP_CC_ProtectionEngineSettings_SetClientData

From [protection/protection_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_engine_cc.h)

Sets the client data that will be stored opaquely alongside this engine and persist across sessions

**Parameters**

 Parameter | Description
|---|---|
| settings | Engine settings |
| clientData | Client data |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionEngineSettings_SetClientData(
    const mip_cc_protection_engine_settings engineSettings,
    const char* clientData);
```

## MIP_CC_ProtectionEngineSettings_SetCustomSettings

From [protection/protection_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_engine_cc.h)

Configures custom settings, used for feature gating and testing.

**Parameters**

 Parameter | Description
|---|---|
| engineSettings | Engine settings |
| customSettings | Key/value pairs of custom settings |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionEngineSettings_SetCustomSettings(
    const mip_cc_protection_engine_settings engineSettings,
    const mip_cc_dictionary customSettings);
```

## MIP_CC_ProtectionEngineSettings_SetSessionId

From [protection/protection_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_engine_cc.h)

Sets the session ID that can be used to correlate logs and telemetry

**Parameters**

 Parameter | Description
|---|---|
| settings | Engine settings |
| sessionId | Session ID that represents the lifetime of a protection engine |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionEngineSettings_SetSessionId(
    const mip_cc_protection_engine_settings engineSettings,
    const char* sessionId);
```

## MIP_CC_ProtectionEngineSettings_SetCloudEndpointBaseUrl

From [protection/protection_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_engine_cc.h)

Sets base URL for all service requests

**Parameters**

 Parameter | Description
|---|---|
| settings | Engine settings |
| cloudEndpointBaseUrl | Base URL (e.g. 'https://api.aadrm.com') |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionEngineSettings_SetCloudEndpointBaseUrl(
    const mip_cc_protection_engine_settings engineSettings,
    const char* cloudEndpointBaseUrl);
```

## MIP_CC_CreateProtectionHandlerPublishingSettings

From [protection/protection_handler_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_handler_cc.h)

Defines C-Style ProtectionHandler interface

**Parameters**

 Parameter | Description
|---|---|
| descriptor | Protection details |
| settings | [Output] Newly-created settings instance |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_CreateProtectionHandlerPublishingSettings(
    const mip_cc_protection_descriptor descriptor,
    mip_cc_protection_handler_publishing_settings* settings);
```

## MIP_CC_ProtectionHandlerPublishingSettings_SetIsDeprecatedAlgorithmPreferred

From [protection/protection_handler_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_handler_cc.h)

Sets whether or not deprecated crypto algorithm (ECB) is preferred for backwards compatibility

**Parameters**

 Parameter | Description
|---|---|
| settings | Protection handler settings |
| isDeprecatedAlgorithmPreferred | Whether or not deprecated algorithm is preferred |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionHandlerPublishingSettings_SetIsDeprecatedAlgorithmPreferred(
    const mip_cc_protection_handler_publishing_settings settings,
    const bool isDeprecatedAlgorithmPreferred);
```

## MIP_CC_ProtectionHandlerPublishingSettings_SetIsAuditedExtractionAllowed

From [protection/protection_handler_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_handler_cc.h)

Sets whether or not non-MIP-aware applications are allowed to open protected content

**Parameters**

 Parameter | Description
|---|---|
| settings | Protection handler settings |
| isAuditedExtractionAllowed | Whether or not non-MIP-aware applications are allowed to open protected content |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionHandlerPublishingSettings_SetIsAuditedExtractionAllowed(
    const mip_cc_protection_handler_publishing_settings settings,
    const bool isAuditedExtractionAllowed);
```

## MIP_CC_ProtectionHandlerPublishingSettings_SetIsPublishingFormatJson

From [protection/protection_handler_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_handler_cc.h)

Sets whether or not PL is in JSON format (default is XML)

**Parameters**

 Parameter | Description
|---|---|
| settings | Protection handler settings |
| isPublishingFormatJson | Whether or not resulting PL should be in JSON format |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionHandlerPublishingSettings_SetIsPublishingFormatJson(
    const mip_cc_protection_handler_publishing_settings settings,
    const bool isPublishingFormatJson);
```

## MIP_CC_ProtectionHandlerPublishingSettings_SetDelegatedUserEmail

From [protection/protection_handler_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_handler_cc.h)

Sets delegated user

**Parameters**

 Parameter | Description
|---|---|
| settings | Protection handler settings |
| delegatedUserEmail | Email address of delegated user |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionHandlerPublishingSettings_SetDelegatedUserEmail(
    const mip_cc_protection_handler_publishing_settings settings,
    const char* delegatedUserEmail);
```

## MIP_CC_CreateProtectionHandlerConsumptionSettings

From [protection/protection_handler_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_handler_cc.h)

Create a settings object used to create a protection handler for consuming existing content

**Parameters**

 Parameter | Description
|---|---|
| publishingLicenseBuffer | Buffer containing raw publishing license |
| publishingLicenseBufferSize | Size of publishing license buffer |
| isOfflineOnly | Whether or not fetching a new license from RMS server is allowed |
| delegatedUserEmail | (Optional) User on behalf of whom protection operations will be performed |
| settings | [Output] Newly-created settings instance |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_CreateProtectionHandlerConsumptionSettings(
    const uint8_t* publishingLicenseBuffer,
    const int64_t publishingLicenseBufferSize,
    mip_cc_protection_handler_consumption_settings* settings);
```

## MIP_CC_ProtectionHandlerConsumptionSettings_SetIsOfflineOnly

From [protection/protection_handler_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_handler_cc.h)

Sets whether or not protection handler creation permits online HTTP operations

**Parameters**

 Parameter | Description
|---|---|
| settings | Protection handler settings |
| isOfflineOnly | True if HTTP operations are forbidden, else false |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionHandlerConsumptionSettings_SetIsOfflineOnly(
    const mip_cc_protection_handler_consumption_settings settings,
    const bool isOfflineOnly);
```

## MIP_CC_ProtectionHandlerConsumptionSettings_SetDelegatedUserEmail

From [protection/protection_handler_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_handler_cc.h)

Sets delegated user

**Parameters**

 Parameter | Description
|---|---|
| settings | Protection handler settings |
| delegatedUserEmail | Email address of delegated user |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionHandlerConsumptionSettings_SetDelegatedUserEmail(
    const mip_cc_protection_handler_consumption_settings settings,
    const char* delegatedUserEmail);
```

## MIP_CC_ProtectionHandler_GetSerializedPublishingLicenseSize

From [protection/protection_handler_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_handler_cc.h)

Gets size of publishing license (in bytes)

**Parameters**

 Parameter | Description
|---|---|
| handler | Handler representing protected content |
| publishingLicenseBufferSize | [Output] Size of publishing license (in bytes) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionHandler_GetSerializedPublishingLicenseSize(
    const mip_cc_protection_handler handler,
    int64_t* publishingLicenseBufferSize);
```

## MIP_CC_ProtectionHandler_GetSerializedPublishingLicense

From [protection/protection_handler_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_handler_cc.h)

Gets publishing license

**Parameters**

 Parameter | Description
|---|---|
| handler | Handler representing protected content |
| publishingLicenseBuffer | [Output] Buffer to which publishing license will be written |
| publishingLicenseBufferSize | Size of publishing license buffer |
| actualPublishingLicenseSize | [Output] Actual size of publishing license (in bytes) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionHandler_GetSerializedPublishingLicense(
    const mip_cc_protection_handler handler,
    uint8_t* publishingLicenseBuffer,
    const int64_t publishingLicenseBufferSize,
    int64_t* actualPublishingLicenseSize);
```

## MIP_CC_ProtectionHandler_GetProtectionDescriptor

From [protection/protection_handler_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_handler_cc.h)

Gets protection descriptor

**Parameters**

 Parameter | Description
|---|---|
| handler | Handler representing protected content |
| descriptor | [Output] Protection descriptor |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionHandler_GetProtectionDescriptor(
    const mip_cc_protection_handler handler,
    mip_cc_protection_descriptor* descriptor);
```

## MIP_CC_ProtectionHandler_GetRights

From [protection/protection_handler_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_handler_cc.h)

Gets list of rights granted to a user

**Parameters**

 Parameter | Description
|---|---|
| handler | Handler representing protected content |
| rights | [Output] List of rights granted to a user, memory owned by caller |

**Return**: Result code indicating success or failure

```c
MIP_CC_ReleaseStringList
 */
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionHandler_GetRights(
    const mip_cc_protection_handler handler,
    mip_cc_string_list* rights);
```

## MIP_CC_ProtectionHandler_GetProtectedContentSize

From [protection/protection_handler_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_handler_cc.h)

Calculates size of protected content, factoring in padding, etc.

**Parameters**

 Parameter | Description
|---|---|
| handler | Handler representing protected content |
| unprotectedSize | Size of unprotected/cleartext content (in bytes) |
| includesFinalBlock | Describes if the unprotected content in question includes the final block or not. |
| protectedSize | [Output] Size of protected content |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionHandler_GetProtectedContentSize(
    const mip_cc_protection_handler handler,
    const int64_t unprotectedSize,
    const bool includesFinalBlock,
    int64_t* protectedSize);
```

## MIP_CC_ProtectionHandler_GetBlockSize

From [protection/protection_handler_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_handler_cc.h)

Gets the block size (in bytes) for the cipher mode used by a protection handler

**Parameters**

 Parameter | Description
|---|---|
| handler | Handler representing protected content |
| blockSize | [Output] Block size (in bytes) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionHandler_GetBlockSize(
    const mip_cc_protection_handler handler,
    int64_t* blockSize);
```

## MIP_CC_ProtectionHandler_GetIssuedUserSize

From [protection/protection_handler_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_handler_cc.h)

Gets size of buffer required to store user that has been granted access to protected content

**Parameters**

 Parameter | Description
|---|---|
| handler | Handler representing protected content |
| issuedUserSize | [Output] Size of buffer to hold issued user (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionHandler_GetIssuedUserSize(
    const mip_cc_protection_handler handler,
    int64_t* issuedUserSize);
```

## MIP_CC_ProtectionHandler_GetIssuedUser

From [protection/protection_handler_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_handler_cc.h)

Gets the user that has been granted access to protected content

**Parameters**

 Parameter | Description
|---|---|
| handler | Handler representing protected content |
| issuedUserBuffer | [Output] Buffer the issued user will be copied into. |
| issuedUserBufferSize | Size (in number of chars) of the issuedUserBuffer. |
| actualIssuedUserSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionHandler_GetIssuedUser(
    const mip_cc_protection_handler handler,
    char* issuedUserBuffer,
    const int64_t issuedUserBufferSize,
    int64_t* actualIssuedUserSize);
```

## MIP_CC_ProtectionHandler_GetOwnerSize

From [protection/protection_handler_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_handler_cc.h)

Gets size of buffer required to store the owner of protected content

**Parameters**

 Parameter | Description
|---|---|
| handler | Handler representing protected content |
| ownerSize | [Output] Size of buffer to hold issued user (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionHandler_GetOwnerSize(
    const mip_cc_protection_handler handler,
    int64_t* ownerSize);
```

## MIP_CC_ProtectionHandler_GetOwner

From [protection/protection_handler_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_handler_cc.h)

Gets the owner of protected content

**Parameters**

 Parameter | Description
|---|---|
| handler | Handler representing protected content |
| ownerBuffer | [Output] Buffer the issued user will be copied into. |
| ownerBufferSize | Size (in number of chars) of the ownerBuffer. |
| actualOwnerSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionHandler_GetOwner(
    const mip_cc_protection_handler handler,
    char* ownerBuffer,
    const int64_t ownerBufferSize,
    int64_t* actualOwnerSize);
```

## MIP_CC_ProtectionHandler_GetContentId

From [protection/protection_handler_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_handler_cc.h)

Gets the content IE of protected content

**Parameters**

 Parameter | Description
|---|---|
| handler | Handler representing protected content |
| contentId | [Output] Content ID |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionHandler_GetContentId(
    const mip_cc_protection_handler handler,
    mip_cc_guid* contentId);
```

## MIP_CC_ProtectionHandler_DoesUseDeprecatedAlgorithm

From [protection/protection_handler_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_handler_cc.h)

Gets whether or not protection handler uses deprecated crypto algorithm (ECB) for backwards compatibility

**Parameters**

 Parameter | Description
|---|---|
| handler | Handler representing protected content |
| doesUseDeprecatedAlgorithm | [Output] Whether or not protection handler uses deprecated crypto algorithm |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionHandler_DoesUseDeprecatedAlgorithm(
    const mip_cc_protection_handler handler,
    bool* doesUseDeprecatedAlgorithm);
```

## MIP_CC_ProtectionHandler_EncryptBuffer

From [protection/protection_handler_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_handler_cc.h)

Encrypt a buffer

**Parameters**

 Parameter | Description
|---|---|
| offsetFromStart | Relative position of inputBuffer from the very beginning of the cleartext content |
| inputBuffer | Buffer of cleartext content that will be encrypted |
| inputBufferSize | Size (in bytes) of input buffer |
| outputBuffer | [Output] Buffer into which encrypted content will be copied |
| outputBufferSize | Size (in bytes) of output buffer |
| isFinal | If input buffer contains the final cleartext bytes or not |
| actualEncryptedSize | [Output] Actual size of encrypted content (in bytes) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionHandler_EncryptBuffer(
    const mip_cc_protection_handler handler,
    const int64_t offsetFromStart,
    const uint8_t* inputBuffer,
    const int64_t inputBufferSize,
    uint8_t* outputBuffer,
    const int64_t outputBufferSize,
    const bool isFinal,
    int64_t* actualEncryptedSize);
```

## MIP_CC_ProtectionHandler_DecryptBuffer

From [protection/protection_handler_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_handler_cc.h)

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

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionHandler_DecryptBuffer(
    const mip_cc_protection_handler handler,
    const int64_t offsetFromStart,
    const uint8_t* inputBuffer,
    const int64_t inputBufferSize,
    uint8_t* outputBuffer,
    const int64_t outputBufferSize,
    const bool isFinal,
    int64_t *actualDecryptedSize);
```

## MIP_CC_ProtectionProfile_AddEngine

From [protection/protection_profile_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_profile_cc.h)

Defines C-Style ProtectionProfile functions

**Parameters**

 Parameter | Description
|---|---|
| profile | Parent profile under which an engine will be added |
| settings | Protection engine settings |
| engine | [Output] Newly-created protection engine instance |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionProfile_AddEngine(
    const mip_cc_protection_profile profile,
    const mip_cc_protection_engine_settings settings,
    mip_cc_protection_engine* engine);
```

## MIP_CC_LoadProtectionProfile

From [protection/protection_profile_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_profile_cc.h)

Load a profile

**Parameters**

 Parameter | Description
|---|---|
| settings | Profile settings |
| profile | [Output] Newly-created protection profile instance |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_LoadProtectionProfile(
    const mip_cc_protection_profile_settings settings,
    mip_cc_protection_profile* profile);
```

## MIP_CC_CreateProtectionProfileSettings

From [protection/protection_profile_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_profile_cc.h)

Release resources associated with a protection profile

**Parameters**

 Parameter | Description
|---|---|
| profile | Protection profile to be released |
| mipContext | Global context shared across all profiles |
| cacheStorageType | Storage cache configuration |
| authCallback | Callback object to be used for authentication, implemented by client application |
| consentCallback | Callback object to be used for consent, implemented by client application |
| settings | [Output] Newly-created settings instance |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_CreateProtectionProfileSettings(
    const mip_cc_mip_context mipContext,
    const mip_cc_cache_storage_type cacheStorageType,
    const mip_cc_auth_callback authCallback,
    const mip_cc_consent_callback consentCallback,
    mip_cc_protection_profile_settings* settings);
```

## MIP_CC_ProtectionProfileSettings_SetSessionId

From [protection/protection_profile_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_profile_cc.h)

Sets the session ID that can be used to correlate logs and telemetry

**Parameters**

 Parameter | Description
|---|---|
| settings | Profile settings |
| sessionId | Session ID that represents the lifetime of a protection profile |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionProfileSettings_SetSessionId(
    const mip_cc_protection_profile_settings settings,
    const char* sessionId);
```

## MIP_CC_ProtectionProfileSettings_SetCanCacheLicenses

From [protection/protection_profile_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_profile_cc.h)

Configures whether or not end user licenses (EULs) will be cached locally

**Parameters**

 Parameter | Description
|---|---|
| settings | Profile settings |
| canCacheLicenses | Whether or not engine should cache a license when opening protected content |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionProfileSettings_SetCanCacheLicenses(
    const mip_cc_protection_profile_settings settings,
    const bool canCacheLicenses);
```

## MIP_CC_ProtectionProfileSettings_SetHttpDelegate

From [protection/protection_profile_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_profile_cc.h)

Override default HTTP stack with client's own

**Parameters**

 Parameter | Description
|---|---|
| settings | Profile settings to which HTTP delegate will be assigned |
| httpDelegate | HTTP callback instance implemented by client application |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionProfileSettings_SetHttpDelegate(
    const mip_cc_protection_profile_settings settings,
    const mip_cc_http_delegate httpDelegate);
```

## MIP_CC_ProtectionProfileSettings_SetTaskDispatcherDelegate

From [protection/protection_profile_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_profile_cc.h)

Override default async task dispatcher with client's own

**Parameters**

 Parameter | Description
|---|---|
| settings | Profile settings to which task dispatcher delegate will be assigned |
| taskDispatcherDelegate | Task dispatcher callback instance implemented by client application |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionProfileSettings_SetTaskDispatcherDelegate(
    const mip_cc_protection_profile_settings settings,
    const mip_cc_task_dispatcher_delegate taskDispatcherDelegate);
```

## MIP_CC_ProtectionProfileSettings_SetCustomSettings

From [protection/protection_profile_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection/protection_profile_cc.h)

Configures custom settings, used for feature gating and testing.

**Parameters**

 Parameter | Description
|---|---|
| settings | Profile settings |
| customSettings | Key/value pairs of custom settings |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectionProfileSettings_SetCustomSettings(
    const mip_cc_protection_profile_settings settings,
    const mip_cc_dictionary customSettings);
```

## MIP_CC_Action_GetType

From [upe/action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/action_cc.h)

Contains C API definitions for label policy actions

**Parameters**

 Parameter | Description
|---|---|
| action | Action |
| actionType | [Output] Type of action |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_Action_GetType(
    const mip_cc_action action,
    mip_cc_action_type* actionType);
```

## MIP_CC_Action_GetId

From [upe/action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/action_cc.h)

Gets an action's ID

**Parameters**

 Parameter | Description
|---|---|
| action | Action |
| id | [Output] Unique action ID |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_Action_GetId(
    const mip_cc_action action,
    mip_cc_guid* id);
```

## MIP_CC_ActionResult_GetActions

From [upe/action_result_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/action_result_cc.h)

A file containing definition of action result type

**Parameters**

 Parameter | Description
|---|---|
| actionResult | Source action result |
| actions | [Output] Array of actions, memory owned by mip_cc_action_result object |
| count | [Output] Number of key/value pairs |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ActionResult_GetActions(
    const mip_cc_action_result actionResult,
    mip_cc_action** actions,
    int64_t* count);
```

## MIP_CC_AddContentFooterAction_GetUIElementNameSize

From [upe/add_content_footer_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_content_footer_action_cc.h)

Contains C API definitions for "add content footer" label policy action

**Parameters**

 Parameter | Description
|---|---|
| action | "add content footer" action |
| nameSize | [Output] Size of buffer to hold UI element name (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddContentFooterAction_GetUIElementNameSize(
    const mip_cc_action action,
    int64_t* nameSize);
```

## MIP_CC_AddContentFooterAction_GetUIElementName

From [upe/add_content_footer_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_content_footer_action_cc.h)

Gets an "add content footer" action's UI element name

**Parameters**

 Parameter | Description
|---|---|
| action | "add content footer" action |
| nameBuffer | [Output] Buffer the UI element name will be copied into. |
| nameBufferSize | Size (in number of chars) of the nameBuffer. |
| actualNameSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddContentFooterAction_GetUIElementName(
    const mip_cc_action action,
    char* nameBuffer,
    const int64_t nameBufferSize,
    int64_t* actualNameSize);
```

## MIP_CC_AddContentFooterAction_GetTextSize

From [upe/add_content_footer_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_content_footer_action_cc.h)

Gets size of buffer required to store an "add content footer" action's text

**Parameters**

 Parameter | Description
|---|---|
| action | "add content footer" action |
| nameSize | [Output] Size of buffer to hold text (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddContentFooterAction_GetTextSize(
    const mip_cc_action action,
    int64_t* textSize);
```

## MIP_CC_AddContentFooterAction_GetText

From [upe/add_content_footer_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_content_footer_action_cc.h)

Gets an "add content footer" action's text

**Parameters**

 Parameter | Description
|---|---|
| action | "add content footer" action |
| textBuffer | [Output] Buffer the text will be copied into. |
| textBufferSize | Size (in number of chars) of the textBuffer. |
| actualTextSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddContentFooterAction_GetText(
    const mip_cc_action action,
    char* textBuffer,
    const int64_t textBufferSize,
    int64_t* actualTextSize);
```

## MIP_CC_AddContentFooterAction_GetFontNameSize

From [upe/add_content_footer_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_content_footer_action_cc.h)

Gets size of buffer required to store an "add content footer" action's font name

**Parameters**

 Parameter | Description
|---|---|
| action | "add content footer" action |
| nameSize | [Output] Size of buffer to hold font name (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddContentFooterAction_GetFontNameSize(
    const mip_cc_action action,
    int64_t* nameSize);
```

## MIP_CC_AddContentFooterAction_GetFontName

From [upe/add_content_footer_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_content_footer_action_cc.h)

Gets an "add content footer" action's font name

**Parameters**

 Parameter | Description
|---|---|
| action | "add content footer" action |
| nameBuffer | [Output] Buffer the font name will be copied into. |
| nameBufferSize | Size (in number of chars) of the nameBuffer. |
| actualNameSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddContentFooterAction_GetFontName(
    const mip_cc_action action,
    char* nameBuffer,
    const int64_t nameBufferSize,
    int64_t* actualNameSize);
```

## MIP_CC_AddContentFooterAction_GetFontSize

From [upe/add_content_footer_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_content_footer_action_cc.h)

Gets the integer font size

**Parameters**

 Parameter | Description
|---|---|
| action | "add content footer" action |
| fontSize | [Output] Font size |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddContentFooterAction_GetFontSize(
    const mip_cc_action action,
    int32_t* fontSize);
```

## MIP_CC_AddContentFooterAction_GetFontColorSize

From [upe/add_content_footer_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_content_footer_action_cc.h)

Gets size of buffer required to store an "add content footer" action's font color

**Parameters**

 Parameter | Description
|---|---|
| action | "add content footer" action |
| colorSize | [Output] Size of buffer to hold font color (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddContentFooterAction_GetFontColorSize(
    const mip_cc_action action,
    int64_t* colorSize);
```

## MIP_CC_AddContentFooterAction_GetFontColor

From [upe/add_content_footer_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_content_footer_action_cc.h)

Gets an "add content footer" action's font color (for example, "#000000")

**Parameters**

 Parameter | Description
|---|---|
| action | "add content footer" action |
| colorBuffer | [Output] Buffer the font color will be copied into. |
| colorBufferSize | Size (in number of chars) of the colorBuffer. |
| actualColorSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddContentFooterAction_GetFontColor(
    const mip_cc_action action,
    char* colorBuffer,
    const int64_t colorBufferSize,
    int64_t* actualColorSize);
```

## MIP_CC_AddContentFooterAction_GetAlignment

From [upe/add_content_footer_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_content_footer_action_cc.h)

Gets the alignment

**Parameters**

 Parameter | Description
|---|---|
| action | "add content footer" action |
| alignment | [Output] Alignment |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddContentFooterAction_GetAlignment(
    const mip_cc_action action,
    mip_cc_content_mark_alignment* alignment);
```

## MIP_CC_AddContentFooterAction_GetMargin

From [upe/add_content_footer_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_content_footer_action_cc.h)

Gets the margin size

**Parameters**

 Parameter | Description
|---|---|
| action | "add content footer" action |
| marginSize | [Output] Margin size (in mm) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddContentFooterAction_GetMargin(
    const mip_cc_action action,
    int32_t* marginSize);
```

## MIP_CC_AddContentHeaderAction_GetUIElementNameSize

From [upe/add_content_header_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_content_header_action_cc.h)

Contains C API definitions for "add content header" label policy action

**Parameters**

 Parameter | Description
|---|---|
| action | "add content header" action |
| nameSize | [Output] Size of buffer to hold UI element name (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddContentHeaderAction_GetUIElementNameSize(
    const mip_cc_action action,
    int64_t* nameSize);
```

## MIP_CC_AddContentHeaderAction_GetUIElementName

From [upe/add_content_header_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_content_header_action_cc.h)

Gets an "add content header" action's UI element name

**Parameters**

 Parameter | Description
|---|---|
| action | "add content header" action |
| nameBuffer | [Output] Buffer the UI element name will be copied into. |
| nameBufferSize | Size (in number of chars) of the nameBuffer. |
| actualNameSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddContentHeaderAction_GetUIElementName(
    const mip_cc_action action,
    char* nameBuffer,
    const int64_t nameBufferSize,
    int64_t* actualNameSize);
```

## MIP_CC_AddContentHeaderAction_GetTextSize

From [upe/add_content_header_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_content_header_action_cc.h)

Gets size of buffer required to store an "add content header" action's text

**Parameters**

 Parameter | Description
|---|---|
| action | "add content header" action |
| nameSize | [Output] Size of buffer to hold text (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddContentHeaderAction_GetTextSize(
    const mip_cc_action action,
    int64_t* textSize);
```

## MIP_CC_AddContentHeaderAction_GetText

From [upe/add_content_header_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_content_header_action_cc.h)

Gets an "add content header" action's text

**Parameters**

 Parameter | Description
|---|---|
| action | "add content header" action |
| textBuffer | [Output] Buffer the text will be copied into. |
| textBufferSize | Size (in number of chars) of the textBuffer. |
| actualTextSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddContentHeaderAction_GetText(
    const mip_cc_action action,
    char* textBuffer,
    const int64_t textBufferSize,
    int64_t* actualTextSize);
```

## MIP_CC_AddContentHeaderAction_GetFontNameSize

From [upe/add_content_header_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_content_header_action_cc.h)

Gets size of buffer required to store an "add content header" action's font name

**Parameters**

 Parameter | Description
|---|---|
| action | "add content header" action |
| nameSize | [Output] Size of buffer to hold font name (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddContentHeaderAction_GetFontNameSize(
    const mip_cc_action action,
    int64_t* nameSize);
```

## MIP_CC_AddContentHeaderAction_GetFontName

From [upe/add_content_header_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_content_header_action_cc.h)

Gets an "add content header" action's font name

**Parameters**

 Parameter | Description
|---|---|
| action | "add content header" action |
| nameBuffer | [Output] Buffer the font name will be copied into. |
| nameBufferSize | Size (in number of chars) of the nameBuffer. |
| actualNameSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddContentHeaderAction_GetFontName(
    const mip_cc_action action,
    char* nameBuffer,
    const int64_t nameBufferSize,
    int64_t* actualNameSize);
```

## MIP_CC_AddContentHeaderAction_GetFontSize

From [upe/add_content_header_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_content_header_action_cc.h)

Gets the integer font size

**Parameters**

 Parameter | Description
|---|---|
| action | "add content header" action |
| fontSize | [Output] Font size |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddContentHeaderAction_GetFontSize(
    const mip_cc_action action,
    int32_t* fontSize);
```

## MIP_CC_AddContentHeaderAction_GetFontColorSize

From [upe/add_content_header_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_content_header_action_cc.h)

Gets size of buffer required to store an "add content header" action's font color

**Parameters**

 Parameter | Description
|---|---|
| action | "add content header" action |
| colorSize | [Output] Size of buffer to hold font color (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddContentHeaderAction_GetFontColorSize(
    const mip_cc_action action,
    int64_t* colorSize);
```

## MIP_CC_AddContentHeaderAction_GetFontColor

From [upe/add_content_header_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_content_header_action_cc.h)

Gets an "add content header" action's font color (for example, "#000000")

**Parameters**

 Parameter | Description
|---|---|
| action | "add content header" action |
| colorBuffer | [Output] Buffer the font color will be copied into. |
| colorBufferSize | Size (in number of chars) of the colorBuffer. |
| actualColorSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddContentHeaderAction_GetFontColor(
    const mip_cc_action action,
    char* colorBuffer,
    const int64_t colorBufferSize,
    int64_t* actualColorSize);
```

## MIP_CC_AddContentHeaderAction_GetAlignment

From [upe/add_content_header_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_content_header_action_cc.h)

Gets the alignment

**Parameters**

 Parameter | Description
|---|---|
| action | "add content header" action |
| alignment | [Output] Alignment |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddContentHeaderAction_GetAlignment(
    const mip_cc_action action,
    mip_cc_content_mark_alignment* alignment);
```

## MIP_CC_AddContentHeaderAction_GetMargin

From [upe/add_content_header_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_content_header_action_cc.h)

Gets the margin size

**Parameters**

 Parameter | Description
|---|---|
| action | "add content header" action |
| marginSize | [Output] Margin size (in mm) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddContentHeaderAction_GetMargin(
    const mip_cc_action action,
    int32_t* marginSize);
```

## MIP_CC_AddWatermarkAction_GetUIElementNameSize

From [upe/add_watermark_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_watermark_action_cc.h)

Contains C API definitions for "add watermark" label policy action

**Parameters**

 Parameter | Description
|---|---|
| action | "add watermark" action |
| nameSize | [Output] Size of buffer to hold UI element name (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddWatermarkAction_GetUIElementNameSize(
    const mip_cc_action action,
    int64_t* nameSize);
```

## MIP_CC_AddWatermarkAction_GetUIElementName

From [upe/add_watermark_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_watermark_action_cc.h)

Gets an "add watermark" action's UI element name

**Parameters**

 Parameter | Description
|---|---|
| action | "add watermark" action |
| nameBuffer | [Output] Buffer the UI element name will be copied into. |
| nameBufferSize | Size (in number of chars) of the nameBuffer. |
| actualNameSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddWatermarkAction_GetUIElementName(
    const mip_cc_action action,
    char* nameBuffer,
    const int64_t nameBufferSize,
    int64_t* actualNameSize);
```

## MIP_CC_AddWatermarkAction_GetLayout

From [upe/add_watermark_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_watermark_action_cc.h)

Gets the watermark layout

**Parameters**

 Parameter | Description
|---|---|
| action | "add watermark" action |
| layout | [Output] Watermark layout |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddWatermarkAction_GetLayout(
    const mip_cc_action action,
    mip_cc_watermark_layout* layout);
```

## MIP_CC_AddWatermarkAction_GetTextSize

From [upe/add_watermark_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_watermark_action_cc.h)

Gets size of buffer required to store an "add watermark" action's text

**Parameters**

 Parameter | Description
|---|---|
| action | "add watermark" action |
| nameSize | [Output] Size of buffer to hold text (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddWatermarkAction_GetTextSize(
    const mip_cc_action action,
    int64_t* textSize);
```

## MIP_CC_AddWatermarkAction_GetText

From [upe/add_watermark_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_watermark_action_cc.h)

Gets an "add watermark" action's text

**Parameters**

 Parameter | Description
|---|---|
| action | "add watermark" action |
| textBuffer | [Output] Buffer the text will be copied into. |
| textBufferSize | Size (in number of chars) of the textBuffer. |
| actualTextSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddWatermarkAction_GetText(
    const mip_cc_action action,
    char* textBuffer,
    const int64_t textBufferSize,
    int64_t* actualTextSize);
```

## MIP_CC_AddWatermarkAction_GetFontNameSize

From [upe/add_watermark_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_watermark_action_cc.h)

Gets size of buffer required to store an "add watermark" action's font name

**Parameters**

 Parameter | Description
|---|---|
| action | "add watermark" action |
| nameSize | [Output] Size of buffer to hold font name (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddWatermarkAction_GetFontNameSize(
    const mip_cc_action action,
    int64_t* nameSize);
```

## MIP_CC_AddWatermarkAction_GetFontName

From [upe/add_watermark_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_watermark_action_cc.h)

Gets an "add watermark" action's font name

**Parameters**

 Parameter | Description
|---|---|
| action | "add watermark" action |
| nameBuffer | [Output] Buffer the font name will be copied into. |
| nameBufferSize | Size (in number of chars) of the nameBuffer. |
| actualNameSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddWatermarkAction_GetFontName(
    const mip_cc_action action,
    char* nameBuffer,
    const int64_t nameBufferSize,
    int64_t* actualNameSize);
```

## MIP_CC_AddWatermarkAction_GetFontSize

From [upe/add_watermark_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_watermark_action_cc.h)

Gets the integer font size

**Parameters**

 Parameter | Description
|---|---|
| action | "add watermark" action |
| fontSize | [Output] Font size |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddWatermarkAction_GetFontSize(
    const mip_cc_action action,
    int32_t* fontSize);
```

## MIP_CC_AddWatermarkAction_GetFontColorSize

From [upe/add_watermark_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_watermark_action_cc.h)

Gets size of buffer required to store an "add watermark" action's font color

**Parameters**

 Parameter | Description
|---|---|
| action | "add watermark" action |
| colorSize | [Output] Size of buffer to hold font color (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddWatermarkAction_GetFontColorSize(
    const mip_cc_action action,
    int64_t* colorSize);
```

## MIP_CC_AddWatermarkAction_GetFontColor

From [upe/add_watermark_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/add_watermark_action_cc.h)

Gets an "add watermark" action's font color (for example, "#000000")

**Parameters**

 Parameter | Description
|---|---|
| action | "add watermark" action |
| colorBuffer | [Output] Buffer the font color will be copied into. |
| colorBufferSize | Size (in number of chars) of the colorBuffer. |
| actualColorSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_AddWatermarkAction_GetFontColor(
    const mip_cc_action action,
    char* colorBuffer,
    const int64_t colorBufferSize,
    int64_t* actualColorSize);
```

## MIP_CC_ContentLabel_GetCreationTime

From [upe/content_label_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/content_label_cc.h)

Contains C API definitions for content label

**Parameters**

 Parameter | Description
|---|---|
| contentLabel | Label to be released |
| contentLabel | Label |
| creationTime | [Output] Time when label was applied to document (in seconds since epoch) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ContentLabel_GetCreationTime(
    const mip_cc_content_label contentLabel,
    int64_t* creationTime);
```

## MIP_CC_ContentLabel_GetAssignmentMethod

From [upe/content_label_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/content_label_cc.h)

Gets label assignment method

**Parameters**

 Parameter | Description
|---|---|
| contentLabel | Label |
| assignmentMethod | [Output] Assignment method (e.g. 'standard' or 'privileged') |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ContentLabel_GetAssignmentMethod(
    const mip_cc_content_label contentLabel,
    mip_cc_label_assignment_method* assignmentMethod);
```

## MIP_CC_ContentLabel_GetExtendedProperties

From [upe/content_label_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/content_label_cc.h)

Gets extended properties

**Parameters**

 Parameter | Description
|---|---|
| contentLabel | Label |
| properties | [Output] Dictionary of extended properties, memory owned by caller |

**Return**: Result code indicating success or failure

```c
MIP_CC_ReleaseDictionary
 */
MIP_CC_API(mip_cc_result) MIP_CC_ContentLabel_GetExtendedProperties(
    const mip_cc_content_label contentLabel,
    mip_cc_dictionary* properties);
```

## MIP_CC_ContentLabel_IsProtectionAppliedFromLabel

From [upe/content_label_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/content_label_cc.h)

Gets whether or not a protection was applied by a label.

**Parameters**

 Parameter | Description
|---|---|
| contentLabel | Label |
| isProtectionAppliedByLabel | [Output] If document is protected and the protection was explicity applied by this label. |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ContentLabel_IsProtectionAppliedFromLabel(
    const mip_cc_content_label contentLabel,
    bool* isProtectionAppliedByLabel);
```

## MIP_CC_ContentLabel_GetLabel

From [upe/content_label_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/content_label_cc.h)

Gets generic label properties from a content label instance

**Parameters**

 Parameter | Description
|---|---|
| contentLabel | Label |
| label | [Output] Generic label, memory owned by caller |

**Return**: Result code indicating success or failure

```c
MIP_CC_ReleaseLabel
 */
MIP_CC_API(mip_cc_result) MIP_CC_ContentLabel_GetLabel(
    const mip_cc_content_label contentLabel,
    mip_cc_label* label);
```

## MIP_CC_CustomAction_GetNameSize

From [upe/custom_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/custom_action_cc.h)

Contains C API definitions for custom label policy action

**Parameters**

 Parameter | Description
|---|---|
| action | "custom" action |
| nameSize | [Output] Size of buffer to hold name (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_CustomAction_GetNameSize(
    const mip_cc_action action,
    int64_t* nameSize);
```

## MIP_CC_CustomAction_GetName

From [upe/custom_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/custom_action_cc.h)

Gets a "custom" action's name

**Parameters**

 Parameter | Description
|---|---|
| action | "custom" action |
| nameBuffer | [Output] Buffer the name will be copied into. |
| nameBufferSize | Size (in number of chars) of the nameBuffer. |
| actualNameSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_CustomAction_GetName(
    const mip_cc_action action,
    char* nameBuffer,
    const int64_t nameBufferSize,
    int64_t* actualNameSize);
```

## MIP_CC_CustomAction_GetProperties

From [upe/custom_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/custom_action_cc.h)

Gets a "custom" action's properties

**Parameters**

 Parameter | Description
|---|---|
| action | "custom" action |
| properties | [Output] Dictionary of properties, memory owned by caller |

**Return**: Result code indicating success or failure

```c
MIP_CC_ReleaseDictionary
 */
MIP_CC_API(mip_cc_result) MIP_CC_CustomAction_GetProperties(
    const mip_cc_action action,
    mip_cc_dictionary* properties);
```

## MIP_CC_Label_GetId

From [upe/label_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/label_cc.h)

Contains C API definitions for label

**Parameters**

 Parameter | Description
|---|---|
| label | Label to be released |
| label | Label |
| labelId | [Output] Label ID |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_Label_GetId(
    const mip_cc_label label,
    mip_cc_guid* labelId);
```

## MIP_CC_Label_GetNameSize

From [upe/label_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/label_cc.h)

Gets size of buffer required to store name

**Parameters**

 Parameter | Description
|---|---|
| label | Label |
| nameSize | [Output] Size of buffer to hold name (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_Label_GetNameSize(
    const mip_cc_label label,
    int64_t* nameSize);
```

## MIP_CC_Label_GetName

From [upe/label_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/label_cc.h)

Gets label name

**Parameters**

 Parameter | Description
|---|---|
| label | Label |
| nameBuffer | [Output] Buffer the name will be copied into. |
| nameBufferSize | Size (in number of chars) of the nameBuffer. |
| actualNameSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_Label_GetName(
    const mip_cc_label label,
    char* nameBuffer,
    const int64_t nameBufferSize,
    int64_t* actualNameSize);
```

## MIP_CC_Label_GetDescriptionSize

From [upe/label_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/label_cc.h)

Gets size of buffer required to store description

**Parameters**

 Parameter | Description
|---|---|
| label | Label |
| descriptionSize | [Output] Size of buffer to hold description (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_Label_GetDescriptionSize(
    const mip_cc_label label,
    int64_t* descriptionSize);
```

## MIP_CC_Label_GetDescription

From [upe/label_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/label_cc.h)

Gets label description

**Parameters**

 Parameter | Description
|---|---|
| label | Label |
| descriptionBuffer | [Output] Buffer the description will be copied into. |
| descriptionBufferSize | Size (in number of chars) of the descriptionBuffer. |
| actualDescriptionSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_Label_GetDescription(
    const mip_cc_label label,
    char* descriptionBuffer,
    const int64_t descriptionBufferSize,
    int64_t* actualDescriptionSize);
```

## MIP_CC_Label_GetColorSize

From [upe/label_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/label_cc.h)

Gets size of buffer required to store color

**Parameters**

 Parameter | Description
|---|---|
| label | Label |
| colorSize | [Output] Size of buffer to hold color (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_Label_GetColorSize(
    const mip_cc_label label,
    int64_t* colorSize);
```

## MIP_CC_Label_GetColor

From [upe/label_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/label_cc.h)

Gets label color

**Parameters**

 Parameter | Description
|---|---|
| label | Label |
| colorBuffer | [Output] Buffer the color will be copied into (in #RRGGBB format). |
| colorBufferSize | Size (in number of chars) of the colorBuffer. |
| actualColorSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_Label_GetColor(
    const mip_cc_label label,
    char* colorBuffer,
    const int64_t colorBufferSize,
    int64_t* actualColorSize);
```

## MIP_CC_Label_GetSensitivity

From [upe/label_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/label_cc.h)

Gets sensitivity level of label. Higher value means more sensitive.

**Parameters**

 Parameter | Description
|---|---|
| label | Label |
| sensitivity | [Output] Sensitivity level |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_Label_GetSensitivity(
    const mip_cc_label label,
    int32_t* sensitivity);
```

## MIP_CC_Label_GetTooltipSize

From [upe/label_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/label_cc.h)

Gets size of buffer required to store tooltip

**Parameters**

 Parameter | Description
|---|---|
| label | Label |
| tooltipSize | [Output] Size of buffer to hold tooltip (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_Label_GetTooltipSize(
    const mip_cc_label label,
    int64_t* tooltipSize);
```

## MIP_CC_Label_GetTooltip

From [upe/label_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/label_cc.h)

Gets label tooltip

**Parameters**

 Parameter | Description
|---|---|
| label | Label |
| tooltipBuffer | [Output] Buffer the tooltip will be copied into. |
| tooltipBufferSize | Size (in number of chars) of the tooltipBuffer. |
| actualTooltipSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_Label_GetTooltip(
    const mip_cc_label label,
    char* tooltipBuffer,
    const int64_t tooltipBufferSize,
    int64_t* actualTooltipSize);
```

## MIP_CC_Label_GetAutoTooltipSize

From [upe/label_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/label_cc.h)

Gets size of buffer required to store auto-classification tooltip

**Parameters**

 Parameter | Description
|---|---|
| label | Label |
| tooltipSize | [Output] Size of buffer to hold tooltip (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_Label_GetAutoTooltipSize(
    const mip_cc_label label,
    int64_t* tooltipSize);
```

## MIP_CC_Label_GetAutoTooltip

From [upe/label_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/label_cc.h)

Gets label auto-classification tooltip

**Parameters**

 Parameter | Description
|---|---|
| label | Label |
| tooltipBuffer | [Output] Buffer the tooltip will be copied into. |
| tooltipBufferSize | Size (in number of chars) of the tooltipBuffer. |
| actualTooltipSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_Label_GetAutoTooltip(
    const mip_cc_label label,
    char* tooltipBuffer,
    const int64_t tooltipBufferSize,
    int64_t* actualTooltipSize);
```

## MIP_CC_Label_IsActive

From [upe/label_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/label_cc.h)

Gets whether or not a label is active

**Parameters**

 Parameter | Description
|---|---|
| label | Label |
| isActive | [Output] Whether or not a label is considered active. |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_Label_IsActive(
    const mip_cc_label label,
    bool* isActive);
```

## MIP_CC_Label_GetParent

From [upe/label_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/label_cc.h)

Gets the parent label, if any

**Parameters**

 Parameter | Description
|---|---|
| label | Label |
| parent | [Output] Parent label, if any, else null |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_Label_GetParent(
    const mip_cc_label label,
    mip_cc_label* parent);
```

## MIP_CC_Label_GetChildrenSize

From [upe/label_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/label_cc.h)

Gets the number of children labels

**Parameters**

 Parameter | Description
|---|---|
| label | Label |
| childrenSize | [Output] Number of children |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_Label_GetChildrenSize(
    const mip_cc_label label,
    int64_t* childrenSize);
```

## MIP_CC_Label_GetChildren

From [upe/label_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/label_cc.h)

Gets the children labels

**Parameters**

 Parameter | Description
|---|---|
| label | Label |
| childrenBuffer | [Output] Buffer the children labels will be copied into. Children labels |
| childrenBufferSize | Size (in number of labels) of the childrenBuffer. |
| actualChildrenSize | [Output] Number of children labels written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_Label_GetChildren(
    const mip_cc_label label,
    mip_cc_label* childrenBuffer,
    const int64_t childrenBufferSize,
    int64_t* actualChildrenSize);
```

## MIP_CC_Label_GetCustomSettings

From [upe/label_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/label_cc.h)

Gets policy-defined custom settings of a label

**Parameters**

 Parameter | Description
|---|---|
| label | Label |
| settings | [Output] Dictionary of settings, owned by the caller |

**Return**: Result code indicating success or failure

```c
MIP_CC_ReleaseDictionary
 */
MIP_CC_API(mip_cc_result) MIP_CC_Label_GetCustomSettings(
    const mip_cc_label label,
    mip_cc_dictionary* settings);
```

## MIP_CC_MetadataAction_GetMetadataToRemove

From [upe/metadata_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/metadata_action_cc.h)

Contains C API definitions for "metadata" label policy action

**Parameters**

 Parameter | Description
|---|---|
| action | "metadata" action |
| metadataNames | [Output] Key names of metadata to remove, memory owned by caller |

**Return**: Result code indicating success or failure

```c
MIP_CC_ReleaseStringList
 * @note Removing metadata should be done before adding metadata
 */
MIP_CC_API(mip_cc_result) MIP_CC_MetadataAction_GetMetadataToRemove(
    const mip_cc_action action,
    mip_cc_string_list* metadataNames);
```

## MIP_CC_MetadataAction_GetMetadataToAdd

From [upe/metadata_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/metadata_action_cc.h)

Gets a "metadata" action's metadata to add

**Parameters**

 Parameter | Description
|---|---|
| action | "metadata" action |
| metadata | [Output] Key/value pairs of metadata to add, memory owned by caller |

**Return**: Result code indicating success or failure

```c
MIP_CC_ReleaseDictionary
 * @note Removing metadata should be done before adding metadata
 */
MIP_CC_API(mip_cc_result) MIP_CC_MetadataAction_GetMetadataToAdd(
    const mip_cc_action action,
    mip_cc_dictionary* metadata);
```

## MIP_CC_PolicyEngine_GetEngineIdSize

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Contains C API definitions for policy engine

**Parameters**

 Parameter | Description
|---|---|
| engine | Policy engine to release |
| engine | Policy engine |
| idSize | [Output] Size of buffer to hold engine ID (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngine_GetEngineIdSize(
    const mip_cc_policy_engine engine,
    int64_t* idSize);
```

## MIP_CC_PolicyEngine_GetEngineId

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Gets engine ID

**Parameters**

 Parameter | Description
|---|---|
| engine | Policy engine |
| idBuffer | [Output] Buffer the id will be copied into. |
| idBufferSize | Size (in number of chars) of the idBuffer. |
| actualIdSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngine_GetEngineId(
    const mip_cc_policy_engine engine,
    char* idBuffer,
    const int64_t idBufferSize,
    int64_t* actualIdSize);
```

## MIP_CC_PolicyEngine_GetMoreInfoUrlSize

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Gets the size of client data associated with a policy engine

**Parameters**

 Parameter | Description
|---|---|
| engine | Policy engine |
| moreInfoUrlSize | [Output] Size of client data (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngine_GetMoreInfoUrlSize(
    const mip_cc_policy_engine engine,
    int64_t* moreInfoUrlSize);
```

## MIP_CC_PolicyEngine_GetMoreInfoUrl

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Get client data associated with a policy engine

**Parameters**

 Parameter | Description
|---|---|
| engine | Policy engine |
| moreInfoUrlBuffer | [Output] Buffer the client data will be copied into |
| moreInfoUrlBufferSize | Size (in number of chars) of moreInfoUrlBuffer. |
| actualMoreInfoUrlSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngine_GetMoreInfoUrl(
    const mip_cc_policy_engine engine,
    char* moreInfoUrlBuffer,
    const int64_t moreInfoUrlBufferSize,
    int64_t* actualMoreInfoUrlSize);
```

## MIP_CC_PolicyEngine_IsLabelingRequired

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Gets whether or not the policy dictates that a document must be labeled.

**Parameters**

 Parameter | Description
|---|---|
| engine | Policy engine |
| isLabelingRequired | [Output] Whether or not policy dictates that a document must be labeled |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngine_IsLabelingRequired(
    const mip_cc_policy_engine engine,
    bool* isLabelingRequired);
```

## MIP_CC_PolicyEngine_GetPolicyFileIdSize

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Gets the size of client data associated with a policy engine

**Parameters**

 Parameter | Description
|---|---|
| engine | Policy engine |
| policyFileIdSize | [Output] Size of client data (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngine_GetPolicyFileIdSize(
    const mip_cc_policy_engine engine,
    int64_t* policyFileIdSize);
```

## MIP_CC_PolicyEngine_GetPolicyFileId

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Get client data associated with a policy engine

**Parameters**

 Parameter | Description
|---|---|
| engine | Policy engine |
| policyFileIdBuffer | [Output] Buffer the client data will be copied into |
| policyFileIdBufferSize | Size (in number of chars) of policyFileIdBuffer. |
| actualPolicyFileIdSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngine_GetPolicyFileId(
    const mip_cc_policy_engine engine,
    char* policyFileIdBuffer,
    const int64_t policyFileIdBufferSize,
    int64_t* actualPolicyFileIdSize);
```

## MIP_CC_PolicyEngine_GetSensitivityFileIdSize

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Gets the size of client data associated with a policy engine

**Parameters**

 Parameter | Description
|---|---|
| engine | Policy engine |
| sensitivityFileIdSize | [Output] Size of client data (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngine_GetSensitivityFileIdSize(
    const mip_cc_policy_engine engine,
    int64_t* sensitivityFileIdSize);
```

## MIP_CC_PolicyEngine_GetSensitivityFileId

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Get client data associated with a policy engine

**Parameters**

 Parameter | Description
|---|---|
| engine | Policy engine |
| sensitivityFileIdBuffer | [Output] Buffer the client data will be copied into |
| sensitivityFileIdBufferSize | Size (in number of chars) of sensitivityFileIdBuffer. |
| actualSensitivityFileIdSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngine_GetSensitivityFileId(
    const mip_cc_policy_engine engine,
    char* sensitivityFileIdBuffer,
    const int64_t sensitivityFileIdBufferSize,
    int64_t* actualSensitivityFileIdSize);
```

## MIP_CC_PolicyEngine_HasClassificationRules

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Gets whether or not the policy has automatic or recommendation rules

**Parameters**

 Parameter | Description
|---|---|
| engine | Policy engine |
| hasClassificationRules | [Output] Whether or not policy has automatic or recommendation rules |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngine_HasClassificationRules(
    const mip_cc_policy_engine engine,
    bool* hasClassificationRules);
```

## MIP_CC_PolicyEngine_GetLastPolicyFetchTime

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Gets the time when the policy was last fetched

**Parameters**

 Parameter | Description
|---|---|
| engine | Policy engine |
| lastPolicyFetchTime | [Output] Time when the policy was last fetched (in seconds since epoch) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngine_GetLastPolicyFetchTime(
    const mip_cc_policy_engine engine,
    int64_t* lastPolicyFetchTime);
```

## MIP_CC_PolicyEngine_GetSensitivityLabelsSize

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Gets the number of sensitivity labels associated with the policy engine

**Parameters**

 Parameter | Description
|---|---|
| engine | Policy engine |
| labelsSize | [Output] Number of labels |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngine_GetSensitivityLabelsSize(
    const mip_cc_policy_engine engine,
    int64_t* labelsSize);
```

## MIP_CC_PolicyEngine_GetSensitivityLabels

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Gets the sensitivity labels associated with the policy engine

**Parameters**

 Parameter | Description
|---|---|
| engine | Policy engine |
| labelBuffer | [Output] Buffer the labels will be copied into. Labels are owned by the client |
| labelBufferSize | Size (in number of labels) of the labelBuffer. |
| actualLabelsSize | [Output] Number of labels written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngine_GetSensitivityLabels(
    const mip_cc_policy_engine engine,
    mip_cc_label* labelBuffer,
    const int64_t labelBufferSize,
    int64_t* actualLabelsSize);
```

## MIP_CC_PolicyEngine_GetLabelById

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Gets sensitivity label by ID

**Parameters**

 Parameter | Description
|---|---|
| engine | Policy engine |
| labelId | Label ID |
| label | [Output] Sensitivity label. This value is owned by the caller and must be released with MIP_CC_ReleaseLabel. |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngine_GetLabelById(
    const mip_cc_policy_engine engine,
    const char* labelId,
    mip_cc_label* label);
```

## MIP_CC_PolicyEngine_GetSensitivityTypesSize

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Gets the number of sensitivity types associated with the policy engine

**Parameters**

 Parameter | Description
|---|---|
| engine | Policy engine |
| sensitivityTypesSize | [Output] Number of sensitivity types |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngine_GetSensitivityTypesSize(
    const mip_cc_policy_engine engine,
    int64_t* sensitivityTypesSize);
```

## MIP_CC_PolicyEngine_GetSensitivityTypes

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Gets the sensitivity types associated with the policy engine

**Parameters**

 Parameter | Description
|---|---|
| engine | Policy engine |
| sensitivityTypeBuffer | [Output] Buffer the sensitivity types will be copied into. Sensitivity |
| sensitivityTypeBufferSize | Size (in number of sensitivity types) of the sensitivityTypeBuffer. |
| actualSensitivityTypesSize | [Output] Number of sensitivity types written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngine_GetSensitivityTypes(
    const mip_cc_policy_engine engine,
    mip_cc_sensitivity_type* sensitivityTypeBuffer,
    const int64_t sensitivityTypeBufferSize,
    int64_t* actualSensitivityTypesSize);
```

## MIP_CC_PolicyEngine_CreatePolicyHandler

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Create a Policy Handler to execute policy-related functions

**Parameters**

 Parameter | Description
|---|---|
| engine | Policy engine |
| isAuditDiscoveryEnabled | Whether or not audit discovery is enabled |
| handler | [Output] Newly-created Policy Handler instance |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngine_CreatePolicyHandler(
    const mip_cc_policy_engine engine,
    const bool isAuditDiscoveryEnabled,
    mip_cc_policy_handler* handler);
```

## MIP_CC_PolicyEngine_SendApplicationAuditEvent

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Logs an application specific event to the audit pipeline

**Parameters**

 Parameter | Description
|---|---|
| level | Level of the event: Info/Error/Warning |
| eventType | A description of the type of event |
| eventData | The data associated with the event |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngine_SendApplicationAuditEvent(
    const mip_cc_policy_engine engine,
    const char* level,
    const char* eventType,
    const char* eventData);
```

## MIP_CC_PolicyEngine_GetPolicyDataXmlSize

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Gets size of policy data xml

**Parameters**

 Parameter | Description
|---|---|
| engine | Policy engine |
| xmlSize | [Output] Size of policy data xml (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngine_GetPolicyDataXmlSize(
    const mip_cc_policy_engine engine,
    int64_t* xmlSize);
```

## MIP_CC_PolicyEngine_GetPolicyDataXml

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Gets policy data xml

**Parameters**

 Parameter | Description
|---|---|
| engine | Policy engine |
| xmlBuffer | [Output] Buffer the xml will be copied into. |
| xmlBufferSize | Size (in number of chars) of the xmlBuffer. |
| actualXmlSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngine_GetPolicyDataXml(
    const mip_cc_policy_engine engine,
    char* xmlBuffer,
    const int64_t xmlBufferSize,
    int64_t* actualXmlSize);
```

## MIP_CC_PolicyEngine_GetSensitivityTypesDataXmlSize

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Gets size of sensitivity types data xml

**Parameters**

 Parameter | Description
|---|---|
| engine | Policy engine |
| xmlSize | [Output] Size of policy data xml (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngine_GetSensitivityTypesDataXmlSize(
    const mip_cc_policy_engine engine,
    int64_t* xmlSize);
```

## MIP_CC_PolicyEngine_GetSensitivityTypesDataXml

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Gets sensitivity types data xml

**Parameters**

 Parameter | Description
|---|---|
| engine | Policy engine |
| xmlBuffer | [Output] Buffer the xml will be copied into. |
| xmlBufferSize | Size (in number of chars) of the xmlBuffer. |
| actualXmlSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngine_GetSensitivityTypesDataXml(
    const mip_cc_policy_engine engine,
    char* xmlBuffer,
    const int64_t xmlBufferSize,
    int64_t* actualXmlSize);
```

## MIP_CC_PolicyEngine_GetClientDataSize

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Gets the size of client data associated with a policy engine

**Parameters**

 Parameter | Description
|---|---|
| engine | Policy engine |
| clientDataSize | [Output] Size of client data (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngine_GetClientDataSize(
    const mip_cc_policy_engine engine,
    int64_t* clientDataSize);
```

## MIP_CC_PolicyEngine_GetClientData

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Get client data associated with a policy engine

**Parameters**

 Parameter | Description
|---|---|
| engine | Policy engine |
| clientDataBuffer | [Output] Buffer the client data will be copied into |
| clientDataBufferSize | Size (in number of chars) of clientDataBuffer. |
| actualClientDataSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngine_GetClientData(
    const mip_cc_policy_engine engine,
    char* clientDataBuffer,
    const int64_t clientDataBufferSize,
    int64_t* actualClientDataSize);
```

## MIP_CC_CreatePolicyEngineSettingsWithIdentity

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Create a settings object used to create a brand new policy engine

**Parameters**

 Parameter | Description
|---|---|
| identity | Identity that will be associated with PolicyEngine |
| clientData | Customizable client data that is stored alongside the engine |
| locale | Locale in which text results will output |
| loadSensitivityTypes | Whether or not sensitivity types data (for classification) should also be loaded |
| settings | [Output] Newly-created settings instance |

**Return**: Result code indicating success or failure

```c
MIP_CC_PolicyEngine_GetSensitivityTypes. Otherwise, it should be false to avoid an unnecessary HTTP operation.
 */
MIP_CC_API(mip_cc_result) MIP_CC_CreatePolicyEngineSettingsWithIdentity(
    const mip_cc_identity* identity,
    const char* clientData,
    const char* locale,
    bool loadSensitivityTypes,
    mip_cc_policy_engine_settings* settings);
```

## MIP_CC_CreatePolicyEngineSettingsWithEngineId

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Create a settings object used to load an existing policy engine by engine ID if it

**Parameters**

 Parameter | Description
|---|---|
| engineId | ID of existing cached engine |
| identity | (Optional) Identity that will be associated with PolicyENgine |
| clientData | Customizable client data that is stored alongside the engine |
| locale | Locale in which text results will output |
| loadSensitivityTypes | Whether or not sensitivity types data (for classification) should also be loaded |
| settings | [Output] Newly-created settings instance |

**Return**: Result code indicating success or failure

```c
MIP_CC_PolicyEngine_GetSensitivityTypes. Otherwise, it should be false to avoid an unnecessary HTTP operation.
 * 
 * @note 'identity' will only be used for new engines. If an engine with the specified engine id already exists in
 *       the local cache, the identity from the cached engine will be used instead.
 */
MIP_CC_API(mip_cc_result) MIP_CC_CreatePolicyEngineSettingsWithEngineId(
    const char* engineId,
    const mip_cc_identity* identity,
    const char* clientData,
    const char* locale,
    bool loadSensitivityTypes,
    mip_cc_policy_engine_settings* settings);
```

## MIP_CC_PolicyEngineSettings_SetClientData

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Sets the client data that will be stored opaquely alongside this engine and persist across sessions

**Parameters**

 Parameter | Description
|---|---|
| settings | Engine settings |
| clientData | Client data |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngineSettings_SetClientData(
    const mip_cc_policy_engine_settings settings,
    const char* clientData);
```

## MIP_CC_PolicyEngineSettings_SetCustomSettings

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Configures custom settings, used for feature gating and testing.

**Parameters**

 Parameter | Description
|---|---|
| settings | Engine settings |
| customSettings | Key/value pairs of custom settings |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngineSettings_SetCustomSettings(
    const mip_cc_policy_engine_settings settings,
    const mip_cc_dictionary customSettings);
```

## MIP_CC_PolicyEngineSettings_SetSessionId

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Sets the session ID that can be used to correlate logs and telemetry

**Parameters**

 Parameter | Description
|---|---|
| settings | Engine settings |
| sessionId | Session ID that represents the lifetime of a policy engine |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngineSettings_SetSessionId(
    const mip_cc_policy_engine_settings settings,
    const char* sessionId);
```

## MIP_CC_PolicyEngineSettings_SetCloudEndpointBaseUrl

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Sets base URL for all service requests

**Parameters**

 Parameter | Description
|---|---|
| settings | Engine settings |
| cloudEndpointBaseUrl | Base URL (e.g. 'https://api.aadrm.com') |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngineSettings_SetCloudEndpointBaseUrl(
    const mip_cc_policy_engine_settings settings,
    const char* cloudEndpointBaseUrl);
```

## MIP_CC_PolicyEngineSettings_SetDelegatedUserEmail

From [upe/policy_engine_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_engine_cc.h)

Sets delegated user

**Parameters**

 Parameter | Description
|---|---|
| settings | Engine settings |
| delegatedUserEmail | Email address of delegated user |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyEngineSettings_SetDelegatedUserEmail(
    const mip_cc_policy_engine_settings settings,
    const char* delegatedUserEmail);
```

## MIP_CC_PolicyHandler_GetSensitivityLabel

From [upe/policy_handler_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_handler_cc.h)

Contains C API definitions for policy handler

**Parameters**

 Parameter | Description
|---|---|
| handler | Policy handler to release |
| handler | Policy handler |
| documentState | Document state |
| context | Application context opaquely forwarded to any callbacks |
| contentLabel | Label currently applied to a document |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyHandler_GetSensitivityLabel(
    const mip_cc_policy_handler handler,
    const mip_cc_document_state* documentState,
    const void* context,
    mip_cc_content_label* contentLabel);
```

## MIP_CC_PolicyHandler_ComputeActions

From [upe/policy_handler_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_handler_cc.h)

Executes policy rules based on the provided state and determines corresponding actions

**Parameters**

 Parameter | Description
|---|---|
| handler | Policy handler |
| documentState | Document state |
| applicationState | Application action state |
| context | Application context opaquely forwarded to any callbacks |
| actionResult | [Output] Actions that should be taken by application, memory owned by caller |

**Return**: Result code indicating success or failure

```c
MIP_CC_ReleaseActionResult
 */
MIP_CC_API(mip_cc_result) MIP_CC_PolicyHandler_ComputeActions(
    const mip_cc_policy_handler handler,
    const mip_cc_document_state* documentState,
    const mip_cc_application_action_state* applicationState,
    const void* context,
    mip_cc_action_result* actionResult);
```

## MIP_CC_PolicyHandler_NotifyCommittedActions

From [upe/policy_handler_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_handler_cc.h)

Called by application after computed actions have been applied and data committed to disk

**Parameters**

 Parameter | Description
|---|---|
| handler | Policy handler |
| documentState | Document state |
| applicationState | Application action state |
| context | Application context opaquely forwarded to any callbacks |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyHandler_NotifyCommittedActions(
    const mip_cc_policy_handler handler,
    const mip_cc_document_state* documentState,
    const mip_cc_application_action_state* applicationState,
    const void* context);
```

## MIP_CC_PolicyProfile_AddEngine

From [upe/policy_profile_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_profile_cc.h)

Contains C API definitions for policy profile

**Parameters**

 Parameter | Description
|---|---|
| profile | Parent profile under which an engine will be added |
| settings | Policy engine settings |
| context | Client context that will be opaquely passed to HttpDelegate and AuthDelegate |
| engine | [Output] Newly-created policy engine instance |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyProfile_AddEngine(
    const mip_cc_policy_profile profile,
    const mip_cc_policy_engine_settings settings,
    const void* context,
    mip_cc_policy_engine* engine);
```

## MIP_CC_LoadPolicyProfile

From [upe/policy_profile_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_profile_cc.h)

Load a profile

**Parameters**

 Parameter | Description
|---|---|
| settings | Profile settings |
| profile | [Output] Newly-created policy profile instance |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_LoadPolicyProfile(
    const mip_cc_policy_profile_settings settings,
    mip_cc_policy_profile* profile);
```

## MIP_CC_CreatePolicyProfileSettings

From [upe/policy_profile_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_profile_cc.h)

Release resources associated with a policy profile

**Parameters**

 Parameter | Description
|---|---|
| profile | Policy profile to be released |
| mipContext | Global context shared across all profiles |
| cacheStorageType | Storage cache configuration |
| authCallback | Callback object to be used for authentication, implemented by client application |
| settings | [Output] Newly-created settings instance |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_CreatePolicyProfileSettings(
    const mip_cc_mip_context mipContext,
    const mip_cc_cache_storage_type cacheStorageType,
    const mip_cc_auth_callback authCallback,
    mip_cc_policy_profile_settings* settings);
```

## MIP_CC_PolicyProfileSettings_SetSessionId

From [upe/policy_profile_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_profile_cc.h)

Sets the session ID that can be used to correlate logs and telemetry

**Parameters**

 Parameter | Description
|---|---|
| settings | Profile settings |
| sessionId | Session ID that represents the lifetime of a policy profile |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyProfileSettings_SetSessionId(
    const mip_cc_policy_profile_settings settings,
    const char* sessionId);
```

## MIP_CC_PolicyProfileSettings_SetHttpDelegate

From [upe/policy_profile_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_profile_cc.h)

Override default HTTP stack with client's own

**Parameters**

 Parameter | Description
|---|---|
| settings | Profile settings to which HTTP delegate will be assigned |
| httpDelegate | HTTP callback instance implemented by client application |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyProfileSettings_SetHttpDelegate(
    const mip_cc_policy_profile_settings settings,
    const mip_cc_http_delegate httpDelegate);
```

## MIP_CC_PolicyProfileSettings_SetTaskDispatcherDelegate

From [upe/policy_profile_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_profile_cc.h)

Override default async task dispatcher with client's own

**Parameters**

 Parameter | Description
|---|---|
| settings | Profile settings to which task dispatcher delegate will be assigned |
| taskDispatcherDelegate | Task dispatcher callback instance implemented by client application |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyProfileSettings_SetTaskDispatcherDelegate(
    const mip_cc_policy_profile_settings settings,
    const mip_cc_task_dispatcher_delegate taskDispatcherDelegate);
```

## MIP_CC_PolicyProfileSettings_SetCustomSettings

From [upe/policy_profile_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/policy_profile_cc.h)

Configures custom settings, used for feature gating and testing.

**Parameters**

 Parameter | Description
|---|---|
| settings | Profile settings |
| customSettings | Key/value pairs of custom settings |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_PolicyProfileSettings_SetCustomSettings(
    const mip_cc_policy_profile_settings settings,
    const mip_cc_dictionary customSettings);
```

## MIP_CC_ProtectByTemplateAction_GetTemplateId

From [upe/protect_by_template_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/protect_by_template_action_cc.h)

Contains C API definitions for "protect by template" label policy action

**Parameters**

 Parameter | Description
|---|---|
| action | "protect by template" action |
| templateId | [Output] ID of template that defines protections |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_ProtectByTemplateAction_GetTemplateId(
    const mip_cc_action action,
    mip_cc_guid* templateId);
```

## MIP_CC_RemoveContentFooterAction_GetUIElementNames

From [upe/remove_content_footer_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/remove_content_footer_action_cc.h)

Contains C API definitions for "remove content footer" label policy action

**Parameters**

 Parameter | Description
|---|---|
| action | "remove content footer" action |
| names | [Output] Names of UI elements to remove, memory owned by caller |

**Return**: Result code indicating success or failure

```c
MIP_CC_ReleaseStringList
 */
MIP_CC_API(mip_cc_result) MIP_CC_RemoveContentFooterAction_GetUIElementNames(
    const mip_cc_action action,
    mip_cc_string_list* names);
```

## MIP_CC_RemoveContentHeaderAction_GetUIElementNames

From [upe/remove_content_header_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/remove_content_header_action_cc.h)

Contains C API definitions for "remove content header" label policy action

**Parameters**

 Parameter | Description
|---|---|
| action | "remove content header" action |
| names | [Output] Names of UI elements to remove, memory owned by caller |

**Return**: Result code indicating success or failure

```c
MIP_CC_ReleaseStringList
 */
MIP_CC_API(mip_cc_result) MIP_CC_RemoveContentHeaderAction_GetUIElementNames(
    const mip_cc_action action,
    mip_cc_string_list* names);
```

## MIP_CC_RemoveWatermarkAction_GetUIElementNames

From [upe/remove_watermark_action_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/remove_watermark_action_cc.h)

Contains C API definitions for "remove watermark" label policy action

**Parameters**

 Parameter | Description
|---|---|
| action | "remove watermark footer" action |
| names | [Output] Names of UI elements to remove, memory owned by caller |

**Return**: Result code indicating success or failure

```c
MIP_CC_ReleaseStringList
 */
MIP_CC_API(mip_cc_result) MIP_CC_RemoveWatermarkAction_GetUIElementNames(
    const mip_cc_action action,
    mip_cc_string_list* names);
```

## MIP_CC_SensitivityType_GetRulePackageIdSize

From [upe/sensitivity_type_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/sensitivity_type_cc.h)

Contains C API definitions for sensitivity type

**Parameters**

 Parameter | Description
|---|---|
| sensitivityType | Sensitivity type to be released |
| sensitivityType | Sensitivity type |
| idSize | [Output] Size of buffer to hold rule package ID (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_SensitivityType_GetRulePackageIdSize(
    const mip_cc_sensitivity_type sensitivityType,
    int64_t* idSize);
```

## MIP_CC_SensitivityType_GetRulePackageId

From [upe/sensitivity_type_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/sensitivity_type_cc.h)

Gets a sensitivity type's rule package ID

**Parameters**

 Parameter | Description
|---|---|
| sensitivityType | Sensitivity type |
| idBuffer | [Output] Buffer the ID will be copied into. |
| idBufferSize | Size (in number of chars) of the idBuffer. |
| actualIdSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_SensitivityType_GetRulePackageId(
    const mip_cc_sensitivity_type sensitivityType,
    char* idBuffer,
    const int64_t idBufferSize,
    int64_t* actualIdSize);
```

## MIP_CC_SensitivityType_GetRulePackageSize

From [upe/sensitivity_type_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/sensitivity_type_cc.h)

Gets size of buffer required to store a sensitivity type's rule package

**Parameters**

 Parameter | Description
|---|---|
| sensitivityType | Sensitivity type |
| rulePackageSize | [Output] Size of buffer to hold rule package (in number of chars) |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_SensitivityType_GetRulePackageSize(
    const mip_cc_sensitivity_type sensitivityType,
    int64_t* rulePackageSize);
```

## MIP_CC_SensitivityType_GetRulePackage

From [upe/sensitivity_type_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/sensitivity_type_cc.h)

Gets a sensitivity type's rule package

**Parameters**

 Parameter | Description
|---|---|
| sensitivityType | Sensitivity type |
| rulePackageBuffer | [Output] Buffer the rule package will be copied into. |
| rulePackageBufferSize | Size (in number of chars) of the rulePackageBuffer. |
| actualRulePackageSize | [Output] Number of chars written to the buffer |

**Return**: Result code indicating success or failure

```c
MIP_CC_API(mip_cc_result) MIP_CC_SensitivityType_GetRulePackage(
    const mip_cc_sensitivity_type sensitivityType,
    char* rulePackageBuffer,
    const int64_t rulePackageBufferSize,
    int64_t* actualRulePackageSize);
```

