---
# required metadata

title: How to use document tracking | Azure RMS
description: The document tracking feature requires some simple understandings about managing the associated metadata and registration with the service.
keywords:
author: bruceperlerms
manager: mbaldwin
ms.date: 08/24/2016
ms.topic: article
ms.prod:
ms.service: rights-management
ms.technology: techgroup-identity
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

-   Create a **license metadata** object.

    See [**LicenseMetadata**](/information-protection/sdk/4.2/api/android/com.microsoft.rightsmanagement#msipcthin2_licensemetadata_interface_java) or [**MSLicenseMetadata**](/information-protection/sdk/4.2/api/iOS/mslicensemetadata#msipcthin2_mslicensemetadata_class_objc) for more information.

-   Set the **content name** and **notification type**. These are the only required properties.

    For more information, see the property access methods for the platform appropriate license metadata class, either [**LicenseMetadata**](/information-protection/sdk/4.2/api/android/com.microsoft.rightsmanagement#msipcthin2_licensemetadata_interface_java) or [**MSLicenseMetadata**](/information-protection/sdk/4.2/api/iOS/mslicensemetadata#msipcthin2_mslicensemetadata_class_objc).

-   By policy type; template or ad-hoc:

    -   For template based document tracking, create a **user policy** object passing the license metadata as a parameter.

        For more information, see [**UserPolicy.create**](/information-protection/sdk/4.2/api/android/userpolicy#msipcthin2_userpolicy_class_java) and [**MSUserPolicy.userPolicyWithTemplateDescriptor**](/information-protection/sdk/4.2/api/iOS/msuserpolicy#msipcthin2_msuserpolicy_templatedescriptor_property_objc).

    -   For ad-hoc based document tracking, set the **license metadata** property on the **policy descriptor** object.

        For more information, see [**PolicyDescriptor.getLicenseMetadata**](/information-protection/sdk/4.2/api/android/policydescriptor#msipcthin2_policydescriptor_interface_java), [**PolicyDescriptor.setLicenseMetadata**](/information-protection/sdk/4.2/api/android/policydescriptor#msipcthin2_policydescriptor_setlicensemetadata_java) and [**MSPolicyDescriptor.licenseMetadata**](/information-protection/sdk/4.2/api/iOS/mspolicydescriptor#msipcthin2_mspolicydescriptor_licensemetadata_property_objc).

    **Note**  The license metadata object is only directly accessible during the process of setting up document tracking for the given user policy. Once the user policy object is created, the associated license metadata is not accessible i.e. changing the values of licence metadata has no effect.

     

-   Call the platform registration method for document tracking.

    See [**MSUserPolicy.registerForDocTracking**](/information-protection/sdk/4.2/api/iOS/msuserpolicy#msipcthin2_msuserpolicy_registerfordoctracking_userid_authenticationcallback_completionblock_method_objc) or [**UserPolicy.registerForDocTracking**](/information-protection/sdk/4.2/api/iOS/msuserpolicy#msipcthin2_msuserpolicy_registerfordoctracking_userid_authenticationcallback_completionblock_method_objc).

 

 
