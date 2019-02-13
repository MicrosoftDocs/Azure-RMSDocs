---
# required metadata

title: How to use document tracking | Azure RMS
description: The document tracking feature requires some simple understandings about managing the associated metadata and registration with the service.
keywords:
author: bryanla
ms.author: bryanla
manager: barbkess
ms.date: 02/23/2017
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 70E10936-7953-49B0-B0DC-A5E7C4772E60
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# How to: Use document tracking

Using the document tracking feature requires some simple understandings about managing the associated metadata and registration with the service.

## Managing document tracking metadata

Each of the operating systems supporting document tracking have similar implementations. These include as set of properties that represent the metadata, a new parameter added to the user policy creation methods and a method for registering the policy to be tracked with the document tracking service.

Operationally, only the **content name** and the **notification type** properties are required for document tracking.

The sequence of steps you will use to setup document tracking for a given piece of content is:

- Create a **license metadata** object then set the **content name** and **notification type**. These are the only required properties.
  - Android - [LicenseMetadata](https://msdn.microsoft.com/library/mt573675.aspx)
  -  iOS - [MSLicenseMetadata](https://msdn.microsoft.com/library/mt573683.aspx)

Chose policy type; template or ad-hoc:
- For template based document tracking, create a **user policy** object passing the license metadata as a parameter.
  - Android - [UserPolicy.create](https://msdn.microsoft.com/library/dn790887.aspx)
  - iOS - [MSUserPolicy.userPolicyWithTemplateDescriptor](https://msdn.microsoft.com/library/dn790808.aspx)

- For ad-hoc based document tracking, set the **license metadata** property on the **policy descriptor** object.
  - Android -  [PolicyDescriptor.setLicenseMetadata](https://msdn.microsoft.com/library/mt573698.aspx)
  - iOS -  [MSPolicyDescriptor.licenseMetadata](https://msdn.microsoft.com/library/mt573693.aspx).

    **Note**  The license metadata object is only directly accessible during the process of setting up document tracking for the given user policy. Once the user policy object is created, the associated license metadata is not accessible i.e. changing the values of license metadata has no effect.

     

- Finally, call the platform registration method for document tracking
  - Android - [UserPolicy.registerForDocTracking asynchronous](https://msdn.microsoft.com/library/mt573699.aspx) or [UserPolicy.registerForDocTracking synchronous](https://msdn.microsoft.com/library/mt631387.aspx)
  - iOS - [MSUserPolicy.registerForDocTracking](https://msdn.microsoft.com/library/mt573694.aspx)
