---
# required metadata

title: Migrate Azure Information Protection labels to the Office 365 Security & Compliance Center
description: Migrate Azure Information Protection labels to the Office 365 Security & Compliance Center for client that support unified labeling. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 10/11/2018
ms.topic: article
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: demizets
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# How to migrate Azure Information Protection labels to the Office 365 Security & Compliance Center

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](http://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

> [!IMPORTANT]
> This feature is in preview, and migrates your tenant to a new platform that is also in preview. The migration cannot be reversed. The new platform supports unified labeling so that labels that you create and manage can be used by multiple clients and services.

Migrate your labels if you want to be able to use them in the Office 365 Security & Compliance Center, where they can be published and then downloaded by [clients that support unified labeling](#clients-that-support-unified-labeling). The Azure Information Protection client continues to download the labels with their Azure Information Protection policy from the Azure portal. 

After you have migrated your labels, you can then make changes to them in the Azure portal or the Office 365 Security & Compliance Center, and the respective clients will download the same change.

## Considerations for unified labels

Before you migrate your labels, make sure that you are aware of the following changes and considerations:

- Not all clients currently support unified labels. Make sure that you have [supported clients](#clients-that-support-unified-labeling) and be prepared for administration in both the Azure portal (for clients that don't support unified labels) and the Security & Compliance Center (for client that do support unified labels).

- If you are in the middle of defining and configuring the labels that you want to use, we recommend that you complete this process by using the Azure portal, and then migrate the labels. This strategy avoids duplicating labels during the migration process, that will then need to be edited in the Security & Compliance Center.

- Policies, including policy settings and who has access to them (scoped policies), and all advanced client settings are not migrated. For these changes that are not migrated, you will need to configure the relevant options in the Security & Compliance Center after the labels are migrated.
    
    For a more consistent user experience, we recommend you publish the same labels in the same scopes in the Security & Compliance Center.

- Not all settings from a migrated label are supported by the Security & Compliance Center. Use the table in the [Label settings that are not supported in the Security & Compliance Center](#label-settings-that-are-not-supported-in-the-security--compliance-center) section to help you identify these settings and whether you should exclude the migrated labels from publishing in the Security & Compliance Center.

- Protection templates:
    
    - Templates that use a cloud-based key and that are part of a label configuration are also migrated with the label. Other protection templates are not migrated. 
    
    - After a label with cloud-based protection settings has been migrated, the resulting scope of the protection template is the scoped that is defined in the Azure portal (or by using the ADDRM PowerShell module) and the scope that is defined in the Security & Compliance Center. 

- When you migrate your labels, you will see the migration results display whether a label was **created**, **updated**, or **renamed** because of duplication:

    - When a label is created, you must then publish it in the Security & Compliance Center to make it available to applications and services.
    
    - When a label is renamed, you must then edit it, which you can do in the Security & Compliance Center or the Azure portal. 

- For each label, the Azure portal displays only the label display name, which you can edit. The Security & Compliance Center shows both this display name for a label, and the label name. The label name is the initial name that you specified when the label was first created and this property is used by the back-end service for identification purposes.

- Any localized strings for the labels are not migrated. You must define new localized strings for the migrated labels in the Security & Compliance Center.

- After the migration, when you edit a migrated label in the Azure portal, the same change is automatically reflected in the Security & Compliance Center. However, when you edit a migrated label in the Security & Compliance Center, you must then update the label in the Azure portal for the label to pick up the change. For example, edit the **Add notes for administrator use** box on the **Label** blade. 

- Unified labeling is still rolling out to tenants. If it's not yet supported for your tenant, the migration will not succeed and gracefully undo any changes. Until it's supported for all tenants, you must use a special link to access the option to migrate your tenant and labels. This link is provided in the instructions that follow.

### Label settings that are not supported in the Security & Compliance Center

Use the following table to identify which configuration settings of a migrated label are not supported for clients that use these labels, and whether you should edit and publish the migrated label in the Security & Compliance Center. If you publish labels that are identified to be excluded from publishing, no labels display for the clients that support unified labeling.

Azure Information Protection clients can use these label settings without any problems because they continue to download the labels from the Azure portal.

|Label configuration|Supported in the Security & Compliance Center|Exclude from editing and publishing in the Security & Compliance Center|
|-------------------|---------------------------------------------|-------------------------|
|Status of enabled or disabled<br /><br />Notes: Not synchronized to the Security & Compliance Center |Not applicable|Not applicable|
|Label color: Select from list or specify by using RGB code<br /><br />Notes: Label colors are not supported by the Security & Compliance Center |Not applicable|Not applicable|
|Cloud-based protection or HYOK-based protection using a predefined template |No|Yes|
|Cloud-based protection using user-defined permissions in Word, Excel, and PowerPoint |No|Yes|
|HYOK-based protection using user-defined permissions in Outlook for Do Not Forward |No|Yes|
|Remove protection |No|Yes|
|Visual markings (header, footer, watermark): Custom font and custom font color by RGB code|No|Recommended if you use variables<br /><br />- On clients, variables display as text rather than display the dynamic values|
|Visual markings per app|No|Recommended if you use variables<br /><br />- On clients, variables display as text rather than display the dynamic values|
|Conditions and associated settings <br /><br />Notes: Includes automatic and recommended labeling, and their tooltips|Not applicable|No|


## To migrate Azure Information Protection labels

> [!IMPORTANT]
> Do not migrate your labels until you have confirmed that you can edit and publish sensitivity labels in the Office 365 Security & Compliance Center. Sensitivity labels are starting to roll out to Office 365 tenants but are not yet available for all tenants.
> 
> To check: From the Office 365 Security & Compliance Center, go to **Classifications** > **Labels**, and see whether you have a **Sensitivity** tab. If you do not see this tab, your tenant is not yet ready for sensitivity labels and you should not migrate your Azure Information Protection labels at this time.

When you have confirmed that your tenant supports sensitivity labels in the Security & Compliance Center, use the following instructions to migrate your tenant and  Azure Information Protection labels.

1. Open a new browser window and sign in to the Azure portal by using the following link: https://portal.azure.com/?ActivateMigration=true#blade/Microsoft_Azure_InformationProtection/DataClassGroupEditBlade/migrationActivationBlade 

2. On the **Azure Information Protection - Unified labeling** blade, select **Activate** and follow the online instructions.

For the labels that successfully migrated, they can now be used by [clients that support unified labeling](#clients-that-support-unified-labeling). However, you must first publish these labels in the Security & Compliance Center.


### Clients that support unified labeling

The clients that currently support unified labeling include:

- Apps from the Office Insiders program. For more information, see the [Where the feature is available today?](https://support.office.com/article/2f96e7cd-d5a4-403b-8bd7-4cc636bae0f9?ad=US#bkmk_whereavailable) section from the Office documentation.
    
- Clients from software vendors and developers that use the [MIP SDK](https://docs.microsoft.com/azure/information-protection/develop/mip/mip-sdk-reference).


## Next steps

For more information about configuring and publishing your migrated labels in the Office 365 Security & Compliance Center, see the blog post, [Announcing the availability of unified labeling management in the Security & Compliance Center](https://techcommunity.microsoft.com/t5/Security-Privacy-and-Compliance/Announcing-the-availability-of-unified-labeling-management-in/ba-p/262492).