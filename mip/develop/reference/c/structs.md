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

ApplicationInfo definition

From [application_info_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/application_info_cc.h)

```c
typedef struct {
  const char* applicationId;      /**< Application identifier as set in the AAD portal, (Should be a GUID without brackets). */
  const char* applicationName;    /**< Application name, (Should only contain valid ASCII character excluding ';') */
  const char* applicationVersion; /**< The version of the application being used, (Should only contain valid ASCII character excluding ';')  */
} mip_cc_application_info;
```

## mip_cc_oauth2_challenge

Defines auth callback functions

From [auth_callback_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/auth_callback_cc.h)

```c
typedef struct {
  const char* authority; /**< OAuth2 authority */
  const char* resource;  /**< OAuth2 resource */
  const char* scope;     /**< OAuth2 scope */
} mip_cc_oauth2_challenge;
```

## mip_cc_guid

A file Containing the common types used by the upe, file and protection modules.

From [common_types_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/common_types_cc.h)

```c
typedef struct {
  char guid[37];
} mip_cc_guid;
```

## mip_cc_kv_pair

Contains C API definitions for common string dictionary.

From [dictionary_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/dictionary_cc.h)

```c
typedef struct {
  const char* key;   /**< Key */
  const char* value; /**< Value */
} mip_cc_kv_pair;
```

## mip_cc_http_header

HTTP request/response header

From [http_delegate_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/http_delegate_cc.h)

```c
typedef struct {
  const char* name;  /**< Header name/key */
  const char* value; /**< Header value */
} mip_cc_http_header;
```

## mip_cc_http_request

HTTP request

From [http_delegate_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/http_delegate_cc.h)

```c
typedef struct {
  const char* id;                    /**< Unique request ID--correlated with the same property in mip_cc_http_response */
  mip_cc_http_request_type type;     /**< HTTP request type (e.g. GET vs. POST) */
  const char* url;                   /**< HTTP request URL */
  int64_t bodySize;                  /**< Size of HTTP request body in bytes */
  const uint8_t* body;               /**< Buffer containg HTTP request body */
  int64_t headersCount;              /**< Number of HTTP request headers */
  const mip_cc_http_header* headers; /**< Buffer containing HTTP request headers */
} mip_cc_http_request;
```

## mip_cc_http_response

HTTP response

From [http_delegate_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/http_delegate_cc.h)

```c
typedef struct {
  const char* id;                    /**< Unique request ID--correlated with the same property in mip_cc_http_request */
  int32_t statusCode;                /**< HTTP response status code */
  int64_t bodySize;                  /**< Size of HTTP response body in bytes */
  const uint8_t* body;               /**< Buffer containg HTTP response body */
  int64_t headersCount;              /**< Number of HTTP response headers */
  const mip_cc_http_header* headers; /**< Buffer containing HTTP response headers */
} mip_cc_http_response;
```

## mip_cc_identity

Identity definition

From [identity_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/identity_cc.h)

```c
typedef struct {
  const char* email;          /**< User email address */
} mip_cc_identity;
```

## mip_cc_feature_override

Defines C-Style MipContext functions

From [mip_context_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/mip_context_cc.h)

```c
typedef struct {
  mip_cc_flighting_feature feature; /**< Feature name */
  bool value;                       /**< Enabled/disabled state */
} mip_cc_feature_override;
```

## mip_cc_user_rights

A group of users and the rights associated with them

From [protection_descriptor_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection_descriptor_cc.h)

```c
typedef struct {
  const char** users;  /**< List of users */
  int64_t usersCount;  /**< Number of users */
  const char** rights; /**< List of rights */
  int64_t rightsCount; /**< Number of rights */
} mip_cc_user_rights;
```

## mip_cc_user_roles

A group of users and the roles associated with them

From [protection_descriptor_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/protection_descriptor_cc.h)

```c
typedef struct {
  const char** users;  /**< List of users */
  int64_t usersCount;  /**< Number of users */
  const char** roles; /**< List of roles */
  int64_t rolesCount; /**< Number of roles */
} mip_cc_user_roles;
```

## mip_cc_async_task

Defines task dispatcher callback functions

From [task_dispatcher_delegate_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/task_dispatcher_delegate_cc.h)

```c
typedef struct {
  const char* id;                   /**< Task ID */
  int64_t delayMs;                  /**< Delay until task execution (in milliseconds) */
  bool executeOnIndependentThread;  /**< Whether this task should execute on a completely independent thread or can re-use a shared thread */
} mip_cc_async_task;
```

## mip_cc_application_action_state

Represents the current state of the application as it performs a label-related operation

From [upe/application_action_state_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/application_action_state_cc.h)

```c
typedef struct {
  mip_cc_label_action_state actionState;                    /**< Describes if/how an application is attempting to change label state. */
  mip_cc_label newLabel;                                    /**< If 'actionType' is 'UPDATE': New label. */
  mip_cc_dictionary newLabelExtendedProperties;             /**< If 'actionType' is 'UPDATE': Additional properties to be written to metadata. */
  mip_cc_label_assignment_method newLabelAssignementMethod; /**< If 'actionType' is 'UPDATE': The method of assignment of the new label. */
  bool isDowngradeJustified;                                /**< If 'actionType' is 'UPDATE': Whether or not a label downgrade has been justified by user. */
  const char* downgradeJustification;                       /**< If 'actionType' is 'UPDATE': Label downgrade justification text provided by user. */
  mip_cc_label_action_type supportedActions;                /**< Enum mask describing the label-related actions an application is able to perform. */
} mip_cc_application_action_state;
```

## mip_cc_document_state

Callback function definition for retrieving document metatdata, filtered by name/prefix

From [upe/document_state_cc.h](https://github.com/AzureAD/mip-sdk-for-cpp/blob/develop/src/api/mip_cc/upe/document_state_cc.h)

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

