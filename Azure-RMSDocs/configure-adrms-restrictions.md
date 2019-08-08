---
# required metadata

title: HYOK protection for Azure Information Protection
description: Overview of HYOK (AD RMS) protection with Azure Information Protection, its supported scenarios, limitations, prerequisites, and recommendations.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 08/07/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 7667b5b0-c2e9-4fcf-970f-05577ba51126


# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: hyok
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Hold your own key (HYOK) protection for Azure Information Protection

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*
>
> *Instructions for: [Azure Information Protection client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-client-and-the-azure-information-protection-unified-labeling-client)*

Use the following information to understand what hold your own key (HYOK) protection is for Azure Information Protection, and how it is different from the default cloud-based protection. Before you use HYOK protection, make sure that you understand when it's appropriate, the supported scenarios, the limitations, and requirements. 

## Cloud-based protection vs. HYOK

When you protect your most sensitive documents and emails by using Azure Information Protection, you typically do this by applying a cloud-based key that uses Azure Rights Management (Azure RMS) protection to benefit from the following:

- No server infrastructure required, which makes the solution quicker and more cost effective to deploy and maintain than an on-premises solution.

- Easier sharing with partners and users from other organizations by using cloud-based authentication.

- Tight integration with other Azure and Office 365 services, such as search, web viewers, pivoted views, anti-malware, eDiscovery, and Delve.

- Document tracking, revocation, and email notification for sensitive documents that you have shared.

A cloud-based key protects your organization's documents and emails by using a private key for the organization that is managed by Microsoft (the default), or managed by you (the "bring your own key" or BYOK scenario). For more information about the tenant key options, see [Planning and implementing your Azure Information Protection tenant key](plan-implement-tenant-key.md).

Documents and emails that you protect could be stored in the cloud or on-premises. For more information about how the protection process works for this cloud-based key, see [What is Azure Rights Management?](what-is-azure-rms.md )

Office 365 services and cloud-based applications for your tenant can integrate with Azure Information Protection so that important business functions, such as search, indexing, archiving, and anti-malware services continue to work seamlessly for content that's protected by Azure Information Protection. This ability to read the encrypted content for these scenarios is often referred to as "reasoning over data". For example, it's this ability that lets Exchange Online decrypt emails for malware scanning and to run data loss prevention (DLP) rules on encrypted emails.

However, for regulatory requirements, a few organizations might be required to encrypt content with a key that is isolated from the cloud. This isolation means that the encrypted content can be read only by on-premises applications and on-premises services. This key management option is supported by Azure Information Protection, and it is referred to as "hold your own key" or HYOK. When you use Azure Information Protection with HYOK, your tenant has both a cloud-based key and an on-premises key.

## HYOK guidance and best practices

Use HYOK protection just for the documents and emails that require the encryption key to be isolated from the cloud. HYOK protection doesn't provide the listed benefits that you get when you use cloud-based key protection, and it often comes at the cost of "data opacity". This phrase means that only on-premises applications and services will be able to open HYOK-protected data; cloud-based services and applications cannot reason over HYOK-protected data.

Even for the organizations that use HYOK protection, it is typically suitable for a small number of documents that need to be protected. As guidance, use it only for documents and when they match all the following criteria:

- The content has the highest classification in your organization ("Top Secret") and access is restricted to just a few people

- The content is not shared outside the organization

- The content is only consumed on the internal network

Because HYOK protection is an administrator configuration option for a label, user workflows remain the same, irrespective of whether the protection uses a cloud-based key or HYOK.

[Scoped policies](configure-policy-scope.md) are a good way to ensure that only the users who need to apply HYOK protection see labels that are configured for HYOK protection. 

## Supported scenarios for HYOK

To apply HYOK protection, use Azure Information Protection labels. 

The following table lists the supported scenarios for protecting content by using labels that are configured for HYOK, and opening (consuming) content that's protected by HYOK.

