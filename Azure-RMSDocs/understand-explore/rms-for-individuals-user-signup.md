---
# required metadata

title: How users sign up for RMS for individuals | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: a60731bd-f78d-4f00-bb3e-354637b312ab

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# How users sign up for RMS for individuals
To sign up for this free account, users request it by visiting the [Microsoft Rights Management page](https://portal.aadrm.com/), and provide their work or school email address. 

The most typical way that users will be directed to this sign-up page is if they received an email message with a protected attachment, which contains instructions how to sign-up. They receive an email in response from Microsoft, and can then complete the sign-up process by entering details to create their account. When they get an email confirmation from Microsoft, this final email message sends them to a page where they can download the sharing application for different devices, and a link to the user guide.

## To sign up for RMS for individuals

1.  Using a Windows or Mac computer, go to the [Microsoft Rights Management page](https://portal.aadrm.com).

2.  Type in the email address that you use for your organization, such as **janetm@contoso.com** or **p.dover@fabrikam.com**.

    > [!IMPORTANT]
    > Personal email accounts are not supported, so do not enter a Microsoft account (formerly known as a Microsoft Live ID account) or another personal account that you might use at home from your Internet provider.

3.  Click **Get started**.

    Microsoft uses your email address to check whether your organization already has a [paid subscription that includes Azure RMS](../get-started/rms-requirements-cloud-subscriptions.md). If that’s the case, you don’t need RMS for individuals so you’ll be signed in immediately and the self-service sign up for RMS for individuals is canceled. If a paid subscription for Azure RMS isn’t found, you'll continue to the next step.

4.  Wait for a confirmation email message to be sent to the address that you supplied. It will be from Microsoft (DoNotReply@microsoft.com) and has the subject **Microsoft RMS**.

5.  When you receive the email, click the link in the instructions to complete the sign up process.

6.  The link takes you a new **Microsoft Rights Management** page for you to supply details for your account. Type in your first name, your last name, enter and confirm a password of your choice, select your country (or the nearest country to yours if your country is not listed)  from the drop down, and then click **Create**.

7.  Wait for another email message from Microsoft that now confirms that your account is ready to use.

8.  When you receive the email, click the link to sign in and read the instructions to download and install the sharing application, or click the Help link to read the sharing application user guide.

Now your account is created, you’re ready to start protecting files and read files that others have protected. When prompted to sign in to protect or read protected files, enter your email address and password that you used to create the account for RMS for the individuals.

## Technical overview of the sign-up process
RMS for individuals uses a self-service sign up process that is also used by other services that use Microsoft cloud-based technology to authenticate users.

This is what happens in the background when a user signs up for RMS for individuals and their organization does not have an Office 365 subscription or Azure subscription, and therefore, no directory in Azure to authenticate users:

1.  When the first user from an organization requests a subscription for RMS for individuals, the domain name supplied in their email address is checked to see whether it is already associated with an Azure tenant. If there is no existing tenant, a new tenant and Azure directory is automatically created for the organization, which contains an account for this first user. Unlike with a paid subscription for Azure, this first account is not a global administrator, but a standard user. The new account uses the email address and password that the user supplied.

    > [!NOTE]
    > Some domain names cannot be used to create the directory and therefore cannot be used for RMS for individuals. The list of blocked domain names can be viewed from this JavaScript Object Notation file: [http://portal.aadrm.com/content/blocked_domains.json](http://portal.aadrm.com/content/blocked_domains.json)

    If an existing tenant is found, it is checked to see whether it already has a subscription for Azure RMS. When no subscription is found, the free RMS for individuals subscription can be added.

2.  The organization is granted the RMS for individuals subscription. Now, this user can be authenticated by Azure and can then protect files and read files that others have protected by using Azure Rights Management. To protect and read protected files, the user must have an RMS-enlightened application, such as  the free [Rights Management sharing application](../rms-client/rights-management-sharing-application-for-windows.md).

3.  When the second user from the same organization requests an RMS for individuals subscription, a new user account is added to the previously created Azure directory, by using the organization’s RMS for individuals subscription. This second user can do everything that the first user could do (protect files and read protected files), but in addition, these two users can now more easily collaborate securely because they can quickly apply default templates to files that restrict access to accounts in their organization’s Azure directory.

4.  Subsequent users from the same organization follow the same pattern, adding user accounts (when new users sign up) to the organization’s Azure directory. The more accounts that are added to the directory, the more users can securely collaborate with co-workers and partners, and more easily prevent unauthorized people from reading their files when they should not have access to them.

Throughout this process, there is no charge to the organization and no work required from the IT department. However, the IT department could choose to do either of the following:

-   **Manage the accounts and sign-up process**: IT administrators can take ownership of the automatically created directory and accounts in Azure. They can then manage the accounts by implementing directory integration solutions such as password synchronization and single sign-on. Or, they can prevent users from creating accounts or signing up for RMS for individuals.

    For more information, see [How administrators can control the accounts created for RMS for individuals](rms-for-individuals-admins-take-control).

-   **Manage Rights Management**: IT administrators can convert the RMS for individuals subscription for the organization to a paid subscription that includes Azure Rights Management. When they do this, the existing Azure directory and accounts are preserved for a seamless transition for existing users who were using RMS for individuals. Any files that users protected previously will still be protected with the same policies and the people that they granted permissions to use the files will still be able to use the files in the same way.

    When you take this course of action, your organization benefits by being able to integrate Rights Management into its workflows, services, and data stores. In addition, you can now manage Rights Management because you have control over your organization’s tenant key for Azure Rights Management. You can now do the following:

    -   Configure Exchange and SharePoint to support Azure Rights Management, even if these are running on-premises. Exchange and SharePoint are natively supported for the online services, and they are supported by a connector for the on-premises servers. For more information, see the following:

        -   The Exchange Online and SharePoint Online sections from [Office 365: Configuration for clients and online services](../deploy-use/o365-configure-for-clients-online-services.md)

        -   [Deploying the Azure Rights Management connector](../deploy-use/deploying-the-azure-rights-management-connector.md)

    -   Perform e-discovery on company-owned data so that you can, if required, decrypt files that were protected by using Rights Management. For more information, see [Configuring super users for Azure Rights Management and discovery services or data eecovery](../deploy-use/configuring-super-users-for-azure-rights-management-and-discovery-services-or-data-recovery.md).

    -   Log all activity for Rights Management as used in your organization. This is very powerful because not only can you monitor which files are being protected and who is successfully accessing those protected files, but you can also identify potentially suspicious behavior from unauthorized people who are trying to access protected files. For more information, see [Logging and analyzing Azure Rights Management usage](../deploy-use/logging-and-analyzing-azure-rights-management-usage.md).

    -   Provide users with the ability to track and revoke their protected documents, if these features are supported by your [Azure RMS subscription](https://technet.microsoft.com/dn858608). For more information, see [Track and revoke your files](../rms-client/track-and-revoke-your-documents-when-you-use-the-rms-sharing-application.md) from the [RMS sharing application user guide](../rms-client/rights-management-sharing-application-user-guide.md).

    -   Implement a bring your own key solution (BYOK) so that your tenant key for Azure Rights Management is generated on-premises according to your IT policies, and securely transferred to Microsoft by using a Hardware Security Module (HSM). For more information, see [Planning and implementing your Azure Rights Management tenant key](../plan-design/planning-and-implementing-your-azure-rights-management-tenant-key.md).


## Next steps
See [How administrators can control the accounts created for RMS for individuals](rms-for-individuals-admins-take-control.md).


