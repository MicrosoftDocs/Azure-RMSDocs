---
title: Configuring Custom Templates for Azure Rights Management
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 1775d8d0-9a59-42c8-914f-ce285b71ac1c
author: Cabailey
---
# Configuring Custom Templates for Azure Rights Management
After you have activated Azure Rights Management (Azure RMS), users are automatically able to use two default templates that make it easy for them to apply policies to sensitive files that restrict access to authorized users in your organization. These two templates have the following rights policy restrictions:

-   Read-only viewing for the protected content

    -   Display name: **&lt;organization name&gt; - Confidential View Only**

    -   Specific permission: View Content

-   Read or Modify permissions for the protected content

    -   Display name: **&lt;organization name&gt; - Confidential**

    -   Specific permissions: View Content, Save File, Edit Content, View Assigned Rights, Allow Macros, Forward, Reply, Reply All

In addition, the [RMS sharing application](http://technet.microsoft.com/library/dn339006.aspx) lets users define their own set of permissions. And, for the Outlook client and Outlook Web Access, users can select the **Do Not Forward** option for email messages.

For many organizations, the default templates might be sufficient. But if you want to create your own custom rights policy templates, you can do so. Reasons for creating a custom template include the following:

-   You want a template to grant rights to a subset of users in the organization rather than all users.

-   You want only a subset of users to be able to see and select a template (departmental template) from applications, rather than all users in the organization see and can select the template.

-   You want to define a custom right for a template, such as View and Edit, but not Copy and Print.

-   You want to configure additional options in a template that include an expiration date and whether the content can be accessed without an Internet connection.

For users to be able to select a custom template that contains settings such as these, you must first create a custom template, configure it, and then publish it.

Use the following sections to help you configure and use custom templates:

-   [How to create, configure, and publish a custom template](../Topic/Configuring-Custom-Templates-for-Azure-Rights-Management.md#BKMK_HowToConfigureCustomTemplates)

-   [How to copy a template](../Topic/Configuring-Custom-Templates-for-Azure-Rights-Management.md#BKMK_HowToCopyTemplates)

-   [How to remove (archive) templates](../Topic/Configuring-Custom-Templates-for-Azure-Rights-Management.md#BKMK_HowToArchiveTemplates)

-   [Refreshing templates for users](../Topic/Configuring-Custom-Templates-for-Azure-Rights-Management.md#BKMK_RefreshingTemplates)

-   [Windows PowerShell reference](../Topic/Configuring-Custom-Templates-for-Azure-Rights-Management.md#BKMK_PowerShellTemplates)

## <a name="BKMK_HowToConfigureCustomTemplates"></a>How to create, configure, and publish a custom template
You create and manage custom templates in the Azure classic portal. You can do this directly from the Azure classic portal, or you can sign in to the Office 365 admin center, and choose the **advanced features** for Rights Management, which then redirects you to the Azure classic portal.

Use the following procedures to create, configure, and publish custom templates for Rights Management.

#### To create a custom template

1.  Depending on whether you sign in to the Office 365 admin center, or the Azure classic portal, do one of the following:

    -   From the [Office 365 admin center](https://portal.office.com/):

        1.  In the left pane, click **service settings**.

        2.  From the **service settings** page, click **rights management**.

        3.  In the **Protect your information** section, click **Manage**.

        4.  In the **rights management** section, click **advanced features**.

            > [!NOTE]
            > If you haven’t activated Rights Management, first click **activate** and confirm your action. For more information, see [Activating Azure Rights Management](../Topic/Activating-Azure-Rights-Management.md).
            > 
            > If you haven’t clicked **advanced features** before, after Rights Management is activated, follow the on-screen instructions to get a free Azure subscription that’s required to access the Azure classic portal.

            Clicking **advanced features** loads the Azure classic portal, where you can manage **RIGHTS MANAGEMENT** for your organization's Azure Active Directory.

    -   From the [Azure classic portal](http://go.microsoft.com/fwlink/p/?LinkID=275081):

        1.  In the left pane, click **ACTIVE DIRECTORY**.

        2.  From the **active directory** page, click **RIGHTS MANAGEMENT**.

        3.  Select the directory to manage for Rights Management.

        4.  If you have not already activated Rights Management, click **ACTIVATE** and confirm your action.

            > [!NOTE]
            > For more information, see [Activating Azure Rights Management](../Topic/Activating-Azure-Rights-Management.md).

2.  Create a new template:

    -   In the Azure classic portal, from the **Get started with Rights Management** quick start page, click **Create a new rights policy template**.

        If you do not immediately see this page after following the instructions for Office 365, use the navigation instructions, above,  for the Azure classic portal.

3.  On the **Add a new rights policy template** page, choose a language in which you will type the template name and description that users will see (you can add more languages later). Then type a unique name and a description, and click the Complete button.

From the **Get started with Rights Management** quick start page, now click **Manage your rights policy templates**. You will see your newly created template added to the list of templates, with a status of **Archived**. At this stage, the template is created but not configured, and is not visible to users.

#### To configure and publish a custom template

1.  Select your newly created template from the **TEMPLATES** page in the Azure classic portal.

2.  From the **Your template has been added** quick start page, click **Get started** from step 1, **Configure rights for users and groups,** then click **GET STARTED NOW** or **ADD**, and then select the users and groups who will have rights to use the content that is protected by the new template.

    > [!NOTE]
    > The users or groups that you select must have an email address. In a production environment, this will nearly always be the case but in a simple testing environment, you might need to add email addresses to user accounts or groups.

    As a best practice, use groups rather than users, which simplifies management of the templates. If you have Active Directory on-premises and are synchronizing to Azure AD, you can use mail-enabled groups that are either security groups or distribution groups. However, if you want to grant rights to all users in the organization, it will be more efficient to copy one of the default templates rather than specify multiple groups. For more information, see the [How to copy a template](../Topic/Configuring-Custom-Templates-for-Azure-Rights-Management.md#BKMK_HowToCopyTemplates) section in this topic.

    > [!TIP]
    > You can later add users from outside your organization to the template by using the [Windows PowerShell module for Azure Rights Management](https://technet.microsoft.com/library/jj585012.aspx) and using one of the following methods:
    > 
    > -   **Use a rights definition object to update a template**:    Specify the external email addresses and their rights in a rights definition object, which you then use to update your template. You specify the rights definition object by using the [New-AadrmRightsDefinition](https://msdn.microsoft.com/library/azure/dn727080.aspx) cmdlet to create a variable and then supply this variable to the  -RightsDefinition parameter with the [Set-AadrmTemplateProperty](https://msdn.microsoft.com/library/azure/dn727076.aspx) cmdlet to modify an existing template. However, if you're adding these users to an existing template, you will also need to define rights definition objects for the existing groups in the templates and not just the new, external users.
    > -   **Export, edit, and import the updated template**:Use the [Export-AadrmTemplate](https://msdn.microsoft.com/library/azure/dn727078.aspx) cmdlet to export the template to a file that you can edit to add the external email addresses of these users and their rights to the existing groups and rights. Then use the [Import-AadrmTemplate](https://msdn.microsoft.com/library/azure/dn727077.aspx) cmdlet to import this change back into Azure RMS.

3.  Click the Next button, and then assign one of the listed rights to your selected users and groups.

    Use the displayed description for more information about each right (and for custom rights). More detailed  information is also available in [Configuring Usage Rights for Azure Rights Management](../Topic/Configuring-Usage-Rights-for-Azure-Rights-Management.md). However, applications that support RMS might vary in how they implement these rights. Consult their documentation and do your own testing with the applications that users use to check the behavior before you deploy the template for users. To make this template visible to only administrators for this testing, make this template a departmental template (step 6).

4.  If you selected **Custom**, click the Next button, and then select those custom rights.

    Although you can use any combination of the individual rights available, in some applications, some rights might have dependencies on other individual rights. When this is the case, the dependent rights are automatically selected for you.

    > [!TIP]
    > Consider adding the **Copy and Extract Content** right and grant this to selected administrators or personnel in other roles that have responsibilities for information recovery. Granting this right lets them remove protection if needed, from files and emails that will be protected by using this template. This ability to remove protection at the template level provides more fine-grained control than using the super user feature.

5.  Click the Complete button.

6.  If you want the template to be visible to only a subset of users when they see a list of templates in applications: Click **SCOPE** to configure this as a departmental template, and click **GET STARTED NOW**. Otherwise, go to step 9.

    More information about departmental templates: By default, all users in your Azure directory see all the published templates and they can then select them from applications when they want to protect content. If you want specific users only to see some of the published templates, you must scope the templates to these users. Then, only these users will be able to select these templates. Other users that you do not specify will not see the templates and therefore, cannot select them. This technique can make choosing the correct template easier for users, especially when you create templates that are designed to be used by specific groups or departments. Users then see only the templates that are designed for them.

    For example, you’ve created a template for the Human Resources department that applies the Read-only permission to members of the Finance department. So that only members of the Human Resources department can apply this template when they use the Rights Management sharing application, you scope the template to the email-enabled group named HumanResources. Then, only members of this group see and can apply this template.

7.  On the **TEMPLATE VISIBILITY** page, select the users and groups who will be able to see and select the template from the RMS-enlightened applications. As before, as a best practice, use groups rather than users, and the groups or users you select must have an email address.

8.  Click the Next button, and decide whether you need to configure application compatibility for your departmental template. If you do, click **APPLICATION COMPATIBILITY**, select the check box, and click **Complete**.

    Why might you need to configure application compatibility? Not all applications can support departmental templates. To do so, the application must first authenticate with the RMS service before downloading the templates. If the authentication process does not occur, by default, none of the departmental templates are downloaded. You can override this behavior by specifying that all the departmental templates should download, by configuring application compatibility and selecting the **Show this template to all users when the applications do not support user identity** check box.

    For example, if you do not configure application compatibility for the departmental template in our Human Resources example, only users in the Human Resources department see the departmental template when they use the RMS sharing application, but no users see the departmental template when they use Outlook Web Access (OWA) from Exchange Server 2013 because Exchange OWA and Exchange ActiveSync do not currently support departmental templates. If you override this default behavior by configuring application compatibility, only users in the Human Resources department see the departmental template when they use the RMS sharing application, but all users see the departmental template when they use Outlook Web Access (OWA). If users use OWA or Exchange ActiveSync from Exchange Online, either all users will see the departmental templates or no users will see the department templates, based on the template status (archival or published) in Exchange Online.

    Office 2016 natively supports departmental templates, and so does Office 2013 with the latest  Office updates ([KB 3054853](https://support.microsoft.com/kb/3054853)).

    > [!NOTE]
    > If you have applications that don’t yet natively support departmental templates, you can use a custom RMS template download script or other tools to deploy these templates to the local RMS client folder. Then, these applications will correctly display the departmental templates to only the users and groups that you selected for the template scope:
    > 
    > -   For Office 2010, the client folder is **%localappdata%\Microsoft\DRM\Templates**.
    > -   From a client computer that has downloaded all the templates, you can copy and then paste the template files to other computers.
    > 
    > You can [download the custom RMS template script from the Microsoft Connect site](http://go.microsoft.com/fwlink/?LinkId=524506). If you see an error when you click this link, you probably haven't registered on Microsoft Connect.   To register:
    > 
    > 1.  Go to the [Microsoft Connect site](http://www.connect.microsoft.com) and sign in with your Microsoft Account.
    > 2.  Click **Directory**, and select the **View Connect products currently not accepting feedback** category.
    > 3.  Search for **Rights Management Services**, and for the **Microsoft RMS Enterprise Features** program, click **Join**.

9. Click **CONFIGURE** and add additional languages that users use, together with the name and description of this template in that language. When you have multi-language users, it’s important to add each language that they use, and supply a name and description in that language. Users will then see the name and description of the template in the same language as their client operating system, which ensures they understand the policy applied to a document or email message. If there is no match with their client operating system, the name and description that they see falls back to the language and description that you defined when you first created the template.

    Then check whether you want to make any changes to the following settings:

    |Setting|More information|
    |-----------|--------------------|
    |**content expiration**|Define a date or number of days for this template when files that are protected by the template should not open. You can specify a date or specify a number of days starting from the time that the protection is applied to the file.<br /><br />When you specify a date, it is effective midnight, in your current time zone.|
    |**offline access**|Use this setting to balance any security requirements that you have against the requirement that users must be able to open protected files when they don’t have an Internet connection.<br /><br />If you specify that content is not available without an Internet connection or that content is only available for a specified number of days, when that threshold is reached, users must be re-authenticated and their access is logged. When this happens, if their credentials are not cached, users are prompted to sign in before they can open the file.<br /><br />In addition to re-authentication, the policy and the user group membership is re-evaluated. This means that users could experience different access results for the same file if there are changes in the policy or group membership from when they last accessed the file.|

10. When you are confident that the template is configured appropriately for your users, click **PUBLISH** to make the template visible for users, and then click **SAVE**.

11. Click the Back button in the classic portal to return to the **TEMPLATES** page, where your template now has an updated status of **Published**.

To make any changes to your template, select it, and then use the quick start steps again. Or, select one of the following options:

-   To add more users and groups, and define the rights for those users and groups: Click **RIGHTS**, then click **ADD**.

-   To remove users or groups that you previously selected: Click **RIGHTS**, select the user or group from the list, and then click **DELETE**.

-   To change which users can see the templates to select them from applications: Click **SCOPE**, then click **ADD** or **DELETE**, or **APPLICATION COMPATIBILITY**.

-   To make the template no longer visible to all users: Click **CONFIGURE**, click **ARCHIVE**, and then click **SAVE**.

-   To make other configuration changes: Click **CONFIGURE**, make your changes, and then click **SAVE**.

> [!WARNING]
> When you make changes to a template that was previously saved, clients will not see those changes to the template until templates are refreshed on their computers. For more information, see the [Refreshing templates for users](../Topic/Configuring-Custom-Templates-for-Azure-Rights-Management.md#BKMK_RefreshingTemplates) section in this topic.

## <a name="BKMK_HowToCopyTemplates"></a>How to copy a template
If you want to create a new template that has very similar settings to an existing template, select the original template on the **TEMPLATES** page, click **COPY**, specify a unique name, and make the changes that you need.

> [!IMPORTANT]
> When you copy a template, the **Published** or **Archived** status is also copied. So if you copy a published template, its immediate status will be published, unless you change it.

You can copy custom templates and the default templates. As a best practice, copy one of the default templates instead of creating a new custom template if you want the template to grant rights to all users in your organization. This method means that you don’t have to create or select multiple groups to specify all users. In this scenario however, be sure to specify a new name and description for the copied template for additional languages.

## <a name="BKMK_HowToArchiveTemplates"></a>How to remove (archive) templates
The default templates cannot be deleted, but they can be archived so that users do not see them.

Similarly, if you have published a custom template and no longer want users to be able to see it, you can edit the template and choose **ARCHIVE** and **SAVE** from the **CONFIGURE** page. Or, you can select it from the **TEMPLATES** page and select **ARCHIVE**.

Because you cannot edit the default templates, to archive these templates, you must use the **ARCHIVE** option from the **TEMPLATES** page. You cannot archive the Outlook **Do Not Forward** option.

#### To remove a default template

-   From the **TEMPLATES** page, select the default template, and click **ARCHIVE**.

The status changes from **Published** to **Archived**. If you change your mind, select the template and click **PUBLISH**.

## <a name="BKMK_RefreshingTemplates"></a>Refreshing templates for users
When you use Azure RMS, templates are automatically downloaded to client computers so that users can select them from their applications. However, you might need to take additional steps if you make changes to the templates:

|Application or service|How templates are refreshed after changes|
|--------------------------|---------------------------------------------|
|Exchange Online|Manual configuration required to refresh templates.<br /><br />For the configuration steps, expand the following section, [Exchange Online only: How to configure Exchange to download changed custom templates](../Topic/Configuring-Custom-Templates-for-Azure-Rights-Management.md#BKMK_ExchangeOnlineTemplatesUpdate).|
|Office 365|Automatically refreshed  – no additional steps required.|
|Office 2016 and Office 2013<br /><br />RMS sharing application for Windows|Automatically refreshed – on a schedule:<br /><br />For these later versions of Office: The default refresh interval  is every 7 days.<br /><br />For the RMS sharing application for Windows: Starting with version 1.0.1784.0, the default refresh interval is every 1 day. Prior versions have a default refresh interval of every 7 days.<br /><br />To force a refresh sooner than this schedule, expand the following section, [Office 2016, Office 2013, and RMS sharing application for Windows: How to force a refresh for a changed custom template](#BKMK_Office2013ForceUpdate).|
|Office 2010|Refreshed when users log on.<br /><br />To force a refresh, ask or force users to log off and log back on again. Or, see the following section, [Office 2010 only: How to force a refresh for a changed custom template](#BKMK_Office2010ForceUpdate).|
For mobile devices that use the RMS sharing application, templates are automatically downloaded (and refreshed if necessary) without additional configuration required.

### <a name="BKMK_ExchangeOnlineTemplatesUpdate"></a>Exchange Online only: How to configure Exchange to download changed custom templates
If you have already configured Information Rights Management (IRM) for Exchange Online, custom templates will not download for users until you make the following changes by using Windows PowerShell in Exchange Online.

> [!NOTE]
> For more information about how to use Windows PowerShell in Exchange Online, see [Using PowerShell with Exchange Online](https://technet.microsoft.com/library/jj200677%28v=exchg.160%29.aspx).

You must do this procedure each time you change a template.

##### To update templates for Exchange Online

1.  Using Windows PowerShell in Exchange Online, connect to the service:

    1.  Supply your Office 365 user name and password:

        ```
        $Cred = Get-Credential
        ```

    2.  Connect to the Exchange Online service by running the following two commands:

        ```
        $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $Cred -Authentication Basic –AllowRedirection
        ```

        ```
        Import-PSSession $Session
        ```

2.  Use the [Import-RMSTrustedPublishingDomain](http://technet.microsoft.com/library/jj200724%28v=exchg.160%29.aspx) cmdlet to re-import your trusted publishing domain (TPD) from Azure RMS:

    ```
    Import-RMSTrustedPublishingDomain -Name "<TPD name>" -RefreshTemplates -RMSOnline
    ```
    For example, if your TPD name is **RMS Online - 1** (a typical name for many organizations), enter: **Import-RMSTrustedPublishingDomain -Name "RMS Online - 1" -RefreshTemplates -RMSOnline**

    > [!NOTE]
    > To verify your TPD name, you can use the [Get-RMSTrustedPublishingDomain](http://technet.microsoft.com/library/jj200707%28v=exchg.160%29.aspx) cmdlet.

3.  To confirm that the templates have imported successfully, wait a few minutes and then run the [Get-RMSTemplate](http://technet.microsoft.com/library/dd297960%28v=exchg.160%29.aspx) cmdlet and set the Type to All. For example:

    ```
    Get-RMSTemplate -TrustedPublishingDomain "RMS Online - 1" -Type All
    ```
    > [!TIP]
    > It's useful to keep a copy of the output so that you can easily copy the template names or GUIDs if you later archive a template.

4.  For each imported template that you want to be available in the Outlook Web App, you must use the [Set-RMSTemplate](http://technet.microsoft.com/library/hh529923%28v=exchg.160%29.aspx) cmdlet and set the Type to Distributed:

    ```
    Set-RMSTemplate -Identity "<name  or GUID of the template>" -Type Distributed
    ```
    Because Outlook Web Access caches the UI for 24 hours, users might not see the new template for up to a day.

In addition, if you archive a template (custom or default) and use Exchange Online with Office 365, users will continue to see the archived templates if they use the Outlook Web App or mobile devices that use the Exchange ActiveSync Protocol.

So that users no longer see these templates, connect to the service by using Windows PowerShell in Exchange Online, and then use the [Set-RMSTemplate](http://technet.microsoft.com/library/hh529923%28v=exchg.160%29.aspx) cmdlet by running the following command:

```
Set-RMSTemplate -Identity "<name or GUID of the template>" -Type Archived
```

### <a name="BKMK_Office2013ForceUpdate"></a>Office 2016,  Office 2013, and RMS sharing application for Windows: How to force a refresh for a changed custom template
By editing the registry on the computers running Office 2016, Office 2013, or the Rights Management (RMS) sharing application for Windows, you can change the automatic schedule so that changed templates are refreshed on computers more frequently than their default value. You can also force an immediate refresh by deleting the existing data in a registry value.

> [!WARNING]
> If you use the Registry Editor incorrectly, you might cause serious problems that might require you to reinstall the operating system. Microsoft cannot guarantee that you can solve problems that result from using the Registry Editor incorrectly. Use the Registry Editor at your own risk.

##### To change the automatic schedule

1.  Using a registry editor, create and set one of the following registry values:

    -   To set an update frequency in days (minimum of 1 day):  Create a new registry value named **TemplateUpdateFrequency** and define an integer value for the data, which specifies the frequency in days to download any changes to a downloaded template. Use the following table to locate the registry path to create this new registry value.

        |Registry path|Type|Value|
        |-----------------|--------|---------|
        |HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\MSIPC|REG_DWORD|TemplateUpdateFrequency|

    -   To set an update frequency in seconds (minimum of 1 second):  Create a new registry value named **TemplateUpdateFrequencyInSeconds** and define an integer value for the data, which specifies the frequency in seconds to download any changes to a downloaded template. Use the following table to locate the registry path to create this new registry value.

        |Registry path|Type|Value|
        |-----------------|--------|---------|
        |HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\MSIPC|REG_DWORD|TemplateUpdateFrequencyInSeconds|

    Make sure that you create and set one of these registry values, not both. If both are present, **TemplateUpdateFrequency** is ignored.

2.  If you want to force an immediate refresh of the templates, go to the next procedure. Otherwise, restart your Office applications and instances of File Explorer now.

##### To force an immediate refresh

1.  Using a registry editor, delete the data for the **LastUpdatedTime** value. For example, the data might display **2015-04-20T15:52**; delete 2015-04-20T15:52 so that no data is displayed. Use the following table to locate the registry path to delete this registry value data.

    |Registry path|Type|Value|
    |-----------------|--------|---------|
    |HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\MSIPC\&lt;MicrosoftRMS_FQDN&gt;\Template|REG_SZ|LastUpdatedTime|
    > [!TIP]
    > In the registry path, *&lt;MicrosoftRMS_FQDN&gt;* refers to your Microsoft RMS service FQDN. If you want to verify this value:
    > 
    > 1.  Run the [Get-AadrmConfiguration](https://msdn.microsoft.com/library/windowsazure/dn629410.aspx) cmdlet for Azure RMS. If you haven’t already installed the Windows PowerShell module for Azure RMS, see [Installing Windows PowerShell for Azure Rights Management](../Topic/Installing-Windows-PowerShell-for-Azure-Rights-Management.md).
    > 2.  From the output, identify the **LicensingIntranetDistributionPointUrl** value.
    > 
    >     For example: **LicensingIntranetDistributionPointUrl   : https://5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com/_wmcs/licensing**
    > 3.  From the value, remove **https://** and **/_wmcs/licensing** from this string. The remaining value is your Microsoft RMS service FQDN. In our example, the Microsoft RMS service FQDN would be the following value:
    > 
    >     **5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com**

2.  Delete the following folder and all files it contains: **%localappdata%\Microsoft\MSIPC\Templates**

3.  Restart your Office applications and instances of File Explorer.

### <a name="BKMK_Office2010ForceUpdate"></a>Office 2010 only: How to force a refresh for a changed custom template
By editing the registry on the computers running Office 2010, you can set a value so that changed templates are refreshed on computers without waiting for users to log off and back on. You can also force an immediate refresh by deleting the existing data in a registry value.

> [!WARNING]
> If you use the Registry Editor incorrectly, you might cause serious problems that might require you to reinstall the operating system. Microsoft cannot guarantee that you can solve problems that result from using the Registry Editor incorrectly. Use the Registry Editor at your own risk.

##### To change the update frequency

1.  Using a registry editor, create a new registry value named **UpdateFrequency** and define an integer value for the data, which specifies the frequency in days to download any changes to a downloaded template. Use the following table to locate the registry path to create this new registry value.

    |Registry path|Type|Value|
    |-----------------|--------|---------|
    |HKEY_CURRENT_USER\Software\Microsoft\MSDRM\TemplateManagement|REG_DWORD|UpdateFrequency|

2.  If you want to force an immediate refresh of the templates, go to the next procedure. Otherwise, restart your Office applications now.

##### To force an immediate refresh

1.  Using a registry editor, delete the data for the **LastUpdatedTime** value. For example, the data might display **2015-04-20T15:52**; delete 2015-04-20T15:52 so that no data is displayed. Use the following table to locate the registry path to delete this registry value data.

    |Registry path|Type|Value|
    |-----------------|--------|---------|
    |HKEY_CURRENT_USER\Software\Microsoft\MSDRM\TemplateManagement|REG_SZ|lastUpdatedTime|

2.  Delete the following folder and all files it contains: **%localappdata%\Microsoft\MSIPC\Templates**

3.  Restart your Office applications.

## <a name="BKMK_PowerShellTemplates"></a>Windows PowerShell reference
Everything that you can do in the Azure classic portal to create and manage templates, you can do from the command line, by using Windows PowerShell. In addition, you can export and import templates, so that you can copy templates between tenants or perform bulk edits of complex properties in templates, such as multilingual names and descriptions.

You can also use export and import to back up and restore your custom templates, As a best practice, regularly back up your custom templates, so that if you make a change that was not intended, you can easily revert to a previous version.

> [!IMPORTANT]
> To use Windows PowerShell to create and manage Azure RMS rights policy templates, you must have at least version 2.0.0.0 of the [Windows PowerShell module for Azure RMS](http://go.microsoft.com/fwlink/?LinkId=257721).
> 
> If you have previously installed this Windows PowerShell module, run the following command in a PowerShell window to check the version number: `(Get-Module aadrm -ListAvailable).Version`

For installation instructions, see [Installing Windows PowerShell for Azure Rights Management](../Topic/Installing-Windows-PowerShell-for-Azure-Rights-Management.md).

The cmdlets that support creating and managing templates:

-   [Add-AadrmTemplate](https://msdn.microsoft.com/library/azure/dn727075.aspx)

-   [Export-AadrmTemplate](https://msdn.microsoft.com/library/azure/dn727078.aspx)

-   [Get-AadrmTemplate](https://msdn.microsoft.com/library/azure/dn727079.aspx)

-   [Get-AadrmTemplateProperty](https://msdn.microsoft.com/library/azure/dn727081.aspx)

-   [Import-AadrmTemplate](https://msdn.microsoft.com/library/azure/dn727077.aspx)

-   [New-AadrmRightsDefinition](https://msdn.microsoft.com/library/azure/dn727080.aspx)

-   [Remove-AadrmTemplate](https://msdn.microsoft.com/library/azure/dn727082.aspx)

-   [Set-AadrmTemplateProperty](https://msdn.microsoft.com/library/azure/dn727076.aspx)

## Next steps
After you’ve configured custom templates for Azure Rights Management, use the [Azure Rights Management Deployment Roadmap](../Topic/Azure-Rights-Management-Deployment-Roadmap.md) to check whether there are other configuration steps that you might want to do before you roll out [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] to users and administrators. If there are no other configuration steps that you need to do, see [Using Azure Rights Management](../Topic/Using-Azure-Rights-Management.md) for operational guidance to support a successful deployment for your organization.

## See Also
[Configuring Azure Rights Management](../Topic/Configuring-Azure-Rights-Management.md)

