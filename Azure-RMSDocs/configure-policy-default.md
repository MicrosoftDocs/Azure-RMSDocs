---
# required metadata

title: The default policy for Azure Information Protection - AIP
description: Understand how the default policy for Azure Information Protection is configured. If you modify the default policy, you can reference these values to return your policy to the defaults.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 11/09/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ROBOTS: NOINDEX


# optional metadata

#audience:
#ms.devlang:
ms.subservice: aiplabels
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# The default Azure Information Protection policy

>***Applies to**: Azure Information Protection*
>
>***Relevant for**: [Azure Information Protection classic client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients). For the unified labeling client, see [Learn about sensitivity labels](/microsoft-365/compliance/sensitivity-labels) from the Microsoft 365 documentation.*

[!INCLUDE [AIP classic client is sunset - extended support customers](includes/classic-client-sunset-extended-support.md)]

Use the following information to understand how the default policy for Azure Information Protection is configured.

When an administrator first connects to the Azure Information Protection service by using the Azure portal, the Azure Information Protection default policy for that tenant is created. Occasionally, Microsoft might make changes to this default policy but if you were already using the service before the default policy was revised, your earlier version of the Azure Information Protection default policy is not updated because you might have configured it and deployed into production.

You can reference the following values to return your Azure Information Protection policy to the defaults, or update your Azure Information Protection policy to the latest values.

> [!IMPORTANT]
> Starting April 2019, the default labels are not automatically created for new customers. These tenants are automatically provisioned for the unified labeling platform, so there is no need to migrate labels after you have configured them in the Azure portal.
> 
> For these tenants, if there aren't any sensitivity labels already created in the Microsoft 365 compliance center, you can create the default labels from the current default policy for Azure Information Protection. To do this, select **Generate default labels** from the **Labels** pane, and add the labels to the global policy. If you don't see the option to generate default labels, you might need to first activate unified labeling from the **Manage** > **Unified labeling** pane. For detailed instructions, see the [Get started with Azure Information Protection in the Azure portal](quickstart-viewpolicy.md) quickstart.


## Current default policy

This version of the Azure Information Protection default policy is from July 31, 2017.

