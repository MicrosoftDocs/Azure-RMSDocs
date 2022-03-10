---
# required metadata

title: Operations for your Azure Information Protection tenant key
description: Identify the different levels of control and responsibility that you have for your Azure Information Protection tenant key.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 11/11/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 1284d0ee-0a72-45ba-a64c-3dcb25846c3d

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: kms
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Operations for your Azure Information Protection tenant key

>**Applies to*: [Azure Information Protection](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection), [Office 365](https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RE4Dz8M)*
>
>***Relevant for**: [AIP unified labeling client and classic client](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

[!INCLUDE [AIP classic client is sunset](includes/classic-client-sunset.md)]


Depending on your tenant key topology for Azure Information Protection, you have different levels of control and responsibility for your Azure Information Protection tenant key. The two key topologies are **Microsoft-managed** and **customer-managed**.

When you manage your own tenant key in Azure Key Vault, this is often referred to as bring your own key (BYOK). For more information about this scenario and how to choose between the two tenant key topologies, see [Planning and implementing your Azure Information Protection tenant key](plan-implement-tenant-key.md).

The following table identifies the operations that you can do, depending on the topology that you’ve chosen for your Azure Information Protection tenant key.

|Life cycle operation|Microsoft-managed (default)|Customer-managed (BYOK)|
|-----------------------|-------------------------------|---------------------------|
|Revoke your tenant key|No (automatic)|Yes|
|Rekey your tenant key|Yes|Yes|
|Backup and recover your tenant key|No|Yes|
|Export your tenant key|Yes|No|
|Respond to a breach|Yes|Yes|

After you have identified which topology you have implemented, select one of the following links for more information about these operations for your Azure Information Protection tenant key:

- [Microsoft-managed tenant key](operations-microsoft-managed-tenant-key.md)
- [Customer-managed tenant key](operations-customer-managed-tenant-key.md)

However, if you want to create an Azure Information Protection tenant key by importing a trusted publishing domain (TPD) from Active Directory Rights Management Services, this import operation is part of the [migration from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md). As part of the design, an AD RMS TPD can only be imported to one tenant. 

