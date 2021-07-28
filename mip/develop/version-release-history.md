---
title: Microsoft Information Protection (MIP) SDK version release history and support policy
description: Version release history and change notes for the MIP SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: conceptual
ms.date: 11/25/2019
ms.author: mbaldwin

---

# Microsoft Information Protection (MIP) Software Development Kit (SDK) version release history and support policy

## Servicing

Each general availability (GA) version is supported for one year once the next GA version is released. The documentation may not include information about unsupported versions. Fixes and new functionality are only applied to the latest GA version.

Preview versions shouldn't be deployed in production. Instead, use the latest preview version to test new functionality or fixes that are coming in the next GA version. Only the most current preview version is supported.

## Release history

Use the following information to see what’s new or changed for a supported release. The most current release is listed first.

> [!NOTE]
> Minor fixes are not listed. If you experience a problem with the SDK, we recommend that you check whether it is fixed with the latest GA release. If the problem remains, check the current preview version.
>  
> For technical support, please visit the [Stack Overflow Microsoft Information Protection forum](https://stackoverflow.com/questions/tagged/microsoft-information-protection) or open a support case with Microsoft Support.

## Version 1.10.xx

**Release date:** August x, 2021

### General Changes

- Improvement of correlating and tracking hundreds of MIP callbacks that can occur per/second into the Logger Delegate.This change allows the initiation of a request to MIP with a logger context and that will get passed back in the log message and essentially tagged for later review. #2772
  - `LoggerDelegate:: WriteToLogWithContext`
  - `TaskDispatcherDelegate:: DispatchTask / ExecuteTaskOnIndependentThread`
        - `Context added incase needed for dispatch logging`
  - `void SetLoggerContext(const std::shared_ptr<void>& loggerContext)`
        - `FileEngine::Settings`
        - `FileProfile::Settings`
        - `ProtectionEngine::Settings`
        - `ProtectionProfile::Settings`
        - `PolicyEngine::Settings`
        - `PolicyProfile::Settings`
    `FileHandler static method added to allow passing in context`
        - `IsProtected`
        - `IsLabeledOrProtected`
        - `GetSerializedPublishingLicense`
    `PolicyHandler` static method added to allow passing in context
        - `IsLabeled`
- All engine settings will default to en-US locale in the event that the `.Locale` property is set to `null`.
- Fixed MIPSDK API calls to respect the declared log level. 
- Fixed bug where `IsActive` was not returning the same values inside the handler as it was retrieving labels from an engine.

### File SDK 

- Added support for labeling MSG files.
  - The pattern for labeling this files is that same as any other file type.
  - The **enable_msg_file_type** feature flag must be set to enable MSG file handling.
  - Attachments will be protected but **not** labeled. (?)
- `FileHandler::IsLabeledOrProtected()` now supports MSG files.
- File SDK now supports decryption of protected attachments on unprotected MSG files.
- Added new static method `mip::FileHandler::GetFileStatus()`
  - This function returns a new `mip::FileStatus` object. 
  - `FileStatus` exposes three properties: `IsProtected`, `IsLabeled`, and `ContainsProtectedObjects`.
  - `ContainsProtectedObjects` is useful for MSG files that have protected attachments.
- When calling `FileHandler::RemoveProtection()` on a plaintext MSG file with protected attachments, protection will be removed from the attachments.
- Added support for `applicationScenarioId` in File SDK as part of `FileExecutionState`.
- Introduction of `applicationScenarioId` per execution state so a host application can correlate calls in logging.
        - Added method `GetApplicationScenario()` in class `FileExecutionState`  #2732
        - Added telemetry to support `applicationScenarioId` #2737
        - Bug fixes for `applicationScenarioId` in 'GetTemplates()`
- Fixed a scenario where encrypted MSG files handled by third-party eDiscovery applications may fail to decrypt.

### Policy SDK

- Allow passing the document's timezone to ComputeActions to allow actions to be computed as if the document existed in a different timezone from the machine applying the label. Useful for when labels are applied on behalf of a user through a service, where the server's local time is not necessarily the same as the user's. #2832 #2811
- Instead of returning the `${Event.DateTime}` in UTC format, we now default to local time without displaying the timezone.

### Protection SDK

- Introduction of `applicationScenarioId` per execution state so a host application can correlate calls in logging.
- Feature added to Java wrapper for Protection Engine.


### Breaking Changes

- `FileExecutionState` now has an additional method: `GetApplicationScenario()`.
- -Introduced new custom settings to govern the default audit settings. #2748
        - Added new property in audit Delegate to set audit settings.
        - LabelGroupData class no longer has `IsAuditEnabled()` method. 
        - You can use instead `GetEnableAuditSetting()` to get `EnableAudit` settings in the policy once policy is loaded. Default audit settings will be `Undefined` as oppose to `true` in older versions.
- Improvement of Network Error Types for Sharepoint Online. #2783 #2784 #2764 #2785
  - There are three error types that should be return in specific error messages that today are returning generic network exceptions. The scenarios are:
        1. The tenant in the request is not recognized.
        2. The email address is invalid.
        3. The user was not found.
  - Changed MIP SDK error output when `UnknownTenant` and `InvalidEmail` exceptions are received from RMS during protection 
  - Any dependencies on the `NetworkError:FailureResponse` code output when those errors are recieved from RMS will be broken.
  - `UnknownTenant` exception changed to `ServiceDisabledError::Tenant`
  - Changes between current 1.7/1.8/1.9 and this edit:
    - RMS sends 400 response with "is not a valid email address" and "Parameter name: delegatedUserEmail" in the message body:
        `NetworkError::Category::FailureResponseCode -> NoPermissionsError::Category::InvalidEmail`
    - RMS sends 400 response with error code Microsoft.RightsManagement.Exceptions.UnknownTenantException:
        `NetworkError::Category::FailureResponseCode -> NoPermissionsError::Category::UnknownTenant`
    - RMS sends 400 response with "Could not find delegated user" or "User with the given objectId not found." in the message body:
        `NetworkError::Category::FailureResponseCode -> NoPermissionsError::Category::UserNotFound`
- Some previously AccessDeniedError throws will be replaced with NoPermissionsError. (`GetErrorType() will return ErrorType::NO_PERMISSIONS vs       ErrorType::ACCESS_DENIED`)
  - Specific cases that are no longer AccessDeniedError:
          - If a caller does not have correct access credentials to get the rights for a label id, they will now get a `NoPermissionsError::Category::AccessDenied`
          - If a caller has expired access credentials to get the rights for a label id or the content they are attempting to get from the server has expired they will now get a `NoPermissionsError::Category::AccessExpired`
- Allow passing the document's timezone to ComputeActions to allow actions to be computed as if the document existed in a different timezone from the machine applying the label. Useful for when labels are applied on behalf of a user through a service, where the server's local time is not necessarily the same as the user's. #2832 #2811
        - Instead of returning the `${Event.DateTime}` in UTC format, we now default to local time without displaying the timezone.
- Extraction of Labels from plaintext and encrypted MSG files functionality added. #2802 #2824 #2818
        - Addtionally, New static methods have been introduce in `file_handler.h`:
        - `FILE_API static std::shared_ptr<FileStatus> __CDECL GetFileStatus(`
              `const std::string& filePath,`
              `const std::shared_ptr<MipContext>& mipContext,`
              `const std::shared_ptr<void>& loggerContext = nullptr);`
        - `FILE_API static std::shared_ptr<FileStatus> __CDECL GetFileStatus(`
              `const std::shared_ptr<Stream>& stream,`
              `const std::string& filePath,`
              `const std::shared_ptr<MipContext>& mipContext`,
              `const std::shared_ptr<void>& loggerContext = nullptr);`
        - Add new header `file : file_status.h` which defines class `FileStatus`
- RMS Error Enhancements #2819 #2860 - #There is a lot of information to convey here. Not sure how to document. Add the XLS File?

### Bug Fixes

- Fixed bug to address SubLabelOrdering functionality. #2759 #2760
- Fixed Power Bi custom settings `powerbimandatory` and `powerbidefaultlabelid`.  #2743
        - In 1.8 these were added as first class settings in MIP, so they are no longer custom settings.
        - This change keeps them as first class settings but adds them back to the custom settings list.
- All engine settings will default to en-US locale in the event that the `.Locale` property is set to `null`.
- Fixed MIPSDK API calls to respect the declared log level. #2787
- Fixed bug where `IsActive` was not returning the same values inside the handler as it was retrieving labels from an engine. #2864 #2865 #2791 


### Platform and Dependency Updates

- Added Support for Debian 10. 
- Added Support for Ubuntu 20.04.

## Version 1.9.90

**Release date:** July 7, 2021

### General Changes

- Fixed a bug in File SDK where legacy documents couldn't be decrypted on 32-bit Windows.
- Enable bitcode on iOS builds.
- Updated Ubuntu 16.04 to use OpenSSL 1.1.1k.
- Fixed an issue in decrypting MSG files that had been previously handled by third-party eDiscovery tools.

## Version 1.9.78

**Release date:** April 29, 2021

### General Changes

- Added a new parameter that allows developers to provide custom scenario IDs for correlating errors. 
  - In the event that a support case is required to diagnose a service-side error, this scenario ID may be helpful in troubleshooting. 
  - **File SDK**: When creating a `FileHandler` set the applicationScenarioID via `FileExecutionState`
  - **Protection SDK**: Various APIs now support passing in the scenario ID. 
    - `mip::ProtectionCommonSettings(mApplicationScenarioId)`
    - `mip::GetTemplatesSettings::CreateGetTemplatesSettings()->SetApplicationScenarioId()`
    - `mip::ProtectionHandler::PublishingSettings()->SetApplicationScenarioId()`
    - `mip::ProtectionHandler::ConsumptionSettings()->SetApplicationScenarioId()`
    - `mip::PolicyEngine::SetSessionId()`
- Added `Workload` enum and consent checks.
  - Added `HasWorkloadConsent()` and `GetWorkloadConsent()` to `FileEngine` and `PolicyEngine`.  
- Added synchronous APIs to Policy SDK .NET wrapper: `AddEngine()`, `ListEngines()`, `DeleteEngine()`, `UnloadEngine()`.
- Added support for redirecting protection requests via `ProtectionProfile::Settings::AddRedirectionUri()`
- Added a logger context that can be used with `LoggerDelegate` to write custom context data through to logs.
  - This API can be useful for correlating error events in services to a single operation or events. 
  - The following APIs support providing the logger context:
    - `LoggerDelegate::WriteToLogWithContext`
    - `TaskDispatcherDelegate::DispatchTask` or `ExecuteTaskOnIndependentThread`    
    - `FileEngine::Settings::SetLoggerContext(const std::shared_ptr<void>& loggerContext)`
    - `FileProfile::Settings::SetLoggerContext(const std::shared_ptr<void>& loggerContext)`
    - `ProtectionEngine::Settings::SetLoggerContext(const std::shared_ptr<void>& loggerContext)`
    - `ProtectionProfile::Settings::SetLoggerContext(const std::shared_ptr<void>& loggerContext)`
    - `PolicyEngine::Settings::SetLoggerContext(const std::shared_ptr<void>& loggerContext)`  
    - `PolicyProfile::Settings::SetLoggerContext(const std::shared_ptr<void>& loggerContext)`      
    - `FileHandler::IsProtected()`
    - `FileHandler::IsLabeledOrProtected()`
    - `FileHanlder::GetSerializedPublishingLicense()`
    - `PolicyHandler::IsLabeled()`   

### Platform and Dependency Updates

- Added support for CentOS 8
- Added support for iOS Frameworks
- Updated OpenSSL to version 1.1.1k
- Updated SQLite to 3.34.1

### Breaking Changes

- Changed default audit behavior for tenants where [AIP Analytics](https://docs.microsoft.com/azure/information-protection/reports-aip#:~:text=AIP%20analytics%20also%20enable%20you%20to%20do%20perform,documents%20and%20emails%2C%20and%20track%20document%20classification%20changes.) is enabled. It is now mandatory that in addition to configuring the service-side components of the AIP Analytics feature that you also set the EnableAudit property to true in sensitivity label policies. 
  - `Set-LabelPolicy -Identity Global -AdvancedSettings @{EnableAudit="True"}`
  - Review [this](https://docs.microsoft.com/azure/information-protection/rms-client/clientv2-admin-guide-customizations#configuring-advanced-settings-for-the-client-via-powershell) Docs article for details on setting advanced policy settings.  
- Added function `GetApplicationScenarioId()` to `FileExecutionState`.
- Removed `ContentFormat` enum.
- Added specific errors with categories for a set of errors exposed previously under `NetworkError` via strings/error codes.
  - `NoPermissionsError::Category::UserNotFound`
  - `NoPermissionsError::Category::AccessDenied`
  - `NoPermissionsError::Category::AccessExpired`
  - `NoPermissionsError::Category::UserNotFound`
- `Microsoft.RightsManagement.Exceptions.UnknownTenantException` thrown service will now surface as `ServiceDisabledError` instead of `Network Error`
  
### Bug Fixes

- Fixed a memory leak when calling `mip::FileHandler::IsLabeledOrProtected()`.
- Fixed a bug where failure in `FileHandler::InspectAsync()` called incorrect observer.
- Fixed a bug where SDK attempted to apply co-authoring label format to Office formats that don't support co-authoring (DOC, PPT, XLS).
- Fixed a crash in the .NET wrapper related to `FileEngine` disposal. Native `PolicyEngine` object remained present for some period and would attempt a policy refresh, resulting in a crash. 
- Fixed a bug where the SDK would ignore labels applied by older versions of AIP due to missing **SiteID** property.

## Version 1.8.97

**Release date:** February 24, 2021

- Fixed a bug where child labels were not filtered properly and included all types of labels, even if not requested. 
- Fixed a bug where labels weren't maintained on `RemoveProtection()` if label metadata was incomplete. 

## Version 1.8.94

**Release date:** February 8, 2021

- Fixed bug in NuGet package where debug configuration for C++ projects deployed release binaries. Version 1.8.86 may result in a crash with native C++ apps. Make sure to update to 1.8.94 or later.
- Fixed a bug where policy engine was required to remove protection. 
  - If policy engine can't be loaded and label metadata is present, it will be discarded if protection is removed. 
- Fixed a bug where empty `labelInfo.xml` was generated if file was changed to another protected label. 

## Version 1.8.86

**Release date:** January 13, 2021

### General Changes

- Added support for Mac on ARM.
- Signed all dylib files for Mac.
- All clouds are fully supported across all three SDKs.
- Rename `TelemetryConfiguration` to `DiagnosticConfiguration`.
- Updated `MipContext` to accept `DiagnosticConfiguration` instead of `TelemetryConfiguration`.
- Exposed new `AuditDelegate`.
- Several custom settings have had their name changed and will be removed in version 1.9. These will continue to function in parallel with their updates names in version 1.8. 

| New Name          | Old Name                   |
| ----------------- | -------------------------- |
| is_debug_audit    | is_debug_telemetry         |
| is_audit_disabled | is_built_in_audit_disabled |

### File SDK

- Added support for user-defined labels with double key encryption.
- Added an API, `MsgInspector.BodyType` to expose body encoding type for MSG files.
- Added APIs to support Double Key Encryption with User-Defined Permissions.
- Added flag for `mip::FileHandler` that will allow the caller to disable audit discover event send. This fixes a scenario where using the `ClassifyAsync()` API would result in duplicate discovery events.
- Fixed bugs where: 
  - Setting protection on XPS file fails.
  - A file cannot be opened after upload/download from SharePoint Online and removing custom permissions.
  - `RemoveProtection()` function would accept a message.rpmsg input. Now accepts only MSG files.
  - A crash that occurred when attempting to track or revoke unprotected files.

### Policy SDK

- Removed `ActionId` from default metadata properties to ensure consistency between Microsoft Office and SharePoint Online labeled documents.
- Added support for Azure Purview-specific labels.
- Added ability to override both telemetry and audit via delegates for each.
  - Audit delegate provides the ability to send AIP auditing events to a destination other than AIP Analytics, or in addition to AIP Analytics.
- Added flag for `mip::PolicyHandler` that will allow the caller to discover audit discover event send. This fixes a scenario where using the `ClassifyAsync()` API would result in duplicate discovery events.
- Fixed a bug where encrypted policy database couldn't be opened in certain scenarios.
- Exposed new `AuditDelegate` that allows developers to override default MIP SDK audit pipeline and send events to their own infrastructure. 
- `mip::ClassifierUniqueIdsAndContentFormats` and `GetContentFormat()` now return `std::string` instead of `mip::ContentFormat`. This change is replicated in .NET and Java wrappers. 
- `ContentFormat.Default` is now `ContentFormat.File`.

### Protection SDK

- Added a `ProtectionEngineSettings.SetAllowCloudServiceOnly` property that will prohibit any connections to Active Directory Rights Management Services clusters when true. Only cloud environments will be used.
- Added support for acquiring delegation licenses.
  - Delegations licenses enable services to fetch a license for content on behalf of a user.
  - This lets the service view rights data and decrypt on behalf of the user without additional calls to service.  

### Java Wrapper (Public Preview)

- Added support for Track and Revoke to Java Wrapper.
- Added stream support to Java Wrapper

### C API

- Removed **MIP_FLIGHTING_FEATURE_KEEP_PDF_LINEARIZATION** flag from C API.

## Version 1.7.147

### File SDK

- Minor bug fix for the PBIX file format. 

## Version 1.7.145

**Release date:** November 13, 2020

### General Changes

- Updated NuGet package to copy dependencies only on update rather than always.
- Debug configuration on .NET will use release version of native libraries. We found that customers deploying .NET solutions in debug mode to remote servers were required to install the VC++ Debug runtime, which isn't trivial. If there's a need to debug in to native libraries, please copy the DLLs from the SDK redistributable into the project folder (https://ala.ms/mipsdkbins)
- Fixed a bug that was generating warnings for .NET Core projects.

## Version 1.7.133

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
- Fixed a bug where `mip::Identity` wasn't properly loaded from cached engines.
- Fixed a bug where classification GUID comparisons were case-sensitive in classification API.
- Enriched audit events by adding new fields.

### Protection SDK

- Fixed a bug where `mip::Identity` wasn't properly loaded from cached engines.
- Added implicit registration for newly created publishing licenses.
- Added support for cryptographic algorithms used to support DKE in Office files.
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
- Migrated iOS/macOS HTTP implementation from NSURLConnection to NSURLSession.
- Migrated iOS telemetry component from Aria SDK to 1DS SDK.
- Telemetry component now uses MIP's HttpDelegate on iOS, macOS, and Linux. (Previously only win32).
- Improved type safety for C API.
- Moved AuthDelegate from Profile to Engine in C++, C#, and Java APIs.
- AuthDelegate moved from constructor of `Profile::Settings` to `Engine::Settings`.
- Added Category to NoPolicyError to provide more info about why policy sync failed.
- Added `PolicyEngine::GetTenantId` method.
- Added explicit support for all clouds.
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
- Exposed public Microsoft TLS cert used by protection service.
   - `GetMsftCert` and `GetMsftCertPEM`
   - If an application overrides `HttpDelegate` interface, it must trust server certificates issued by this CA.
   - This requirement is expected to be removed late in 2020.    

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
- Removed previously deprecated APIs
  - File/Policy/Profile::Settings must be initialized with a MipContext
  - File/Policy/Profile::Settings path, application info, logger delegate, telemetry, and log level getters/setters have been removed. These properties are managed by MipContext
- Better static library support on Apple platforms
  - Monolithic static libraries
    - libmip_file_sdk_static.a
    - libmip_upe_sdk_static.a
    - libmip_protection_sdk_static.a
    - libmip_upe_and_protection_sdk_static.a
  - Third-party dependencies extracted into separate libraries
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

- Removed previously deprecated APIs
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
- Protection SDK now supports Chinese cloud customers.
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
 - Enabled support for third-party applications to download sensitivity types from SCC.
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
