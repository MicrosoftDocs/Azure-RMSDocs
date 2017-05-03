---
# required metadata

title: HYOK restrictions for Azure Information Protection
description: Identify the limitations, prerequisites, and recommendations if you select HYOK (AD RMS) protection with Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 05/02/2017
ms.topic: article
ms.prod:
ms.service: information-protection
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

>*Applies to: Azure Information Protection*

When you protect your most sensitive documents and emails, you will typically do this by applying Azure Rights Management (Azure RMS) protection to benefit from the following:

- No server infrastructure required, which makes the solution quicker and more cost effective to deploy and maintain than an on-premises solution.

- Easier sharing with partners and users from other organizations by using cloud-based authentication.

- Tight integration with Office 365 services, such as search, web viewers, pivoted views, anti-malware, eDiscovery, and Delve.

- Document tracking, revocation, and email notification for sensitive documents that you have shared.

Azure RMS protects your organization's documents and emails by using a private key for the organization that is managed by Microsoft (the default), or managed by you (the "bring your own key" or BYOK scenario). The information that you protect with Azure RMS is never sent to the cloud; the protected documents and emails are not stored in Azure unless you explicitly store them there or use another cloud service that stores them in Azure. For more information about the tenant key options, see [Planning and implementing your Azure Information Protection tenant key](../plan-design/plan-implement-tenant-key.md). 

However, a few organizations might need to protect a small subset of documents and emails with a key that is hosted on-premises. For example, this might be required for regulatory and compliance reasons.  

This configuration is sometimes referred to as "hold your own key" (HYOK) and it is supported by Azure Information Protection when you have a working Active Directory Rights Management Services (AD RMS) deployment with the requirements that are documented in the next section.

In this HYOK scenario, the rights policies and the organization's private key that protects these policies are managed and kept on-premises while the Azure Information Protection policy for labeling and classification remains managed and stored in Azure. As with Azure RMS protection, information that you protect with AD RMS is never sent to the cloud.

> [!NOTE]
> Use this configuration only when you have to, and for just the documents and emails that require it. AD RMS protection doesn't provide the listed benefits that you get when you use Azure RMS protection, and its purpose is "data opacity at all costs".
>
> Even for the organizations that use this configuration, it will typically be suitable for less than 10% of all the content that needs to be protected content. As guidance, use it only for documents or emails that match all the following criteria:
> 
> - The content has the highest classification in your organization ("Top Secret") and access is restricted to just a few people.
> 
> - The content will never be shared outside the organization.
> 
> - The content will only be consumed on the internal network.
> 
> - The content does not need to be consumed on Mac computers or mobile devices.

Users will not be aware when a label uses AD RMS protection rather than Azure RMS protection. Because of the restrictions and limitations that come with AD RMS protection, make sure that you provide clear guidance about the exceptions for when users should select labels that apply AD RMS protection. 

[Scoped policies](configure-policy-scope.md) are a good way to ensure that only the users who need to apply AD RMS protection see labels that are configured for AD RMS protection. 

## Additional limitations when using HYOK

In addition to not supporting the listed benefits that you get when you use Azure RMS protection, using AD RMS protection with Azure Information Protection has the following limitations:

- Does not support Office 2010 or Office 2007.

- Do not use the **Do Not Forward** option when you configure a label for Azure RMS protection. You must also instruct users not to manually select this option in Outlook. 

    If the Do Not Forward option is applied by a label or manually by users, the option might be applied by your AD RMS deployment rather than the intended Azure Rights Management service. In this scenario, people that you share with externally will not be able to open email messages that have this Do Not Forward option applied.

- If users configure custom permissions when you use AD RMS (HYOK) protection and Azure RMS protection, the document or email is always protected by Azure Rights Management.

- If users choose a label in Outlook that applies AD RMS protection, and then change their minds before sending the email and select a label that applies Azure RMS protection, the newly selected label will fail to apply. Users see the following error message: **Azure Information Protection cannot apply this label. You don't have permission to perform this action.**
    
    The only workaround is to close the email message and start again. The same limitation applies if similarly, users first choose a label that applies Azure RMS protection and then change the label to one that applies AD RMS protection.

