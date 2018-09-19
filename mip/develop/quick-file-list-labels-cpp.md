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

This Quickstart will show you how to use the MIP File API, to list the sensitivity labels configured for your organization.

## Prerequisites

If you haven't already, be sure to complete the following prerequisites before continuing:

- Complete the [Quickstart: Client application initialization](quick-app-initialization-cpp.md) first, which builds a starter Visual Studio solution. This Quickstart relies on the proper creation of that solution.
- Optionally: Review [Classification labels](concept-classification-labels.md) concepts.

## Add logic to list the configured sensitivity labels

Here you add logic that will list the configured sensitivity labels, using the File engine object. As noted in the code comments, the MIP SDK also triggers a call to your AcquireOAuth2Token() method, when `engineFuture.get()` is called to retrieve the engine object asynchronously.

1. Open the Visual Studio solution you created previously in "Quickstart: Client application initialization". 

2. Using **Solution Explorer**, open the .cpp file in your project that contains the implementation of the `main()` method. It defaults to the same name as the project containing it, which you specified during project creation. 

3. Add the following `using` directive after `using mip::FileEngine;`, near the top of the file:

   ```cpp
   using std::endl;
   ```

4. In the body of `main()`, between the `auto engine = engineFuture.get();` and `return 0;` statements (where you left off in the previous Quickstart), insert the following code:

   ```cpp
   // Get engine object and list sensitivity labels
	 try
	 {
     // Get File engine asynchronously; also triggers AcquireOAuth2Token() call 
		 auto engine = engineFuture.get();  
		
		 // List sensitivity labels
		 auto labels = engine->ListSensitivityLabels(); 
		 for (const auto& label : labels)
		 {
			 cout << label->GetName() << " : " << label->GetId() << endl;

 			for (const auto& child : label->GetChildren())
			 {
				 cout << "->  " << child->GetName() << " : " << child->GetId() << endl;
			 }
		 }
	 }
	 catch (const std::exception& e)
	 {
		 cout << "An exception occurred... is the access token incorrect/expired?\n\n"
			 << e.what() << "'\n";
	 }
   ``` 

## Update the token acquisition logic

1. Generate a test token using the following PowerShell script. The script uses the `Get-ADALToken` cmdlet from the ADAL.PS module you installed earlier, in MIP SDK Setup and configuration. 

  - Copy the script and place it in a PowerShell Script file (.ps1 extension):

   ```powershell
   $authority = 'https://login.windows.net/common/oauth2/authorize'  # Enforced by MIP SDK
   $resourceUrl = 'https://syncservice.o365syncservice.com/'         # Enforced by MIP SDK; matches the URL of the "Microsoft Information Protection Sync Service" resource/API requested by the Azure AD app registration
   $appId = '0edbblll-8773-44de-b87c-b8c6276d41eb'                   # App ID of the Azure AD app registration
   $redirectUri = 'bltest://authorize'                               # Must match the redirect URI of the Azure AD app registration
   $response = Get-ADALToken -Resource $resourceUrl -ClientId $appId -RedirectUri $redirectUri -Authority $authority -PromptBehavior:RefreshSession 
   $response.AccessToken | clip                                      # Copies the access token text to the clipboard
   ```

  - Update `$appId` and `redirectUri` to use the values specified in your Azure AD app registration, then save the file.
  - When you run the script, `Get-ADALToken` triggers an Azure AD authentication prompt. Enter the credentials of a user from the same tenant where your application is registered. After successful sign in, the access token will be placed on the clipboard:

    [![Visual Studio add class](media/quick-file-list-labels-cpp/acquire-token-sign-in.png)](media/quick-file-list-labels-cpp/acquire-token-sign-in.png#lightbox)

2. Immediately after completing step #1 above, use **Solution Explorer** and open "auth_delegate.cpp". Scroll down to the following line of your `AcquireOAuth2Token()` implementation. Replace the `<access-token>` placeholder, with the token placed on the clipboard in the previous step. The token should be a long string, in a format similar to `eyJ0eXAiOi ...`:

   ```cpp
   string accessToken = "<access-token>";
   ``` 

## Build and test the application

Finally, build and test your client application. If your project builds and runs successfully, you should see output similar to the following in the console window: 

```cmd
Non-Business : 87ba5c36-b7cf-4793-bbc2-bd5b3a9f95ca
Public : 87867195-f2b8-4ac2-b0b6-6bb73cb33afc
General : f42aa342-8706-4288-bd11-ebb85995028c
Confidential : 074e257c-5848-4582-9a6f-34a182080e71
Highly Confidential : f5dc2dea-db0f-47cd-8b20-a52e1590fb64

Press any key to continue . . .
```

### Troubleshooting

#### Incorrect sign-in account

If your project builds successfully, but you see an error similar to the following during token acquisition sign-in, you'll need to specify a different account: 

*AADSTS50020: User account 'user@domain.com' from identity provider 'https://sts.windows.net/72f988bf-86f1-41af-91ab-2d7cd011db47/' does not exist in tenant 'Organization name' and cannot access the application '0edbblll-8773-44de-b87c-b8c6276d41eb' in that tenant.*

Rerun the PowerShell script, but be sure to use an account from the same tenant where your Azure AD application registration resides.

#### Bad access token

If your project builds successfully, but you see output similar to the following in the console output, you most likely have an invalid or expired token in your `AcquireOAuth2Token()` method. Go back to [Update the token acquisition logic](#update-the-token-acquisition-logic) and regenerate the access token, update `AcquireOAuth2Token()` again, and rebuild/retest.

```cmd
An exception occurred... is the access token incorrect/expired?

Failed API call: profile_add_engine_async Failed with: [class mip::PolicySyncException] Failed acquiring policy, Request failed with http status code: 401, x-ms-diagnostics: [2000001;reason="OAuth token submitted with the request can not be parsed.";error_category="invalid_token"], correlationId:[35bc0023-3727-4eff-8062-000006d5d672]'

C:\VSProjects\MipDev\Quickstarts\AppInitialization\x64\Debug\AppInitialization.exe (process 29924) exited with code 0.
To automatically close the console when debugging stops, enable Tools->Options->Debugging->Automatically close the console when debugging stops.

Press any key to close this window . . .
```

#### Sensitivity labels aren't configured

If your project builds successfully, but you have no output in the console window, be sure your organization's sensitivity labels are configured correctly. See [MIP SDK setup and configuration](setup-configure-mip.md), under "Define label taxonomy and protection settings" for details. 

## Next Steps

Now that you've learned how to write the initialization code and list sensitivity labels, try the next quickstart:

> [!div class="nextstepaction"]
> [Apply a label](quick-file-apply-label-cpp.md)
