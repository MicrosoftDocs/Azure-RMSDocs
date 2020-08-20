---
title: Concepts - The core concepts in the MIP SDK - Proxy Support
description: This article will help you understand proxy support in the MIP SDK.
author: tommoser
ms.service: information-protection
ms.topic: conceptual
ms.date: 07/29/2020
ms.author: tommos
---

# Microsoft Information Protection SDK - Proxy Support

## Proxies and the MIP SDK

Today in the MIP SDK, non-transparent proxies are supported only on Windows.

* **Transparent Proxy** refers to any type of proxy that doesn't require a client-side configuration, including explicit or auto-discovered settings.
* **Authenticated Proxy** refers to any type of proxy that requires that the caller is authenticated.
* **Proxy Auto-discovery** refers to proxies or settings that are found via web proxy auto-discovery (WPAD).
* **Explicit Proxy** refers to a proxy that is provided directly to the operating system or application.
  
| Platform        | Transparent Proxy | Authenticated Proxies | Proxy Auto-discovery | Explicit Proxy |
| --------------- | ----------------- | --------------------- | -------------------- | -------------- |
| **Windows**     | Supported         | Not Supported         | Supported            | Supported      |
| **Linux (All)** | Supported         | Not Supported         | Not Supported        | Not Supported  |
| **MacOS**       | Supported         | Not Supported         | Not Supported        | Not Supported  |
| **Android**     | Supported         | Not Supported         | Not Supported        | Not Supported  |
| **iOS**         | Supported         | Not Supported         | Not Supported        | Not Supported  |

## Proxies on Windows

MIP SDK applications running on Windows will use WinHTTP to access the network. The WinHTTP configuration setting is independent of the Windows Internet (WinINet) Internet browsing proxy settings and can only discover a proxy server by using the following discovery methods:

* Auto-discovery methods:
  * Transparent proxy
  * Web Proxy Auto-discovery Protocol (WPAD)
* Manual static proxy configuration:
  * WinHTTP configured using netsh command

For more on configuring WinHTTP, please review the [WinHTTP documentation](/windows/win32/winhttp/winhttp-start-page).

## Proxies on Other Platforms

MIP SDK doesn't support anything but fully transparent proxies of any type on non-Windows platforms. If this functionality is required, please review the custom HTTP delegate and workaround sections for more details.

## Custom HTTP Delegate

The Microsoft Information Protection SDK supports implementation of a custom HTTP delegate that can override the SDK's default HTTP stack. If there are features not present, or a specific HTTP implementation is required, this delegate can be implemented by adding a new class that inherits [`mip::HttpDelegate`](./reference/class_mip_httpdelegate.md).

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

If a custom HTTP delegate isn't an option, it will be required that you bypass your proxy and allow direct network connectivity for the MIP labeling and protection endpoints, as well as to Azure Active Directory. If [audit logging](/azure/information-protection/reports-aip) is desired, the audit logging endpoint is also required.

| Endpoint           | Hostname                                                                                                                                                                |
| ------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Protection Service | https://api.aadrm.com                                                                                                                                                   |
| Policy             | https://\*.protection.outlook.com                                                                                                                                       |
| Audit Logging      | https://\*.events.data.microsoft.com, https://\*.aria.microsoft.com (iOS only)                                                                                          |
| Authentication     | [Please review Azure AD documentation](/azure/active-directory/develop/authentication-national-cloud#azure-ad-authentication-endpoints) |
