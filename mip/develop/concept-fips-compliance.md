---
title: MIP SDK FIPS Compliance Statement
description: Details regarding the MIP SDK and FIPS Compliance Status
author: tommoser
ms.author: tommoser
ms.date: 07/06/2021
ms.topic: conceptual
ms.service: information-protection
---

# FIPS 140-2 Compliance

At the time of publishing of this document, the MIP SDK is not using FIPS 140-2 validated cryptographic libraries. The SDK uses FIPS 140-2 approved ciphers. Applications consuming the MIP SDK cannot be considered FIPS compliant at this time.

## Cryptographic Modules

The Microsoft Information Protection SDK uses OpenSSL 1.1.1 to implement all cryptographic operations, except for establishing TLS connections. TLS connections are established and secured using operating system-specific APIs and may be FIPS compliant depending on the operating system. Windows uses Schannel to establish TLS connection and is FIPS 140-2 compliant.

## Plans for Reaching FIPS 140-2 Compliance

The OpenSSL team has announced plans to have OpenSSL 3.0 FIPS 140-2 validated. The MIP SDK team will update to OpenSSL 3.0 in the SDK release immediately following OpenSSL 3.0 availability. FIPS 140-2 compliance will be achieved when the OpenSSL team has completed FIPS validation efforts.

## TLS Requirements

MIP SDK prohibits the use of TLS versions prior to 1.2 unless the connection is made to an Active Directory Rights Management server.

## Cryptographic Algorithms in MIP SDK

| Algorithm | Key Length        | Mode     | Comment                                                                                                                                                       |
| --------- | ----------------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| AES       | 128, 192, 256-bit | ECB, CBC | MIP SDK always protects by default with AES256 CBC. Legacy versions of Office (2010) require AES 128 ECB, and Office docs are still protected in this manner. |
| RSA       | 2048-bit          | n/a      | Used for signing and protecting session key that protects a symmetric key blob.                                                                               |
| SHA-1     | n/a               | n/a      | Hash algorithm used in signature validation for legacy publishing licenses.                                                                                             |
| SHA-256   | n/a               | n/a      | Hash algorithm used in data validation, signature validation, and as database keys.                                                                                     |

## Next Steps

For details on the internals and specifics of how AIP protects content, review the follow documentation:
  - [How Azure RMS Works](https://docs.microsoft.com/azure/information-protection/how-does-it-work)
  - [MS-RMPR Protocol Specification](https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-rmpr/d8ed4b1e-e605-4668-b173-6312cba6977e)
  - [Licenses, Certificates, and how AD RMS protects and consumes documents](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/licenses-and-certificates-and-how-ad-rms-protects-and-consumes/ba-p/247309)