---
# required metadata

title: Understanding certificate chains | Azure RMS
description:
keywords:
author: bruceperlerms
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 14694cb0-adc4-4c2f-aff5-22aa132777df

# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

﻿# Understanding certificate chains

Developing a rights-enabled application requires a public key pair and a certificate chain that leads back to a Microsoft certificate at the root of trust.

## Certificate Types

Every license and certificate used in an Rights Management Services (RMS) environment consists of a chain of certificates that leads back to a Microsoft certification authority (CA) certificate. Microsoft provides two chains into which a license or certificate can be nested, a pre-production certificate chain and a production chain. We recommend that you use the pre-production hierarchy when developing an application so that you can work without signing a *Production License Agreement* with Microsoft. Note that the RMS server must also be configured for pre-production.

You must switch to a production chain before releasing your application. Content protected by a pre-production certificate is less secure than a production certificate.

The public and private keys and the pre-production certificate are included with the SDK in the following files located in the `%MsipcSDKDir%\Bin` folder.

- **ISVTier5AppSigningPrivKey.dat** contains the private key used to sign a manifest for use during application development.
- **ISVTier5AppSigningPubKey.dat** contains the public key signed into the pre-production certificate hierarchy.
- **ISVTier5AppSignSDK_Client.xml** contains the pre-production certificate used to generate a manifest for use during application development.

 

You use the certificate and the private key to create and sign a manifest that identifies the files that can or must be loaded into the process space of your application and those that must not be loaded. The manifest is then loaded by the platform.

Whether or not you have used a pre-production certificate during application development, when you are ready to release the application, you must generate a new key pair, acquire a production certificate from Microsoft and use the new private key and certificate to create and sign an application manifest.

For more information on working with certificate chains and application signing, see [Switching to the production environment](switching-to-the-production-environment.md).

### Related topics

* [Developer concepts](ad-rms-concepts-nav.md)
* [Switching to the production environment](switching-to-the-production-environment.md)
 

 
