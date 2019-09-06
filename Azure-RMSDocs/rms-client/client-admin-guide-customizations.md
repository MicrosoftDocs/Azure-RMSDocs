---
# required metadata

title: Custom configurations - Azure Information Protection client
description: Information about customizing the Azure Information Protection client for Windows.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 09/06/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 5eb3a8a4-3392-4a50-a2d2-e112c9e72a78

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: v1client
ms.reviewer: maayan
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Admin Guide: Custom configurations for the Azure Information Protection client

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*
>
> *Instructions for: [Azure Information Protection client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-client-and-the-azure-information-protection-unified-labeling-client)*

Use the following information for advanced configurations that you might need for specific scenarios or a subset of users when you manage the Azure Information Protection client.

Some of these settings require editing the registry and some use advanced settings that you must configure in the Azure portal, and then publish for clients to download.  

### How to configure advanced client configuration settings in the portal

1. If you haven't already done so, in a new browser window, [sign in to the Azure portal](../configure-policy.md#signing-in-to-the-azure-portal), and then navigate to the **Azure Information Protection** blade.

2. From the **Classifications** > **Labels** menu option: Select **Policies**.

3. On the **Azure Information Protection - Policies** blade, select the context menu (**...**) next to the policy to contain the advanced settings. Then select **Advanced settings**.
    
    You can configure advanced settings for the Global policy, as well as for scoped policies.

4. On the **Advanced settings** blade, type the advanced setting name and value, and then select **Save and close**.

5. Make sure that users for this policy restart any Office applications that they had open.

6. If you no longer need the setting and want to revert to the default behavior: On the **Advanced settings** blade, select the context menu (**...**) next to the setting you no longer need, and then select **Delete**. Then click **Save and close**.

#### Available advanced client settings

