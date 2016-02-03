---
title: Azure Rights Management Deployment Roadmap
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 086600c2-c5d8-47ec-a4c0-c782e1797486
author: Cabailey
---
# Azure Rights Management Deployment Roadmap
Use the following steps to prepare for, implement, and manage Azure Rights Management (Azure RMS) for your organization.

However, if you just want to quickly try Azure RMS for yourself, rather than roll it out in a production environment, see [Quick Start Tutorial for Azure Rights Management](../Topic/Quick_Start_Tutorial_for_Azure_Rights_Management.md).

> [!IMPORTANT]
> Before you do the following steps, make sure that you have reviewed [Requirements for Azure Rights Management](../Topic/Requirements_for_Azure_Rights_Management.md).

## Step 1: Confirm that you have a subscription that includes Azure Rights Management
There is more than one type of subscription that includes [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)]. See the [Cloud subscriptions that support Azure RMS](../Topic/Requirements_for_Azure_Rights_Management.md#BKMK_SupportedSubscriptions) section in the [Requirements for Azure Rights Management](../Topic/Requirements_for_Azure_Rights_Management.md) topic, and check that your subscription includes the functionality that you want to use in your organization by referring to the table in [Comparison of Rights Management Services (RMS) Offerings](https://technet.microsoft.com/dn858608).

## Step 2: Prepare your tenant account to use Rights Management
Before you begin using [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)], do the following preparation:

1.  Make sure that your Azure or Office 365 tenant contains the user accounts and groups that will be used by Azure RMS to authenticate users from your organization. If necessary, create these account and groups, or synchronize them from your on-premises directory. For more information, see [Preparing for Azure Rights Management](../Topic/Preparing_for_Azure_Rights_Management.md).

2.  Decide whether you want Microsoft to manage your tenant key (the default), or generate and manage your tenant key yourself (known as bring your own key, or BYOK). Note that currently, you cannot use BYOK if you use Exchange Online. For more information, see [Planning and Implementing Your Azure Rights Management Tenant Key](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md).

3.  Install the Windows PowerShell module for [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)] on at least one computer that has Internet access. You can do this step now, or later. For more information, see [Installing Windows PowerShell for Azure Rights Management](../Topic/Installing_Windows_PowerShell_for_Azure_Rights_Management.md).

4.  If you are currently using on-premises Rights Management services: Perform a migration to move the keys, templates, and URLs to the cloud. For more information, see [Migrating from AD RMS to Azure Rights Management](../Topic/Migrating_from_AD_RMS_to_Azure_Rights_Management.md).

5.  Activate Rights Management so that you can begin to use the service. If a phased deployment is required, configure user onboarding controls to restrict usage to specific users. For more information, see [Activating Azure Rights Management](../Topic/Activating_Azure_Rights_Management.md).

Optionally, consider configuring the following:

-   Custom templates if the default rights policy templates are not sufficient for your organization. You can do this step now, or later. For more information, see [Configuring Custom Templates for Azure Rights Management](../Topic/Configuring_Custom_Templates_for_Azure_Rights_Management.md).

-   Usage logging so that you can monitor how your organization is using Rights Management. You can do this step now, or later. For more information, see [Logging and Analyzing Azure Rights Management Usage](../Topic/Logging_and_Analyzing_Azure_Rights_Management_Usage.md).

## Step 3: Configure your applications and services for Rights Management
Configuring your applications can include installing the Rights Management sharing application and enabling support for information rights management (IRM) features in SharePoint Online or Exchange Online. For more information, see [Configuring Applications for Azure Rights Management](../Topic/Configuring_Applications_for_Azure_Rights_Management.md).

If you have existing IT services that need to inspect files that Azure RMS will protect—such as data leak prevention (DLP) solutions, content encryption gateways (CEG), and anti-malware products—configure the service accounts to be super users for Azure RMS. For more information, see [Configuring Super Users for Azure Rights Management and Discovery Services or Data Recovery](../Topic/Configuring_Super_Users_for_Azure_Rights_Management_and_Discovery_Services_or_Data_Recovery.md).

If you have on-premises services that you want to use with Azure Rights Management, install and configure the Rights Management connector. For more information, see [Deploying the Azure Rights Management Connector](../Topic/Deploying_the_Azure_Rights_Management_Connector.md).

## Step 4: Publish and consume rights-protected content
You’re now ready to publish and consume protected content, and log how your company is using Rights Management. For more information, see [Using Azure Rights Management](../Topic/Using_Azure_Rights_Management.md).

## Step 5: Administer Rights Management for your tenant account as needed
As you begin to use [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)], you might find the [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)] module for Windows PowerShell useful to help script or automate administrative changes. For more information, see [Administering Azure Rights Management by Using Windows PowerShell](../Topic/Administering_Azure_Rights_Management_by_Using_Windows_PowerShell.md).

## See Also
[Configuring Azure Rights Management](../Topic/Configuring_Azure_Rights_Management.md)

