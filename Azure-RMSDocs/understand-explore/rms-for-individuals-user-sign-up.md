---
# required metadata

title: How users sign up for RMS for individuals - AIP
description: Sign up instructions for this free account, and technical information how this process works. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 08/24/2017
ms.topic: article
ms.prod:
ms.service: information-protection
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

>*Applies to: Azure Information Protection*

To sign up for this free account, you request it by visiting the [Microsoft Azure Information Protection page](https://aka.ms/rms-signup), and provide your work email address. The most typical way that you are directed to this sign-up page is if you receive an email message with a protected attachment. The email message contains instructions how to sign up. 

When you follow these instructions, you receive an email in response from Microsoft, and you then complete the sign-up process by entering details to create your account. When this completes, the final page displays links to download the Azure Information Protection client or viewer for different devices, a link to the user guide, and a link for a current list of applications that natively support Rights Management protection. 

## To sign up for RMS for individuals

1.  Using a Windows or Mac computer, or a mobile device, go to the [Microsoft Azure Information Protection page](https://aka.ms/rms-signup).

2.  Type in the email address that you use for your organization, such as **janetm@contoso.com** or **p.dover@fabrikam.com**.

    > [!IMPORTANT]
    > Personal email accounts are not supported, so do not enter a Microsoft account (formerly known as a Microsoft Live ID account) or another personal account that you might use at home from your Internet provider.

3. Click **Sign up**.

    Microsoft uses your email address to check whether your organization already has a [paid subscription for Azure Information Protection](https://www.microsoft.com/cloud-platform/azure-information-protection-pricing) or an [Office 365 subscription that includes data protection by using Azure Rights Management](http://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf). If that's the case, you don’t need RMS for individuals so you are signed in immediately and the self-service sign up for RMS for individuals is canceled. If a paid subscription isn't found, you'll continue to the next step.

4. Wait for a confirmation email message to be sent to the address that you supplied. It will be from the Office 365 Team (support@email.microsoftonline.com) and has the subject **Finish signing up for Microsoft Azure Information Protection**.

5. When you receive the email, click **Yes, that's me** to verify your email address and complete the sign-up process.

6. You now see a **One last thing ...** page for you to supply details for your account. Type in your first name, your last name, enter and confirm a password of your choice, and then click **Start**.

7. When your account is created, you see a new Microsoft Azure Information Protection page where you can download and install the Azure Information Protection client, or click the [User guide](../rms-client/client-user-guide.md) link for how-to instructions for Windows computers.

Now your account is created, you’re ready to start protecting files and read files that others have protected. If you're prompted to sign in to protect or read protected files, enter the same email address and password that you used to create the account for RMS for the individuals.

## Technical overview of the sign-up process
RMS for individuals uses a self-service sign-up process that is also used by other services that use Microsoft cloud-based technology to authenticate users.

This is what happens in the background when a user signs up for RMS for individuals and their organization does not have an Office 365 subscription or Azure subscription, and therefore, no directory in Azure to authenticate users:

1. When the first user from an organization requests a subscription for RMS for individuals, the domain name supplied in their email address is checked to see whether it is already associated with an Azure tenant. If there is no existing tenant, a new tenant and Azure directory is automatically created for the organization, which contains an account for this first user. Unlike with a paid subscription for Azure, this first account is not a global administrator, but a standard user. The new account uses the email address and password that the user supplied.

    > [!NOTE]
    > Some domain names cannot be used to create the directory and therefore cannot be used for RMS for individuals.

    If an existing tenant is found, it is checked to see whether it already has a subscription for Azure RMS. When no subscription is found, the free RMS for individuals subscription can be added.

2. The organization is granted the RMS for individuals subscription. Now, this user can be authenticated by Azure and can then protect files and read files that others have protected by using Azure Rights Management. To protect and read protected files, the user must have an RMS-enlightened application, such as the free [Azure Information Protection client](../rms-client/aip-client.md).

3.  When the second user from the same organization requests an RMS for individuals subscription, a new user account is added to the previously created Azure directory, by using the organization’s RMS for individuals subscription. This second user can do everything that the first user could do (protect files and read protected files), but in addition, these two users can now more easily collaborate securely because they can quickly apply default templates to files that restrict access to accounts in their organization’s Azure directory.

4. Subsequent users from the same organization follow the same pattern, adding user accounts (when new users sign up) to the organization’s Azure directory. The more accounts that are added to the directory, the more users can securely collaborate with co-workers and partners, and more easily prevent unauthorized people from reading their files when they should not have access to them.

Throughout this process, there is no charge to the organization and no work required from the IT department. However, the IT department could choose to do either of the following actions:

- **Manage the accounts and sign-up process**: IT administrators can take ownership of the automatically created directory and accounts in Azure. They can then manage the accounts by implementing directory integration solutions such as password synchronization and single sign-on. Or, they can prevent users from creating accounts or signing up for RMS for individuals.
    
    For more information, see [How administrators can control the accounts created for RMS for individuals](rms-for-individuals-take-control.md).

- **Manage Rights Management**: IT administrators can convert the RMS for individuals subscription for the organization to a paid subscription that includes Azure Rights Management. When they do this, the existing Azure directory and accounts are preserved for a seamless transition for existing users who were using RMS for individuals. Any files that users protected previously are still protected with the same policies, and the people that they granted permissions to use the files are still be able to use the files in the same way.
    
    When you take this course of action, your organization benefits by being able to integrate Rights Management into its workflows, services, and data stores. In addition, you can now manage Rights Management because you have control over your organization’s tenant key for Azure Rights Management. You can now do the following actions:
    
    - Configure Exchange and SharePoint to support Azure Rights Management, even if these are running on-premises. Exchange and SharePoint are natively supported for the online services, and they are supported by a connector for the on-premises servers. For more information, see the following:
    
        - The Exchange Online and SharePoint Online sections from [Office 365: Configuration for clients and online services](../deploy-use/configure-office365.md)
        
        - [Deploying the Azure Rights Management connector](../deploy-use/deploy-rms-connector.md)
        
    - Perform ediscovery on company-owned data so that you can, if required, decrypt files that were protected by using Rights Management. For more information, see [Configuring super users for Azure Rights Management and discovery services or data recovery](../deploy-use/configure-super-users.md).
    
    - Log all activity for Rights Management as used in your organization. This is very powerful because not only can you monitor which files are being protected and who is successfully accessing those protected files, but you can also identify potentially suspicious behavior from unauthorized people who are trying to access protected files. For more information, see [Logging and analyzing usage of the Azure Rights Management service](../deploy-use/log-analyze-usage.md).
    
    - Provide users with the ability to track and revoke their protected documents, if these features are supported by your [subscription](https://www.microsoft.com/cloud-platform/azure-information-protection-features). For more information, see [Track and revoke your documents](../rms-client/client-track-revoke.md) from the [Azure Information Protection user guide](../rms-client/client-user-guide.md).
    
    - Implement a bring your own key solution (BYOK) so that your tenant key for Azure Rights Management is generated on-premises according to your IT policies, and securely transferred to Microsoft by using a hardware security module (HSM). For more information, see [Planning and implementing your Azure Information Protection tenant key](../plan-design/plan-implement-tenant-key.md).


## Next steps
See [How administrators can control the accounts created for RMS for individuals](rms-for-individuals-take-control.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]