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

In this tutorial, you'll:
> [!div class="checklist"]
> * Plan your migration
> * Migrate the service
> * Copy your policies to your labeling management system
> * Deploy the unified labeling client
https://techcommunity.microsoft.com/t5/azure-information-protection/announcing-timelines-for-sunsetting-label-management-in-the/ba-p/1226179
https://techcommunity.microsoft.com/t5/azure-information-protection/understanding-unified-labeling-migration/ba-p/783185

Step by step guide to transition to MIP

If you are an existing AIP customer, we recommend the following steps to transition to MIP:

Activate unified labeling from the Azure portal and migrate labels to the Microsoft 365 compliance center to apply policies uniformly across on-premises, Microsoft 365 cloud services and more. This transition has no impact on existing AIP clients, and administrators can perform this step right away. The process takes only a few minutes, depending on the number of labels and complexity
Copy your policies to the Microsoft 365 compliance center or create new policies there
Publish your labels with label policies from the Microsoft 365 compliance center
Download the latest unified labeling client for Windows if you are not yet fully on Office 365 ProPlus
Train end users to apply labels and protection in Office applications across web, Mac, iOS, Android and Windows. Read this article to know which labeling capabilities are available across platforms
Learn more about transitioning from Azure Information Protection to the unified labeling platform in this blog post, and get detailed instructions on how to migrate here.

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

### Synchronizing any labeling edits

From here on in, if you edit a migrated label in the Azure Information Protection blade in the Azure portal, the change is automatically reflected in the Security & Compliance Center. 

However, if you edit a migrated label in the Security & Compliance Center, and then also want the update to be shown in the Azure portal, you must publish the update in the Azure portal:

1. In the Azure portal, navigate to the **Azure Information Protection** blade > **Manage** > **Unified labeling** page.

1. Click **Publish**. 

> [!NOTE]
> This step is not required after you've fully migrated to the unified labeling platform, and no longer need to the classic client, or need to manage your labels from the Azure portal.

## Configuring advanced labeling settings

As explained during the planning phase, some advanced labeling settings are not migrated automatically, and must be re-configured for the unified labeling platform.

These configurations are performed using the Security & Compliance PowerShell module. To get started, configure the following settings:

- Specify a color for the label
- Specify a default sub-label for a parent label
- Configure a label to apply S/MIME protection in Outlook

For more information about advanced configurations available, see [Admin Guide: Custom configurations for the Azure Information Protection unified labeling client](rms-client/clientv2-admin-guide-customizations.md).

> [!NOTE]
> Advanced labeling configurations defined for the unified labeling platform are supported only on machines where you have the unified labeling client deployed. These advanced settings will not be available for users who have only built-in labeling provided by Office 365.
> 
 
## Copy your labeling policies to the Security & Compliance center


Once your labels have been migrated to Security & Compliance center we can discuss and check the possibility to migrate your policies as well with a one-time copy action (Fig 7.) Policies can be migrated or otherwise, you can create them manually and start this part from scratch.

 

Fig 7. Copy Policies (preview) button
clipboard_image_4.png

Selecting “Copy policies (preview)” will perform a one-time copy of your policies with their settings and any advanced client settings to the Security & Compliance center (Fig 8). Before doing that, there are few considerations that you should be aware of:

Copy policy is being done for all policies that are configured in the Azure Information Protection blade.
Once policies are being copied, they will automatically be published to all Unified Labeling supported clients. Please don’t copy your policies if you don’t want to publish them.
To avoid duplications and conflicts, policies that are copied to Security & Compliance center naming convention is “AIP_<policyname>”. That mean that policies that are already configured in the same name in Unified Labels policy will be overridden (for example, you performed an update in Azure Information Protection policies and would like to update the policies in Security & Compliance, additional click on “copy policies” will update them).
Due to different policy design, few advanced client settings are not copied in the process, these are “LabelbyCustomProperty” and “LabelToSMIME”.
Unlike labels, copy policies doesn’t “synchronize” the policies between Security & Compliance center to the Azure Information Protection blade, once copied each platform policies is independent.
Fig 8. Copy policies summary after the action has been completed
clipboard_image_5.png

As an Azure Information Protection admin, you probably noticed that some policy configurations are not available when you configure your policy in the Security & Compliance Center. In case you copied your policies using the “Copy Policies” feature then these configurations are copied as well. For future policy configuration you will decide to use, or if you created your label policy manually, these configurations should be applied to the policy you created in the Security & Compliance Center after its initial creation and using the Security & Compliance PowerShell module. Here are few examples for such configurations:

