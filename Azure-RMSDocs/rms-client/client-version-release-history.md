---
# required metadata

title: Azure Information Protection client - Version history & support policy
description: See what's new or changed in a release of the Azure Information Protection client for Windows, and understand the lifecycle policy for support. 
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 11/09/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:git
#ms.devlang:
ms.subservice: v1client
ms.reviewer: elkamins
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Azure Information Protection client: Version release history and support policy


>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows Server 2019, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012*
>
> *Instructions for: [Azure Information Protection client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

>[!NOTE] 
> To provide a unified and streamlined customer experience, **Azure Information Protection classic client** and **Label Management** in the Azure Portal are being **deprecated** as of **March 31, 2021**. This time-frame allows all current Azure Information Protection customers to transition to our unified labeling solution using the Microsoft Information Protection Unified Labeling platform. Learn more in the official [deprecation notice](https://aka.ms/aipclassicsunset).

> [!TIP]
> Interested in using the Azure Information Protection unified labeling client because your labels are published from the Office 365 Security & Compliance Center, Microsoft 365 security center, or Microsoft 365 compliance center? When you download and then install the unified labeling client from the Microsoft Download Center, you can upgrade your Azure Information Protection client to the [unified labeling client](unifiedlabelingclient-version-release-history.md).

**To deploy the AIP classic client,** open a support ticket to get download access.

For more information, see [Upgrading and maintaining the Azure Information Protection client](client-admin-guide.md#upgrading-and-maintaining-the-azure-information-protection-client).

### Servicing information and timelines

Each general availability (GA) version of the Azure Information Protection client is supported for up to six months after the release of the subsequent GA version. With the exception of this section, the documentation does not include information about unsupported versions of the client. Fixes and new functionality are always applied to the latest GA version and will not be applied to older GA versions.

##### General availability versions that are no longer supported:

|Client version|Date released|
|--------------|-------------|
|1.54.33.0 | 10/23/2019|
|1.53.10|07/15/2019|
|1.48.204.0|04/16/2019|
|1.41.51.0|11/27/2018|
|1.37.19.0|09/17/2018|
|1.29.5.0|06/26/2018|
|1.27.48.0|05/30/2018|
|1.26.6.0|04/17/2018|
|1.10.56.0|09/18/2017|
|1.7.210.0|06/06/2017|
|1.4.21.0|03/15/2017|
|1.3.155.2|02/08/2017|
|1.2.4.0.0|10/27/2016|
|1.1.23.0|10/01/2016|

The date format used on this page is *month/day/year*.

Starting 6/2/2019, the labeling service for Azure Information Protection requires connections that use TLS 1.2.

All client versions from 1.4.21.0 released 03/15/2017 support TLS 1.2. Client versions **1.3.155.2**, **1.2.4.0**, and **1.1.23.0** do not use TLS 1.2 and therefore can no longer download the Azure Information Protection policy.

### Release history

Use the following information to see what's new or changed for a supported release of the Azure Information Protection client for Windows. The most current release is listed first.

Noted Azure Information Protection features are currently in PREVIEW. The [Azure Preview Supplemental Terms](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) include additional legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability. 

> [!NOTE]
> Minor fixes are not listed so if you experience a problem with the Azure Information Protection client, we recommend that you check whether it is fixed with the latest GA release. If the problem remains, check the current preview version (if available).
>  
> For technical support, see the [Support options and community resources](../information-support.md#support-options-and-community-resources) information. We also invite you to engage with the Azure Information Protection team, on their [Yammer site](https://www.yammer.com/askipteam/).

## Version 1.54.59.0

**Released**: 02/12/2020

This version includes fixes only. 

**Fixes**:

- Issue where files protected by IQP displayed **recover** and/or **save as** options after protection was removed, are resolved. 

- Numerous product feature tooltip texts were improved for clarity and ease of understanding. 

- Issues surrounding client stability when working with protected PDF files is resolved. 

- Protection labels are now removed as expected if the label is deleted on the email during the email creation process. 

## Next steps

Not sure if this is the right client to install?  See [Choose which labeling client to use for Windows computers](use-client.md#choose-which-labeling-client-to-use-for-windows-computers).

For more information about installing and using the client: 

- For users: [Download and install the client](install-client-app.md)

- For admins: [Azure Information Protection client administrator guide](client-admin-guide.md)
