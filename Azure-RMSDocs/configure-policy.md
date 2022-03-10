---
# required metadata

title: Configure the Azure Information Protection policy - AIP
description: To configure classification, labeling, and protection for the Azure Information Protection classic client, you must configure the Azure Information Protection policy. 
author: batamig
ms.author: bagol
ms.date: 08/17/2020
manager: rkarlin
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: ba0e8119-886c-4830-bd26-f98fb14b2933
ROBOTS: NOINDEX


# optional metadata

#audience:
#ms.devlang:
ms.subservice: aiplabels
ms.reviewer: eymanor
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Configuring the Azure Information Protection policy

>***Applies to** Azure Information Protection*
>
>***Relevant for**: [Azure Information Protection classic client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients). For the unified labeling client, see [Learn about sensitivity labels](/microsoft-365/compliance/sensitivity-labels) from the Microsoft 365 documentation.*

[!INCLUDE [AIP classic client is sunset - extended support customers](includes/classic-client-sunset-extended-support.md)]

To configure classification, labeling, and protection for the classic client, you must configure the Azure Information Protection policy. This policy is then downloaded to computers that have installed the Azure Information Protection client.

The policy contains labels and settings:

- Labels apply a classification value to documents and emails, and can optionally protect this content. The Azure Information Protection client displays these labels for your users in Office apps and when users right-click from File Explorer. These labels can also be applied by using PowerShell and the Azure Information Protection scanner.

- The settings change the default behavior of the Azure Information Protection client. For example, you can select a default label, whether all documents and emails must have a label, and whether the Azure Information Protection bar is displayed in Office apps.

## Subscription support

Azure Information Protection supports different levels of subscriptions:

- Azure Information Protection P2: Support for all classification, labeling, and protection features.

- Azure Information Protection P1: Support for most classification, labeling, and protection features, but not automatic classification or HYOK.

- Microsoft 365 that includes the Azure Rights Management service: Support for protection but not classification and labeling.

Options that require an Azure Information Protection P2 subscription are identified in the portal.

If your organization has a mix of subscriptions, it is your responsibility to make sure that users do not use features that their account is not licensed to use. The Azure Information Protection client does not do license checking and enforcement. When you configure options that not all users have a license for, use scoped policies or a registry setting to ensure that your organization stays in compliance with your licenses:

- **When your organization has a mix of Azure Information Protection P1 and Azure Information Protection P2 licenses**: For users who have a P2 license, create and use one or more [scoped policies](configure-policy-scope.md) when you configure options that require an Azure Information Protection P2 license. Make sure that your global policy does not contain options that require an Azure Information Protection P2 license.

