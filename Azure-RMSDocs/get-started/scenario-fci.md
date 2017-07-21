---
# required metadata

title: AIP Scenario - Protect files on a file server share
description: This scenario and supporting user documentation uses Azure Rights Management protection to bulk-protect all files that you want to protect on a file server to ensure that only employees from your organization can access them, even if they are copied and saved to storage that is not under the control of your IT department, or emailed to others.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 02/23/2017
ms.topic: get-started-article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 283c7db3-5730-439e-a215-40a1088ed506

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Scenario - Protect files on a file server share

>*Applies to: Azure Information Protection, Office 365*

This scenario and supporting user documentation uses the Azure Rights Management technology from Azure Information Protection to bulk-protect all files that you want to protect on a file server to ensure that only employees from your organization can access them, even if they are copied and saved to storage that is not under the control of your IT department, or emailed to others.

These instructions use one of the default templates, which restricts access to all employees with all usage rights. But if required, you can further restrict access and usage rights by configuring a custom template instead of using a default template.

The instructions are suitable for the following set of circumstances:

-   You need to protect all file types and not just Office files. Files that cannot be natively protected by Azure RMS will be generically protected.

-   All files in the specified path (including subfolders) will be protected.

-   All files have protection reapplied on a schedule, to ensure that any changes to the rights policy templates are applied to the protected files.

## Deployment instructions
![Administrator instructions for Azure RMS Rapid Deployment](../media/AzRMS_AdminBanner.png)

Make sure that the following requirements are in place, and then follow the instructions for the supporting procedures before going on to the user documentation.

## Requirements for this scenario
For the instructions for this scenario to work, the following must be in place:

