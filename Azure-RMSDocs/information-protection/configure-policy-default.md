---
# required metadata

title: The default Azure Information Protection policy | Azure Rights Management
description:
author: cabailey
manager: mbaldwin
ms.date: 07/21/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 671281c8-f0d1-42b6-aae3-681d1821e2cf

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# The default Azure Information Protection policy

>*Applies to: Azure Information Protection preview*

**[ This information is preliminary and subject to change. During the preview, blank articles might be published as placeholders. ]**

Use the following information to understand how the default policy for Azure Information Protection is configured. If you modify the default policy, you can reference these values to return your policy to the defaults.

## Information Protection bar

Title: **Sensitivity**

Tooltip: **Information Sensitivity consists of four distinct levels (Public, Internal, Confidential, Secret), allowing the user to identify the risk of exposing the information to unauthorized users inside or outside the business.**


## Labels

There are 5 default labels that have the following settings:

### **Personal**

Tooltip: **For personal use only. This data will not be monitored by the organization. Personal information must not include any business-related data.**

Color: Light green

Visual markings: None

Conditions: None

Protection: No

----


### **Public**

Tooltip: **This information is internal and can be used by everyone inside or outside the business.**

Color: Green

Visual markings: None

Conditions: None

Protection: No

----

### **Internal**

Tooltip: **This information includes a wide spectrum of internal business data that can be used by all employees and can be shared with authorized customers and business partners. Examples for internal information are company policies and most internal communications.**

Color: Blue

Visual markings: Footer (document and email)

Conditions: None

Protection: No

----

### **Confidential**

Tooltip: **This data includes sensitive business information. Exposing this data to unauthorized users may cause damage to the organization. Examples for Confidential information are employee information, individual customer projects or contracts, and sales account data.**

Color: Orange

Visual markings: Footer (document and email)

Conditions: None

Protection: No

----

### **Secret**

Tooltip: **This data includes highly sensitive information for the business that must be protected. Exposing Secret data to unauthorized users may cause serious damage to the organization. Examples for Secret information are personal identification information, customer records, source code, and pre-announced financial reports.**

Color: Red

Visual markings: Footer (document and email)

Conditions: None

Protection: No

----


## Sub-labels

There are 2 default sub-labels that have the following settings:

### Secret > **All Company**

Tooltip: **This data includes sensitive business information - permitted for all company employees.**

Visual markings: None

Conditions: None

Protection: No

----

### Secret > **My Group**

Tooltip: **This data includes sensitive business information - permitted for employee groups only.**

Visual markings: None

Conditions: None

Protection: No

## Global settings

**All documents and emails must have a label (applied automatically or by users)**: Off

**Select the default label**: None

**Users must provide justification when lowering the sensitivity level (for example, from Confidential to Public)**: Off

## Next steps

For more information about configuring your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organization-s-policy) section. 
