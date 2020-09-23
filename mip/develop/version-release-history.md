---
title: Microsoft Information Protection (MIP) SDK version release history and support policy
description: Version release history and change notes for the MIP SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: conceptual
ms.date: 11/25/2019
ms.author: mbaldwin
manager: barbkess
---

# Microsoft Information Protection (MIP) Software Development Kit (SDK) version release history and support policy

## Servicing

Each general availability (GA) version is supported for six months once the next GA version is released. The documentation may not include information about unsupported versions. Fixes and new functionality are only applied to the latest GA version.

Preview versions shouldn't be deployed in production. Instead, use the latest preview version to test new functionality or fixes that are coming in the next GA version. Only the most current preview version is supported.

## Release history

Use the following information to see what’s new or changed for a supported release. The most current release is listed first.

> [!NOTE]
> Minor fixes are not listed so if you experience a problem with the SDK, we recommend that you check whether it is fixed with the latest GA release. If the problem remains, check the current preview version.
>  
> For technical support, please visit the [Stack Overflow Microsoft Information Protection forum](https://stackoverflow.com/questions/tagged/microsoft-information-protection).

## Version 1.7

**Release date**: September 23, 2020

### General SDK Changes

- Public Preview available for Java on Windows and Ubuntu 18.04.
- .NET Core now supported on Windows.
- Public preview support for .NET Core on Ubuntu 18.04.
- Improved local logging for Keystore when storage cache type is set to `OnDiskEncrypted.`
- Enabled feature flighting on .NET Wrapper
- Reverted SDK telemetry behavior to pre-1.6. A minimum set of usage events are now sent when opted in for minimum telemetry only.

### File SDK

- Fixed UTF-16/UTF-8 body conversion in `MSGInspector`.
- Set a default max file size limit for files protected by the File SDK to 6GB.
  - Change made due to decryption of large files requiring *at least* the file size in available memory.
  - Can be overridden by custom setting `max_file_size_for_protection`.
- Added support for linearized PDFs.
- Fixed a bug where LastModifiedDate wasn't updated on Change event.
- Fixed a memory leak in protected PDF creation.
- File SDK supports revocation of tracked files.
- `FileEngine::Settings::SetLabelFilter` is deprecated, use `ConfigureFunctionality` instead.

### Policy SDK

- Policy SDK now supports Encrypt Only labeling actions.
- Policy SDK now supports user-defined permissions (UDP) for Dual Key Encryption-enabled (DKE) labels.
- Added support for filtering labels that use double key encryption with user-defined permissions from user labels.
- Fixed a bug where `mip::Identity` wasn't properly loaded from cached engines.
- Fixed a bug where classification GUID comparisons were case sensitive in classification API.
- Enriched audit events by adding new fields.

### Protection SDK

- Fixed a bug where `mip::Identity` wasn't properly loaded from cached engines.
- Added implicit registration for newly created publishing licenses.
- Added support for cyptographic algorithms used to support DKE in Office files.
- Made `documentId` and `owner` parameters optional.

### C APIs

- Added missing identity and DKE APIs.
- Moved `AuthDelegate` from profile to engine across all SDKs.
- Publish Policy SDK Sample for C
- `MIP_CC_CreateProtectionEngineSettingsWithIdentity` has been deprecated, use `MIP_CC_CreateProtectionEngineSettingsWithIdentityAndAuthCallback` instead.
- `MIP_CC_CreateProtectionEngineSettingsWithEngineId` has been deprecated, use `MIP_CC_CreateProtectionEngineSettingsWithEngineIdAndAuthCallback` instead.
- `MIP_CC_CreateProtectionProfileSettings` signature has changed.
- `MIP_CC_CreatePolicyEngineSettingsWithIdentity` has been deprecated, use `MIP_CC_CreatePolicyEngineSettingsWithIdentityAndAuthCallback`.
- `MIP_CC_CreatePolicyEngineSettingsWithEngineId` has been deprecated, use `MIP_CC_CreatePolicyEngineSettingsWithEngineIdAndAuthCallback`.
- `MIP_CC_PolicyEngineSettings_SetLabelFilter` has been deprecated, use `MIP_CC_PolicyEngineSettings_ConfigureFunctionality`.
- `MIP_CC_CreatePolicyProfileSettings` signature has changed.

### Breaking Changes

#### Common

- `TelemetryConfiguration::isTelemetryOptedOut` renamed to `isMinimalTelemetryEnabled`. 

#### C API
- `mip_cc_document_state` has been updated with a new value `mip_cc_metadata_version_format` contentMetadataVersionFormat

## Version 1.6.103

**Release date**: April 16, 2020

### General SDK Changes

- TLS 1.2 enforced for all non-ADRMS HTTP communication.
- Migrated iOS/MacOS HTTP implementation from NSURLConnection to NSURLSession.
- Migrated iOS telemetry component from Aria SDK to 1DS SDK.
- Telemetry component now uses MIP's HttpDelegate on iOS, MacOs, and Linux. (Previously only win32).
- Improved type safety for C API.
- Moved AuthDelegate from Profile to Engine in C++, C#, and Java APIs.
- AuthDelegate moved from constructor of `Profile::Settings` to `Engine::Settings`.
- Added Category to NoPolicyError to provide more info about why policy sync failed.
- Added `PolicyEngine::GetTenantId` method.
- Added explicit sovereign cloud support.
  - New `Engine::Settings::SetCloud` method to set target cloud (GCC High, 21-Vianet, etc.).
  - Existing `Engine::Settings::SetCloudEndpointBaseUrl` method call is no longer necessary for recognized clouds.
- Enabled bitcode for iOS binaries.

### File SDK

- Added `IFileHandler::InspectAsync` to C# and Java Wrappers
- New support via `FileProfile::AcquirePolicyAuthToken` for triggering policy token acquisition to allow an application to warm up its token cache.    
- `MsgInspector::GetAttachments` returns `vector<shared_ptr<MsgAttachmentData>>` instead of `vector<unique_ptr<MsgAttachmentData>>`
- `TelemetryConfiguration::isOptedOut` setting now completely disables telemetry. Previously a set of minimum telemetry was sent.

### Policy SDK

- New support for triggering token acquisition to allow an application to warm up its token cache via `PolicyProfile::AcquireAuthToken`.
- HYOK labels are filtered by default.
- Metadata associated with deleted labels will now be removed.
- If there is ever a mismatch between cached label policy and sensitivity policy, the policy cache will now be cleared.
- New support for versioned metadata:
  - A file format may rev the location/format of its label metadata. In that case, an application should provide MIP with all metadata, and MIP will determine which metadata is "true".
  - `ContentLabel::GetExtendedProperties` now returns `vector<MetadataEntry>` instead of `vector<pair<string, string>>`.
  - `MetadataAction::GetMetadataToAdd` now returns `vector<MetadataEntry>` instead of `vector<pair<string, string>>`.
  - `ExecutionState::GetContentMetadata` should now return `vector<MetadataEntry>` instead of `vector<pair<string, string>>`.
  - `ExecutionState::GetContentMetadataVersion` should return the highest version of metadata that the application recognizes for the current file format (usually 0).
  - `PolicyEngine::GetWxpMetadataVersion` returns the metadata version for Office documents as configured by tenant admin (0 = default, 1 = coauth-enabled format).
  - Equivalent changes in C API:
    - `MIP_CC_ContentLabel_GetExtendedProperties`
    - `MIP_CC_MetadataAction_GetMetadataToAdd`
    - `mip_cc_metadata_callback`
    - `mip_cc_document_state`
    - `MIP_CC_PolicyEngine_GetWxpMetadataVersion`
- `TelemetryConfiguration::isOptedOut` setting now completely disables telemetry. Previously a set of minimum telemetry was sent. 

### Protection SDK

- New support for registration and revocation for doc tracking.
- New support for generating a pre-license when publishing.
- Exposed public Microsoft SSL cert used by protection service.
   - `GetMsftCert` and `GetMsftCertPEM`
   - If an application overrides `HttpDelegate` interface, it must trust server certificates issued by this CA.
   - This requirement is expected be removed late in 2020.    

## Version 1.5.124

**Release date**: March 2, 2020

### General SDK Changes

- Java API (Windows-only)
- Cancellation of async MIP tasks
  - All async calls return mip::AsyncControl object with a Cancel() method
- Delay-load dependent binaries
- Optionally mask specific telemetry/audit properties
   - Configurable via mip::TelemetryConfiguration::maskedProperties
- Improved exceptions:
  - All errors include actionable correlation IDs in description string
  - Network error has 'Category', 'BaseUrl', 'RequestId', and 'StatusCode' fields
- Improved C API result/error details

### File SDK

- Network-free check if file is labeled or protected
  - mip::FileHandler::IsLabeledOrProtected()
  - Minor risk of false positives (for example if file contains zombie label metadata)
- Filter labels associated with specific types of protection
  - Configurable via mip::FileEngine::Settings::SetLabelFilter()
- Expose policy data to File API
  - mip::FileEngine::GetPolicyDataXml()

### Policy SDK

- Dynamic content marking for watermark/header/footer actions:
  - Fields like ${Item.Label}, ${Item.Name}, ${User.Name}, ${Event.DateTime} will be automatically
    populated by MIP
  - mip::Identity can be constructed with user-friendly "name" field used by dynamic content marking
  - Configurable via mip::PolicyEngine::Settings::SetVariableTextMarkingType()
- Network-free check if content is labeled
  - mip::PolicyHandler::IsLabeled()
  - Minor risk of false positives (for example if content contains zombie label metadata)
- Label policy cache TTL
  - Default: 30 days
  - Configurable via mip::PolicyProfile::SetCustomSettings()
- **Breaking Change**
  - Updated PolicyEngine.Settings.LabelFilter from list of enums to nullable bitfield.

### Protection SDK

- Pre-license
  - Existence of a pre-license alongside encrypted content, along with a previously retrieved user
    cert, allows for offline decryption of content
  - mip::ProtectionHandler::ConsumptionSettings can be constructed with a pre-license
  - mip::ProtectionEngine::LoadUserCert|Async() fetches user cert which is stored according to
    mip::ProtectionProfile's caching policy
- Server-specific feature checking
  - Checks if user's tenant supports "encrypt only" feature (only available in Azure RMS)
  - mip::ProtectionEngine::IsFeatureSupported()
- Richer details when fetching RMS templates
- **Breaking Changes**
  - `mip::ProtectionEngine::GetTemplates()` `vector<shared_ptr<string>>` return value replaced with
    `vector<shared_ptr<mip::TemplateDescriptor>>` (C++)
  - `mip::ProtectionEngine::Observer::OnGetTemplatesSuccess()` callback `shared_ptr<vector<string>>`
    parameter replaced with `vector<shared_ptr<mip::TemplateDescriptor>>` (C++)
  - IProtectionEngine.GetTemplates|Async() return value `List<string>` replaced with
    `List<TemplateDescriptor>`. (C#)
  - MIP_CC_ProtectionEngine_GetTemplates() mip_cc_guid* param replaced with mip_cc_template_descriptor* (C API)

### C API

- **Breaking Changes**: Updated most functions to include mip_cc_error* parameter, can be NULL
  

### Error/Exception Updates

- Error handling summary:
  - AccessDeniedError:        User has not been granted rights to access content
      - NoAuthTokenError:          App did not provide auth token
      - NoPermissionsError:        User has not been granted rights to specific content, but referrer/owner is available
      - ServiceDisabledError:      Service is disabled for user/device/platform/tenant
  - AdhocProtectionRequiredError: Ad hoc protection must be set before setting a label
  - BadInputError:           Invalid input from user/app
      - InsufficientBufferError:   Invalid buffer input from user/app
      - LabelDisabledError:        Label ID is recognized but disabled for use
      - LabelNotFoundError:        Unrecognized label ID
      - TemplateNotFoundError:     Unrecognized template ID
  - ConsentDeniedError:      An operation that required consent from user/app was not granted consent
  - DeprecatedApiError:      This API has been deprecated
  - FileIOError:             Failed to read/write file
  - InternalError:           Unexpected internal failure
  - NetworkError
      - ProxyAuthenticationError:   Proxy authentication is required
    - Category=BadResponse:         Server returned unreadable HTTP response (retry might succeed)
    - Category=Cancelled:           Failed to establish HTTP connection because operation was canceled by user/app (retry will probably succeed)
    - Category=FailureResponseCode: Server returned a generic failure response (retry might succeed)
    - Category=NoConnection:        Failed to establish HTTP connection (retry might succeed)
    - Category=Offline:             Failed to establish HTTP connection because application is in offline mode (retry won't succeed)
    - Category=Proxy:               Failed to establish HTTP connection due to proxy issue (retry probably won't succeed)
    - Category=SSL:                 Failed to establish HTTP connection due to SSL issue (retry probably won't succeed)
    - Category=Throttled:           Server returned "throttled" response (backoff/retry will probably succeed)
    - Category=Timeout:             Failed to establish HTTP connection after timeout (retry will probably succeed)
    - Category=UnexpectedResponse:  Server returned unexpected data (retry might succeed)
  - NoPolicyError:           Tenant or user is not configured for labels
  - NotSupportedError:       Operation not supported in current state
  - OperationCancelledError: Operation was canceled
  - PrivilegedRequiredError: Cannot modify label unless assignment method = priviledged
- Changes
  - Removed unused PolicySyncError. Replaced by NetworkError
  - Removed unused TransientNetworkError. Replaced by NetworkError categories

## Version 1.4.0 

**Release date**: November 6, 2019

This version introduces support for the Protection SDK in the .NET package (Microsoft.InformationProtection.File).

### SDK changes
- Performance improvements and bug fixes
- Renamed StorageType enum to CacheStorageType
- Android links to libc++ instead of gnustl
- Removed previouslydeprecated APIs
  - File/Policy/Profile::Settings must be initialized with a MipContext
  - File/Policy/Profile::Settings path, application info, logger delegate, telemetry, and log level getters/setters have been removed. These properties are managed by MipContext
- Better static library support on Apple platforms
  - Monolithic static libraries
    - libmip_file_sdk_static.a
    - libmip_upe_sdk_static.a
    - libmip_protection_sdk_static.a
    - libmip_upe_and_protection_sdk_static.a
  - 3rd-party dependencies extracted into separate libraries
    - libsqlite3.a
    - libssl.a
- Removed mip_telemetry.dll (merged into mip_core.dll)

### File SDK

- RPMSG
  - Encryption
  - Added support for string8 decryption
- Configurable PFILE extension behavior (default, <EXT>.PFILE, or P<EXT>)
  - ProtectionSettings::SetPFileExtensionBehavior

### Policy SDK

- Complete C API
- Configure filtering of labels associated with protection
  - PolicyEngine::Settigns::SetLabelFilter()

### Protection SDK

- Removed previouslydeprecated APIs
  - Removed ProtectionEngine::CreateProtectionHandlerFromDescriptor[Async] (use ProtectionEngine::CreateProtectionHandlerForPublishing[Async])
  - Removed ProtectionEngine::CreateProtectionHandlerFromPublishingLicense[Async] (use ProtectionEngine::CreateProtectionHandlerForConsumption[Async])
- Complete C# API
- Complete C API
  - C API normalization changes from v1.3 C API preview:
    - Renamed mip_cc_storage_type to mip_cc_cache_storage_type
    - Renamed MIP_CC_AddProtectionProfileEngine to MIP_CC_ProtectionProfile_AddEngine
    - Renamed MIP_CC_CreateProtectionEngineSettingsForExistingEngine to MIP_CC_CreateProtectionEngineSettingsWithEng
    - Renamed MIP_CC_CreateProtectionEngineSettingsForNewEngine to MIP_CC_CreateProtectionEngineSettingsWithIdentity
    - Renamed MIP_CC_SetProtectionProfileSettingsHttpDelegate to MIP_CC_ProtectionProfileSettings_SetHttpDelegate
    - Renamed MIP_CC_CreateProtectionHandlerForConsumption to MIP_CC_ProtectionEngine_CreateProtectionHandlerForConsumption
    - Renamed MIP_CC_CreateProtectionHandlerForPublishing to MIP_CC_ProtectionEngine_CreateProtectionHandlerForPublishing
    - Renamed MIP_CC_GetProtectionEngineId to MIP_CC_ProtectionEngine_GetEngineId
    - Renamed MIP_CC_GetProtectionEngineTemplates to MIP_CC_ProtectionEngine_GetTemplates
    - Renamed MIP_CC_GetProtectionEngineTemplatesSize to MIP_CC_ProtectionEngine_GetTemplatesSize
    - Renamed MIP_CC_SetTelemetryConfigurationHttpDelegate to MIP_CC_TelemetryConfiguration_SetHttpDelegate
    - Renamed MIP_CC_SetTelemetryConfigurationHostName to MIP_CC_TelemetryConfiguration_SetHostName
    - Renamed MIP_CC_SetTelemetryConfigurationIsLocalCachingEnabled to MIP_CC_TelemetryConfiguration_SetIsLocalCachingEnabled
    - Renamed MIP_CC_SetTelemetryConfigurationIsNetworkDetectionEnabled to MIP_CC_TelemetryConfiguration_SetIsNetworkDetectionEnabled
    - Renamed MIP_CC_SetTelemetryConfigurationIsTelemetryOptedOut to MIP_CC_TelemetryConfiguration_SetIsTelemetryOptedOut
    - Renamed MIP_CC_SetTelemetryConfigurationLibraryName to MIP_CC_TelemetryConfiguration_SetLibraryName
    - Removed MIP_CC_ProtectionEngine_GetRightsForLabelIdSize and updated MIP_CC_ProtectionEngine_GetRightsForLabelId to populate a mip_cc_string_list instead of a comma-separated string buffer
    - Removed MIP_CC_ProtectionHandler_GetRightsSize and updated MIP_CC_ProtectionHandler_GetRights to populate a mip_cc_string_list instead of a comma-separated string buffer
    - Added MIP_CC_ProtectionEngine_GetEngineIdSize and updated MIP_CC_ProtectionEngine_GetEngineId to populate a string buffer instead of a mip_cc_guid
    - MIP_CC_CreateProtectionDescriptorFromUserRights now takes 'mip_cc_dictionary-' param instead of 'mip_cc_dictionary'
    - MIP_CC_ProtectionEngineSettings_SetCustomSettings now takes 'mip_cc_dictionary-' param instead of 'mip_cc_dictionary'
    - MIP_CC_ProtectionProfileSettings_SetCustomSettings now takes 'mip_cc_dictionary-' param instead of 'mip_cc_dictionary'
    - MIP_CC_TelemetryConfiguration_SetCustomSettings now takes 'mip_cc_dictionary-' param instead of 'mip_cc_dictionary'
    - MIP_CC_CreateMipContext takes 'isOfflineOnly' and 'loggerDelegateOverride' params


## Version 1.3.0

**Release date**: August 22, 2019

### New Features

- `mip::MipContext` is the new highest-level object.
- Decryption of protected MSG files is now supported.
- Inspection of message.rpmsg files is supported via `mip::FileInspector` and `mip::FileHandler::InspectAsync()`.
- On-disk cache may now be optionally encrypted.
- Protection SDK now supports China sovereign cloud.
- Arm64 support on Android.
- Arm64e support on iOS.
- End-user license (EUL) cache can now be disabled.
- .pfile encryption may be disabled via `mip::FileEngine::EnablePFile`
- Improved performance for protection operations by reducing number of HTTP calls
- Removed the delegated identity details from `mip::Identity` and instead added `DelegatedUserEmail` to `mip::FileEngine::Settings`, `mip::ProtectionSettings`, `mip::PolicyEngine::Settings`, and `mip::ProtectionHandler`'s `PublishingSettings` and `ConsumptionSettings`.
- Functions that previously returned LabelId now return a `mip::Label` object.

### Changes

* In previous versions, we required that you called `mip::ReleaseAllResources`. Version 1.3 replaces this with `mip::MipContext::~MipContext` or `mip::MipContext::Shutdown`.
* Removed `ActionSource` from `mip::LabelingOptions` and `mip::ExecutionState::GetNewLabelActionSource`
* Replaced `mip::ProtectionEngine::CreateProtectionHandlerFromDescriptor` with `mip::ProtectionEngine::CreateProtectionHandlerForPublishing`.
* Replaced `mip::ProtectionEngine::CreateProtectionHandlerFromPublishingLicense` with `mip::ProtectionEngine::CreateProtectionHandlerForConsumption`.
* Renamed `mip::PublishingLicenseContext` to `mip::PublishingLicenseInfo` and updated to contain rich fields instead of raw serialized bytes.
* `mip::PublishingLicenseInfo` contains the data relevant to MIP after parsing a publishing license (PL).
* `mip::TemplateNotFoundError` and `mip::LabelNotFoundError` thrown when application passes MIP a template ID or label ID that is not recognized.
* Added support for label-based conditional access via the claims parameter of `AcquireToken()` and `mip::AuthDelegate::OAuth2Challenge()`. This functionality hasn't yet been exposed via the Security and Compliance Center portal.


## Version 1.2.0

**Release date**: April 15, 2019

### New Features

 - Telemetry component now uses same HTTP stack as the rest of MIP, even if client application has overridden it with HttpDelegate.
 - Client applications can control the threading behavior of async tasks by overriding TaskDispatcherDelegate in Profiles.
 - RPMSG encryption now in preview.
 - Align File/Policy SDK exception handling behavior with Protection SDK:
    - ProxyAuthError thrown by all SDKs if a proxy is configured to require authentication.
    - NoAuthTokenError thrown by all SDKs if empty auth token is provided by application's implementation of mip::AuthDelegate::AcquireOAuth2Token.
 - Improved HTTP caching for Policy SDK reduces # of required HTTP calls by half.
 - Richer logs/audit/telemetry for improved failure detection and debugging.
 - Support for external/foreign labels to facilitate migration to AIP labels.
 - Enabled support for 3rd-party applications to download sensitivity types from SCC.
 - More telemetry settings are exposed and configurable (caching/threading behavior, etc.).
 
### SDK Changes

 - mip_common.dll split into mip_core.dll and mip_telemetry.dll.
 - Renamed mip::ContentState to mip::DataState to describe how an application interacts with data at a high level.
 - mip::AdhocProtectionRequiredError exception is thrown by FileHandler::SetLabel to notify an application that it must first apply ad hoc protection before applying a label.
 - mip::OperationCancelledError exception is thrown when an operation has been canceled (for example due to shutdown or HTTP cancellation).
 - New APIs:
    - mip::ClassificationResult::GetSensitiveInformationDetections
    - mip::FileEngine::GetLastPolicyFetchTime
    - mip::FileEngine::GetDefaultSensitivityLabel
    - mip::FileEngine::GetPolicyId
    - mip::FileEngine::HasClassificationRules
    - mip::FileEngine::Settings::SetPolicyCloudEndpointBaseUrl
    - mip::FileHandler::GetDecryptedTemporaryFileAsync
    - mip::FileHandler::Observer::OnGetDecryptedTemporaryFileFailure
    - mip::FileHandler::Observer::OnGetDecryptedTemporaryFileSuccess
    - mip::File/Policy/ProtectionProfile::SetTaskDispatcherDelegate
    - mip::File/Policy/ProtectionProfile::SetTelemetryConfiguration
    - mip::HttpRequest::GetBody returns std::vector<uint8_t> instead of std::string
    - mip::HttpRequest::GetId
    - mip::PolicyEngine::GetLastPolicyFetchTime
    - mip::PolicyEngine::GetPolicyId
    - mip::PolicyEngine::HasClassificationRules
    - mip::PolicyEngine::Settings::SetCloudEndpointBaseUrl
    - mip::ProtectionDescriptor::GetContentId
    - (interface) mip::TaskDispatcherDelegate
 
### New Requirements
 - mip::ReleaseAllResources must be called prior to process termination (after clearing references to all Profiles, Engines, and Handlers)
 - (interface) mip::ExecutionState::GetClassificationResults return type and "classificationIds" parameter has changed
 - (interface) mip::FileExecutionState::GetAuditMetadata can be implemented by applications to specify detailed information to surface to a tenant admin's audit dashboard (for example sender, recipients, last modified, etc.)
 - (interface) mip::FileExecutionState::GetClassificationResults return type has changed, and it now requires a FileHandler parameter
 - (interface) mip::FileExecutionState::GetDataState should be implemented by applications to specify how an application is interacting with contentIdentifier
 - (interface) mip::HttpDelegate interface requires 'CancelOperation' and 'CancelAllOperations' methods
 - (interface) mip::HttpDelegate interface 'Send' and 'SendAsync' return mip::HttpOperation instead of mip::HttpResponse
 - (interface) mip::HttpResponse::GetBody returns std::vector<uint8_t> instead of std::string
 - (interface) mip::HttpResponse interface requires 'GetId' method implementation
 - mip::ContentLabel::GetCreationTime return std::chrono::time_point instead of std::string
 - mip::FileEngine::CreateFileHandlerAsync no longer accepts 'contentIdentifier' parameter
 - mip::PolicyHandler::NotifyCommitedActions renamed to mip::PolicyHandler::NotifyCommittedActions


## Version 1.1.0 

**Release date**: January 15, 2019

This version introduces support for the following platforms:

  - .NET
  - iOS SDK (Policy SDK)
  - Android SDK (Policy SDK and Protection SDK)

### New Features

- ADRMS support
- Protection SDK operations are truly asynchronous (on Win32), allowing for simultaneous non-blocking encrypt/decrypt operations
  - Application callbacks (AuthDelegate, HTTPDelegate, etc.) may now be invoked on -any- background thread
- Custom label properties set by IT administrators can now be read via mip::Label::GetCustomSettings
- Serialized publishing license can now be retrieved directly from a file without any HTTP operations via mip::FileHandler::GetSerializedPublishingLicense
- Applications are notified whether an HTTP operation is required to complete the creation of a mip::FileEngine/mip::PolicyEngine via mip::FileProfile::Observer::OnAddPolicyEngineStarting/mip::PolicyProfile::Observer::OnAddEngineStarting
- Detection of whether protected content has an expiration date or not has been simplified with convenience method mip::ProtectionDescriptor::DoesContentExpire
- Classification:
  - Sensitivity types (regex expressions for CC#'s, passport #'s, etc.) can be acquired from SCC service
    - Enable feature by setting mip::FileEngine::Settings/mip::PolicyEngine::Settings flag
    - Read types via mip::FileEngine::ListSensitivityTypes/mip::PolicyEngine::ListSensitivityTypes
  - Classification results from external document scanner utilities can be fed to MIP to drive recommended/required labels based on document content
    - Pass results to MIP via mip::FileExecutionState::GetClassificationResults/mip::ExecutionState::GetClassificationResults
    - mip::ApplyLabelAction and mip::RecommendLabelAction can be returned by mip::PolicyEngine::ComputeActions when classification results match a policy rule indicating required/recommended labels

### New Requirements 

  - Enforced population of ID/name/version fields mip::ApplicationInfo when creating mip::FileProfile, mip::PolicyProfile, and mip::ProtectionProfile
  - Applications must implement new mip::FileExecutionState interface when creating mip::FileHandlers
  
### New Exceptions 

  - mip::NoAuthTokenError thrown if application's AuthDelegate returns an empty token (due to cancellation)
    - Applies to creation of:
      - mip::FileEngine
      - mip::FileHandler
      - mip::PolicyEngine
      - mip::ProtectionHandler
  - mip::NoPolicyError thrown if tenant isn't configured for labels
    - Applies to creation of:
      - mip::FileEngine
      - mip::PolicyEngine
  - mip::ServiceDisabledError thrown if RMS service is disabled for a specific user/device/platform/tenant
    - Applies to creation of:
      - mip::FileHandler
      - mip::ProtectionHandler
  - mip::NoPermissionsError thrown if a user doesn't have rights to decrypt a document or the content is expired
    - Applies to creation of:
      - mip::FileHandler
      - mip::ProtectionHandler

## Next steps

- See [MIP SDK FAQs and issues](faqs-known-issues.md) for information on supported platforms and more.
- See [MIP SDK setup and configuration](setup-configure-mip.md) for information on how to get started with the MIP SDK.
