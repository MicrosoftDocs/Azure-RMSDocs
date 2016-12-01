---
# required metadata

title: Azure Information Protection user guide | Azure Information Protection
description: The Azure Information Protection client for Windows helps you keep important documents and emails safe from people who shouldn't see them, even if your email is forwarded or your document is saved to another location. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 12/07/2016
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 2cf46bf9-7d23-4f49-b5c1-7ed7b71c858f

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Azure Information Protection user guide

>*Applies to: Active Directory Rights Management Services, Azure Information Protection, Windows 10, Windows 7 with SP1, Windows 8, Windows 8.1*

**[ This version of the client is in preview and subject to change. ]**

The Azure Information Protection client for Windows helps you keep important documents and emails safe from people who shouldn't see them, even if your email is forwarded or your document is saved to another location. You can also use this client to open documents and emails that other people have protected by using the Rights Management protection technology from Azure Information Protection.

All you need is a computer that runs at least Windows 7 with Service Pack 1. Then [download and install](http://go.microsoft.com/fwlink/?LinkId=303970) this free application from Microsoft.

If you have questions that are not answered by this guide, visit our [Azure Information Protection Yammer site](https://www.yammer.com/AskIPTeam). 

## Examples for using the Azure Information Protection client
Here are just some examples of how you might use the Azure Information Protection client, to classify and protect your documents and emails.

|I want to ….|How to do this|
|----------------|------------------|
|**… safely share financial information with somebody I trust who works for another organization**<br /><br />You work with a partner company and want to email them an Excel spreadsheet that contains projected sales figures. You want them to be able to view the figures but not change them.|You use the **Share Protected** button on the ribbon in Excel, type the email addresses of the two people that you work with in the partner company, select **Viewer – View Only**, and click **Send**.<br /><br />When the email arrives at the partner company, only the recipients in the email can view the spreadsheet and they cannot save, edit, print, or forward it.<br /><br />Step-by-step: [Protect a file that you share by email by using the Rights Management sharing application](sharing-app-protect-by-email.md).|
|**… safely send a document by email to somebody who uses an iOS device**<br /><br />You want to email a highly confidential Word document to a coworker, who you know, regularly checks email on their iOS device.|You use File Explorer to right-click the file, and select **Share Protected** to. send the file as an attachment to your coworker.<br /><br />The recipient receives the email on their iOS device. Because she doesn't have Office for iPad and iPhone, she clicks the link in the email that tells her how to download the sharing application, installs the version for iOS devices, and then views the document¹.<br /><br />Step-by-step: [Protect a file that you share by email by using the Rights Management sharing application](sharing-app-protect-by-email.md).|
|**… check who’s opened my protected documents and when, and revoke access if necessary**<br /><br />You safely shared a confidential design document with potential suppliers and now you want to see who accessed it, when, and from where. Then, when one of the suppliers is awarded the business, you want to revoke access to the original document so the people you shared it with can no longer read it.|After you share a document by email, you go to the [document tracking site](http://go.microsoft.com/fwlink/?LinkId=529562) to check who has access that document and when. When you need to stop sharing it, you select the option to revoke access.<br /><br />Step-by-step: [Track and revoke your documents when you use the RMS sharing application](sharing-app-track-revoke.md).|
|**… read an attachment I’ve received in an email message that has a securely shared file attachment but I can’t read it because my company doesn’t use Rights Management**<br /><br />The email sender is somebody who you trust because you’ve done business with them in the past and you suspect that they might be sending you information about a potential new business opportunity.|You follow the instructions in the email and click the link to sign up for Microsoft Rights Management. Microsoft confirms that your organization does not have a subscription that includes Azure Information Protection, sends you an email to complete the free sign-up process, and you sign in with your new account. You click the second link in the email to install the Rights Management sharing app and can then open the email attachment to read about the new business opportunity.<br /><br />Step-by-step: [View and use files that have been protected by Rights Management](sharing-app-view-use-files.md).|
|**… protect company-confidential files on my laptop so they can’t be accessed by people outside my company**<br /><br />You travel a lot and use your laptop to access and update files in a folder that must be secured against unauthorized access.|You have the RMS sharing application installed on your laptop. You use File Explorer to protect the files by using a template, which quickly protects the files. If your laptop is stolen, you have peace of mind that nobody outside your company can access these documents.<br /><br />Step-by-step: [Protect a file on a device &#40;protect in-place&#41; by using the Rights Management sharing application](sharing-app-protect-in-place.md).|
¹ PDF Rendering Powered by Foxit. Copyright © 2003–2014 by Foxit Corporation.

## What do you want to do?
> [!NOTE]
> For more technical information, such as [supported file types](sharing-app-admin-guide-technical.md#supported-file-types-and-file-name-extensions) and [how to install this application on an enterprise network](sharing-app-admin-guide.md#automatic-deployment-for-the-microsoft-rights-management-sharing-application), see the [Rights Management sharing application administrator guide](sharing-app-admin-guide.md).

- [Download and install the Azure Information Protection client](install-client-app.md)

- [Classify and protect a file or email](sharing-app-protect-in-place.md)

- [Protect a file that you share by email](sharing-app-protect-by-email.md)

- [Change permissions on protected files](sharing-app-reprotect-files.md)

- [Track and revoke your documents](sharing-app-track-revoke.md)

- [Use files and emails that have been protected](sharing-app-view-use-files.md)

- [Remove protection from a file or email](sharing-app-remove-protection.md)




