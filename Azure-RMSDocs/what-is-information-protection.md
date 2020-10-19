---
# required metadata

title: What is Azure Information Protection (AIP)?
description: Azure Information Protection (AIP) extends the Microsoft Information Protection (MIP) framework to extend the labeling and classification functionality provided by Microsoft 365.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 10/18/2020
ms.topic: overview
ms.collection: M365-security-compliance
ms.service: information-protection
Customer intent: As an administrator, I want to extend Microsoft 365's labeling and classification functionality to the File Explorer, PowerShell, third party apps and services, and more.

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: contperfq1
ms.custom: admin
search.appverid:
- MET150

---

# What is Azure Information Protection?

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*

Azure Information Protection (AIP) is a cloud-based solution that enables organizations to find, classify, and protect documents and emails by applying labels to content.

AIP is part of the Microsoft Information Protection (MIP) solution, and extends the labeling and classification functionality provided by Microsoft 365.

:::image type="content" source="media/what-is-mip.png" border="false" alt-text="The Azure Information Protection areas of the Microsoft Information Protection framework":::

For more information about the MIP solution and its other elements, see [Microsoft Information Protection in Microsoft 365](https://aka.ms/MIPdocs).

## Azure Information Protection elements in MIP

Azure Information Protection adds the following elements to the MIP framework:

- **Azure Information Protection unified labeling client:** Extends labeling, classification, and protection capabilities to additional file types, as well as the File Explorer and PowerShell. For example:

    :::image type="content" source="media/protect-from-file-explorer.png" alt-text="Classify and protect from the File Explorer":::

- **Azure Information Protection scanner:** Enables admins to scan their networks and file shares for sensitive content that must be labeled, classified, and/or protected.

    For example, find repositories that might have sensitive content at risk:

    :::image type="content" source="media/risky-repos.png" alt-text="Check scanned networks for risky repositories":::

- **Microsoft Information Protection SDK:** Extends sensitivity labels to third-party apps and services. 

    For example, see [Quickstart: Set and get a sensitivity label (C#)](https://docs.microsoft.com/information-protection/develop/quick-file-set-get-label-csharp).

For the latest details and public preview version of Azure Information Protection, see [Azure Information Protection unified labeling client - Version release history and support policy](rms-client/unifiedlabelingclient-version-release-history.md).

## Azure Information Protection's classic client

The Azure Information Protection classic client is the earlier version of AIP, and enables administrators to manage classification labels directly in the Azure portal.

AIP labels managed in the Azure portal are *not* supported by the unified labeling platform, are limited to working with the Azure Information Protection client and scanner, and Microsoft Cloud App Security. 

We recommend migrating to unified labeling to support these features, as well as SharePoint, Microsoft 365 apps, Outlook for the web and mobile devices, PowerBI data protection, and more. For more information, see [Tutorial: Migrating from the Azure Information Protection (AIP) classic client to the unified labeling client](tutorial-migrating-to-ul.md).

>[!NOTE] 
> To provide a unified and streamlined customer experience, **Azure Information Protection client (classic)** and **Label Management** in the Azure Portal are being **deprecated** as of **March 31, 2021**. 
>
> This time-frame allows all current Azure Information Protection customers to transition to unified labeling using the Microsoft Information Protection Unified Labeling solution. Learn more in the official [deprecation notice](https://aka.ms/aipclassicsunset).

## Next steps

To get started with AIP, install the unified labeling client and scanner. For more information, see:

- [Quickstart: Deploy the unified labeling client](quickstart-install-scanner.md)

- [Quickstart: Installing the Azure Information Protection (AIP) unified labeling scanner](quickstart-install-scanner.md)

- [Tutorial: Finding your sensitive content with the Azure Information Protection (AIP) scanner](tutorial-scan-networks-and-content.md)

- [Tutorial: Preventing oversharing in Outlook using Azure Information Protection (AIP)](tutorial-preventing-oversharing.md)

Once you're ready to customize your AIP deployment further, see [Admin Guide: Custom configurations for the Azure Information Protection unified labeling client](rms-client/clientv2-admin-guide-customizations.md).

If you're looking to extend your own apps and services with sensitivity labels, see the [Microsoft Information Protection SDK overview](develop/overview.md).

## Additional resources

- **Free trial:** [Enterprise Mobility + Security E5](https://admin.microsoft.com/Signup/Signup.aspx?OfferId=87dd2714-d452-48a0-a809-d2f58c4f68b7)

- **Subscription options and pricing:** [Azure Information Protection Pricing](https://azure.microsoft.com/pricing/details/information-protection)

- **Download the client:** [Azure Information Protection client](https://www.microsoft.com/download/details.aspx?id=53018)

- **What's New?**:

    - [AIP unified labeling client version history](rms-client/unifiedlabelingclient-version-release-history.md)
    - [What's new in the Microsoft 365 admin center?](/microsoft-365/admin/whats-new-in-preview)
    - [What's new in the Sharepoint admin center?](sharepoint/what-s-new-in-admin-center)

- **FAQs:** [Frequently asked questions for Azure Information Protection](faqs.md)

- **Known issues:** [Known issues - Azure Information Protection](known-issues.md)

- **Support options** [Support options for Azure Information Protection](information-support.md)

- **Yammer:** [Azure Information Protection](https://www.yammer.com/AskIPTeam)

- **Docs twitter feed:** [https://twitter.com/docsmsft](https://twitter.com/docsmsft)

- **Download a customizable PDF guide:** [Azure Information Protection PDF documentation](https://docs.microsoft.com/azure/information-protection/opbuildpdf/toc.pdf?branch=live)

### Microsoft Ignite

Microsoft Ignite 2020 was held remotely and was a great success! You can view the session recordings at [https://myignite.microsoft.com/sessions](https://myignite.microsoft.com/sessions).

For example:

- [Supercharge information protection and governance across cloud, on-premise, endpoints and remote work environments](https://myignite.microsoft.com/sessions/ceba117f-9bc7-4426-9ebc-753d94c6a476)

- [Know your data, protect your data and prevent data loss with Microsoft Information Protection](https://myignite.microsoft.com/sessions/46ff69cf-2c8f-4e61-a923-f72f5740f02f)

- [Ask the Expert: Ask anything about Microsoft Compliance: information protection & governance, insider risks, Compliance Management, and more](https://myignite.microsoft.com/sessions/5ce48b36-9827-4d60-8540-90546333063d)

> [!TIP]
> If you're looking for information about Microsoft Ignite 2019 in Orlando, check out the recap at our blog: [Microsoft Information Protection - Ignite 2019 recap](https://techcommunity.microsoft.com/t5/microsoft-security-and/microsoft-information-protection-ignite-2019-recap/ba-p/998174)
> 
