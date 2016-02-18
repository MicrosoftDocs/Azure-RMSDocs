---
title: Azure RMS Requirements: Cloud Subscriptions
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: EMS
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: TBD
author: Cabailey
---

# <a name="BKMK_SupportedSubscriptions"></a>Cloud subscriptions that support Azure RMS
To use Azure Rights Management (Azure RMS), your organization must have at least one of the following subscriptions with a sufficient number of licenses for users and services that will protect files and email messages. If you have a service that will apply protection for users (owners of the files or email messages), those users require one of these licenses. Users who will only consume (for example, read and edit) this protected data do not need a license.

-   Office 365

-   Azure Rights Management Premium (formerly Azure RMS Standalone)

-   Enterprise Mobility Suite

-   RMS for individuals

Use the following sections for more information and sign up options.

For a licensing comparison of the Azure RMS capabilities for the paid subscriptions, see [Comparison of Rights Management Services (RMS) Offerings](http://technet.microsoft.com/dn858608).

Have additional questions about licensing for Azure RMS? Download the **Licensing FAQ for Azure Rights Management** from the [Azure Rights Management Purchasing](https://www.microsoft.com/en-us/server-cloud/products/azure-rights-management/Purchasing.aspx) page. 

## Office 365 subscription
[Free 30-day trial: Enterprise E3](http://go.microsoft.com/fwlink/p/?LinkID=403802)

This subscription is designed for organizations who want to use the Office online services and use their Information Rights Management feature, which uses Azure RMS. However, not all Office 365 subscriptions include Azure RMS.

|Licensing option|Office 365 Business Essentials|Office 365 Business Premium|Office 365 Enterprise E1<br /><br />Office 365 Education A1|Office 365 Enterprise E3<br /><br />Office 365 Education A3<br /><br />Office 365 Government G3|Office 365 Enterprise E4<br /><br />Office 365 Education A4<br /><br />Office 365 Government G4|Office 365 Enterprise E5<br /><br />Office 365 Education A5<br /><br />Office 365 Government G5|Office 365 Enterprise K1|SharePoint Plan 1<br />SharePoint Plan 2|Exchange Online Plan 1<br />Exchange Online Plan 2|
|--------------------|----------------------------------|-------------------------------|-------------------------------------------------------|-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|----------------------------|----------------------------------------|--------------------------------------------------|
|Information Rights Protection (IRM)|No|No|No|Yes|Yes|Yes|No|No|No|

## Azure Rights Management Premium subscription
[Free 30-day trial](https://portal.microsoftonline.com/Signup/MainSignUp15.aspx?&amp;OfferId=A43415D3-404C-4df3-B31B-AAD28118A778&amp;dl=RIGHTSMANAGEMENT&amp;ali=1)

This subscription was formerly known as Azure RMS Standalone and it is designed for organizations that want to use Azure RMS but don’t have subscription that includes Azure RMS. For example, if you have a subscription for Office 365 Business Essentials or Office 365 Enterprise E1, these subscriptions do not include Azure RMS (see the table in the preceding section). To use Azure RMS, you could purchase a subscription for Azure Rights Management Premium (or purchase another subscription, such as Office 365 Enterprise E4, that includes Azure RMS).

For more information, see [Microsoft Azure Rights Management](http://products.office.com/business/microsoft-azure-rights-management).

This subscription also offers a trial period for you to try out Azure RMS for 25 users, at no charge. If the subscription expires before you purchase a replacement subscription, see the following section, “What happens when the trial subscription expires?”

|Licensing option|Office 365 Business Essentials|Office 365 Business Premium|Office 365 Enterprise E1<br /><br />Office 365 Education A1|Office 365 Enterprise E3<br /><br />Office 365 Education A3<br /><br />Office 365 Government G3|Office 365 Enterprise E4<br /><br />Office 365 Education A4<br /><br />Office 365 Government G4|Office 365 Enterprise E5<br /><br />Office 365 Education A5<br /><br />Office 365 Government G5|Office 365 Enterprise K1|SharePoint Plan 1<br />SharePoint Plan 2|Exchange Online Plan 1<br />Exchange Online Plan 2|
|--------------------|----------------------------------|-------------------------------|-------------------------------------------------------|-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|----------------------------|----------------------------------------|--------------------------------------------------|
|Information Rights Protection (IRM)|Yes|Yes [footnote 1]|Yes|Yes|Yes|Yes|Yes|Yes|Yes|
Footnote 1:  For Business Premium, there are some client restrictions: You can protect content and consume protected content with RMS by using the Outlook Web App and the RMS sharing app. You can consume protected content by using all other Office applications, which includes Office Online and the client applications for Office 365 Business Premium.

### <a name="BKMK_TrialExpiryBehavior"></a>What happens when the trial subscription expires?
If your trial subscription expires, you will lose access to content that was protected by using your trial subscription for Azure RMS. However, if you then purchase a subscription that supports Azure RMS, access is automatically restored.

An exception to losing access upon expiry is if your organization used Azure RMS with the RMS for individuals subscription before you obtained the trial subscription. Then, access to previously protected content remains, even after the trial subscription expires.

## Enterprise Mobility Suite subscription
[Free 30-day trial](http://go.microsoft.com/fwlink/?LinkId=615385)

This subscription is designed for organizations who want to use a combination of Azure Active Directory Premium, Windows Intune, and Azure Rights Management. For more information, see the [Microsoft Enterprise Mobility Overview](http://go.microsoft.com/fwlink/?LinkId=615386).

|Licensing option|Office 365 Business Essentials|Office 365 Business Premium|Office 365 Enterprise E1<br /><br />Office 365 Education A1|Office 365 Enterprise E3<br /><br />Office 365 Education A3<br /><br />Office 365 Government G3|Office 365 Enterprise E4<br /><br />Office 365 Education A4<br /><br />Office 365 Government G4|Office 365 Enterprise E5<br /><br />Office 365 Education A5<br /><br />Office 365 Government G5|Office 365 Enterprise K1|SharePoint Plan 1<br />SharePoint Plan 2|Exchange Online Plan 1<br />Exchange Online Plan 2|
|--------------------|----------------------------------|-------------------------------|-------------------------------------------------------|-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|----------------------------|----------------------------------------|--------------------------------------------------|
|Information Rights Protection (IRM)|Yes|Yes [footnote 1]|Yes|Yes|Yes|Yes|Yes|Yes|Yes|
Footnote 1:  For Business Premium, there are some client restrictions: You can protect content and consume protected content with RMS by using the Outlook Web App and the RMS sharing app. You can consume protected content by using all other Office applications, which includes Office Online and the client applications for Office 365 Business Premium.

## RMS for individuals subscription
This subscription is designed for individuals in an organization that hasn’t deployed Azure RMS or AD RMS. It lets these people read content that has been protected by an organization that is using Azure RMS, and they can also protect their own content.

For more information, see [RMS for Individuals and Azure Rights Management](rms-for-individuals-and-azure-rights-management.md).

## Next steps
To check for other requirements, see [Requirements for Azure Rights Management](requirements-for-azure-rights-management.md).