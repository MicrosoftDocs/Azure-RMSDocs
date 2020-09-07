---
# required metadata

title: Tutorial - Migrating from the Azure Information Protection (AIP) classic client to the unified labeling client
description: A step-by-step tutorial for migrating from the Azure Information Protection (AIP) classic client to the unified labeling client.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 08/04/2020
ms.topic: tutorial
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: aiplabels
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Tutorial: Migrating from the Azure Information Protection (AIP) classic client to the unified labeling client

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*
>
> *Instructions for: [Azure Information Protection client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

To provide a unified and streamlined customer experience, Azure Information Protection's classic client and Label Management in the Azure Portal are being deprecated as of March 31, 2021.

This time frame enables all current Azure Information Protection classic client customers to transition to the AIP unified labeling solution, which uses Microsoft Information Protection's Unified Labeling platform.

This tutorial provides an end-to-end description of how to migrate your organization's Azure Information Protection deployment from the classic client to the unified labeling client.

**Time required:** The time required to complete an end-to-end migration depends on how complex your policies are and the AIP features you use. You can continue to work with the classic client while you migrate in the background.

This tutorial provides a high-level description of each step, and then references to the relevant section elsewhere in Microsoft documentation for more details.

In this tutorial, you'll:
> [!div class="checklist"]
> * Learn about planning your migration
> * Migrate your labels to the unified labeling platform
> * Learn how to configure advanced settings using the Security & Compliance Center PowerShell module
> * Copy your policies to the unified labeling platform
> * Deploy the unified labeling client



## More reasons to migrate

In addition to the planned classic client deprecation, migrating to the unified labeling client enables you to effectively protect sensitive data across your digital estate. Once you've migrated, you can use Microsoft Information Protection (MIP) in Microsoft 365 cloud services, on-premises, in third-party SaaS applications, and more.

MIP supports built-in labeling services for many basic information protection features, so you can reserve client usage only for extra features not supported by built-in labeling.

Using built-in labeling enables you to protect documents and emails in the latest Office apps, on all platforms, as well as:

- Lower maintenance costs, as you only need to deploy and maintain additional software when you really need to
- Increase performance by using Office apps without additional add-ins
- Use the Microsoft 365 Security & Compliance Center as a single portal that unifies labeling and protection policy management across AIP, Office 365, and Windows.

Additionally, AIP's classic client requires you to manage your labeling policies in the Azure Information Protection blade in the Azure portal. This blade supports only the AIP classic client, scanner, and Microsoft Cloud App Security.

The unified labeling console in the Microsoft 365 Security & Compliance Center is supported by the following services:

- The Azure Information Protection unified labeling client and scanner
- Microsoft Cloud App Security
- SharePoint Online
- Office 365 apps for Windows, MacOS, iOS and Android (built-in, without an add-in requirement)
- Office and Outlook for the web
- Outlook for mobile devices (iOS & Android)
- PowerBI Data protection
- The Microsoft Information Protection SDK and applications based on it, such as Adobe Acrobat

## Planning your migration

While most functionality available for the AIP classic client is also available for the unified labeling client, some features not yet fully available, and some are configured differently when managed by the Microsoft Security & Compliance Center.

Review the following articles to understand how the Information Protection features you use may differ when using the unified labeling client:

- [Learn about built-in labeling capabilities in Microsoft 365](https://docs.microsoft.com/microsoft-365/compliance/sensitivity-labels-office-apps)
- [Compare support between the classic and unified labeling clients](rms-client/use-client.md#compare-the-labeling-clients-for-windows-computers)
- [Learn how to manage label settings that are not supported in the admin centers](configure-policy-migrate-labels.md#label-settings-that-are-not-supported-in-the-admin-centers). This section describes how you can manage the migration for each relevant setting.

> [!NOTE]
> ALthough some custom permissions ae not supported in the unified labeling client as a standalone action inside Microsoft Office, they are supported as a label configured with a User-Defined Permissions action.

> [!TIP]
> If there are documented differences between the clients that impact your end users' behavior, we recommend communicating these changes effectively to your users before deploying the unified labeling client and publishing your new policy.

## Migrating labels to the Security & Compliance Center

Once you've planned you migration and considered how you will manage the differences in the clients, you're ready to activate unified labeling and migrate your labels.

You can continue to use the policies un the Azure Information Protection blade in the Azure portal and the AIP classic client while you migrate. The two clients can work side-by-side without any additional configuration.

1. Log in to the Azure portal as a user with one of the following roles:
    - sdfs

1. In the :::image type="icon" source="media/aip-icon.png" border="false"::: **Azure Information Protection** area, navigate to **Manage > Unified labeling**. 

    At the top of the page, click :::image type="icon" source="media/qs-tutor/activate.PNG" border="false"::: to activate unified labeling.

    Once activated, labels are copied in the background from Azure Information Protection to the unified labeling platform, and your labels are now stored in both systems.

    > [!TIP]
    > Open the unified labeling console in the Microsoft 365 Security & Compliance Center to compare the labels displayed there and in the Azure Portal's Azure Information Protection blade. The two lists of labels should be identical.

### Synchronizing labeling edits

From here on in, if you edit a migrated label in the Azure Information Protection blade in the Azure portal, the change is automatically reflected in the Security & Compliance Center. 

However, if you edit a migrated label in the Security & Compliance Center, and then also want the update to be shown in the Azure portal, you must publish the update in the Azure portal:

1. In the Azure portal, navigate to the **Azure Information Protection** blade > **Manage** > **Unified labeling** page.

1. Click **Publish**. 

> [!NOTE]
> This step is not required after you've fully migrated to the unified labeling platform, and no longer need to the classic client, or need to manage your labels from the Azure portal.

## Configuring advanced labeling settings

As explained during the planning phase, some advanced labeling settings are not migrated automatically, and must be re-configured for the unified labeling platform.

These configurations are performed using the Security & Compliance PowerShell module:

1. Connect to the Office 365 Security & Compliance Center PowerShell. For more information, see [Security & Compliance Center PowerShell documentation](https://docs.microsoft.com/powershell/exchange/connect-to-scc-powershell)

1. To define an advanced label setting, use the **Set-Label** cmdlet, specifying the AdvancedSettings parameter, the label you want to apply the setting to, as well as key/value pairs to define your setting.
    
    Use the following syntax:

    ```PowerShell
    Set-Label -Identity <LabelGUIDorName> -AdvancedSettings @{<Key>="<value1>,<value2>"}
    ```

    Where:
    - `<LabelGUIDorName>` identifies your label, using the label name or GUID
    - `<Key>` is the key, or name of the advanced setting you want to device
    - `<Value>` is the setting value you want to define. Surround your value in quotes, and separate multiple values by commas.

    > [!IMPORTANT]
    > White spaces are not supported in values

1. Get started by configuring the following advanced settings:

    - [Specify a color for the label](rms-client/clientv2-admin-guide-customizations.md#specify-a-color-for-the-label)
    - [Specify a default sublabel for a parent label](rms-client/clientv2-admin-guide-customizations.md#specify-a-default-sublabel-for-a-parent-label)
    - [Configure a label to apply S/MIME protection in Outlook](rms-client/clientv2-admin-guide-customizations.md#configure-a-label-to-apply-smime-protection-in-outlook)

For more information about advanced configurations available, see [Admin Guide: Custom configurations for the Azure Information Protection unified labeling client](rms-client/clientv2-admin-guide-customizations.md).

> [!NOTE]
> To leverage the settings you've defined for the unified labeling platform, end-users must have the unified labeling client installed on their machines. These advanced settings are not be available for users who have only built-in labeling provided by Office 365.
> 
 
## Copy your labeling policies to the Security & Compliance center

If you have policies in the Azure portal that you want to copy over to the unified labeling platform, perform a one-time copy. 

Alternately, create your policies manually in the Security & Compliance Center and start over from scratch.

1. Before copying policies, consider the following, and determine that you definitely want to copy your policies at this point:

    |Consideration  |Description  |
    |---------|---------|
    |**Copying policies copies *all* your policies**     |     Copying policies does not support copying specific policies only - it's all of your policies, or none of them.    |
    |**Copying automatically publishes your policies**     |  Copying your policies to the unified labeling client automatically publishes them to all unified labeling-supported clients. </br>   **Important:** Do not copy your policies if you don't want to publish them.     |
    |**Copying overwrites existing policies of the same name**     |   If you have a policy with the same name already existing in the Security & Compliance Center, copying your policies will overwrite any settings defined in that policy.   </br>All policies copied from the Azure portal are named with the following syntax: `AIP_<policy name>`.    |
    |**Some client settings are not copied**     | Some client settings are not copied to the unified labeling platform, and must be configured manually in the Security & Compliance Center after migrating. </br>For more information, see [Update client settings manually](#update-client-settings-manually).        |


1. In the Azure portal, navigate to the **Azure Information Protection** > **Manage** > **Unified labeling** blade. 

1. Click **Copy policies (preview)**. All of the policies you have stored in the Azure portal, as well as any advanced client settings, are copied to the Security & Compliance Center. 

    In case there are any policies already there with the same name, the policies are overwritten with the settings from the Azure portal.

    > [!IMPORTANT]
    > If you currently use Microsoft Cloud App Security and Azure Information Protection labels, verify that you have published at least one policy with a minimal set of labels to the Security & Compliance Center, even if the policy is scoped to a single user. 
    >
    > This policy is required for Microsoft Cloud App Security to identify all the labels in the Security & Compliance Center, and show them in the Microsoft Cloud App Security portal.

## Update client settings manually

As mentioned [above](#copy-your-labeling-policies-to-the-security--compliance-center), not all client settings are copied to the unified labeling platform automatically. To continue using these settings, you'll need to configure them again manually in the Security & Compliance Center.

Use the Security & Compliance Center PowerShell module to configure the following settings:

- [Define labels using custom properties (**LabelbyCustomProperty**)](rms-client/clientv2-admin-guide-customizations.md#migrate-labels-from-secure-islands-and-other-labeling-solutions) 

- [Configure a label to apply S/MIME protection in Outlook (**LabelToSMIME**)](./rms-client/client-admin-guide-customizations.md#configure-a-label-to-apply-smime-protection-in-outlook)

- [Define label translations (**Set-Label** cmdlet with the **-LocalSettings** parameter)](https://docs.microsoft.com/powershell/module/exchange/set-label). 

    Label translations are supported only for labels used with the unified labeling client. 

- [Define label conditions in the Security & Compliance Center](https://docs.microsoft.com/microsoft-365/compliance/sensitivity-labels#what-sensitivity-labels-can-do)

    Unified labeling conditions provide more flexibility and better accuracy than their counterparts that had been created in the Azure portal. Create your labeling conditions manually in the Security & Compliance Center to leverage all of the labeling condition features available.

    > [!TIP]
    > Additionally, if you have any custom sensitive information types created for use with Office 365 DLP or Microsoft Cloud App Security, [apply them as-is to unified labeling](https://docs.microsoft.com/microsoft-365/compliance/apply-sensitivity-label-automatically).
    >  

## Deploy a unified labeling client

Deploy a client that supports unified labeling across your users' machines to ensure that they will be able to use your unified labeling policies and labels. 

Users must have a supported client that can connect to the Security & Compliance Center, and pull the unified labeling policy.

For more information, see:
- [Non-Windows platforms](#non-windows-platforms)
- [Non-Windows platforms](#non-windows-platforms)
- [Sample screenshots across various platforms and clients](#sample-screenshots-across-various-platforms-and-clients)
- [What changes for classic client users?](#what-changes-for-classic-client-users)

### Non-Windows platforms

For users on non-Windows platforms, unified labeling capabilities are integrated directly in the Office clients, and can use any labels you've published immediately. 

Office clients with integrated unified labeling capabilities include: 

- Office clients for MacOS
- Office for the web (preview)
- The Outlook Web App </br>
- Outlook for mobile

For more information about unified labeling in these platforms, see the [Apply sensitivity labels to your files and email in Office](https://support.microsoft.com/office/apply-sensitivity-labels-to-your-files-and-email-in-office-2f96e7cd-d5a4-403b-8bd7-4cc636bae0f9) on the Microsoft Support site. 

### Windows platforms

For Windows machines with Microsoft Office ProPlus, use either the built-in labeling support provided in Office versions 1910 and higher, or the Azure Information Protection unified labeling client. 

For more information, see: 

- [Compare the labeling clients for Windows computers](rms-client/use-client.md#compare-the-labeling-clients-for-windows-computers)
- [Tutorial: Deploying the Azure Information Protection (AIP) unified labeling client](tutorial-deploy-client.md)

The Azure Information Protection unified labeling client can be downloaded from the [Microsoft Download Center](http://aka.ms/aipclient). 

Make sure that you use the **AzInfoProtection_UL** file to deploy the client. If you currently have the classic client deployed, installing the unified labeling client performs an in-place upgrade.

> [!NOTE]
> To help you determine which client to use consider the functionality currently required by your organization. Moving forward, we expect to add additional functionality to the built-in labeling capabilities, so that there are fewer and fewer scenarios that require the additional client deployment. 
> 



### Sample screenshots across various platforms and clients

The following images shows examples of how sensitivity labels can be applied across the built-in labeling solution and the unified labeling client.

#### Windows Azure Information Protection unified labeling client

#### Windows built-in, Office 365

#### MacOS built-in, Office 365

#### iPad built-in, Office 365

#### Built-in, Office for the web

#### Built-in, Outlook for the web

### What changes for classic client users?

The main differences for end-users who have been using the Azure Information Protection classic client is that the **Protect** button in Office apps is replaced by the **Sensitivity** button. 

> [!TIP]
> If you have published your labels and the clients that have built-in support do not show the **Sensitivity** button, review the relevant troubleshooting guide as needed.
 
## Next steps

Once you've migrated your labels, policies, and deployed clients as needed, you can continue managing labels only in the unified labeling console in the Office 365 Security & Compliance Center.

From here on in, you only need to return to the Azure Information Protection blade in the Azure portal for the AIP scanner, and to monitor labeling activities using AIP analytics. 

We recommend that you leverage built-in labeling in the latest Office apps for web, Mac, iOS, and Android, as well as Office ProPlus apps. If you need additional features not yet supported by built-in labeling, we recommend using the latest unified labeling client for Windows.
