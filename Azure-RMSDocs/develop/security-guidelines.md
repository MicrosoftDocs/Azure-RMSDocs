---
# required metadata

title: Security Best Practices for Information Protection
description: RMS-enabled applications are best built using Information Protection best practices.
author: lleonard-msft
ms.author: alleonar
manager: mbaldwin
ms.date: 12/11/2018
ms.topic: conceptual
ms.assetid: 4e9f72d5-9e7c-43e1-bb8a-5972dd22dcee
ms.service: information-protection
ms.suite: ems
ms.reviewer: kartikk
---

# Security best practices for Information Protection

Information Protection Software Development Kits (SDK) provide a robust system for publishing and consuming protected information of all types. To help a system be as strong as possible, information protection-enabled applications must be built using best practices. Applications share responsibility in helping maintain the security of this ecosystem. Identifying security risks and providing mitigations for those risks introduced during application development helps to minimize the likelihood of a less secure software implementation.

This information supplements the legal agreement that must be signed, to obtain digital certificates for applications using the SDKs.

## Subjects not covered

Although the following subjects are important considerations for creating a development environment and secure applications, they're out of scope for this article:

- **Software development process management** — Configuration management, securing source code, minimizing access to debugged code, and assigning priority to bugs. For some customers, having a more secure software development process is of paramount importance to them. Some customers even prescribe a development process.
- **Common coding errors** — Information for avoiding buffer overruns. We recommend the latest version of Writing Secure Code by Michael Howard and David LeBlanc (Microsoft Press, 2002) to review these generic threats and mitigations.
- **Social engineering** — Includes information about procedural and structural safeguards, to help protect code against exploitation by developers or others within the manufacturer's organization.
- **Physical security** — Includes information about locking down access to your code base and signing certificates.
- **Deployment or distribution of prerelease software** — Includes information about distributing your beta software.
- **Network management** — Includes information about intrusion-detection systems on your physical networks.

## Threat models and mitigations

Digital information owners need the ability to evaluate the environments in which their assets will be decrypted. A statement of minimum security standards provides information owners with a framework for understanding and assessing the security level of the applications.

Some industries, such as government and health care, have certification and accreditation processes and standards that may apply to your product. Meeting these minimum security recommendations isn't a substitute for the unique accreditation needs of your customers. However, the intent of the security standards is to help you prepare for current and future customer requirements, and any investment you make early in the development cycle will benefit your application. These guidelines are recommendations, not a formal Microsoft certification program.

There are several major categories of vulnerabilities in a rights management services system including:

- **Leakage** — Information appears in unauthorized locations.
- **Corruption** — Software or data is modified in an unauthorized manner.
- **Denial** — A computing resource isn't available for use.

These topics focus primarily on leakage issues. The integrity of an API system depends upon its ability, over time, to protect information, enabling access only to designated entities. These topics also touch upon corruption issues. Denial issues aren't covered.

Microsoft doesn't test or review test results related to meeting the minimum standard. The partner is responsible for ensuring the minimum standards are met. Microsoft provides two additional levels of recommendations to help mitigate common threats. In general, these suggestions are additive. For example, meeting preferred recommendations assumes that you have met minimum standards, where applicable, unless otherwise specified.

|Standard level|Description|
|---|---|
|Minimum standard| An application that handles protected information must meet the minimum standard, before it can be signed with the production certificate received from Microsoft. Partners generally use the production hierarchy certificate, at the time of final release of the software. A partner's own internal tests are used to verify whether the application meets this minimum standard. Meeting the minimum standard isn't, and shouldn't be construed as, a guarantee of security by Microsoft. Microsoft doesn't test or review test results related to meeting the minimum standard. The partner is responsible for ensuring the minimum is met.|
|Recommended standard| Recommended guidelines both chart a path to improved application security, and provide an indication of how the SDK may evolve as more security criteria are implemented. Vendors may differentiate their applications by building to this higher level of security guidelines.|
|Preferred standard| This standard is the highest category of security currently defined. Vendors who develop applications marketed as highly secure should aim for this standard. Applications that adhere to this standard are likely to be the least vulnerable to attack.|

## Malicious software

Microsoft has defined minimum required standards that your application must meet to protect content from malicious software.

### Importing malicious software by using address tables

The information protection SDK doesn't support code modification at run time or modification of the import address table (IAT). An import address table is created for every DLL loaded in your process space. It specifies the addresses of all functions that your application imports. One common attack is to modify the IAT entries within an application to, for example, point to malicious software. The SDK stops the application when it detects this type of attack.

### Minimum standard

- You can't modify the import address table in the application process during execution. Your application specifies many of the functions called at run time by using address tables. These tables can't be altered during or after run time. Among other things, this restriction means you can't perform code-profiling on an application signed by using the production certificate.
- You can't call the **DebugBreak** function from within any DLL specified in the manifest.
- You can't call **LoadLibrary** with the **DONT_RESOLVE_DLL_REFERENCES** flag set. This flag tells the loader to skip binding to the imported modules, thereby modifying the import address table.
- You can't alter delayed loading by making run-time or subsequent changes to the /DELAYLOAD linker switch.
- You can't alter delayed loading by providing your own version of the Delayimp.lib helper function.
- You can't unload modules that are delay-loaded by authenticated modules, while the information protection SDK environment exists.
- You can't use the **`/DELAY:UNLOAD`** linker switch to enable unloading of delayed modules.

## Incorrectly interpreting license rights

If your application doesn't correctly interpret and enforce the rights expressed in the SDK issuance license, you may make information available in ways that the information owner didn't intend. For example, when an application allows a user to save unencrypted information to new media, when the issuance license only confers the right to view the information.

### Azure Information Protection (AIP)

The information protection system organizes rights into a few groupings. For more information, see [Configuring usage rights for Azure Rights Management](../configure-usage-rights.md).

AIP allows a user to either decrypt information or not. The information doesn't have any inherent protection. If a user has the right to decrypt, the API permits it. The application is responsible for managing or protecting that information after it is in the clear. An application is responsible for managing its environment and interface to prevent the unauthorized use of information. For example, disabling the **Print** and **Copy** buttons if a license only grants the PLAY right. Your test suite should verify that your application acts correctly on all the license rights that it recognizes.

### Minimum standard

- The customer implementation of XrML v.1.2 rights should be consistent with the definitions of these rights, as described in the XrML specifications, which are available at the XrML Web site (http://www.xrml.org). Any rights that are specific to your application must be defined for all entities that have an interest in your application.
- Your test suite and test process should verify that your application executes properly against the rights that the application supports. It should also verify that it **doesn't** act upon unsupported rights.
- If you're building a publishing application, you must make information available that explains the intrinsic rights used. This includes those that are,  and aren't, supported by the publishing application, and how these rights should be interpreted. In addition, the user interface should make clear to the end user what the implications are of each right granted or denied an individual piece of information.
- Any rights that are abstracted, by inclusion in new rights implemented by an application, must be mapped to the new terminology. For example, a new right called MANAGER might include as abstracted rights the PRINT, COPY, and EDIT rights.

### Recommended standard

None at this time.

### Preferred standard

None at this time.

## Next steps

Best practices for implementing applications by using the API SDK include the following articles:

- [Threat Models and Mitigations](https://msdn.microsoft.com/library/aa362751.aspx)
- [Security Attacks](https://msdn.microsoft.com/library/aa362736.aspx)
