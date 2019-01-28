---
# required metadata

title: The client for Azure Information Protection
description: Microsoft Azure Information Protection provides a client-server solution that helps to protect an organization's data. The client (the Azure Information Protection client or the Rights Management client) is integrated with applications that you run on computers and mobile devices.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 11/19/2018
ms.topic: conceptual
ms.service: information-protection
ms.assetid: a6fa85be-f92a-4e00-9efc-9dbfd4dfbfcb

# optional metadata

#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# The client side of Azure Information Protection

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*

Azure Information Protection provides a client-server solution that helps to protect an organization's documents and emails:

- The client can be the Azure Information Protection client or the Rights Management client, and this client integrates with applications that you run on computers and mobile devices. 

- The service resides in the cloud (Azure Information Protection, which uses the Azure Rights Management service for the data protection) or on-premises (Active Directory Rights Management Services). 

The Azure Information Protection client supports classification and labeling, in addition to protection. This client integrates with Office applications and must be installed separately.

The Rights Management (RMS) client is automatically installed with some applications, such as Office applications, the Azure Information Protection client, and RMS-enlightened applications from software vendors. However, it can also be installed by itself, which supports scenarios such as developers who want to integrate Rights Management protection into line-of-business applications.

Use the following documentation when you need more information about how to deploy and use these clients, which can be used with Azure Information Protection and Active Directory Rights Management Services to help protect your organization's data:

- [Azure Information Protection client](AIP-client.md)

- [RMS client deployment notes](client-deployment-notes.md)

- [RMS protection with Windows Server File Classification Infrastructure (FCI)](configure-fci.md)

- [Rights Management sharing application for Windows](sharing-app-windows.md)

Note that the Rights Management sharing application for Windows and the RMS Protection Tool is now replaced by the Azure Information Protection client. 


## See also
[Comparing Azure Information Protection and AD RMS](../compare-on-premise.md)
