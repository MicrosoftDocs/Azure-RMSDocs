---
# required metadata

title: Secure document collaboration using Azure Information Protection
description: End-to-end workflow for collaborating on documents that are protected by Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 05/04/2018
ms.topic: get-started-article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 4895c429-959f-47c7-9007-b8f032f6df6f

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Secure document collaboration by using Azure Information Protection

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](http://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

When you use Azure Information Protection, you can protect your documents without sacrificing collaboration for authorized users. These users might be internal to your organization, external users in another organization, or users with a personal email address.

The majority of documents that users need to collaborate on will be Office documents from Word, Excel, and PowerPoint. These documents support native protection, which means that in addition to the protection features of authorization and encryption, they also support restricted permission for more fine-grained control. 

These permissions are called usage rights, and include permissions such as view, edit, print. You can define individual usage rights when a document is protected, or you can define a grouping of usage rights, called permission levels. Permission levels make it easier to select usage rights that are typically used together, for example, Reviewer and Co-Author. For more information about usage rights and permission levels, see [Configuring usage rights for Azure Rights Management](../deploy-use/configure-usage-rights.md).

When you configure these permissions, you also specify which users they are for:

- **For users in your own organization or another organization that uses Azure Active Directory**: You can specify Azure AD user accounts, Azure AD groups, or all users in that organization. 

- **For users who do not have an Azure Active Directory account**: Specify a personal email address that will be used with a Microsoft account. This account can already exist, or the users can create it at the time they open the protected content. 
    
    Note that unlike sending protected emails with the new capabilities from Office 365 Message Encryption, for protected documents, you cannot use social identities such as a Gmail account or Hotmail account. However, you can use a Microsoft account that uses a social account for the email address. To open documents with a Microsoft account, users must use Office 2016 Click-to-Run. Other Office editions and versions do not yet support opening Office protected documents with a Microsoft account.

As an administrator, you can configure an Azure Information Protection label to apply the permissions and authorized users. This configuration makes it very easy for users and other administrators to apply the correct protection settings, because they simply apply the label without having to specify any details. The following section provides an example walkthrough for this configuration.

However, there are other ways to apply the same protection settings, which include users specifying the users and permissions, and using PowerShell to create or modify protection templates that can then be applied by other services, such as DLP solutions. 

## Example configuration for a label to apply protection to support internal and external collaboration

This example walks through configuring an existing label to apply protection so that a group of users from your organization can collaborate on documents with all users from another organization that has Office 365 or Azure AD, a group from a different organization that has Office 365 or Azure AD, and a user who doesn't have an account in Azure AD and instead will use their Gmail email address. 

1. Select your label, and on the **Protection** blade, make sure that **Azure (cloud key)** is selected.
    
2. Make sure **Set permissions** is selected, and select **Add permissions**.

3. On the **Add permissions** blade: 
    
    - For your internal group: Select **Browse directory** to select the group, which must be email-enabled.
    
    - For all users in the first organization: Select **Enter details** and type the name of a domain in the organization's tenant. For example, fabrikam.com.
    
    - For the group in the second organization: Still on the **Enter details** tab, type the email address of the group in the organization's tenant. For example, sales@contoso.com.
    
    - For the user who wants to use their personal email address: Still on the **Enter details** tab, type the email address. For example, azureaip505@gmail.com. 

4. To grant the same permissions to all these users for **Choose permissions from preset**, select **Co-Owner**, **Co-Author**, **Reviewer**, or **Custom** to select the permissions that you want to grant.

5. Click **OK** on the **Add permissions** blade.

6. On the **Protection** blade, click **OK**. 

## Applying the label that supports secured collaboration

Now that this label is configured, it can be applied to documents in a number of ways that include the following:

- A user manually selects the label when the document is created in their Office application: Users select the label from the **Protect** button on the Office ribbon, or from the Azure Information Protection bar. 

- Users are prompted to select a label when a new document is saved: You have configured the Azure Information Protection [policy setting](../deploy-use/configure-policy-settings.md) **All documents and emails must have a label**.

- An administrator applies the label to the document by using PowerShell: Use the [Set-AIPFile​Label](/powershell/module/azureinformationprotection/set-aipfilelabel) cmdlet to apply the label to a specific document or all documents in a folder.

- You have additionally configured the label to apply automatic classification that can now be applied by using the Azure Information Protection scanner, or PowerShell: See [How to configure conditions for automatic and recommended classification for Azure Information Protection](../deploy-use/configure-policy-classification.md).

Now that the document is protected, use your normal sharing mechanisms so that the users that you have specified can collaborate on it. Other users will not be able to open it.   

## Opening and editing the protected document

When one of the users that you authorized tries to open the document for editing, one of the following flows happens. Then the document opens with an information banner that informs them that permissions are restricted.

**For your internal group**: Users are authenticated by your Azure AD. Group membership for the account is checked and when the user is confirmed to be a member of the group, they are authorized to open the document with the permissions that you specified. 

**For all users in the first organization**: The domain name is used to identify which Azure AD tenant owns that domain. When the tenant is identified, all users from that tenant are authorized to open the document with the permissions that you specified.
    
**For the group in the second organization**: Users are authenticated by their Azure AD tenant. Group membership for the account is checked and when the user is confirmed to be a member of the group, they are authorized to open the document with the permissions that you specified.
    
**For the user who wants to use their personal email address**: If the user is not already signed in with a Microsoft account that uses the same personal email address, they are prompted to specify the password for that email address:

- If they already have a Microsoft account that uses the same email address, they enter the password and they are then authenticated and authorized to open the document with the permissions that you specified.

- If they do not have a Microsoft account that uses the same email address, specifying the password for their personal email address will not work. Instead, they can click the link to create a Microsoft account: 
    
    When the Microsoft account is created, the user can then open the document by specifying the password for this Microsoft account.

### Summary of supported scenarios for opening protected documents:

|Platforms for opening documents: Word, Excel, PowerPoint|Authenticated by Azure AD|Authenticated by Microsoft account|Authenticated by social providers|
|---------------|----------|-----------|-----------|
|Windows|Yes (user accounts, email-enabled groups, all members)|Yes for Office 2016 Click to Run|No|
|iOS|Yes (user accounts, email-enabled groups, all members)|No|No|
|Android|Yes (user accounts, email-enabled groups, all members)|No |No|
|MacOs|Yes (user accounts, email-enabled groups, all members)|No|No|

In addition, the Azure Information Protection viewer for iOS and Android can open files by using a Microsoft account.

## Next steps

For more information about the options and settings that you can configure for your label, see [Configuring Azure Information Protection policy](../deploy-use/configure-policy.md).



[!INCLUDE[Commenting house rules](../includes/houserules.md)]


