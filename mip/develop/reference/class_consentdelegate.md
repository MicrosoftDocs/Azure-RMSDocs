---
title: class ConsentDelegate 
description: Reference for class ConsentDelegate 
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.date: 09/27/2018
ms.author: bryanla
---
# class ConsentDelegate 
Delegate for consent related operations.
This delegate is implemented by a client application to know when a consent request notification should be displayed to the user.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public Consent GetUserConsent(const std::string& url)  |  Called when SDK requires user consent to connect to a service endpoint.
  
## Members
  
### Consent
Called when SDK requires user consent to connect to a service endpoint.

Parameters:  
* **url**: The URL for which the SDK requires user consent



  
**Returns**: A Consent enum with the user's decision.
When the SDK requests user consent with this method, the client application should present the URL to the user. Client applications should provide some means of obtaining user consent and return the appropriate Consent enum that corresponds to the user's decision.