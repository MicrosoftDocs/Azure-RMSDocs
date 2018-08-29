---
# required metadata

title: Migrate Azure Information Protection labels to the Office 365 Security & Compliance Center
description: Migrate Azure Information Protection labels to the Office 365 Security & Compliance Center for unified labeling with MIP clients. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 09/xx/2018
ms.topic: article
ms.service: information-protection
ms.assetid: xxx

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

After you have migrated your labels, you can then make changes to them in the Azure portal or the Security & Compliance Center, and the respective clients will download the same change.

## Considerations for unified labels

Before you migrate your labels, make sure that you are aware of the following changes and considerations:

- Not all clients currently support unified labels. Make sure that you have [supported clients](#clients-that-support-unified-labeling) and be prepared for administration in both the Azure portal (for clients that don't support unified labels) and the Security & Compliance Center (for client that do support unified labels).

- If you are in the middle of defining and configuring the labels that you want to use, we recommend that you complete this process by using the Azure portal, and then migrate the labels. This strategy avoids duplicating labels during the migration process, that will then need to be edited in the Security & Compliance Center.

- All the configuration of a label is migrated, except for conditions and protection settings that use [HYOK protection](configure-adrms-restrictions.md). Policies, including policy settings and who has access to them (scoped policies) are not migrated. For the changes that are not migrated, you will need to configure the relevant options in the Security & Compliance Center after the labels are migrated.
    
    For a more consistent user experience, we recommend you publish the same labels in the same scopes in the Security & Compliance Center.

- Protection templates:
    
    - Templates that use a cloud-based key and that are part of a label configuration are also migrated with the label. Other protection templates are not migrated. 
        
    - If you migrate a label that is configured for HYOK protection, the label is migrated without the protection settings.
    
    - After a label with cloud-based protection settings has been migrated, the resulting scope of the protection template is the scoped that is defined in the Azure portal (or by using the ADDRM PowerShell module) and the scope that is defined in the Security & Compliance Center. 

- When you migrate your labels, you will see the migration results display whether a label was **created**, **updated**, or **renamed** because of duplication:

    - When a label is created, you must then publish it in the Security & Compliance Center to make it available to applications and services.
    
    - When a label is renamed, you must then edit it in the Security & Compliance Center. 

- For each label, the Azure portal displays only the label display name, which you can edit. The Security & Compliance Center shows both this display name for a label, and the label name. The label name is the initial name that you specified when the label was first created and this property is used by the back-end service for identification purposes.

- Any localized strings for the labels are not migrated. You must define new localized strings for the migrated labels in the Security & Compliance Center.

- After the migration, when you edit a migrated label in the Azure portal, the same change is automatically reflected in the Security & Compliance Center. However, when you edit a migrated label in the Security & Compliance Center, you must then update the label in the Azure portal for the label to pick up the change. For example, edit the **Add notes for administrator use** box on the **Label** blade. 

- Unified labeling is still rolling out to tenants. If it's not yet supported for your tenant, the migration will not succeed and gracefully undo any changes. Until it's supported for all tenants, you must use a special link to access the option to migrate your tenant and labels. This link is provided in the instructions that follow.

## To migrate Azure Information Protection labels

Use the following instructions to migrate your tenant and labels.

1. Open a new browser window and sign in to the Azure portal by using the following link: https://portal.azure.com/?ActivateMigration=true#blade/Microsoft_Azure_InformationProtection/DataClassGroupEditBlade/migrationActivationBlade 

2. On the **Azure Information Protection - Unified MIP labeling** blade, select **Activate** and follow the online instructions.

For the labels that successfully migrate, they can now be used by [clients that support unified labeling](#clients-that-support-unified-labeling) when these labels are published in the Security & Compliance Center.


### Clients that support unified labeling

The clients that currently support unified labeling include:

- MacOS computers that use Office for Mac 2016 (public preview)

- Clients from software vendors and developers that use the [MIP SDK](https://docs.microsoft.com/azure/information-protection/develop/mip/mip-sdk-reference)


## Next steps



