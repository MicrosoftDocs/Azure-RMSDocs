---
title: Rapid Deployment Guide for Azure Rights Management
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.assetid: c994d616-cff6-4930-9228-a7f7d198a160
author: Cabailey
---
# Rapid Deployment Guide for Azure Rights Management
Use this guide in addition to the [technical documentation for Azure Rights Management](https://technet.microsoft.com/library/jj585024.aspx), to help you deploy and use Azure Rights Management (Azure RMS) by choosing from a list of specific scenarios to implement.

These scenarios contain both administrator instructions and accompanying end user documentation. Before you give the documentation (instructions or announcements) to your end users, you will need to first customize this documentation for your business requirements and existing work flows. An example set of instructions or an announcement show how the final end user documentation might look.

Each scenario has a list of requirements with links to more information if needed, so that you can deploy these solutions independently and in any order.

The scenarios listed here are a sample of the most popular ones. Because Azure RMS can be used to protect information in a large number of scenarios both within an organization and across organizations, you can define your own scenarios and deploy them to your environment and to your users by using this same model. By focusing on specific scenarios, your Azure RMS deployment will more closely align to your business goals. In addition, our experience is that users tend to follow scenario-specific instructions much more closely and systematically than general guidance such as "protect sensitive documents".

Before you roll out these solutions, you might want to send a broad announcement to end users, letting them know that some changes are coming to help protect company data, and that it might require some changes from them. An example communication is included after the following table.

> [!NOTE]
> If you have questions and comments about this guide, use the feedback mechanism on the Rapid Deployment Guide for Azure Rights Management page on TechNet, or send an email message to [AskIPTeam@Microsoft.com](mailto:%20askipteam@microsoft.com?subject=Rapid%20Deployment%20Guide%20feedback).

## Scenarios for Azure RMS
To help you more quickly deploy Azure RMS to address specific business problems, choose the scenarios that most closely match your business goals, and adapt them where necessary.

|Scenario|Instructions and end user documentation|
|------------|-------------------------------------------|
|Safely email an Office file to users in another organization with the ability to track the resulting accesses (business-to-business collaboration).<br /><br />Examples:<br /><br />Send a price list, roadmap, or release plans to a customer<br /><br />Send a work order, or marketing specification to a vendor<br /><br />Send a tender or request for quotation (RFQ) to a partner|[Scenario - Share an Office File with Users in Another Organization](../Topic/Scenario---Share-an-Office-File-with-Users-in-Another-Organization.md)|
|Ensure documents stored in a SharePoint library remain under your control.<br /><br />Examples:<br /><br />Departmental spreadsheets and reports<br /><br />Cross-team collaboration for design documents or other deliverables.|[Scenario - Retain Control of Documents Stored in SharePoint](../Topic/Scenario---Retain-Control-of-Documents-Stored-in-SharePoint.md)|
|Executives can securely exchange privileged information over email.<br /><br />Examples:<br /><br />Sharing acquisition plans<br /><br />Discussing or disseminating legal issues<br /><br />Information about potential layoffs or other sensitive subjects|[Scenario - Executives Securely Exchange Privileged Information](../Topic/Scenario---Executives-Securely-Exchange-Privileged-Information.md)|
|Automatically protect all files on a file server.<br /><br />Examples:<br /><br />CAD documents that must be kept in-house to prevent loss of intellectual property<br /><br />Marketing promotion plans and dates that must be kept secret from public disclosure to maintain a competitive advantage|[Scenario - Protect Files on a File Server Share](Scenario---Protect-Files-on-a-File-Server-Share.md)|
|Tightly protect your most confidential, high-business impact documents.<br /><br />Examples:<br /><br />Recipe or formula information that is unique to your company<br /><br />Highly classified takeover or merger plans<br /><br />Natural resources exploration data|[Scenario - Secure Your Most &#40;Few&#41; Valuable Files](../Topic/Scenario---Secure-Your-Most--Few--Valuable-Files.md)|
|Securely send company-confidential emails and attachments.<br /><br />Examples:<br /><br />Company vision statement<br /><br />Organization charts, reorganization news, or promotion announcements<br /><br />Company policy information|[Scenario - Send a Company-Confidential Email](../Topic/Scenario---Send-a-Company-Confidential-Email.md)|
|Apply persistent protection for Office files in Work Folders.<br /><br />Examples:<br /><br />Locally edited Word documents for a company-confidential project<br /><br />Locally created spreadsheets that contain sensitive data or high business impact data<br /><br />Locally stored work-in-progress PowerPoint presentations that must not be leaked or accidentally shared with people outside the organization until the presentations are final|[Scenario - Configure Work Folders for Persistent Protection](../Topic/Scenario---Configure-Work-Folders-for-Persistent-Protection.md)|

## Announcement for users before rollout
You can use the following example communication message to let users know that deploying Azure RMS means that some changes are on the way. Copy and paste the following text, to be sent by email to all users from somebody in your organization's leadership team, preferably your Chef Executive Officer. Consider making any changes to this text that will make the message more relevant to users and your organization.

![](../Image/AzRMS_ExampleBanner.png)

### Changes we're making to safeguard our data
Have you ever wanted to block access to that document you sent to your partners by mistake? Have you wondered if there’s a way to know which of your customers have read the latest product news you sent? Do you have a need to share confidential product information without concerns that it might be sent on to people who shouldn't see it?

You'll soon be able to do these things because the IT Department is rolling out some changes that implement Microsoft Azure Rights Management (Azure RMS) as an enterprise data protection solution. Many of these solutions will automatically apply the protection that we need, without you having to do anything different. But some changes might require you do some things differently and when this is the case, the IT Department will send you information and instructions, with support from the help desk if you have questions or problems.

For example, to track (and if necessary, revoke) the documents that you share, you'll be using the document tracking site:

![](../Image/AzRMS_Tutorial_5_Screenshots.png)

For a sneak peak at how this works, have a look at this 2-minute video: [Azure RMS Document Tracking and Revocation](https://channel9.msdn.com/Series/Information-Protection/Azure-RMS-Document-Tracking-and-Revocation)

One of this organization's most valuable assets is its data—the data that we generate, store, and use on a daily basis. It gives us our competitive advantage and helps us be successful. That's why it's so important that we remain in control of our data and ensure that people who should not access it, cannot access it.

The solutions that we're implementing will help us safeguard our valuable data, and give you the tools to keep control of that data. Thank you for your cooperation while we implement these changes.

