---
# required metadata

title: What is Azure Information Protection? | Azure Information Protection
description: An overview of the Azure Information Protection service.
author: cabailey
manager: mbaldwin
ms.date: 07/29/2016
ms.topic: article
ms.prod:
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: cd8a88e2-3555-4be2-9637-3cdee992f2c8

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# What is Azure Information Protection?

>*Applies to: Azure Information Protection*

Azure Information Protection helps an organization to classify and label its documents and emails. This can be done automatically by administrators who define rules and conditions, manually by users, or a combination where users are given recommendations. For your most sensitive data, you can then protect it from unauthorized access, and control how this information is used.

The following picture shows an example of Azure Information Protection in action. An administrator has configured rules to detect sensitive data (in this case, credit card information). When a user saves a Word document that contains credit card information, she sees a custom tooltip that recommends she applies a specific label that the administrator has previously configured:

![Example of recommended classification for Azure Information Protection](../media/info-protect-recommend-callouts.png)

When you classify your documents and emails by using Azure Information Protection, labels are added to the data, so that the classification is identifiable at all times, regardless of where the data is stored or with whom it’s shared. The persistent labels include visual markings such as a header, footer, or watermark. Metadata is added to files so that other services (such as data loss prevention solutions) can identify the classification and take appropriate action. 

Some example visual markings:


## How data is protected

*Azure Rights Management* is used for the protection. This technology is integrated with other Microsoft cloud services and applications, such as Office 365 and Azure Active Directory. It can also be used with your own line-of-business applications and information protection solutions from software vendors, whether these applications and solutions are on-premises, or in the cloud.

This protection technology uses encryption, identity, and authorization policies. Similarly to the persistent labels, protection that is applied by using Rights Management stays with the documents and emails, independently of the location—inside or outside your organization, networks, file servers, and applications. This information protection solution keeps you in control of your data, even when it is shared with other people.

For example, you can configure a report document or sales forecast spreadsheet so that it can be accessed only by people in your organization, and control whether that document can be edited, or restricted to read-only, or prevent it from being printed. You can configure emails similarly, and in addition, prevent them from being forwarded or prevent the use of the Reply All option. These protection tasks can be simplified and streamlined by using rights management templates.

These templates can be part of a label's configuration, so that when a specific label is applied to a document (or email message), the data is both classified and automatically protected. The templates can also be selected by users or administrators in products and services that support the Azure Rights Management technology.

This example shows how you might select a template or rights management option to a label:

![Example of selecting templates in the Azure portal](../media/templates-infoprotection.png)

The same templates are available to configure mail flow rules for Exchange Online, which supports the Azure Rights Management technology:

![Example of selecting templates for Exchange Online](../media/templates-exchangeonline.png)

For more information about the Azure Rights Management protection, see [What is Azure Rights Management?](what-is-azure-rms.md)

## Integration with end user workflows

Azure Information Protection integrates with end users' existing workflows when the Azure Information Protection client is installed. This client installs the Information Protection bar to Office applications, which we saw in the first picture. The same bar is added to Excel, PowerPoint, and Outlook. For example:

![Example of the Azure Information Protection bar in Excel](../media/excel2013-infoprotect-bar.png)

This Information Protection bar makes it easy for end users to select labels for the correct classification, and where required these labels can also automatically protect their documents and emails.


## Resources for Azure Information Protection

- Announcement: [Azure Information Protection – available in Public Preview now!](https://blogs.technet.microsoft.com/enterprisemobility/2016/07/12/azure-information-protection-public-preview-available-now/)

- Download the client: [Azure Information Protection client](https://www.microsoft.com/en-us/download/details.aspx?id=53018)

- FAQs: [Frequently asked questions for Azure Information Protection](../get-started/faqs.md)

- Yammer: [Azure Information Protection](https://www.yammer.com/askipteam/#/threads/inGroup?type=in_group&feedId=8652489&view=all)

- Presentation:

(add video)

## Next steps

See Azure Information Protection for yourself, with our [Quick start tutorial for Azure Information Protection](../get-started/infoprotect-quick-start-tutorial.md).

Know Azure Information Protection or Azure Rights Management by another name? See [our list of alternative terms for the service](azure-rms-aka.md).