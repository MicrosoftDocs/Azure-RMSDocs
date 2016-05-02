---
# required metadata

title: Azure Rights Management deployment roadmap | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 086600c2-c5d8-47ec-a4c0-c782e1797486

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Azure Rights Management deployment roadmap

*Applies to: Azure Rights Management, Office 365*

Use the following steps to prepare for, implement, and manage Azure Rights Management (Azure RMS) for your organization.

However, if you just want to quickly try Azure RMS for yourself, rather than roll it out in a production environment, see [Quick start tutorial for Azure Rights Management](../get-started/quick-start-tutorial.md).

> [!IMPORTANT]
> Before you do the following steps, make sure that you have reviewed [Requirements for Azure Rights Management](../get-started/requirements-azure-rms.md).

## Step 1: Confirm that you have a subscription that includes Azure Rights Management
There is more than one type of subscription that includes [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)]. See [Cloud subscriptions that support Azure RMS](../get-started/requirements-subscriptions.md), and check that your subscription includes the functionality that you want to use in your organization by referring to the table in [Comparison of Rights Management Services (RMS) Offerings](https://technet.microsoft.com/dn858608). You will need to assign a license from this subscription to each user in your organization that will protect files and emails by using Azure RMS.

## Step 2: Prepare your tenant account to use Rights Management
Before you begin using [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)], do the following preparation:

1.  Make sure that your Azure or Office 365 tenant contains the user accounts and groups that will be used by Azure RMS to authenticate users from your organization. If necessary, create these account and groups, or synchronize them from your on-premises directory. For more information, see [Preparing for Azure Rights Management](prepare.md).

2.  Decide whether you want Microsoft to manage your tenant key (the default), or generate and manage your tenant key yourself (known as bring your own key, or BYOK). Note that currently, you cannot use BYOK if you use Exchange Online. For more information, see [Planning and implementing your Azure Rights Management tenant key](plan-implement-tenant-key.md).

3.  Install the Windows PowerShell module for [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)] on at least one computer that has Internet access. You can do this step now, or later. For more information, see [Installing Windows PowerShell for Azure Rights Management](../deploy-use/install-powershell.md).

4.  If you are currently using on-premises Rights Management services: Perform a migration to move the keys, templates, and URLs to the cloud. For more information, see [Migrating from AD RMS to Azure Rights Management](migrate-from-ad-rms-to-azure-rms.md).

5.  Activate Rights Management so that you can begin to use the service. If a phased deployment is required, configure user onboarding controls to restrict usage to specific users. For more information, see [Activating Azure Rights Management](../deploy-use/activate-service.md).

Optionally, consider configuring the following:

-   Custom templates if the default rights policy templates are not sufficient for your organization. You can do this step now, or later. For more information, see [Configuring custom templates for Azure Rights Management](../deploy-use/configure-custom-templates.md).

-   Usage logging so that you can monitor how your organization is using Rights Management. You can do this step now, or later. For more information, see [Logging and analyzing Azure Rights Management usage](../deploy-use/log-analyze-usage.md).

## Step 3: Configure your applications and services for Rights Management
Configuring your applications and services can include installing the Rights Management sharing application and enabling support for information rights management (IRM) features in SharePoint Online or Exchange Online. For more information, see [Configuring applications for Azure Rights Management](../deploy-use/configure-applications.md).

If you have existing IT services that need to inspect files that Azure RMS will protect—such as data leak prevention (DLP) solutions, content encryption gateways (CEG), and anti-malware products—configure the service accounts to be super users for Azure RMS. For more information, see [Configuring super users for Azure Rights Management and discovery services or data recovery](../deploy-use/configure-super-users.md).

If you have on-premises services that you want to use with Azure Rights Management, install and configure the Rights Management connector. For more information, see [Deploying the Azure Rights Management connector](../deploy-use/deploy-rms-connector.md).

## Step 4: Publish and consume rights-protected content
You’re now ready to publish and consume protected content, and log how your company is using Rights Management. For more information, see [Helping users to protect files by using Azure Rights Management](../deploy-use/help-users.md) and [Logging and analyzing Azure Rights Management usage](../deploy-use/log-analyze-usage.md).

## Step 5: Administer Rights Management for your tenant account as needed
As you begin to use [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)], you might find the [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)] module for Windows PowerShell useful to help script or automate administrative changes. For more information, see [Administering Azure Rights Management by using Windows PowerShell](../deploy-use/administer-powershell.md).


