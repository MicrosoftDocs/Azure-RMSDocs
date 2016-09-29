---
# required metadata

title: Use Azure Portal to configure for RMS authentication | Azure RMS
description: Outlines the process for authentication with ADAL
keywords: authentication, RMS, ADAL
author: bruceperlerms
manager: mbaldwin
ms.date: 09/25/2016
ms.topic: article
ms.prod:
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 2680b399-febb-4bd6-b844-ac3d1e69aca4

# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# How to: Use Azure Portal to configure for RMS authentication

Authentication with Azure RMS for your app using Azure Active Directory Authentication Library (ADAL).

Using this approach requires your application to manage its own OAuth authentication. With this approach, the RMS client will exercise an application defined callback when authentication is necessary.

## Configure via Azure portal
Begin by following this guide for configuring through the Azure portal, [Configure Azure RMS for ADAL authentication](adal-auth.md). Be sure to copy and save the *Client ID* and *Redirection URI* from this process for use later.

## Code sample
Here's a code snip from the larger sample for mobile client code to enale Azure ADAL. For more information, see the full sample at [MSIPCSampleApp](https://github.com/AzureAD/rms-sdk-ui-for-android/tree/master/samples/MsipcSampleApp)

       /**
       * Instantiates a new rms authentication callback.
       *
       * @param parentActivity the parent activity
       * @throws NoSuchAlgorithmException the no such algorithm exception
       * @throws InvalidKeySpecException the invalid key spec exception
       * @throws UnsupportedEncodingException the unsupported encoding exception
       */

       public MsipcAuthenticationCallback(Activity parentActivity) throws NoSuchAlgorithmException, InvalidKeySpecException, UnsupportedEncodingException
       {
         mParentActivity = parentActivity;
         setADALKeyStore();

         /**
         * Note: Following values of are client_id and redirect_uri are for demo purpose only.
         * Your values will come from the preceeding Azure Portal process.
         */
         mClientId = "com.microsoft.rightsmanagement.sampleapp";
         mRedirectURI = mClientId + "://authorize";
       }


## Related topics

- [MSIPCSampleApp](https://github.com/AzureAD/rms-sdk-ui-for-android/tree/master/samples/MsipcSampleApp)
- [Configure Azure RMS for ADAL authentication](adal-auth.md)
