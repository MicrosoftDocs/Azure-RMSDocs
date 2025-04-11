---
title: MIP SDK FIPS Compliance Statement
description: Details about the MIP SDK and FIPS Compliance Status
author: tommoser
ms.author: tommos
ms.date: 04/10/2025
ms.topic: conceptual
ms.service: information-protection
---

# FIPS 140-2 Validation

The Microsoft Information Protection SDK version 1.14 and above can be configured to use the FIPS validated version of OpenSSL 3.0. To use the FIPS validated OpenSSL 3.0 module, developers must install and load the FIPS module.

## FIPS 140-2 Compliance

The Microsoft Information Protection SDK uses OpenSSL to implement all cryptographic operations. OpenSSL isn't FIPS compliant without more configuration by the developer. To develop a FIPS 140-2 compliant application, OpenSSL in the MIP SDK must be configured to load the FIPS module to perform cryptographic operations instead of the default OpenSSL ciphers.

## Install and configure the FIPS Module

Applications using OpenSSL can install and load the FIPS module with the following procedure published by OpenSSL:
1. Install FIPS module following [Appendix A: Installation and Usage Guidance](https://www.openssl.org/source/fips-doc/openssl-3.0.8-security-policy-2023-05-05.pdf)
2. Load FIPS module in MIP SDK by [Making all applications use the FIPS module by default](https://www.openssl.org/docs/man3.0/man7/fips_module.html). Configure the [OpenSSL_MODULES](https://www.openssl.org/docs/manmaster/man7/openssl-env.html) environment variable to the directory containing the fips.dll.
4. (Optional) Configure the FIPS module for some applications only by [Selectively making applications use the FIPS module by default](https://www.openssl.org/docs/man3.0/man7/fips_module.html)

When the FIPS module is successfully loaded, the MIP SDK log declares FIPS as the OpenSSL provider.
```
"OpenSSL provider loaded: [fips]"
```
If installation fails, the OpenSSL provider remains default.
```
 "OpenSSL provider loaded: [default]"
```

Limitations of MIP SDK with FIPS 140-2 validated ciphers:
- Android and macOS are not supported. The FIPS module is available on Windows, Linux, and Mac.

## TLS Requirements

MIP SDK prohibits the use of TLS versions prior to 1.2 unless the connection is made to an Active Directory Rights Management server.

## Cryptographic Algorithms in MIP SDK

| Algorithm | Key Length        | Mode     | Comment                                                                                                                                                       |
| --------- | ----------------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| AES       | 128, 192, 256-bit | ECB, CBC | MIP SDK always protects by default with AES256 CBC. Legacy versions of Office (2010) require AES 128 ECB, and Office docs are still protected in this manner by Office apps. |
| RSA       | 2048-bit          | n/a      | Used for signing and protecting session key that protects a symmetric key blob.                                                                               |
| SHA-1     | n/a               | n/a      | Hash algorithm used in signature validation for legacy publishing licenses.                                                                                             |
| SHA-256   | n/a               | n/a      | Hash algorithm used in data validation, signature validation, and as database keys.                                                                                     |

## Next Steps

For details on the internals and specifics of how AIP protects content, review the following documentation:
  - [How Azure RMS Works](/azure/information-protection/how-does-it-work)
  - [MS-RMPR Protocol Specification](/openspecs/windows_protocols/ms-rmpr/d8ed4b1e-e605-4668-b173-6312cba6977e)
  - [Licenses, Certificates, and how AD RMS protects and consumes documents](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/licenses-and-certificates-and-how-ad-rms-protects-and-consumes/ba-p/247309)
