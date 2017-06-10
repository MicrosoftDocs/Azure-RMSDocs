---
# required metadata

title: Help users protect files by using Azure RMS - AIP
description: Information to help you provide guidance for users, administrators, and your help desk after you have deployed and configured the Azure Rights Management service from Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 03/02/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 58f9a6ff-4121-4c8c-9865-1bb290604ad2

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Helping users to protect files by using the Azure Rights Management service

>*Applies to: Azure Information Protection, Office 365*

After you have deployed and configured Azure Information Protection for your organization, provide help and guidance for users, administrators, and your help desk:

-   **End-user information:**

    Let users know how and when to protect documents and emails that contain sensitive information. Whenever possible, provide this information for their existing work flows so that they can incorporate the additional steps to an already-familiar process rather than introducing new processes. Be sure to let them know the benefits (and the risks) that are specific to your business, as well as providing guidance for when they should protect files and emails. If you have configured [custom templates](configure-custom-templates.md), provide instructions about which one to select if the template name and description is not sufficient for them to choose the correct one.

    > [!TIP]
    > Example videos for end users:
    >
    > -   [Azure RMS user experience](http://channel9.msdn.com/Series/Information-Protection/Azure-RMS-user-experience)
    > -   [Azure RMS Document Tracking and Revocation](http://channel9.msdn.com/Series/Information-Protection/Azure-RMS-Document-Tracking-and-Revocation)

-   **Administrator information:**

    Some applications automatically apply information protection, by using policies and settings that administrators configure. For these applications, you might need to provide instructions for other administrators who manage these applications and services. For more information, see [How applications support the Azure Rights Management service](../understand-explore/applications-support.md) and [Configuring applications for the Azure Rights Management service](configure-applications.md).

-   **Help desk information:**

    
    If users are running the Azure Information Protection client, help desk operators can ask them to use the **Help and Feedback**, **Run Diagnostics** option, and afterwards, reset the client. However, reset doesn't sign out the user or rebootstrap the client, and there is no automatic remediation.

    If there are legitimate requests to have full rights access to protected documents, make sure the help desk has processes to request this acess by using the Azure Rights Management [super user feature](configure-super-users.md). For example, these requests might be from the legal department or a manager after an employee has left the organization, 

    In  addition, some of the typical problems that users might report include the following categories:

    -   **Sign in help:**

        Users might be prompted for credentials when the Azure Rights Management service needs to authenticate a user and cannot use cached credentials. The required credentials are for the user’s work or school account and password that is associated with your Office 365 tenant or Azure Active Directory tenant. The required credentials are not for a Microsoft account (formerly Microsoft Live ID) or their personal email account, because these are not currently supported by the Azure Rights Management service. Provide users and your help desk with instructions about which account to use when users are prompted for credentials when they use  applications with the Azure Rights Management service.

    -   **Problems protecting or consuming content:**

        Make sure that users have the appropriate instructions for the applications that they use, and are using applications and devices that are supported by the Azure Rights Management service. For more information about supported applications and devices, see [Requirements for Azure Rights Management](../get-started/requirements-azure-rms.md).

        Authentication and authorization rely on accounts and groups in Azure Active Directory. To confirm that a specific user or group can be authorized to consume protected content, use the verification checks in [Preparing users and groups for Azure Information Protection](../plan-design/prepare.md).

        If users report that they can open protected content but don't have the rights that they need, the problem might be that the user is not in the correct group that's configured for a Rights Management template. Or, that the [template needs reconfiguring](configure-policy-template.md) for the user or group. 
        
        If the rights that users have are not as expected, check the description of them and any application-specific implementation from the [usage rights table](../deploy-use/configure-usage-rights.md#usage-rights-and-descriptions).

Use the following sections for application-specific information to help users protect sensitive documents and emails.

## Using information protection with the Azure Information Protection client
The Azure Information Protection client (or the older application, RMS sharing application) is required for users to protect and consume protected documents and emails if they use Office 2010. However, the Azure Information Protection client is also recommended for all computers and mobile devices.

In addition to making it easier for users to protect important documents and emails, the Azure Information Protection client lets users track the documents that they have protected. Tracked documents can also be revoked if the previously authorized users should no longer have access to them.

For instructions to use this client for Windows computers, see the [Azure Information Protection client user guide](../rms-client/client-user-guide.md).


## Using information protection with Office 365, Office 2016, or Office 2013
If you are using the Azure Rights Management service and have not installed the Azure Information Protection client, users will not see the Azure Information Protection bar in their Office desktop apps, the **Protect** button on the ribbon, or **Classify and protect** from File Explorer. These additions make it easier for users to protect documents and emails. For these users, they must follow instructions similar to the steps that follow.

> [!TIP]
> To find application-specific help and instructions for using information protection with these applications, search for **IRM** and the application name and version.

#### To protect a document in Word 2013

1.  Within Microsoft Word, create a document.

2.  From the **File** menu, click **Info**, click **Protect Document**, and then click **Restrict Access**.

3. Choose a template to quickly apply the appropriate usage rights, or select **Restrict Access** and select the usage rights yourself.

    > [!NOTE]
    > If this is the first time that you use Rights Management, you connect to the [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] service and you are prompted for credentials to configure the Office IRM client.

3.  Save the document.

When others open the document, they are first authenticated. If they are not authorized to open the document, the document does not open. If they are authorized to open the document, it opens with the restricted [usage rights](../deploy-use/configure-usage-rights.md) that were specified for that user. 

For example, a usage right of View-only does not allow the user to edit or save the document, even if it is first copied to another location. 

The usage rights are displayed at the top of the document by using a restriction banner. The banner might display the permissions that are applied to the document, or it might provide a link to display them.

#### To protect an email message using Outlook 2013 and Exchange Online

1.  Within Outlook, create a mail message addressed to a recipient within your organization.

2.  From the **OPTIONS** tab,  click **Permission**, and then select an option. For example: **Do Not Forward**, **&lt;Company Name&gt; - Confidential** or **&lt;Company Name&gt; - Confidential View Only**.

3.  Send the message.

Similarly to viewing a protected document, when the recipients open the protected email message, they are first authenticated. If they are authorized to see the email message, it opens with the restricted [usage rights](../deploy-use/configure-usage-rights.md) that were specified for that user. 

For example, if the email message is protected by using the **Do Not Forward** option, the Forward button on the ribbon is not available.

#### To protect an email message using Outlook on the web

1.  Using Outlook on the web, create a mail message addressed to a recipient within your organization.

2.  Click  **…**,  click **set permission**, and then select an option. For example: **Do Not Forward**, **Do Not Reply All**, **&lt;Company Name&gt; - Confidential** or **&lt;Company Name&gt; - Confidential View Only**.

3.  Send the message.

Similarly to viewing a protected document, when the recipients open the email message, they are first authenticated. If they are authorized to see the email message, it opens with the restricted [usage rights](../deploy-use/configure-usage-rights.md) that were specified for that user. 

For example, if you selected **Do Not Reply All**, the **REPLY ALL** option in the message window is not available.

[!INCLUDE[Commenting house rules](../includes/houserules.md)]

