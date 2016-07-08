---
# required metadata

title: Planning and implementing your Azure Rights Management tenant key | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 06/30/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: f0d33c5f-a6a6-44a1-bdec-5be1bc8e1e14

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Planning and implementing your Azure Rights Management tenant key

*Applies to: Azure Rights Management, Office 365*

Use the information in this article to help you plan for and manage your Rights Management (RMS) tenant key for Azure RMS. For example, instead of Microsoft managing your tenant key (the default), you might want to manage your own tenant key to comply with specific regulations that apply to your organization.  Managing your own tenant key is also referred to as bring your own key, or BYOK.

> [!NOTE]
> The RMS tenant key is also known as the Server Licensor Certificate (SLC) key. Azure RMS maintains one or more keys for each organization that subscribes to Azure RMS. Whenever a key is used for RMS within an organization (such as user keys, computer keys, document encryption keys), they cryptographically chain to your RMS tenant key.

**At a glance:** Use the following table as a quick guide to your recommended tenant key topology. Then, use the additional documentation for more information.

If you deploy Azure RMS by using a tenant key that is managed by Microsoft, you can change to BYOK later. However, you cannot currently change your Azure RMS tenant key from BYOK to managed by Microsoft.

|Business requirement|Recommended tenant key topology|
|------------------------|-----------------------------------|
|Deploy Azure RMS quickly and without requiring special hardware|Managed by Microsoft|
|Need full IRM functionality in Exchange Online with Azure RMS|Managed by Microsoft|
|Your keys are created by you and protected in a hardware security module (HSM)|BYOK<br /><br />Currently, this configuration will result in reduced IRM functionality in Exchange Online. For more information, see [BYOK pricing and restrictions](byok-price-restrictions.md).|

## Choose your tenant key topology: Managed by Microsoft (the default) or managed by you (BYOK)
Decide which tenant key topology is best for your organization. By default, Azure RMS generates your tenant key and manages most aspects of the tenant key lifecycle. This is the simplest option with the lowest administrative overheads. In most cases, you do not even need to know that you have a tenant key. You just sign up for Azure RMS and the rest of the key management process is handled by Microsoft.

Alternatively, you might want complete control over your tenant key, which involves creating your tenant key and keeping the master copy on your premises. This scenario is often referred to as bring your own key (BYOK). With this option, the following happens:

1.  You generate your tenant key on your premises, in line with your IT policies.

2.  You securely transfer the tenant key from a Hardware Security Module (HSM) in your possession to HSMs that are owned and managed by Microsoft. Throughout this process, your tenant key never leaves the hardware protection boundary.

3.  When you transfer your tenant key to Microsoft, it stays protected by Thales HSMs. Microsoft has worked with Thales to ensure that your tenant key cannot be extracted from Microsoft’s HSMs.

Although it’s optional, you will also probably want to use the near real-time usage logs from Azure RMS to see exactly how and when your tenant key is being used.

> [!NOTE]
> As an additional protection measure, Azure RMS uses separate security worlds for its data centers in North America, EMEA (Europe, Middle East and Africa), and Asia. When you manage your own tenant key, it is tied to the security world of the region in which your RMS tenant is registered. For example, a tenant key from a European customer cannot be used in data centers in North America or Asia.

## The tenant key lifecycle
If you decide that Microsoft should manage your tenant key, Microsoft handles most of the key lifecycle operations. However, if you decide to manage your tenant key, you are responsible for many of the key lifecycle operations and some additional procedures.

The following diagrams show and compares these two options. The first diagram shows how little administrator overheads there are for you in the default configuration when Microsoft manages the tenant key.

![Azure RMS tenant key lifecycle - managed by Microsoft, the default](../media/RMS_BYOK_cloud.png)

The second diagram shows the additional steps required when you manage your own tenant key.

![Azure RMS tenant key lifecycle - managed by you, BYOK](../media/RMS_BYOK_onprem.png)