|Setting|Scenario and instructions|
|----------------|---------------|
|DisableDNF|[Hide or show the Do Not Forward button in Outlook](#hide-or-show-the-do-not-forward-button-in-outlook)|
|DisableMandatoryInOutlook|[Exempt Outlook messages from mandatory labeling](#exempt-outlook-messages-from-mandatory-labeling)|
|CompareSubLabelsInAttachmentAction|[Enable order support for sublabels](#enable-order-support-for-sublabels-on-attachments) 
|ContentExtractionTimeout|[Change the timeout settings for the scanner](#change-the-timeout-settings-for-the-scanner)
|EnableBarHiding|[Permanently hide the Azure Information Protection bar](#permanently-hide-the-azure-information-protection-bar)|
|EnableCustomPermissions|[Make the custom permissions options available or unavailable to users](#make-the-custom-permissions-options-available-or-unavailable-to-users)|
|EnableCustomPermissionsForCustomProtectedFiles|[For files protected with custom permissions, always display custom permissions to users in File Explorer](#for-files-protected-with-custom-permissions-always-display-custom-permissions-to-users-in-file-explorer) |
|EnablePDFv2Protection|[Don't protect PDF files by using the ISO standard for PDF encryption](#dont-protect-pdf-files-by-using-the-iso-standard-for-pdf-encryption)|
|FileProcessingTimeout|[Change the timeout settings for the scanner](#change-the-timeout-settings-for-the-scanner)
|LabelbyCustomProperty|[Migrate labels from Secure Islands and other labeling solutions](#migrate-labels-from-secure-islands-and-other-labeling-solutions)|
|LabelToSMIME|[Configure a label to apply S/MIME protection in Outlook](#configure-a-label-to-apply-smime-protection-in-outlook)|
|LogLevel|[Change the local logging level](#change-the-local-logging-level)
|LogMatchedContent|[Disable sending information type matches for a subset of users](#disable-sending-information-type-matches-for-a-subset-of-users)|
|OutlookBlockTrustedDomains|[Implement pop-up messages in Outlook that warn, justify, or block emails being sent](#implement-pop-up-messages-in-outlook-that-warn-justify-or-block-emails-being-sent)|
|OutlookBlockUntrustedCollaborationLabel|[Implement pop-up messages in Outlook that warn, justify, or block emails being sent](#implement-pop-up-messages-in-outlook-that-warn-justify-or-block-emails-being-sent)|
|OutlookDefaultLabel|[Set a different default label for Outlook](#set-a-different-default-label-for-outlook)|
|OutlookJustifyTrustedDomains|[Implement pop-up messages in Outlook that warn, justify, or block emails being sent](#implement-pop-up-messages-in-outlook-that-warn-justify-or-block-emails-being-sent)|
|OutlookJustifyUntrustedCollaborationLabel|[Implement pop-up messages in Outlook that warn, justify, or block emails being sent](#implement-pop-up-messages-in-outlook-that-warn-justify-or-block-emails-being-sent)|
|OutlookRecommendationEnabled|[Enable recommended classification in Outlook](#enable-recommended-classification-in-outlook)|
|OutlookOverrideUnlabeledCollaborationExtensions|[Implement pop-up messages in Outlook that warn, justify, or block emails being sent](#implement-pop-up-messages-in-outlook-that-warn-justify-or-block-emails-being-sent)|
|OutlookUnlabeledCollaborationActionOverrideMailBodyBehavior|[Implement pop-up messages in Outlook that warn, justify, or block emails being sent](#implement-pop-up-messages-in-outlook-that-warn-justify-or-block-emails-being-sent)|
|OutlookWarnTrustedDomains|[Implement pop-up messages in Outlook that warn, justify, or block emails being sent](#implement-pop-up-messages-in-outlook-that-warn-justify-or-block-emails-being-sent)|
|OutlookWarnUntrustedCollaborationLabel|[Implement pop-up messages in Outlook that warn, justify, or block emails being sent](#implement-pop-up-messages-in-outlook-that-warn-justify-or-block-emails-being-sent)|
|PostponeMandatoryBeforeSave|[Remove "Not now" for documents when you use mandatory labeling](#remove-not-now-for-documents-when-you-use-mandatory-labeling)|
|ProcessUsingLowIntegrity|[Disable the low integrity level for the scanner](#disable-the-low-integrity-level-for-the-scanner)|
|PullPolicy|[Support for disconnected computers](#support-for-disconnected-computers)
|RemoveExternalContentMarkingInApp|[Remove headers and footers from other labeling solutions](#remove-headers-and-footers-from-other-labeling-solutions)|
|ReportAnIssueLink|[Add "Report an Issue" for users](#add-report-an-issue-for-users)|
|RunAuditInformationTypesDiscovery|[Disable sending discovered sensitive information in documents to Azure Information Protection analytics](#disable-sending-discovered-sensitive-information-in-documents-to-azure-information-protection-analytics)|
|RunPolicyInBackground|[Turn on classification to run continuously in the background](#turn-on-classification-to-run-continuously-in-the-background)|
|ScannerConcurrencyLevel|[Limit the number of threads used by the scanner](#limit-the-number-of-threads-used-by-the-scanner)|
|SyncPropertyName|[Label an Office document by using an existing custom property](#label-an-office-document-by-using-an-existing-custom-property)|
|SyncPropertyState|[Label an Office document by using an existing custom property](#label-an-office-document-by-using-an-existing-custom-property)|

## Prevent sign-in prompts for AD RMS only computers

By default, the Azure Information Protection client automatically tries to connect to the Azure Information Protection service. For computers that only communicate with AD RMS, this configuration can result in a sign-in prompt for users that is not necessary. You can prevent this sign-in prompt by editing the registry.

 - Locate the following value name, and then set the value data to **0**:
    
    **HKEY_CURRENT_USER\SOFTWARE\Microsoft\MSIP\EnablePolicyDownload** 

Regardless of this setting, the Azure Information Protection client still follows the standard [RMS service discovery process](client-deployment-notes.md#rms-service-discovery) to find its AD RMS cluster.

## Sign in as a different user

In a production environment, users wouldn't usually need to sign in as a different user when they are using the Azure Information Protection client. However, as an administrator, you might need to sign in as a different user during a testing phase. 

You can verify which account you're currently signed in as by using the **Microsoft Azure Information Protection** dialog box: Open an Office application and on the **Home** tab, in the **Protection** group, click **Protect**, and then click **Help and feedback**. Your account name is displayed in the **Client status** section.

Be sure to also check the domain name of the signed in account that's displayed. It can be easy to miss that you're signed in with the right account name but wrong domain. A symptom of using the wrong account includes failing to download the Azure Information Protection policy, or not seeing the labels or behavior that you expect.

To sign in as a different user:

1. Navigate to **%localappdata%\Microsoft\MSIP** and delete the **TokenCache** file.

2. Restart any open Office applications and sign in with your different user account. If you do not see a prompt in your Office application to sign in to the Azure Information Protection service, return to the **Microsoft Azure Information Protection** dialog box and click **Sign in** from the updated **Client status** section.

Additionally:

- If the Azure Information Protection client is still signed in with the old account after completing these steps, delete all cookies from Internet Explorer, and then repeat steps 1 and 2.

- If you are using single sign-on, you must sign out from Windows and sign in with your different user account after deleting the token file. The Azure Information Protection client then automatically authenticates by using your currently signed in user account.

- This solution is supported for signing in as another user from the same tenant. It is not supported for signing in as another user from a different tenant. To test Azure Information Protection with multiple tenants, use different computers.

- You can use the **Reset settings** option from **Help and Feedback** to sign out and delete the currently downloaded Azure Information Protection policy.


## Enforce protection-only mode when your organization has a mix of licenses

If your organization does not have any licenses for Azure Information Protection, but does have licenses for Office 365 that include the Azure Rights Management service for protecting data, the Azure Information Protection client for Windows automatically runs in [protection-only mode](client-protection-only-mode.md).

However, if your organization has a subscription for Azure Information Protection, by default all Windows computers can download the Azure Information Protection policy. The Azure Information Protection client does not do license checking and enforcement. 

If you have some users who do not have a license for Azure Information Protection but do have a license for Office 365 that includes the Azure Rights Management service, edit the registry on these users' computers to prevent users from running the unlicensed classification and labeling features from Azure Information Protection.

Locate the following value name and set the value data to **0**:

**HKEY_CURRENT_USER\SOFTWARE\Microsoft\MSIP\EnablePolicyDownload** 

In addition, check that these computers do not have a file named **Policy.msip** in the **%LocalAppData%\Microsoft\MSIP** folder. If this file exists, delete it. This file contains the Azure Information Protection policy and might have downloaded before you edited the registry, or if the Azure Information Protection client was installed with the demo option.

## Add "Report an Issue" for users

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal. 

When you specify the following advanced client setting, users see a **Report an Issue** option that they can select from the **Help and Feedback** client dialog box. Specify an HTTP string for the link. For example, a customized web page that you have for users to report issues, or an email address that goes to your help desk. 

To configure this advanced setting, enter the following strings:

- Key: **ReportAnIssueLink**

- Value: **\<HTTP string>**

Example value for a website: `https://support.contoso.com`

Example value for an email address: `mailto:helpdesk@contoso.com`

## Hide the Classify and Protect menu option in Windows File Explorer

Create the following DWORD value name (with any value data):

**HKEY_CLASSES_ROOT\AllFilesystemObjects\shell\Microsoft.Azip.RightClick\LegacyDisable**

## Support for disconnected computers

By default, the Azure Information Protection client automatically tries to connect to the Azure Information Protection service to download the latest Azure Information Protection policy. If you have computers that you know will not be able to connect to the Internet for a period of time, you can prevent the client from attempting to connect to the service by editing the registry. 

Note that without an Internet connection, the client cannot apply protection (or remove protection) by using your organization's cloud-based key. Instead, the client is limited to using labels that apply classification only, or protection that uses [HYOK](../configure-adrms-restrictions.md).

You can prevent a sign-in prompt to the Azure Information Protection service by using an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal and then download the policy for computers. Or, you can prevent this sign-in prompt by editing the registry.

- To configure the advanced client setting:
    
    1. Enter the following strings:
    
        - Key: **PullPolicy**
        
        - Value: **False**
    
    2. Download the policy with this setting and install it on computers by using the instructions that follow.

- Alternatively, to edit the registry:
    
    - Locate the following value name, and then set the value data to **0**:
    
        **HKEY_CURRENT_USER\SOFTWARE\Microsoft\MSIP\EnablePolicyDownload** 


The client must have a valid policy file named **Policy.msip**, in the **%LocalAppData%\Microsoft\MSIP** folder.

You can export the global policy or a scoped policy from the Azure portal, and copy the exported file to the client computer. You can also use this method to replace an-out-of-date policy file with the latest policy. However, exporting the policy does not support the scenario where a user belongs to more than one scoped policy. Also be aware that if users select the **Reset Settings** option from [Help and feedback](client-admin-guide.md#help-and-feedback-section), this action deletes the policy file and renders the client inoperable until you manually replace the policy file or the client connects to the service to download the policy.

When you export the policy from the Azure portal, a zipped file is downloaded that contains multiple versions of the policy. These policy versions correspond to different versions of the Azure Information Protection client:

1. Unzip the file and use the following table to identify which policy file you need. 
    
    |File name|Corresponding client version|
    |--------------------------|---------------------------------------------|
    |Policy1.1.msip |version 1.2|
    |Policy1.2.msip |version 1.3 - 1.7|
    |Policy1.3.msip |version 1.8 - 1.29|
    |Policy1.4.msip |version 1.32 and later|
    
2. Rename the identified file to **Policy.msip**, and then copy it to the **%LocalAppData%\Microsoft\MSIP** folder on computers that have the Azure Information Protection client installed. 

If your disconnected computer is running the current GA version of the Azure Information Protection scanner, there are additional configuration steps you must take. For more information, see [Restriction: The scanner server cannot have Internet connectivity](../deploy-aip-scanner.md#restriction-the-scanner-server-cannot-have-internet-connectivity) from the scanner deployment instructions.

## Hide or show the Do Not Forward button in Outlook

The recommended method to configure this option is by using the [policy setting](../configure-policy-settings.md) **Add the Do Not Forward button to the Outlook ribbon**. However, you can also configure this option by using an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you configure in the Azure portal.

When you configure this setting, it hides or shows the **Do Not Forward** button on the ribbon in Outlook. This setting has no effect on the Do Not Forward option from Office menus.

To configure this advanced setting, enter the following strings:

- Key: **DisableDNF**

- Value: **True** to hide the button, or **False** to show the button

## Make the custom permissions options available or unavailable to users

The recommended method to configure this option is by using the [policy setting](../configure-policy-settings.md) **Make the custom permissions option available for users**. However, you can also configure this option by using an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you configure in the Azure portal. 

When you configure this setting and publish the policy for users, the custom permissions options become visible for users to select their own protection settings, or they are hidden so that users can't select their own protection settings unless prompted.

To configure this advanced setting, enter the following strings:

- Key: **EnableCustomPermissions**

- Value: **True** to make the custom permissions option visible, or **False** to hide this option

## For files protected with custom permissions, always display custom permissions to users in File Explorer

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal. This setting is in preview and might change.

When you configure the [policy setting](../configure-policy-settings.md) **Make the custom permissions option available for users** or the equivalent advanced client setting in the previous section, users are not able to see or change custom permissions that are already set in a protected document. 

When you create and configure this advanced client setting, users can see and change custom permissions for a protected document when they use File Explorer, and right-click the file. The **Custom Permissions** option from the **Protect** button on the Office ribbon remains hidden.

To configure this advanced setting, enter the following strings:

- Key: **EnableCustomPermissionsForCustomProtectedFiles**

- Value: **True**

## Permanently hide the Azure Information Protection bar

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal. Use it only when the [policy setting](../configure-policy-settings.md) **Display the Information Protection bar in Office apps** is set to **On**.

By default, if a user clears the **Show Bar** option from the **Home** tab, **Protection** group, **Protect** button, the Information Protection bar no longer displays in that Office app. However, the bar automatically displays again the next time an Office app is opened.

To prevent the bar from displaying again automatically after a user has chosen to hide it, use this client setting. This setting has no effect if the user closes the bar by using the **Close this bar** icon.

Even though the Azure Information Protection bar remains hidden, users can still select a label from a temporarily displayed bar if you have configured recommended classification, or when a document or email must have a label. 

To configure this advanced setting, enter the following strings:

- Key: **EnableBarHiding**

- Value: **True**

## Enable order support for sublabels on attachments

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal.

Use this setting when you have sublabels and you have configured the following [policy setting](../configure-policy-settings.md):

- **For email messages with attachments, apply a label that matches the highest classification of those attachments**

Configure the following strings:

- Key: **CompareSubLabelsInAttachmentAction**

- Value: **True**

Without this setting, the first label that's found from the parent label with the highest classification is applied to the email. 

With this setting, the sublabel that's ordered last from the parent label with the highest classification is applied to the email. If you need to reorder your labels to apply the label that you want for this scenario, see [How to delete or reorder a label for Azure Information Protection](../configure-policy-delete-reorder.md).

## Exempt Outlook messages from mandatory labeling

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal.

By default, when you enable the [policy setting](../configure-policy-settings.md) **All documents and emails must have a label**, all saved documents and sent emails must have a label applied. When you configure the following advanced setting, the policy setting applies only to Office documents and not to Outlook messages.

To configure this advanced setting, enter the following strings:

- Key: **DisableMandatoryInOutlook**

- Value: **True**

## Enable recommended classification in Outlook

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal. This setting is in preview and might change.

When you configure a label for recommended classification, users are prompted to accept or dismiss the recommended label in Word, Excel, and PowerPoint. This setting extends this label recommendation to also display in Outlook.

To configure this advanced setting, enter the following strings:

- Key: **OutlookRecommendationEnabled**

- Value: **True**


## Implement pop-up messages in Outlook that warn, justify, or block emails being sent

This configuration uses multiple [advanced client settings](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal.

When you create and configure the following advanced client settings, users see pop-up messages in Outlook that can warn them before sending an email, or ask them to provide justification why they are sending an email, or prevent them from sending an email for either of the following scenarios:

- **Their email or attachment for the email has a specific label**:
    - The attachment can be any file type

- **Their email or attachment for the email doesn't have a label**:
    - The attachment can be an Office document or PDF document

When these conditions are met, the user sees a pop-up message with one of the following actions:

- **Warn**: The user can confirm and send, or cancel.

- **Justify**: The user is prompted for justification (predefined options or free-form).  The user can then send or cancel the email. The justification text is written to the email x-header, so that it can be read by other systems. For example, data loss prevention (DLP) services.

- **Block**: The user is prevented from sending the email while the condition remains. The message includes the reason for blocking the email, so the user can address the problem. For example, remove specific recipients, or label the email. 

When the popup-messages are for a specific label, you can configure exceptions for recipients by domain name.

The resulting actions from the pop-up messages are logged to the local Windows event log **Applications and Services Logs** > **Azure Information Protection**:

- Warn messages: Information ID 301

- Justify messages: Information ID 302

- Block messages: Information ID 303

Example event entry from a justify message:

```
Client Version: 1.53.10.0
Client Policy ID: e5287fe6-f82c-447e-bf44-6fa8ff146ef4
Item Full Path: Price list.msg
Item Name: Price list
Process Name: OUTLOOK
Action: Justify
User Justification: My manager approved sharing of this content
Action Source: 
User Response: Confirmed
```
The following sections contain configuration instructions for each advanced client setting, and you can see them in action for yourself with [Tutorial: Configure Azure Information Protection to control oversharing of information using Outlook](../infoprotect-oversharing-tutorial.md).

### To implement the warn, justify, or block pop-up messages for specific labels:

To implement the pop-up messages for specific labels, you must know the label ID for those labels. The label ID value is displayed on the **Label** blade, when you view or configure the Azure Information Protection policy in the Azure portal. For files that have labels applied, you can also run the [Get-AIPFileStatus](/powershell/module/azureinformationprotection/get-aipfilestatus) PowerShell cmdlet to identify the label ID (MainLabelId or SubLabelId). When a label has sublabels, always specify the ID of just a sublabel and not the parent label.

Create one or more of the following advanced client settings with the following keys. For the values, specify one or more labels by their IDs, each one separated by a comma.

Example value for multiple label IDs as a comma-separated string: `dcf781ba-727f-4860-b3c1-73479e31912b,1ace2cc3-14bc-4142-9125-bf946a70542c,3e9df74d-3168-48af-8b11-037e3021813f`


- Warn messages:
    
    - Key: **OutlookWarnUntrustedCollaborationLabel**
    
    - Value: \<**label IDs, comma-separated**>

- Justification messages:
    
    - Key: **OutlookJustifyUntrustedCollaborationLabel**
    
    - Value: \<**label IDs, comma-separated**>

- Block messages:
    
    - Key: **OutlookBlockUntrustedCollaborationLabel**
    
    - Value: \<**label IDs, comma-separated**>

#### To exempt domain names for pop-up messages configured for specific labels

For the labels that you've specified with these pop-up messages, you can exempt specific domain names so that users do not see the messages for recipients who have that domain name included in their email address. In this case, the emails are sent without interruption. To specify multiple domains, add them as a single string, separated by commas.

A typical configuration is to display the pop-up messages only for recipients who are external to your organization or who aren't authorized partners for your organization. In this case, you specify all the email domains that are used by your organization and by your partners.

Create the following advanced client settings and for the value, specify one or more domains, each one separated by a comma.

Example value for multiple domains as a comma-separated string: `contoso.com,fabrikam.com,litware.com`

- Warn messages:
    
    - Key: **OutlookWarnTrustedDomains**
    
    - Value: **\<**domain names, comma separated**>**

- Justification messages:
    
    - Key: **OutlookJustifyTrustedDomains**
    
    - Value: **\<**domain names, comma separated**>**

- Block messages:
    
    - Key: **OutlookBlockTrustedDomains**
    
    - Value: **\<**domain names, comma separated**>**

For example, you have specified the **OutlookBlockUntrustedCollaborationLabel** advanced client setting for the **Confidential \ All Employees** label. You now specify the additional advanced client setting of **OutlookBlockTrustedDomains** and **contoso.com**. As a result, a user can send an email to john@sales.contoso.com when it is labeled **Confidential \ All Employees** but will be blocked from sending an email with the same label to a Gmail account.

### To implement the warn, justify, or block pop-up messages for emails or attachments that don't have a label:

Create the following advanced client setting with one of the following values:

- Warn messages:
    
    - Key: **OutlookUnlabeledCollaborationAction**
    
    - Value: **Warn**

- Justification messages:
    
    - Key: **OutlookUnlabeledCollaborationAction**
    
    - Value: **Justify**

- Block messages:
    
    - Key: **OutlookUnlabeledCollaborationAction**
    
    - Value: **Block**

- Turn off these messages:
    
    - Key: **OutlookUnlabeledCollaborationAction**
    
    - Value: **Off**

#### To define specific file name extensions for the warn, justify, or block pop-up messages for email attachments that don't have a label

By default, the warn, justify, or block pop-up messages apply to all Office documents and PDF documents. You can refine this list by specifying which file name extensions should display the warn, justify, or block messages with an additional advanced client property and a comma-separated list of file name extensions.

Example value for multiple file name extensions to define as a comma-separated string: `.XLSX,.XLSM,.XLS,.XLTX,.XLTM,.DOCX,.DOCM,.DOC,.DOCX,.DOCM,.PPTX,.PPTM,.PPT,.PPTX,.PPTM`

In this example, an unlabeled PDF document will not result in warn, justify, or block pop-up messages.


- Key: **OutlookOverrideUnlabeledCollaborationExtensions**

- Value: **\<**file name extensions to display messages, comma separated**>**

#### To specify a different action for email messages without attachments

By default, the value that you specify for OutlookUnlabeledCollaborationAction to warn, justify, or block pop-up messages applies to emails or attachments that don't have a label. You can refine this configuration by specifying another advanced client setting for email messages that don't have attachments.

Create the following advanced client setting with one of the following values:

- Warn messages:
    
    - Key: **OutlookUnlabeledCollaborationActionOverrideMailBodyBehavior**
    
    - Value: **Warn**

- Justification messages:
    
    - Key: **OutlookUnlabeledCollaborationActionOverrideMailBodyBehavior**
    
    - Value: **Justify**

- Block messages:
    
    - Key: **OutlookUnlabeledCollaborationActionOverrideMailBodyBehavior**
    
    - Value: **Block**

- Turn off these messages:
    
    - Key: **OutlookUnlabeledCollaborationActionOverrideMailBodyBehavior**
    
    - Value: **Off**

If you don't specify this client setting, the value that you specify for OutlookUnlabeledCollaborationAction is used for unlabeled email messages without attachments as well as unlabeled email messages with attachments.


## Set a different default label for Outlook

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal. 

When you configure this setting, Outlook doesn't apply the default label that is configured in the Azure Information Protection policy for the setting **Select the default label**. Instead, Outlook can apply a different default label, or no label.

To apply a different label, you must specify the label ID. The label ID value is displayed on the **Label** blade, when you view or configure the Azure Information Protection policy in the Azure portal. For files that have labels applied, you can also run the [Get-AIPFileStatus](/powershell/module/azureinformationprotection/get-aipfilestatus) PowerShell cmdlet to identify the label ID (MainLabelId or SubLabelId). When a label has sublabels, always specify the ID of just a sublabel and not the parent label.

So that Outlook doesn't apply the default label, specify **None**.

To configure this advanced setting, enter the following strings:

- Key: **OutlookDefaultLabel**

- Value: \<**label ID**> or **None**

## Configure a label to apply S/MIME protection in Outlook

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal.

Use this setting only when you have a working [S/MIME deployment](https://docs.microsoft.com/office365/SecurityCompliance/s-mime-for-message-signing-and-encryption) and want a label to automatically apply this protection method for emails rather than Rights Management protection from Azure Information Protection. The resulting protection is the same as when a user manually selects S/MIME options from Outlook.

This configuration requires you to specify an advanced client setting named **LabelToSMIME** for each Azure Information Protection label that you want to apply S/MIME protection. Then for each entry, set the value by using the following syntax:

`[Azure Information Protection label ID];[S/MIME action]`

The label ID value is displayed on the **Label** blade, when you view or configure the Azure Information Protection policy in the Azure portal. To use S/MIME with a sublabel, always specify the ID of just the sublabel and not the parent label. When you specify a sublabel, the parent label must be in the same scope, or in the global policy.

The S/MIME action can be:

- `Sign;Encrypt`: To apply a digital signature and S/MIME encryption

- `Encrypt`: To apply S/MIME encryption only

- `Sign`: To apply a digital signature only

Example values for a label ID of **dcf781ba-727f-4860-b3c1-73479e31912b**:

- To apply a digital signature and S/MIME encryption:
    
    **dcf781ba-727f-4860-b3c1-73479e31912b;Sign;Encrypt**

- To apply S/MIME encryption only:
    
    **dcf781ba-727f-4860-b3c1-73479e31912b;Encrypt**
    
- To apply a digital signature only:
    
    **dcf781ba-727f-4860-b3c1-73479e31912b;Sign**

As a result of this configuration, when the label is applied for an email message, S/MIME protection is applied to the email in addition to the label's classification.

If the label you specify is configured for Rights Management protection in the Azure portal, S/MIME protection replaces the Rights Management protection only in Outlook. For all other scenarios that support labeling, Rights Management protection will be applied.

If you want the label to be visible in Outlook only, configure the label to apply the single user-defined action of **Do Not Forward**, as described in the [Quickstart: Configure a label for users to easily protect emails that contain sensitive information](../quickstart-label-dnf-protectedemail.md).

## Remove "Not now" for documents when you use mandatory labeling

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal. 

When you use the [policy setting](../configure-policy-settings.md) of **All documents and emails must have a label**, users are prompted to select a label when they first save an Office document and when they send an email. For documents, users can select **Not now** to temporarily dismiss the prompt to select a label and return to the document. However, they cannot close the saved document without labeling it. 

When you configure this setting, it removes the **Not now** option so that users must select a label when the document is first saved.

To configure this advanced setting, enter the following strings:

- Key: **PostponeMandatoryBeforeSave**

- Value: **False**

## Turn on classification to run continuously in the background

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal. This setting is in preview and might change.

When you configure this setting, it changes the [default behavior](../configure-policy-classification.md#how-automatic-or-recommended-labels-are-applied) of how the Azure Information Protection client applies automatic and recommended labels to documents: 

- For Word, Excel, and PowerPoint, automatic classification runs continuously in the background.  

The behavior does not change for Outlook.

When the Azure Information Protection client periodically checks documents for the condition rules that you specify, this behavior enables automatic and recommended classification and protection for documents that are stored in SharePoint Online. Large files also save more quickly because the condition rules have already run. 

The condition rules do not run in real time as a user types. Instead, they run periodically as a background task if the document is modified.

To configure this advanced setting, enter the following strings:

- Key: **RunPolicyInBackground**

- Value: **True**

## Don't protect PDF files by using the ISO standard for PDF encryption

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal. 

When the latest version of the Azure Information Protection client protects a PDF file, the resulting file name extension remains as .pdf and adheres to the ISO standard for PDF encryption. For more information about this standard, see section **7.6 Encryption** from the [document that is derived from ISO 32000-1](https://www.adobe.com/content/dam/acom/en/devnet/pdf/pdfs/PDF32000_2008.pdf) and published by Adobe Systems Incorporated.

If you need the client to revert to the behavior in older versions of the client that protected PDF files by using a .ppdf file name extension, use the following advanced setting by entering the following string:

- Key: **EnablePDFv2Protection**

- Value: **False**

For example, you might need this setting for all users if you use a PDF reader that doesn't support the ISO standard for PDF encryption. Or, you might need to configure it for some users as you gradually phase in a change of PDF reader that supports the new format. Another potential reason to use this setting is if you need to add protection to signed PDF documents. Signed PDF documents can be additionally protected with the .ppdf format because this protection is implemented as a wrapper for the file. 

For the Azure Information Protection scanner to use the new setting, the scanner service must be restarted. In addition, the scanner will no longer protect PDF documents by default. If you want PDF documents to be protected by the scanner when EnablePDFv2Protection is set to False, you must [edit the registry](../deploy-aip-scanner.md#editing-the-registry-for-the-scanner).

For more information about the new PDF encryption, see the blog post [New support for PDF encryption with Microsoft Information Protection](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/New-support-for-PDF-encryption-with-Microsoft-Information/ba-p/262757).

For a list of PDF readers that support the ISO standard for PDF encryption, and readers that support older formats, see [Supported PDF readers for Microsoft Information Protection](protected-pdf-readers.md).

### To convert existing .ppdf files to protected .pdf files

When the Azure Information Protection client has downloaded the client policy with the new setting, you can use PowerShell commands to convert existing .ppdf files to protected .pdf files that use the ISO standard for PDF encryption. 

To use the following instructions for files that you didn't protect yourself, you must have a [Rights Management usage right](../configure-usage-rights.md) to remove protection from files, or be a super user. To enable the super user feature and configure your account to be a super user, see [Configuring super users for Azure Rights Management and Discovery Services or Data Recovery](../configure-super-users.md).

In addition, when you use these instructions for files that you didn't protect yourself, you become the [RMS Issuer](../configure-usage-rights.md#rights-management-issuer-and-rights-management-owner). In this scenario, the user who originally protected the document can no longer track and revoke it. If users need to track and revoke their protected PDF documents, ask them to manually remove and then reapply the label by using File Explorer, right-click.

To use PowerShell commands to convert existing .ppdf files to protected .pdf files that use the ISO standard for PDF encryption:

1. Use [Get-AIPFileStatus](/powershell/module/azureinformationprotection/get-aipfilestatus) with the .ppdf file. For example:
    
		Get-AIPFileStatus -Path \\Finance\Projectx\sales.ppdf

2. From the output, take a note of the following parameter values:
    
   - The value (GUID) for **SubLabelId**, if there is one. If this value is blank, a sublabel wasn't used, so note the value for **MainLabelId** instead.
    
     Note: If there is no value for **MainLabelId** either, the file isn't labeled. In this case, you can use the [Unprotect-RMSFile](/powershell/module/azureinformationprotection/unprotect-rmsfile) command and [Protect-RMSFile](/powershell/module/azureinformationprotection/protect-rmsfile) command instead of the commands in step 3 and 4.
    
   - The value for **RMSTemplateId**. If this value is **Restricted Access**, a user has protected the file using custom permissions rather than the protection settings that are configured for the label. If you continue, those custom permissions will be overwritten by the label's protection settings. Decide whether to continue or ask the user (value displayed for the **RMSIssuer**) to remove the label and reapply it, together with their original custom permissions.

3. Remove the label by using [Set-AIPFileLabel](/powershell/module/azureinformationprotection/set-aipfilelabel) with the *RemoveLabel* parameter. If you are using the [policy setting](../configure-policy-settings.md) of **Users must provide justification to set a lower classification label, remove a label, or remove protection**, you must also specify the *Justification* parameter with the reason. For example: 
    
    	Set-AIPFileLabel \\Finance\Projectx\sales.ppdf -RemoveLabel -JustificationMessage 'Removing .ppdf protection to replace with .pdf ISO standard'

4. Reapply the original label, by specifying the value for the label that you identified in step 1. For example:
    
    	Set-AIPFileLabel \\Finance\Projectx\sales.pdf -LabelId d9f23ae3-1234-1234-1234-f515f824c57b

The file retains the .pdf file name extension but is classified as before, and it is protected by using the ISO standard for PDF encryption.

## Support for files protected by Secure Islands

This configuration option is in preview and might change.

If you used Secure Islands to protect documents, you might have protected text and picture files, and generically protected files as a result of this protection. For example, files that have a file name extension of .ptxt, .pjpeg, or .pfile. When you edit the registry as follows, Azure Information Protection can decrypt these files:


Add the following DWORD value of **EnableIQPFormats** to the following registry path, and set the value data to **1**:

- For a 64-bit version of Windows: HKEY_LOCAL_MACHINE\\SOFTWARE\\WOW6432Node\\Microsoft\\MSIP

- For a 32-bit version of Windows: HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\MSIP

As a result of this registry edit, the following scenarios are supported:

- The Azure Information Protection viewer can open these protected files.

- The Azure Information Protection scanner can inspect these files for sensitive information.

- File Explorer, PowerShell, and the Azure Information Protection scanner can label these files. As a result, you can apply an Azure Information Protection label that applies new protection from Azure Information Protection, or that removes the existing protection from Secure Islands.

- You can use the [labeling migration client customization](#migrate-labels-from-secure-islands-and-other-labeling-solutions) to automatically convert the Secure Islands label on these protected files to an Azure Information Protection label.

## Migrate labels from Secure Islands and other labeling solutions

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal.

This configuration is currently not compatible with the new default behavior that protects PDF files by using the ISO standard for PDF encryption. In this scenario, .ppdf files cannot be opened by File Explorer, PowerShell, or the scanner. To resolve this, use the advanced client setting to [don't use the ISO standard for PDF encryption](client-admin-guide-customizations.md#dont-protect-pdf-files-by-using-the-iso-standard-for-pdf-encryption).

For Office documents and PDF documents that are labeled by Secure Islands, you can relabel these documents with an Azure Information Protection label by using a mapping that you define. You also use this method to reuse labels from other solutions when their labels are on Office documents. 

> [!NOTE]
> If you have files other than PDF and Office documents that are protected by Secure Islands, these can be relabeled after you edit the registry as described in the [preceding section](#support-for-files-protected-by-secure-islands). 

As a result of this configuration option, the new Azure Information Protection label is applied by the Azure Information Protection client as follows:

- For Office documents: When the document is opened in the desktop app, the new Azure Information Protection label is shown as set and is applied when the document is saved.

- For File Explorer: In the Azure Information Protection dialog box, the new Azure Information Protection label is shown as set and is applied when the user selects **Apply**. If the user selects **Cancel**, the new label is not applied.

- For PowerShell: [Set-AIPFileLabel](/powershell/module/azureinformationprotection/set-aipfilelabel) applies the new Azure Information Protection label. [Get-AIPFileStatus](/powershell/module/azureinformationprotection/get-aipfilestatus) doesn't display the new Azure Information Protection label until it is set by another method.

- For the Azure Information Protection scanner: Discovery reports when the new Azure Information Protection label would be set and this label can be applied with the enforce mode.

This configuration requires you to specify an advanced client setting named **LabelbyCustomProperty** for each Azure Information Protection label that you want to map to the old label. Then for each entry, set the value by using the following syntax:

`[Azure Information Protection label ID],[migration rule name],[Secure Islands custom property name],[Secure Islands metadata Regex value]`

The label ID value is displayed on the **Label** blade, when you view or configure the Azure Information Protection policy in the Azure portal. To specify a sublabel, the parent label must be in the same scope, or in the global policy.

Specify your choice of a migration rule name. Use a descriptive name that helps you to identify how one or more labels from your previous labeling solution should be mapped to an Azure Information Protection label. The name displays in the scanner reports and in Event Viewer. 
Note that this setting does not remove the original label from the document or any visual markings in the document that the original label might have applied. To remove headers and footers, see the next section, [Remove headers and footers from other labeling solutions](#remove-headers-and-footers-from-other-labeling-solutions).

### Example 1: One-to-one mapping of the same label name

Requirement: Documents that have a Secure Islands label of "Confidential" should be relabeled as "Confidential" by Azure Information Protection.

In this example:

- The Azure Information Protection label that you want to use is named **Confidential** and has a label ID of **1ace2cc3-14bc-4142-9125-bf946a70542c**. 

- The Secure Islands label is named **Confidential** and stored in the custom property named **Classification**.

The advanced client setting:

    
|Name|Value|
|---------------------|---------|
|LabelbyCustomProperty|1ace2cc3-14bc-4142-9125-bf946a70542c,"Secure Islands label is Confidential",Classification,Confidential|

### Example 2: One-to-one mapping for a different label name

Requirement: Documents labeled as "Sensitive" by Secure Islands should be relabeled as "Highly Confidential" by Azure Information Protection.

In this example:

- The Azure Information Protection label that you want to use is named **Highly Confidential** and has a label ID of **3e9df74d-3168-48af-8b11-037e3021813f**.

- The Secure Islands label is named **Sensitive** and stored in the custom property named **Classification**.

The advanced client setting:

    
|Name|Value|
|---------------------|---------|
|LabelbyCustomProperty|3e9df74d-3168-48af-8b11-037e3021813f,"Secure Islands label is Sensitive",Classification,Sensitive|


### Example 3: Many-to-one mapping of label names

Requirement: You have two Secure Islands labels that include the word "Internal" and you want documents that have either of these Secure Islands labels to be relabeled as "General" by Azure Information Protection.

In this example:

- The Azure Information Protection label that you want to use is named **General** and has a label ID of **2beb8fe7-8293-444c-9768-7fdc6f75014d**.

- The Secure Islands labels include the word **Internal**  and are stored in the custom property named **Classification**.

The advanced client setting:

    
|Name|Value|
|---------------------|---------|
|LabelbyCustomProperty|2beb8fe7-8293-444c-9768-7fdc6f75014d,"Secure Islands label contains Internal",Classification,.\*Internal.\*|


## Remove headers and footers from other labeling solutions

This configuration uses multiple [advanced client settings](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal. These settings are in preview and might change.

The settings let you remove or replace text-based headers or footers from documents when those visual markings have been applied by another labeling solution. For example, the old footer contains the name of an old label that you have now migrated to Azure Information Protection with a new label name and its own footer.

When the client gets this configuration in its policy, the old headers and footers are removed or replaced when the document is opened in the Office app and any Azure Information Protection label is applied to the document.

This configuration is not supported for Outlook, and be aware that when you use it with Word, Excel, and PowerPoint, it can negatively affect the performance of these apps for users. The configuration lets you define settings per application, for example, search for text in the headers and footers of Word documents but not Excel spreadsheets or PowerPoint presentations.

Because the pattern matching affects the performance for users, we recommend that you limit the Office application types (**W**ord, **E**xcel, **P**owerPoint) to just those that need to be searched:

- Key: **RemoveExternalContentMarkingInApp**

- Value: \<**Office application types WXP**> 

Examples:

- To search Word documents only, specify **W**.

- To search Word documents and PowerPoint presentations, specify **WP**.

You then need at least one more advanced client setting, **ExternalContentMarkingToRemove**, to specify the contents of the header or footer, and how to remove or replace them.

### How to configure ExternalContentMarkingToRemove

When you specify the string value for the **ExternalContentMarkingToRemove** key, you have three options that use regular expressions:

- Partial match to remove everything in the header or footer.
    
    Example: Headers or footers contain the string **TEXT TO REMOVE**. You want to completely remove these headers or footers. You specify the value: `*TEXT*`.

- Complete match to remove just specific words in the header or footer.
    
    Example: Headers or footers contain the string **TEXT TO REMOVE**. You want to remove the word **TEXT** only, which leaves the header or footer string as **TO REMOVE**. You specify the value: `TEXT `.

- Complete match to remove everything in the header or footer.
    
    Example: Headers or footers have the string **TEXT TO REMOVE**. You want to remove headers or footers that have exactly this string. You specify the value: `^TEXT TO REMOVE$`.
    

The pattern matching for the string that you specify is case-insensitive. The maximum string length is 255 characters.

Because some documents might include invisible characters or different kinds of spaces or tabs, the string that you specify for a phrase or sentence might not be detected. Whenever possible, specify a single distinguishing word for the value and be sure to test the results before you deploy in production.

- Key: **ExternalContentMarkingToRemove**

- Value: \<**string to match, defined as regular expression**> 

#### Multiline headers or footers

If a header or footer text is more than a single line, create a key and value for each line. For example, you have the following footer with two lines:

**The file is classified as Confidential**

**Label applied manually**

To remove this multiline footer, you create the following two entries:

- Key 1: **ExternalContentMarkingToRemove**

- Key Value 1: **\*Confidential***

- Key 2: **ExternalContentMarkingToRemove**

- Key Value 2: **\*Label applied*** 

#### Optimization for PowerPoint

Footers in PowerPoint are implemented as shapes. To avoid removing shapes that contain the text that you have specified but are not headers or footers, use an additional advanced client setting named **PowerPointShapeNameToRemove**. We also recommend using this setting to avoid checking the text in all shapes, which is a resource-intensive process.

If you do not specify this additional advanced client setting, and PowerPoint is included in the **RemoveExternalContentMarkingInApp** key value, all shapes will be checked for the text that you specify in the **ExternalContentMarkingToRemove** value. 

To find the name of the shape that you're using as a header or footer:

1. In PowerPoint, display the **Selection** pane: **Format** tab > **Arrange** group > **Selection Pane**.

2. Select the shape on the slide that contains your header or footer. The name of the selected shape is now highlighted in the **Selection** pane.

Use the name of the shape to specify a string value for the **PowerPointShapeNameToRemove** key. 

Example: The shape name is **fc**. To remove the shape with this name, you specify the value: `fc`.

- Key: **PowerPointShapeNameToRemove**

- Value: \<**PowerPoint shape name**> 

When you have more than one PowerPoint shape to remove, create as many **PowerPointShapeNameToRemove** keys as you have shapes to remove. For each entry, specify the name of the shape to remove.

By default, only the Master slides are checked for headers and footers. To extend this search to all slides, which is a much more resource-intensive process, use an additional advanced client setting named **RemoveExternalContentMarkingInAllSlides**:

- Key: **RemoveExternalContentMarkingInAllSlides**

- Value: **True**

## Label an Office document by using an existing custom property

> [!NOTE]
> If you use this configuration and the configuration to [migrate labels from Secure Islands and other labeling solutions](#migrate-labels-from-secure-islands-and-other-labeling-solutions), the labeling migration setting takes precedence. 

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal. 

When you configure this setting, you can classify (and optionally, protect) an Office document when it has an existing custom property with a value that matches one of your label names. This custom property can be set from another classification solution, or can be set as a property by SharePoint.

As a result of this configuration, when a document without an Azure Information Protection label is opened and saved by a user in an Office app, the document is then labeled to match the corresponding property value. 

This configuration requires you to specify two advanced settings that work together. The first is named **SyncPropertyName**, which is the custom property name that has been set from the other classification solution, or a property that is set by SharePoint. The second is named **SyncPropertyState** and must be set to OneWay.

To configure this advanced setting, enter the following strings:

- Key 1: **SyncPropertyName**

- Key 1 Value: \<**property name**> 

- Key 2: **SyncPropertyState**

- Key 2 Value: **OneWay**

Use these keys and corresponding values for only one custom property.

As an example, you have a SharePoint column named **Classification** that has possible values of **Public**, **General**, and **Highly Confidential All Employees**. Documents are stored in SharePoint and have **Public**, **General**, or **Highly Confidential All Employees** as values set for the Classification property.

To label an Office document with one of these classification values, set **SyncPropertyName** to **Classification**, and **SyncPropertyState** to **OneWay**. 

Now, when a user opens and saves one of these Office documents, it is labeled  **Public**, **General**, or **Highly Confidential \ All Employees** if you have labels with these names in your Azure Information Protection policy. If you do not have labels with these names, the document remains unlabeled.

## Disable sending discovered sensitive information in documents to Azure Information Protection analytics

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal.

When the Azure Information Protection client is used in Office apps, it looks for sensitive information in documents when they are first saved. Providing the client isn't configured to not sent audit information, any predefined sensitive information types found are then sent to [Azure Information Protection analytics](../reports-aip.md). 

The configuration that controls whether the client sends audit information is the [policy setting](../configure-policy-settings.md) of **Send audit data to Azure Information Protection log analytics**. When this policy setting is **On** because you want to send audit information that includes labeling actions but you don't want to send sensitive information types found by the client, enter the following strings:

- Key: **RunAuditInformationTypesDiscovery**

- Value: **False**

If you set this advanced client setting, auditing information can still be sent from the client but the information is limited to labeling activity.

For example:

- With this setting, you can see that a user accessed Financial.docx that is labeled **Confidential \ Sales**.

- Without this setting, you can see that Financial.docx contains 6 credit card numbers.
    
    - If you also enable [deeper analytics into your sensitive data](../reports-aip.md#content-matches-for-deeper-analysis), you will additionally be able to see what those credit card numbers are.

## Disable sending information type matches for a subset of users

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal.

When you select the checkbox for [Azure Information Protection analytics](../reports-aip.md) that enables deeper analytics into your sensitive data collects the content matches for your sensitive information types or your custom conditions, by default, this information is sent by all users, which includes service accounts that run the Azure Information Protection scanner. If you have some users who should not send this data, create the following advanced client setting in a [scoped policy](../configure-policy-scope.md) for these users: 

- Key: **LogMatchedContent**

- Value: **Disable**


## Limit the number of threads used by the scanner

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal.

By default, the scanner uses all available processor resources on the computer running the scanner service. If you need to limit the CPU consumption while this service is scanning, create the following advanced setting. 

For the value, specify the number of concurrent threads that the scanner can run in parallel. The scanner uses a separate thread for each file that it scans, so this throttling configuration also defines the number of files that can be scanned in parallel. 

When you first configure the value for testing, we recommend you specify 2 per core, and then monitor the results. For example, if you run the scanner on a computer that has 4 cores, first set the value to 8. If necessary, increase or decrease that number, according to the resulting performance you require for the scanner computer and your scanning rates. 

- Key: **ScannerConcurrencyLevel**

- Value: **\<number of concurrent threads>**

## Disable the low integrity level for the scanner

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal.

By default, the Azure Information Protection scanner runs with a low integrity level. This setting provides higher security isolation but at the cost of performance. A low integrity level is suitable if you run the scanner with an account that has privileged rights (such as a local administrator account) because this setting helps to protect the computer running the scanner.

However, when the service account that runs the scanner has only the rights documented in the [scanner prerequisites](../deploy-aip-scanner.md#prerequisites-for-the-azure-information-protection-scanner), the low integrity level is not necessary and is not recommended because it negatively affects performance. 

For more information about the Windows integrity levels, see [What is the Windows Integrity Mechanism?](https://msdn.microsoft.com/library/bb625957.aspx)

To configure this advanced setting so that the scanner runs with an integrity level that's automatically assigned by Windows (a standard user account runs with a medium integrity level), enter the following strings:

- Key: **ProcessUsingLowIntegrity**

- Value: **False**

## Change the timeout settings for the scanner

This configuration uses [advanced client settings](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal.

By default, the Azure Information Protection scanner has a timeout period of 00:15:00 (15 minutes) to inspect each file for sensitive information types or the regex expressions that you've configured for custom conditions. When the timeout period is reached for this content extraction process, any results before the timeout are returned and further inspection for the file stops. In this scenario, the following error message is logged in %*localappdata*%\Microsoft\MSIP\Logs\MSIPScanner.iplog (zipped if there are multiple logs): **GetContentParts failed** with **The operation was canceled** in the details.

If you experience this timeout problem because of large files, you can increase this timeout period for full content extraction:

- Key: **ContentExtractionTimeout**

- Value: **\<hh:min:sec>**

The file type can influence how long it takes to scan a file. Example scanning times:

- A typical 100 MB Word file: 0.5-5 minutes

- A typical 100 MB PDF file: 5-20 minutes

- A typical 100 MB Excel file: 12-30 minutes

For some file types that are very large, such as video files, consider excluding them from the scan by adding the file name extension to the **File types to scan** option in the scanner profile.

In addition, the Azure Information Protection scanner has a timeout period of 00:30:00 (30 minutes) for each file that it processes. This value takes into account the time it can take to retrieve a file from a repository and temporarily save it locally for actions that can include decryption, content extraction for inspection, labeling, and encryption.

Although the Azure Information Protection scanner can scan dozens to hundreds of files per minute, if you have a data repository that has a high number of very large files, the scanner can exceed this default timeout period and in the Azure portal, seem to stop after 30 minutes. In this scenario, the following error message is logged in %*localappdata*%\Microsoft\MSIP\Logs\MSIPScanner.iplog (zipped if there are multiple logs) and the scanner .csv log file: **The operation was canceled**.

A scanner with 4 core processors by default has 16 threads for scanning and the probability of encountering 16 large files in a 30 minute time period depends on the ratio of the large files. For example, if the scanning rate is 200 files per minute, and 1% of files exceed the 30 minute timeout, there is a probability of more than 85% that the scanner will encounter the 30 minute timeout situation. These timeouts can result in longer scanning times and higher memory consumption.

In this situation, if you cannot add more core processors to the scanner computer, consider decreasing the timeout period for better scanning rates and lower memory consumption, but with the acknowledgment that some files will be excluded. Alternatively, consider increasing the timeout period for more accurate scanning results but with the acknowledgment that this configuration will likely result in lower scanning rates and higher memory consumption.

To change the timeout period for file processing, configure the following advanced client setting:

- Key: **FileProcessingTimeout**

- Value: **\<hh:min:sec>**

## Change the local logging level

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal.

By default, the Azure Information Protection client writes client log files to the **%localappdata%\Microsoft\MSIP** folder. These files are intended for troubleshooting by Microsoft Support.
 
To change the logging level for these files, configure the following advanced client setting:

- Key: **LogLevel**

- Value: **\<logging level>**

Set the logging level to one of the following values:

- **Off**: No local logging.

- **Error**: Errors only.

- **Info**: Minimum logging, which includes no event IDs (the default setting for the scanner).

- **Debug**: Full information.

- **Trace**: Detailed logging (the default setting for clients). For the scanner, this setting has a significant performance impact and should be enabled for the scanner only if requested by Microsoft Support. If you are instructed to set this level of logging for the scanner, remember to set a different value when the relevant logs have been collected.

This advanced client setting does not change the information that's sent to Azure Information Protection for [central reporting](../reports-aip.md), or change the information that's written to the local [event log](client-admin-guide-files-and-logging.md#usage-logging-for-the-azure-information-protection-client).

## Integration with Exchange message classification for a mobile device labeling solution

Although Outlook on the web doesn't yet natively support Azure Information Protection classification and protection, you can use Exchange message classification to extend your Azure Information Protection labels to your mobile users when they use Outlook on the web. Outlook Mobile does not support Exchange message classification.

To achieve this solution: 

1. Use the [New-MessageClassification](https://technet.microsoft.com/library/bb124400) Exchange PowerShell cmdlet to create message classifications with the Name property that maps to your label names in your Azure Information Protection policy. 

2. Create an Exchange mail flow rule for each label: Apply the rule when the message properties include the classification that you configured, and modify the message properties to set a message header. 

     For the message header, you find the information to specify by inspecting the Internet headers of an email that you sent and classified by using your Azure Information Protection label. Look for the header **msip_labels** and the string that immediately follows, up to and including the semicolon. For example:
    
    **msip_labels: MSIP_Label_0e421e6d-ea17-4fdb-8f01-93a3e71333b8_Enabled=True;**
    
    Then, for the message header in the rule, specify **msip_labels** for the header, and the remainder of this string for the header value. For example:
    
    ![Example Exchange Online mail flow rule that sets the message header for a specific Azure Information Protection label](../media/exchange-rule-for-message-header.png)
    
    Note: When the label is a sublabel, you must also specify the parent label before the sublabel in the header value, using the same format. For example, if your sublabel has a GUID of 27efdf94-80a0-4d02-b88c-b615c12d69a9, your value might look like the following:
    `MSIP_Label_ab70158b-bdcc-42a3-8493-2a80736e9cbd_Enabled=True;MSIP_Label_27efdf94-80a0-4d02-b88c-b615c12d69a9_Enabled=True;`

Before you test this configuration, remember that there is often a delay when you create or edit mail flow rules (for example, wait an hour). When the rule is in effect, the following events now happen when users use Outlook on the web: 

- Users select the Exchange message classification and send the email.

- The Exchange rule detects the Exchange classification and accordingly modifies the message header to add the Azure Information Protection classification.

- When internal recipients view the email in Outlook and they have the Azure Information Protection client installed, they see the Azure Information Protection label assigned. 

If your Azure Information Protection labels apply protection, add this protection to the rule configuration: Selecting the option to modify the message security, apply rights protection, and then select the protection template or Do Not Forward option.

You can also configure mail flow rules to do the reverse mapping. When an Azure Information Protection label is detected, set a corresponding Exchange message classification:

- For each Azure Information Protection label: Create a mail flow rule that is applied when the **msip_labels** header includes the name of your label (for example, **General**), and apply a message classification that maps to this label.


## Next steps
Now that you've customized the Azure Information Protection client, see the following resources for additional information that you might need to support this client:

- [Client files and usage logging](client-admin-guide-files-and-logging.md)

- [Document tracking](client-admin-guide-document-tracking.md)

- [File types supported](client-admin-guide-file-types.md)

- [PowerShell commands](client-admin-guide-powershell.md)


