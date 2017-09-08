---
# required metadata

title: FAQs for Azure Information Protection
description: Some frequently asked questions about Azure Information Protection and its data protection service, Azure Rights Management (Azure RMS).
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 07/27/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 71ce491f-41c1-4d15-9646-455a6eaa157d

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Frequently asked questions for Azure Information Protection

>*Applies to: Azure Information Protection, Office 365*

Have a question about Azure Information Protection, or about the Azure Rights Management service (Azure RMS)? See if it's answered here.

These FAQ pages will be updated regularly, with new additions listed in the monthly documentation update announcements on the [Enterprise Mobility and Security Blog](https://blogs.technet.microsoft.com/enterprisemobility/?product=azure-information-protection,azure-rights-management-services).

## What's the difference between Azure Information Protection and Azure Rights Management?

Azure Information Protection provides classification, labeling, and protection for an organization's documents and emails. The protection technology uses the Azure Rights Management service; now a component of Azure Information Protection.

## What is the role of identity management for Azure Information Protection?

A user must have a valid user name and password to access content that is protected by Azure Information Protection. To read more about how Azure Information Protection helps to secure your data, see [The role of Azure Information Protection in securing data](/enterprise-mobility-security/solutions/azure-information-protection-securing-data). 

## What subscription do I need for Azure Information Protection and what features are included?
See the [subscription information](https://www.microsoft.com/cloud-platform/azure-information-protection-pricing) and [feature list](https://www.microsoft.com/cloud-platform/azure-information-protection-features) from the Azure Information Protection site. 

If you have an Office 365 subscription that includes Rights Management, download the [Azure Information Protection licensing datasheet](http://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf) from the **Features** page.

## Is the Azure Information Protection client only for subscriptions that include classification and labeling?

No. Although most of the presentations and demos you've seen of the Azure Information Protection client show how it supports classification and labeling, it can also be used with subscriptions that include just the Azure Rights Management service to protect data.

When the Azure Information Protection client for Windows is installed and it doesn't have an Azure Information Protection policy, the client automatically operates in [protection-only mode](../rms-client/client-protection-only-mode.md). In this mode, users can easily apply Rights Management templates and custom permissions. If you later purchase a subscription that does include classification and labeling, the client automatically switches to standard mode when it downloads the Azure Information Protection policy.

If you currently use the Rights Management sharing application for Windows, we recommend that you replace this with the Azure Information Protection client. Support for the sharing application will end January 31, 2019. To help with the transition, see [Tasks that you used to do with the RMS sharing application](../rms-client/upgrade-client-app.md).

## Does Azure Information Protection support on-premises and hybrid scenarios?

Yes. Although Azure Information Protection is a cloud-based solution, it can classify, label, and protect documents and emails that are stored on-premises, as well as in the cloud.

If you have Exchange Server, SharePoint Server, and Windows file servers, you can deploy the [Rights Management connector](../deploy-use/deploy-rms-connector.md) so that these on-premises servers can use the Azure Rights Management service to protect your emails and documents. You can also synchronize and federate your Active Directory domain controllers with Azure AD for a more seamless authentication experience for users, for example, by using [Azure AD Connect](http://azure.microsoft.com/documentation/articles/active-directory-aadconnect/).

The Azure Rights Management service automatically generates and manages XrML certificates as required, so it doesn’t use an on-premises PKI. For more information about how Azure Rights Management uses certificates, see the [Walkthrough of how Azure RMS works: First use, content protection, content consumption](../understand-explore/how-does-it-work.md#walkthrough-of-how-azure-rms-works-first-use-content-protection-content-consumption) section in the [How does Azure RMS work?](../understand-explore/how-does-it-work.md) article.

## I see Azure Information Protection is listed as an available cloud app for conditional access–how does this work?

Yes, as a public preview offering, you can now configure Azure AD conditional access for Azure Information Protection.

When a user opens a document or email that is protected by Azure Information Protection, administrators can now block or grant access to users in their tenant, based on the standard conditional access controls and on selected platforms. For example, for your users to open protected emails and documents, you can configure the following settings:

- Users must authenticate by using multi-factor authentication (MFA).

- Mobile devices must be compliant with your Intune policies that contain settings such as minimum password length, the device must not be jailbroken, and a minimum operating system version.

- Windows computers must be domain-joined.

For more information and some walk-through examples, see the following blog post announcement:  Conditional Access policies for Azure Information Protection 

## I’ve heard a new release is going to be available soon, for Azure Information Protection—when will it be released?

The technical documentation does not contain information about upcoming releases. For this type of information and for release announcements, check the [Enterprise Mobility and Security Blog](https://blogs.technet.microsoft.com/enterprisemobility/?product=azure-information-protection,azure-rights-management-services) and get the latest updates from [Dan Plastina @TheRMSGuy](https://twitter.com/TheRMSGuy) on Twitter. If it’s an Office release that you’re interested in, be sure to also check the [Office blog](https://blogs.office.com/).

## Where can I find supporting information for Azure Information Protection—such as legal, compliance, and SLAs?

See [Compliance and supporting information for Azure Information Protection](../understand-explore/compliance.md).

## How can I report a problem or send feedback for Azure Information Protection?

For technical support, use your standard support channels or [contact Microsoft Support](information-support.md#to-contact-microsoft-support).

For feedback such as suggestions for improvements or new features: In your Office application, on the **Home** tab, in the **Protection** group, click **Protect**, and then click **Help and Feedback**. In the **Microsoft Azure Information Protection** dialog box, click **Send Us Feedback**. This opens an email message to be sent to the Information Protection team. 
We also invite you to engage with our engineering team, on their [Azure Information Protection Yammer site](https://www.yammer.com/askipteam/). 

## What do I do if my question isn’t here?

First, review the frequently asked questions that are specific to classification and labeling, or specific to data protection. The Azure Rights Management service (Azure RMS) provides the data protection technology for Azure Information Protection and Azure RMS can be used with classification and labeling, or without: 

- [FAQs for classification and labeling](faqs-infoprotect.md)

- [FAQs for data protection](faqs-rms.md)

If you question isn't answered, use the links and resources listed in [Information and support for Azure Information Protection](information-support.md).

In addition, there are FAQs designed for end-users:

- [FAQ for Azure Information Protection app for iOS and Android](../rms-client/mobile-app-faq.md)

- [FAQ for RMS sharing app for Mac computers and Windows Phone](https://technet.microsoft.com/dn451248)

- [FAQ for Rights Management Sharing Application for Windows](https://technet.microsoft.com/dn467883)


[!INCLUDE[Commenting house rules](../includes/houserules.md)]

