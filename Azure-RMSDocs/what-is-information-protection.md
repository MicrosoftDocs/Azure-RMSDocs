---
# required metadata

title: What is Azure Information Protection (AIP)?
description: Azure Information Protection (AIP) extends the Microsoft Information Protection (MIP) framework to extend the labeling and classification functionality provided by Microsoft 365.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 11/09/2020
ms.topic: conceptual
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
ms.custom: contperf-fy21q2
search.appverid:
- MET150

---

# What is Azure Information Protection?

>***Applies to**: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*
>
>***Relevant for**: [AIP unified labeling client and classic client](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

Azure Information Protection (AIP) is a cloud-based solution that enables organizations to discover, classify, and protect documents and emails by applying labels to content.

AIP is part of the Microsoft Information Protection (MIP) solution, and extends the labeling and classification functionality provided by Microsoft 365.

The following image shows the Azure Information Protection additions to MIP, including the [unified labeling client](#aip-unified-labeling-client), [scanner](#aip-on-premises-scanner), and [SDK](#microsoft-information-protection-sdk).

:::image type="content" source="media/what-is-mip.png" alt-text="The Azure Information Protection areas of the Microsoft Information Protection framework":::

Microsoft Information Protection is the common information protection stack that's leveraged by AIP's unified labeling client. For more information, see the [Microsoft 365 documentation](/microsoft-365/compliance/protect-information).

## AIP unified labeling client

The Azure Information Protection unified labeling client extends labeling, classification, and protection capabilities to additional file types, as well as to the File Explorer and PowerShell. 

For example, in the File Explorer, right-click one or more files and select **Classify and protect** to manage the AIP functionality on the selected files.

:::image type="content" source="media/protect-from-file-explorer.png" alt-text="Classify and protect from the File Explorer":::

For details about the latest features and public preview version of the unified labeling client, see [Azure Information Protection unified labeling client - Version release history and support policy](rms-client/unifiedlabelingclient-version-release-history.md).

Download the client from the [Microsoft Azure Information Protection download page](https://www.microsoft.com/download/details.aspx?id=53018).
    
## AIP on-premises scanner

The Azure Information Protection on-premises scanner enables administrators to scan their on-premises file repositories for sensitive content that must be labeled, classified, and/or protected.

The on-premises scanner is installed using PowerShell cmdlets provided as part of the unified labeling client, and can be managed using PowerShell and the Azure Information Protection area in the Azure portal.

For example, use the scanner data shown on the Azure portal to find repositories on your network that might have sensitive content at risk:

:::image type="content" source="media/risky-repos-small.png" alt-text="Check scanned networks for risky repositories" lightbox="media/risky-repos.png":::

For more information, see:

- [What is the AIP unified labeling scanner?](deploy-aip-scanner.md)
- The scanner sections of the [AIP unified labeling client - Version release history](rms-client/unifiedlabelingclient-version-release-history.md)

Download the scanner installation together with the client from the [Microsoft Azure Information Protection download page](https://www.microsoft.com/download/details.aspx?id=53018).


## Microsoft Information Protection SDK

The Microsoft Information Protection SDK extends sensitivity labels to third-party apps and services. Developers can use the SDK to build built-in support for applying labels and protection to files.

For example, you might use the MIP SDK for:

- A line-of-business application that applies classification labels to files on export.
- A CAD/CAM design application provides built-in support for Microsoft Information Protection labeling.
- A cloud access security broker or data loss prevention solution reasons over data encrypted with Azure Information Protection.

For more information, see the [Microsoft Information Protection SDK overview](/information-protection/develop/overview).

## Next steps

**To get started with AIP**, download and install the unified labeling client and scanner.

- [Sign up for a free trial](https://admin.microsoft.com/Signup/Signup.aspx?OfferId=87dd2714-d452-48a0-a809-d2f58c4f68b7)  (Enterprise Mobility + Security E5)
- [Download the client](https://www.microsoft.com/download/details.aspx?id=53018)
- [Quickstart: Deploy the unified labeling client](quickstart-deploy-client.md)

**Get familiar with AIP** using our initial tutorials:

- [Tutorial: Installing the Azure Information Protection (AIP) unified labeling scanner](tutorial-install-scanner.md)
- [Tutorial: Finding your sensitive content with the Azure Information Protection (AIP) scanner](tutorial-scan-networks-and-content.md)
- [Tutorial: Preventing oversharing in Outlook using Azure Information Protection (AIP)](tutorial-preventing-oversharing.md)

**When you're ready to customize AIP further**, see [Admin Guide: Custom configurations for the Azure Information Protection unified labeling client](rms-client/clientv2-admin-guide-customizations.md).

**To get started with the MIP SDK**, see [Microsoft Information Protection (MIP) SDK setup and configuration](/information-protection/develop/setup-configure-mip).

### Additional resources

|Resource  |Links and description  |
|---------|---------|
|**Subscription options and pricing**     |    [Azure Information Protection Pricing](https://azure.microsoft.com/pricing/details/information-protection)     |
|**FAQs and known issues**     | [Frequently asked questions for Azure Information Protection](faqs.md) </br> [Known issues - Azure Information Protection](known-issues.md)       |
|**Support options**     | [Support options for Azure Information Protection](information-support.md)        |
|**Yammer**     |  [Azure Information Protection](https://www.yammer.com/AskIPTeam)       |
|**What's new?**     | Watch for new features related to AIP in the Microsoft 365 and SharePoint admin centers:   </br>- [What's new in the Microsoft 365 admin center?](/microsoft-365/admin/whats-new-in-preview) </br>- [What's new in the Sharepoint admin center?](/sharepoint/what-s-new-in-admin-center)     |
|     |         |

#### Top Ignite sessions

See the following recorded sessions from Ignite 2020:

- [Supercharge information protection and governance across cloud, on-premise, endpoints and remote work environments](https://myignite.microsoft.com/sessions/ceba117f-9bc7-4426-9ebc-753d94c6a476)

- [Be a risk management hero with intelligent data protection and compliance solutions](https://myignite.microsoft.com/sessions/9a1e2716-55f5-4c3e-8626-0cb77e60eb87)

- [Know your data, protect your data and prevent data loss with Microsoft Information Protection](https://myignite.microsoft.com/sessions/46ff69cf-2c8f-4e61-a923-f72f5740f02f)

- [Ask the Expert: Ask anything about Microsoft Compliance: information protection & governance, insider risks, Compliance Management, and more](https://myignite.microsoft.com/sessions/5ce48b36-9827-4d60-8540-90546333063d)
## AIP's classic client

The Azure Information Protection classic client is the earlier version of AIP, and enables administrators to manage classification labels directly in the Azure portal.

AIP labels managed in the Azure portal are *not* supported by the unified labeling platform, are limited to working with the Azure Information Protection client and scanner, and Microsoft Cloud App Security. 

We recommend migrating to unified labeling to support these features, as well as SharePoint, Microsoft 365 apps, Outlook for the web and mobile devices, PowerBI data protection, and more. For more information, see [Tutorial: Migrating from the Azure Information Protection (AIP) classic client to the unified labeling client](tutorial-migrating-to-ul.md).

>[!NOTE] 
> To provide a unified and streamlined customer experience, **Azure Information Protection classic client** and **Label Management** in the Azure Portal are being **deprecated** as of **March 31, 2021**. 
>
> This time-frame allows all current Azure Information Protection customers to transition to unified labeling using the Microsoft Information Protection Unified Labeling solution. Learn more in the official [deprecation notice](https://aka.ms/aipclassicsunset).
