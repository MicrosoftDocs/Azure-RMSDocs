---
title: Quickstart - List protection templates available to an authenticated user in a Microsoft Purview Information Protection tenant using C++ MIP SDK
description: A quickstart showing you how to use the Microsoft Information Protection C++ Protection SDK to list the protection templates available to a user (C++)
author: msmbaldwin
ms.service: information-protection
ms.topic: quickstart
ms.date: 04/10/2025
ms.author: mbaldwin
ms.custom: has-adal-ref, mode-api
#Customer intent: As a an application developer, I want to learn how to list protection templates for a user in the MIP SDK, so that I can use the SDK APIs to apply templates later on.
---

# Quickstart: List Protection Templates (C++)

This Quickstart shows you how to use the MIP Protection SDK, to protection templates available to the user.

## Prerequisites

If you haven't already, be sure to complete the following prerequisites before continuing:

- Complete [Quickstart - Client application initialization - Protection SDK (C++)](quick-protection-app-initialization-cpp.md) first, which builds a starter Visual Studio solution. This "List protection templates" Quickstart relies on the previous one, for proper creation of the starter solution.
- Optionally: Review [RMS Templates](/azure/information-protection/configure-policy-templates) concepts.

## Add logic to list the protection templates

Add logic to list protection templates available to a user, using the Protection engine object.

1. Open the Visual Studio solution you created in the previous "Quickstart - Client application initialization - Protection SDK (C++)" article.

2. Using **Solution Explorer**, open the .cpp file in your project that contains the implementation of the `main()` method. It defaults to the same name as the project containing it, which you specified during project creation.

3. Add the following `using` directive after `using mip::ProtectionEngine;`, near the top of the file:

   ```cpp
   using std::endl;
   ```

4. Toward the end of the `main()` body, below the closing brace `}` of the last `catch` block and above `return 0;` (where you left off in the previous Quickstart), insert the following code:

   ```cpp
    // List protection templates
    const shared_ptr<ProtectionEngineObserver> engineObserver = std::make_shared<ProtectionEngineObserver>();
    // Create a context to pass to 'ProtectionEngine::GetTemplateListAsync'. That context will be forwarded to the
    // corresponding ProtectionEngine::Observer methods. In this case, we use promises/futures as a simple way to detect
    // the async operation completes synchronously.
    auto loadPromise = std::make_shared<std::promise<vector<shared_ptr<mip::TemplateDescriptor>>>>();
    std::future<vector<shared_ptr<mip::TemplateDescriptor>>> loadFuture = loadPromise->get_future();
    engine->GetTemplatesAsync(engineObserver, loadPromise);
    auto templates = loadFuture.get();

    cout << "*** Template List: " << endl;

    for (const auto& protectionTemplate : templates) {
        cout << "Name: " << protectionTemplate->GetName() << " : " << protectionTemplate->GetId() << endl;
    }

   ```

## Create a PowerShell script to generate access tokens

Use the following PowerShell script to generate access tokens, which are requested by the SDK in your `AuthDelegateImpl::AcquireOAuth2Token` implementation. The script uses the `Get-ADALToken` cmdlet from the ADAL.PS module you installed earlier, in "MIP SDK Setup and configuration".

1. Create a PowerShell Script file (.ps1 extension), and copy/paste the following script into the file:

   - `$authority` and `$resourceUrl` are updated later, in the following section.
   - Update `$appId` and `$redirectUri`, to match the values you specified in your Microsoft Entra app registration.

   ```powershell
   $authority = '<authority-url>'                   # Specified when SDK calls AcquireOAuth2Token()
   $resourceUrl = '<resource-url>'                  # Specified when SDK calls AcquireOAuth2Token()
   $appId = '<app-ID>'                              # App ID of the Azure AD app registration
   $redirectUri = '<redirect-uri>'                  # Redirect URI of the Azure AD app registration
   $response = Get-ADALToken -Resource $resourceUrl -ClientId $appId -RedirectUri $redirectUri -Authority $authority -PromptBehavior:RefreshSession
   $response.AccessToken | clip                     # Copy the access token text to the clipboard
   ```