This Azure Information Protection default policy is created when the Azure Rights Management service is activated, which is the case for new tenants starting February 2018. For more information, see the blog post announcement [Improvements to the protection stack in Azure Information Protection](https://cloudblogs.microsoft.com/enterprisemobility/2018/03/08/improvements-to-the-protection-stack-in-azure-information-protection).

This Azure Information Protection default policy is also created if you have manually [activated the service](activate-service.md) before the Azure Information Protection policy was created. 

If the service was not activated, the Azure Information Protection default policy does not configure protection for the following sublabels:

- **Confidential \ All Employees**

- **Confidential \ Recipients Only**

- **Highly Confidential \ All Employees** 

- **Highly Confidential \ Recipients Only** 

When these sublabels are not automatically configured for protection, the Azure Information Protection default policy remains the same as the [previous default policy](#default-policy-before-july-31-2017).

When protection is applied to the **All Employees** sublabels, the protection is configured by using the default templates that are automatically converted to labels in the Azure portal. For more information about these templates, see [Configuring and managing templates for Azure Information Protection](configure-policy-templates.md).

Starting August 30, 2017, this version of the Azure Information Protection default policy includes multi-language versions of the label names and descriptions. 

#### More information about the Recipients Only sublabel

Users see this label in Outlook only. They do not see this label in Word, Excel, PowerPoint, or from File Explorer. 

When users select this label, the Outlook Do Not Forward option is automatically applied to the email. The recipients that the users specify cannot forward the email and cannot copy or print the contents, or save any attachments.


### Labels

|Label|Tooltip|Settings|
|-------------------------------|---------------------------|-----------------|
|Personal|Non-business data, for personal use only.|**Enabled**: On <br /><br />**Color**: Light green<br /><br />**Visual markings**: Off <br /><br />**Conditions**: None<br /><br />**Protection**: None|
|Public|Business data that is specifically prepared and approved for public consumption.|**Enabled**: On <br /><br />**Color**: Green<br /><br />**Visual markings**: Off<br /><br />**Conditions**: None<br /><br />**Protection**: None|
|General|Business data that is not intended for public consumption. However, this can be shared with external partners, as required. Examples include a company internal telephone directory, organizational charts, internal standards, and most internal communication.|**Enabled**: On <br /><br />**Color**: Blue <br /><br />**Visual markings**: Off<br /><br />**Conditions**: None<br /><br />**Protection**: None|
|Confidential|Sensitive business data that could cause damage to the business if shared with unauthorized people. Examples include contracts, security reports, forecast summaries, and sales account data.|**Enabled**: On <br /><br />**Color**: Orange<br /><br />**Visual markings**: Off<br /><br />**Conditions**: None<br /><br />**Protection**: None|
|Highly Confidential|Very sensitive business data that would cause damage to the business if it was shared with unauthorized people. Examples include employee and customer information, passwords, source code, and pre-announced financial reports.|**Enabled**: On <br /><br />**Color**: Red<br /><br />**Visual markings**: Off<br /><br />**Conditions**: None<br /><br />**Protection**: None|


### Sublabels

|Label|Tooltip|Settings|
|-------------------------------|---------------------------|-----------------|
|Confidential \ All Employees|Confidential data that requires protection, which allows all employees full permissions. Data owners can track and revoke content.|**Enabled**: On <br /><br />**Visual markings**: Footer (document and email)<br /><br />Classified as Confidential<br /><br />**Conditions**: None<br /><br />**Protection**: Azure (cloud key) [[1]](#footnote-1)|
|Confidential \ Anyone (not protected)|Data that does not require protection. Use this option with care and with appropriate business  justification.|**Enabled**: On <br /><br />**Visual markings**: Footer (document and email)<br /><br />Classified as Confidential <br /><br />**Conditions**: None<br /><br />**Protection**: None|
|Confidential \ Recipients Only|Confidential data that requires protection and that can be viewed by the recipients only.|**Enabled**: On <br /><br />**Visual markings**: Footer (email)<br /><br />Classified as Confidential <br /><br />**Conditions**: None<br /><br />**Protection**: Set user defined permissions (Preview [[3]](#footnote-3)), In Outlook apply Do Not Forward|
|Highly Confidential \ All Employees|Highly confidential data that allows all employees view, edit, and reply permissions to this content. Data owners can track and revoke content.|**Enabled**: On <br /><br />**Visual markings**: Footer (document and email)<br /><br />Classified as Highly Confidential<br /><br />**Conditions**: None<br /><br />**Protection**: Azure (cloud key) [[2]](#footnote-2)|
|Highly Confidential \ Anyone (not protected)|Data that does not require protection. Use this option with care and with appropriate business  justification.|**Enabled**: On <br /><br />**Visual markings**: Footer (document and email)<br /><br />Classified as Highly Confidential<br /><br />**Conditions**: None<br /><br />**Protection**: None|
|Highly Confidential \ Recipients Only|Highly confidential data that requires protection and that can be viewed by the recipients only.|**Enabled**: On <br /><br />**Visual markings**: Footer (email)<br /><br />Classified as Highly Confidential <br /><br />**Conditions**: None<br /><br />**Protection**: Set user defined permissions (Preview [[3]](#footnote-3)), In Outlook apply Do Not Forward|

###### Footnote 1
The protection permissions match those in the [default template](configure-policy-templates.md#default-templates), **Confidential \ All Employees**.

###### Footnote 2 
The protection permissions match those in the [default template](configure-policy-templates.md#default-templates), **Highly Confidential \ All Employees**.

###### Footnote 3
This feature is currently in PREVIEW. The [Azure Preview Supplemental Terms](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) include additional legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability.

### Information Protection bar

|Setting|Value|
|-------------------------------|---------------------------|
|Title|Sensitivity|
|Tooltip|The current label for this content. This setting identifies the risk to the business if this content is shared with unauthorized people inside or outside the organization.|


### Settings

Some of the settings were added after July 31, 2017.

|Setting|Value|
|-------------------------------|---------------------------|
|Select the default label|None|
|Send audit data to Azure Information Protection analytics|Off|
|All documents and emails must have a label (applied automatically or by users)|Off|
|Users must provide justification to set a lower classification label, remove a label, or remove protection|Off|
|For email messages with attachments, apply a label that matches the highest classification of those attachments|Off|
|Display the Information Protection bar in Office apps|Off|
|Add the Do Not Forward button to the Outlook ribbon|Off|
|Make the custom permissions option available for users|Off|
|Provide a custom URL for the Azure Information Protection client "Tell me more" web page|Blank|

## Default policy before July 31, 2017

Note that descriptions in this policy refer to data that requires protection, and also to data tracking and revoking. The policy does not configure this protection for these labels, so you must take additional steps to fulfill this description. For example, configure the label to apply protection or use a data loss prevention (DLP) solution. Before you can track and revoke a document by using the document tracking site, the document must be protected by the Azure Rights Management service and tracked by the person who protected the document. 


### Labels

|Label|Tooltip|Settings|
|-------------------------------|---------------------------|-----------------|
|Personal|Non-business data, for personal use only.|**Enabled**: On <br /><br />**Color**: Light green<br /><br />**Visual markings**: Off <br /><br />**Conditions**: None<br /><br />**Protection**: None|
|Public|Business data that is specifically prepared and approved for public consumption.|**Enabled**: On <br /><br />**Color**: Green<br /><br />**Visual markings**: Off<br /><br />**Conditions**: None<br /><br />**Protection**: None|
|General|Business data that is not intended for public consumption. However, this can be shared with external partners, as required. Examples include a company internal telephone directory, organizational charts, internal standards, and most internal communication.|**Enabled**: On <br /><br />**Color**: Blue <br /><br />**Visual markings**: Off<br /><br />**Conditions**: None<br /><br />**Protection**: None|
|Confidential|Sensitive business data that could cause damage to the business if shared with unauthorized people. Examples include contracts, security reports, forecast summaries, and sales account data.|**Enabled**: On <br /><br />**Color**: Orange<br /><br />**Visual markings**: Off<br /><br />**Conditions**: None<br /><br />**Protection**: None|
|Highly Confidential|Very sensitive business data that would cause damage to the business if it was shared with unauthorized people. Examples include employee and customer information, passwords, source code, and pre-announced financial reports.|**Enabled**: On <br /><br />**Color**: Red<br /><br />**Visual markings**: Off<br /><br />**Conditions**: None<br /><br />**Protection**: None|


### Sublabels

|Label|Tooltip|Settings|
|-------------------------------|---------------------------|-----------------|
|Confidential \ All Employees|Confidential data that requires protection, which allows all employees full permissions. Data owners can track and revoke content.|**Enabled**: On <br /><br />**Visual markings**: Footer (document and email)<br /><br />Classified as Confidential<br /><br />**Conditions**: None<br /><br />**Protection**: None|
|Confidential \ Anyone (not protected)|Data that does not require protection. Use this option with care and with appropriate business  justification.|**Enabled**: On <br /><br />**Visual markings**: Footer (document and email)<br /><br />Classified as Confidential <br /><br />**Conditions**: None<br /><br />**Protection**: None|
|Highly Confidential \ All Employees|Highly confidential data that allows all employees view, edit, and reply permissions to this content. Data owners can track and revoke content.|**Enabled**: On <br /><br />**Visual markings**: Footer (document and email)<br /><br />Classified as Highly Confidential<br /><br />**Conditions**: None<br /><br />**Protection**: None|
|Highly Confidential \ Anyone (not protected)|Data that does not require protection. Use this option with care and with appropriate business  justification.|**Enabled**: On <br /><br />**Visual markings**: Footer (document and email)<br /><br />Classified as Highly Confidential<br /><br />**Conditions**: None<br /><br />**Protection**: None|

### Information Protection bar

|Setting|Value|
|-------------------------------|---------------------------|
|Title|Sensitivity|
|Tooltip|The current label for this content. This setting identifies the risk to the business if this content is shared with unauthorized people inside or outside the organization.|


### Settings

|Setting|Value|
|-------------------------------|---------------------------|
|All documents and emails must have a label (applied automatically or by users)|Off|
|Select the default label|None|
|Users must provide justification to set a lower classification label, remove a label, or remove protection|Off|
|For email messages with attachments, apply a label that matches the highest classification of those attachments|Off|
|Provide a custom URL for the Azure Information Protection client "Tell me more" web page|Blank|

## Default policy before March 21, 2017

### Labels

|Label|Tooltip|Settings|
|-------------------------------|---------------------------|-----------------|
|Personal|For personal use only. This data will not be monitored by the organization. Personal information must not include any business-related data.|**Enabled**: On <br /><br />**Color**: Light green<br /><br />**Visual markings**: Off <br /><br />**Conditions**: None<br /><br />**Protection**: None|
|Public|This information is internal and can be used by everyone inside or outside the business.|**Enabled**: On <br /><br />**Color**: Green<br /><br />**Visual markings**: Off<br /><br />**Conditions**: None<br /><br />**Protection**: None|
|Internal|This information includes a wide spectrum of internal business data that can be used by all employees and can be shared with authorized customers and business partners. Examples for internal information are company policies and most internal communications.|**Enabled**: On <br /><br />**Color**: Blue <br /><br />**Visual markings**: Footer (document and email): <br /><br />Sensitivity: Internal<br /><br />**Conditions**: None<br /><br />**Protection**: None|
|Confidential|This data includes sensitive business information. Exposing this data to unauthorized users may cause damage to the organization. Examples for Confidential information are employee information, individual customer projects or contracts, and sales account data.|**Enabled**: On <br /><br />**Color**: Orange<br /><br />**Visual markings**: Footer (document and email):<br /><br /> Sensitivity: Confidential<br /><br />**Conditions**: None<br /><br />**Protection**: None|
|Secret|This data includes highly sensitive information for the business that must be protected. Exposing Secret data to unauthorized users may cause serious damage to the organization. Examples for Secret information are personal identification information, customer records, source code, and pre-announced financial reports.|**Enabled**: On <br /><br />**Color**: Red<br /><br />**Visual markings**: Footer (document and email):<br /><br /> Sensitivity: Secret<br /><br />**Conditions**: None<br /><br />**Protection**: None|


### Sublabels

|Label|Tooltip|Settings|
|-------------------------------|---------------------------|-----------------|
|Secret \ All Company|This data includes sensitive business information - permitted for all company employees.|**Enabled**: On <br /><br />**Visual markings**: Off<br /><br />**Conditions**: None<br /><br />**Protection**: None|
|Secret \ My Group|This data includes sensitive business information - permitted for employee groups only.|**Enabled**: On <br /><br />**Visual markings**: Off<br /><br />**Conditions**: None<br /><br />**Protection**: None|

### Information Protection bar

|Setting|Value|
|-------------------------------|---------------------------|
|Title|Sensitivity|
|Tooltip|Information Sensitivity consists of four distinct levels (Public, Internal, Confidential, Secret), allowing the user to identify the risk of exposing the information to unauthorized users inside or outside the business.|


### Settings

|Setting|Value|
|-------------------------------|---------------------------|
|All documents and emails must have a label (applied automatically or by users)|Off|
|Select the default label|None|
|Users must provide justification to set a lower classification label, remove a label, or remove protection|Off|
|Provide a custom URL for the Azure Information Protection client "Tell me more" web page|Blank|


## Next steps

For more information about configuring your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organizations-policy) section.