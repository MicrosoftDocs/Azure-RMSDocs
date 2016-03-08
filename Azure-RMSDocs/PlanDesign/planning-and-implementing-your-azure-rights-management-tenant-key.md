---
title: Planning and implementing your Azure Rights Management tenant key
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: f0d33c5f-a6a6-44a1-bdec-5be1bc8e1e14
author: Cabailey
---
# Planning and Implementing Your Azure Rights Management Tenant Key
Use the information in this article to help you plan for and manage your Rights Management (RMS) tenant key for Azure RMS. For example, instead of Microsoft managing your tenant key (the default), you might want to manage your own tenant key to comply with specific regulations that apply to your organization.  Managing your own tenant key is also referred to as bring your own key, or BYOK.

> [!NOTE]
> The RMS tenant key is also known as the Server Licensor Certificate (SLC) key. Azure RMS maintains one or more keys for each organization that subscribes to Azure RMS. Whenever a key is used for RMS within an organization (such as user keys, computer keys, document encryption keys), they cryptographically chain to your RMS tenant key.

**At a glance:** Use the following table as a quick guide to your recommended tenant key topology. Then, use the additional documentation for more information.

If you deploy Azure RMS by using a tenant key that is managed by Microsoft, you can change to BYOK later. However, you cannot currently change your Azure RMS tenant key from BYOK to managed by Microsoft.

|Business requirement|Recommended tenant key topology|
|------------------------|-----------------------------------|
|Deploy Azure RMS quickly and without requiring special hardware|Managed by Microsoft|
|Need full IRM functionality in Exchange Online with Azure RMS|Managed by Microsoft|
|Your keys are created by you and protected in a hardware security module (HSM)|BYOK<br /><br />Currently, this configuration will result in reduced IRM functionality in Exchange Online. For more information, see [BYOK pricing and restrictions](byok-pricing-and-restrictions).|

## <a name="BKMK_ChooseTenantKey"></a>Choose your tenant key topology: Managed by Microsoft (the default) or managed by you (BYOK)
Decide which tenant key topology is best for your organization. By default, Azure RMS generates your tenant key and manages most aspects of the tenant key lifecycle. This is the simplest option with the lowest administrative overheads. In most cases, you do not even need to know that you have a tenant key. You just sign up for Azure RMS and the rest of the key management process is handled by Microsoft.

Alternatively, you might want complete control over your tenant key, which involves creating your tenant key and keeping the master copy on your premises. This scenario is often referred to as bring your own key (BYOK). With this option, the following happens:

1.  You generate your tenant key on your premises, in line with your IT policies.

2.  You securely transfer the tenant key from a Hardware Security Module (HSM) in your possession to HSMs that are owned and managed by Microsoft. Throughout this process, your tenant key never leaves the hardware protection boundary.

3.  When you transfer your tenant key to Microsoft, it stays protected by Thales HSMs. Microsoft has worked with Thales to ensure that your tenant key cannot be extracted from Microsoft’s HSMs.

Although it’s optional, you will also probably want to use the near real-time usage logs from Azure RMS to see exactly how and when your tenant key is being used.

> [!NOTE]
> As an additional protection measure, Azure RMS uses separate security worlds for its data centers in North America, EMEA (Europe, Middle East and Africa), and Asia. When you manage your own tenant key, it is tied to the security world of the region in which your RMS tenant is registered. For example, a tenant key from a European customer cannot be used in data centers in North America or Asia.

## <a name="BKMK_OverviewLifecycle"></a>The tenant key lifecycle
If you decide that Microsoft should manage your tenant key, Microsoft handles most of the key lifecycle operations. However, if you decide to manage your tenant key, you are responsible for many of the key lifecycle operations and some additional procedures.

The following diagrams show and compares these two options. The first diagram shows how little administrator overheads there are for you in the default configuration when Microsoft manages the tenant key.

![](./media/RMS_BYOK_cloud.png)

The second diagram shows the additional steps required when you manage your own tenant key.

![](./media/RMS_BYOK_onprem.png)

If you decide to let Microsoft manage your tenant key, no further action is required for you to generate the key and you can go straight to [Next steps](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_NextSteps).

If you decide to manage your tenant key yourself, read the following sections for more information.


## <a name="BKMK_NextSteps"></a>Next steps

If you decide to manage your tenant key yourself, use the how-to instructions in [Implementing your Azure Rights management tenant key](implementing-your-azure-rights-management-tenant-key.md).

If you decide to let Microsoft manage your tenant key, no further action is required for you to generate the key.

Then, do the following:

1.  Start to use your tenant key:

    -   If you haven’t already done so, you must now activate Rights Management so that your organization can start to use RMS. Users immediately start to use your tenant key (managed by Microsoft or managed by you).

        For more information about activation, see [Activating Azure Rights Management](activating-azure-rights-management.md).

    -   If you had already activated Rights Management and then decided to manage your own tenant key, users gradually transition from the old tenant key to the new tenant key, and this staggered transition can take a few weeks to complete. Documents and files that were protected with the old tenant key remains accessible to authorized users.

2.  Consider using usage logging, which logs every transaction that RMS performs.

    If you decided to manage your own tenant key, logging includes information about using your tenant key. See the following example of a log file displayed in Excel where the **Decrypt** and **SignDigest** Request Types show that the tenant key is being used.

    ![](./media/RMS_Logging.gif)

    For more information about usage logging, see [Logging and Analyzing Azure Rights Management Usage](logging-and-analyzing-azure-rights-management-usage.md).

3.  Maintain your tenant key.

    For more information, see [Operations for Your Azure Rights Management Tenant Key](operations-for-your-azure-rights-management-tenant-key.md).

