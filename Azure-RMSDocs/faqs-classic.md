---
# required metadata

title: FAQs for the Azure Information Protection classic client
description: Some frequently asked questions about Azure Information Protection and its protection service, Azure Rights Management (Azure RMS). The FAQs listed here are relevant for the AIP classic client only.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 11/12/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin
search.appverid:
- MET150

---

# Frequently asked questions for the Azure Information Protection classic client

>***Applies to**: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*
>
>***Relevant for**: [AIP unified labeling classic client only](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients). For more information, see [Frequently asked questions for Azure Information Protection](faqs.md).*

This article lists frequently asked questions that are related to the Azure Information Protection classic client only.

>[!NOTE] 
> To provide a unified and streamlined customer experience, **Azure Information Protection classic client** and **Label Management** in the Azure Portal are being **deprecated** as of **March 31, 2021**. This time-frame allows all current Azure Information Protection customers to transition to our unified labeling solution using the Microsoft Information Protection Unified Labeling platform. Learn more in the official [deprecation notice](https://aka.ms/aipclassicsunset).

## Is the Azure Information Protection client only for subscriptions that include classification and labeling?

No. The classic AIP client can also be used with subscriptions that include just the Azure Rights Management service, for data protection only.

When the classic client is installed without an Azure Information Protection policy, the client automatically operates in [protection-only mode](./rms-client/client-protection-only-mode.md), which enables users to apply Rights Management templates and custom permissions. 

If you later purchase a subscription that does include classification and labeling, the client automatically switches to standard mode when it downloads the Azure Information Protection policy.


## What's the difference between Windows Server FCI and the Azure Information Protection scanner?

Windows Server File Classification Infrastructure has historically been an option to classify documents and then protect them by using the [Rights Management connector](deploy-rms-connector.md) (Office documents only) or a [PowerShell script](./rms-client/configure-fci.md) (all file types). 

We now recommend you use the [Azure Information Protection scanner](deploy-aip-scanner.md). The scanner uses the Azure Information Protection client and your Azure Information Protection policy to label documents (all file types) so that these documents are then classified and optionally, protected.

The main differences between these two solutions:

|  |Windows Server FCI  |Azure Information Protection scanner  |
|---------|---------|---------|
|**Supported data stores**    | Local folders on Windows Server        | - Windows file shares and network-attached storage<br /><br />- SharePoint Server 2016 and SharePoint Server 2013. SharePoint Server 2010 is also supported for customers who have [extended support for this version of SharePoint](https://support.microsoft.com/lifecycle/search?alpha=SharePoint%20Server%202010).        |
|**Operational mode**     |Real time         |Systematically crawls the data stores once or repeatedly         |
|**Supported file types**     | - All file types are protected by default <br /><br />- Specific file types can be excluded from protection by editing the registry|Support for file types: <br /><br />- Office file types and PDF documents are protected by default <br /><br />- Additional file types can be included for protection by editing the registry|

### Setting Rights Management owners

By default, for both Windows Server FCI and the Azure Information Protection scanner, the [Rights Management owner](configure-usage-rights.md#rights-management-issuer-and-rights-management-owner) is set to the account that protects the file.

Override the default settings as follows:

- **Windows Server FCI**: Set the Rights Management owner to be a single account for all files, or dynamically set the Rights Management owner for each file. 

    To dynamically set the Rights Management owner, use the **-OwnerMail [Source File Owner Email]** parameter and value. This configuration retrieves the user's email address from Active Directory by using the user account name in the file's Owner property.

- **Azure Information Protection scanner**: For newly protected files, set the Rights Management owner to be a single account for all files on a specified data store, by specifying the **-Default owner** setting in the scanner profile. 

    Dynamically setting the Rights Management owner for each file is not supported, and the Rights Management owner is not changed for previously protected files. 

    > [!NOTE]
    > When the scanner protects files on SharePoint sites and libraries, the Rights Management owner is dynamically set for each file by using the SharePoint Editor value.

## How do I prevent somebody from removing or changing a label?

Although there's a [policy setting](configure-policy-settings.md) that requires users to state why they are lowering a classification label, removing a label, or removing protection, this setting does not prevent these actions. To prevent users from removing or changing a label, the content must already be protected and the protection permissions do not grant the user the Export or Full Control [usage right](configure-usage-rights.md)

## How can DLP solutions and other applications integrate with Azure Information Protection?

Because Azure Information Protection uses persistent metadata for classification, which includes a clear-text label, this information can be read by DLP solutions and other applications. 

For more information about this metadata, see [Label information stored in emails and documents](configure-policy.md#label-information-stored-in-emails-and-documents).

For examples of using this metadata with Exchange Online mail flow rules, see [Configuring Exchange Online mail flow rules for Azure Information Protection labels](configure-exo-rules.md).

## Can I create a document template that automatically includes the classification?

Yes. You can configure a label to [apply a header or footer that includes the label name](configure-policy-markings.md). But if that doesn't meet your requirements, for the Azure Information Protection classic client only, you can create a document template that has the formatting you want and add the classification as a field code. 

As an example, you might have a table in your document's header that displays the classification. Or, you use specific wording for an introduction that references the document's classification.

To add this field code in your document:

1. Label the document and save it. This action creates new metadata fields that you can now use for your field code.

2. In the document, position the cursor where you want to add the label's classification and then, from the **Insert** tab, select **Text** > **Quick Parts** > **Field**.

3. In the **Field** dialog box, from the **Categories** dropdown, select **Document Information**. Then, from the **Fields names** dropdown, select **DocProperty**.

4. From the **Property** dropdown, select **Sensitivity**, and select **OK**.

The current label's classification is displayed in the document and this value will be refreshed automatically whenever you open the document or use the template. So if the label changes, the classification that is displayed for this field code is automatically updated in the document.

## How is classification for emails using Azure Information Protection different from Exchange message classification?

Exchange message classification is an older feature that can classify emails and it is implemented independently from Azure Information Protection labels or sensitivity labels that apply classification.

However, you can integrate this older feature with labels, so that when users classify an email by using Outlook on the web and by using some mobile mail applications, the label classification and corresponding label markings are automatically added.

You can use this same technique to use your labels with Outlook on the web and these mobile mail applications.

Note that there's no need to do this if you're using Outlook on the web with Exchange Online, because this combination supports built-in labeling when you publish sensitivity labels from the Office 365 Security & Compliance Center, Microsoft 365 security center, or Microsoft compliance center.

If you cannot use built-in labeling with Outlook on the web, see the configuration steps for this workaround: [Integration with the legacy Exchange message classification](rms-client/client-admin-guide-customizations.md#integration-with-the-legacy-exchange-message-classification)

## How do I configure a Mac computer to protect and track documents?

First, make sure that you have installed Office for Mac by using the software installation link from https://admin.microsoft.com. For full instructions, see [Download and install or reinstall Microsoft 365 or Office 2019 on a PC or Mac](https://support.office.com/article/Download-and-install-or-reinstall-Office-365-or-Office-2016-on-a-PC-or-Mac-4414EAAF-0478-48BE-9C42-23ADC4716658).

Open Outlook and create a profile by using your Microsoft 365 work or school account. Then, create a new message and do the following to configure Office so that it can protect documents and emails by using the Azure Rights Management service:

1. In the new message, on the **Options** tab, click **Permissions**, and then click **Verify Credentials**.

2. When prompted, specify your Microsoft 365 work or school account details again, and select **Sign in**.

    This downloads the Azure Rights Management templates and **Verify Credentials** is now replaced with options that include **No Restrictions**, **Do Not Forward**, and any Azure Rights Management templates that are published for your tenant. You can now cancel this new message.

To protect an email message or a document: On the **Options** tab, click **Permissions** and choose an option or template that protects your email or document.

To track a document after you have protected it: From a Windows computer that has the Azure Information Protection classic client installed, register the document with the document tracking site by using either an Office application or File Explorer. For instructions, see [Track and revoke your documents](./rms-client/client-track-revoke.md). From your Mac computer, you can now use your web browser to go to the document tracking site (https://track.azurerms.com) to track and revoke this document.

## When I test revocation in the document tracking site, I see a message that says people can still access the document for up to 30 days—is this time period configurable?

Yes. This message reflects the [use license](configure-usage-rights.md#rights-management-use-license) for that specific file.

If you revoke a file, that action can be enforced only when the user authenticates to the Azure Rights Management service. So if a file has a use license validity period of 30 days and the user has already opened the document, that user continues to have access to the document for the duration of the use license. When the use license expires, the user must reauthenticate, at which point the user is denied access because the document is now revoked.

The user who protected the document, the [Rights Management issuer](configure-usage-rights.md#rights-management-issuer-and-rights-management-owner) is exempt from this revocation and is always able to access their documents.

The default value for the use license validity period for a tenant is 30 days and this setting can be overridden by a more restrictive setting in a label or template. For more information about the use license and how to configure it, see the [Rights Management use license](configure-usage-rights.md#rights-management-use-license) documentation.

## What's the difference between BYOK and HYOK and when should I use them?

**Bring your own key** (BYOK) in the context of Azure Information Protection, is when you create your own key on-premises for Azure Rights Management protection. You then transfer that key to a hardware security module (HSM) in Azure Key Vault where you continue to own and manage your key. If you didn't do this, Azure Rights Management protection would use a key that is automatically created and managed for you in Azure. This default configuration is referred to as "Microsoft-managed" rather than "customer-managed" (the BYOK option).

For more information about BYOK and whether you should choose this key topology for your organization, see [Planning and implementing your Azure Information Protection tenant key](plan-implement-tenant-key.md).

**Hold your own key** (HYOK) in the context of Azure Information Protection, is for a few organizations that have a subset of documents or emails that cannot be protected by a key that is stored in the cloud. For these organizations, this restriction applies even if they created the key and manage it, using BYOK. The restriction can often be because of regulatory or compliance reasons and the HYOK configuration should be applied to "Top Secret" information only, that will never be shared outside the organization, will only be consumed on the internal network, and does not need to be accessed from mobile devices.

For these exceptions (typically less than 10% of all the content that needs to be protected), organizations can use an on-premises solution, Active Directory Rights Management Services, to create the key that remains on-premises. With this solution, computers get their Azure Information Protection policy from the cloud, but this identified content can be protected by using the on-premises key.

For more information about HYOK and to make sure that you understand its limitations and restrictions, and guidance when to use it, see [Hold your own key (HYOK) requirements and restrictions for AD RMS protection](configure-adrms-restrictions.md).

## What do I do if my question isn't here?

First, review the frequently asked questions listed below, which are specific to classification and labeling, or specific to data protection. The [Azure Rights Management service (Azure RMS)](what-is-azure-rms.md) provides the data protection technology for Azure Information Protection. Azure RMS can be used with classification and labeling, or by itself. 

- [Frequently asked questions for Azure Information Protection](faqs.md)

- [FAQs for classification and labeling](faqs-infoprotect.md)

- [FAQs for data protection](faqs-rms.md)

If your question isn't answered, see the links and resources listed in [Information and support for Azure Information Protection](information-support.md).

In addition, there are FAQs designed for end users:

- [FAQ for Azure Information Protection app for iOS and Android](./rms-client/mobile-app-faq.md)

- [FAQ for RMS sharing app for Mac computers](/previous-versions/msdn10/dn451248(v=msdn.10))