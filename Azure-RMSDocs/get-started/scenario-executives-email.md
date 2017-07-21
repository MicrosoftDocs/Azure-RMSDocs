---
# required metadata

title: AIP Scenario - Executives exchange privileged information
description: This scenario and supporting user documentation uses Azure Rights Management protection so that executives can safely exchange emails and attachments by email with one another and policies automatically restrict access to the executives without requiring special action from them. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 02/23/2017
ms.topic: get-started-article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: e18cf5df-859e-4028-8d19-39b0842df33d

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Scenario - Executives securely exchange privileged information

>*Applies to: Azure Information Protection, Office 365*

This scenario and supporting user documentation uses the Azure Rights Management technology from Azure Information Protection, so that executives can safely exchange emails and attachments by email with one another and policies automatically restrict access to the executives without requiring special action from them. The emails and any attachments will be automatically protected by Azure Rights Management.

If required, you can add an exception to the rule, such as the abbreviation of DNP (for "Do Not Protect") in the email message subject, so that executives can specify this if they need to send an unprotected email to other executives-for example, to review before forwarding to others.

The instructions are suitable for the following set of circumstances:

-   Executives share confidential information with one another that should not be shared with others.

-   Executives do not need to do anything different when they send these emails other than send them to a work email address rather than a personal email address.

-   Executives have a way to override the rule themselves if they ever need to send an unprotected email message to other executives.

## Deployment Instructions
![Administrator instructions for Azure RMS Rapid Deployment](../media/AzRMS_AdminBanner.png)

Make sure that the following requirements are in place, and then follow the instructions for the supporting procedures before going on to the user documentation.

## Requirements for this scenario
For the instructions for this scenario to work, the following must be in place:

