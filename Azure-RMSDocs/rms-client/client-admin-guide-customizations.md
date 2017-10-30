---
# required metadata

title: Custom configurations for the Azure Information Protection client
description: Information about customizing the Azure Information Protection client for Windows.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 10/31/2017
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

>*Applies to: Active Directory Rights Management Services, Azure Information Protection, Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*

Use the following information for advanced configurations that you might need for specific scenarios or a subset of users when you manage the Azure Information Protection client.

Some of these settings require editing the registry and some use advanced settings that you must configure in the Azure portal, and then publish for clients to download.  

### How to configure advanced client configuration settings in the portal

1. If you haven't already done so, in a new browser window, sign in to the [Azure portal](https://portal.azure.com) as a security admin or global admin, and then navigate to the **Azure Information Protection** blade.

2. On the initial  Azure Information Protection blade, select **Scoped policies**.

3. On the **Azure Information Protection - Scoped policies** blade, select the context menu (**...**) next to the policy to contain the advanced settings. Then select **Advanced settings**.
    
    You can configure advanced settings for the Global policy, as well as for scoped policies.

4. On the **Advanced settings** blade, type the advanced setting name and value, and then select **Save and close**.

5. Click **Publish**, and make sure that users for this policy restart any Office applications that they had open.

6. If you no longer need the setting and want to revert to the default behavior: On the **Advanced settings** blade, select the context menu (**...**) next to the setting you no longer need, and then select **Delete**. Then click **Save and close**, and republish the modified policy.

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
    |Policy1.3.msip |version 1.8 and later|
    
2. Rename the identified file to **Policy.msip**, and then copy it to the **%LocalAppData%\Microsoft\MSIP** folder on computers that have the Azure information protection client installed. 


## Hide the Do Not Forward button in Outlook

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal.

When you configure this setting, it hides the **Do Not Forward** button from the ribbon in Outlook. It does not hide this option from Office menus.

To configure this advanced setting, enter the following strings:

- Key: **DisableDNF**

- Value: **True**

## Make the custom permissions options unavailable to users

> [!IMPORTANT]
> Unless you use the current preview version of the client, do not use this option if you have labels that are configured for user defined permissions for Word, Excel, PowerPoint, and File Explorer. If you do, when the label is applied, users are not prompted to configure the custom permissions. The result is that the document is labeled but it is not protected as you intended.

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal. 

When you configure this setting and publish the policy for users, the custom permissions options from the following locations become unavailable for users to select:

- In Office applications: **Home** tab > **Protection** group > **Protect** > **Custom Permissions**

- From File Explorer: Right-click > **Classify and protect** > **Custom permissions**

This setting has no effect on custom permissions that you can configure from Office menu options. 

To configure this advanced setting, enter the following strings:

- Key: **EnableCustomPermissions**

- Value: **False**

## Permanently hide the Azure Information Protection bar

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal. 

When you configure this setting and publish the policy for users, and a user chooses to not show the Azure Information Protection bar in their Office applications, the bar remains hidden. This happens when the user clears the  **Show Bar** option from the **Home** tab, **Protection** group, **Protect** button. This setting has no effect if the user closes the bar by using the **Close this bar** icon.

Even though the Azure Information Protection bar remains hidden, users can still select a label from the temporarily displayed bar if you have configured recommended classification, or when a document or email must have a label. The setting also has no effect on labels that you or others configure, such as manual or automatic classification, or setting a default label.

To configure this advanced setting, enter the following strings:

- Key: **EnableBarHiding**

- Value: **True**


## Enable recommended classification in Outlook

This configuration option is currently in preview and is subject to change.

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal.

When you configure a label for recommended classification, users are prompted to accept or dismiss the recommended label in Word, Excel, and PowerPoint. This setting extends this label recommendation to also display in Outlook.

To configure this advanced setting, enter the following strings:

- Key: **OutlookRecommendationEnabled**

- Value: **True**


## Set a different default label for Outlook

This configuration option is currently in preview and is subject to change. In addition, this configuration option requires the preview version of the client.

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal. 

When you configure this setting, Outlook doesn't apply the default label that is configured in the Azure Information Protection policy for the setting **Select the default label**. Instead, Outlook can apply a different default label, or no label.