2. Save the script file so you can run it later, when requested by your client application.

## Build and test the application

Finally, build and test your client application.

1. Use Ctrl+Shift+b (**Build Solution**) to build your client application. If you have no build errors, use F5 (**Start debugging**) to run your application.

2. If your project builds and runs successfully, the application prompts for an access token, each time the SDK calls your `AcquireOAuth2Token()` method. You can reuse a previously generated token, if prompted multiple times and the requested values are the same:

3. To generate an access token for the prompt, go back to your PowerShell script and:

   - Update the `$authority` and `$resourceUrl` variables. They must match the values that are specified in the console output in step #2.
   - Run the PowerShell script. The `Get-ADALToken` cmdlet triggers a Microsoft Entra authentication prompt, similar to the example below. Specify the same account provided in the console output in step #2. After successful sign-in, the access token will be placed on the clipboard.

     [![Visual Studio acquire token sign-in](media/quick-file-list-labels-cpp/acquire-token-sign-in.png)](media/quick-file-list-labels-cpp/acquire-token-sign-in.png#lightbox)

   - You may also need to give consent, to allow the application to access the MIP APIs, while running under the sign-in account. This happens when the Microsoft Entra application registration isn't pre-consented (as outlined in "MIP SDK setup and configuration"), or you're signing in with an account from a different tenant (other than the one where your application is registered). Simply click **Accept** to record your consent.

     [![Visual Studio consent](media/quick-file-list-labels-cpp/acquire-token-sign-in-consent.png)](media/quick-file-list-labels-cpp/acquire-token-sign-in-consent.png#lightbox)

4. After pasting the access token into the prompt from step #2, your console output should show the protection templates , similar to the following example:

   ```console
   *** Template List:
   Name: Confidential \ All Employees : a74f5027-f3e3-4c55-abcd-74c2ee41b607
   Name: Highly Confidential \ All Employees : bb7ed207-046a-4caf-9826-647cff56b990
   Name: Confidential : 174bc02a-6e22-4cf2-9309-cb3d47142b05
   Name: Contoso Employees Only : 667466bf-a01b-4b0a-8bbf-a79a3d96f720

   C:\MIP Sample Apps\ProtectionQS\Debug\ProtectionQS.exe (process 8252) exited with code 0.
   To automatically close the console when debugging stops, enable Tools->Options->Debugging->Automatically close the console when debugging stops.

   Press any key to continue . . .
   ```

   > [!NOTE]
   > Copy and save the ID of one or more of the protection templates (for example, `f42a3342-8706-4288-bd31-ebb85995028z`), as you will use it in the next Quickstart.

## Troubleshooting
### Problems during execution of C++ application

| Summary | Error message | Solution |
|---------|---------------|----------|
| Bad access token | *An exception occurred... is the access token incorrect/expired?<br><br>Failed API call: profile_add_engine_async Failed with: [class mip::PolicySyncException] Failed acquiring policy, Request failed with http status code: 401, x-ms-diagnostics: [2000001;reason="OAuth token submitted with the request cannot be parsed.";error_category="invalid_token"], correlationId:[35bc0023-3727-4eff-8062-000006d5d672]'<br><br>C:\VSProjects\MipDev\Quickstarts\AppInitialization\x64\Debug\AppInitialization.exe (process 29924) exited with code 0.<br><br>Press any key to close this window . . .* | If your project builds successfully, but you see output similar to the left, you likely have an invalid or expired token in your `AcquireOAuth2Token()` method. Go back to [Create a PowerShell script to generate access tokens](#create-a-powershell-script-to-generate-access-tokens) and regenerate the access token, update `AcquireOAuth2Token()` again, and rebuild/retest. You can also examine and verify the token and its claims, using the [jwt.ms](https://jwt.ms/) single-page web application. |

## Next Steps

Now that you've learned how to list the protection templates available to an authenticated user, try the next quickstart:

> [!div class="nextstepaction"]
> [Encrypt and Decrypt text](quick-protection-encrypt-decrypt text-cpp.md)
