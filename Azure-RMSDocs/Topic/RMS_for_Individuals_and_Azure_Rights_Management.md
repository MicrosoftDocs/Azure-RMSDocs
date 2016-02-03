---
title: RMS for Individuals and Azure Rights Management
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 2efcb440-fefd-45e9-872b-f471573aadf2
author: Cabailey
---
# RMS for Individuals and Azure Rights Management
RMS for individuals is a free self-service subscription for users in an organization who have been sent sensitive files that have been protected by Microsoft Azure Rights Management (Azure RMS), but they cannot be authenticated because their IT department does not manage an account for them in Azure. For example, the IT department doesn't have Office 365 or use Azure services.

These users can sign up for a free work or school account to use with Azure RMS, and download and install the Rights Management sharing application. As a result, these users can now authenticate  to prove that they are the person that the protected files were sent to, and then read the protected files on computers or mobile devices.

Using the Rights Management sharing application on Windows computers, these users can also protect files in place or send protected files by email to people inside or outside their organization. If the recipients of the email that they send are in an organization that also doesn't manage user accounts in Azure, they too can sign up for an RMS for individuals account to read the protected email attachment.

> [!IMPORTANT]
> This free subscription ensures that authorized people can always read files that have been protected. Currently, you can also use this free subscription to protect documents and create new protected email messages, but the ability to author new protected content is intended for trial use only and might be removed in the future. For more information and any changes to using RMS for individuals to protect content, see the [Microsoft Rights Management Terms of Service](https://portal.aadrm.com/Legal/Service).

For more information about how you can protect files by using the free Rights Management sharing application, see the [Rights Management sharing application guide for users](http://technet.microsoft.com/library/dn339006.aspx).

RMS for individuals is an example of a self-service signup that is supported by Azure Active Directory. For more information about how this works, see [What is Self-Service Signup for Azure?](https://azure.microsoft.com/documentation/articles/active-directory-self-service-signup/) in the Microsoft Azure documentation. Use the following sections for more information that is  specific to RMS for individuals:

-   [How users sign up for RMS for individuals](../Topic/RMS_for_Individuals_and_Azure_Rights_Management.md#BKMK_SignUp)

    -   [Technical overview](../Topic/RMS_for_Individuals_and_Azure_Rights_Management.md#BKMK_TechnicalOverview)

-   [How administrators can control the accounts created for RMS for individuals](../Topic/RMS_for_Individuals_and_Azure_Rights_Management.md#BKMK_TakeControlofAccounts)

-   [How to find out if your users have signed up for RMS for individuals](#BKMK_Detect)

## <a name="BKMK_SignUp"></a>How users sign up for RMS for individuals
To sign up for this free account, you request it by visiting the [Microsoft Rights Management page](https://portal.aadrm.com/), and provide your work or school email address. The most typical way that you'll be directed to this sign-up page is if you received an email message with a protected attachment, which contains instructions how to sign-up. You'll receive an email in response from Microsoft, and can then complete the sign-up process by entering details to create your account. When you get an email confirmation from Microsoft, this final email message sends you to a page where you can download the sharing application for different devices, and a link to the user guide.

#### To sign up for RMS for individuals

1.  Using a Windows or Mac computer, go to the [Microsoft Rights Management page](https://portal.aadrm.com).

2.  Type in the email address that you use for your organization, such as **janetm@contoso.com** or **p.dover@fabrikam.com**.

    > [!IMPORTANT]
    > Personal email accounts are not supported, so do not enter a Microsoft account (formerly known as a Microsoft Live ID account) or another personal account that you might use at home from your Internet provider.

3.  Click **Get started**.

    Microsoft uses your email address to check whether your organization already has a [paid subscription that includes Azure RMS](https://technet.microsoft.com/library/dn655136.aspx). If that’s the case, you don’t need RMS for individuals so you’ll be signed in immediately and the self-service sign up for RMS for individuals is canceled. If a paid subscription for Azure RMS isn’t found, you'll continue to the next step.

4.  Wait for a confirmation email message to be sent to the address that you supplied. It will be from Microsoft (DoNotReply@microsoft.com) and has the subject **Microsoft RMS**.

5.  When you receive the email, click the link in the instructions to complete the sign up process.

6.  The link takes you a new **Microsoft Rights Management** page for you to supply details for your account. Type in your first name, your last name, enter and confirm a password of your choice, select your country (or the nearest country to yours if your country is not listed)  from the drop down, and then click **Create**.

7.  Wait for another email message from Microsoft that now confirms that your account is ready to use.

8.  When you receive the email, click the link to sign in and read the instructions to download and install the sharing application, or click the Help link to read the sharing application user guide.

Now your account is created, you’re ready to start protecting files and read files that others have protected. When prompted to sign in to protect or read protected files, enter your email address and password that you used to create the account for RMS for the individuals.

### <a name="BKMK_TechnicalOverview"></a>Technical overview
RMS for individuals uses a self-service sign up process that is also used by other services that use Microsoft cloud-based technology to authenticate users.

This is what happens in the background when a user signs up for RMS for individuals and their organization does not have an Office 365 subscription or Azure subscription, and therefore, no directory in Azure to authenticate users:

1.  When the first user from an organization requests a subscription for RMS for individuals, the domain name supplied in their email address is checked to see whether it is already associated with an Azure tenant. If there is no existing tenant, a new tenant and Azure directory is automatically created for the organization, which contains an account for this first user. Unlike with a paid subscription for Azure, this first account is not a global administrator, but a standard user. The new account uses the email address and password that the user supplied.

    > [!NOTE]
    > Some domain names cannot be used to create the directory and therefore cannot be used for RMS for individuals. The list of blocked domain names can be viewed from this JavaScript Object Notation file: [http://portal.aadrm.com/content/blocked_domains.json](http://portal.aadrm.com/content/blocked_domains.json)

    If an existing tenant is found, it is checked to see whether it already has a subscription for Azure RMS. When no subscription is found, the free RMS for individuals subscription can be added.

2.  The organization is granted the RMS for individuals subscription. Now, this user can be authenticated by Azure and can then protect files and read files that others have protected by using Azure Rights Management. To protect and read protected files, the user must have an RMS-enlightened application, such as  the free [Rights Management sharing application](https://technet.microsoft.com/library/dn919648.aspx).

3.  When the second user from the same organization requests an RMS for individuals subscription, a new user account is added to the previously created Azure directory, by using the organization’s RMS for individuals subscription. This second user can do everything that the first user could do (protect files and read protected files), but in addition, these two users can now more easily collaborate securely because they can quickly apply default templates to files that restrict access to accounts in their organization’s Azure directory.

4.  Subsequent users from the same organization follow the same pattern, adding user accounts (when new users sign up) to the organization’s Azure directory. The more accounts that are added to the directory, the more users can securely collaborate with co-workers and partners, and more easily prevent unauthorized people from reading their files when they should not have access to them.

Throughout this process, there is no charge to the organization and no work required from the IT department. However, the IT department could choose to do either of the following:

-   **Manage the accounts and sign-up process**: IT administrators can take ownership of the automatically created directory and accounts in Azure. They can then manage the accounts by implementing directory integration solutions such as password synchronization and single sign-on. Or, they can prevent users from creating accounts or signing up for RMS for individuals.

    For more information, see the following section, [How administrators can control the accounts created for RMS for individuals](../Topic/RMS_for_Individuals_and_Azure_Rights_Management.md#BKMK_TakeControlofAccounts).

-   **Manage Rights Management**: IT administrators can convert the RMS for individuals subscription for the organization to a paid subscription that includes Azure Rights Management. When they do this, the existing Azure directory and accounts are preserved for a seamless transition for existing users who were using RMS for individuals. Any files that users protected previously will still be protected with the same policies and the people that they granted permissions to use the files will still be able to use the files in the same way.

    When you take this course of action, your organization benefits by being able to integrate Rights Management into its workflows, services, and data stores. In addition, you can now manage Rights Management because you have control over your organization’s tenant key for Azure Rights Management. You can now do the following:

    -   Configure Exchange and SharePoint to support Azure Rights Management, even if these are running on-premises. Exchange and SharePoint are natively supported for the online services, and they are supported by a connector for the on-premises servers. For more information, see the following:

        -   The Exchange Online and SharePoint Online sections from [Office 365: Configuration for clients and online services](../Topic/Configuring_Applications_for_Azure_Rights_Management.md#BKMK_O365) in the [Configuring Applications for Azure Rights Management](../Topic/Configuring_Applications_for_Azure_Rights_Management.md) topic

        -   [Deploying the Azure Rights Management Connector](../Topic/Deploying_the_Azure_Rights_Management_Connector.md)

    -   Perform e-discovery on company-owned data so that you can, if required, decrypt files that were protected by using Rights Management. For more information, see [Configuring Super Users for Azure Rights Management and Discovery Services or Data Recovery](../Topic/Configuring_Super_Users_for_Azure_Rights_Management_and_Discovery_Services_or_Data_Recovery.md).

    -   Log all activity for Rights Management as used in your organization. This is very powerful because not only can you monitor which files are being protected and who is successfully accessing those protected files, but you can also identify potentially suspicious behavior from unauthorized people who are trying to access protected files. For more information, see [Logging and Analyzing Azure Rights Management Usage](../Topic/Logging_and_Analyzing_Azure_Rights_Management_Usage.md).

    -   Provide users with the ability to track and revoke their protected documents, if these features are supported by your [Azure RMS subscription](https://technet.microsoft.com/dn858608). For more information, see  [Track and revoke your files](https://technet.microsoft.com/library/dn986611.aspx) from the [RMS sharing application user guide](https://technet.microsoft.com/library/dn339006.aspx).

    -   Implement a bring your own key solution (BYOK) so that your tenant key for Azure Rights Management is generated on-premises according to your IT policies, and securely transferred to Microsoft by using a Hardware Security Module (HSM). For more information, see [Planning and Implementing Your Azure Rights Management Tenant Key](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md).

## <a name="BKMK_TakeControlofAccounts"></a>How administrators can control the accounts created for RMS for individuals
If you do not want to convert your organization’s RMS for individuals subscription to a paid subscription, you can still control the user accounts in the Azure directory that was created for your organization in the following ways:

-   Implement directory integration solutions for Azure Active Directory and your Active Directory Domain Services infrastructure. You can synchronize accounts and passwords so that users will not have to create new accounts to use Rights Management and your on-premises password policies will apply to the new Azure user accounts. You can also synchronize passwords so that users do not have to remember a different password to use Rights Management.

-   You could prevent users from signing up to use Azure Rights Management with the RMS for individuals subscription. In most cases, there is little advantage in doing this because users will either share files without protection (which could put your company at risk), or will use another file protection mechanism that doesn’t provide the IT department with the option to access the data. However, if you want to prevent users from signing up to use RMS for individuals, do one of the following after you have taken ownership of your organization’s directory in Azure:

    -   Prevent all users from signing up for self-service subscriptions, which includes RMS for individuals.  Currently, you cannot set this by service; the setting applies to all Azure subscriptions that use the self-service process. To do this, set the **AllowAdHocSubscriptions** parameter to false with the [Set-MsolCompanySettings](http://technet.microsoft.com/library/dn194127.aspx) cmdlet from the Windows PowerShell module for Azure Active Directory. For example: **Set-MsolCompanySettings -AllowAdHocSubscriptions $false**

    -   Prevent users from creating a new account in Azure, which means that only users who already have an account in Azure can sign up for self-service subscriptions, which includes RMS for individuals.  To do this, set the **AllowEmailVerifiedUsers** parameter to false with the [Set-MsolCompanySettings](http://technet.microsoft.com/library/dn194127.aspx) cmdlet from the Windows PowerShell module for Azure Active Directory. For example: **Set-MsolCompanySettings -AllowEmailVerifiedUsers $false -AllowAdHocSubscriptions $true**

    -   Synchronize your Active Directory Domain Services infrastructure with Azure Active Directory. This action prevents new accounts from being created when users sign up for self-service subscriptions such as RMS for individuals, and you can delete or disable accounts that were previously created in the Azure directory.

To control the user accounts in the Azure directory, or to prevent users from signing up for RMS for individuals, you must have an Azure subscription and own the directory. If you don't already have an Azure subscription, you can obtain one without charge. If a directory was automatically created for you during the self-service process, take ownership of the domain that was used to create it. If you already own a directory in Azure but users specified a new domain that you use in your organization, merge that domain into your existing directory. For more information, see the instructions in [What is Self-Service Signup for Azure?](https://azure.microsoft.com/documentation/articles/active-directory-self-service-signup/)

## <a name="BKMK_Detect"></a>How to find out if your users have signed up for RMS for individuals
As an administrator, how do you know if your users have signed up for RMS for individuals? You might use any or a combination of the following methods:

-   Ask users how they protect highly confidential files, especially when collaborating with others outside the organization.

-   When you have an Azure subscription for your organization, use the [Get-MsolAccountSku](https://msdn.microsoft.com/library/azure/dn194118.aspx) cmdlet to see if **RIGHTSMANAGEMENT_ADHOC** is returned as one of the subscriptions. If it is, this is the RMS for individuals subscription that was granted to the organization, with a pool of active units available for users to use the self-service sign-up process.

-   Use a system management solution, such as System Center Configuration Manager, to inventory software installed and software in use. The Rights Management sharing application runs by using the **ipviewer.exe** program and you can [download and install the application](http://go.microsoft.com/fwlink/?LinkId=303970) for free to identify other characteristics about this application that you then use for software inventory.

-   Be on the lookout for file name extensions that are created by the Rights Management sharing application. The .pfile and .ppdf file name extensions are the most obvious examples, but there are other files that change their file name extension when they are natively protected by Rights Management. For more information, see the [Supported file types and file name extensions](http://technet.microsoft.com/library/dn339003.aspx) section in the [Rights Management sharing application administrator guide](http://technet.microsoft.com/library/dn339003.aspx).

## See Also
[Getting Started with Azure Rights Management](../Topic/Getting_Started_with_Azure_Rights_Management.md)

