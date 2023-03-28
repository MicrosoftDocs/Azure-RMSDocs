---
# required metadata

title: RMS for individuals and Azure Information Protection
description: Information about RMS for individuals, a free self-service subscription for users who have been sent protected files, but these users cannot be authenticated because their IT department does not manage an account for them in Azure. 
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 11/08/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 2efcb440-fefd-45e9-872b-f471573aadf2

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# RMS for individuals and Azure Information Protection



RMS for individuals is a free self-service subscription for users who need to open files that have been protected by Azure Information Protection. If these users cannot be authenticated by Azure Active Directory, this free sign-up service can create an account in Azure Active Directory for a user. As a result, these users can now authenticate by using their company email address and then read the protected files on computers or mobile devices.

RMS for individuals uses Azure Active Directory self-service signup. If users have created accounts for your organization by using this subscription, as an administrator for your organization, you can claim ownership and [take control of their accounts](/azure/active-directory/users-groups-roles/domains-admin-takeover#external-admin-takeover). 

To sign up for this free account, users go to the [Microsoft Azure Information Protection page](https://aka.ms/rms-signup), and provide their work email address. They receive an email in response from Microsoft, and they can then complete the sign-up process by entering details to create their account. 

When the account is created, the final page displays links to download the Azure Information Protection client or viewer for different devices, a link to the user guide, and a link for a current list of applications that natively support Rights Management protection. 

### Alternatives: Use Office 365 Message Encryption or Microsoft accounts

RMS for individuals is one option to help ensure that authorized people outside your organization can always read files that your organization protects. 

Alternative options include:

- **Email documents by using [Office 365 Message Encryption with new capabilities](https://support.office.com/article/7ff0c040-b25c-4378-9904-b1b50210d00e).** This email solution works for all email addresses on all devices and is the recommended way to safely share information and view Office documents in a browser with people outside your organization.
 
- **Use Microsoft accounts.** Not all applications can open protected content when a Microsoft account is used for authentication. [More information](/previous-versions/azure/information-protection/secure-collaboration-documents#supported-scenarios-for-opening-protected-documents) 


## To sign up for RMS for individuals

1. Using a Windows or Mac computer, or a mobile device, go to the [Microsoft Azure Information Protection page](https://aka.ms/rms-signup).

2. Type the email address that was used to protect the document you need to open.

3. Click **Sign up**.

    Microsoft uses your email address to check whether your organization already has a [subscription for Azure Information Protection Premium](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection) or an [Office 365 subscription that includes data protection by using Azure Information Protection](https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RE4Dz8M). If either of these subscriptions are found, you don’t need RMS for individuals. You are signed in immediately and the self-service sign up for RMS for individuals is canceled. If one of these subscriptions isn't found, you continue to the next step.

4. Wait for a confirmation email message to be sent to the address that you supplied. It will be from the Microsoft 365 Team (support@email.microsoftonline.com) and has the subject **Finish signing up for Microsoft Azure Information Protection**.

5. When you receive the email, click **Yes, that's me** to verify your email address and complete the sign-up process.

6. You now see a **One last thing ...** page for you to supply details for your account. Type in your first name, your last name, enter and confirm a password of your choice, and then click **Start**.

7. When your account is created, you see a new Microsoft Azure Information Protection page where you can download and install the Azure Information Protection client, or click the [User guide](/previous-versions/azure/information-protection/rms-client/client-user-guide) link for how-to instructions for Windows computers.

Now your account is created, if you're prompted to sign in to read protected files, enter the same email address and password that you used to create the account for RMS for the individuals.

> [!IMPORTANT]
> Although you can now also protect files with this account, do not do so until your organization has a [trial or paid subscription](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection/) for Azure Information Protection. If you protect files and emails by using this free subscription and then your organization takes control of your account, previously protected content might become inaccessible.


## Next steps
RMS for individuals is an example of using the self-service signup feature that is supported by Azure Active Directory. For more information about how this feature works, see [What is Self-Service Signup for Azure Active Directory?](/azure/active-directory/users-groups-roles/directory-self-service-signup) in the Azure Active Directory documentation.