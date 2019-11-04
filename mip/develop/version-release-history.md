*-
title: Microsoft Information Protection (MIP) SDK version release history and support policy
description: A quickstart showing you how to write the initialization logic for a Microsoft Information Protection (MIP) SDK client applications.
author: msmbaldwin
ms.service: information-protection
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.date: 01/08/2019
ms.author: mbaldwin
manager: barbkess
*-

# Microsoft Information Protection (MIP) SDK version release history and support policy

## Servicing 

Each general availability (GA) version is supported for six months once the next GA version is release. The documentation may not include information about unsupported versions. Fixes and new functionality are only applied to the latest GA version.

Preview versions shouldn't be deployed in production. Instead, use the latest preview version to test new functionality or fixes that are coming in the next GA version. Only the most current preview version is supported.

## Release history

Use the following information to see what’s new or changed for a supported release. The most current release is listed first. 

> [!NOTE]
> Minor fixes are not listed so if you experience a problem with the SDK, we recommend that you check whether it is fixed with the latest GA release. If the problem remains, check the current preview version.
>  
> For technical support, please visit the [Stack Overflow Microsoft Information Protection forum](https://stackoverflow.com/questions/tagged/microsoft-information-protection). 

## Version 1.4.0 

**Release date**: October 6, 2019

This version introduces support for the protection API in the .NET package (Microsoft.InformationProtection.File).

### SDK changes
- Performance improvements and bug fixes
- Renamed StorageType enum to CacheStorageType
- Android links to libc++ instead of gnustl
- Removed previously-deprecated APIs
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

### File API

- RPMSG
  - Encryption
  - Added support for string8 decryption
- Configurable PFILE extension behavior (default, <EXT>.PFILE, or P<EXT>)
  - ProtectionSettings::SetPFileExtensionBehavior

### Policy API

- Complete C API
- Configure filtering of labels associated with protection
  - PolicyEngine::Settigns::SetLabelFilter()

### Protection API

- Removed previously-deprecated APIs
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
- Protection API now supports China sovereign cloud.
- Arm64 support on Android.
- Arm64e support on iOS.
- End user license (EUL) cache can now be disabled.
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
 - Improved HTTP caching for Policy SDK reduces # of required HTTP calls by half..
 - Richer logs/audit/telemetry for improved failure detection and debugging.
 - Support for external/foreign labels to facilitate migration to AIP labels.
 - Enabled support for 3rd-party applications to download sensitivity types from SCC.
 - More telemetry settings are exposed and configurable (caching/threading behavior, etc.).
 
### SDK Changes

 - mip_common.dll split into mip_core.dll and mip_telemetry.dll.
 - Renamed mip::ContentState to mip::DataState to describe how an application interacts with data at a high level.
 - mip::AdhocProtectionRequiredError exception is thrown by FileHandler::SetLabel to notify an application that it must first apply ad-hoc protection before applying a label.
 - mip::OperationCancelledError exception is thrown when an operation has been cancelled (e.g. due to shutdown or HTTP cancellation).
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
 - (interface) mip::FileExecutionState::GetAuditMetadata can be implemented by applications to specify detailed information to surface to a tenant admin's audit dashboard (e.g. sender, recipients, last modified, etc.)
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
  - iOS SDK (Policy API)
  - Android SDK (Policy API and Protection API)

### New Features

- ADRMS support
- Protection API operations are truly asynchronous (on Win32), allowing for simultaneous non-blocking encrypt/decrypt operations
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