|Requirement|If you need more information|
|---------------|--------------------------------|
|Azure Rights Management is activated|[Activating Azure Rights Management](../deploy-use/activate-service.md)|
|You have synchronized your on-premises Active Directory user accounts with Azure Active Directory or Office 365, including their email address. This is required for all users that might need to access files after they are protected by FCI and Azure Rights Management.|[Preparing for Azure Information Protection](../plan-design/prepare.md)|
|One of the following:<br /><br />- To use a default template for all users: You have not archived the default, &lt;organization name&gt; - Confidential<br /><br />- To use a custom template for specific users: You have created and published this custom template|[Configuring and managing templates in the Azure Information Protection policy](../deploy-use/configure-policy-templates.md)|
|The Rights Management sharing application is deployed to users’ computers that run Windows|[Automatic deployment for the Microsoft Rights Management sharing application](../rms-client/sharing-app-admin-guide.md#automatic-deployment-for-the-microsoft-rights-management-sharing-application)|
|You have downloaded the RMS Protection tool and configured the prerequisites for Azure RMS|For instructions to download the tool and prerequisites: [RMS Protection Cmdlets](https://msdn.microsoft.com/library/mt433195.aspx)<br /><br />To configure additional prerequisites for Azure RMS, such as the service principal account: [about_RMSProtection_AzureRMS](https://msdn.microsoft.com/library/mt433202.aspx)|

### Configuring a file server to protect all files by using Azure RMS and File Server Resource Manager with File Classification Infrastructure

1.  Start a Windows PowerShell session. You do not have to run this session as an administrator.

2.  Authenticate to Azure RMS:

    ```
    Set-RMSServerAuthentication
    ```
    When prompted, supply the values for the service principal account that you created as a prerequisite for the RMS Protection cmdlets.

3.  Run the following to identify the template ID that will be used to protect the files:

    ```
    Get-RMSTemplate
    ```
    To use the default template that restricts access to all employees with all usage rights, look for the template name of **&lt;organization name&gt; - Confidential**. For example, **VanArsdel, Ltd - Confidential**.

4.  Follow the step-by-step instructions in [RMS Protection with Windows Server File Classification Infrastructure (FCI)](../rms-client/configure-fci.md).

    These instructions include a Windows PowerShell script that you specify to run as a custom executable in File Server Resource Manager. The instructions also include how to verify that the files are protected by Azure Rights Management.

## User documentation instructions
If the files you are protecting are Office files only, you might not have to provide users with any instructions about the protected files. When authorized users open these documents, they open as usual in Office, with the only difference being that users might be prompted to authenticate, and they will probably see an information bar at the top of the document that informs them that the document is protected.

If the protected files have a **.ppdf** file name extension or they are a protected text or image file (for example, they have a **.ptxt**  or .**pjpg** file name extension), these files are now read-only and cannot be edited. Users can view them by using the RMS sharing application viewer, which loads automatically for these file types. These files are natively protected by Azure RMS and applies all policy settings from the template that you applied, with the exception of the usage rights, because the file itself is read-only. Unless you know that you will be protecting these file types, it is unlikely that you will need user instructions for this scenario but warn your help desk that they might need to explain to users why these files cannot be edited.

If the protected files have a **.pfile** file name extension, users can view these files but they must be saved to their original file name (remove the .pfile file name extension) if users want to edit and save their changes. These files are generically protected by Azure RMS and cannot enforce the usage rights from the template that you applied, which means that protection is lost if the file is saved with a new name. This scenario will need instructions for users.

Using the following template, copy and paste the instructions for your end users so that they know how to edit generically protected files. Make these modifications to reflect your environment:

-   Replace *&lt;type of file&gt;* and *&lt;file server share&gt;* with the type of file that will be generically protected, and the name of the file server share.

-   Replace *&lt;organization name&gt;* with the name of your organization, as it displays on your default Azure Rights Management templates.

-   Replace *&lt;organization name&gt;* with the name of your organization.

-   Replace *&lt;Instructions how to save the file and remove the .pfile file name extension&gt;* with application-specific instructions for this file type.

-   Replace contact details with instructions for how your users can contact the help desk, such as a website link, email address, or telephone number.

-   Make any additional modifications that you want to this set of instructions, and then sent it to these users.

The example documentation shows how these instructions might look for users, after your customizations.

![Template user documentation for Azure RMS Rapid Deployment](../media/AzRMS_UsersBanner.png)

### How to edit &lt;type of file&gt; from the &lt;file server share&gt;

1.  Double-click the file to open it. You might be prompted for your credentials.

2.  You see a **protected file** dialog box from the Microsoft Rights Management sharing application, which tells you that you are expected to honor the permissions for **&lt;organization name&gt; - Confidential**. This means, do not share this document with other people if they do not work for &lt;organization name&gt;.

3.  Click **Open**.

4.  To edit the file, first save the file and remove the .pfile file name extension:

    -   &lt;Instructions how to save the file and remove the .pfile file name extension&gt;

5.  You can now edit and save file as usual.

Periodically, the file will be protected again, which again adds the .pfile file name extension, and you will have to repeat these steps.

**Need help?**

-   For additional information:

    -   [View and use files that have been protected](../rms-client/sharing-app-view-use-files.md)

-   Contact the help desk:

    -   *&lt;contact details&gt;*

### Example customized user documentation
![Example user documentation for Azure RMS Rapid Deployment](../media/AzRMS_ExampleBanner.png)

#### How to edit CAD drawings from the ProjectNextGen share

1.  Double-click the file to open it. You might be prompted for your credentials.

2.  You see a **protected file** dialog box from the Microsoft Rights Management sharing application, which tells you that you are expected to honor the permissions for **VanArsdel, Ltd - Confidential**. This means, do not share this document with other people if they do not work for VanArsdel, Ltd.

3.  Click **Open**.

4.  To edit the file, first save the file and remove the .pfile file name extension:

    -   **File** &gt; **Save As**

    -   Delete **.pfile** from the end of the file name, and click **OK**.

5.  You can now edit and save file as usual.

Periodically, the file will be protected again, which again adds the .pfile file name extension, and you will have to repeat these steps.

**Need help?**

-   For additional information:

    -   [View and use files that have been protected](../rms-client/sharing-app-view-use-files.md)

-   Contact the help desk: helpdesk@vanarsdelltd.com

[!INCLUDE[Commenting house rules](../includes/houserules.md)]
