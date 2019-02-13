---
# required metadata

title: ADAL authentication for your RMS enabled application | Azure RMS
description: Outlines the process for authentication with ADAL
keywords: authentication, RMS, ADAL
author: bryanla
ms.author: bryanla
manager: barbkess
ms.date: 02/23/2017
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: f89f59b7-33d1-4ab3-bb64-1e9bda269935

# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# How-to: use ADAL authentication

Authentication with Azure RMS for your app using Azure Active Directory Authentication Library (ADAL).

By updating your application to use ADAL authentication rather than the Microsoft Online Sign-in Assistant, you and your customers will be able to:

- Utilize multi-factor authentication
- Install the RMS 2.1 client without requiring administrative privileges to the machine
- Certify your application for Windows 10

## Two approaches to authentication

This topic contains two approaches to authentication with corresponding code examples.

- **Internal authentication** - OAuth authentication managed by the RMS SDK.

  Use this approach if you want the RMS client to display an ADAL authentication prompt when authentication is necessary. For details on how to configure your application, see the section, "Internal authentication".

  > [!Note]
  > If your application currently uses AD RMS SDK 2.1 with the sign-in assistant, we recommend that you use the internal authentication method as your application migration path.

- **External authentication** - OAuth authentication managed by your application.

  Use this approach if you want your application to manage its own OAuth authentication. With this approach, the RMS client will exercise an application defined callback when authentication is necessary. For a detailed example, see "External authentication" at the end of this topic.

  > [!Note]
  > External authentication does not imply the ability to change users; the RMS client always uses the default user for a given RMS tenant.

## Internal authentication

1. Follow the Azure configuration steps in [Configure Azure RMS for ADAL authentication](adal-auth.md) then return to the following app initialization step.
2. You are now ready to configure your application to use the internal ADAL authentication provided by the RMS SDK 2.1.

To configure you RMS client, add a call to [IpcSetGlobalProperty](https://msdn.microsoft.com/library/hh535270.aspx) right after calling [IpcInitialize](https://msdn.microsoft.com/library/jj127295.aspx) to configure the RMS client. Use the following code snippet as an example.

      C++
      IpcInitialize();

      IPC_AAD_APPLICATION_ID applicationId = { 0 };
      applicationId.cbSize = sizeof(IPC_AAD_APPLICATION_ID);
      applicationId.wszClientId = L"GUID-provided-by-AAD-for-your-app-(no-brackets)";
      applicationId.wszRedirectUri = L"RedirectionUriWeProvidedAADForOurApp://authorize";
      HRESULT hr = IpcSetGlobalProperty(IPC_EI_APPLICATION_ID, &applicationId);
      if (FAILED(hr)) {
        //Handle the error
      }

## External Authentication

Use this code as an example of how to manage your own authentication tokens.
      C++
      extern HRESULT GetADALToken(LPVOID pContext, const IPC_NAME_VALUE_LIST& Parameters, __out wstring wstrToken) throw();

      HRESULT GetLicenseKey(PCIPC_BUFFER pvLicense, __in LPVOID pContextForAdal, __out IPC_KEY_HANDLE &hKey)
      {
          IPC_OAUTH2_CALLBACK pfGetADALToken =
          [](LPVOID pvContext, PIPC_NAME_VALUE_LIST pParameters, IPC_AUTH_TOKEN_HANDLE* phAuthToken) -> HRESULT
          {
              wstring wstrToken;
              HRESULT hr = GetADALToken(pvContext, *pParameters, wstrToken);
              return SUCCEEDED(hr) ? IpcCreateOAuth2Token(wstrToken.c_str(), OUT phAuthToken) : hr;
          };

          IPC_OAUTH2_CALLBACK_INFO callbackCredentialContext =
          {
              sizeof(IPC_OAUTH2_CALLBACK_INFO),
              pfGetADALToken,
              pContextForAdal
          };

          IPC_CREDENTIAL credentialContext =
          {
              IPC_CREDENTIAL_TYPE_OAUTH2,
              NULL
          };
          credentialContext.pcOAuth2 = &callbackCredentialContext;

          IPC_PROMPT_CTX promptContext =
          {
              sizeof(IPC_PROMPT_CTX),
              NULL,
              IPC_PROMPT_FLAG_SILENT | IPC_PROMPT_FLAG_HAS_USER_CONSENT,
              NULL,
              &credentialContext
          };

          hKey = 0L;
          return IpcGetKey(pvLicense, 0, &promptContext, NULL, &hKey);
      }

## Related topics

- [Data types](https://msdn.microsoft.com/library/hh535288.aspx)
- [Environment properties](https://msdn.microsoft.com/library/hh535247.aspx)
- [IpcCreateOAuth2Token](https://msdn.microsoft.com/library/mt661866.aspx)
- [IpcGetKey](https://msdn.microsoft.com/library/hh535263.aspx)
- [IpcInitialize](https://msdn.microsoft.com/library/jj127295.aspx)
- [IPC_CREDENTIAL](https://msdn.microsoft.com/library/hh535275.aspx)
- [IPC_NAME_VALUE_LIST](https://msdn.microsoft.com/library/hh535277.aspx)
- [IPC_OAUTH2_CALLBACK_INFO](https://msdn.microsoft.com/library/mt661868.aspx)
- [IPC_PROMPT_CTX](https://msdn.microsoft.com/library/hh535278.aspx)
- [IPC_AAD_APPLICATION_ID](https://msdn.microsoft.com/library/mt661867.aspx)
