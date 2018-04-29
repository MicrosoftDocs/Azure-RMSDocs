---
# required metadata

title: Scenarios for document collaboration using Azure Information Protection
description: End-to-end workflows for collaborating on documents that are protected by Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 04/30/2018
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

# Scenarios for secure collaboration by using Azure Information Protection

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](http://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

When you use Azure Information Protection, you can protect your documents without sacrificing collaboration for authorized users. These users might be internal to your organization, external users in another organization, or users with a personal email address.

The majority of documents that users need to collaborate on will be Office documents from Word, Excel, and PowerPoint. These documents support native protection, which means that in addition to the protection features of authorization and encryption, they also support restricted permission for more fine-grained control. 

These permissions are called usage rights, and include permissions such as view, edit, print. You can define individual usage rights when a document is protected, or you can define a grouping of usage rights, called permission levels. Permission levels make it easier to select usage rights that are typically used together, for example, Reviewer and Co-Author. For more information about usage rights and permission levels, see [Configuring usage rights for Azure Rights Management](../deploy-use/configure-usage-rights.md).

When you configure these permissions, you also specify which users or groups they are for:

- For users in your own organization or another organization that uses Azure Active Directory: You can specify Azure AD user accounts, Azure AD groups, or all users in that organization. 

- For users who do not have an Azure Active Directory account: Send them an invitation to create an account in your Azure Active Directory, which uses their personal email as their identity. When these users accept the invitation, this action creates a Microsoft account in your Azure Active Directory. You can now include this account in your own groups. 
    
    Note that unlike sending protected emails with the new capabilities from Office 365 Message Encrytion, for protected documents, you cannot use social identities such as a Gmail account or Hotmail account. However, you can use a Microsoft account that uses a social account for the email address. To open documents with a Microsoft account, users must use Office 2016 Click-to-Run. Other Office editions and versions do not yet support opening Office protected documents wiyh a Microsoft account.

To simplify administration, you might want to consider sending invitations for all external users. This strategy means that you don't need to know in advance whether the external user has an account in Azure AD, and it can accommodate personal email addresses. You can then create your own groups to contain these external user accounts. However, you will have to wait for these users to accept the invitation and Office 2016 Click-to-run must be used to open protected documents with a Microsoft account.  


## Options to apply protection to documents

You can use any of the following methods to apply protection to Office documents:

- **Labels**: You configure a label to apply the protection. Users then select this label, or it can be applied by using the Azure Information Protection scanner, or PowerShell commands.

- **Custom permissions**: Users select the permissions and who they apply to. This can be a result of prompting them when a label is selected, or they initiate this action themselves.

- **Data loss prevention solutions**: You configure a data loss prevention (DLP) solution to automatically apply protection, based on rules that you select. For example, you configure Office 365 DLP to apply protection when personally identifiable information is detected in a document.


### Configuring a label to apply protection

Before you configure your label, identify the users that need to open the protected documents, and decide how you will specify them:

- For internal users, you can select user accounts but for easier maintenance, we recommend selecting groups (must be email-enabled) that contains the users. Or, you also have an option to select all users in your organization.

- For external users, if you know that they have Azure AD accounts, you can enter their user accounts or groups accounts. Or, you can enter a domain name that automatically selects all Azure AD users from that organization. If you do not know whether they have an Azure AD account or if you know that they do not, create a guest account for them in advance 


1. On the **Protection** blade, make sure that **Azure (cloud key)** is selected.
    
2. Make sure **Set permissions** is selected, and select **Add permissions**.

3. On the **Add permissions** blade: To grant permissions to users in your organization, select **Add \<organization name> - All members** to select all users in your tenant, or select **Browse directory** to select a specific group. To grant permissions to external users or if you prefer to type the email address, select **Enter details** and type the email address of the user, or Azure AD group, or a domain name.
    
    Repeat this step to specify additional users who should have the same permissions.

4. For **Choose permissions from preset**, select **Co-Owner**, **Co-Author**, **Reviewer**, or **Custom** to select the permissions that you want to grant.
    
    Note: Do not select **Viewer** for emails and if you do select **Custom**, make sure that you include **Edit and Save**.
    
    To select the same permissions that match the new **Encrypt-Only** option from Exchange Online, select **Custom**. Then select all permissions except **Save As, Export (EXPORT)** and **Full Control (OWNER)**.

5. To specify additional users who should have different permissions, repeat steps 3 and 4.

6. Click **OK** on the **Add permissions** blade.

7. On the **Protection** blade, click **OK**. 

 








[!INCLUDE[Commenting house rules](../includes/houserules.md)]


