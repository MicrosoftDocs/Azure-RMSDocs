---
# required metadata

title: Obtaining a production license | Azure RMS
description: Releasing an application developed using the RMS SDK 2.1, reqires a Production License Agreement.
keywords:
author: bruceperlerms
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 6749817E-FF34-4384-BF63-39AEA5C372CA
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---
** This SDK content is not current. For a short time, please find the [current version](https://msdn.microsoft.com/library/windows/desktop/hh535290(v=vs.85).aspx) of the documentation on MSDN. **
# Obtaining a production license

Before you can release an application developed using the Rights Management Services SDK 2.1, you must apply for a Production License Agreement to obtain a production certificate.

> [!IMPORTANT]
> If you will be running your client application with Azure based RMS, you will need to request an Azure RMS Tenant. Send mail to <rmcstbeta@microsoft.com> with your tenant request.

For more information on running with Azure RMS see, [Enable your service application to work with cloud based RMS](how-to-use-file-api-with-aadrm-cloud.md).


The production certificate and the pre-production certificate perform a similar function but are intended for use in different environments. Both contain a certificate chain with a Microsoft certification authority (CA) certificate at the root of trust, but the pre-production certificate is used only when developing an RMS application. The production certificate is used in post-release environments. The production certificate and the associated private key are used to create and sign a manifest that identifies the files that can or must be loaded into the process space of your application and those that must not be loaded.

For more information on keys, see [Testing your rights-enabled application](running-your-first-application.md).

You can obtain the certificate by applying for a Production License Agreement.

## Request a Production License Agreement

-   Send an email message to [RMLA@microsoft.com](mailto:rmla@microsoft.com) and include the following information:

    -   Full company name

    -   Physical corporate address (include the city, state, country or region, and zip or postal code)
    -   Corporate mailing address (include the city, state, country or region, and zip or postal code)
    -   Company phone and fax numbers
    -   Company URL
    -   Country or region of incorporation
    -   Application or product name
    -   First and last name of the requester
    -   Title or position of the requester
    -   Email address of the requester

    Although an email account is not strictly required, the application process typically relies on email for communication. You can get a free email account at Microsoft Outlook.com. If you do not have an account and do not want one, you can send a typewritten application to the following address:

    `Active Directory Rights Management License Agreements (ADRMLA)`

    `Microsoft Corporation`

    `One Microsoft Way`

    `Redmond, WA 98052-6399`

    When requesting an agreement, please do the following;

    -   Submit the information, in English, as it should appear on the agreement.
    -   Send all requested information. Missing or incomplete information can delay processing of your request.

    The Active Directory Rights Management Licensing Agreement (ADRMLA) team will respond to your emailed request within three business days, longer if you sent the request by using a postal service. The response will include the license agreement form and further instructions. Read, sign, and return all pages of the agreement to the ADRMLA team. Please do not change the fonts or reformat the paragraphs of the license agreement.

    Be sure to follow the instructions you receive from the ADRMLA team. The instructions list the items of digital information needed to fulfill your certificate request. By following the step-by-step instructions you will reduce delays.

    The ADRMLA team will forward your production certificate to you after it is created. The certificate is created based on the license agreement and digital information (including a public key) you provide. Please note that it may take up to 15 business days for the ADRMLA team to reply with your certificate by email, longer if communication is by postal service.

## Related topics

* [How-to use](how-to-use-msipc.md)
* [Testing your rights-enabled application](running-your-first-application.md)
 

 



