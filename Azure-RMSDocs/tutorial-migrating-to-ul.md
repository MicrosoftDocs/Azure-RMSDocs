---
# required metadata

title: Tutorial - Migrating from the Azure Information Protection (AIP) classic client to the unified labeling solution
description: A step-by-step tutorial for migrating from the Azure Information Protection (AIP) classic client to the unified labeling client.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 10/19/2020
ms.topic: tutorial
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: aiplabels
#ms.reviewer: elina.kaminsky
#ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Tutorial: Migrating from the Azure Information Protection (AIP) classic client to unified labeling solution

>***Applies to**: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*
>
> ***Relevant for**: [Azure Information Protection classic client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

> [!NOTE]
> To provide a unified and streamlined customer experience, Azure Information Protection's classic client and Label Management in the Azure portal are being deprecated as of March 31, 2021.
> 
> This time frame enables all current Azure Information Protection classic client customers to transition to the AIP unified labeling, which uses Microsoft Information Protection's Unified Labeling solution. Learn more in the official [deprecation notice](https://aka.ms/aipclassicsunset).
>

This tutorial describes how to migrate your organization's Azure Information Protection deployment from the classic client, and label/label policy management in the Azure portal, to the unified labeling solution and [Microsoft 365 sensitivity labels](https://docs.microsoft.com/microsoft-365/compliance/sensitivity-labels).

**Time required**: The time required to complete a migration depends on how complex your policies are and the AIP features you use. You can continue to work with the classic client while you migrate in the background.

This tutorial provides a high-level description of each step, and then references to the relevant section elsewhere in Microsoft documentation for more details.

In this tutorial, you'll:
> [!div class="checklist"]
> * Learn about planning your migration
> * Migrate your labels to the unified labeling platform
> * Learn how to configure advanced settings in your new labeling admin center
> * Copy your policies to the unified labeling platform
> * Deploy the unified labeling client

## Why migrate to the unified labeling solution?

In addition to the [planned classic client deprecation](https://aka.ms/aipclassicsunset), migrating to the unified labeling solution enables you to effectively protect sensitive data across your digital estate. Once you've migrated, use Microsoft Information Protection (MIP) in Microsoft 365 cloud services, on-premises, in third-party SaaS applications, and more.

MIP supports built-in labeling services for many basic information protection features, enabling you to reserve client usage only for extra features not supported by built-in labeling.

- **Lower your maintenance costs**, by deploying and maintaining less additional software
- **Increase Office performance**, without the need for additional add-ins
- **Streamline your labeling and protection policy management** across AIP, Office 365, and Windows, using your labeling admin center. 

    Supported admin centers include the Microsoft 365 compliance center, the Microsoft 365 security center, or the Microsoft 365 Security & Compliance Center.

For more information, see the [Understanding unified labeling migration blog](https://techcommunity.microsoft.com/t5/microsoft-security-and/understanding-unified-labeling-migration/ba-p/783185).

## Planning your migration

While most functionality available for the AIP classic client is also available for the unified labeling client, some features are not yet fully available, and some are configured differently for unified labeling.

Review the following articles to understand how the Information Protection features you use may differ when using the unified labeling client:

- [Learn about built-in labeling capabilities in Microsoft 365](https://docs.microsoft.com/microsoft-365/compliance/sensitivity-labels-office-apps)
- [Compare the labeling solutions for Windows computers](rms-client/use-client.md#compare-the-labeling-solutions-for-windows-computers)
- [Learn how to manage label settings that are not supported out-of-the-box in the unified labeling admin centers](configure-policy-migrate-labels.md#label-settings-that-are-not-supported-in-the-admin-centers)

> [!TIP]
> If there are documented differences between the clients that impact your end users' behavior, we recommend communicating these changes effectively to your users before deploying the unified labeling client and publishing your new policy.

Once you've planned your migration and understood the changes that will occur, continue with [Migrating labels to the unified labeling platform](#migrating-labels-to-the-unified-labeling-platform).

## Migrating labels to the unified labeling platform

Once you've planned you migration and considered how you will manage the differences in the clients, you're ready to activate unified labeling and migrate your labels.

While you migrate, you can continue to use the AIP classic client and the policies in the Azure Information Protection area in the Azure portal. The two clients can work side by side without any additional configuration.

1. Sign in to the [Azure portal](https://portal.azure.com) as an administrator with one of the following roles:

    - **Compliance administrator**
    - **Compliance data administrator**
    - **Security administrator**
    - **Global administrator**
    

1. On the Azure Information Protection area, under **Manage** on the left, select **Unified labeling**.

    At the top of the page, select :::image type="icon" source="media/qs-tutor/activate.PNG" border="false"::: **Activate** to activate unified labeling.

    Your labels are copied from Azure Information Protection to the unified labeling platform, and are now stored in both systems.

    Open your labeling admin center to compare the labels displayed there and in the Azure Information Protection area. The two lists should be identical. For example, when comparing to the Microsoft 365 Security & Compliance Center:

    :::image type="content" source="media/qs-tutor/compare-migrated-labels-small.png" alt-text="Compare migrated labels between the Azure portal and the Security & Compliance Center" lightbox="media/qs-tutor/compare-migrated-labels.png":::

    > [!NOTE]
    > If needed, continue using the labels in both systems until you finish migrating. For more information, see [Synchronizing labeling edits](#synchronizing-labeling-edits).

Continue with [Copy policies to the unified labeling platform](#copy-policies-to-the-unified-labeling-platform).

### Synchronizing labeling edits

Once you've migrated your labels to your labeling admin center, including the Microsoft 365 security center, Microsoft 365 compliance center, or the Microsoft 365 Security & Compliance Center, any edits you continue to make to the migrated labels in the Azure portal are automatically synchronized to the same label in the admin center for unified labeling.

However, edits made to migrated labels in your admin center are *not* synchronized back to the Azure portal. If you make edits in the admin center and need them updated in the Azure portal, return to the portal to publish the update.

**To publish an updated label in the Azure portal**:

1. On the Azure Information Protection area, under **Manage** on the left, select **Unified labeling**.

1. Select :::image type="icon" source="media/i-publish.PNG" border="false"::: **Publish**. 

> [!NOTE]
> This step is only required if you've made edits to your migrated labels in the unified labeling platform, and need those edits synchronized back with the Azure portal. 

### Migrating labels via PowerShell

You can also use PowerShell to migrate your existing labels, such as for a GCC High environment.

Use the [New-Label](/powershell/module/exchange/new-label) cmdlet to migrate your existing sensitivity labels.

For example, if your sensitivity label has encryption, you might use the **New-Label** cmdlet as follows:

```PowerShell
New-Label -Name 'aipscopetest' -Tooltip 'aipscopetest' -Comment 'admin notes' -DisplayName 'aipscopetest' -Identity 'b342447b-eab9-ea11-8360-001a7dda7113' -EncryptionEnabled $true -EncryptionProtectionType 'template' -EncryptionTemplateId 'a32027d7-ea77-4ba8-b2a9-7101a4e44d89' -EncryptionAipTemplateScopes "['allcompany@labelaction.onmicrosoft.com','admin@labelaction.onmicrosoft.com']"
```

For more information about working in GCC, GCC-High, and DoD environments, see the [Azure Information Protection Premium Government Service Description](/enterprise-mobility-security/solutions/ems-aip-premium-govt-service-description#label-migration). 

## Copy policies to the unified labeling platform

Copy any policies you have stored in the Azure portal that you want to have available as they are in the unified labeling platform.

This feature is currently in PREVIEW. The [Azure Preview Supplemental Terms](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) include additional legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability.

> [!NOTE]
> Copying policies has certain limitations. You can also start from scratch and create your policies manually in your labeling admin center. For more information, see the [Microsoft 365 documentation](https://docs.microsoft.com/microsoft-365/compliance/create-sensitivity-labels#publish-sensitivity-labels-by-creating-a-label-policy).
> 

**To copy your policies**: 

1. Consider the following items and confirm that you want to copy your policies at this time:

    |Consideration  |Description  |
    |---------|---------|
    |**Copying policies copies *all* your policies**     |     Copying policies does not support copying specific policies only - it's all of your policies, or none of them now.   |
    |**Copying automatically publishes your policies**     |  Copying your policies to the unified labeling client automatically publishes them to all unified labeling-supported clients. <br /><br />   **Important**: Do not copy your policies if you don't want to publish them.     |
    |**Copying overwrites existing policies of the same name**     |   If you have a policy with the same name already existing in your admin center, copying your policies will overwrite any settings defined in that policy.   <br /><br />All policies copied from the Azure portal are named with the following syntax: `AIP_<policy name>`.    |
    |**Some client settings are not copied**     | Some client settings are not copied to the unified labeling platform, and must be configured manually after migrating. <br /><br />For more information, see [Configuring advanced labeling settings](#configuring-advanced-labeling-settings)|
    | | |

1. Sign in to the [Azure portal](https://portal.azure.com) as an administrator with one of the following roles:

    - **Compliance administrator**
    - **Compliance data administrator**
    - **Security administrator**
    - **Global administrator**


1. On the Azure Information Protection area, under **Manage** on the left, select **Unified labeling**.

1. Select :::image type="icon" source="media/i-copy-policies.PNG" border="false"::: **Copy policies (preview)**. All of the policies you have stored in the Azure portal are copied to your admin center.

    If there are any policies already in the admin center with the same name, the policies are overwritten with the settings from the Azure portal.

    > [!IMPORTANT]
    > If you currently use Microsoft Cloud App Security and Azure Information Protection labels, verify that you have published at least one policy with a minimal set of labels to your labeling admin center, even if the policy is scoped to a single user. 
    >
    > This policy is required for Microsoft Cloud App Security to identify all the labels in the labeling admin center, and show them in the Microsoft Cloud App Security portal.

Now that you've migrated both your labels and policies, continue with [Configuring advanced labeling settings](#configuring-advanced-labeling-settings) to cover any advanced configurations that were not migrated.

## Configuring advanced labeling settings

As explained during the [planning phase](#planning-your-migration), some advanced labeling settings are not migrated automatically, and must be reconfigured for the unified labeling platform.

For more information, see:

- [Configure advanced labeling settings in PowerShell](#configure-advanced-labeling-settings-in-powershell)
- [Define label conditions in the labeling admin center](#define-label-conditions-in-the-labeling-admin-center)

### Configure advanced labeling settings in PowerShell

1. Connect to the Office 365 Security & Compliance Center PowerShell module. For more information, see [Security & Compliance Center PowerShell documentation](https://docs.microsoft.com/powershell/exchange/connect-to-scc-powershell).

1. To define an advanced label setting, use the **Set-Label** cmdlet, specifying the **AdvancedSettings** parameter, the label you want to apply the setting to, as well as key/value pairs to define your setting.
    
    Use the following syntax:

    ```PowerShell
    Set-Label -Identity <LabelGUIDorName> -AdvancedSettings @{<Key>="<value1>,<value2>"}
    ```

    Where:
    - **`<LabelGUIDorName>`** identifies your label, using the label name or GUID
    - **`<Key>`** is the key, or name of the advanced setting you want to device
    - **`<Value>`** is the setting value you want to define. Surround your value in quotes, and separate multiple values by commas. White spaces are not supported.

1. Get started by configuring the following advanced settings:

    - [Specify a color for the label](rms-client/clientv2-admin-guide-customizations.md#specify-a-color-for-the-label)
    - [Specify a default sublabel for a parent label](rms-client/clientv2-admin-guide-customizations.md#specify-a-default-sublabel-for-a-parent-label)
    - [Configure a label to apply S/MIME protection in Outlook](rms-client/clientv2-admin-guide-customizations.md#configure-a-label-to-apply-smime-protection-in-outlook)
    - [Define labels using custom properties](rms-client/clientv2-admin-guide-customizations.md#migrate-labels-from-secure-islands-and-other-labeling-solutions) 
    - [Define label translations](https://docs.microsoft.com/powershell/module/exchange/set-label). 

    For more information about advanced configurations available, see [Admin Guide: Custom configurations for the Azure Information Protection unified labeling client](rms-client/clientv2-admin-guide-customizations.md).

> [!NOTE]
> To leverage the settings you've defined for the unified labeling platform, end-users must have the unified labeling client installed on their machines. 
>
> These advanced settings are not available for users who have only built-in labeling provided by Office 365.
> 

### Define label conditions in the labeling admin center

Unified labeling conditions provide more flexibility and better accuracy than their counterparts that had been created in the Azure portal. 

To leverage unified labeling condition features, create your labeling conditions manually in your labeling admin center, including:

- The Microsoft 365 compliance center
- The Microsoft 365 security center
- The Microsoft 365 Security & Compliance Center

For more information, see [What sensitivity labels can do](https://docs.microsoft.com/microsoft-365/compliance/sensitivity-labels#what-sensitivity-labels-can-do) in the Microsoft 365 documentation.

> [!TIP]
> If you have any custom sensitive information types created for use with Office 365 DLP or Microsoft Cloud App Security, apply them as-is to unified labeling. For more information, see the [Microsoft 365 documentation](https://docs.microsoft.com/microsoft-365/compliance/apply-sensitivity-label-automatically).
>  

## Deploy a unified labeling client

Deploy a client that supports unified labeling across your users' machines to ensure that they will be able to use your unified labeling policies and labels. 

Users must have a supported client that can connect to your labeling admin center and pull the unified labeling policy. 

For more information, see:
- [Non-Windows platforms](#non-windows-platforms)
- [Windows platforms](#windows-platforms)
- [What changes for classic client end-users?](#what-changes-for-classic-client-end-users)

### Non-Windows platforms

For users on non-Windows platforms, unified labeling capabilities are integrated directly in the Office clients, and can use any labels you've published immediately. 

Office clients with integrated unified labeling capabilities include: 

- Office clients for macOS
- Office for the web (preview)
- The Outlook Web App
- Outlook for mobile

For more information about unified labeling in these platforms, see the [Apply sensitivity labels to your files and email in Office](https://support.microsoft.com/office/apply-sensitivity-labels-to-your-files-and-email-in-office-2f96e7cd-d5a4-403b-8bd7-4cc636bae0f9) on the Microsoft Support site. 

### Windows platforms

For Windows machines with Microsoft 365 Apps for Enterprise, use the built-in labeling support provided in Office versions 1910 and higher, or install the Azure Information Protection unified labeling client to extend AIP functionality to the File Explorer or PowerShell.

For more information, see: 

- [Compare the labeling solutions for Windows computers](rms-client/use-client.md#compare-the-labeling-solutions-for-windows-computers)
- [Quickstart: Deploying the Azure Information Protection (AIP) unified labeling client](quickstart-deploy-client.md)

The Azure Information Protection unified labeling client can be downloaded from the [Microsoft Download Center](https://aka.ms/aipclient). 

Make sure that you use the **AzInfoProtection_UL** file to deploy the client. If you currently have the classic client installed on the machine, installing the unified labeling client performs an in-place upgrade.

> [!NOTE]
> Consider the AIP functionality currently required by your organization when determining when to use built-in labeling and when to use the unified labeling client. 
>> 

### What changes for classic client end users?

The main, most visible difference for end users who have been using the Azure Information Protection classic client is that the **Protect** button in Office apps is replaced by the **Sensitivity** button. 

Once you leverage the additional capabilities supported by sensitivity labels and unified labeling, end users will also see those changes in their Office apps.

For example:

- **Windows AIP classic client**

    :::image type="content" source="media/infoprotect-protectbutton-pulldown.png" alt-text="Protection button in the classic client":::

- **Windows AIP unified labeling client**

    :::image type="content" source="media/qs-tutor/sample-aip-client-office.PNG" alt-text="Sample button for the unified labeling client in Microsoft Office":::

> [!TIP]
> If you have published your labels and the clients that have built-in support do not show the **Sensitivity** button, review the relevant troubleshooting guide as needed.
>
 
## Next steps

Once you've migrated your labels, policies, and deployed clients as needed, continue by [managing labels and labeling policies only in your labeling admin center](https://docs.microsoft.com/microsoft-365/compliance/create-sensitivity-labels), including the Microsoft 365 compliance center, the Microsoft 365 security center, or the Microsoft 365 Security & Compliance Center.

With the unified labeling platform, you'll only need to return to the Azure Information Protection area in the Azure portal to:

- [Use the AIP scanner](deploy-aip-scanner.md)
- [Monitor labeling activities using AIP analytics](reports-aip.md)

We recommend that end-users leverage built-in labeling capabilities in the latest Office apps for web, Mac, iOS, and Android, as well as Microsoft 365 Apps for Enterprise. 

To use additional AIP features not yet supported by built-in labeling, we recommend using the latest unified labeling client for Windows.
