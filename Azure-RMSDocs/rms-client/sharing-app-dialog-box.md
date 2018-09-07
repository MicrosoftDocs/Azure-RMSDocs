---
# required metadata

title: Dialog box options for the RMS sharing app - AIP
description: Information to help you specify the options in the RMS sharing application add protection dialog box or the share protected dialog box. You will see this dialog box when you protect a file to share or you protect a file in place and choose custom permissions.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 02/23/2017
ms.topic: conceptual
ms.service: information-protection
ms.assetid: 7b91ab30-6363-4929-bcbd-4dfbd05f644a

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Dialog box options for the Rights Management sharing application

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 7 with SP1, Windows 8, Windows 8.1*

Use this information to help you specify the options in the RMS sharing application **add protection** dialog box or the **share protected** dialog box. You will see this dialog box when you [protect a file to share](sharing-app-protect-by-email.md) or you [protect a file in place](sharing-app-protect-in-place.md) and choose custom permissions.

> [!IMPORTANT]
> If the options you see are different from those documented here, you probably don’t have the latest version of the sharing application installed. You can download the latest version from the [Microsoft Rights Management](http://go.microsoft.com/fwlink/?LinkId=303970) page.
> 
> How do you know if you have the latest version? Look for **Microsoft Rights Management sharing application** listed in Programs and Features, and check the corresponding version number. To see and use the options in the table, the version should be at least **1.0.1770.0**. You can check the latest version number from the download page.

In addition to the options that you can choose, you might also be wondering:

-   [What’s the .ppdf file that’s automatically created?](#whats-the-ppdf-file-thats-automatically-created)

-   [What’s the difference between generic protection and built-in (native) protection?](#whats-the-difference-between-generic-protection-and-built-in-native-protection)

|Option|Description|
|----------|---------------|
|**USERS**|If you haven’t already specified an email address from Outlook, type the email addresses of the people that you want to be able to open the file.<br /><br />Note that the RMS sharing app does not support all email addresses.<br /><br />If your organization uses the on-premises version of Rights Management (AD RMS), the email addresses you can  specify are restricted to  people within your organization. When this applies, and you try to specify external email addresses, you will see a message that says your company configuration allows sharing of protected content only within the company. <br /><br /> If your organization uses Azure RMS, the email addresses that you specify can be for people within  your  organization, or for people in another organization.<br /><br />For example: **janetm@contoso.com; p.dover@fabrikam.com**<br /><br />Personal email addresses are not currently supported by the RMS sharing app.|
|**Generic Protection**|If this option is selected, it means that the file you selected cannot be natively protected. For more information, see. [What’s the difference between generic protection and built-in (native) protection?](#whats-the-difference-between-generic-protection-and-built-in-native-protection) on this page.|
|**Viewer – View Only**<br /><br />**Reviewer – View and Edit**<br /><br />**Co-Author – View, Edit, Copy, and Print**<br /><br />**Co-Owner – All Permissions**<br /><br />Note: All these options have a round icon before the name, which represent a world globe. This icon is used because typically, you select one of these options when you send your attachment to somebody in a different organization.|Select one of these options if you want to define the rights for your protected document. Click each option to view a description.<br /><br />When you choose one of these options, only the people you specify in **USERS** have the rights you specify to open and use the document. For example, if they forward to somebody else, the document would not open.|
|Policy templates that your administrator configures.<br /><br />For example, if your company name is Contoso, Ltd: **Contoso, Ltd - Confidential View Only**<br /><br />Note: All these options have a square icon before the name, which represent an office building. This icon is used because typically, you select one of these options when you send your attachment to somebody in your organization.|When you share a document with people who work for your organization, you see the available policy templates that your administrator configures. Choose one of these when the document should not be shared outside your organization.<br /><br />When you choose one of these options, your administrator defines the rights for the document and who can open it.|
|**Expire these documents on**|Select this option only for time-sensitive files that the users that you selected should not be able to open after a date that you specify. You will still be able to open the original file but after midnight (your current time zone), on the day that you specify, others will not be able to open the file.<br /><br />This option is not available if you select a policy template that your administrator configures.|
|**Email me when somebody tries to open these documents**|Note: This option is currently in preview.<br /><br />Select this option if you want to receive email notifications whenever somebody tries to open the document that you’re protecting. The email message will say who tried to open it, when, and whether they were successful.<br /><br />This option is available only if your organization uses Azure Information Protection. If your organization uses the on-premises version of Rights Management (AD RMS), you will not see this option.|
|**Allow me to instantly revoke access to these documents**|Choose this option if you might need to revoke access to the documents later by using the document tracking site, and revocation needs to take effect immediately. However, setting this option means that while the document is not revoked, users always need an Internet connection to read the document, each time they access it. There might be some scenarios where users can’t connect their device to the Internet, and users can’t read your document as you intended.<br /><br />If you do not choose this option, you can still revoke the documents later, by using the document tracking site. However, because users do not always need an Internet connection to read the document, they won’t know immediately that the document is revoked and can continue to read it until they next authenticate with Azure RMS. By default, the maximum number of days that somebody could continue to read a protected document that you’ve revoked is 30 days, but an administrator can change this value to be fewer or greater than 30 days.<br /><br />This option is available only if your organization uses Azure Information Protection. If your organization uses the on-premises version of Rights Management (AD RMS), you will not see this option.|

## What’s the difference between generic protection and built-in (native) protection?

-   When you **generically protect a file**, unauthorized people cannot open the file. But after authorized people open the file, they could then forward it unprotected to other people or save it in a location that others could access. They do, however, see a message that tells them what permissions they have for the file, and they are asked to honor these, but this protection cannot be enforced. In addition, when you generically protect a file, you cannot restrict the permissions further than authorization. For example you cannot restrict the content to view-only, or do not print.:

    > [!NOTE]
    > A generically protected file always has a file name extension of **.pfile**.

-   In comparison, when you use the **built-in (native) protection** of Rights Management with applications that support this (for example, Office files), the protection applies to the file even if the file is then sent to somebody else or saved in another location. And, when you protect these files, you can use restrictive permissions such as read-only, or the permission to edit but not print or copy. For example, you could select **Viewer – View Only**, so that the content cannot be edited, printed, or copied.

For additional technical information, see the [Levels of protection – native and generic](sharing-app-admin-guide-technical.md#levels-of-protection--native-and-generic) section in the [Rights Management sharing application administrator guide](sharing-app-admin-guide.md).

## What’s the .ppdf file that’s automatically created?

-   When you share a protected file by email (share protected), the RMS sharing application automatically creates a **.ppdf** version of the file for Word, Excel, PowerPoint, or PDF. This is a read-only protected version of the file that only authorized people can open, and it ensures that the recipients can always read the attachment, even if they are using a mobile device that doesn’t have an application that natively supports Rights Management. Providing these people have the RMS sharing app installed, they will be able to read the attachment.

    In this scenario, unlike a generically protected file, usage restriction is enforced. The recipient will not be able to save this version of the file and if they forward the attachment to somebody else, the original restrictions remain with the document. Only people that were authorized for the protected document will be able to open it.

    > [!NOTE]
    > A .ppdf file is automatically created when you share protected (share by email) but is not created when you protect in-place.

## Examples and other instructions
For examples for how you might use the Rights Management sharing application, and how-to instructions, see the following sections from the Rights Management sharing application user guide:

-   [Examples for using the RMS sharing application](sharing-app-user-guide.md#examples-for-using-the-rms-sharing-application)

-   [What do you want to do?](sharing-app-user-guide.md#what-do-you-want-to-do)

## See Also
[Rights Management sharing application user guide](sharing-app-user-guide.md)

