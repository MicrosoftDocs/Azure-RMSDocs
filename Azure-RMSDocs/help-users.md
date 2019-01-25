---
# required metadata

title: Help users protect files by using Azure RMS - AIP
description: Information to help you provide guidance for users, administrators, and your help desk after you have deployed and configured the Azure Rights Management service from Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 01/24/2019
ms.topic: conceptual
ms.service: information-protection
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

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

After you have deployed and configured Azure Information Protection for your organization, provide help and guidance for users, administrators, and your help desk:

-   **End-user information**
    
    Let users know how and when to protect documents and emails that contain sensitive information. Whenever possible, provide this information for their existing work flows so that they can incorporate the additional steps to an already-familiar process rather than introducing new processes. Be sure to let them know the benefits (and the risks) that are specific to your business, as well as providing guidance for when they should protect files and emails. If you have configured [templates](configure-policy-templates.md), provide instructions about which one to select if the template name and description is not sufficient for them to choose the correct one.
    
    > [!TIP]
    > Example videos for end users:
    > -   [Microsoft Azure Information Protection](https://youtu.be/ToShAUdlrPo?list=PL8nfc9haGeb6qSm1kLU8n3Zqg398764h5)
    > -   [Azure RMS Document Tracking and Revocation](https://channel9.msdn.com/Series/Information-Protection/Azure-RMS-Document-Tracking-and-Revocation)

-   **Administrator information**
    
    Some applications automatically apply information protection, by using policies and settings that administrators configure. For these applications, you might need to provide instructions for other administrators who manage these applications and services. 
    
    For more information, see [How applications support the Azure Rights Management service](applications-support.md) and [Configuring applications for the Azure Rights Management service](configure-applications.md).
    
-   **Help desk information**
    
    If users have the Azure Information Protection client, help desk operators can ask them to use the **Help and Feedback** option for information such as whether the edition of Office is unable to support protection, and the currently signed in user account. You can also use this option to collect log files and reset the client. For more information, see the admin guide: [Install checks and troubleshooting](./rms-client/client-admin-guide.md#installation-checks-and-troubleshooting).
    
    If there are legitimate requests to have full rights access to protected documents, make sure the help desk has processes to request this access by using the Azure Rights Management [super user feature](configure-super-users.md). For example, these requests might be from the legal department or a manager after an employee has left the organization.
    
    In  addition, some of the typical problems that users might report include the following categories:
    
    - **Sign in help**
        
        Users might be prompted for credentials when the Azure Rights Management service needs to authenticate a user and cannot use cached credentials. The required credentials are usually for the user’s work or school account and password that is associated with your Office 365 tenant or Azure Active Directory tenant. Although the Azure Rights Management service can authenticate Azure AD accounts, some applications can also open protected content when a Microsoft account is used for authentication. [More information](secure-collaboration-documents.md#supported-scenarios-for-opening-protected-documents) 
        
        Provide users and your help desk with instructions about which account to use when users are prompted for credentials when they have applications that use the Azure Rights Management service.
        
    - **Problems protecting or consuming content**
        
        Make sure that users have the appropriate instructions for the applications that they use, and that they use applications and devices that are supported by the Azure Rights Management service. For more information about supported applications and devices, see [Requirements for Azure Rights Management](requirements.md).
        
        To confirm that a specific user or group can be authorized by Azure Active Directory to protect or consume protected content, use the verification checks in [Preparing users and groups for Azure Information Protection](prepare.md).
        
        If users report that they can open protected content but they don't have the rights that they need, the problem might be that the user is not in the correct group that's configured for a Rights Management template. Or, the problem might be that the [template needs reconfiguring](configure-policy-templates.md) for the user or group. 
        
        If the rights that users have are not as expected, check the description of the rights and any application-specific implementation from the [usage rights table](configure-usage-rights.md#usage-rights-and-descriptions).

Use the following sections for application-specific information to help users protect documents and emails.

## Using information protection with the Azure Information Protection client

If users have Office 2010, the Azure Information Protection client (or the older application, RMS sharing application) is required to protect and consume protected documents and emails. However, the Azure Information Protection client is also recommended for all computers and mobile devices that support this service.

In addition to making it easier for users to protect documents and emails, the Azure Information Protection client lets users track the documents that they have protected. Tracked documents can also be revoked if the previously authorized users should no longer have access to them.

For instructions to use this client for Windows computers, see the [Azure Information Protection client user guide](./rms-client/client-user-guide.md).


## Using information protection with Office 365, Office 2019, Office 2016, or Office 2013
If you are using the Azure Rights Management service and have not installed the Azure Information Protection client, users do not see the Azure Information Protection bar in their Office desktop apps. They also don't see the **Protect** button on the ribbon, or **Classify and protect** from File Explorer. These additions make it easier for users to protect documents and emails. For these users, they must follow instructions similar to the steps that follow.

> [!TIP]
> To find application-specific help and instructions for using information protection with these applications, search for **IRM** and the application name and version.

#### To protect a document in Word from Office 365 ProPlus

1.  Within Microsoft Word, create a document.

2.  From the **File** menu: **Info** > **Protect Document** >  **Restrict Access**.

3. Choose a template to quickly apply the appropriate usage rights, or select **Restrict Access** and select the usage rights yourself.

    > [!NOTE]
    > If you have not previously used Rights Management on your computer, the **Restrict Access** option connects to the Azure Rights Management service and you are prompted for credentials to configure the Office IRM client. You can then choose a template or usage rights.

3.  Save the document.

When others open the document, they are first authenticated. If they are not authorized to open the document, the document does not open. If they are authorized to open the document, it opens with the restricted [usage rights](configure-usage-rights.md) that were specified for that user. 

For example, a usage right of View-only does not allow the user to edit or save the document, even if it is first copied to another location. 

The usage rights are displayed at the top of the document by using a restriction banner. The banner might display the permissions that are applied to the document, or it might provide a link to display them.

#### To protect an email message using Outlook from Office 365 ProPlus, connecting to Exchange Online

1.  Within Outlook, create a mail message that is addressed to a recipient within your organization.

2.  From the **OPTIONS** tab: **Permission** > Select an option. For example: **Do Not Forward**, or **\<Company Name>- Confidential**, or **\<Company Name> - Confidential View Only**.

3.  Send the message.

Similarly to viewing a protected document, when the recipients open the protected email message, they are first authenticated. If they are authorized to see the email message, it opens with the restricted [usage rights](configure-usage-rights.md) that were specified for that user. 

For example, if the email message is protected by using the **Do Not Forward** option, the Forward button on the ribbon is not available.

#### To protect an email message using Outlook on the web

1. Using Outlook on the web, create a mail message addressed to a recipient within your organization.

2. Select **Protect**. Unless the default has been changed by an administrator, the **Do Not Forward** option is automatically selected. If you want to change the default, select **Change Permissions** and then select an option from the drop down. For example: **Encrypt** or **\<Company Name>- Confidential**.

3. Send the message.

Similarly to viewing a protected document, when the recipients open the email message, they are first authenticated. If they are authorized to see the email message, it opens with the restricted [usage rights](configure-usage-rights.md) that were specified for that user. 

For example, with the default **Do Not Forward** option, the **Forward** option in the message window is not available.
