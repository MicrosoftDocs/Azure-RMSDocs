---
# required metadata

title: Custom configurations for the Azure Information Protection client
description: Information about customizing the Azure Information Protection client for Windows.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 07/31/2018
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 5eb3a8a4-3392-4a50-a2d2-e112c9e72a78

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: eymanor
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Admin Guide: Custom configurations for the Azure Information Protection client

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*

Use the following information for advanced configurations that you might need for specific scenarios or a subset of users when you manage the Azure Information Protection client.

Some of these settings require editing the registry and some use advanced settings that you must configure in the Azure portal, and then publish for clients to download.  

### How to configure advanced client configuration settings in the portal

1. If you haven't already done so, in a new browser window, [sign in to the Azure portal](../deploy-use/configure-policy.md#signing-in-to-the-azure-portal), and then navigate to the **Azure Information Protection** blade.

2. From the **CLASSIFICATIONS** > **Labels** menu option: Select **Policies**.

3. On the **Azure Information Protection - Policies** blade, select the context menu (**...**) next to the policy to contain the advanced settings. Then select **Advanced settings**.
    
    You can configure advanced settings for the Global policy, as well as for scoped policies.

4. On the **Advanced settings** blade, type the advanced setting name and value, and then select **Save and close**.

5. Make sure that users for this policy restart any Office applications that they had open.

6. If you no longer need the setting and want to revert to the default behavior: On the **Advanced settings** blade, select the context menu (**...**) next to the setting you no longer need, and then select **Delete**. Then click **Save and close**.

## Prevent sign-in prompts for AD RMS only computers

By default, the Azure Information Protection client automatically tries to connect to the Azure Information Protection service. For computers that only communicate with AD RMS, this configuration can result in a sign-in prompt for users that is not necessary. You can prevent this sign-in prompt by editing the registry:

Locate the following value name, and then set the value data to **0**:

**HKEY_CURRENT_USER\SOFTWARE\Microsoft\MSIP\EnablePolicyDownload** 

