---
# required metadata

title: ADAL authentication for your RMS enabled mobile application | Azure RMS
description: Outlines the process for authentication with ADAL
keywords: authentication, RMS, ADAL
author: bruceperlerms
manager: mbaldwin
ms.date: 06/13/2016
ms.topic: article
ms.prod: azure
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

# How-to: use ADAL authentication

Authentication with Azure RMS for your app using Azure Active Directory Authentication Library (ADAL).


Using this approach requires your application to manage its own OAuth authentication. With this approach, the RMS client will exercise an application defined callback when authentication is necessary. 

  > [!Note] This form of authentication does not imply the ability to change users; the RMS client always uses the default user for a given RMS tenant.

## Code sample
Here's and example of the mobile client code to enale Azure ADAL. For more information, see the full sample at [MSIPCSampleApp](https://github.com/AzureAD/rms-sdk-ui-for-android/tree/master/samples/MsipcSampleApp)

Use this code as an example of how to manage your own authentication tokens.

   /**
   * The Class implements MSIPC AuthenticationRequestCallback using ADAL.
   */
   class MsipcAuthenticationCallback implements AuthenticationRequestCallback
   {
     public static final String TAG = "RmsAuthenticationCallback";
     private String mClientId;
     private Activity mParentActivity;;
     private PromptBehavior mPromptBehavior = PromptBehavior.Auto;
     private String mRedirectURI;
	
     /**
     * Instantiates a new rms authentication callback.
     * 
     * @param parentActivity the parent activity
     * @throws NoSuchAlgorithmException the no such algorithm exception
     * @throws InvalidKeySpecException the invalid key spec exception
     * @throws UnsupportedEncodingException the unsupported encoding exception
     */
     
     public MsipcAuthenticationCallback(Activity parentActivity) throws NoSuchAlgorithmException,           InvalidKeySpecException,
       UnsupportedEncodingException
     {
       mParentActivity = parentActivity;
       setADALKeyStore();
	
       //Note: Following values of are client_id and redirect_uri are for demo purpose only.
       mClientId = "com.microsoft.rightsmanagement.sampleapp";
       mRedirectURI = mClientId + "://authorize";
     }
   }

## Related topics

*
