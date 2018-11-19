---
# required metadata

title: Activating Azure Rights Management - AIP
description: The Azure Rights Management service must be activated before your organization can start to protect documents and emails by using applications and services that support this information protection solution. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 07/06/2018
ms.topic: conceptual
ms.service: information-protection
ms.assetid: f8707e01-b239-4d1a-a1ea-0d1cf9a8d214

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Activating Azure Rights Management

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](http://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

> [!NOTE]
> This configuration information is for administrators who are responsible for a service that applies to all users in an organization. If you are looking for user help and information to use the Rights Management functionality for a specific application or how to open a file or email that is rights-protected, use the help and guidance that accompanies your application.
>
> For example, for Office applications, click the Help icon and enter search terms such as **Rights Management** or **IRM**. For the Azure Information Protection client for Windows, see the [Azure Information Protection client user guide](./rms-client/client-user-guide.md).
>
> For technical support and other questions about the service, see the [Support options and community resources](information-support.md#support-options-and-community-resources) information.

When the Azure Rights Management service for Azure Information Protection is activated for your organization, administrators and users can start to protect important data by using applications and services that support this information protection solution. Administrators can also manage and monitor protected documents and emails that your organization owns. 


## Do you need to activate Azure Rights Management?

When you have a service plan that includes Azure Rights Management, you might not have to activate the service:

- **If your subscription that includes Azure Rights Management or Azure Information Protection was obtained towards the end of February 2018 or later:** The service is automatically activated for you. You do not have to activate the service unless you or another global administrator for your organization deactivated Azure Rights Management.

- **If your subscription that includes Azure Rights Management or Azure Information Protection was obtained before or during February 2018:** Microsoft is starting to activate the Azure Rights Management service for these subscriptions if your tenant is using Exchange Online. For these subscriptions, automatic activation is starting to roll out August 1, 2018 when the service will be activated for you unless you see **AutomaticServiceUpdateEnabled** is set to **false** when you run [Get-IRMConfiguration](/powershell/module/exchange/encryption-and-certificates/get-irmconfiguration?view=exchange-ps). 

If neither of the subsequent scenarios apply to you, you must manually activate the protection service. 

When the service is activated, all users in your organization can apply information protection to their documents and emails, and all users can open (consume) documents and emails that have been protected by the Azure Rights Management service. However, if you prefer, you can restrict who can apply information protection, by using onboarding controls for a phased deployment. For more information, see the [Configuring onboarding controls for a phased deployment](#configuring-onboarding-controls-for-a-phased-deployment) section in this article.

## How to activate or confirm the status of the Azure Rights Management service 

> [!IMPORTANT]
> Do not activate the Azure Rights Management service if you have Active Directory Rights Management Services (AD RMS) deployed for your organization. [More information](prepare-environment-adrms.md)

To use this data protection solution, your organization must have a service plan that includes the Azure Rights Management service from Azure Information Protection. Without this, the Azure Rights Management service cannot be activated. You must have one of the following:

- An [Azure Information Protection plan](https://www.microsoft.com/cloud-platform/azure-information-protection-pricing) 

- An [Office 365 plan that includes Rights Management](http://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf).

When the Azure Rights Management service is activated, all users in your organization can apply information protection to their documents and emails, and all users can open (consume) documents and emails that have been protected by the Azure Rights Management service. However, if you prefer, you can restrict who can apply information protection, by using onboarding controls for a phased deployment. For more information, see the [Configuring onboarding controls for a phased deployment](#configuring-onboarding-controls-for-a-phased-deployment) section in this article.

## Choosing your activation method

For instructions how to activate the Rights Management service from your management portal, select whether to use the Office 365 admin center or the Azure portal:

- [Office 365 admin center](activate-office365.md) - requires Global Administrator account

- [Azure portal](activate-azure.md) - does not require Global Administrator account

Alternatively, you can use the following PowerShell commands:

1. Install the AIPService module, to configure and manage the protection service. For instructions, see [Installing the AADRM PowerShell module](install-powershell.md).

2. From a PowerShell session, run [Connect-AipServiceService](/powershell/module/aipservice/connect-aipservice), and when prompted, provide the Global Administrator account details for your Azure Information Protection tenant.

3. Run [get-aipservice](/powershell/aipservice/get-aipservice) to confirm whether the Azure Rights Management service is activated. A status of **Enabled** confirms activation; **Disabled** indicates that the service is deactivated.

4. To activate the service, run [Enable-AipService](/powershell/aipservice/enable-aipservice).

## Configuring onboarding controls for a phased deployment
If you don’t want all users to be able to protect documents and emails immediately by using Azure Rights Management, you can configure user onboarding controls by using the [Set-AipServiceOnboardingControlPolicy](/powershell/module/aipservice/set-aipserviceonboardingcontrolpolicy) PowerShell command. You can run this command before or after you activate the Azure Rights Management service.

> [!IMPORTANT]
> To use this command, you must have at least version **2.1.0.0** of the [Azure Rights Management PowerShell module](https://go.microsoft.com/fwlink/?LinkId=257721).
>
> To check the version you have installed, run: **(Get-Module aadrm –ListAvailable).Version**

For example, if you initially want only administrators in the “IT department” group (that has an object ID of fbb99ded-32a0-45f1-b038-38b519009503) to be able to protect content for testing purposes, use the following command:

```
Set-AipServiceOnboardingControlPolicy -UseRmsUserLicense $False -SecurityGroupObjectId "fbb99ded-32a0-45f1-b038-38b519009503"
```

Note that for this configuration option, you must specify a group; you cannot specify individual users. To obtain the object ID for the group, you can use Azure AD PowerShell—for example, for version 1.0 of the module, use the [Get-MsolGroup](/powershell/msonline/v1/get-msolgroup) command. Or, you can copy the **Object ID** value of the group from the Azure portal.

Alternatively, if you want to ensure that only users who are correctly licensed to use Azure Information Protection can protect content:

```
Set-AipServiceOnboardingControlPolicy -UseRmsUserLicense $True
```

When you no longer need to use onboarding controls, whether you used the group or licensing option, run:

```
Set-AipServiceOnboardingControlPolicy -UseRmsUserLicense $False
```

For more information about this cmdlet and additional examples, see the [Set-AipServiceOnboardingControlPolicy](/powershell/aipservice/set-aipserviceonboardingcontrolpolicy) help.

When you use these onboarding controls, all users in the organization can always consume protected content that has been protected by your subset of users, but they won’t be able to apply information protection themselves from client applications. For example, they won’t see in their Office apps the default templates that are automatically published when the Azure Rights Management service is activated, or custom templates that you might configure. Server-side applications, such as Exchange, can implement their own per-user controls for Rights Management integration to achieve the same result. For example, to prevent users from protecting emails in Outlook on the web, use [Set-OwaMailboxPolicy](/powershell/module/exchange/client-access/set-owamailboxpolicy?view=exchange-ps) to set the *IRMEnabled* parameter to *$false*.


## Next steps
When the Azure Rights Management service is activated for your organization, use the [Azure Information Protection deployment roadmap](deployment-roadmap.md) to check whether there are other configuration steps that you might need to do before you roll out Azure Information Protection to users and administrators. 

For example, you might want to use [templates](configure-policy-templates.md) to make it easier for users to apply information protection to files, connect your on-premises servers to use Azure Rights Management by installing the [Rights Management connector](deploy-rms-connector.md), and deploy the [Azure Information Protection client](./rms-client/aip-client.md) that supports protecting all file types on all devices. 

Office services, such as Exchange Online and SharePoint Online require additional configuration before you can use their Information Rights Management (IRM) features. For information about how your applications work with the Rights Management service, see [How applications support the Azure Rights Management service](applications-support.md).


