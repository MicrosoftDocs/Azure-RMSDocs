---
title: Quickstart - Encrypt/Decrypt text using the C# MIP Protection SDK
description: A quickstart showing you how to use the Microsoft Information Protection SDK .NET Wrapper to encrypt and decrypt ad hoc text using a protection template (C#)
services: information-protection
author: msmbaldwin
ms.service: azure-information-protection
ms.topic: quickstart
ms.date: 04/10/2025
ms.author: mbaldwin
ms.custom: has-adal-ref, mode-api
#Customer intent: As a an application developer, I want to learn how to encrypt text with the MIP SDK, so that I can use the SDK APIs to apply protection to my own data.
---

# Quickstart: Encrypt/Decrypt text using MIP SDK (C#)

This Quickstart shows you how to use more of the MIP Protection SDKs. Using one of the protection templates you listed in the previous Quickstart, you use a Protection handler to Encrypt ad hoc text. The Protection handler class exposes various operations for applying/removing protection.

## Prerequisites

If you haven't already, be sure to complete the following prerequisites before continuing:

- Complete [Quickstart: List protection templates (C#)](quick-protection-list-templates-csharp.md) first, which builds a starter Visual Studio solution, to list the protection templates available to authenticated user. This "Encrypt/Decrypt text" Quickstart builds on the previous one.
- Optionally: Review [Protection handlers in the MIP SDK](concept-handler-protection-cpp.md) concepts.

## Add logic to set and get a protection template

Add logic to encrypt ad-hoc text, using the Protection engine object.

1. Using **Solution Explorer**, open the .cs file in your project that contains the implementation of the Main()` method. It defaults to the same name as the project containing it, which you specified during project creation.

2. Toward the end of the `Main()` body, where you left off in the previous Quickstart, insert the following code:

   ```csharp
   //Set text to encrypt and template ID
   string inputText = "<Sample-text>";
   string templateId = "<template-id>";
   //Create a template based publishing descriptor
   ProtectionDescriptor protectionDescriptor = new ProtectionDescriptor(templateId);

   //Create publishing settings using protection descriptor
   PublishingSettings publishingSettings = new PublishingSettings(protectionDescriptor);

   //Generate Protection Handler for publishing
   var publishingHandler = Task.Run(async() => await protectionEngine.CreateProtectionHandlerForPublishingAsync(publishingSettings)).Result;

   //Encrypt text using Publishing handler
   long bufferSize = publishingHandler.GetProtectedContentLength(inputText.Length, true);
   byte[] inputTextBuffer = Encoding.ASCII.GetBytes(inputText);
   byte[] encryptedTextBuffer = new byte[bufferSize];
   publishingHandler.EncryptBuffer(0, inputTextBuffer, encryptedTextBuffer, true);
   Console.WriteLine("Original text: {0}", inputText);
   Console.WriteLine("Encrypted text: {0}", Encoding.UTF8.GetString(encryptedTextBuffer));

   //Create a Protection handler for consumption using the same publishing licence
   var serializedPublishingLicense = publishingHandler.GetSerializedPublishingLicense();
   PublishingLicenseInfo plInfo = PublishingLicenseInfo.GetPublishingLicenseInfo(serializedPublishingLicense);
   ConsumptionSettings consumptionSettings = new ConsumptionSettings(plInfo);
   var consumptionHandler = protectionEngine.CreateProtectionHandlerForConsumption(consumptionSettings);

   //Use the handler to decrypt the encrypted text
   long buffersize = encryptedTextBuffer.Length;
   byte[] decryptedBuffer = new byte[bufferSize];
   var bytesDecrypted = consumptionHandler.DecryptBuffer(0, encryptedTextBuffer, decryptedBuffer, true);
   byte[] OutputBuffer = new byte[bytesDecrypted];
   for (int i = 0; i < bytesDecrypted; i++){
      OutputBuffer[i] = decryptedBuffer[i];
   }

   Console.WriteLine("Decrypted content: {0}", Encoding.UTF8.GetString(OutputBuffer));
   Console.WriteLine("Press a key to quit.");
   Console.ReadKey();

   ```

3. Toward the end of `Main()` find the application shutdown block created in the first quickstart and add the handler lines:

   ```csharp
   // Application Shutdown
   publishingHandler = null;
   consumptionHandler = null;
   protectionEngine = null;
   protectionProfile = null;
   mipContext = null;
   ```

4. Replace the placeholder values in the source code using the following values:

   | Placeholder | Value |
   |:----------- |:----- |
   | \<sample-text\> | The sample text you would like to encrypt, for example: `My secure text`. |
   | \<template-id\> | A template ID, copied from the console output in the previous Quickstart, for example: `bb7ed207-046a-4caf-9826-647cff56b990`. |

## Build and test the application

Build and test your client application.

1. Use CTRL-SHIFT-B (**Build Solution**) to build your client application. If you have no build errors, use F5 (**Start debugging**) to run your application.

2. If your project builds and runs successfully, the application *may* prompt for authentication via ADAL each time the SDK calls your `AcquireToken()` method. If cached credentials already exist, you won't be prompted to sign in and see the list of labels, followed by the information on the applied label and modified file.

  ```console
   Original content: My secure text
   Encrypted content: c?_hp???Q??+<?
   Decrypted content: My secure text
   Press a key to quit.
   ```
