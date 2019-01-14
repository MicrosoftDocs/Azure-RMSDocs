---
title: Microsoft Information Protection (MIP) SDK version release history and support policy
description: A quickstart showing you how to write the initialization logic for a Microsoft Information Protection (MIP) SDK client applications.
author: BryanLa
ms.service: information-protection
ms.topic: conceptual
ms.date: 01/08/2019
ms.author: bryanla
manager: mbaldwin
---

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

## Version 1.1.0

**Release date**: TBD

This version introduces support for the following platforms:

  - .NET
  - iOS SDK (Policy API)
  - Android SDK (Policy API and Protection API)

**New features:**

- ADRMS support
- Protection API operations are truly asynchronous (on Win32), allowing for simultaneous non-blocking encrypt/decrypt operations
  - Application callbacks (AuthDelegate, HTTPDelegate, etc.) may now be invoked on *any* background thread
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

- New requirements:
  - Enforced population of ID/name/version fields mip::ApplicationInfo when creating mip::FileProfile, mip::PolicyProfile, and mip::ProtectionProfile
  - Applications must implement new mip::FileExecutionState interface when creating mip::FileHandlers
  
- Updated exceptions:
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

**Fixes**:

TBD

## Next steps

- See [MIP SDK FAQs and issues](faqs-known-issues.md) for information on supported platforms and more.
- See [MIP SDK setup and configuration](setup-configure-mip.md) for information on how to get started with the MIP SDK.