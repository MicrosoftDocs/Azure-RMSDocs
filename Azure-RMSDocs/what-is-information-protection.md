---
# required metadata

title: What is Azure Information Protection (AIP)?
description: Azure Information Protection (AIP) is a service that helps organizations to label documents and emails. AIP classifies and protects data, wherever that data is saved.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 06/23/2020
ms.topic: overview
ms.collection: M365-security-compliance
ms.service: information-protection
Customer intent: As an administrator, I want to label documents and emails to classify and protect my organization's data, wherever it resides.

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin
search.appverid:
- MET150

---

# What is Azure Information Protection?

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*

Azure Information Protection (AIP) is a cloud-based solution that enables organizations to find, classify, and protect documents and emails by applying labels to content.

AIP is part of the Microsoft Information Protection (MIP) framework, and extends the labeling and classification functionality provided by Microsoft 365.

:::image type="content" source="media/what-is-mip.png" alt-text="The Azure Information Protection areas of the Microsoft Information Protection framework":::

Azure Information Protection adds the following elements to the MIP framework:

- **Microsoft Information Protection client:** Extends labeling, classification, and protection capabilities to additional file types, as well as the File Explorer and PowerShell. For example:

    :::image type="content" source="media/protect-from-file-explorer.png" alt-text="Classify and protect from the File Explorer":::

- **Microsoft Information Protection scanner:** Enables admins to scan their networks and file shares for sensitive content that must be labeled, classified, and/or protected.

    For example, find repositories that might have sensitive content at risk:

    :::image type="content" source="media/import-scanner-repositories.png" alt-text="Scanned repositories for content at risk"::: 

- **Microsoft Information Protection SDK:** Extends sensitivity labels to third-party apps and services. For example, see [Quickstart: Set and get a sensitivity label (C#)](../mip/develop/quick-file-set-get-label-csharp.md).

For more information about the MIP framework and its other elements, see [Microsoft Information Protection in Microsoft 365](https://aka.ms/MIPdocs).

For the latest details and public preview version of Azure Information Protection, see [Azure Information Protection unified labeling client - Version release history and support policy](rms-client/unifiedlabelingclient-version-release-history.md).

## Next steps

To get started with AIP, install the unified labeling client and scanner. For more information, see:

- Quickstart: Deploy the unified labeling client
- Quickstart: Install the unified labeling scanner
- Tutorial: Finding your sensitive data
- Tutorial: Preventing oversharing in Outlook

Once you're ready to fully deploy AIP for your organization, see the full list of [how-to guides](how-to-guides.md). 

If you're looking to extend your own apps and services with sensitivity labels, see the [Microsoft Information Protection SDK overview](develop/overview.md).


## Additional resources

- **Free trial:** [Enterprise Mobility + Security E5](https://admin.microsoft.com/Signup/Signup.aspx?OfferId=87dd2714-d452-48a0-a809-d2f58c4f68b7)

- **Subscription options and pricing:** [Azure Information Protection Pricing](https://azure.microsoft.com/pricing/details/information-protection)

- **Download the client:** [Azure Information Protection client](https://www.microsoft.com/download/details.aspx?id=53018)

- **Download a customizable PDF guide:** [Azure Information Protection PDF documentation](https://docs.microsoft.com/en-us/azure/information-protection/opbuildpdf/toc.pdf?branch=live)

- **FAQs:** [Frequently asked questions for Azure Information Protection](faqs.md)

- **Known issues:** [Known issues - Azure Information Protection](known-issues.md)

- **Support options** [Support options for Azure Information Protection](information-support.md)

- **Yammer:** [Azure Information Protection](https://www.yammer.com/AskIPTeam)

- **Docs twitter feed:** [https://twitter.com/docsmsft](https://twitter.com/docsmsft)

### Microsoft Ignite

Microsoft Ignite 2020 in Orlando was a great success! There was lots of good information about Azure Information Protection with the latest updates and improvements. If you couldn't join us, sessions are recorded for viewing later.

See the following list for our top five sessions that we recommend:

- [BRK2119 - Secure your sensitive data! Understanding the latest Microsoft Information Protection capabilities](https://myignite.techcommunity.microsoft.com/sessions/81172?source=sessions)
 
- [THR3067 - Know your data: Top five tips and tricks to better understand your sensitive data landscape](https://myignite.techcommunity.microsoft.com/sessions/81183)

- [BRK3103 - Protecting sensitive files and data can be hard. Choose the right data protection options that balance security and worker productivity](https://myignite.techcommunity.microsoft.com/sessions/81177?source=sessions)

- [BRK2120 - Got Azure Information Protection? Navigating unified labeling, policy configuration, clients, and analytics](https://myignite.techcommunity.microsoft.com/sessions/81178?source=sessions)

- [BRK2121 - Extend the power of sensitivity labeling and protection to your own apps and ISV solutions with the Microsoft Information Protection SDK](https://myignite.techcommunity.microsoft.com/sessions/81179?source=sessions)

## Azure Information Protection's classic client

The Azure Information Protection classic client is the earlier version of AIP, and enables administrators to manage classification labels directly in the Azure portal.

AIP labels managed in the Azure portal are *not* supported by the unified labeling platform, are limited to working with the Azure Information Protection client and scanner, and Microsoft Cloud App Security. 

We recommend migrating to unified labeling to support these features, as well as SharePoint, Microsoft 365 apps, Outlook for the web and mobile devices, PowerBI data protection, and more. For more infomration, see Tutorial: Migrating to the unified labeling platform.

>[!NOTE] 
> To provide a unified and streamlined customer experience, **Azure Information Protection client (classic)** and **Label Management** in the Azure Portal are being **deprecated** as of **March 31, 2021**. This time-frame allows all current Azure Information Protection customers to transition to our unified labeling solution using the Microsoft Information Protection Unified Labeling platform. Learn more in the official [deprecation notice](https://aka.ms/aipclassicsunset).