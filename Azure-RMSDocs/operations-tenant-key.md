---
# required metadata

title: Operations for your Azure Information Protection tenant key
description: Identify the different levels of control and responsibility that you have for your Azure Information Protection tenant key.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 08/31/2018
ms.topic: conceptual
ms.service: information-protection
ms.assetid: 1284d0ee-0a72-45ba-a64c-3dcb25846c3d

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Operations for your Azure Information Protection tenant key

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

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

However, if you want to create an Azure Information Protection tenant key by importing a trusted publishing domain (TPD) from Active Directory Rights Management Services, this import operation is part of the [migration from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md).  

