---
# required metadata

title: The default Azure Information Protection policy | Azure Rights Management
description:
author: cabailey
manager: mbaldwin
ms.date: 08/04/2016
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

**[ This information is preliminary and subject to change. ]**

Use the following information to understand how the default policy for Azure Information Protection is configured. If you modify the default policy, you can reference these values to return your policy to the defaults.

## Information Protection bar

|Setting|Value|
|-------------------------------|---------------------------|
|Title|**Sensitivity**|
|Tooltip|**Information Sensitivity consists of four distinct levels (Public, Internal, Confidential, Secret), allowing the user to identify the risk of exposing the information to unauthorized users inside or outside the business.**|

## Labels

|Label|Tooltip|Settings|
|-------------------------------|---------------------------|-----------------|
|**Personal**|**Information Sensitivity consists of four distinct levels (Public, Internal, Confidential, Secret), allowing the user to identify the risk of exposing the information to unauthorized users inside or outside the business.**|**Color**: Light green<br /><br />**Visual markings**: None<br /><br />**Conditions**: None<br /><br />**Protection**: No|
|**Public**|**This information is internal and can be used by everyone inside or outside the business.**|**Color**: Green<br /><br />**Visual markings**: None<br /><br />**Conditions**: None<br /><br />**Protection**: No|
|**Internal**|**This information includes a wide spectrum of internal business data that can be used by all employees and can be shared with authorized customers and business partners. Examples for internal information are company policies and most internal communications.**|**Color**: Blue<br /><br />**Visual markings**: Footer (document and email)<br /><br />**Conditions**: None<br /><br />**Protection**: No|
|**Confidential**|**This data includes sensitive business information. Exposing this data to unauthorized users may cause damage to the organization. Examples for Confidential information are employee information, individual customer projects or contracts, and sales account data.**|**Color**: Orange<br /><br />**Visual markings**: Footer (document and email)<br /><br />**Conditions**: None<br /><br />**Protection**: No|
|**Secret**|**This data includes highly sensitive information for the business that must be protected. Exposing Secret data to unauthorized users may cause serious damage to the organization. Examples for Secret information are personal identification information, customer records, source code, and pre-announced financial reports.**|**Color**: Red<br /><br />**Visual markings**: Footer (document and email)<br /><br />**Conditions**: None<br /><br />**Protection**: No|





## Sub-labels


|Label|Tooltip|Settings|
|-------------------------------|---------------------------|-----------------|
|Secret > **All Company**|**This data includes sensitive business information - permitted for all company employees.**|**Visual markings**: None<br /><br />**Conditions**: None<br /><br />**Protection**: No|
|Secret > **My Group**|**This data includes sensitive business information - permitted for employee groups only.**|**Visual markings**: None<br /><br />**Conditions**: None<br /><br />**Protection**: No|




## Global settings

|Setting|Value|
|-------------------------------|---------------------------|
|**All documents and emails must have a label (applied automatically or by users)**|Off|
|**Select the default label**|None|
|**Users must provide justification when lowering the sensitivity level (for example, from Confidential to Public)**|Off|


## Next steps

For more information about configuring your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organization-s-policy) section. 
