# Getting Started

Prior to getting start on the MIP SDK, it's important to understand the following topics.

* [What is Office 365 Security and Compliance Center?](https://support.office.com/en-us/article/overview-of-security-and-compliance-in-office-365-dcb83b2c-ac66-4ced-925d-50eb9698a0b2?redirectSourcePath=%252farticle%252f7fe448f7-49bd-4d3e-919d-0a6d1cf675bb&ui=en-US&rs=en-US&ad=US)
* [What is Azure Information Protection?](https://docs.microsoft.com/en-us/azure/information-protection/understand-explore/what-is-information-protection)
* [How does the protection work in Azure Information Protection?](https://docs.microsoft.com/en-us/azure/information-protection/understand-explore/what-is-information-protection#how-data-is-protected)

## Prerequisites

The MIP SDK requires one of the following subscriptions:

* [Office 365 E3 or E5](https://products.office.com/en-us/business/office-365-enterprise-e3-business-software)
* [Enterprise Mobility and Security E3 or E5](https://www.microsoft.com/en-us/cloud-platform/enterprise-mobility-security)
* [Azure Information Protection Premium P1 or P2](https://azure.microsoft.com/en-us/pricing/details/information-protection/)

Managing policies in Security and Compliance Center requires a user account that is a member of one of the following groups:

* Global Administrator
* Security Administrator
* Others?

### Sign up for Office 365

If your organization doesn't have an Office 365 subscription, or you're looking to get started with a trial tenant of your own, [head to the Office 365 site to sign up for a trial](https://go.microsoft.com/fwlink/p/?LinkID=403802&culture=en-US&country=US)

### Register Your Application

Authenticating to Azure Active Directory requires that the application is registered via the Azure AD Application Registration portal. [This process](https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-integrating-applications) describes the steps required.

MIP SDK-specific steps will be covered in a later tutorial. This link is intended to provide a high level overview of the process.

### Identity and Authentication Requirements

The MIP SDK requires a security principal stored in Azure Active Directory to authenticate and download the MIP policy. After following the steps above, a standard user account or service principal must be used to authenticate to the service.

**Important**: In any of the tutorials that require commandline parameters where a username and password is passed in, we recommend testing with a restricted account that has no rights outside of accessing the necessary SCC endpoints. Cleartext passwords passed via commandline may be collected by logging systems.

### Define Label Taxonomy and Protection Settings

* Provide links to SCC configuration.
* Provide details on rights required to config labels.
* Provide details on labeling taxonomy best practices.

## Next Steps
