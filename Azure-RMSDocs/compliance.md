---
# required metadata

title: Compliance & information for Azure Information Protection
description: Supporting information for Azure Information Protection that includes legal, compliance, and SLAs.
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 12/08/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: b3a7127b-6d24-4439-bc4e-2a0a325e8ea3

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---



# Compliance and supporting information for Azure Information Protection

[!INCLUDE [looking-for-mip](includes/looking-for-mip.md)]

Azure Information Protection supports other services and also relies on other services. If you’re looking for information that is related to Azure Information Protection but not about how to use the Azure Information Protection service, check the following resources:

## Suitability for different countries

Given the variability between laws and regulations in different countries, different use cases and scenarios, and the varying requirements between different business sectors, you will need to consult your legal adviser to help you answer whether Azure Information Protection is suitable for your country.

However, some relevant information that can help your legal adviser make a determination:

- Azure Information Protection uses AES 256 and AES 128 to encrypt documents. [More information](./how-does-it-work.md#cryptographic-controls-used-by-azure-rms-algorithms-and-key-lengths)

- All encryption keys used by Azure Information Protection are protected with a customer-specific root key that uses RSA 2048 bits. RSA 1024 bits is also supported for backwards compatibility. [More information](./how-does-it-work.md#cryptographic-controls-used-by-azure-rms-algorithms-and-key-lengths)

- Customer-specific root keys are either managed by Microsoft or provisioned by the customer in a nCipher HSM by using "bring your own key" (BYOK). Azure Information Protection also supports features for on-premises protection, for content that cannot be protected with a cloud-based key. For more information, see [Planning and implementing your Azure Information Protection tenant key](plan-implement-tenant-key.md).

- The Azure Information Protection service is hosted in regional data centers across the globe. Azure Information Protection keys always remain within the region in which is originally deployed.
  
- Azure Information Protection does not transmit document contents from clients to the Azure Information Protection service. Content encryption and decryption operations are performed in-place in the client device. Or, for service-based rendering, these operations are performed within the service that’s rendering the content. [More information](./how-does-it-work.md)

## Legal and privacy

- For Microsoft Azure agreement information: [Microsoft Azure Agreement](https://azure.microsoft.com/support/legal/subscription-agreement/)

- For Microsoft Azure privacy information: [Microsoft Azure Privacy Statement](https://azure.microsoft.com/support/legal/privacy-statement/)

## Security, compliance, and auditing

See the [Security, compliance, and regulatory requirements](/purview/azure-rights-management-learn-about#security-compliance-and-regulatory-requirements) section in the [Learn about the Azure Rights Management service](/purview/azure-rights-management-learn-about) article, for information about specific certifications for the Azure Rights Management service. In addition:

- For external certifications for Azure Information Protection: [Microsoft Azure Trust Center](https://azure.microsoft.com/support/trust-center/)

- For FIPS 140 information: [FIPS 140 Validation](/windows/security/threat-protection/fips-140-validation)

For in-depth technical information about how the protection technology works, see [How does Azure RMS work?](./how-does-it-work.md) 

## Service level agreements

- [SLA for Azure Information Protection](https://azure.microsoft.com/support/legal/sla/information-protection/v1_0/)

- [SLA for Microsoft Entra ID](https://azure.microsoft.com/support/legal/sla/active-directory/v1_0/)

- [SLA for Azure Key Vault](https://azure.microsoft.com/support/legal/sla/key-vault/v1_0/)

## Documentation

- Microsoft Entra documentation: [Microsoft Entra ID](/azure/active-directory/fundamentals/active-directory-whatis)

- Microsoft 365 documentation: [Microsoft 365 for enterprise documentation and resources](/Office365/Enterprise/)
