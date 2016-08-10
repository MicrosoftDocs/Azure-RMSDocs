---
# required metadata

title: HYOK restrictions | Azure Rights Management
description:
author: cabailey
manager: mbaldwin
ms.date: 08/10/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 7667b5b0-c2e9-4fcf-970f-05577ba51126


# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Hold your own key (HYOK) requirements and restrictions for AD RMS protection

>*Applies to: Azure Information Protection preview*

**[ This information is preliminary and subject to change. ]**

When you protect your most sensitive documents and emails, you will typically do this by applying Azure Rights Management protection to benefit from the following:

- No server infrastructure required, which makes the solution quicker and more cost effective to deploy and maintain than an on-premises solution.

- Easier sharing with partners and users from other organizations by using cloud-based authentication.

- Tight integration with Office 365 services, such as search, web viewers, pivoted views, anti-malware, eDiscovery, and Delve.

- Document tracking, revocation, and email notification for sensitive documents that you have shared.

Azure RMS protects your organization's documents and emails by using a private key for the organization that is managed by Microsoft (the default), or managed by you (the "bring your own key" or BYOK scenario). The information that you protect with Azure RMS is never sent to the cloud; the protected documents and emails are not stored in Azure unless you explicitly store them there or use another cloud service that stores them in Azure. For more information about the tenant key options, see [Planning and implementing your Azure Rights Management tenant key](../plan-design/plan-implement-tenant-key.md). 

However, a few customers might need to protect selected documents and emails with a key that is hosted on-premises. For example, this might be required for regulatory and compliance reasons. 

This configuration is sometimes referred to as "hold your own key" (HYOK) and it is supported by Azure Information Protection when you have a working Active Directory Rights Management Services (AD RMS) deployment with the requirements that are documented in the next section. 

In this HYOK scenario, the rights policies and the organization's private key that protects these policies are managed and kept on-premises while the Azure Information Protection policy for labeling and classification remains managed and stored in Azure. As with Azure RMS protection, information that you protect with AD RMS is never sent to the cloud.

> [!NOTE]
> Use this configuration only when you have to, and for just the documents and emails that require it. AD RMS protection doesn't provide the listed benefits that you get when you use Azure RMS protection, and its purpose is "data opacity at all costs".

Users will not be aware when a label uses AD RMS protection rather than Azure RMS protection. Because of the restrictions that come with AD RMS protection, make sure that you provide clear guidance for when users should select labels that apply AD RMS protection.

## Requirements for HYOK

Check that your AD RMS deployment meets the following requirements to provide AD RMS protection for Azure Information Protection.

- AD RMS configuration:
    
    - Single AD RMS root cluster.
    
    - [Cryptographic Mode 2](https://technet.microsoft.com/library/hh867439.aspx).
    
    - Configured rights templates.

- Directory synchronization is configured between your on-premises Active Directory and Azure Active Directory, and users who will use AD RMS protection are configured for single sign-on.

- If you will share documents and emails that are protected by AD RMS with others outside your organization: AD RMS is configured for explicitly defined trusts in a direct point-to-point relationship with the other organizations by using either trusted user domains (TUDs) or federated trusts that are created by using Active Directory Federation Services (AD FS).

- Users have a version of Office that is Office 2013 Pro Plus with Service 1 or Office 2016 Pro Plus, running on Windows 7 Service Pack 1 or later. Note that Office 2010 and Office 2007 is not supported for this scenario.

- The [Azure Information Protection client](info-protect-client.md) is version **1.0.233** or later.

> [!IMPORTANT]
> To fulfill the high assurance that this scenario offers, we recommend that your AD RMS servers are not located in your DMZ, and that they are used by only well-managed computers (for example, not mobile devices or workgroup computers).

For deployment information and instructions for AD RMS, see [Active Directory Rights Management Services](https://technet.microsoft.com/library/hh831364.aspx) in the Windows Server library. 


## Locating the information to specify AD RMS protection with an Azure Information Protection label

When you configure a label for AD RMS protection, you must specify the template GUID and licensing URL of your AD RMS cluster. You can find both these values from the Active Directory Rights Management Sevices console:

- To locate the template GUID: Expand the cluster and click **Rights Policy Templates**. From the **Distributed Rights Policy Templates** information, you can then copy the GUID from the template you want to use. For example: 82bf3474-6efe-4fa1-8827-d1bd93339119

- To locate the licensing URL: Click the cluster name. From the **Cluster Details** information, copy the **Licensing** value from the **Extranet cluster URLs**, minus the **/_wmcs/licensing** string. If you do not have a value specified for the extranet cluster URLs, use the intranet licensing value. For example: https://rmscluster.contoso.com 

## Next steps

To read more information about this preview feature, see the blog post announcement, [Azure Information Protection with HYOK (Hold Your Own Key)](https://blogs.technet.microsoft.com/enterprisemobility/2016/08/10/azure-information-protection-with-hyok-hold-your-own-key/).

To configure a label for AD RMS protection, see [How to configure a label to apply Rights Management protection](configure-policy-protection.md). 