For email messages with attachments, apply a label that matches the highest classification of those ...
Implement pop-up messages in Outlook that warn, justify, or block emails being sent
Add "Report an Issue" for users
The full list of all the advanced policy settings is published here with instructions for how to apply them. Please note that these advanced settings (both for policies and labels) are supported only by the Azure Information Protection unified labeling client and not by the Office 365 built-in integration with unified labeling.

 

Important Note: If you use Microsoft Cloud App Security and Azure Information Protection labels (or intend to do so in the future), verify you have published at least 1 policy with minimal set of labels even if this is scoped to a single user. This is required for Microsoft Cloud App Security to identify all labels in the Security & Compliance Center and show them in the Microsoft Cloud App Security portal.

 

What doesn’t migrate and need to be created separately?

Label conditions
Label translations
Why? As mentioned earlier in this blog, conditions are more flexible and have additional advanced settings that allows better accuracy and less false positive matches. Therefore, they cannot be directly translated across the services.

 

Label conditions should be created manually under each unified label as they are far more flexible than their Azure portal counterparts. By the way – If you already have custom sensitive information types that were built to use with Office 365 DLP or Microsoft Cloud App Security you can apply them as-is to a unified label with simple configuration. Read our official documentation on how to create automated and recommend rules for unified labeling.

 

Label translations can be configured, once labels are migrated, using Security & Compliance PowerShell module using the set-label cmdlet with the -LocaleSettings parameter. Please note that translations are supported only for labels and with the Azure Information Protection Unified Labeling client.

 

Phase 3 – Client deployment

The last part is to verify the end users will be able to get the unified labeling policies and labels. For this they need a supported client that knows to connect to the Security & Compliance backend and pull the unified labeling policy. For all non-windows platforms, there is no Azure Information Protection client as labeling capabilities are already integrated, out of the box in Office clients for MacOS, Office for the web (preview), Outlook Web App and Mobile devices. Once labels are published, these platforms will be able to leverage them. Click here to read how to apply sensitivity label in each platform that supports built-in labeling. For Windows platform there are 2 options you can use if you are using Office 365 ProPlus:

Use Office 365 built-in label support (Versions newer them 1910 - 12130.20272)
Deploy the Azure Information Protection Unified Labeling client
More details on the functionality differences are detailed in the official client comparison. What should lead you in the decision are the required functionality in the current point and time for your organization. As we move forward, more functionalities will be added to the built-in capability that doesn’t require an add-in to be deployed. Here is a short table that describe the major differences between these options:

clipboard_image_0.png

 

You can read more on the capabilities that are currently supported with Office 365 apps built-in labeling in this official documentation.

 

For Windows Office perpetual clients (2010, 2013, 2016, 2019), install the Azure Information Protection unified labeling client (Option 2) which can be downloaded from http://aka.ms/aipclient (verify you download the AzInfoProtection_ul.exe file. If you currently have Azure Information Protection client (classic) deployed, installing the unified labeling client will perform an in-place upgrade.

See the following screenshots (Fig. 9) that describe the experience across multiple platforms. You can also see this in the latest official documentation.

If you published your labels and the clients that have built-in support do not show the “Sensitivity” button, review the troubleshooting guide that covers this topic.

 

 
Fig 9. Consistent user experience for applying Sensitivity labels across different platforms.
clipboard_image_7.png

The main differences for end users who use the classic client for Azure Information Protection today and move to use the unified labeling client is the new “Sensitivity” button that replaces the “Protect” button (Fig. 10). The functionality and experience to apply labels remains the same with the vertical bar across all platforms and with the horizontal bar which is exclusive to the Azure Information Protection unified labeling client in Windows.

 

Fig. 10 – End users changes when upgrading from the classic client to the unified labeling client
clipboard_image_8.png

That’s it! Once you have performed the steps mentioned above, you have completed your migration to unified labeling and are now ready for the future and the exciting updates that will be available soon across the Microsoft 365 platform!

 

You can manage labels in one place which is the unified labeling console in Office 365 Security & Compliance Center. The only reason you may still need to use the Azure Portal for Azure Information Protection, is to manage the Azure Information Protection scanner and to monitor label activities using Azure Information Protection analytics.

 

## Next steps
Once you transition from the Azure portal to the Microsoft 365 compliance center, we recommend that you take advantage of the built-in labeling in the latest Office apps in web, Mac, iOS and Android. On the Windows platform, we suggest you use our built-in labeling capabilities in Office ProPlus apps as well. However, if you are not on Office 365 ProPlus fully yet, or need certain advanced capabilities listed here, we recommend using the latest unified labeling client for Windows.
