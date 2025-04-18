---
title: Concepts - Logging
description: This article helps you understand the concepts around logging in MIP SDK.
author: yangczhang
ms.service: information-protection
ms.topic: conceptual
ms.date: 04/10/2025
ms.author: yangczhang
---

# Concept - Logging in MIP SDK
Troubleshooting custom applications that consume the MIP SDK begin with inspecting mip logs. MIP log location is configured at MipContext creation and can be queried for with *.miplog file extension.
Microsoft apps and samples store MIP logs at application path\APP_DATA\mip_data.

## Mask sensitive data in MIP logs
Logs in the MIP SDK don't mask sensitive content which may be personally identifiable to a customer without extra configuration. 

Common sensitive data in MIP SDK logs:
- Email names
- File names
- Label names
- IP addresses
- MAC addresses

To mask sensitive content in all miplog files generated by the MIP SDK, create a new field in the configuration .json file or configure in MipConfiguration.

## Configuration file
Configuration files are the recommended path to configure custom settings in the MIP SDK and available on all supported platforms. To mask PII in MIP log files, use the following method.

1. Create a configuration file accessible by the MIP SDK for custom settings called `mip_config.json` and store the file in the following [MipConfiguration](/information-protection/develop/concept-mipcontext?branch=main#creating-mipconfiguration) path.
```cpp
mipConfiguration->GetPath()/mip
```
2. Add a new field to `mip_config.json` to set the `AllowPii` field to false.

```json
{"MipLogger":{"MaxLogFilesSizeMb":40,"MaxLogFileCount":10,"AllowPii":false}}
```
Once configured, sensitive content is masked in all new MIP logs generated by the MIP SDK.

## Configure in MipConfiguration
To mask PII in MIP log files with MipConfiguration, create a new `MipConfiguration` object to pass into `MipContext` with new values for the custom settings.

This method is supported for C++ and C# only. Developers using the C API or Java wrappers are recommended to create a configuration file instead.
```cpp
auto mipConfiguration = make_shared<mip::MipConfiguration>(appInfo, "mip_data", mip::LogLevel::Trace, false);
    auto loggerConfiguration = make_shared<mip::LoggerConfiguration>();
    loggerConfiguration->isPiiAllowed = false;
    mipConfiguration->SetLoggerConfiguration(loggerConfiguration);
    auto mipContext = MipContext::Create(mipConfiguration);
```
```csharp
MipConfiguration mipConfiguration = new MipConfiguration(appInfo, "mip_data", LogLevel.Trace, false);
  mipConfiguration.LoggerConfigurationOverride = new LoggerConfiguration(10, 40, false);
  var mipContext = MIP.CreateMipContext(mipConfiguration);
```
