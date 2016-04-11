---
# required metadata

title: How to&#58; Use document tracking | Azure RMS
description: The document tracking feature requires some simple understandings about managing the associated metadata and registration with the service.
keywords:
author: bruceperlerms
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: d193afec-6dc5-477d-8e67-f820a97480ff

# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

﻿
# How to: Use document tracking

Using the document tracking feature requires some simple understandings about managing the associated metadata and registration with the service.

## Managing document tracking metadata

Each of the operating systems supporting document tracking have similar implementations. These include as set of properties that represent the metadata, a new parameter added to the user policy creation methods and a method for registering the policy to be tracked with the document tracking service.

Operationally, only the **content name** and the **notification type** properties are required for document tracking.

The sequence of steps you will use to setup document tracking for a given piece of content is:

-   Create a **license metadata** object.

    See [**LicenseMetadata**](xref:msipcthin2.licensemetadata_interface_java) or [**MSLicenseMetadata**](xref:msipcthin2.mslicensemetadata_class_objc) for more information.

-   Set the **content name** and **notification type**. These are the only required properties.

    For more information, see the property access methods for the platform appropriate license metadata class, either [**LicenseMetadata**](xref:msipcthin2.licensemetadata_interface_java) or [**MSLicenseMetadata**](xref:msipcthin2.mslicensemetadata_class_objc).

-   By policy type; template or ad-hoc:

    -   For template based document tracking, create a **user policy** object passing the license metadata as a parameter.

        For more information, see [**UserPolicy.create**](xref:msipcthin2.userpolicy_create_TemplateDescriptor_method_java) and [**MSUserPolicy.userPolicyWithTemplateDescriptor**](xref:msipcthin2.msuserpolicy_protectionpolicywithtemplatedescriptor_userid_authenticationcallback_options_completionblock_method_objc).

    -   For ad-hoc based document tracking, set the **license metadata** property on the **policy descriptor** object.

        For more information, see [**PolicyDescriptor.getLicenseMetadata**](xref:msipcthin2.policydescriptor_getlicensemetadata_java), [**PolicyDescriptor.setLicenseMetadata**](xref:msipcthin2.policydescriptor_setlicensemetadata_java) and [**MSPolicyDescriptor.licenseMetadata**](xref:msipcthin2.mspolicydescriptor_licensemetadata_property_objc).

    **Note**  The license metadata object is only directly accessible during the process of setting up document tracking for the given user policy. Once the user policy object is created, the associated license metadata is not accessible i.e. changing the values of licence metadata has no effect.

     

-   Call the platform registration method for document tracking.

    See [**MSUserPolicy.registerForDocTracking**](xref:msipcthin2.msuserpolicy_registerfordoctracking_userid_authenticationcallback_completionblock_method_objc) or [**UserPolicy.registerForDocTracking**](xref:msipcthin2.userpolicy_registerfordoctracking_boolean__sting__authenticationcallback__creationcallback__java).

 

 



