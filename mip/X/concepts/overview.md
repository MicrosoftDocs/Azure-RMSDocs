# Overview

## Microsoft Information Protection

Microsoft Information Protection is the unification of Microsoft's classification, labeling, and protection services in to a single, unified administration experience and software development kit (SDK). This single administration point drives the data classification and protection capabilities across Office 365, Azure Information Protection, Windows Information Protection, and other Microsoft services. Additionally, third parties can take advantage of the SDK to build in support so that all third-party and line of business applications are using a standard, consistent data labeling schema and protection service.

* [What is Office 365 Security and Compliance Center?](https://support.office.com/en-us/article/overview-of-security-and-compliance-in-office-365-dcb83b2c-ac66-4ced-925d-50eb9698a0b2?redirectSourcePath=%252farticle%252f7fe448f7-49bd-4d3e-919d-0a6d1cf675bb&ui=en-US&rs=en-US&ad=US)
* [What is Azure Information Protection?](https://docs.microsoft.com/en-us/azure/information-protection/understand-explore/what-is-information-protection)
* [How does the protection work in Azure Information Protection?](https://docs.microsoft.com/en-us/azure/information-protection/understand-explore/what-is-information-protection#how-data-is-protected)

## Microsoft Information Protection SDK

The Microsoft Information Protection Software Development Kit exposes the classification, labeling, and protection (CLP) services from Office 365 Security and Compliance Center to third-party applications and services. Developers can leverage the SDK to build native support for applying labels and protection to files, reasoning over which actions should be taken when specific labels are detected, and reasoning over AIP-encrypted information.

The labels and protection applied to information across the suite of Microsoft services are **consistent** such that all applications and services which support MIP will be able to read and write the labels in a consistent, predictable manner.

High level MIP SDK use cases include:

* Making a line of business application able to apply classification labels to files on export.
* Building native support for Microsoft Information Protection labeling in to a CAD/CAM design application.
* Enabling a cloud access security broker or data loss prevention solution to reason over data that has been encrypted with Azure Information Protection.

For a more exhaustive list, please review this document. [Link to API Concepts]()

## Next Steps

To get started building your own integrations with the MIP SDK, start with the [Getting Started]() page.
