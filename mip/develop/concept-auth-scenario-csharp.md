---
title: Concepts - Authentication Scenarios for Microsoft Information Protection (MIP) SDK C# clients
description: Technical details about authentication scenarios for Microsoft Information Protection SDK C# client applications.
author: Pathak-Aniket
ms.author: v-anikep
ms.date: 09/02/2020
ms.topic: conceptual
ms.service: information-protection
---

# Quickstart: Client application initialization (C#)

There are two common scenarios used when building applications with the MIP SDK. One scenario sees the user directly authenticating against Azure AD, where as in the other the application authenticates uses a secret service principal key or certificate.

## Public Client Applications

These are generally desktop or mobile applications where the application running on the device will prompt the user to authenticate and the user connects directly to the backend MIP services. In this scenario, auth libraries should be used to ensure that the user is able to sign in to Azure AD, meets any multi-factor or conditional access requirements, and obtains an OAuth2 token for the appropriate resource.

For further information refer to Azure AD [public client auth flow documentation](https://docs.microsoft.com/en-us/azure/active-directory/develop/msal-net-initializing-client-applications#initializing-a-public-client-application-from-configuration-options)

Below is a quick code snip demonstrating public client authentication flow for Microsoft Information Protection SDK client application using Microsoft Authentication Library(MSAL).

```csharp

public string AcquireToken(Identity identity, string authority, string resource, string claims)
{
     var authorityUri = new Uri(authority);
     authority = String.Format("https://{0}/{1}", authorityUri.Host, "<Tenant-GUID>");

     _app = PublicClientApplicationBuilder.Create("<Application-Id>").WithAuthority(authority).WithDefaultRedirectUri().Build();

     var accounts = (_app.GetAccountsAsync()).GetAwaiter().GetResult();

     // Append .default to the resource passed in to AcquireToken().
     string[] scopes = new string[] { resource[resource.Length - 1].Equals('/') ? $"{resource}.default" : $"{resource}/.default" };
     var result = _app.AcquireTokenInteractive(scopes).WithAccount(accounts.FirstOrDefault()).WithPrompt(Prompt.SelectAccount)
                    .ExecuteAsync().ConfigureAwait(false).GetAwaiter().GetResult();

     return result.AccessToken;
}
```

Tenant-GUID represents Tenant GUID for the Azure AD tenant whereas Application-ID is the application ID in application registration on Azure AD portal.

## Confidential Client Applications

These are generally cloud or service-based applications where the user is not directly connecting to the backend MIP services, but the service has a need to label, protect, or unprotect MIP-enabled content. In this scenario, the application must store some certificate or application secret to use for authentication to Azure AD and use that secret to fetch tokens for the backend MIP services. It may then use the MIP SDK’s delegation features to protect or consume content on behalf of the authenticated user.

For further information refer to Azure AD [confidential client auth flow documentation](https://docs.microsoft.com/en-us/azure/active-directory/develop/msal-net-initializing-client-applications#initializing-a-confidential-client-application-from-code)

Below is a quick code snip demonstrating confidential client authentication flow for Microsoft Information Protection SDK client application using Microsoft Authentication Library(MSAL). An application can authenticate using either the AD certificate or client secret.

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

Tenant-GUID represents Tenant GUID for the Azure AD tenant whereas Application-ID is the application ID in application registration on Azure AD portal.
