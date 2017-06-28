---
# required metadata

title: AIP Scenario - Control of documents stored in SharePoint
description: This scenario and supporting user documentation uses Azure Rights Management protection to ensure that Office documents stored in SharePoint remain under your control by using protected libraries. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 05/11/2017
ms.topic: get-started-article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 1b6244c7-5ab9-4881-bc8f-6fa960390d89

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Scenario - Retain control of documents stored in SharePoint

>*Applies to: Azure Information Protection, Office 365*

This scenario and supporting user documentation uses the Azure Rights Management technology from Azure Information Protection, to ensure that Office documents stored in SharePoint remain under your control by using protected libraries. For example, the documents are automatically protected from accidental or intended leakage by users and you can block access to content even after it is downloaded or synchronized. The files you want to protect might be for internal collaborating on design documents or plans, or for other deliverables. When you configure protected libraries for SharePoint, the Office files stored in them will be protected by Azure Rights Management.

The instructions are suitable for the following set of circumstances:

-   Employees share and collaborate using Office documents that are on a SharePoint library.

-   Employees do not need to set or change the permissions that an administrator sets at the library level.

-   Employees do not need to share these documents with people outside your organization.

## Deployment instructions
![Administrator instructions for Azure RMS Rapid Deployment](../media/AzRMS_AdminBanner.png)

Make sure that the following requirements and the supporting procedures are in place before you go on to the user documentation.

## Requirements for this scenario
For this scenario to work, the following must be in place:

|Requirement|If you need more information|
|---------------|--------------------------------|
|You have prepared accounts and groups for Office 365 or Azure Active Directory|[Preparing for Azure Information Protection](../plan-design/prepare.md)|
|Azure Rights Management is activated|[Activating Azure Rights Management](../deploy-use/activate-service.md)|
|If you will use SharePoint Server: Deploy the RMS connector and configure it for SharePoint|[Deploying the Azure Rights Management connector](../deploy-use/deploy-rms-connector.md)|
|Configure permissions for the SharePoint site to protect|[Manage permissions for a list, library, folder, document, or list item](https://support.office.com/en-ca/article/Manage-permissions-for-a-list-library-folder-document-or-list-item-9d13e7df-a770-4646-91ab-e3c117fcef45)<br /><br />[Apply Information Rights Management to a list or library](http://office.microsoft.com/sharepoint-help/apply-information-rights-management-to-a-list-or-library-HA102891460.aspx)|
|Configure SharePoint for IRM and protected libraries|[Set up Information Rights Management (IRM) in SharePoint admin center](https://support.office.com/en-us/article/Set-up-Information-Rights-Management-IRM-in-SharePoint-admin-center-239ce6eb-4e81-42db-bf86-a01362fed65c)<br /><br />[Apply Information Rights Management to a list or library](http://office.microsoft.com/sharepoint-help/apply-information-rights-management-to-a-list-or-library-HA102891460.aspx)|

### To configure the SharePoint library for IRM settings

1.  After you have configured SharePoint to use the IRM service, navigate to your SharePoint library to protect with Azure RMS. In the **Settings** &gt; **Information Rights Management (IRM)** page for the site, in addition to selecting **Restrict permissions on this library on download**, and specifying a policy title for administrators and a policy descriptions for users, click **SHOW OPTIONS**.

2.  Select the following:

    -   **Do not allow users to upload documents that do not support IRM**

    -   Optional: **Allow group protection. Default group** and then specify the name of an additional group that might need to collaborate on documents stored in this library, but outside SharePoint. For example, the Sales group has Edit permissions to the site and somebody from this group downloads a document, saves it to disk, and emails it to a co-worker. The co-worker would only get access to the document (with Edit rights) if she is a member of the designed group.

        Without this option, only users that have access to the SharePoint library will be able to collaborate on these documents, and only by downloading the documents directly from SharePoint. In many cases, this restriction is appropriate.

## User documentation instructions
There are no procedural instructions to give to users for this scenario because protected libraries require no special action from users. Documents are automatically protected on download, according to the permissions that a SharePoint administrator sets for the site. However, inform users about this change so that they know what to expect, and let your help desk know which libraries are protected and how this can restrict the use of the documents. For example, because of current limitations, these documents can be viewed but not edited with mobile devices. If you configured the group protection, let users know which groups can access and edit documents outside SharePoint.

Using the following template, copy and paste the announcement into a communication for your end users, and make these modifications to reflect your environment:

1.  Replace each instance of *&lt;name of SharePoint library&gt;* with the name and link of the SharePoint library that you configured for Azure Rights Management. If this communication is for more than one protected library, change the instructions accordingly.

2.  If you configured the **Allow group protection. Default group** option, replace *&lt;group name&gt;* with name of the group you configured and supply the reason for &lt;reason why this group has access permissions to collaborate on the files but not by using the SharePoint library&gt;. If you did not configure this option, delete this sentence.

3.  Replace *&lt;contact details&gt;* with instructions for how your users can contact the help desk, such as a website link, email address, or telephone number.

4.  Make any additional modifications that you want to the announcement, and then send it to these users.

The example documentation shows how this announcement might look for users, after your customizations.

![Template user documentation for Azure RMS Rapid Deployment](../media/AzRMS_UsersBanner.png)

### IT Announcement: Changes to the &lt;name of SharePoint library&gt; site
The SharePoint site, **&lt;name of SharePoint library&gt;**, is now configured for secure collaboration. Now, only members of the &lt;group name&gt; can open these documents from this site, even if you save them locally or email them to somebody else. The exception is that you can share them with members of the &lt;group name&gt; after you have downloaded the documents, so that &lt;reason why this group has access permissions to collaborate on the files but not by using the SharePoint library&gt;. When you edit the files, you see a yellow information banner at the top of the document, to let you know that it has this protection and who can access them.

This change helps to keep our company-confidential data safe from people who should not see it. If you use a mobile device to access these protected documents, you can view them but you must use a desktop device to edit them.

You will not be able to upload documents to the &lt;name of SharePoint site&gt; site if they do not support secure collaboration.

**Need help?**

-   Contact the help desk: &lt;contact details&gt;

### Example user documentation
![Example user documentation for Azure RMS Rapid Deployment](../media/AzRMS_ExampleBanner.png)

#### IT Announcement: Changes to the Sales Forecasts and Reports site
The SharePoint site, **Sales Forecasts and Reports**, is now configured for secure collaboration. Now, only members of our Sales and Marketing team can open these documents from this site, even if you save them locally or email them to somebody else. The exception is that you can share them with members of the Finance team after you have downloaded the documents, so that they can extract the monthly forecast figures. When you edit the files, you see a yellow information banner at the top of the document, to let you know that it has this protection and who can access them.

This change helps to keep our company-confidential data safe from people who should not see it. If you use a mobile device to access these protected documents, you can view them but you must use a desktop device to edit them.

You will not be able to upload documents to the Sales Forecasts and Reports site if they do not support secure collaboration.

**Need help?**

-   Contact the help desk: helpdesk@vanarsdelltd.com

[!INCLUDE[Commenting house rules](../includes/houserules.md)]