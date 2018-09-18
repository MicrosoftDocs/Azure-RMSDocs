---
title: Quickstart - List sensitivity labels in a Microsoft Information Protection (MIP) tenant using C++ MIP SDK
description: A quickstart showing you how to use the Microsoft Information Protection C++ SDK to list the sensitivity labels in your tenant.
services: information-protection
author: BryanLa
ms.service: information-protection
ms.topic: quickstart
ms.date: 09/27/2018
ms.author: bryanla
---

# Quickstart: List sensitivity labels (C++)

This Quickstart will show you how to use the MIP File API, to list the sensitivity labels that have been configured in your Office 365 tenant.

## Prerequisites

If you haven't already, be sure to complete the following prerequisites before continuing:

- Complete the [Quickstart: Client application initialization](quick-app-initialization-cpp.md) first, which builds a starter Visual Studio solution. This Quickstart relies on the proper creation of that solution.
- Optionally: Review [Classification labels](concept-classification-labels.md) concepts.

============== WIP BELOW THIS LINE ===============

## Add File engine logic to list the configured sensitivity labels

1. Open the Visual Studio solution you created previously in "Quickstart: Client application initialization". 

2. Using **Solution Explorer**, open "auth_delegate.cpp", and scroll to the the following line of your `AcquireOAuth2Token()` implementation. Replace the `<access-token>` placeholder, with the token placed on the clipboard in the previous step:

   ```cpp
   string accessToken = "<access-token>";
   ``` 

## Update the token acquisition logic

1. Generate a test token using the following PowerShell script. The script uses the `Get-ADALToken` cmdlet you installed earlier,in MIP SDK Setup and configuration. 

  - Update `$appId` and `redirectUri`, using the values you used in your Azure AD app registration. 
  - When you run the script, it triggers an Azure AD authentication prompt. Enter the credentials of a user from the same tenant where your application is registered:

   ```powershell
   $authority = 'https://login.windows.net/common/oauth2/authorize'  # Enforced by MIP SDK
   $resourceUrl = 'https://syncservice.o365syncservice.com/'         # Enforced by MIP SDK; matches the URL of the "Microsoft Information Protection Sync Service" resource/API requested by the Azure AD app registration
   $appId = '0edbblll-8773-44de-b87c-b8c6276d41eb'                   # App ID of the Azure AD app registration
   $redirectUri = 'bltest://authorize'                               # Must match the redirect URI of the Azure AD app registration
   $response = Get-ADALToken -Resource $resourceUrl -ClientId $appId -RedirectUri $redirectUri -Authority $authority -PromptBehavior:RefreshSession 
   $response.AccessToken | clip                                      # Copies the access token text to the clipboard
   ```

2. Using **Solution Explorer**, open "auth_delegate.cpp", and scroll to the the following line of your `AcquireOAuth2Token()` implementation. Replace the `<access-token>` placeholder, with the token placed on the clipboard in the previous step:

   ```cpp
   string accessToken = "<access-token>";
   ``` 

## Build and test the application

Finally, build and test your client application. If your code builds and runs successfully, you should see output similar to the following in the console window. 

```cmd
Non-Business : 87ba5c36-b7cf-4793-bbc2-bd5b3a9f95ca
Public : 87867195-f2b8-4ac2-b0b6-6bb73cb33afc
General : f42aa342-8706-4288-bd11-ebb85995028c
Confidential : 074e257c-5848-4582-9a6f-34a182080e71
Highly Confidential : f5dc2dea-db0f-47cd-8b20-a52e1590fb64

Press any key to continue . . .
```

## Next Steps

Now that you've learned how to write the initialization code and list sensitivity labels, try the next quickstart:

> [!div class="nextstepaction"]
> [Apply a label](quick-file-apply-label-cpp.md)
