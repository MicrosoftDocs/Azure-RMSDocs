---
# required metadata

title: How-to instructions for Azure Information Protection common scenarios 
description: Identify use cases that classify and protect your organization's data by using Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 09/18/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: eymanor
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# How-to guides for common scenarios that use Azure Information Protection

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*
>
> *Instructions for: [Azure Information Protection client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-client-and-the-azure-information-protection-unified-labeling-client)*

There are many ways in which you can use Azure Information Protection to classify and optionally, protect your organization's documents and emails. 

The most successful deployments are those that identify specific use cases that provide the most business benefit to the organization. Use the following list of common scenarios and instructions to get your deployment off the ground.

## Common scenarios

|Scenario: I want to ...|Instructions|
|----------------|---------------|
|Find what sensitive information my organization stores on-premises|[Quickstart: Find what sensitive information you have in files stored on-premises](quickstart-findsensitiveinfo.md)|
|Make it easy for users to protect their emails that contain sensitive information|[Quickstart: Configure a label for users to easily protect emails that contain sensitive information](quickstart-label-dnf-protectedemail.md)|
|Make it easy for users to classify data as it's created or edited, and protect it if it contains sensitive information| [Tutorial: Edit the policy and create a new label](infoprotect-quick-start-tutorial.md)|
|Make it easy for users to collaborate on a protected document|[Configuring secure document collaboration by using Azure Information Protection](secure-collaboration-documents.md)|
|Automatically protect users' emails that are sent outside the organization| [Configuring mail flow rules for Azure Information Protection labels](configure-exo-rules.md)
|Automatically classify and protect existing data in my on-premises data stores|[Deploying the Azure Information Protection scanner](deploy-aip-scanner.md)|
|Use my own key to protect my organization's data| [Planning and implementing your tenant key](plan-implement-tenant-key.md)|
|Migrate from AD RMS|[Migrating from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md)|

## Additional deployment instructions

Our [Azure Information Protection technical blog](https://aka.ms/AIPblog) includes additional guidance from the trenches.

For example, a methodology with best practices for business decision makers and IT implementers:

- [Azure Information Protection Deployment Acceleration Guide](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/Azure-Information-Protection-Deployment-Acceleration-Guide/ba-p/334423)

Step-by-step instructions:

- [Create richer reports with Microsoft Information Protection and Azure AD login data](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/Create-richer-reports-with-Microsoft-Information-Protection-and/ba-p/392713)

- [Leverage Microsoft Cloud App Security to apply Azure Information Protection labels in the cloud](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/Leverage-Microsoft-Cloud-App-Security-to-apply-Azure-Information/ba-p/388638)

- [How to prepare an Azure Information Protection “Cloud Exit” plan](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/How-to-prepare-an-Azure-Information-Protection-Cloud-Exit-plan/ba-p/382631)

- [Cross-Tenant Label Visualization](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/Cross-Tenant-Label-Visualization/ba-p/356588)

- [Using Azure Information Protection to protect PDF’s and Adobe Acrobat Reader to view them](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/Using-Azure-Information-Protection-to-protect-PDF-s-and-Adobe/ba-p/282010)

- [Cataloging your Sensitive Data with AIP, Even Before Configuring Labels!](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/Cataloging-your-Sensitive-Data-with-AIP-Even-Before-Configuring/ba-p/267241)

- [Azure Information Protection Scanner Express Installation](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/Azure-Information-Protection-Scanner-Express-Installation/ba-p/265424)

- [Discovery of Sensitive Data Using the AIP Scanner (AIP Premium P1)](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/Discovery-of-Sensitive-Data-Using-the-AIP-Scanner-AIP-Premium-P1/ba-p/252040)

## Next steps

Don't see your scenario listed? Check the [Deployment roadmap](deployment-roadmap.md) for a full list of planning and deployment steps.

If you're new to Azure Information Protection, review [What is Azure Information Protection?](what-is-information-protection.md) for a quick introduction to the service before you begin your deployment.
