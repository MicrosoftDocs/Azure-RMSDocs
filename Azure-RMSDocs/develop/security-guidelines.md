---
# required metadata

title: Security Best Practices | Microsoft Information Protection
description: RMS-enabled applications are best built using Azure Information Protection best practices.
author: lleonard-msft
ms.author: alleonar
manager: mbaldwin
ms.date: 02/23/2017
ms.topic: conceptual
ms.assetid: 4e9f72d5-9e7c-43e1-bb8a-5972dd22dcee
ms.service: information-protection
ms.suite: ems
ms.reviewer: kartikk
---

# Security Best Practices for Azure Information Protection

The Azure Information Protection (AIP) Software Development Kit (SDK) provides a robust system for publishing and consuming protected information of all types. To help an AIP   system be as strong as possible, AIP enabled applications must be built using AIP    best practices. AIP enabled applications share responsibility for helping to maintain the security of this ecosystem. Identifying security risks and providing mitigations for those risks introduced during application development helps to minimize the likelihood of a less secure software implementation.

Best practices for implementing applications by using the Azure Information Protection Software Development Kit (SDK) include the following categories of suggestions:
- [Threat Models and Mitigations](https://msdn.microsoft.com/library/aa362751.aspx)
- [Security Attacks](https://msdn.microsoft.com/library/aa362736.aspx)

This information supplements the legal agreement that must be signed in order to obtain the digital certificates needed to implement applications using the AIP SDK.

## Subjects Not Covered in These Topics
These topics briefly describe the following issues, which are significant when attempting to create both a development environment and a secure application:
- **Software development process management** — Includes information about configuration management, securing source code, minimizing access to debugged code, and assigning priority to bugs. For some of your customers, having a more secure software development process is of paramount importance to them. Some customers even prescribe a development process.
- **Common coding errors** — Includes information about avoiding buffer overruns. We recommend the latest version of Writing Secure Code by Michael Howard and David LeBlanc (Microsoft Press, 2002) to review these generic threats and mitigations.
- **Social engineering** — Includes information about procedural and structural safeguards that help protect against exploitation of code by developers or others within the manufacturer's organization.
- **Physical security** — Includes information about locking down access to your code base and signing certificates.
- **Deployment or distribution of prerelease software** — Includes information about distributing your beta software.
- **Network management** — Includes information about intrusion-detection systems on your physical networks.

## Threat Models and Mitigations
Digital information owners need to be able to evaluate the environments in which their assets will be decrypted. A statement of minimum security standards can provide information owners with a framework for understanding and assessing the security level of the applications to which they entrust their information.

Some industries, such as government and health care, have certification and accreditation processes and standards that may apply to your product. Meeting these minimum security recommendations is not a substitute for the unique accreditation needs of your customers. However, the intent of the security standards is to help you prepare for current and future customer requirements, and any investment you make early in the development cycle will benefit your application. These are recommendations, not a formal Microsoft certification program.

There are several major categories of vulnerabilities in a rights management services system including:
- **Leakage** — Information appears in unauthorized locations.
- **Corruption** — Software or data is modified in an unauthorized manner.
- **Denial** — A computing resource is not available for use.

These topics focus primarily on leakage issues. The integrity of a API system depends upon its ability, over time, to protect information, enabling access only to designated entities. These topics also touch upon corruption issues. Denial issues are not covered.

Microsoft does not test or review test results related to meeting the minimum standard; it is entirely up to the partner to ensure the minimum standards are met. Microsoft provides two additional levels of recommendations to help mitigate common threats. In general, these suggestions are additive; for example, meeting preferred recommendations assumes that you have met minimum standards, where applicable, unless otherwise specified.

|Standard level|	Description|
|---|---|
|Minimum standard|	An application that handles AIP protected information must be determined to meet the minimum standard before the application can be signed with the production certificate received from Microsoft. Partners generally use the production hierarchy certificate only at the time of final release of the software when partners' own internal tests have verified that the application meets this minimum standard. Meeting the minimum standard is not, and should not be construed as, a guarantee of security by Microsoft. Microsoft does not test or review test results related to meeting the minimum standard; it is entirely up to the partner to ensure the minimum is met.|
|Recommended standard|	Recommended guidelines both chart a path to improved application security and provide an indication of how AIP may evolve as more security criteria are implemented. Vendors might attempt to differentiate their applications by building to this higher level of security guidelines.|
|Preferred standard|	This is the highest category of security currently defined. Vendors who develop applications marketed as highly secure should aim for this standard. Applications that adhere to this standard are likely to be the least vulnerable to attack.|




## Malicious Software
Microsoft has defined minimum required standards that your application must meet to protect content from malicious software.

### Importing Malicious Software by Using Address Tables
AIP does not support code modification at run time or modification of the import address table (IAT). An import address table is created for every DLL loaded in your process space. It specifies the addresses of all functions that your application imports. One common attack is to modify the IAT entries within an application to, for example, point to malicious software. AIP   stops the application when it detects this type of attack.

### Minimum standard
- You cannot modify the import address table in the application process during execution. - Your application specifies many of the functions called at run time by using address tables, and these cannot be altered during or after run time. Among other things, this means you cannot perform code-profiling on an application signed by using the production certificate.
- You cannot call the **DebugBreak** function from within any DLL specified in the manifest.
- You cannot call **LoadLibrary** with the **DONT_RESOLVE_DLL_REFERENCES** flag set. This flag tells the loader to skip binding to the imported modules, thereby modifying the import address table.
- You cannot alter delayed loading by making run-time or subsequent changes to the /DELAYLOAD linker switch.
- You cannot alter delayed loading by providing your own version of the Delayimp.lib helper function.
- You cannot unload modules that have been delay-loaded by authenticated modules while the AIP  environment exists.
- You cannot use the **/DELAY:UNLOAD** linker switch to enable unloading of delayed modules.


## Incorrectly Interpreting License Rights

If your application does not correctly interpret and enforce the rights expressed in the AIP   issuance license, you may make information available in ways that the information owner did not intend. An example of this is when an application allows a user to save unencrypted information to new media when the issuance license only confers the right to view the information.

The AIP system organizes rights a few groupings. For more information, see [Configuring usage rights for Azure Information Protection](../configure-usage-rights.md).

### Azure Information Protection  
API allows a user to either decrypt information or not; the information does not have any inherent protection. If a user has the right to decrypt information, the API permits it, and the application is responsible for managing or protecting that information after it is in the clear. An application is responsible for managing its environment and interface to prevent the unauthorized use of information; for example, disabling the **Print** and **Copy** buttons if a license only grants the PLAY right. Your test suite should verify that your application acts correctly on all the license rights that it recognizes.

### Minimum standard
- The customer implementation of XrML v.1.2 rights should be consistent with the definitions of these rights, as described in the XrML specifications, which are available at the XrML Web site (http://www.xrml.org). Any rights that are specific to your application must be defined for all entities that have an interest in your application.
- Your test suite and test process should verify that your application executes properly against the rights that the application supports and that it does not act upon unsupported rights.
- If you are building a publishing application, you must make information available that explains which intrinsic rights are and are not supported by the publishing application and how these rights should be interpreted. In addition, the user interface should make clear to the end user what the implications are of each right granted or denied an individual piece of information.

- Any rights that are abstracted by inclusion in new rights implemented by an application need to be mapped to the new terminology. For example, a new right called MANAGER might include as abstracted rights the PRINT, COPY, and EDIT rights.
Recommended standard	None at this time.
Preferred standard	None at this time.
