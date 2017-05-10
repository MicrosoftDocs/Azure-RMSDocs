---
# required metadata

title: Quick start tutorial for Azure Information Protection
description: An introduction tutorial to quickly try out Microsoft Azure Information Protection for your organization that should take you about 20 minutes.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 04/07/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 1260b9e5-dba1-41de-84fd-609076587842

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Quick start tutorial for Azure Information Protection

>*Applies to: Azure Information Protection*

Use this tutorial to quickly try out Azure Information Protection with just 4 steps that should take you about 20 minutes. This tutorial is designed to be a self-guided demo to quickly show case some of the features and functionality that Azure Information Protection offers. It does not include all the available features and is not intended to be a deployment guide for your organization. If you are looking to deploy Azure Information Protection for your organization, see the [deployment roadmap documentation](../plan-design/deployment-roadmap.md).

This tutorial is intended for IT administrators and consultants, to help them evaluate Azure Information Protection as an enterprise information protection solution for an organization. In a production environment, the steps to configure the Information Protection policy, and install the client for users would be done by an administrator. The steps to label the document and safely share a document by email and track it would done by end users. This tutorial includes all these steps, to demonstrate typical end-to-end scenarios of classifying, labeling, and protecting your organization's data.

If you have any problems completing this tutorial, using Azure Information Protection, or want to see what others are saying about it, head over to the [Azure Information Protection Yammer site](https://www.yammer.com/askipteam).

## Prerequisites

> [!IMPORTANT]
> This tutorial has some important prerequisites that might take some time to complete, such as applying for subscriptions. Make sure that you set aside time to ensure that these prerequisites are met before you start the tutorial.

To complete this tutorial, you will need the following:

- A subscription that includes Azure Information Protection for classification, labeling, and protection. For example, **Enterprise Mobility + Security E5**.

    This tutorial includes some of the advanced features, such as automated data classification with user recommendations, and the document tracking site. Make sure that your subscription supports these features. For more information, see the [subscription information](https://www.microsoft.com/cloud-platform/azure-information-protection-pricing) and [feature list](https://www.microsoft.com/cloud-platform/azure-information-protection-features) from the Azure Information Protection site.

    If you don't have a subscription for these features, you can sign up for a free trial for [Enterprise Mobility + Security E5](https://portal.office.com/Signup/Signup.aspx?OfferId=87dd2714-d452-48a0-a809-d2f58c4f68b7).

- A subscription for Office 365 that includes Exchange Online and Azure Rights Management. For example, **Office 365 Enterprise E5**. For more information, download the [Azure Information Protection licensing datasheet](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf).

    If you don't have a subscription for these features, you can sign up for a free trial for [Office 365 Enterprise E5](https://go.microsoft.com/fwlink/?LinkID=698279).

- Access to a global administrator account for your tenant, and this account has a working mailbox in Exchange Online.

- Message protection in Office 365:

    This configuration requires running some PowerShell commands that are listed in the [Office documentation]. Note that if you have previously configured Exchange Online for Azure Rights Management by importing a trusted publishing domain (TPD), you must wait for Microsoft to migrate your tenant and until that time, you won't be able to complete the final step of this tutorial.

- A computer running Windows (minimum of Windows 7 with Service Pack 1), and which has installed either Office 365 ProPlus with 2016 apps or 2013 apps, Office Professional Plus 2016, Office Professional Plus 2013 with Service Pack 1, or Office Professional Plus 2010.

When you've confirmed all these prerequisites, you're ready to start the tutorial.

>[!div class="step-by-step"]
[&#187; Step 1](infoprotect-tutorial-step1.md)

[!INCLUDE[Commenting house rules](../includes/houserules.md)]
