---
# required metadata

title: Activating the protection service from Azure Information Protection (AIP)
description: Learn about activating the Azure Rights Management protection service in order to protect your documents and emails.
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 11/30/2019
ms.topic: how-to
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: f8707e01-b239-4d1a-a1ea-0d1cf9a8d214

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: azurerms
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin, has-azure-ad-ps-ref
---

# Activating the protection service from Azure Information Protection

This article describes how administrators can activate the Azure Rights Management protection service for Azure Information Protection (AIP). When the protection service is activated for your organization, administrators and users can start to protect important data by using applications and services that support this information protection solution. Administrators can also manage and monitor protected documents and emails that your organization owns.

This configuration information in this article is for administrators who are responsible for a service that applies to all users in an organization. If you are looking for user help and information to use the Rights Management functionality for a specific application or how to open a file or email that is rights-protected, use the help and guidance that accompanies your application.

For technical support and other questions about the service, see the [Support options and community resources](information-support.md#support-options-and-community-resources) information.

## Automatic activation for Azure Rights Management

When you have a service plan that includes Azure Rights Management, you may not have to activate the service:

- **If your subscription that includes Azure Rights Management or Azure Information Protection was obtained towards the end of February 2018 or later**: The service is automatically activated for you. You do not have to activate the service unless you or another global administrator for your organization deactivated Azure Rights Management.

- **If your subscription that includes Azure Rights Management or Azure Information Protection was obtained before or during February 2018**: Microsoft activates the Azure Rights Management service for these subscriptions if your tenant is using Exchange Online. For these subscriptions, the service will be activated for you unless you see that **AutomaticServiceUpdateEnabled** is set to **false** when you run [Get-IRMConfiguration](/powershell/module/exchange/encryption-and-certificates/get-irmconfiguration).

If neither of the listed scenarios apply to you, you must manually activate the protection service.

## How to activate or confirm the status of the protection service

> [!IMPORTANT]
> Do not activate the protection service if you have Active Directory Rights Management Services (AD RMS) deployed for your organization. [More information](prepare-environment-adrms.md)

To activate the protection service, your organization must have a service plan that includes the Azure Rights Management service from Azure Information Protection. For more information, see [Microsoft 365 licensing guidance for security & compliance](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance).

When the protection service is activated, all users in your organization can apply information protection to their documents and emails, and all users can open (consume) documents and emails that have been protected by this service. However, if you prefer, you can restrict who can apply information protection, by using onboarding controls for a phased deployment. For more information, see the [Configuring onboarding controls for a phased deployment](#configuring-onboarding-controls-for-a-phased-deployment) section in this article.

### Activate protection via PowerShell

You must use PowerShell to activate the Rights Management protection service (Azure RMS). You can no longer activate or deactivate this service from the Azure portal.

1. Install the AIPService module, to configure and manage the protection service. For instructions, see [Installing the AIPService PowerShell module](install-powershell.md).

2. From a PowerShell session, run [Connect-AipService](/powershell/module/aipservice/connect-aipservice), and when prompted, provide the Global Administrator account details for your Azure Information Protection tenant.

3. Run [Get-AipService](/powershell/module/aipservice/get-aipservice) to confirm whether the protection service is activated. A status of **Enabled** confirms activation; **Disabled** indicates that the service is deactivated.

4. To activate the service, run [Enable-AipService](/powershell/module/aipservice/enable-aipservice).


## Configuring onboarding controls for a phased deployment

If you don’t want all users to be able to protect documents and emails immediately by using Azure Information Protection, you can configure user onboarding controls by using the [Set-AipServiceOnboardingControlPolicy](/powershell/module/aipservice/set-aipserviceonboardingcontrolpolicy) PowerShell command. You can run this command before or after you activate the Azure Rights Management service.

For example, if you initially want only administrators in the “IT department” group (that has an object ID of fbb99ded-32a0-45f1-b038-38b519009503) to be able to protect content for testing purposes, use the following command:

```powershell
Set-AipServiceOnboardingControlPolicy -UseRmsUserLicense $False -SecurityGroupObjectId "fbb99ded-32a0-45f1-b038-38b519009503"
```

Note that for this configuration option, you must specify a group; you cannot specify individual users. To obtain the object ID for the group, you can use Azure AD PowerShell—for example, for version 1.0 of the module, use the [Get-MsolGroup](/powershell/module/msonline/get-msolgroup) command. Or, you can copy the **Object ID** value of the group from the Azure portal.

Alternatively, if you want to ensure that only users who are correctly licensed to use Azure Information Protection can protect content:

```powershell
Set-AipServiceOnboardingControlPolicy -UseRmsUserLicense $True
```

When you no longer need to use onboarding controls, whether you used the group or licensing option, run:

```powershell
Set-AipServiceOnboardingControlPolicy -UseRmsUserLicense $False
```

For more information about this cmdlet and additional examples, see the [Set-AipServiceOnboardingControlPolicy](/powershell/module/aipservice/set-aipserviceonboardingcontrolpolicy) help.

When you use these onboarding controls, all users in the organization can always consume protected content that has been protected by your subset of users, but they won’t be able to apply information protection themselves from client applications. Server-side applications, such as Exchange, can implement their own per-user controls to achieve the same result. For example, to prevent users from protecting emails in Outlook on the web, use [Set-OwaMailboxPolicy](/powershell/module/exchange/client-access/set-owamailboxpolicy) to set the *IRMEnabled* parameter to *$false*.


## Next steps

Now that the protection service is activated for your organization, apps and services can apply encryption to help protect your data. One of the easiest ways to apply encryption, is by using [sensitivity labels](/microsoft-365/compliance/sensitivity-labels) from Microsoft Purview Information Protection.