- **When your organization has a subscription for Azure Information Protection but some users have only a license for Microsoft 365 that includes the Azure Rights Management service**: For the users who do not have a license for Azure Information Protection, edit the registry on their computers so they do not download the Azure Information Protection policy. For instructions, see the admin guide for the following customization: [Enforce protection-only mode when your organization has a mix of licenses](./rms-client/client-admin-guide-customizations.md#enforce-protection-only-mode-when-your-organization-has-a-mix-of-licenses).

For more information about the subscriptions, see [What subscription do I need for Azure Information Protection and what features are included?](faqs.md#what-subscription-do-i-need-for-azure-information-protection-and-what-features-are-included)

## Signing in to the Azure portal

To sign in to the Azure portal, to configure and manage Azure Information Protection:

- Use the following link: https://portal.azure.com

- Use an Azure AD account that has one of the following [administrator roles](/azure/active-directory/active-directory-assign-admin-roles-azure-portal):
    
    - **Azure Information Protection administrator**
    
  - **Compliance administrator**
    
  - **Compliance data administrator**
    
  - **Security administrator**
    
    **Security reader** - [Azure Information Protection analytics](reports-aip.md) only
    
    **Global reader** - [Azure Information Protection analytics](reports-aip.md) only
    
  - **Global administrator**
    
    > [!NOTE] 
    > If your tenant is on the [unified labeling platform](faqs.md#how-can-i-determine-if-my-tenant-is-on-the-unified-labeling-platform), the Azure Information Protection administrator role (formerly "Information Protection administrator") is not supported for the Azure portal. [More information](configure-policy-migrate-labels.md#administrative-roles-that-support-the-unified-labeling-platform)
    
    Microsoft accounts cannot manage Azure Information Protection.

## To access the Azure Information Protection pane for the first time

1. Sign in to the Azure portal.

2. Select **+ Create a resource**, and then, from the search box for the Marketplace, type **Azure Information Protection**. 
    
3. From the results list, select **Azure Information Protection**. On the **Azure Information Protection** pane, click **Create**.
    
    > [!TIP] 
    > Optionally, select **Pin to dashboard** to create an **Azure Information Protection** tile on your dashboard, so that you can skip browsing to the service the next time you sign in to the portal.
    
    Click **Create** again.

4. You see the **Quick start** page that automatically opens the first time you connect to the service. Browse the suggested resources, or use the other menu options. To configure the labels that users can select, use the following procedure.

Next time you access the **Azure Information Protection** pane, it automatically selects the **Labels** option so that you can view and configure labels for all users. You can return to the **Quick start** page by selecting it from the **General** menu.

## How to configure the Azure Information Protection policy

1. Make sure that you are signed in to the Azure portal by using one of these administrative roles: Azure Information Protection administrator, Security administrator, or Global administration. See the [preceding section](#signing-in-to-the-azure-portal) for more information about these administrative roles.

2. If necessary, navigate to the **Azure Information Protection** pane: For example, on the hub menu, click **All services** and start typing **Information Protection** in the Filter box. From the results, select **Azure Information Protection**. 
    
    The **Azure Information Protection - Labels** pane automatically opens for you to view and edit the available labels. The labels can be made available to all users, selected users, or no users by adding or removing them from a policy.

3. To view and edit the policies, select **Policies** from the menu options. To view and edit the policy that all users get, select the **Global** policy. To create a custom policy for selected users, select **Add a new policy**.
    

### Making changes to the policy

You can create any number of labels. However, when they start to get too many for users to easily see and select the right label, create scoped policies so that users see only the labels that are relevant to them. There is an upper limit for labels that apply protection, which is 500.

When you make any changes on an Azure Information Protection pane, click **Save** to save the changes, or click **Discard** to revert to the last saved settings. When you save changes in a policy, or make changes to labels that are added to policies, those changes are automatically published. There's no separate publish option.

The Azure Information Protection client checks for any changes whenever a supported Office application starts, and downloads the changes as its latest Azure Information Protection policy. Additional triggers that refresh the policy on the client:

- Right-click to classify and protect a file or folder.

- Running the [PowerShell cmdlets](./rms-client/client-admin-guide-powershell.md) for labeling and protection (Get-AIPFileStatus, Set-AIPFileClassification, and Set-AIPFileLabel).

- Every 24 hours.

- For the [Azure Information Protection Scanner](deploy-aip-scanner.md): When the service starts (if the policy is older than an hour), and every hour during operation.


>[!NOTE]
>When the client downloads the policy, be prepared to wait a few minutes before it's fully operational. The actual time varies, according to factors such as the size and complexity of the policy configuration, and the network connectivity. If the resulting action of your labels does not match your latest changes, allow up to 15 minutes and then try again.

### Configuring your organization's policy

Use the following information to help you configure the Azure Information Protection policy:

- [The default Information Protection policy](configure-policy-default.md)

- [How to configure the policy settings](configure-policy-settings.md)

- [How to create a new label](configure-policy-new-label.md)

- [How to add or remove a label](configure-policy-add-remove-label.md)
 
- [How to delete or reorder a label](configure-policy-delete-reorder.md)

- [How to change or customize an existing label](configure-policy-change-label.md)

- [How to configure a label for protection](configure-policy-protection.md)

- [How to configure a label to apply visual markings](configure-policy-markings.md)

- [How to configure conditions for automatic and recommended classification](configure-policy-classification.md)

- [How to configure the policy for specific users by using scoped policies](configure-policy-scope.md)

- [How to configure and manage templates](configure-policy-templates.md)

- [How to configure labels for different languages](configure-policy-languages.md)

- [How to migrate Azure Information Protection labels to Microsoft 365](configure-policy-migrate-labels.md)

## Label information stored in emails and documents

When a label is applied to a document or email, under the covers, the label is stored in metadata so that applications and services can read the label:

- In emails, this information is stored in the x-header: **msip_labels: MSIP_Label_\<GUID>_Enabled=True** 

- For Word documents (.doc and .docx), Excel spreadsheets (.xls and .xlsx), PowerPoint presentations (.ppt and .pptx), and PDF documents, this metadata is stored in the following custom property: **MSIP_Label_\<GUID>_Enabled=True**

For emails, the label information is stored when the email is sent. For documents, the label information is stored when the file is saved. 

To identify the GUID for a label, locate the Label ID value on the **Label** pane in the Azure portal, when you view or configure the Azure Information Protection policy. For files that have labels applied, you can also run the [Get-AIPFileStatus](/powershell/module/azureinformationprotection/get-aipfilestatus) PowerShell cmdlet to identify the GUID (MainLabelId or SubLabelId). When a label has sublabels, always specify the GUID of just a sublabel and not the parent label.

## Next steps

For examples of how to customize the Azure Information Protection policy, and see the resulting behavior for users, try the following tutorials:

- [Edit the Azure Information Protection policy and create a new label](infoprotect-quick-start-tutorial.md)

- [Configure Azure Information Protection policy settings that work together](infoprotect-settings-tutorial.md)

To see how your policy is performing, see [Central reporting for Azure Information Protection](reports-aip.md).