|Platform|Application|Supported|
|----------------------|----------|-----------|
|Windows|Azure Information Protection client with Office 365 apps, Office 2019, Office 2016, and Office 2013 <br /><br />- Word, Excel, PowerPoint|Protection: Yes<br /><br />Consumption: Yes|
|Windows|Azure Information Protection client with Office 365 apps, Office 2019, Office 2016, and Office 2013 <br /><br />- Outlook|Protection: Yes<br /><br />Consumption: Yes|
|Windows|Azure Information Protection client with File Explorer|Protection: Yes <br /><br />Consumption: Yes|
|Windows|Azure Information Protection Viewer|Protection: Not applicable<br /><br />Consumption: Yes|
|Windows|Azure Information Protection client with PowerShell labeling cmdlets|Protection: Yes<br /><br />Consumption: Yes|
|Windows|Azure Information Protection scanner|Protection: Yes<br /><br />Consumption: Yes|
|Windows|Rights Management sharing app|Protection: No<br /><br />Consumption: Yes|
|MacOS|Office for Mac <br /><br /> - Word, Excel, PowerPoint|Protection: No<br /><br />Consumption: Yes|
|MacOS|Office for Mac<br /><br />- Outlook|Protection: No<br /><br />Consumption: Yes|
|MacOS|Rights Management sharing app|Protection: No<br /><br />Consumption: Yes|
|iOS|Office Mobile <br /><br />- Word, Excel, PowerPoint|Protection: No<br /><br />Consumption: Yes|
|iOS|Office Mobile <br /><br />-Outlook|Protection: No<br /><br />Consumption: No|
|iOS|Azure Information Protection Viewer|Protection: Not applicable<br /><br />Consumption: Yes|
|Android|Office Mobile <br /><br />- Word, Excel, PowerPoint|Protection: No<br /><br />Consumption: Yes|
|Android|Office Mobile <br /><br />- Outlook|Protection: No<br /><br />Consumption: No|
|Android|Azure Information Protection Viewer|Protection: Not applicable<br /><br />Consumption: Yes|
|Web|Outlook on the web|Protection: No<br /><br />Consumption: No|
|Web|Office for the web<br /><br />- Word, Excel, PowerPoint|Protection: No<br /><br />Consumption: No|
|Universal|Office Universal apps<br /><br />- Word, Excel, PowerPoint|Protection: No<br /><br />Consumption: No|


## Additional limitations when using HYOK

Additionally, using HYOK protection with Azure Information Protection labels has the following limitations:

- Does not support versions of Office earlier than Office 2013.

- Office 365 services and other online services will not be able to decrypt HYOK-protected documents and emails to inspect the content and take action on them. This limitation extends to HYOK-protected documents and emails that have been protected with the Rights Management connector. 
    
    This loss of functionality for HYOK-protected email includes malware scanners, data loss prevention (DLP) solutions, mail routing rules, journaling, eDiscovery, archiving solutions, and Exchange ActiveSync. In addition, users won't understand why some devices cannot open their HYOK-protected emails, and this can result in calls to your help desk. Because of these many limitations, we do not recommend that you use HYOK protection for emails.

## Implementing HYOK

HYOK is supported by Azure Information Protection when you have a working Active Directory Rights Management Services (AD RMS) deployment with the requirements that are documented in the next section. In this scenario, the usage rights policies and the organization's private key that protects these policies are managed and kept on-premises, while the Azure Information Protection policy for labeling and classification remains managed and stored in Azure. 

Do not confuse HYOK and Azure Information Protection with using a full deployment of AD RMS and Azure Information Protection, or as an alternative to migrating AD RMS to Azure Information Protection. HYOK is only supported by applying labels, does not offer feature parity with AD RMS, and does not support all AD RMS deployment configurations:

- For more information about the scenarios that HYOK supports for protecting content and consuming protected content, see the [Supported scenarios for HYOK](#supported-scenarios-for-hyok) section.

- For migration instructions from AD RMS, see [Migrating from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md).

- For more information about the AD RMS deployment requirements, see the next section.

### Requirements for AD RMS to support HYOK

An AD RMS deployment must meet the following requirements to provide HYOK protection for Azure Information Protection labels.

- AD RMS configuration:
    
  - Minimal version of Windows Server 2012 R2: Required for production environments but for testing or evaluation purposes, you can use a minimal version of Windows Server 2008 R2 with Service Pack 1.
    
  - One of the following topologies:
        
    - Single forest with a single AD RMS root cluster. 
        
    - Multiple forests with independent AD RMS root clusters and users don't have access to the content that's protected by the users in the other forests.
        
    - Multiple forests with AD RMS clusters in each of them. Each AD RMS cluster shares a licensing URL that points to the same AD RMS cluster. On this AD RMS cluster, you must import all the trusted user domain (TUD) certificates from all the other AD RMS clusters. For more information about this topology, see [Trusted User Domain](https://technet.microsoft.com/library/dd983944(v=ws.10).aspx).
        
    When you have multiple AD RMS clusters in separate forests, delete any labels in the global policy that apply HYOK (AD RMS) protection and configure a [scoped policy](configure-policy-scope.md) for each cluster. Then, assign users for each cluster to their scoped policy, making sure that you do not use groups that would result in a user being assigned to more than one scoped policy. The result should be that each user has labels for one AD RMS cluster only. 
    
  - [Cryptographic Mode 2](https://technet.microsoft.com/library/hh867439.aspx): You can confirm the mode by checking the AD RMS cluster properties, **General** tab.
    
  - Each AD RMS server is configured for the certification URL. [Instructions](#configuring-ad-rms-servers-to-locate-the-certification-url) 
    
  - A service connection point (SCP) is not registered in Active Directory: An SCP is not used when you use AD RMS protection with Azure Information Protection. 
    
      - If you have a registered an SCP for your AD RMS deployment, you must remove it so that [service discovery](./rms-client/client-deployment-notes.md#rms-service-discovery) is successful for Azure Rights Management protection. 
        
      - If you are installing a new AD RMS cluster for HYOK, skip the step to register the SCP during the configuration of the first node. For each additional node, make sure that the server is configured for the certification URL before you add the AD RMS role and join the existing cluster.
    
  - The AD RMS servers are configured to use SSL/TLS with a valid x.509 certificate that is trusted by the connecting clients: Required for production environments but not required for testing or evaluation purposes.
    
  - Configured rights templates.
    
  - Not configured for Exchange IRM.
    
  - For mobile devices and Mac computers: The [Active Directory Rights Management Services Mobile Device Extension](https://technet.microsoft.com/library/dn673574.aspx) is installed and configured.

- Directory synchronization is configured between your on-premises Active Directory and Azure Active Directory, and users who will use HYOK protection are configured for single sign-on.

- If you share documents or emails that are protected by HYOK with others outside your organization: AD RMS is configured for explicitly defined trusts in a direct point-to-point relationship with the other organizations by using either trusted user domains (TUDs) or federated trusts that are created by using Active Directory Federation Services (AD FS).

- Users have a version of Office that supports Information Rights Management (IRM) and at least Office 2013 Professional Plus with Service Pack 1, running on Windows 7 Service Pack 1 or later. Note that Office 2010 and Office 2007 are not supported for this scenario.
    
    - For Office 2016, Microsoft Installer (.msi)-based edition: You have installed [update 4018295 for Microsoft Office 2016 that was released on March 6, 2018](https://support.microsoft.com/en-us/help/4018295/march-6-2018-update-for-office-2016-kb4018295).

> [!IMPORTANT]
> To fulfill the high assurance that HYOK protection offers, we recommend that your AD RMS servers are not located in your DMZ, and that they are used by only managed devices. 
> 
> We also recommend that your AD RMS cluster uses a hardware security module (HSM), so that the private key for your Server Licensor Certificate (SLC) cannot be exposed or stolen if your AD RMS deployment should ever be breached or compromised. 

For deployment information and instructions for AD RMS, see [Active Directory Rights Management Services](https://technet.microsoft.com/library/hh831364.aspx) in the Windows Server library. 


### Configuring AD RMS servers to locate the certification URL

1. On each AD RMS server in the cluster, create the following registry entry:

    `Computer\HKEY_LOCAL_MACHINE\Software\Microsoft\DRMS\GICURL = "<string>"`
    
    For the \<string value>, specify one of the following:
    
    - For AD RMS clusters using SSL/TLS:

	        https://<cluster_name>/_wmcs/certification/certification.asmx
    
    - For AD RMS clusters not using SSL/TLS (testing networks only):
        
            http://<cluster_name>/_wmcs/certification/certification.asmx

2. Restart IIS.

### Locating the information to specify AD RMS protection with an Azure Information Protection label

When you configure a label for **HYOK (AD RMS)** protection, you must specify the licensing URL of your AD RMS cluster. In addition, you must specify either a template that you've configured for the permissions to grant users, or let users define the permissions and users. 

You can find the template GUID and licensing URL values from the Active Directory Rights Management Services console:

- To locate a template GUID: Expand the cluster and click **Rights Policy Templates**. From the **Distributed Rights Policy Templates** information, you can then copy the GUID from the template you want to use. For example: 82bf3474-6efe-4fa1-8827-d1bd93339119

- To locate the licensing URL: Click the cluster name. From the **Cluster Details** information, copy the **Licensing** value minus the **/_wmcs/licensing** string. For example: https://rmscluster.contoso.com 
    
    If you have an extranet licensing value as well as an intranet licensing value, and they are different: Specify the extranet value only if you will share protected documents or emails with partners that you have defined with explicit point-to-point trusts. Otherwise, use the intranet value and make sure that all your client computers that use AD RMS protection with Azure Information Protection connect by using an intranet connection (for example, remote computers use a VPN connection).


## Next steps

To configure a label for HYOK protection, see [How to configure a label for Rights Management protection](configure-policy-protection.md). 
