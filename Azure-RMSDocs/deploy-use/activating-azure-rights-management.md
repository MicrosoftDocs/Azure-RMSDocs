---
# required metadata

title: Activating Azure Rights Management | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
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
When you activate [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] (Azure RMS), your organization can start to protect important data by using applications and services that support this information protection solution. Administrators can also manage and monitor protected files and emails that your organization owns. You must enable [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)] before you can begin to use the information rights management (IRM) features within Office, SharePoint, and Exchange, and protect any sensitive or confidential file.

If you want to learn more about Azure Rights Management before you activate the service—for example, what business problems it solves, some typical use cases, and how it works—see [What is Azure Rights Management?](../understand-explore/what-is-azure-rights-management.md)

> [!IMPORTANT]
> Before you activate [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)], make sure that your organization has a service plan that includes [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)] services. If not, you will not be able to activate Azure RMS.
>
> For more information, see the [Cloud subscriptions that support Azure RMS](../get-started/rms-requirements-cloud-subscriptions.md).

After you have activated Azure RMS, all users in your organization can apply information protection to their files, and all users can open (consume) files that have been protected by Azure RMS. However, if you prefer, you can restrict who can apply information protection, by using onboarding controls for a phased deployment. For more information, see the [Configuring onboarding controls for a phased deployment](#configuring-onboarding-controls-for-a-phased-deployment) section in this article.

For instructions how to activate Rights Management, select whether you will use the Office 365 admin center (preview or classic), or the Azure classic management portal:


- [Office 365 admin center - preview](activating-azure-rights-management-o365preview.md)
- [Office 365 admin center - classic](activating-azure-rights-management-0365classic.md)
- [Azure classic portal](activating-azure-rights-management-azure.md)

> [!TIP]
> You can also use the Windows PowerShell cmdlet, [Enable-Aadrm](http://msdn.microsoft.com/library/windowsazure/dn629412.aspx), to activate [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)].

## Configuring onboarding controls for a phased deployment
If you don’t want all users to be able to protect files immediately by using Azure RMS, you can configure user onboarding controls by using the [Set-AadrmOnboardingControlPolicy](http://msdn.microsoft.com/library/azure/dn857521.aspx) Windows PowerShell command. You can run this command before or after you activate Azure RMS.

> [!IMPORTANT]
> To use this command, you must have at least version **2.1.0.0** of the [Azure RMS Windows PowerShell module](http://go.microsoft.com/fwlink/?LinkId=257721).
>
> To check the version you have installed, run: **(Get-Module aadrm –ListAvailable).Version**

For example, if you initially want only administrators in the “IT department” group (that has an object ID of fbb99ded-32a0-45f1-b038-38b519009503) to be able to protect content for testing purposes, use the following command:

```
Set-AadrmOnboardingControlPolicy – SecurityGroupObjectId fbb99ded-32a0-45f1-b038-38b519009503
```
Note that for this configuration option, you must specify a group; you cannot specify individual users.

Or, if you want to ensure that only users who are correctly licensed to use Azure RMS can protect content:

```
Set-AadrmOnboardingControlPolicy -UseRmsUserLicense $true
```
When you use these onboarding controls, all users in the organization can always consume protected content that has been protected by your subset of users, but they won’t be able to apply information protection themselves from client applications. For example, they won’t see in their Office clients the default templates that are automatically published when Azure RMS is activated, or custom templates that you might configure.  Server-side applications, such as Exchange, can implement their own per-user controls for RMS-integration to achieve the same result.


## Next steps
Now that you’ve activated [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] for your organization, use the [Azure Rights Management deployment roadmap](../plan-design/azure-rights-management-deployment-roadmap.md) to check whether there are other configuration steps that you might need to do before you roll out [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] to users and administrators. 

For example, you might want to use [custom templates](configure-custom-templates-for-azure-rights-management.md) to make it easier for users to apply information protection to files, connect your on-premises servers to use [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] by installing the [RMS connector](deploying-the-azure-rights-management-connector.md), and deploy the [Rights Management sharing application](../rms-client/rights-management-sharing-application-for-windows.md) that supports protecting all file types on all devices. 

Office services, such as Exchange Online and SharePoint Online require additional configuration before you can use their Information Rights Management (IRM) features. 
For information about how your applications work with [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)], see [How applications support Azure Rights Management](../understand-explore/how-applications-support-azure-rights-management.md).

