---
title: Concepts - Authentication Scenarios for Microsoft Information Protection (MIP) SDK C# clients
description: Technical details about authentication scenarios for Microsoft Information Protection SDK C# client applications.
author: msmbaldwin
ms.author: mbaldwin
ms.date: 04/10/2025
ms.topic: conceptual
ms.service: information-protection
---

# Quickstart: Public and Confidential Clients (C#)

There are two common scenarios used when building applications with the MIP SDK. In the first scenario,the user directly authenticates against Microsoft Entra ID. In the second, the application authenticates using an app secret or certificate.

## Public Client Applications

These applications are desktop or mobile applications that will prompt the user to authenticate. The user connects directly to the backend MIP services. In this scenario, authentication libraries should be used to ensure the user can sign in to Microsoft Entra ID, meets any multi-factor or conditional access requirements, and obtains an OAuth2 token for the appropriate resource.

For more information, see the [public client auth flow documentation](/azure/active-directory/develop/msal-net-initializing-client-applications#initializing-a-public-client-application-from-configuration-options)

The following is a quick code snip demonstrating public client authentication flow for Microsoft Information Protection SDK client application using Microsoft Authentication Library(MSAL).

```csharp

public string AcquireToken(Identity identity, string authority, string resource, string claims)
{
     var authorityUri = new Uri(authority);
     // 
     authority = String.Format("https://{0}/{1}", authorityUri.Host, "<Tenant-GUID>");

     _app = PublicClientApplicationBuilder.Create("<Application-Id>")
                                          .WithAuthority(authority)
                                          .WithDefaultRedirectUri()
                                          .Build();

     var accounts = (_app.GetAccountsAsync())
                    .GetAwaiter()
                    .GetResult();

     // Append .default to the resource passed in to AcquireToken().     
     string[] scopes = new string[] { resource[resource.Length - 1].Equals('/') ? $"{resource}.default" : $"{resource}/.default" };
     var result = _app.AcquireTokenInteractive(scopes)
                      .WithAccount(accounts.FirstOrDefault())
                      .WithPrompt(Prompt.SelectAccount)
                      .ExecuteAsync()
                      .ConfigureAwait(false)
                      .GetAwaiter()
                      .GetResult();

     return result.AccessToken;
}
```

**Tenant-GUID** is the unique tenant GUID for the Microsoft Entra tenant.
**Application-ID** is the application ID in application registration on Microsoft Entra admin center.

## Confidential Client Applications

These applications are cloud or service-based applications where the user isn't directly connecting to the backend MIP services. The service has a need to label, protect, or decrypt files or other data. In this scenario, the application must store a certificate or application secret. These secrets will be used for authentication to Microsoft Entra ID and use that secret to fetch tokens for the backend MIP services. It may then use the MIP SDK’s delegation features to protect or consume content on behalf of a user.

Integrating the MIP SDK with service-based applications requires use of the client credential grant flow. The Microsoft Authentication Library (MSAL) can be used to implement this in a pattern similar to what we would see in a public client application. This article will briefly cover how to update the MIP SDK `IAuthDelegate` in .NET to perform authentication for service-based applications using this flow. At the time of publication, there's no version of MSAL for C++, however it's possible to implement this flow via [direct REST calls](/azure/active-directory/develop/v2-oauth2-client-creds-grant-flow#get-a-token).

For more information see the [confidential client auth flow documentation](/azure/active-directory/develop/msal-net-initializing-client-applications#initializing-a-confidential-client-application-from-code)

The following is a quick code snip demonstrating confidential client authentication flow for Microsoft Information Protection SDK client application using Microsoft Authentication Library(MSAL). An application can authenticate using either the AD certificate or client secret.

> [!NOTE]
> Pay special attention to this line in the following sample. 
>
> ```csharp
> string[] scopes = new string[] { resource[resource.Length - 1].Equals('/') ? $"{resource}.default" : $"{resource}/.default" };
> ```
> This constructs the MSAL scopes from the resource provided to the `AcquireToken()` method. 

### MSAL Confidential Client Example

```csharp
public string AcquireToken(Identity identity, string authority, string resource, string claim)
{
     AuthenticationResult result;
     var authorityUri = new Uri(authority);
     authority = string.Format("https://{0}/{1}", authorityUri.Host, "<Tenant-GUID>");

     // Certification Based Auth
     if (doCertAuth)
     {
          // Build ConfidentialClientApplication using certificate.
          _app = ConfidentialClientApplicationBuilder.Create("<Application-Id>")
               .WithCertificate(certificate) //Assumption here is Application passes a certificate created using certificate thumbprint
               .WithAuthority(new Uri(authority))
               .Build();
     }

     // Client secret based Auth
     else
     {
          // Build ConfidentialClientApplication using app secret
          _app = ConfidentialClientApplicationBuilder.Create("<Application-Id>")
               .WithClientSecret(clientSecret)
               .WithAuthority(new Uri(authority))
               .Build();
     }

     // Append .default to the resource passed in to AcquireToken().
     string[] scopes = new string[] { resource[resource.Length - 1].Equals('/') ? $"{resource}.default" : $"{resource}/.default" };

     try{
          result = _app.AcquireTokenForClient(scopes).ExecuteAsync().Result;
     }
     catch (MsalServiceException ex) when (ex.Message.Contains("AADSTS70011"))
     {
          // Invalid scope. The scope has to be of the form "https://resourceurl/.default"
          // Mitigation: change the scope to be as expected
          Console.WriteLine("Scope provided is not supported");
          return null;
     }
            return result.AccessToken;
}

```
**Tenant-GUID** is the unique tenant GUID for the Microsoft Entra tenant.
**Application-ID** is the application ID in application registration on Microsoft Entra admin center.
