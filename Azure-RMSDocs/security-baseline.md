---
title: Azure security baseline for Azure Information Protection
description: The Azure Information Protection security baseline provides procedural guidance and resources for implementing the security recommendations specified in the Azure Security Benchmark.
author: msmbaldwin
ms.service: information-protection
ms.topic: conceptual
ms.date: 11/17/2020
ms.author: mbaldwin
ms.custom: subject-security-benchmark

# Important: This content is machine generated; do not modify this topic directly. Contact mbaldwin for more information.

---

# Azure security baseline for Azure Information Protection

This security baseline applies guidance from the [Azure Security Benchmark version 2.0](https://docs.microsoft.com/azure/security/benchmarks/overview) to Azure Information Protection. The Azure Security Benchmark provides recommendations on how you can secure your cloud solutions on Azure. The content is grouped by the **security controls** defined by the Azure Security Benchmark and the related guidance applicable to Azure Information Protection. **Controls** not applicable to Azure Information Protection have been excluded.

To see how Azure Information Protection completely maps to the Azure Security Benchmark, see the [full Azure Information Protection security baseline mapping file](https://github.com/MicrosoftDocs/SecurityBenchmarks/tree/master/Azure%20Offer%20Security%20Baselines).

## Network Security

*For more information, see the [Azure Security Benchmark: Network Security](/azure/security/benchmarks/security-controls-v2-network-security).*

### NS-6: Simplify network security rules

**Guidance**: Use Virtual Network service tags to define network access controls on network security groups or Azure Firewall, which is configured for your Azure Information Protection resources. 

When creating security rules, use service tags in place of specific IP addresses. Specify the service tag name, such as {AzureInformationProtection}, in the appropriate source or destination field of a rule, to allow or deny the traffic for the corresponding service. 

Microsoft manages the address prefixes encompassed by the service tag, and automatically updates the service tag as addresses change.

- [Understand and using Service Tags](https://docs.microsoft.com/azure/virtual-network/service-tags-overview)
 
- [Azure Information Protection Service Tag](https://docs.microsoft.com/azure/information-protection/requirements#service-tags)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

## Identity Management

*For more information, see the [Azure Security Benchmark: Identity Management](/azure/security/benchmarks/security-controls-v2-identity-management).*

### IM-1: Standardize Azure Active Directory as the central identity and authentication system

**Guidance**: Azure Information
Protection is integrated with Azure Active Directory (Azure AD), which is
Azure's default identity and access management service. Make it a high priority to secure Azure AD in your organization’s cloud security practice. 

Review the Azure AD identity secure score to help you assess your identity security posture relative to Microsoft’s best practice recommendations. Use the score to gauge how closely your configuration matches best practice recommendations, and to make improvements in your security posture.

Standardize
Azure AD to govern your organization’s identity and access management in:

- Microsoft Cloud
resources, such as the Azure portal, Azure Storage, Azure Virtual Machines (Linux and Windows), Azure Key Vault, Platform as a Service (PaaS), and Software as a Service (SaaS) applications

- Your organization's
resources, such as applications on Azure or your corporate network resources

Azure AD supports external identities to allow users without a Microsoft account to sign-in to their applications and resources with their non-Microsoft accounts.

Tenancy in Azure
- [Active Directory](https://docs.microsoft.com/azure/active-directory/develop/single-and-multi-tenant-apps)

How to create and
- [configure an Azure AD instance](https://docs.microsoft.com/azure/active-directory/fundamentals/active-directory-access-create-new-tenant)

Use external
- [identity providers for application](https://docs.microsoft.com/azure/active-directory/b2b/identity-providers)

What is the identity
- [secure score in Azure Active Directory](https://docs.microsoft.com/azure/active-directory/fundamentals/identity-secure-score)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### IM-2: Manage application identities securely and automatically

**Guidance**: Azure Information Protection is integrated with Azure
Active Directory (Azure AD), which is Azure's identity and access
management service. Azure Rights Management service uses an Azure AD
application identity while accessing customers’ keys stored with Azure Key
Vault for Bring Your Own Key (BYOK) scenarios. Authorizing Azure Rights
Management service to access your keys is achieved through configuring Azure
Key Vault access policies, which can be done either using the Azure portal or
using PowerShell.

Authorizing the Azure Rights Management
- [service for BYOK](https://docs.microsoft.com/azure/information-protection/byok-price-restrictions#authorizing-the-azure-rights-management-service-to-use-your-key)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### IM-3: Use Azure AD single sign-on (SSO) for application access

**Guidance**: Azure Information Protection is integrated with Azure Active Directory (Azure AD), which is Azure's default identity and access management service. 

Azure Information Protection uses Azure AD to provide identity and access management to Azure resources, cloud applications, and on-premises applications. This includes enterprise identities such as employees, as well as external identities such as partners, vendors, and suppliers. This enables single sign-on to manage and secure access to your organization’s data and resources on-premises and in the cloud. Connect all your users, applications, and devices to the Azure AD for seamless, secure access and greater visibility and control.

- [Sign-in to Azure Information Protection with Azure Active Directory](https://docs.microsoft.com/azure/information-protection/requirements)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### IM-4: Use strong authentication controls for all Azure Active Directory based access

**Guidance**: Azure Information Protection is integrated with Azure Active Directory (Azure AD), which supports strong authentication through multi-factor authentication. To support authentication and authorization for Azure Information Protection, you must have an Azure AD. To use user accounts from your on-premises director (AD DS), you must also configure directory integration.

- Single sign-on is supported for Azure Information Protection, so that users are not repeatedly prompted for their credentials. If you use another vendor solution for federation, check with that vendor for how to configure it for Azure AD. WS-Trust is a common requirement for these solutions to support single sign-on.

- Multifactor authentication is supported with Azure Information Protection, when you have the required client software and have correctly configured the multi-factor authentication-supporting infrastructure.

- [Azure Information Protection Authentication through Azure Active Directory](https://docs.microsoft.com/azure/information-protection/requirements)

**Azure Security Center monitoring**: Yes

**Responsibility**: Customer

### IM-5: Monitor and alert on account anomalies

**Guidance**: Azure Information Protection is integrated with Azure Active Directory (Azure AD), which is Azure's default identity and access management service. 

Additional guidance regarding Azure AD:

- Sign-in - The sign-in report provides information about the usage of managed applications and user sign-in activities.
- Audit logs - Provides traceability through logs for all changes done by various features within Azure AD. Examples of audit logs include changes made to any resources within Azure AD, such as adding or removing users, apps, groups, roles, and policies.
- Risky sign-in - A risky sign-in is an indicator for a sign-in attempt that might have been performed by someone who is not the legitimate owner of a user account.
- Users flagged for risk - A risky user is an indicator for a user account that might have been compromised.
These data sources can be integrated with Azure Monitor, Azure Sentinel or third-party SIEM systems.

Azure Security Center can also alert on certain suspicious activities, such as an excessive number of failed authentication attempts, or deprecated accounts in the subscription.

Azure Advanced Threat Protection (ATP) is a security solution that can use Active Directory signals to identify, detect, and investigate advanced threats, compromised identities, and malicious insider actions.

- [Audit activity reports in the Azure Active Directory](https://docs.microsoft.com/azure/active-directory/reports-monitoring/concept-audit-logs) 

- [How to view Azure AD risky sign-ins](https://docs.microsoft.com/azure/active-directory/reports-monitoring/concept-risky-sign-ins) 

- [How to identify Azure AD users flagged for risky activity](https://docs.microsoft.com/azure/active-directory/reports-monitoring/concept-user-at-risk) 

- [How to monitor users' identity and access activity in Azure Security Center](https://docs.microsoft.com/azure/security-center/security-center-identity-access) 

- [Alerts in Azure Security Center's threat intelligence protection module](https://docs.microsoft.com//azure/security-center/alerts-reference) 

- [How to integrate Azure Activity Logs into Azure Monitor](https://docs.microsoft.com/azure/active-directory/reports-monitoring/howto-integrate-activity-logs-with-log-analytics)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### IM-6: Restrict Azure resource access based on conditions

**Guidance**: Azure Information Protection is integrated with Azure Active Directory (Azure AD), which is Azure's default identity and access management service. Within Azure AD, configure conditional access for Azure Information Protection. Administrators can block or grant access to users in their tenant, for documents protected by Azure Information Protection, based on the standard conditional access controls.

Multifactor authentication is one of the most commonly requested conditions, while device-compliancy with configured Intune policies is another one. You can require conditions so that mobile devices meet your organizational-password requirements, have a minimum operating system version, and connected computers are domain-joined.

- [Conditional Access policies for Azure Information Protection](https://cloudblogs.microsoft.com/enterprisemobility/2017/10/17/conditional-access-policies-for-azure-information-protection)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

## Privileged Access

*For more information, see the [Azure Security Benchmark: Privileged Access](/azure/security/benchmarks/security-controls-v2-privileged-access).*

### PA-1: Protect and limit highly privileged users

**Guidance**: Azure Information Protection is integrated with Azure Active Directory (Azure AD), which is Azure's default identity and access management service. 

Azure Information Protection includes an administrator-level role in Azure AD. Users assigned to the Administrator role have full permissions in the Azure Information Protection service. Administrator role can be used to configure labels for the Azure Information Protection policy, managing protection templates, and activating protection. However, the Administrator role does not grant any permissions in Identity Protection Center, Privileged Identity Management, Monitor Microsoft 365 Service Health, or Office 365 Security &amp; Compliance Center.

Limit the number of highly privileged accounts or roles and protect these accounts at an elevated level, as users with this privilege can directly or indirectly read and modify every resource in your Azure environment. Enable just-in-time (JIT) privileged access to Azure resources and Azure AD using Privileged Identity Management (PIM). Just-in-time access grants temporary permissions to perform privileged tasks only when users need it. PIM can also generate security alerts when there is suspicious or unsafe activity in your Azure AD organization.

- [Azure Information Protection Administrator Role](https://docs.microsoft.com/azure/active-directory/users-groups-roles/directory-assign-admin-roles#azure-information-protection-administrator)

- [Administrator role permissions in Azure AD](https://docs.microsoft.com/azure/active-directory/users-groups-roles/directory-assign-admin-roles)

- [Use Azure Privileged Identity Management security alerts](https://docs.microsoft.com/azure/active-directory/privileged-identity-management/pim-how-to-configure-security-alerts) 

- [Securing privileged access for hybrid and cloud deployments in Azure AD](https://docs.microsoft.com/azure/active-directory/users-groups-roles/directory-admin-roles-secure)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### PA-2: Restrict administrative access to business-critical systems

**Guidance**: Azure Information Protection is integrated with Azure Active Directory (Azure AD), which is Azure's default identity and access management service. 

Azure Information Protection includes an administrator-level role in Azure AD. Users assigned to the Administrator role have full permissions in the Azure Information Protection service. The Administrator role allows configuring labels for the Azure Information Protection policy, managing protection templates, and activating protection. The Administrator role does not grant any permissions in Identity Protection Center, Privileged Identity Management, Monitor Microsoft 365 Service Health, or Office 365 Security &amp; Compliance Center.

- [Azure Information Protection Administrator Role](https://docs.microsoft.com/azure/active-directory/users-groups-roles/directory-assign-admin-roles#azure-information-protection-administrator)

- [Actions Azure Information Protection Administrator can take](https://docs.microsoft.com/azure/active-directory/users-groups-roles/directory-assign-admin-roles#azure-information-protection-administrator-permissions)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### PA-3: Review and reconcile user access regularly

**Guidance**: Azure Information Protection is integrated with Azure Active Directory (Azure AD), which is Azure's default identity and access management service.

Use Azure AD to manage resources, review user accounts, and access assignments regularly to ensure that the accounts and their access are valid. Conduct Azure AD access reviews to review group memberships, access to enterprise applications, and role assignments. Discover stale accounts with Azure AD reporting. Azure AD's Privileged Identity Management  features can be used to create access review report workflow to facilitate the review process.

In addition, Azure Privileged Identity Management can also be configured to alert when an excessive number of administrator accounts are created, and to identify administrator accounts that are stale or improperly configured. Note that some Azure services support local users and roles that are not managed through Azure AD. Customers will need to manage these users separately.

- [Azure Information Protection Administrator Role](https://docs.microsoft.com/azure/active-directory/users-groups-roles/directory-assign-admin-roles#azure-information-protection-administrator)

- [Actions Azure Information Protection Administrator can take](https://docs.microsoft.com/azure/active-directory/users-groups-roles/directory-assign-admin-roles#azure-information-protection-administrator-permissions)

- [Create an access review of Azure resource roles in Privileged Identity Management (PIM)](https://docs.microsoft.com/azure/active-directory/privileged-identity-management/pim-resource-roles-start-access-review) 

- [How to use Azure AD identity and access reviews](https://docs.microsoft.com/azure/active-directory/governance/access-reviews-overvie)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### PA-4: Set up emergency access in Azure AD

**Guidance**: Azure Information Protection is integrated with Azure Active Directory (Azure AD) to manage its resources. To prevent being accidentally locked out of your Azure AD organization, set up an emergency access account for access when normal administrative accounts cannot be used. Emergency access accounts are usually highly privileged, and they should not be assigned to specific individuals. Emergency access accounts are limited to emergency or "break glass"' scenarios where normal administrative accounts can't be used.

You should ensure that the credentials (such as password, certificate, or smart card) for emergency access accounts are kept secure and known only to individuals who are authorized to use them only in an emergency.

- [Manage emergency access accounts in Azure AD](https://docs.microsoft.com/azure/active-directory/users-groups-roles/directory-emergency-access)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### PA-5: Automate entitlement management 

**Guidance**: Azure Information Protection is integrated with Azure Active Directory (Azure AD), Azure's default identity and access management service.

Azure AD offers entitlement management features to automate access request workflows, including access assignments, reviews, and expiration. Dual or multi-stage approval is also supported.

- [What are Azure AD access reviews](https://docs.microsoft.com/azure/active-directory/governance/access-reviews-overview) 

- [What is Azure AD entitlement management](https://docs.microsoft.com/azure/active-directory/governance/entitlement-management-overview)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### PA-6: Use privileged access workstations

**Guidance**: Azure Information Protection can be managed from a customer workstation through PowerShell. 

Secured, isolated workstations are critically important for the security of sensitive roles, such as administrators, developers, and critical service operators. 

Use highly secured user workstations and/or Azure Bastion for administrative tasks. Use Azure Active Directory, Microsoft Defender Advanced Threat Protection (ATP), and/or Microsoft Intune to deploy a secure and managed user workstation for administrative tasks. The secured workstations can be centrally managed to enforce secured configuration, including strong authentication, software and hardware baselines, and restricted logical and network access.

- [Guidance on using PowerShell for Azure Information Protection](https://docs.microsoft.com/azure/information-protection/rms-client/client-admin-guide-powershell)

- [Understand privileged access workstations](https://docs.microsoft.com/azure/active-directory/devices/concept-azure-managed-workstation) 

- [Deploy a privileged access workstation](https://docs.microsoft.com/azure/active-directory/devices/howto-azure-managed-workstation)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### PA-7: Follow just enough administration (least privilege principle) 

**Guidance**: Azure Information Protection is integrated with Azure Active Directory (Azure AD), which is Azure's default identity and access management service. 

Azure Information Protection includes an administrator-level role in Azure AD. Users assigned to the Administrator role have full permissions in the Azure Information Protection service. Administrator role can be used to configure labels for the Azure Information Protection policy, managing protection templates, and activating protection. However, the Administrator role does not grant any permissions in Identity Protection Center, Privileged Identity Management, Monitor Microsoft 365 Service Health, or Office 365 Security &amp; Compliance Center.

Limit the number of highly privileged accounts or roles and protect these accounts at an elevated level, as users with this privilege can directly or indirectly read and modify every resource in your Azure environment. Enable just-in-time (JIT) privileged access to Azure resources and Azure AD using Privileged Identity Management (PIM). Just-in-time access grants temporary permissions to perform privileged tasks only when users need it. PIM can also generate security alerts when there is suspicious or unsafe activity in your Azure AD organization.

- [Rights Included in Permission Levels for Azure Information Protection](https://docs.microsoft.com/azure/information-protection/configure-usage-rights#rights-included-in-permissions-levels)

- [Rights Management Issuer and Rights Management Owner](https://docs.microsoft.com/azure/information-protection/configure-usage-rights#rights-management-issuer-and-rights-management-owner)

- [Azure Information Protection Administrator Role](https://docs.microsoft.com/azure/active-directory/users-groups-roles/directory-assign-admin-roles#azure-information-protection-administrator)

- [Administrator role permissions in Azure AD](https://docs.microsoft.com/azure/active-directory/users-groups-roles/directory-assign-admin-roles)

- [Use Azure Privileged Identity Management security alerts](https://docs.microsoft.com/azure/active-directory/privileged-identity-management/pim-how-to-configure-security-alerts) 

- [Securing privileged access for hybrid and cloud deployments in Azure AD](https://docs.microsoft.com/azure/active-directory/users-groups-roles/directory-admin-roles-secure)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### PA-8: Choose approval process for Microsoft support  

**Guidance**: Azure Information Protection supports Azure Customer Lockbox to provide customers with the ability to review, approve, and reject data access requests, as well as review requests being made. 

- [Lockbox Overview](https://docs.microsoft.com/azure/security/fundamentals/customer-lockbox-overview)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

## Data Protection

*For more information, see the [Azure Security Benchmark: Data Protection](/azure/security/benchmarks/security-controls-v2-data-protection).*

### DP-1: Discovery, classify and label sensitive data

**Guidance**: Azure Information Protection provides the ability to discover, classify, and label sensitive information. 

Azure Information Protection is a cloud-based solution that enables organizations to classify and protect documents and emails by applying labels. Labels can be applied automatically by administrators using rules and conditions, manually by users, or by a combination where administrators define the recommendations shown to users.

- [Overview of Azure Information Protection](https://docs.microsoft.com/azure/information-protection/)

- [Guidance on how to set up the unified labeling client](https://docs.microsoft.com/azure/information-protection/rms-client/clientv2-user-guide)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Shared

### DP-2: Protect sensitive data

**Guidance**: Azure Information Protection provides data protection by offering the ability to label sensitive information and provide protection on that data through encryption. Protection is provided by the Azure Rights Management service.

- [Azure Rights Management](https://docs.microsoft.com/azure/information-protection/what-is-azure-rms)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Shared

### DP-3: Monitor for unauthorized transfer of sensitive data

**Guidance**: Azure Information Protection provides the ability to monitor for unauthorized transfer of sensitive data through the track and revoke capability. Track and Revoke allows the customer to track how people are using documents they have sent and revoke access if people should no longer be able to read them. 

- [Guidance on track and revoke](https://docs.microsoft.com/azure/information-protection/rms-client/client-track-revoke)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Shared

## Asset Management

*For more information, see the [Azure Security Benchmark: Asset Management](/azure/security/benchmarks/security-controls-v2-asset-management).*

### AM-1: Ensure security team has visibility into risks for assets

**Guidance**: Ensure security teams are granted Security Reader permissions in your Azure tenant and subscriptions so they can monitor for security risks using Azure Security Center. 

Depending on how security team responsibilities are structured, monitoring for security risks could  be the responsibility of a central security team or a local team. That said, security insights and risks must always be aggregated centrally within an organization. 

Security Reader permissions can be applied broadly to an entire tenant (Root Management Group) or scoped to management groups or specific subscriptions. 

Note: Additional permissions might be required to get visibility into workloads and services. 

- [Overview of Security Reader Role](https://docs.microsoft.com/azure/role-based-access-control/built-in-roles#security-reader)

- [Overview of Azure Management Groups](https://docs.microsoft.com/azure/governance/management-groups/overview)

**Azure Security Center monitoring**: Currently not available

**Responsibility**: Customer

### AM-3: Use only approved Azure services

**Guidance**: Azure Information Protection does not support Azure Resource Manager Deployments or allow customers the ability to limit deployments through built-in Azure Policy definitions, such as 'Allow Resources' or 'Deny Resources'. However, customers can limit usage of Azure Information Protection through labeling policies in the Security and Compliance Center. 

- [Manage Information protection through the Security and Compliance Center](https://docs.microsoft.com/microsoft-365/compliance/protect-information?view=o365-worldwide&amp;preserve-view=true)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

## Logging and Threat Detection

*For more information, see the [Azure Security Benchmark: Logging and Threat Detection](/azure/security/benchmarks/security-controls-v2-logging-threat-protection).*

### LT-2: Enable threat detection for Azure identity and access management

**Guidance**: Azure Information Protection is integrated with Azure Active Directory (Azure AD), which is Azure's default identity and access management service. 

View Azure AD-provided user logs with Azure AD reporting and other solutions such as Azure Monitor, Azure Sentinel, or other SIEM/monitoring tools for more sophisticated monitoring and analytics use cases. 

They are: 

-	Sign-in report – The sign-in report provides information about the usage of managed applications and user sign-in activities.

-	Audit logs - Provides traceability through logs for all changes done by various features within Azure AD. Examples of audit logs include changes made to any resources within Azure AD, such as adding or removing users, apps, groups, roles, and policies.

-	Risky sign-ins - A risky sign  in is an indicator for a sign-in attempt that might have been performed by someone who is not the legitimate owner of a user account.

-	Users flagged for risk - A risky user is an indicator for a user account that might have been compromised.

Azure Security Center can also alert on certain suspicious activities, such as an excessive number of failed authentication attempts, and deprecated accounts in the subscription. In addition to the basic security hygiene monitoring, Security Center’s Threat Protection module can also collect more in-depth security alerts from individual Azure compute resources (such as virtual machines, containers, app service), data resources (such as SQL DB and storage), and Azure service layers. This capability allows you to see account anomalies inside the individual resources.

- [Audit activity reports in Azure AD](https://docs.microsoft.com/azure/active-directory/reports-monitoring/concept-audit-logs)

- [Enable Azure Identity Protection](https://docs.microsoft.com/azure/active-directory/identity-protection/overview-identity-protection)

- [Threat protection in Azure Security Center](https://docs.microsoft.com/azure/security-center/threat-protection)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### LT-4: Enable logging for Azure resources

**Guidance**: Azure Information Protection provides data protection for an organization's documents and emails, along with a log for each request.  These requests include when users protect documents and emails, when they consume this content, actions performed by administrators for this service, and actions performed by Microsoft operators to support your Azure Information Protection deployment.

Types of logs produced by Azure Information Protection include:

- Admin Log - Logs administrative tasks for the protection service. For example, if the service is deactivated, when the super user feature is enabled, and when users are delegated admin permissions to the service.

- Document Tracking - Lets users track and revoke their documents that they have tracked with the Azure Information Protection client. Global administrators can also track these documents on behalf of users.

- Client Event Logs - Usage activity for the Azure Information Protection client, logged in the local Windows Applications and Services event log, Azure Information Protection.

- Client Log Files- Troubleshooting logs for the Azure Information Protection client

The Protection usage logs can be used to identify 'who' is accessing your protected data, from 'which' devices, and from 'where'. Logs reveal whether people can successfully read protected content, as well as identify which people have read an important document that was protected. 

- [Logging and analyzing the protection usage from Azure Information Protection](https://docs.microsoft.com/azure/information-protection/log-analyze-usage)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### LT-5: Centralize security log management and analysis

**Guidance**: Ensure that support personnel can build a full view of what happened during an event, by querying and using diverse data sources, as they investigate potential incidents. 

Avoid blind spots by collecting diverse logs and sending them to a central SIEM solution, such as Azure Sentinel, to track the activities of a potential attacker across the kill chain. The logs can reveal whether people can successfully read protected content, as well as identify which people have read an important document that was protected. Ensure that insights and learnings are captured for other analysts and for future historical reference.  

Azure Sentinel provides extensive data analytics across virtually any log source and a case management portal to manage the full lifecycle of incidents. Intelligence information during an investigation can be associated with an incident for tracking and reporting purposes. 

- [Logging and analyzing the protection usage from Azure Information Protection](https://docs.microsoft.com/azure/information-protection/log-analyze-usage)

- [Investigate incidents with Azure Sentinel](https://docs.microsoft.com/azure/sentinel/tutorial-investigate-cases)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### LT-6: Configure log storage retention

**Guidance**: Azure Information Protection provides data protection for an organization's documents and emails, with a log for every request to it.  These requests include when users protect documents and emails, when they consume this content, actions performed by your administrators for this service, and actions performed by Microsoft operators to support your Azure Information Protection deployment.

The amount of data collected and stored in your Azure Information Protection workspace, and its retention, will vary significantly for each tenant, depending on factors such as how many Azure Information Protection clients and other supported endpoints you have, whether you're collecting endpoint discovery data, you've deployed scanners, the number of protected documents that are accessed, and so on.

Use Azure Monitor Log's Usage and estimated costs feature to help estimate and review the amount of data stored and also control the data retention period for your Log Analytics workspace. 

- [Logging and analyzing the protection usage from Azure Information Protection](https://docs.microsoft.com/azure/information-protection/log-analyze-usage)

- [Manage usage and costs with Azure Monitor Logs](https://docs.microsoft.com/azure/azure-monitor/platform/manage-cost-storage)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

## Incident Response

*For more information, see the [Azure Security Benchmark: Incident Response](/azure/security/benchmarks/security-controls-v2-incident-response).*

### IR-1: Preparation – update incident response process for Azure

**Guidance**: Ensure your organization has processes to respond to security incidents, has updated these processes for Azure, and is regularly exercising them to ensure readiness.

- [Implement security across the enterprise environment](https://docs.microsoft.com/azure/cloud-adoption-framework/security/security-top-10#4-process-update-incident-response-ir-processes-for-cloud)

- [Incident response reference guide](https://docs.microsoft.com/microsoft-365/downloads/IR-Reference-Guide.pdf)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### IR-2: Preparation – setup incident notification

**Guidance**: Set up security incident contact information in Azure Security Center. This contact information is used by Microsoft to contact you if the Microsoft Security Response Center (MSRC) discovers that your data has been accessed by an unlawful or unauthorized party. You also have options to customize incident alert and notification in different Azure services based on your incident response needs. 

- [How to set the Azure Security Center security contact](https://docs.microsoft.com/azure/security-center/security-center-provide-security-contact-details)

**Azure Security Center monitoring**: Yes

**Responsibility**: Customer

### IR-3: Detection and analysis – create incidents based on high quality alerts

**Guidance**: Ensure you have a process to create high-quality alerts and measure the quality of alerts. This allows you to learn lessons from past incidents and prioritize alerts for analysts, so they don’t waste time on false positives. 

High-quality alerts can be built based on experience from past incidents, validated community sources, and tools designed to generate and clean up alerts by fusing and correlating diverse signal sources. 

Azure Security Center provides high-quality alerts across many Azure assets. You can use the ASC data connector to stream the alerts to Azure Sentinel. Azure Sentinel lets you create advanced alert rules to generate incidents automatically for an investigation. 

Export your Azure Security Center alerts and recommendations using the export feature to help identify risks to Azure resources. Export alerts and recommendations either manually or in an ongoing, continuous fashion.

- [How to configure export](https://docs.microsoft.com/azure/security-center/continuous-export)

- [How to stream alerts into Azure Sentinel](https://docs.microsoft.com/azure/sentinel/connect-azure-security-center)

**Azure Security Center monitoring**: Currently not available

**Responsibility**: Customer

### IR-4: Detection and analysis – investigate an incident

**Guidance**: Ensure that analysts can build a full view of what happened by querying and using diverse data sources as they investigate potential incidents. Avoid blind spots by collecting diverse logs to track the activities of a potential attacker across the kill chain. Additionally, ensure that insights and learnings are captured for other analysts and for future historical reference.  

The data sources for investigation include the centralized logging sources that are already being collected from the in-scope services and running systems, but can also include:

- Network data – use network security groups' flow logs, Azure Network Watcher, and Azure Monitor to capture network flow logs and other analytics information. 

- Snapshots of running systems: 

    - Use Azure virtual machine's snapshot capability to create a snapshot of the running system's disk. 

    - Use the operating system's native memory dump capability to create a snapshot of the running system's memory.

    - Use the snapshot feature of the Azure services or your software's own capability to create snapshots of the running systems.

Azure Sentinel provides extensive data analytics across virtually any log source and a case management portal to manage the full lifecycle of incidents. Intelligence information during an investigation can be associated with an incident for tracking and reporting purposes. 

- [Snapshot a Windows machine's disk](https://docs.microsoft.com/azure/virtual-machines/windows/snapshot-copy-managed-disk)

- [Snapshot a Linux machine's disk](https://docs.microsoft.com/azure/virtual-machines/linux/snapshot-copy-managed-disk)

- [Microsoft Azure Support diagnostic information and memory dump collection](https://azure.microsoft.com/support/legal/support-diagnostic-information-collection/) 

- [Investigate incidents with Azure Sentinel](https://docs.microsoft.com/azure/sentinel/tutorial-investigate-cases)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### IR-5: Detection and analysis – prioritize incidents

**Guidance**: Provide context to analysts on which incidents to focus on first based on alert severity and asset sensitivity. 

Azure Security Center assigns a severity to each alert to help you prioritize which alerts should be investigated first. The severity is based on how confident Security Center is in the finding or the analytic used to issue the alert, as well as the confidence level that there was malicious intent behind the activity that led to the alert.

Additionally, mark resources using tags and create a naming system to identify and categorize Azure resources, especially those processing sensitive data.  It is your responsibility to prioritize the remediation of alerts based on the criticality of the Azure resources and environment where the incident occurred.

- [Security alerts in Azure Security Center](https://docs.microsoft.com/azure/security-center/security-center-alerts-overview)

- [Use tags to organize your Azure resources](https://docs.microsoft.com/azure/azure-resource-manager/resource-group-using-tags)

**Azure Security Center monitoring**: Currently not available

**Responsibility**: Customer

### IR-6: Containment, eradication and recovery – automate the incident handling

**Guidance**: Automate manual repetitive tasks to speed up response time and reduce the burden on analysts. Manual tasks take longer to execute, slowing each incident and reducing how many incidents an analyst can handle. Manual tasks also increase analyst fatigue, which increases the risk of human error that causes delays, and degrades the ability of analysts to focus effectively on complex tasks. 
Use workflow automation features in Azure Security Center and Azure Sentinel to automatically trigger actions or run a playbook to respond to incoming security alerts. The playbook takes actions, such as sending notifications, disabling accounts, and isolating problematic networks. 

- [Configure workflow automation in Security Center](https://docs.microsoft.com/azure/security-center/workflow-automation)

- [Set up automated threat responses in Azure Security Center](https://docs.microsoft.com/azure/security-center/tutorial-security-incident#triage-security-alerts)

- [Set up automated threat responses in Azure Sentinel](https://docs.microsoft.com/azure/sentinel/tutorial-respond-threats-playbook)

**Azure Security Center monitoring**: Currently not available

**Responsibility**: Customer

## Posture and Vulnerability Management

*For more information, see the [Azure Security Benchmark: Posture and Vulnerability Management](/azure/security/benchmarks/security-controls-v2-vulnerability-management).*

### PV-1: Establish secure configurations for Azure services 

**Guidance**: Azure Information Protection can be configured through the Security and Compliance Center or through PowerShell. 

Within the Security and Compliance Center, an admin can create sensitivity labels, define what each label can do, and publish the labels. 

Create the labels: Create and name your sensitivity labels according to your organization's classification taxonomy for different sensitivity levels of content. Use common names or terms that make sense to your users. If you don't already have an established taxonomy, consider starting with label names such as Personal, Public, General, Confidential, and Highly Confidential. You can then use sublabels to group similar labels by category. When you create a label, use the tooltip text to help users select the appropriate label.

Define what each label can do: Configure the protection settings you want associated with each label. For example, you might want lower sensitivity content (such as a "General" label) to have just a header or footer applied, while higher sensitivity content (such as a "Confidential" label) should have a watermark and encryption.

Publish the labels: After your sensitivity labels are configured, publish them by using a label policy. Decide which users and groups should have the labels and what policy settings to use. A single label is reusable—you define it once, and then you can include it in several label policies assigned to different users. So for example, you could pilot your sensitivity labels by assigning a label policy to just a few users. Then when you're ready to roll out the labels across your organization, you can create a new label policy for your labels and this time, specify all users.

In order to use PowerShell, install the AIPService PowerShell Module. Within PowerShell, an admin can perform these tasks along with others: 

- Migrate from on-premise Rights Management (AD RMS or Windows RMS) to Azure Information Protection
- Generate and Manage your own tenant key- the bring your own key (BYOK) scenario
- Activate or deactivate the Rights Management service for your organization
- Configure onboarding controls for a phased deployment of the Azure Rights Management service
- Create and manage Rights Management templates for your organization
- Manage users and groups who are authorized to administer Rights Management service for your organization
- Log and analyze usage for Rights Management

For more information, see the following references:

- [Get Started with Sensitivity Labels in Security and Compliance Center](https://docs.microsoft.com/microsoft-365/compliance/get-started-with-sensitivity-labels?view=o365-worldwide&amp;preserve-view=true)

- [Create and Publish Sensitivity Labels](https://docs.microsoft.com/microsoft-365/compliance/create-sensitivity-labels?view=o365-worldwide&amp;preserve-view=true)

- [Apply Encryption to Sensitivity Labels](https://docs.microsoft.com/microsoft-365/compliance/encryption-sensitivity-labels?view=o365-worldwide&amp;preserve-view=true)

- [PowerShell for Azure Information Protection](https://docs.microsoft.com/azure/information-protection/administer-powershell)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### PV-8: Conduct regular attack simulation

**Guidance**: As required, conduct penetration testing or red team activities on your Azure resources and ensure remediation of all critical security findings.
Follow the Microsoft Cloud Penetration Testing Rules of Engagement to ensure your penetration tests are not in violation of Microsoft policies. Use Microsoft's strategy and execution of Red Teaming and live site penetration testing against Microsoft-managed cloud infrastructure, services, and applications.

- [Penetration testing in Azure](https://docs.microsoft.com/azure/security/fundamentals/pen-testing)

- [Penetration Testing Rules of Engagement](https://www.microsoft.com/msrc/pentest-rules-of-engagement?rtc=1) 

- [Microsoft Cloud Red Teaming](https://gallery.technet.microsoft.com/Cloud-Red-Teaming-b837392e)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Shared

## Backup and Recovery

*For more information, see the [Azure Security Benchmark: Backup and Recovery](/azure/security/benchmarks/security-controls-v2-backup-recovery).*

### BR-4: Mitigate risk of lost keys

**Guidance**: Azure Information Protection provides customers with the ability to configure their tenant with their own key through Bring Your Own Key (BYOK). Customer-generated keys must be stored in Azure Key Vault for protection. Azure Key Vault helps prevent the loss of keys through soft delete, role separation, and separated security domains. 

- [Azure Information Protection Bring Your Own Key and Integration with Azure Key Vault](https://docs.microsoft.com/azure/information-protection/byok-price-restrictions)
- [Enable soft delete in Key Vault](https://docs.microsoft.com/azure/storage/blobs/storage-blob-soft-delete?tabs=azure-portal)

**Azure Security Center monitoring**: Yes

**Responsibility**: Customer

## Governance and Strategy

*For more information, see the [Azure Security Benchmark: Governance and Strategy](/azure/security/benchmarks/security-controls-v2-governance-strategy).*

### GS-1: Define asset management and data protection strategy 

**Guidance**: Ensure you document and communicate a clear strategy for continuous monitoring and protection of systems and data. Prioritize discovery, assessment, protection, and monitoring of business-critical data and systems. 

This strategy should include documented guidance, policy, and standards for the following elements: 

-	Data classification standard in accordance with the business risks

-	Security organization visibility into risks and asset inventory 

-	Security organization approval of Azure services for use 

-	Security of assets through their lifecycle

-	Required access control strategy in accordance with organizational data classification

-	Use of Azure native and third-party data protection capabilities

-	Data encryption requirements for in-transit and at-rest use cases

-	Appropriate cryptographic standards

More information, is available at the references links. 

- [Azure Security Architecture Recommendation - Storage, data, and encryption](https://docs.microsoft.com/azure/architecture/framework/security/storage-data-encryption?toc=/security/compass/toc.json&amp;bc=/security/compass/breadcrumb/toc.json)

- [Azure Security Fundamentals - Azure Data security, encryption, and storage](https://docs.microsoft.com/azure/security/fundamentals/encryption-overview)

- [Cloud Adoption Framework - Azure data security and encryption best practices](https://docs.microsoft.com/azure/security/fundamentals/data-encryption-best-practices?toc=/azure/cloud-adoption-framework/toc.json&amp;bc=/azure/cloud-adoption-framework/_bread/toc.json)

- [Azure Security Benchmark - Asset management](https://docs.microsoft.com/azure/security/benchmarks/security-benchmark-v2-asset-management)

- [Azure Security Benchmark - Data Protection](https://docs.microsoft.com/azure/security/benchmarks/security-benchmark-v2-data-protection)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### GS-2: Define enterprise segmentation strategy 

**Guidance**: Establish an enterprise-wide strategy to segmenting access to assets using a combination of identity, network, application, subscription, management group, and other controls.

Carefully balance the need for security separation with the need to enable daily operation of the systems that need to communicate with each other and access data.

Ensure that the segmentation strategy is implemented consistently across control types including network security, identity and access models, and application permission/access models, and human process controls.

- [Guidance on segmentation strategy in Azure (video)](https://docs.microsoft.com/security/compass/microsoft-security-compass-introduction#azure-components-and-reference-model-2151)

- [Guidance on segmentation strategy in Azure (document)](https://docs.microsoft.com/security/compass/governance#enterprise-segmentation-strategy)

- [Align network segmentation with enterprise segmentation strategy](https://docs.microsoft.com/security/compass/network-security-containment#align-network-segmentation-with-enterprise-segmentation-strategy)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### GS-3: Define security posture management strategy

**Guidance**: Continuously measure and mitigate risks to your individual assets and the environment they are hosted in. Prioritize high value assets and highly-exposed attack surfaces, such as published applications, network ingress and egress points, user and administrator endpoints, etc.

- [Azure Security Benchmark - Posture and vulnerability management](https://docs.microsoft.com/azure/security/benchmarks/security-benchmark-v2-posture-vulnerability-management)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### GS-4: Align organization roles, responsibilities, and accountabilities

**Guidance**: Ensure you document and communicate a clear strategy for roles and responsibilities in your security organization. Prioritize providing clear accountability for security decisions, educating everyone on the shared responsibility model, and educate technical teams on technology to secure the cloud.

- [Azure Security Best Practice 1 – People: Educate Teams on Cloud Security Journey](https://docs.microsoft.com/azure/cloud-adoption-framework/security/security-top-10#1-people-educate-teams-about-the-cloud-security-journey)

- [Azure Security Best Practice 2 - People: Educate Teams on Cloud Security Technology](https://docs.microsoft.com/azure/cloud-adoption-framework/security/security-top-10#2-people-educate-teams-on-cloud-security-technology)

- [Azure Security Best Practice 3 - Process: Assign Accountability for Cloud Security Decisions](https://docs.microsoft.com/azure/cloud-adoption-framework/security/security-top-10#4-process-update-incident-response-ir-processes-for-cloud)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### GS-5: Define network security strategy

**Guidance**: Establish an Azure network security approach as part of your organization’s overall security access control strategy.  

This strategy should include documented guidance, policy, and standards for the following elements: 

-	Centralized network management and security responsibility

-	Virtual network segmentation model aligned with the enterprise segmentation strategy

-	Remediation strategy in different threat and attack scenarios

-	Internet edge and ingress and egress strategy

-	Hybrid cloud and on-premises interconnectivity strategy

-	Up-to-date network security artifacts (e.g. network diagrams, reference network architecture)

For more information, see the following references:
- [Azure Security Best Practice 11 - Architecture. Single unified security strategy](https://docs.microsoft.com/azure/cloud-adoption-framework/security/security-top-10#11-architecture-establish-a-single-unified-security-strategy)

- [Azure Security Benchmark - Network Security](https://docs.microsoft.com/azure/security/benchmarks/security-benchmark-v2-network-security)

- [Azure network security overview](https://docs.microsoft.com/azure/security/fundamentals/network-overview)

- [Enterprise network architecture strategy](https://docs.microsoft.com/azure/cloud-adoption-framework/ready/enterprise-scale/architecture)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### GS-6: Define identity and privileged access strategy

**Guidance**: Establish an Azure identity and privileged access approaches as part of your organization’s overall security access control strategy.  

This strategy should include documented guidance, policy, and standards for the following elements: 

-	A centralized identity and authentication system and its interconnectivity with other internal and external identity systems

-	Strong authentication methods in different use cases and conditions

-	Protection of highly privileged users

-	Anomaly user activities monitoring and handling  

-	User identity and access review and reconciliation process

For more information, see the following references:

- [Azure Security Benchmark - Identity management](https://docs.microsoft.com/azure/security/benchmarks/security-benchmark-v2-identity-management)

- [Azure Security Benchmark - Privileged access](https://docs.microsoft.com/azure/security/benchmarks/security-benchmark-v2-privileged-access)

- [Azure Security Best Practice 11 - Architecture. Single unified security strategy](https://docs.microsoft.com/azure/cloud-adoption-framework/security/security-top-10#11-architecture-establish-a-single-unified-security-strategy)

- [Azure identity management security overview](https://docs.microsoft.com/azure/security/fundamentals/identity-management-overview)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

### GS-7: Define logging and threat response strategy

**Guidance**: Establish a logging and threat response strategy to rapidly detect and remediate threats while meeting compliance requirements. Prioritize providing analysts with high-quality alerts and seamless experiences so that they can focus on threats rather than integration and manual steps. 

This strategy should include documented guidance, policy, and standards for the following elements: 

-	The security operations (SecOps) organization’s role and responsibilities 

-	A well-defined incident response process aligning with NIST or another industry framework 

-	Log capture and retention to support threat detection, incident response, and compliance needs

-	Centralized visibility of and correlation information about threats, using SIEM, native Azure capabilities, and other sources 

-	Communication and notification plan with your customers, suppliers, and public parties of interest

-	Use of Azure native and third-party platforms for incident handling, such as logging and threat detection, forensics, and attack remediation and eradication

-	Processes for handling incidents and post-incident activities, such as lessons learned and evidence retention

For more information, see the following references:

- [Azure Security Benchmark - Logging and threat detection](https://docs.microsoft.com/azure/security/benchmarks/security-benchmark-v2-logging-threat-detection)

- [Azure Security Benchmark - Incident response](https://docs.microsoft.com/azure/security/benchmarks/security-benchmark-v2-incident-response)

- [Azure Security Best Practice 4 - Process. Update Incident Response Processes for Cloud](https://docs.microsoft.com/azure/cloud-adoption-framework/security/security-top-10#4-process-update-incident-response-ir-processes-for-cloud)

- [Azure Adoption Framework, logging, and reporting decision guide](https://docs.microsoft.com/azure/cloud-adoption-framework/decision-guides/logging-and-reporting/)

- [Azure enterprise scale, management, and monitoring](https://docs.microsoft.com/azure/cloud-adoption-framework/ready/enterprise-scale/management-and-monitoring)

**Azure Security Center monitoring**: Not applicable

**Responsibility**: Customer

## Next steps

- See the [Azure Security Benchmark V2 overview](/azure/security/benchmarks/overview)
- Learn more about [Azure security baselines](/azure/security/benchmarks/security-baselines-overview)