To apply a different label, you must specify the label ID. The label ID value is displayed on the **Label** blade, when you view or configure the Azure Information Protection policy in the Azure portal. For files that have labels applied, you can also run the [Get-AIPFileStatus](/powershell/module/azureinformationprotection/get-aipfilestatus) PowerShell cmdlet to identify the label ID (MainLabelId or SubLabelId). When a label has sub-labels, always specify the ID of just a sub-label and not the parent label.

So that Outlook doesn't apply the default label, specify **None**.

To configure this advanced setting, enter the following strings:

- Key: **OutlookDefaultLabel**

- Value: \<**label ID**> or **None**

## Automatically label a document by using an existing document property

This configuration option is currently in preview and is subject to change. 

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal. 

When you configure this setting, you can automatically classify (and optionally, protect) a document, using existing properties in the document's metadata. For example, a custom property that has been set from another classification solution, or a property that is used by SharePoint Online.

As a result of this configuration, when a document without an Azure Information Protection label is opened by a user in an Office app, the document is automatically labeled to match the corresponding property value.

This configuration requires you to specify two advanced settings that work together. The first is named **SyncPropertyName**, where the name of your Azure Information Protection bar title must be the same as the property name in the metadata that contains the classification value.

By default, the Azure Information Protection bar title is **Sensitivity**. If the custom property that you want to use for automatic labeling has a different name, you must change the Azure Information Protection bar title in the Azure Information Protection policy.

To configure this advanced setting, enter the following strings:

- Key 1: **SyncPropertyName**

- Key 1 Value: \<**property name**> 

- Key 2: **SyncPropertyState**

- Key 2 Value: **OneWay**


## Integration with Exchange message classification for a mobile device labeling solution

Although Outlook on the web doesn't yet natively support Azure Information Protection classification and protection, you can use Exchange message classification to extend your Azure Information Protection labels to your mobile users.

To achieve this solution: 

1. Use the [New-MessageClassification](https://technet.microsoft.com/library/bb124400) Exchange PowerShell cmdlet to create message classifications with the Name property that maps to your label names in your Azure Information Protection policy. 

2. Create an Exchange transport rule for each label: Apply the rule when the message properties include the classification that you configured, and modify the message properties to set a message header. 

    For the message header, you find the information to specify by inspecting the Internet headers of an email that you sent and classified by using your Azure Information Protection label. Look for the header **msip_labels** and the string that immediately follows, up to and including the semicolon. Using the previous example:
    
    **msip_labels: MSIP_Label_0e421e6d-ea17-4fdb-8f01-93a3e71333b8_Enabled=True;**
    
    Then, for the message header in the rule, specify **msip_labels** for the header, and the remainder of this string for the header value. For example:
    
    ![Example Exchange Online transport rule that sets the message header for a specific Azure Information Protection label](../media/exchange-rule-for-message-header.png)

Before you test this configuration, remember that there is often a delay when you create or edit transport rules (for example, wait an hour). When the rule is in effect, the following events now happen when users use Outlook on the web or a mobile device client that supports Rights Management protection: 

- Users select the Exchange message classification and send the email.

- The Exchange rule detects the Exchange classification and accordingly modifies the message header to add the Azure Information Protection classification.

- When recipients view the email in Outlook and they have the Azure Information Protection client installed, they see the Azure Information Protection label assigned and any corresponding email header, footer, or watermark. 

If your Azure Information Protection labels apply rights management protection, add this protection to the rule configuration: Selecting the option to modify the message security, apply rights protection, and then select the RMS template or Do Not Forward option.

You can also configure transport rules to do the reverse mapping. When an Azure Information Protection label is detected, set a corresponding Exchange message classification:

- For each Azure Information Protection label: Create a transport rule that is applied when the **msip_labels** header includes the name of your label (for example, **General**), and apply a message classification that maps to this label.


## Next steps
Now that you've customized the Azure Information Protection client, see the following resources for additional information that you might need to support this client:

- [Client files and usage logging](client-admin-guide-files-and-logging.md)

- [Document tracking](client-admin-guide-document-tracking.md)

- [File types supported](client-admin-guide-file-types.md)

- [PowerShell commands](client-admin-guide-powershell.md)


[!INCLUDE[Commenting house rules](../includes/houserules.md)]
