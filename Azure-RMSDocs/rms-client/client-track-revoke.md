---
# required metadata

title: Track and revoke your protected documents when you use Azure Information Protection | Azure Information Protection
description: After you have protected your documents, you can track how people are using them. If necessary, you can also revoke access to these documents if people should no longer be able to read them. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 01/30/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 643c762e-23ca-4b02-bc39-4e3eeb657a1d

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Track and revoke your documents when you use Azure Information Protection

>*Applies to: Azure Information Protection, Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1*

After you have protected your documents by using Azure Information Protection, you can track how people are using these documents. If necessary, you can also revoke access to them if people should no longer be able to read them. To do this, you use the **document tracking site**, which you can access from Windows computers, Mac computers, and even from tablets and phones.

<div style="padding-top: 56.25%; position: relative; width: 100%;">
<iframe style="position: absolute;top: 0;left: 0;right: 0;bottom: 0;" width="100%" height="100%" src="https://channel9.msdn.com/Series/Information-Protection/Azure-RMS-Document-Tracking-and-Revocation/player" frameborder="0" allowfullscreen></iframe>
</div>

When you access this site, sign in to track your documents. Providing your organization has a [subscription that supports document tracking and revocation](https://www.microsoft.com/en-us/cloud-platform/azure-information-protection-features) and you are assigned a license for this subscription, you can then see who tried to open the files that you protected and whether they were successful (they were successfully authenticated) or not. You will also see each time they tried to access the document, and their location at the time. In addition:

-   If you need to stop sharing a document: Click **Revoke access**, note the period of time that the document will continue to be available, and decide whether to let people know that you’re revoking access to the document you previously shared, and provide a customized message. When you revoke a document, it doesn't delete the document that you shared, but authorized users will no longer be able to open it.

-   If you want to export to Excel: Click **Export to CSV**, so that you can then modify the data, and create your own views and graphs.

-   If you want to configure email notifications: Click **Settings** and select how and whether to be emailed when the document is accessed.

- If you want to track and revoke shared documents for others: Administrators for Azure Information Protection can track and revoke protected documents for others by clicking the Admin icon. Only administrators see this icon.

-   If you have questions or want to provide feedback about the document tracking site: Click the Help icon to access the [FAQ for Document Tracking](http://go.microsoft.com/fwlink/?LinkId=523977).

## Using Office to access the document tracking site

-   For the Office applications, Word, Excel, PowerPoint, and Outlook: On the **Home** tab, in the **Protection** group, click **Protect** > **Track usage**:

    ![Track usage option](../media/track-usage-callout.png)

If you do not see these options in your Office applications, it’s likely that either the Azure Information Protection client is not installed on your computer, your Office applications must be restarted, or your computer must be restarted to complete the installation. For more information about how to install the Azure Information Protection client, see [Download and install the Azure Information Protection client](install-client-app.md).


### Other ways to track and revoke your documents
In addition to tracking your protected documents on Windows computers by using Office applications, you can also use these alternatives:

-   **Using a web browser**: This method works for all supported devices.

-   **Using File Explorer**: This method works for Windows computers.

#### Using a web browser to access the doc tracking site

-   Using a supported browser, go to the [document tracking site](https://go.microsoft.com/fwlink/?LinkId=529562).

    Supported browsers: We recommend using Internet Explorer that is at least version 10, but you can use any of following browsers to use the document tracking site:

    -   Internet Explorer: At least version 10

    -   Internet Explorer 9 with at least MS12-037: Cumulative Security Update for Internet Explorer: June 12, 2012

    -   Mozilla Firefox: At least version 12

    -   Apple Safari 5: At least version 5

    -   Google Chrome: At least version 18

#### Using File Explorer to access the doc tracking site

-   Right-click the file, select **Classify and protect**, and then from the **Classify and protect - Azure Information Protection** dialog box, select **Track Usage**.


## Other instructions
For how-to instructions, see the following sections from the Azure Information Protection user guide:

-   [What do you want to do?](client-user-guide.md#what-do-you-want-to-do)

[!INCLUDE[Commenting house rules](../includes/houserules.md)]