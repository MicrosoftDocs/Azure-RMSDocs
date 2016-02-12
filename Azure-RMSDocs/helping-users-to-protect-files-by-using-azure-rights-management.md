---
title: Helping Users to Protect Files by Using Azure Rights Management
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 58f9a6ff-4121-4c8c-9865-1bb290604ad2
author: Cabailey
---
# Helping Users to Protect Files by Using Azure Rights Management
After you have deployed and configured Azure Rights Management (Azure RMS) for your organization, provide help and guidance for users, administrators, and your help desk:

-   **End-user information:**

    Let users know how and when to protect documents and emails that contain sensitive information. Whenever possible, provide this information for  their existing work flows so that they can incorporate the additional steps to an already-familiar process rather than introducing completely new processes . Be sure to let them know the benefits (and the risks) that are specific to your business, as well as providing guidance for when they should protect files and emails. If you have configured [custom templates](http://technet.microsoft.com/library/dn642472.aspx), provide instructions about which one to select if the template name and description is not sufficient for them to choose the correct one.

    > [!TIP]
    > Example videos for end users:
    > 
    > -   [Azure RMS user experience](http://channel9.msdn.com/Series/Information-Protection/Azure-RMS-user-experience)
    > -   [Azure RMS Document Tracking and Revocation](http://channel9.msdn.com/Series/Information-Protection/Azure-RMS-Document-Tracking-and-Revocation)

-   **Administrator information:**

    Some applications automatically apply information protection, by using policies and settings that administrators configure. For these applications, you might need to provide instructions for other administrators who manage these applications and services. For more information, see [How Applications Support Azure Rights Management](../Topic/How-Applications-Support-Azure-Rights-Management.md) and [Configuring Applications for Azure Rights Management](../Topic/Configuring-Applications-for-Azure-Rights-Management.md).

-   **Help desk information:**

    One of the most useful tools for the help desk is the [RMS Analyzer](https://www.microsoft.com/en-us/download/details.aspx?id=46437).   Help desk operators can run it with the Azure RMS administrator option, and they can ask users to run it with the Azure RMS user option. This tool can not only help identify problems, but also fix problems that it finds, and if still not fixed, record trace logs.

    If there are legitimate requests to have full rights access to protected documents, for example a request by the legal department or a manager after an employee has left the organization, make sure the help desk has processes to request this by using the Azure RMS [super user feature](https://technet.microsoft.com/en-us/library/mt147272.aspx).

    In  addition, these are some of the typical problems that users might report:

    -   **Sign in help:**

        Users might be prompted for credentials when Azure RMS needs to authenticate a user and cannot use cached credentials. This will be the user’s work or school account and password that is associated with your Office 365 tenant or Azure Active Directory tenant. It will not be a Microsoft account (formerly Microsoft Live ID) or their personal email account, because these are not currently supported by Azure RMS. Provide users and your help desk with instructions about which account to use when users are prompted for credentials when they use these applications with Azure RMS.

    -   **Problems protecting or consuming content:**

        Make sure that users have the appropriate instructions for the applications that they use, and are using applications and devices that are supported by Azure RMS. For more information about supported applications and devices, see [Requirements for Azure Rights Management](../Topic/Requirements-for-Azure-Rights-Management.md).

        If users see an error when trying to protect or consume content, ask them to run the [RMS Analyzer](https://www.microsoft.com/en-us/download/details.aspx?id=46437) as an Azure RMS user.

        If users report that they can open protected content but don't have the rights that they need, ask them to run the [RMS Analyzer](https://www.microsoft.com/en-us/download/details.aspx?id=46437) as an Azure RMS user and download and view the templates. This will confirm that they have successfully downloaded the templates and what rights the templates provide. The problem might be that the user is not in the correct group that's configured for the template, or that the template needs reconfiguring for the user.

Use the following sections for application-specific information to help users protect sensitive documents and emails.

## Using information protection with the Rights Management sharing application
The Rights Management (RMS) sharing application is required for users to protect and consume protected content if they use Office 2010, but also recommended for all computers and mobile devices that support Azure RMS.

In addition to making it easier for users to protect important documents, the RMS sharing application lets users track the documents that they have protected, and if necessary, revoke access to them.

For instructions to use this application for Windows computers, see the [Rights Management sharing application user guide](http://technet.microsoft.com/library/dn339006.aspx).

For mobile devices, see the [FAQ for Microsoft Rights Management Sharing Application for Mobile Platforms](http://technet.microsoft.com/dn451248).

> [!TIP]
> For a high-level example scenario with screenshots, see the [Users safely share attachments with mobile users](../Topic/What-is-Azure-Rights-Management-.md#BKMK_Example_SharingApp) section in the [What is Azure Rights Management?](../Topic/What-is-Azure-Rights-Management-.md) topic.

## Using information protection with Office 365, Office 2016, or Office 2013
If you are using Azure RMS and have not installed the Rights Management sharing application, users will not see the **Share Protected** button on the ribbon or **Protect in-place** from File Explorer that makes it easier for them to protect files. For these users, they must follow instructions similar to these.

> [!TIP]
> To find application-specific help and instructions for using information protection with these applications, search for **IRM** and the application name and version.

#### To protect a document in Word 2013

1.  Within Microsoft Word, create a new document.

2.  From the **File** menu, click **Info**, click **Protect Document**, click **Restrict Access**, and then choose a template to quickly apply the appropriate usage rights, or select **Restrict Access** and select the usage rights yourself.

    > [!NOTE]
    > If this is the first time that you have used Rights Management, you will contact the [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] service and will be prompted for credentials to configure the Office IRM client.

3.  Save the document.

When others open the document, they are first authenticated. If they are not authorized to open the document, the document does not open. If they are authorized to open the document, it opens with the restricted usage rights that were specified for that user. For example, a usage right of View-only does not allow the user to edit or save the document, even if it is first copied to another location. The usage rights are displayed at the top of the document by using a restriction banner. The banner might display the permissions that are applied to the document, or it might provide a link to display them.

#### To protect an email message using Outlook 2013 and Exchange Online

1.  Within Outlook, create a new mail message addressed to a recipient within your organization.

2.  From the **OPTIONS** tab,  click **Permission**, and then select an option. For example: **Do Not Forward**, **&lt;Company Name&gt; - Confidential** or **&lt;Company Name&gt; - Confidential View Only**.

3.  Send the message.

Similarly to viewing a protected document, when the recipients receive the email message, they are first authenticated. If they are authorized to see the email message, it opens with the restricted usage rights that were specified for that user. For example, if you selected **Do Not Forward**, the Forward button on the ribbon is not available.

#### To protect an email message using the Outlook Web App

1.  Within the Outlook Web App, create a new mail message addressed to a recipient within your organization.

2.  Click  **…**,  click **set permission**, and then select an option. For example: **Do Not Forward**, **Do Not Reply All**, **&lt;Company Name&gt; - Confidential** or **&lt;Company Name&gt; - Confidential View Only**.

3.  Send the message.

Similarly to viewing a protected document, when the recipients receive the email message, they are first authenticated. If they are authorized to see the email message, it opens with the restricted usage rights that were specified for that user. For example, if you selected **Do Not Reply All**, the **REPLY ALL** option in the message window is not available.

## See Also
[Using Azure Rights Management](../Topic/Using-Azure-Rights-Management.md)

