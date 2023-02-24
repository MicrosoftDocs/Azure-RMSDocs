---
# required metadata

title: What is Azure Information Protection (AIP)?
description: Azure Information Protection (AIP) extends the Microsoft Purview Information Protection framework to extend the labeling and classification functionality provided by Microsoft 365.
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 11/09/2020
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
ms.custom: contperf-fy21q2
search.appverid:
- MET150

---

# What is Azure Information Protection?

[!INCLUDE [looking-for-mip](includes/looking-for-mip.md)]

Azure Information Protection (AIP) is part of **Microsoft Purview Information Protection** (formerly Microsoft Information Protection or MIP). Microsoft Purview Information Protection helps you discover, classify, protect, and govern sensitive information wherever it lives or travels.

AIP extends the [labeling](/microsoft-365/compliance/sensitivity-labels) and [classification](/microsoft-365/compliance/data-classification-overview) functionality provided by Microsoft Purview with the following capabilities:

- The [**unified labeling client**](#aip-unified-labeling-client)
- An on-premises [**scanner**](#on-premises-scanner)
- The [**SDK**](#microsoft-information-protection-sdk)

AIP also provides the encryption service, [Azure Rights Management](what-is-azure-rms.md), that's used by Microsoft Purview Information Protection.

For a comprehensive list of capabilities from Microsoft Purview Information Protection, see [Protect your sensitive data with Microsoft Purview](/microsoft-365/compliance/information-protection).

## AIP unified labeling client

The Azure Information Protection unified labeling client extends labeling, classification, and protection capabilities to additional file types, as well as to File Explorer and PowerShell.

For example, in File Explorer, right-click one or more files and select **Classify and protect** to manage the AIP functionality on the selected files.

:::image type="content" source="media/protect-from-file-explorer.png" alt-text="Classify and protect from the File Explorer":::

Download the client from the [Microsoft Azure Information Protection download page](https://www.microsoft.com/download/details.aspx?id=53018).
    
## On-premises scanner

The on-premises scanner enables administrators to scan their on-premises file repositories for sensitive content that must be labeled, classified, and/or protected.

The on-premises scanner is installed using PowerShell cmdlets provided as part of the unified labeling client, and can be managed using PowerShell and the information protection scanner area in the Microsoft Purview compliance portal.

For example, configure the content scan job setting for the on-premises scanner within the Microsoft Purview compliance portal:

:::image type="content" source="media/information-protection-scanner.png" alt-text="Screenshot of how to configure content scan jobs on information protection scanner." lightbox="media/information-protection-scanner.png":::

For more information, see:

- [Learn about the information protection scanner](/microsoft-365/compliance/deploy-scanner)
- The scanner sections of the [AIP unified labeling client - Version release history](rms-client/unifiedlabelingclient-version-release-history.md)

Download the scanner installation together with the client from the [Microsoft Azure Information Protection download page](https://www.microsoft.com/download/details.aspx?id=53018).


## Microsoft Information Protection SDK

The Microsoft Information Protection SDK extends sensitivity labels to third-party apps and services. Developers can use the SDK to build built-in support for applying labels and protection to files.

For example, you might use the MIP SDK for:

- A line-of-business application that applies sensitivity labels to files on export.
- A CAD/CAM design application that provides support for built-in labeling.
- A cloud access security broker or data loss prevention solution that reasons over data encrypted with Azure Information Protection.

For more information, see the [Microsoft Information Protection SDK overview](/information-protection/develop/overview).

## Next steps

**To get started with AIP**, download and install the unified labeling client and scanner.

- [Sign up for a free trial](https://admin.microsoft.com/Signup/Signup.aspx?OfferId=87dd2714-d452-48a0-a809-d2f58c4f68b7)  (Enterprise Mobility + Security E5)
- [Download the client](https://www.microsoft.com/download/details.aspx?id=53018)
- [Quickstart: Deploy the unified labeling client](quickstart-deploy-client.md)

**Get familiar with AIP** using our initial tutorials:

- [Tutorial: Installing the Azure Information Protection (AIP) unified labeling scanner](tutorial-install-scanner.md)
- [Tutorial: Finding your sensitive content with the Azure Information Protection (AIP) scanner](tutorial-scan-networks-and-content.md)

**When you're ready to customize AIP further**, see [Admin Guide: Custom configurations for the Azure Information Protection unified labeling client](rms-client/clientv2-admin-guide-customizations.md).

**To get started with the MIP SDK**, see [Microsoft Information Protection (MIP) SDK setup and configuration](/information-protection/develop/setup-configure-mip).

### Additional resources

|Resource  |Links and description  |
|---------|---------|
|**Subscription options and licensing guidance**     |    [Microsoft 365 licensing guidance for security & compliance](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance)    |
|**FAQs and known issues**     | [Frequently asked questions for Azure Information Protection](faqs.md) </br> [Known issues - Azure Information Protection](known-issues.md)       |
|**Support options**     | [Support options for Azure Information Protection](information-support.md)        |
|**Yammer**     |  [Information protection team](https://www.yammer.com/AskIPTeam)       |
|**Release management and supportability**     | [AIP unified labeling client - Release management and supportability](/rms-client/unifiedlabelingclient-version-release-history.md) <br><br>See also: <br>- [Removed and retired services](removed-sunset-services.md)<br>- [What's new in Microsoft Purview risk and compliance solutions](/microsoft-365/compliance/whats-new)<br>- [Microsoft 365 roadmap](https://www.microsoft.com/en-us/microsoft-365/roadmap?filters=&searchterms=compliance) |


#### Top Ignite sessions

See the following recorded sessions from Ignite 2020:

- [**Supercharge information protection and governance** across cloud, on-premises, endpoints and remote work environments](https://myignite.microsoft.com/archives/IG20-DB163) | [Ask the expert](https://myignite.microsoft.com/archives/IG20-ATE-DB163)

- [**Be a risk management hero** with intelligent data protection and compliance solutions](https://myignite.microsoft.com/archives/IG20-DB159) | [Ask the expert session 1](https://myignite.microsoft.com/archives/IG20-ATE-DB159) | [Ask the expert session 2](https://myignite.microsoft.com/archives/IG20-ATE-DB159-R1)

- [**Know your data, protect your data and prevent data loss** with Microsoft Information Protection](https://myignite.microsoft.com/archives/IG20-OD273)

- **Ask anything about Microsoft Compliance**: information protection & governance, insider risks, Compliance Management, and more: [Ask the expert session 1](https://myignite.microsoft.com/archives/IG20-ATE-DB163-R1) | [Ask the expert session 2](https://myignite.microsoft.com/archives/IG20-ATE-DB170)