Regardless of this setting, the Azure Information Protection client follows the standard [RMS service discovery process](../rms-client/client-deployment-notes.md#rms-service-discovery) to find its AD RMS cluster.

## Sign in as a different user

In a production environment, users wouldn't usually need to sign in as a different user when they are using the Azure Information Protection client. However, as an administrator, you might need to sign in as a different user during a testing phase. 

You can verify which account you're currently signed in as by using the **Microsoft Azure Information Protection** dialog box: Open an Office application and on the **Home** tab, in the **Protection** group, click **Protect**, and then click **Help and feedback**. Your account name is displayed in the **Client status** section.

Be sure to also check the domain name of the signed in account that's displayed. It can be easy to miss that you're signed in with the right account name but wrong domain. A symptom of using the wrong account includes failing to download the Azure Information Protection policy, or not seeing the labels or behavior that you expect.

To sign in as a different user:

1. Navigate to **%localappdata%\Microsoft\MSIP** and delete the **TokenCache** file.

2. Restart any open Office applications and sign in with your different user account. If you do not see a prompt in your Office application to sign in to the Azure Information Protection service, return to the **Microsoft Azure Information Protection** dialog box and click **Sign in** from the updated **Client status** section.

Additionally:

- This solution is supported for signing in as another user from the same tenant. It is not supported for signing in as another user from a different tenant. To test Azure Information Protection with multiple tenants, use different computers.

- If you are using single sign-on, you must sign out from Windows and sign in with your different user account after editing the registry. The Azure Information Protection client then automatically authenticates by using your currently signed in user account.

- You can use the **Reset settings** option from **Help and Feedback** to sign out and delete the currently downloaded Azure Information Protection policy.


## Enforce protection-only mode when your organization has a mix of licenses

If your organization does not have any licenses for Azure Information Protection, but does have licenses for Office 365 that include the Azure Rights Management service for data protection, the Azure Information Protection client for Windows automatically runs in [protection-only mode](../rms-client/client-protection-only-mode.md).

However, if your organization has a subscription for Azure Information Protection, by default all Windows computers can download the Azure Information Protection policy. The Azure Information Protection client does not do license checking and enforcement. 

If you have some users who do not have a license for Azure Information Protection but do have a license for Office 365 that includes the Azure Rights Management service, edit the registry on these users' computers to prevent users from running the unlicensed classification and labeling features from Azure Information Protection.

Locate the following value name and set the value data to **0**:

**HKEY_CURRENT_USER\SOFTWARE\Microsoft\MSIP\EnablePolicyDownload** 

In addition, check that these computers do not have a file named **Policy.msip** in the **%LocalAppData%\Microsoft\MSIP** folder. If this file exists, delete it. This file contains the Azure Information Protection policy and might have downloaded before you edited the registry, or if the Azure Information Protection client was installed with the demo option.

## Hide the Classify and Protect menu option in Windows File Explorer

Create the following DWORD value name (with any value data):

**HKEY_CLASSES_ROOT\AllFilesystemObjects\shell\Microsoft.Azip.RightClick\LegacyDisable**

## Support for disconnected computers

By default, the Azure Information Protection client automatically tries to connect to the Azure Information Protection service to download the latest Azure Information Protection policy. If you have computer that you know will not be able to connect to the Internet for a period of time, you can prevent the client from attempting to connect to the service by editing the registry. 

Locate the following value name and set the value data to **0**:

**HKEY_CURRENT_USER\SOFTWARE\Microsoft\MSIP\EnablePolicyDownload** 

Make sure that the client has a valid policy file named **Policy.msip**, in the **%LocalAppData%\Microsoft\MSIP** folder. If necessary, you can export the policy from the Azure portal and copy the exported file to the client computer. You can also use this method to replace an-out-of-date policy file with the latest, published policy.

When you export the policy, this action downloads a zipped file with multiple versions of the policy that corresponds to different versions of the Azure Information Protection client:

1. Unzip the file and use the following table to identify which policy file you need. 
    
    |File name|Corresponding client version|
    |--------------------------|---------------------------------------------|
    |Policy1.1.msip |version 1.2|
    |Policy1.2.msip |version 1.3 - 1.7|
    |Policy1.3.msip |version 1.8 - 1.29|
    |Policy1.4.msip |version 1.32 and later|
    
2. Rename the identified file to **Policy.msip**, and then copy it to the **%LocalAppData%\Microsoft\MSIP** folder on computers that have the Azure information protection client installed. 


## Hide or show the Do Not Forward button in Outlook

The recommended method to configure this option is by using the [policy setting](../deploy-use/configure-policy-settings.md) **Add the Do Not Forward button to the Outlook ribbon**. However, you can also configure this option by using an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you configure in the Azure portal.

When you configure this setting, it hides or shows the **Do Not Forward** button on the ribbon in Outlook. This setting has no effect on the Do Not Forward option from Office menus.

To configure this advanced setting, enter the following strings:

- Key: **DisableDNF**

- Value: **True** to hide the button, or **False** to show the button

## Make the custom permissions options available or unavailable to users

The recommended method to configure this option is by using the [policy setting](../deploy-use/configure-policy-settings.md) **Make the custom permissions option available for users**. However, you can also configure this option by using an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you configure in the Azure portal. 

When you configure this setting and publish the policy for users, the custom permissions options become available for users to select their own protection settings, or unavailable so that users can't select their own protection settings unless prompted.

To configure this advanced setting, enter the following strings:

- Key: **EnableCustomPermissions**

- Value: **True** to make the custom permissions option available, or **False** to make this option unavailable


## Permanently hide the Azure Information Protection bar

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal. Use it only when the [policy setting](../deploy-use/configure-policy-settings.md) **Display the Information Protection bar in Office apps** is set to **On**.

When you configure this setting and publish the policy for users, and a user chooses to not show the Azure Information Protection bar in their Office applications, the bar remains hidden. This happens when the user clears the  **Show Bar** option from the **Home** tab, **Protection** group, **Protect** button. This setting has no effect if the user closes the bar by using the **Close this bar** icon.

Even though the Azure Information Protection bar remains hidden, users can still select a label from the temporarily displayed bar if you have configured recommended classification, or when a document or email must have a label. 

To configure this advanced setting, enter the following strings:

- Key: **EnableBarHiding**

- Value: **True**


## Enable recommended classification in Outlook

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal. This setting is in preview and might change.

When you configure a label for recommended classification, users are prompted to accept or dismiss the recommended label in Word, Excel, and PowerPoint. This setting extends this label recommendation to also display in Outlook.

To configure this advanced setting, enter the following strings:

- Key: **OutlookRecommendationEnabled**

- Value: **True**


## Set a different default label for Outlook

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal. 

When you configure this setting, Outlook doesn't apply the default label that is configured in the Azure Information Protection policy for the setting **Select the default label**. Instead, Outlook can apply a different default label, or no label.

To apply a different label, you must specify the label ID. The label ID value is displayed on the **Label** blade, when you view or configure the Azure Information Protection policy in the Azure portal. For files that have labels applied, you can also run the [Get-AIPFileStatus](/powershell/module/azureinformationprotection/get-aipfilestatus) PowerShell cmdlet to identify the label ID (MainLabelId or SubLabelId). When a label has sublabels, always specify the ID of just a sublabel and not the parent label.

So that Outlook doesn't apply the default label, specify **None**.

To configure this advanced setting, enter the following strings:

- Key: **OutlookDefaultLabel**

- Value: \<**label ID**> or **None**

## Remove "Not now" for documents when you use mandatory labeling

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal. 

When you use the [policy setting](../deploy-use/configure-policy-settings.md) of **All documents and emails must have a label**, users are prompted to select a label when they first save an Office document and when they send an email. For documents, users can select **Not now** to temporarily dismiss the prompt to select a label and return to the document. However, they cannot close the saved document without labeling it. 

When you configure this setting, it removes the **Not now** option so that users must select a label when the document is first saved.

To configure this advanced setting, enter the following strings:

- Key: **PostponeMandatoryBeforeSave**

- Value: **False**

## Turn on classification to run continuously in the background

This configuration option is currently in preview and is subject to change.

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal. 

When you configure this setting, it changes the [default behavior](../deploy-use/configure-policy-classification.md#how-automatic-or-recommended-labels-are-applied) of how the Azure Information Protection client applies automatic and recommended labels as follows:

- Automatic classification applies to Word, Excel, PowerPoint, and Outlook. For documents, automatic classification runs continuously in the background. For Outlook, automatic classification runs when emails are sent. 
    
    You cannot use automatic classification for documents that were previously manually labeled, or previously automatically labeled with a higher classification. The exception to this behavior is if you use the Azure Information Protection scanner with the OverrideLabel parameter set to on.

- Recommended classification applies to Word, Excel, and PowerPoint. For these documents, recommended classification runs continuously in the background. You cannot use recommended classification for Outlook.
    
    You can use recommended classification for documents that were previously labeled, with or without a higher classification. 

When the Azure Information Protection client periodically checks documents for the condition rules that you specify, this behavior enables automatic and recommended classification and protection for documents that are stored in SharePoint Online. Large files also save more quickly because the condition rules have already run. 

The condition rules do not run in real time as a user types. Instead, they run periodically as a background task if the document is modified.

To configure this advanced setting, enter the following strings:

- Key: **RunPolicyInBackground**

- Value: **True**

## Migrate labels from Secure Islands and other labeling solutions

This configuration option is currently in preview and is subject to change. In addition, this configuration option requires the preview version of the client or the Azure Information Protection scanner.

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal. 

For Office documents and PDF documents that are labeled by Secure Islands, you can relabel these documents with an Azure Information Protection label by using a mapping that you define. You also use this method to reuse labels from other solutions when their labels are on Office documents. 

As a result of this configuration option, the new Azure Information Protection label is applied by the Azure Information Protection client as follows:

- For Office documents: When the document is opened in the desktop app, the new Azure Information Protection label is shown as set and is applied when the document is saved.

- For File Explorer: In the Azure Information Protection dialog box, the new Azure Information Protection label is shown as set and is applied when the user selects **Apply**. If the user selects **Cancel**, the new label is not applied.

- For PowerShell: [Set-AIPFileLabel](/powershell/module/azureinformationprotection/set-aipfilelabel) applies the new Azure Information Protection label. [Get-AIPFileStatus](/powershell/module/azureinformationprotection/get-aipfilestatus) doesn't display the new Azure Information Protection label until it is set by another method.

- For the Azure Information Protection scanner: Discovery reports when the new Azure Information Protection label would be set and this label can be applied with the enforce mode.

This configuration requires you to specify an advanced client setting named **LabelbyCustomProperty** for each Azure Information Protection label that you want to map to the old label. Then for each entry, set the value by using the following syntax:

`[Azure Information Protection label ID],[migration rule name],[Secure Islands custom property name],[Secure Islands metadata Regex value]`

The label ID value is displayed on the **Label** blade, when you view or configure the Azure Information Protection policy in the Azure portal. To specify a sublabel, the parent label must be in the same scope, or in the global policy.

Specify your choice of a migration rule name. Use a descriptive name that helps you to identify how one or more labels from your previous labeling solution should be mapped to an Azure Information Protection label. The name displays in the scanner reports and in Event Viewer. 

### Example 1: One-to-one mapping of the same label name

Documents that have a Secure Islands label of "Confidential" should be relabeled as "Confidential" by Azure Information Protection.

In this example:

- The Azure Information Protection label of **Confidential** has a label ID of 1ace2cc3-14bc-4142-9125-bf946a70542c. 

- The Secure Islands label is stored in the custom property named **Classification**.

The advanced client setting:

    
|Name|Value|
|---------------------|---------|
|LabelbyCustomProperty|1ace2cc3-14bc-4142-9125-bf946a70542c,"Secure Islands label is Confidential",Classification,Confidential|

### Example 2: One-to-one mapping for a different label name

Documents labeled as "Sensitive" by Secure Islands should be relabeled as "Highly Confidential" by Azure Information Protection.

In this example:

- The Azure Information Protection label **Highly Confidential** has a label ID of 3e9df74d-3168-48af-8b11-037e3021813f.

- The Secure Islands label is stored in the custom property named **Classification**.

The advanced client setting:

    
|Name|Value|
|---------------------|---------|
|LabelbyCustomProperty|3e9df74d-3168-48af-8b11-037e3021813f,"Secure Islands label is Sensitive",Classification,Sensitive|


### Example 3: Many-to-one mapping of label names

You have two Secure Islands labels that include the word "Internal" and you want documents that have either of these Secure Islands labels to be relabeled as "General" by Azure Information Protection.

In this example:

- The Azure Information Protection label **General** has a label ID of 2beb8fe7-8293-444c-9768-7fdc6f75014d.

- The Secure Islands label is stored in the custom property named **Classification**.

The advanced client setting:

    
|Name|Value|
|---------------------|---------|
|LabelbyCustomProperty|2beb8fe7-8293-444c-9768-7fdc6f75014d,"Secure Islands label contains Internal",Classification,.\*Internal.\*|


## Label an Office document by using an existing custom property

> [!NOTE]
> If you use this configuration and the configuration from the previous section to migrate from another labeling solution, the labeling migration setting takes precedence. 

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

## Disable the low integrity level for the scanner

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal. 

By default, the Azure Information Protection scanner runs with a low integrity level. This setting provides higher security isolation but at the cost of performance. A low integrity level is suitable if you run the scanner with an account that has privileged rights (such as a local administrator account) because this setting helps to protect the computer running the scanner.

However, when the service account that runs the scanner has only the rights documented in the [scanner prerequisites](../deploy-use/deploy-aip-scanner.md#prerequisites-for-the-azure-information-protection-scanner), the low integrity level is not necessary and is not recommended because it negatively affects performance. 

For more information about the Windows integrity levels, see [What is the Windows Integrity Mechanism?](https://msdn.microsoft.com/library/bb625957.aspx)

To configure this advanced setting so that the scanner runs with an integrity level that's automatically assigned by Windows (a standard user account runs with a medium integrity level), enter the following strings:

- Key: **ProcessUsingLowIntegrity**

- Value: **False**


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

Before you test this configuration, remember that there is often a delay when you create or edit mail flow rules (for example, wait an hour). When the rule is in effect, the following events now happen when users use Outlook on the web or a mobile device client that supports Exchange ActiveSync IRM: 

- Users select the Exchange message classification and send the email.

- The Exchange rule detects the Exchange classification and accordingly modifies the message header to add the Azure Information Protection classification.

- When internal recipients view the email in Outlook and they have the Azure Information Protection client installed, they see the Azure Information Protection label assigned. 

If your Azure Information Protection labels apply protection, add this protection to the rule configuration: Selecting the option to modify the message security, apply rights protection, and then select the RMS template or Do Not Forward option.

You can also configure mail flow rules to do the reverse mapping. When an Azure Information Protection label is detected, set a corresponding Exchange message classification:

- For each Azure Information Protection label: Create a mail flow rule that is applied when the **msip_labels** header includes the name of your label (for example, **General**), and apply a message classification that maps to this label.


## Next steps
Now that you've customized the Azure Information Protection client, see the following resources for additional information that you might need to support this client:

- [Client files and usage logging](client-admin-guide-files-and-logging.md)

- [Document tracking](client-admin-guide-document-tracking.md)

- [File types supported](client-admin-guide-file-types.md)

- [PowerShell commands](client-admin-guide-powershell.md)


[!INCLUDE[Commenting house rules](../includes/houserules.md)]
