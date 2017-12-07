---
# required metadata

title: Prepare the environment for Azure RMS and AD RMS
description: Guidance if you have Azure Rights Management with AD RMS deployed.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 01/01/2018
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 11ffa730-c5dc-4b6b-9c1e-c58eff8aafc2

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Preparing the environment for Azure Rights Management when you also have Active Directory Rights Management Services (AD RMS)

>*Applies to: Azure Information Protection, Office 365*

Important guidance if you are already using Active Directory Rights Management Services (AD RMS) and either of the following scenarios apply:

- [Your subscription that includes Azure Rights Management was purchased after x](#your-subscription-was-purchased-after-x).

- [You see an option to activate protection when you configure your Azure Information Protection policy in the Azure portal](#you-see-an-option-to activate-azure-rights-management-when-you-configure-azure-information-protection)

## Your subscription was purchased after x

If your subscription that includes Azure Rights Management was purchased after 1st January, 2018, the Azure Rights Management service is activated by default. If you are also using Active Directory Rights Management Services (AD RMS), this combination isn't compatible. Without additional steps, some computers might automatically start using the Azure Rights Management service and also connect to your AD RMS cluster. This scenario isn't supported and has unreliable results, so it's important that you deactivate the Azure Rights Management service as soon as possible. 

When you are ready to move computers from AD RMS to the Azure Rights Management service, you can start the migration process. One of the steps in the migration is to re-activate the service but you do this after you have exported configuration information from AD RMS to the Azure Rights Management service. This ensures that documents and emails that were protected by AD RMS can still be opened.

Your first step is to deactivate the Azure Rights Management service.

### Step One: Deactivate Azure Rights Management
Use one of the following procedures to deactivate [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)].

> [!TIP]
> You can also use the Windows PowerShell cmdlet, [Disable-Aadrm](http://msdn.microsoft.com/library/windowsazure/dn629422.aspx), to deactivate [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)].

#### To deactivate Rights Management from the Office 365 admin center

1. Go to the [Rights Management page](https://account.activedirectory.windowsazure.com/RmsOnline/Manage.aspx) for Office 365 administrators.
    
    If you are prompted to sign in, use an account that is a global administrator for Office 365.

2. On the **rights management** page, click **deactivate**.

3.  When prompted **Do you want to deactivate Rights Management?**, click **deactivate**.

You should now see **Rights Management is not activated** and the option to activate.

#### To deactivate Rights Management from the Azure portal

1. If you haven't already done so, open a new browser window and sign in to the [Azure portal](https://portal.azure.com) as a security admin or global admin. Then navigate to the **Azure Information Protection** blade.
    
    For example, on the hub menu, click **More services** and start typing **Information** in the Filter box. Select **Azure Information Protection**.
    
    If you haven't accessed the Azure Information Protection blade before, see the one-time [additional steps](configure-policy.md#to-access-the-azure-information-protection-blade-for-the-first-time) to add this blade to the portal.

2. On the initial **Azure Information Protection** blade, select **Protection activation**. 

3.  On the **Azure Information Protection - Protection activation** blade, select **Deactivate**. Select **Yes** to confirm your choice.

The information bar displays **Deactivation finished successfully** and **Deactivate** is now replaced with **Activate**. 

### Step Two: Start planning for migration

See the migration guidance: [Migrating from AD RMS to Azure Information Protection](../plan-design/migrate-from-ad-rms-to-azure-rms.md).

## You see an option to activate protection when you configure Azure Information Protection

The **Azure Information Protection - Protection activation** blade has an option to activate the Azure Rights Management service (Azure RMS).  

If you are also using Active Directory Rights Management Services (AD RMS), do not select the **Activate** option. Activating Azure Rights Management when you also have AD RS isn't a compatible combination. This scenario isn't supported and has unreliable results, so it's important that you do not activate Azure Rights Management at this time.  

When you are ready to move computers from AD RMS to the Azure Rights Management service, you can start a migration process. One of the steps in the migration is to activate the service but you do this after you have exported configuration information from AD RMS to the Azure Rights Management service. This process ensures that documents and emails that were protected by AD RMS can still be opened. 

When the Azure Rights Management service isn't activated, you can still use Azure Information Protection for labels that apply classification only. A special default policy is created for you that does not include data protection and those configuration options remain unavailable until the Azure Rights Management service is activated.

### Step One: Configure your Azure Information Protection policy for classification and labeling - without protection

From the initial **Azure Information Protection** blade, select **Global policy** to view and configure your default policy that does not include options for data protection. For more information, see [Configuring Azure Information Protection policy](configure-policy.md).

### Step Two: Start planning for migration

See the migration guidance: [Migrating from AD RMS to Azure Information Protection](../plan-design/migrate-from-ad-rms-to-azure-rms.md).

### Step Three: Start to configure labels for protection

After you have activated the Azure Rights Management service as part of the migration process, you can configure labels for data protection. However, if you migrate users in batches, make sure that labels that apply protection are scoped to migrated users only.

[!INCLUDE[Commenting house rules](../includes/houserules.md)]