|Requirement|If you need more information|
|---------------|--------------------------------|
|You have prepared accounts and groups for Office 365 or Azure Active Directory:<br /><br />- A mail-enabled group named **Executives**, and all executives are members of this group<br /><br />- A mail-enabled group named **RMS administrators**, and all administrators that will configure Azure RMS are members of this group|[Preparing for Azure Information Protection](../plan-design/prepare.md)|
|Your Azure Information Protection tenant key is managed by Microsoft; you are not using BYOK|[Planning and implementing your Azure Information Protection tenant key](../plan-design/plan-implement-tenant-key.md)|
|Azure Rights Management is activated|[Activating Azure Rights Management](../deploy-use/activate-service.md)|
|One of these configurations:<br /><br />- Exchange Online is enabled for Azure Rights Management<br /><br />- The RMS connector is installed and configured for Exchange on-premises|For Exchange Online: See the [Exchange Online: IRM Configuration](../deploy-use/configure-office365.md#exchange-online-irm-configuration) information.<br /><br />For Exchange on-premises: [Deploying the Azure Rights Management connector](../deploy-use/deploy-rms-connector.md)|
|You have configured a custom template as described next|[Configuring and managing templates in the Azure Information Protection policy](../deploy-use/configure-policy-templates.md)|
|You have configured a transport protection rule for IRM, as described later in this article|For Exchange Online: [Mail flow or transport rules](https://technet.microsoft.com/library/jj919238(v=exchg.150).aspx)<br /><br />For Exchange 2013: [Create a Transport Protection Rule](https://technet.microsoft.com/en-us/library/dd302432(v=exchg.150))<br /><br />For Exchange 2010: [Create a Transport Protection Rule](https://technet.microsoft.com/library/dd302432(v=exchg.141))|

### To configure the custom template for executives

1.  In the Azure portal: Create a new template for Azure Rights Management, which contains these values and settings:

    -   Name: **Executives**

    -   Rights: Grant the **Executives** mail-enabled group **Co-Owner** rights

    -   Scope: Select the **Executives** mail-enabled group, and the **RMS administrators** mail-enabled group.

2.  Publish the new template.

3.  For Exchange Online only: Refresh the templates by using the Windows PowerShell for Exchange Online command:

    ```
    Import-RMSTrustedPublishingDomain -Name "RMS Online -1" -RefreshTemplates -RMSOnline
    ```

### To configure the transport rule for IRM

-   Use the Exchange documentation referenced in the table for procedural information to create the transport rule with the following settings:

    -   Name: **Apply the Executives templates to executive emails**

    -   Specify the **Executives** group as the sender and recipient of the rule and additional condition.

    -   For the action, select **Apply rights protection to the message with** and then select the **Executives** template that you configured.

    -   Add the exception of **DNP** (as an abbreviation for "Do Not Protect"), or your choice of words to identify this exception, to be included in the subject.

    -   Make sure the rule is configured for **Enforce**.

## User documentation instructions
Unless you want to provide instructions of how to specify **DNP** or your choice of exception words or phrases in the email subject, there are no procedural instructions to give to users for this scenario because protecting emails from and to executives requires no special action from them. Email messages and any attachments are automatically protected so that only the members of the Executives group can access them.

However, you might need to inform the executives and your help desk that these emails will be automatically protected and how this can restrict their use of these emails. For example, they cannot successfully be read by other people if the emails or attachments are later forwarded to others. If you configured the DNP (or equivalent) exception, make sure that the help desk is aware of this configuration so that executives can override the rule themselves, without requiring action from an Exchange administrator.

Using the following template, copy and paste the announcement into a communication for your end users, and make these modifications to reflect your environment:

1.  Replace the instances of *&lt;organization name&gt;* with the name of your organization.

2.  If you chose a different string from DNP for the exemption, replace that value and the explanation accordingly.

3.  Replace *&lt;emaildomain&gt;* with your organization's email domain name.

4.  Replace *&lt;contact details&gt;* with instructions for how your users can contact the help desk, such as a website link, email address, or telephone number.

5.  Make any additional modifications that you want to the announcement, and then send it to these users.

The example documentation shows how this announcement might look for users, after your customizations.

![Template user documentation for Azure RMS Rapid Deployment](../media/AzRMS_UsersBanner.png)

### IT Announcement: &lt;Organization name&gt; executive emails are now automatically protected
From now on, whenever you send emails to another &lt;organization name&gt; executive in the company, the contents of the emails and any attachments will be automatically protected such that only another executive in the company can access them to read the information, print it, copy from it, and so on. This restriction applies even if you forward the email message to others, or save the attachments. This protection helps to prevent data loss of confidential and sensitive information.

Note that if you want others who are not a &lt;organization name&gt; executive to be able to read and edit the information that you send in these emails, you must email it to them separately. Or, to override the automatic protection, type the letters **DNP** (as an abbreviation for Do Not Protect) anywhere in the email message subject.

When sending company-confidential information to another &lt;organization name&gt; executive, please remember to send it to their work email address (*name*@&lt;emaildomain&gt;) and not to a personal email address.

**Need help?**

-   Contact the help desk: &lt;contact details&gt;

### Example user documentation
![Example user documentation for Azure RMS Rapid Deployment](../media/AzRMS_ExampleBanner.png)

#### IT Announcement: VanArsdel executive emails are now automatically protected
From now on, whenever you send emails to another VanArsdel executive in the company, the contents of the emails and any attachments will be automatically protected such that only another executive in the company can access them to read the information, print it, copy from it, and so on. This restriction applies even if you forward the email message to others, or save the attachments. This protection helps to prevent data loss of confidential and sensitive information.

Note that if you want others who are not a VanArsdel executive to be able to read and edit the information that you send in these emails, you must email it to them separately. Or, to override the automatic protection, type the letters **DNP** (as an abbreviation for Do Not Protect) anywhere in the email message subject.

When sending company-confidential information to another VanArsdel executive, please remember to send it to their work email address (*name*@vanarsdelltd.com) and not to a personal email address.

**Need help?**

-   Contact the help desk: helpdesk@vanarsdelltd.com

[!INCLUDE[Commenting house rules](../includes/houserules.md)]
