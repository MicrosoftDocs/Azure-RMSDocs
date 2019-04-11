---
title: class mip::ConsentDelegate 
description: Documents the mip::consentdelegate class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: msmbaldwin
ms.date: 04/11/2019
---

# class mip::ConsentDelegate 
Delegate for consent related operations.
This delegate is implemented by a client application to know when a consent request notification should be displayed to the user.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Consent GetUserConsent(const std::string& url)  |  Called when SDK requires user consent to connect to a service endpoint.
  
## Members
  
### GetUserConsent function
Called when SDK requires user consent to connect to a service endpoint.

Parameters:  
* **url**: The URL for which the SDK requires user consent



  
**Returns**: A Consent enum with the user's decision.
When the SDK requests user consent with this method, the client application should present the URL to the user. Client applications should provide some means of obtaining user consent and return the appropriate Consent enum that corresponds to the user's decision.