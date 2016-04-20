---
# required metadata

title: Create, configure, and publish a custom template | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: d6e9aa0c-1694-4a53-8898-4939f31cc13f

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---


# Create, configure, and publish a custom template

You create and manage custom templates in the Azure classic portal. You can do this directly from the Azure classic portal, or you can sign in to the Office 365 admin center, and choose the **advanced features** for Rights Management, which then redirects you to the Azure classic portal.

Use the following procedures to create, configure, and publish custom templates for Rights Management.

## To create a custom template

1.  Depending on whether you sign in to the Office 365 admin center, or the Azure classic portal, do one of the following:

    -   From the [Office 365 admin center](https://portal.office.com/):

        1.  In the left pane, click **service settings**.

        2.  From the **service settings** page, click **rights management**.

        3.  In the **Protect your information** section, click **Manage**.

        4.  In the **rights management** section, click **advanced features**.

            > [!NOTE]
            > If you haven't activated Rights Management, first click **activate** and confirm your action. For more information, see [Activating Azure Rights Management](activate-service.md).
            > 
            > If you haven't clicked **advanced features** before, after Rights Management is activated, follow the on-screen instructions to get a free Azure subscription that's required to access the Azure classic portal.

            Clicking **advanced features** loads the Azure classic portal, where you can manage **RIGHTS MANAGEMENT** for your organization's Azure Active Directory.

    -   From the [Azure classic portal](http://go.microsoft.com/fwlink/p/?LinkID=275081):

        1.  In the left pane, click **ACTIVE DIRECTORY**.

        2.  From the **active directory** page, click **RIGHTS MANAGEMENT**.

        3.  Select the directory to manage for Rights Management.

        4.  If you have not already activated Rights Management, click **ACTIVATE** and confirm your action.

            > [!NOTE]
            > For more information, see [Activating Azure Rights Management](activate-service.md).

2.  Create a new template:

    -   In the Azure classic portal, from the **Get started with Rights Management** quick start page, click **Create a new rights policy template**.

        If you do not immediately see this page after following the instructions for Office 365, use the navigation instructions, above,  for the Azure classic portal.

3.  On the **Add a new rights policy template** page, choose a language in which you will type the template name and description that users will see (you can add more languages later). Then type a unique name and a description, and click the Complete button.

From the **Get started with Rights Management** quick start page, now click **Manage your rights policy templates**. You will see your newly created template added to the list of templates, with a status of **Archived**. At this stage, the template is created but not configured, and is not visible to users.

## To configure and publish a custom template

1.  Select your newly created template from the **TEMPLATES** page in the Azure classic portal.

2.  From the **Your template has been added** quick start page, click **Get started** from step 1, **Configure rights for users and groups,** then click **GET STARTED NOW** or **ADD**, and then select the users and groups who will have rights to use the content that is protected by the new template.

    > [!NOTE]
    > The users or groups that you select must have an email address. In a production environment, this will nearly always be the case but in a simple testing environment, you might need to add email addresses to user accounts or groups.

    As a best practice, use groups rather than users, which simplifies management of the templates. If you have Active Directory on-premises and are synchronizing to Azure AD, you can use mail-enabled groups that are either security groups or distribution groups. However, if you want to grant rights to all users in the organization, it will be more efficient to copy one of the default templates rather than specify multiple groups. For more information, see the [How to copy a template](copy-template.md).

    > [!TIP]
    > You can later add users from outside your organization to the template by using the [Windows PowerShell module for Azure Rights Management](install-powershell.md) and using one of the following methods:
    > 
    > -   **Use a rights definition object to update a template**:    Specify the external email addresses and their rights in a rights definition object, which you then use to update your template. You specify the rights definition object by using the [New-AadrmRightsDefinition](https://msdn.microsoft.com/library/azure/dn727080.aspx) cmdlet to create a variable and then supply this variable to the  -RightsDefinition parameter with the [Set-AadrmTemplateProperty](https://msdn.microsoft.com/library/azure/dn727076.aspx) cmdlet to modify an existing template. However, if you're adding these users to an existing template, you will also need to define rights definition objects for the existing groups in the templates and not just the new, external users.
    > -   **Export, edit, and import the updated template**:Use the [Export-AadrmTemplate](https://msdn.microsoft.com/library/azure/dn727078.aspx) cmdlet to export the template to a file that you can edit to add the external email addresses of these users and their rights to the existing groups and rights. Then use the [Import-AadrmTemplate](https://msdn.microsoft.com/library/azure/dn727077.aspx) cmdlet to import this change back into Azure RMS.

3.  Click the Next button, and then assign one of the listed rights to your selected users and groups.

    Use the displayed description for more information about each right (and for custom rights). More detailed  information is also available in [Configuring usage rights for Azure Rights Management](configure-usage-rights.md). However, applications that support RMS might vary in how they implement these rights. Consult their documentation and do your own testing with the applications that users use to check the behavior before you deploy the template for users. To make this template visible to only administrators for this testing, make this template a departmental template (step 6).

4.  If you selected **Custom**, click the Next button, and then select those custom rights.

    Although you can use any combination of the individual rights available, in some applications, some rights might have dependencies on other individual rights. When this is the case, the dependent rights are automatically selected for you.

    > [!TIP]
    > Consider adding the **Copy and Extract Content** right and grant this to selected administrators or personnel in other roles that have responsibilities for information recovery. Granting this right lets them remove protection if needed, from files and emails that will be protected by using this template. This ability to remove protection at the template level provides more fine-grained control than using the super user feature.

5.  Click the Complete button.

6.  If you want the template to be visible to only a subset of users when they see a list of templates in applications: Click **SCOPE** to configure this as a departmental template, and click **GET STARTED NOW**. Otherwise, go to step 9.

    More information about departmental templates: By default, all users in your Azure directory see all the published templates and they can then select them from applications when they want to protect content. If you want specific users only to see some of the published templates, you must scope the templates to these users. Then, only these users will be able to select these templates. Other users that you do not specify will not see the templates and therefore, cannot select them. This technique can make choosing the correct template easier for users, especially when you create templates that are designed to be used by specific groups or departments. Users then see only the templates that are designed for them.

    For example, you've created a template for the Human Resources department that applies the Read-only permission to members of the Finance department. So that only members of the Human Resources department can apply this template when they use the Rights Management sharing application, you scope the template to the email-enabled group named HumanResources. Then, only members of this group see and can apply this template.

7.  On the **TEMPLATE VISIBILITY** page, select the users and groups who will be able to see and select the template from the RMS-enlightened applications. As before, as a best practice, use groups rather than users, and the groups or users you select must have an email address.

8.  Click the Next button, and decide whether you need to configure application compatibility for your departmental template. If you do, click **APPLICATION COMPATIBILITY**, select the check box, and click **Complete**.

    Why might you need to configure application compatibility? Not all applications can support departmental templates. To do so, the application must first authenticate with the RMS service before downloading the templates. If the authentication process does not occur, by default, none of the departmental templates are downloaded. You can override this behavior by specifying that all the departmental templates should download, by configuring application compatibility and selecting the **Show this template to all users when the applications do not support user identity** check box.

    For example, if you do not configure application compatibility for the departmental template in our Human Resources example, only users in the Human Resources department see the departmental template when they use the RMS sharing application, but no users see the departmental template when they use Outlook Web Access (OWA) from Exchange Server 2013 because Exchange OWA and Exchange ActiveSync do not currently support departmental templates. If you override this default behavior by configuring application compatibility, only users in the Human Resources department see the departmental template when they use the RMS sharing application, but all users see the departmental template when they use Outlook Web Access (OWA). If users use OWA or Exchange ActiveSync from Exchange Online, either all users will see the departmental templates or no users will see the department templates, based on the template status (archival or published) in Exchange Online.

    Office 2016 natively supports departmental templates, and so does Office 2013 starting with version 15.0.4727.1000, released in June 2015 as part of ([KB 3054853](https://support.microsoft.com/kb/3054853)).

    > [!NOTE]
    > If you have applications that don't yet natively support departmental templates, you can use a custom RMS template download script or other tools to deploy these templates to the local RMS client folder. Then, these applications will correctly display the departmental templates to only the users and groups that you selected for the template scope:
    > 
    > -   For Office 2010, the client folder is **%localappdata%\Microsoft\DRM\Templates**.
    > -   From a client computer that has downloaded all the templates, you can copy and then paste the template files to other computers.
    > 
    > You can [download the custom RMS template script from the Microsoft Connect site](http://go.microsoft.com/fwlink/?LinkId=524506). If you see an error when you click this link, you probably haven't registered on Microsoft Connect.   To register:
    > 
    > 1.  Go to the [Microsoft Connect site](http://www.connect.microsoft.com) and sign in with your Microsoft Account.
    > 2.  Click **Directory**, and select the **View Connect products currently not accepting feedback** category.
    > 3.  Search for **Rights Management Services**, and for the **Microsoft RMS Enterprise Features** program, click **Join**.

9. Click **CONFIGURE** and add additional languages that users use, together with the name and description of this template in that language. When you have multi-language users, it's important to add each language that they use, and supply a name and description in that language. Users will then see the name and description of the template in the same language as their client operating system, which ensures they understand the policy applied to a document or email message. If there is no match with their client operating system, the name and description that they see falls back to the language and description that you defined when you first created the template.

    Then check whether you want to make any changes to the following settings:

    |Setting|More information|
    |-----------|--------------------|
    |**content expiration**|Define a date or number of days for this template when files that are protected by the template should not open. You can specify a date or specify a number of days starting from the time that the protection is applied to the file.<br /><br />When you specify a date, it is effective midnight, in your current time zone.|
    |**offline access**|Use this setting to balance any security requirements that you have against the requirement that users must be able to open protected files when they don't have an Internet connection.<br /><br />If you specify that content is not available without an Internet connection or that content is only available for a specified number of days, when that threshold is reached, users must be re-authenticated and their access is logged. When this happens, if their credentials are not cached, users are prompted to sign in before they can open the file.<br /><br />In addition to re-authentication, the policy and the user group membership is re-evaluated. This means that users could experience different access results for the same file if there are changes in the policy or group membership from when they last accessed the file.|

10. When you are confident that the template is configured appropriately for your users, click **PUBLISH** to make the template visible for users, and then click **SAVE**.

11. Click the Back button in the classic portal to return to the **TEMPLATES** page, where your template now has an updated status of **Published**.

To make any changes to your template, select it, and then use the quick start steps again. Or, select one of the following options:

-   To add more users and groups, and define the rights for those users and groups: Click **RIGHTS**, then click **ADD**.

-   To remove users or groups that you previously selected: Click **RIGHTS**, select the user or group from the list, and then click **DELETE**.

-   To change which users can see the templates to select them from applications: Click **SCOPE**, then click **ADD** or **DELETE**, or **APPLICATION COMPATIBILITY**.

-   To make the template no longer visible to all users: Click **CONFIGURE**, click **ARCHIVE**, and then click **SAVE**.

-   To make other configuration changes: Click **CONFIGURE**, make your changes, and then click **SAVE**.

> [!WARNING]
> When you make changes to a template that was previously saved, clients will not see those changes to the template until templates are refreshed on their computers. For more information, see the [Refreshing templates for users](refresh-templates.md).

## See Also
[Configure Custom Templates for Azure Rights Management](configure-custom-templates.md)