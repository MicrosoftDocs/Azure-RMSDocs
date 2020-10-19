---
# required metadata

title: How to use document tracking | Azure RMS
description: The document tracking feature requires some simple understandings about managing the associated metadata and registration with the service.
keywords:
author: msmbaldwin
ms.author: mbaldwin
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
ms.custom: dev

---

# How to: Use document tracking

[!INCLUDE [deprecation notice](../includes/deprecation-warning.md)]

Using the document tracking feature requires some simple understandings about managing the associated metadata and registration with the service.

## Managing document tracking metadata

Each of the operating systems supporting document tracking have similar implementations. These include as set of properties that represent the metadata, a new parameter added to the user policy creation methods and a method for registering the policy to be tracked with the document tracking service.

Operationally, only the **content name** and the **notification type** properties are required for document tracking.

The sequence of steps you will use to setup document tracking for a given piece of content is:

- Create a **license metadata** object then set the **content name** and **notification type**. These are the only required properties.
  - Android - [LicenseMetadata](/previous-versions/windows/desktop/msipcthin2/licensemetadata-interface-java)
  -  iOS - [MSLicenseMetadata](/previous-versions/windows/desktop/msipcthin2/mslicensemetadata-class-objc)

Chose policy type; template or ad-hoc:
- For template based document tracking, create a **user policy** object passing the license metadata as a parameter.
  - Android - [UserPolicy.create](/previous-versions/windows/desktop/msipcthin2/userpolicy-class-java)
  - iOS - [MSUserPolicy.userPolicyWithTemplateDescriptor](/previous-versions/windows/desktop/msipcthin2/msuserpolicy-templatedescriptor-property-objc)

- For ad-hoc based document tracking, set the **license metadata** property on the **policy descriptor** object.
  - Android -  [PolicyDescriptor.setLicenseMetadata](/previous-versions/windows/desktop/msipcthin2/policydescriptor-setlicensemetadata-java)
  - iOS -  [MSPolicyDescriptor.licenseMetadata](/previous-versions/windows/desktop/msipcthin2/mspolicydescriptor-licensemetadata-property-objc).

    **Note**  The license metadata object is only directly accessible during the process of setting up document tracking for the given user policy. Once the user policy object is created, the associated license metadata is not accessible i.e. changing the values of license metadata has no effect.

     

- Finally, call the platform registration method for document tracking
  - Android - [UserPolicy.registerForDocTracking asynchronous](/previous-versions/windows/desktop/msipcthin2/userpolicy-registerfordoctracking-boolean--sting--authenticationcallback--creationcallback--java) or [UserPolicy.registerForDocTracking synchronous](/previous-versions/windows/desktop/msipcthin2/userpolicy-registerfordoctracking-synchronous-method-java)
  - iOS - [MSUserPolicy.registerForDocTracking](/previous-versions/windows/desktop/msipcthin2/msuserpolicy-registerfordoctracking-userid-authenticationcallback-completionblock-method-objc)