If you decide to let Microsoft manage your tenant key, no further action is required for you to generate the key and you can go straight to [Next steps](plan-implement-tenant-key.md#next-steps).

If you decide to manage your tenant key yourself, read the following sections for more information.

## Implementing your Azure Rights Management tenant key

Use the information and procedures in this section if you have decided to generate and manage your tenant key; the bring your own key (BYOK) scenario:


> [!IMPORTANT]
> If you have already started to use [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] (the service is activated) and you have users who run Office 2010, [contact Microsoft Support](../get-started/information-support.md#to-contact-microsoft-support) before you run these procedures. Depending on your scenario and requirements, you can still use BYOK but with some limitations or additional steps.
> 
> Also [contact Microsoft Support](../get-started/information-support.md#to-contact-microsoft-support) if your organization has specific policies for handling keys.

### Prerequisites for BYOK
See the following table for a list of prerequisites for bring your own key (BYOK).

|Requirement|More information|
|---------------|--------------------|
|A subscription that supports Azure RMS.|For more information about the available subscriptions, see [Cloud subscriptions that support Azure RMS](../get-started/requirements-subscriptions.md).|
|You do not use RMS for individuals or Exchange Online. Or, if you use Exchange Online, you understand and accept the limitations of using BYOK with this configuration.|For more information about the restrictions and current limitations for BYOK, see [BYOK pricing and restrictions](byok-price-restrictions.md).<br /><br />**Important**: Currently, BYOK is not compatible with Exchange Online.|
|Thales HSM, smartcards, and support software.<br /><br />**Note**: If you are migrating from AD RMS to Azure RMS by using software key to hardware key, you must have a minimum version of 11.62 for the Thales drivers.|You must have access to a Thales Hardware Security Module and basic operational knowledge of Thales HSMs. See [Thales Hardware Security Module](http://www.thales-esecurity.com/msrms/buy) for the list of compatible models, or to purchase an HSM if you do not have one.|
|If you want to transfer your tenant key over the Internet rather than physically be present in Redmond, USA. there are 3 requirements:<br /><br />1: An offline x64 workstation with a minimum Windows operation system of Windows 7 and Thales nShield software that is at least version 11.62.<br /><br />If this workstation runs Windows 7, you must [install Microsoft .NET Framework 4.5](http://go.microsoft.com/fwlink/?LinkId=225702).<br /><br />2: A workstation that is connected to the Internet and has a minimum Windows operation system of Windows 7.<br /><br />3: A USB drive or other portable storage device that has at least 16 MB free space.|These prerequisites are not required if you travel to Redmond and transfer your tenant key in person.<br /><br />For security reasons, we recommend that the first workstation is not connected to a network. However, this is not programmatically enforced.<br /><br />Note: In the instructions that follow, this first workstation is referred to as the **disconnected workstation**.<br /><br />In addition, if your tenant key is for a production network, we recommend that you use a second, separate workstation to download the toolset and upload the tenant key. But for testing purposes, you can use the same workstation as the first one.<br /><br />Note: In the instructions that follow, this second workstation is referred to as the **Internet-connected workstation**.|

The procedures to generate and use your own tenant key depend on whether you want to do this over the Internet or in person:

-   **Over the Internet:** This requires some extra configuration steps, such as downloading and using a toolset and Windows PowerShell cmdlets. However, you do not have to physically be in a Microsoft facility to transfer your tenant key. Security is maintained by the following methods:

    -   You generate the tenant key from an offline workstation, which reduces the attack surface.

    -   The tenant key is encrypted with a Key Exchange Key (KEK), which stays encrypted until it is transferred to the Azure RMS HSMs. Only the encrypted version of your tenant key leaves the original workstation.

    -   A tool sets properties on your tenant key that binds your tenant key to the Azure RMS security world. So after the Azure RMS HSMs receive and decrypt your tenant key, only these HSMs can use it. Your tenant key cannot be exported. This binding is enforced by the Thales HSMs.

    -   The Key Exchange Key (KEK) that is used to encrypt your tenant key is generated inside the Azure RMS HSMs and is not exportable. The HSMs enforce that there can be no clear version of the KEK outside the HSMs. In addition, the toolset includes attestation from Thales that the KEK is not exportable and was generated inside a genuine HSM that was manufactured by Thales.

    -   The toolset includes attestation from Thales that the Azure RMS security world was also generated on a genuine HSM manufactured by Thales. This proves to you that Microsoft is using genuine hardware.

    -   Microsoft uses separate KEKs as well as separate Security Worlds in each geographical region, which ensures that your tenant key can be used only in data centers in the region in which you encrypted it. For example, a tenant key from a European customer cannot be used in data centers in North American or Asia.

    > [!NOTE]
    > Your tenant key can safely move through untrusted computers and networks because it is encrypted and secured with access control level permissions, which makes it usable only within your HSMs and Microsoft’s HSMs for Azure RMS. You can use the scripts that are provided in the toolset to verify the security measures and read more information about how this works from Thales: [Hardware Key management in the RMS Cloud](https://www.thales-esecurity.com/knowledge-base/white-papers/hardware-key-management-in-the-rms-cloud).

-   **In person:** This requires that you [contact Microsoft Support](../get-started/information-support.md#to-contact-microsoft-support) to schedule a key transfer appointment for Azure RMS. You must travel to a Microsoft office in Redmond, Washington, United States of America to transfer your tenant key to the Azure RMS security world.

For how-to instructions, select whether you will generate and transfer your tenant key over the Internet or in person: 

- [Over the Internet](generate-tenant-key-internet.md)
- [In person](generate-tenant-key-in-person.md)


## Next steps

Now that you've planned for and if necessary, generated your tenant key, do the following:

1.  Start to use your tenant key:

    -   If you haven’t already done so, you must now activate Rights Management so that your organization can start to use RMS. Users immediately start to use your tenant key (managed by Microsoft or managed by you).

        For more information about activation, see [Activating Azure Rights Management](../deploy-use/activate-service.md).

    -   If you had already activated Rights Management and then decided to manage your own tenant key, users gradually transition from the old tenant key to the new tenant key, and this staggered transition can take a few weeks to complete. Documents and files that were protected with the old tenant key remains accessible to authorized users.

2.  Consider using usage logging, which logs every transaction that RMS performs.

    If you decided to manage your own tenant key, logging includes information about using your tenant key. See the following snippet from a log file displayed in Excel where the **KMSPDecrypt** and **KMSPSignDigest** request types show that the tenant key is being used.

    ![log file in Excel where tenant key is being used](../media/RMS_Logging.png)

    For more information about usage logging, see [Logging and analyzing Azure Rights Management usage](../deploy-use/log-analyze-usage.md).

3.  Maintain your tenant key.

    For more information, see [Operations for your Azure Rights Management tenant key](../deploy-use/operations-tenant-key.md).