## Requirements for HYOK

Check that your AD RMS deployment meets the following requirements to provide AD RMS protection for Azure Information Protection.

- AD RMS configuration:
    
    - Minimal version of Windows Server 2012 R2: Required for production environments but for testing or evaluation purposes, you can use a minimal version of Windows Server 2008 R2 with Service Pack 1.
    
    - Single AD RMS root cluster.
    
    - [Cryptographic Mode 2](https://technet.microsoft.com/library/hh867439.aspx): You can confirm the version of the cryptographic mode of the AD RMS cluster, and its overall health, by using the [RMS Analyzer tool](https://www.microsoft.com/en-us/download/details.aspx?id=46437).   
    
    - A service connection point (SCP) is not registered in Active Directory: A SCP is not used when you use AD RMS protection with Azure Information Protection. If you have a registered a SCP for your AD RMS deployment, you must remove it so that [service discovery](../rms-client/client-deployment-notes.md#rms-service-discovery) is successful for Azure Rights Management protection.
    
    - The AD RMS servers are configured to use SSL/TLS with a valid x.509 certificate that is trusted by the connecting clients: Required for production environments but not required for testing or evaluation purposes.
    
    - Configured rights templates.

- Directory synchronization is configured between your on-premises Active Directory and Azure Active Directory, and users who will use AD RMS protection are configured for single sign-on.

- If you will share documents or emails that are protected by AD RMS with others outside your organization: AD RMS is configured for explicitly defined trusts in a direct point-to-point relationship with the other organizations by using either trusted user domains (TUDs) or federated trusts that are created by using Active Directory Federation Services (AD FS).

- Users have a version of Office that is Office 2013 Pro Plus with Service 1 or Office 2016 Pro Plus, running on Windows 7 Service Pack 1 or later. Note that Office 2010 and Office 2007 is not supported for this scenario.

> [!IMPORTANT]
> To fulfill the high assurance that this scenario offers, we recommend that your AD RMS servers are not located in your DMZ, and that they are used by only well-managed computers (for example, not mobile devices or workgroup computers). 
> 
> We also recommend that your AD RMS cluster uses a hardware security module (HSM), so that the private key for your Server Licensor Certificate (SLC) cannot be exposed or stolen if your AD RMS deployment should ever be breached or compromised. 

For deployment information and instructions for AD RMS, see [Active Directory Rights Management Services](https://technet.microsoft.com/library/hh831364.aspx) in the Windows Server library. 


## Locating the information to specify AD RMS protection with an Azure Information Protection label

When you configure a label for **HYOK (AD RMS)** protection, you must specify the template GUID and licensing URL of your AD RMS cluster. You can find both these values from the Active Directory Rights Management Services console:

- To locate the template GUID: Expand the cluster and click **Rights Policy Templates**. From the **Distributed Rights Policy Templates** information, you can then copy the GUID from the template you want to use. For example: 82bf3474-6efe-4fa1-8827-d1bd93339119

- To locate the licensing URL: Click the cluster name. From the **Cluster Details** information, copy the **Licensing** value minus the **/_wmcs/licensing** string. For example: https://rmscluster.contoso.com 
    
    If you have an extranet licensing value as well as an intranet licensing value and they are different: Specify the extranet value only if you will share protected documents or emails with partners that you have defined with explicit point-to-point trusts. Otherwise, use the intranet value and make sure that all your client computers that use AD RMS protection with Azure Information Protection connect by using an intranet connection (for example, remote computers use a VPN connection).

## Next steps

To read more information about this feature and guidance for when to use it, see the blog post announcement, [Azure Information Protection with HYOK (Hold Your Own Key)](https://blogs.technet.microsoft.com/enterprisemobility/2016/08/10/azure-information-protection-with-hyok-hold-your-own-key/).

To configure a label for AD RMS protection, see [How to configure a label for Rights Management protection](../deploy-use/configure-policy-protection.md). 

[!INCLUDE[Commenting house rules](../includes/houserules.md)]