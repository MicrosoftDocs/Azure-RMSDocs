---
title: Concepts - The core concepts in the MIP SDK - Proxy Support
description: This article will help you understand proxy support in the MIP SDK.
author: tommoser
ms.service: azure-information-protection
ms.topic: conceptual
ms.date: 04/10/2025
ms.author: tommos
---

# Microsoft Information Protection SDK - Proxy Support

## Proxies and the MIP SDK

Today in the MIP SDK, non-transparent proxies are supported only on Windows.

* **Transparent Proxy** refers to any type of proxy that doesn't require a client-side configuration, including explicit or autodiscovered settings.
* **Authenticated Proxy** refers to any type of proxy that requires that the caller is authenticated.
* **Proxy Autodiscovery** refers to proxies or settings that are found via web proxy autodiscovery (WPAD).
* **Explicit Proxy** refers to a proxy that is provided directly to the operating system or application.
  
| Platform        | Transparent Proxy | Authenticated Proxies | Proxy Auto-discovery | Explicit Proxy |
| --------------- | ----------------- | --------------------- | -------------------- | -------------- |
| **Windows**     | Supported         | Not Supported         | Supported            | Supported      |
| **Linux (All)** | Supported         | Not Supported         | Not Supported        | Supported      |
| **macOS**       | Supported         | Not Supported         | Not Supported        | Not Supported  |
| **Android**     | Supported         | Not Supported         | Not Supported        | Not Supported  |
| **iOS**         | Supported         | Not Supported         | Not Supported        | Not Supported  |

## Proxies on Windows

MIP SDK applications running on Windows will use WinHTTP to access the network. The WinHTTP configuration setting is independent of the Windows Internet (WinINet) Internet browsing proxy settings but may use WinINet settings as a fallback when automatic proxy resolution is enabled. WinHTTP can only discover a proxy server by using the following discovery methods:

* Autodiscovery methods:
  * Transparent proxy
  * Web Proxy Autodiscovery Protocol (WPAD)
* Manual static proxy configuration:
  * WinHTTP configured using netsh command

For more on configuring WinHTTP, review the [WinHTTP documentation](/windows/win32/winhttp/winhttp-start-page).

## Proxies on Other Platforms

MIP SDK supports proxies on Windows and Linux. On Windows, both transparent and explicit proxies are supported. Authenticated proxies are not supported.

On Linux, MIP SDK will follow the http_proxy environment variable.

```bash
export http_proxy=http://192.168.1.1:8080
export https_proxy=https://192.168.1.1:8080
```

If proxy support beyond this is required, review the custom [`mip::HttpDelegate`](https://microsoftdocs.github.io/mip-sdk-docs/cpp/classHttpDelegate.html) and workaround section or more details.

## Custom HTTP Delegate

The Microsoft Information Protection SDK supports implementation of a custom HTTP delegate that can override the SDK's default HTTP stack. When there are features not present, or a specific HTTP implementation is required, this delegate can be implemented by adding a new class that inherits [`mip::HttpDelegate`](https://microsoftdocs.github.io/mip-sdk-docs/cpp/classHttpDelegate.html).

This `mip::HttpDelegate`-derived class is set via `mip::FileProfile::Settings`:

```cpp
std::shared_ptr<MyHttpDelegate> httpDelegate = std::make_shared<MyHttpDelegate>();
   
FileProfile::Settings profileSettings(mMipContext,
    mip::CacheStorageType::OnDisk,
    std::make_shared<sample::consent::ConsentDelegateImpl>(),
    std::make_shared<FileProfileObserver>());

profileSettings.SetHttpDelegate(httpDelegate);
```

## Other Workarounds

When a custom HTTP delegate isn't an option, it will be required that you bypass your proxy and allow direct network connectivity for the MIP labeling and protection endpoints, as well as to Microsoft Entra ID. If [audit logging](/azure/information-protection/reports-aip) is desired, the audit logging endpoint is also required.

## Cloud Endpoints

### Commercial

| Endpoint | Hostname |
| --- | --- |
| Protection Service | `https://api.aadrm.com` |
| Policy             | `https://\*.protection.outlook.com`, `https://substrate.office.com` |
| Audit Logging      | `https://\*.events.data.microsoft.com`, `https://\*.aria.microsoft.com` (iOS only) |
| Authentication     | [Review Microsoft Entra documentation](/azure/active-directory/develop/authentication-national-cloud#azure-ad-authentication-endpoints) |

### GCCH

| Endpoint           | Hostname |
| --- | --- |
| Protection Service | `https://api.aadrm.us` |
| Policy             | `https://usg02b.dataservice.protection.office365.us`, `https://substrate.office365.us` |
| Audit Logging      | `https://\*.events.data.microsoft.com`                                                  |
| Authentication     | [Review Microsoft Entra documentation](/azure/active-directory/develop/authentication-national-cloud#azure-ad-authentication-endpoints) |

### DoD

| Endpoint           | Hostname |
| --- | --- |
| Protection Service | `https://api.aadrm.us` |
| Policy             | `https://usg01b.dataservice.protection.office365.us`, `https://substrate-dod.office365.us` |
| Audit Logging      | `https://\*.events.data.microsoft.com` |
| Authentication     | [Review Microsoft Entra documentation](/azure/active-directory/develop/authentication-national-cloud#azure-ad-authentication-endpoints) |
