---
title: Quickstart - List protection templates available to authenticated user in a Microsoft Purview Information Protection tenant using MIP SDK C# Wrapper
description: A quickstart showing you how to use the Microsoft Information Protection Protection SDK C# wrapper to list the protection templates available to a user (C#)
author: msmbaldwin
ms.service: information-protection
ms.topic: quickstart
ms.date: 04/10/2025
ms.author: mbaldwin
ms.custom: has-adal-ref, mode-api
#Customer intent: As a an application developer, I want to learn how to list protection templates for a user in the MIP SDK, so that I can use the SDK APIs to apply templates later on.
---

# Quickstart: List Templates (C#)

This Quickstart shows you how to use the MIP Protection SDK to list the protection templates available to the user.

## Prerequisites

If you haven't already, be sure to complete the following prerequisites before continuing:

- Complete [Quickstart: Client application initialization - Protection SDK (C#)](quick-protection-app-initialization-csharp.md) first, which builds a starter Visual Studio solution. This "List protection templates" Quickstart relies on the previous one, for proper creation of the starter solution.
- Optionally: Review [RMS Templates](/azure/information-protection/configure-policy-templates) concepts.

## Add logic to list the protection templates

Add logic to list protection templates available to a user, using the Protection engine object.

1. Open the Visual Studio solution you created in the previous "Quickstart - Client application initialization - Protection SDK (C#)" article.

2. Using **Solution Explorer**, open the .cs file in your project that contains the implementation of the `Main()` method. It defaults to the same name as the project containing it, which you specified during project creation.

3. Toward the end of the `Main()` body, above the application shutdown section of the `Main()` function (where you left off in the previous QuickStart), insert the following code:

  ```csharp
  // List protection templates using protectionEngine and display the list

  var templates=protectionEngine.GetTemplates();

  for(int i = 0; i < templates.Count; i++)
  {
      Console.WriteLine("{0}: {1}", i.ToString(), templates[i].Name + " : " + templates[i].Id);
  }

  Console.WriteLine("Press a key to continue...");
  ```

## Build and test the application

Finally, build and test your client application.

1. Use CTRL-SHIFT-B (**Build Solution**) to build your client application. If you have no build errors, use F5 (**Start debugging**) to run your application.

2. If your project builds and runs successfully, the application *may* prompt for authentication via ADAL each time the SDK calls your `AcquireToken()` method. If cached credentials already exist, you won't be prompted to sign in and see the list of labels.

     [![Visual Studio acquire token sign-in](media/quick-file-list-labels-cpp/acquire-token-sign-in.png)](media/quick-file-list-labels-cpp/acquire-token-sign-in.png#lightbox)

   - You may also need to give consent, to allow the application to access the MIP APIs, while running under the sign-in account. This happens when the Microsoft Entra application registration isn't pre-consented (as outlined in "MIP SDK setup and configuration"), or you're signing in with an account from a different tenant (other than the one where your application is registered). Simply click **Accept** to record your consent.

     [![Visual Studio consent](media/quick-file-list-labels-cpp/acquire-token-sign-in-consent.png)](media/quick-file-list-labels-cpp/acquire-token-sign-in-consent.png#lightbox)

3. After authentication, your console output should show the protection templates for the authenticated user, similar to the following example:

  ```console
  0: Confidential \ All Employees : a74f5027-f3e3-4c55-abcd-74c2ee41b607
  1: Highly Confidential \ All Employees : bb7ed207-046a-4caf-9826-647cff56b990
  2: Confidential : 174bc02a-6e22-4cf2-9309-cb3d47142b05
  3: Contoso Employees Only : 667466bf-a01b-4b0a-8bbf-a79a3d96f720
  Press a key to continue.
  ```

   > [!NOTE]
   > Copy and save the ID of one or more of the protection templates (for example, `bb7ed207-046a-4caf-9826-647cff56b990`), as you will use it in the next Quickstart.

## Troubleshooting

### Problems during execution of C# application

| Summary | Error message | Solution |
|---------|---------------|----------|
| Bad access token | *An exception occurred... is the access token incorrect/expired?<br><br>Failed API call: profile_add_engine_async Failed with: [class mip::PolicySyncException] Failed acquiring policy, Request failed with http status code: 401, x-ms-diagnostics: [2000001;reason="OAuth token submitted with the request cannot be parsed.";error_category="invalid_token"], correlationId:[35bc0023-3727-4eff-8062-000006d5d672]'<br><br>C:\VSProjects\MipDev\Quickstarts\AppInitialization\x64\Debug\AppInitialization.exe (process 29924) exited with code 0.<br><br>Press any key to close this window . . .* | If your project builds successfully, but you see output similar to the left, you likely have an invalid or expired token in your `AcquireOAuth2Token()` method. Go back to [Build and test the application](#build-and-test-the-application) and regenerate the access token, update `AcquireOAuth2Token()` again, and rebuild/retest. You can also examine and verify the token and its claims, using the [jwt.ms](https://jwt.ms/) single-page web application. |

## Next Steps

Now that you've learned how to list the protection templates available for authenticated user, try the next quickstart:

> [!div class="nextstepaction"]
> [Quickstart - Encrypt and Decrypt text](quick-protection-encrypt-decrypt-text-csharp.md)
