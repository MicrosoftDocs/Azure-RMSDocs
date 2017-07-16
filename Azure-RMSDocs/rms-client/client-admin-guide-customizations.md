---
# required metadata

title: Custom configurations for the Azure Information Protection client
description: Information about customizing the Azure Information Protection client for Windows.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 07/17/2017
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

# Custom configurations for the Azure Information Protection client

>*Applies to: Active Directory Rights Management Services, Azure Information Protection, Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*

Use the following information for advanced configurations that you might need for specific scenarios or a subset of users when you manage the Azure Information Protection client.

Some of these settings require editing the registry and some use advanced settings that you must configure in the Azure portal, and then publish for clients to download. 

In addition, some settings might only be available in a preview version of the Azure Information Protection client. For these settings, a minimum client version is documented. For settings and configurations that are available in the general availability version of the client, no minimal client version number is documented.

### How to configure advanced client configuration settings in the portal

1. If you haven't already done so, in a new browser window, sign in to the [Azure portal](https://portal.azure.com) as a security admin or global admin, and then navigate to the **Azure Information Protection** blade.

2. On the initial  Azure Information Protection blade, select **Scoped policies**.

3. On the **Azure Information Protection - Scoped policies** blade, select the context menu (**...**) next to the policy to contain the advanced settings. Then select **Advanced settings**.
    
    You can configure advanced settings for the Global policy, as well as for scoped policies.

4. On the **Advanced settings** blade, type the advanced setting name and value, and then select **Save and close**.

5. Click **Publish**, and make sure that users for this policy restart any Office applications that they had open.

6. If you no longer need the setting and want to revert to the default behavior: On the **Advanced settings** blade, select the context menu (**...**) next to the setting you no longer need, and then select **Delete**. Then click **Save and close**, and republish the modified policy.

## Prevent sign-in prompts for AD RMS only computers

By default, the Azure Information Protection client automatically tries to connect to the Azure Information Protection service. For computers that only communicate with AD RMS, this can result in a sign-in prompt for users that is not necessary. You can prevent this sign-in prompt by editing the registry:

Locate the following value name, and then set the value data to **0**:

**HKEY_CURRENT_USER\SOFTWARE\Microsoft\MSIP\EnablePolicyDownload** 

Regardless of this setting, the Azure Information Protection client follows the standard [RMS service discovery process](../rms-client/client-deployment-notes.md#rms-service-discovery) to find its AD RMS cluster.

## Sign in as a different user

In a production environment, users wouldn't usually need to sign in as a different user when they are using the Azure Information Protection client. However, you might need to do so as an administrator if you have multiple tenants. For example, you have a test tenant in addition to the Office 365 or Azure tenant that your organization uses.

You can verify which account you're currently signed in as by using the **Microsoft Azure Information Protection** dialog box: Open an Office application and on the **Home** tab, in the **Protection** group, click **Protect**, and then click **Help and feedback**. Your account name is displayed in the **Client status** section.

Especially when you're using an administrator account, be sure to check the domain name of the signed in account that's displayed. For example, if you have an "admin" account in two different tenants, it can be easy to miss that you're signed in with the right account name but wrong domain. A symptom of this can be failing to download the Azure Information Protection policy, or not seeing the labels or behavior that you expect.

To sign in as a different user:

1. Using a registry editor, navigate to **HKEY_CURRENT_USER\SOFTWARE\Microsoft\MSIP** and delete the **TokenCache** value (and its associated value data).

2. Restart any open Office applications and sign in with your different user account. If you do not see a prompt in your Office application to sign in to the Azure Information Protection service, return to the **Microsoft Azure Information Protection** dialog box and click **Sign in** from the updated **Client status** section.

Additionally:

- If you are using single sign-on, you must sign out from Windows and sign in with your different user account after editing the registry. The Azure Information Protection client then automatically authenticates by using your currently signed in user account.

- If you want to reset the user settings for the Azure Rights Management service, you can do this by using the **Help and Feedback** option.

- If you want to delete the currently downloaded Azure Information Protection policy, delete the **Policy.msip** file from the **%localappdata%\Microsoft\MSIP** folder.

## Hide the Classify and Protect menu option in Windows File Explorer

You can configure this advanced configuration by editing the registry. 

Create the following DWORD value name (with any value data):

**HKEY_CLASSES_ROOT\AllFilesystemObjects\shell\Microsoft.Azip.RightClick\LegacyDisable**

## Support for disconnected computers

By default, the Azure Information Protection client automatically tries to connect to the Azure Information Protection service to download the latest Azure Information Protection policy. If you have computer that you know will not be able to connect to the Internet for a period of time, you can prevent the client from attempting to connect to the service by editing the registry. 
Locate the following value name and set the value data to **0**:

**HKEY_CURRENT_USER\SOFTWARE\Microsoft\MSIP\EnablePolicyDownload** 

Make sure that the client has a valid policy file named **Policy.msip**, in the **%localappdata%\Microsoft\MSIP** folder. If necessary, you can export the policy from the Azure portal and copy the exported file to the client computer. You can also use this method to replace an-out-of-date policy file with the latest, published policy.

## Hide the Do Not Forward button in Outlook

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal. This setting also requires a preview version of the Azure Information Protection client that has a minimum version of **1.8.41.0**.

When you configure this setting, it hides the **Do Not Forward** button from the ribbon in Outlook. It does not hide this option from Office menus.

To configure this advanced setting, enter the following strings:

- Key: **DisableDNF**

- Value: **True**

## Make the custom permissions options unavailable to users

This configuration uses an [advanced client setting](#how-to-configure-advanced-client-configuration-settings-in-the-portal) that you must configure in the Azure portal. 

When you configure this setting and publish the policy for users, the custom permissions options from the following locations become unavailable for users to select:

- In Office applications: **Home** tab > **Protection** group > **Protect** > **Custom Permissions**

- From File Explorer: Right-click > **Classify and protect** > **Custom permissions**

This setting has no effect on custom permissions that you can configure from Office menu options. 

To configure this advanced setting, enter the following strings:

- Key: **EnableCustomPermissions**

- Value: **False**

## Permanently hide the Azure Information Protection bar

This configuration uses an advanced setting that you must configure in the Azure portal. This setting also requires a preview version of the Azure Information Protection client that has a minimum version of **1.9.58.0 **.

When you configure this setting and publish the policy for users, and a user chooses to not show the Azure Information Protection bar in their Office applications, the bar remains hidden. This happens when the user clears the  **Show Bar** option from the **Home** tab, **Protection** group, **Protect** button. This setting has no effect if the user closes the bar by using the **Close this bar** icon.

Even though the Azure Information Protection bar remains hidden, users can still select a label from the temporarily displayed bar if you have configured recommended classification, or when a document or email must have a label. The setting also has no effect on labels that you or others configure, such as manual or automatic classification, or setting a default label.

To configure this advanced setting, enter the following strings:

- Key: **EnableBarHiding**

- Value: **True**

## Integration with Exchange message classification for a mobile device labeling solution

Although Outlook on the web doesn't yet natively support Azure Information Protection classification and protection, you can use Exchange message classification to extend your Azure Information Protection labels to your mobile users.

To achieve this solution: 

1. Use the [New-MessageClassification](https://technet.microsoft.com/library/bb124400) Exchange PowerShell cmdlet to create message classifications with the Name property that maps to your label names in your Azure Information Protection policy. 

2. Create an Exchange transport rule for each label: Apply the rule when the message properties include the classification that you configured, and modify the message properties to set a message header. 

    For the message header, you find the information to specify by inspecting the Internet headers of an email that you sent and classified by using your Azure Information Protection label. Look for the header **msip_labels** and the string that immediately follows, up to and including the semicolon. Using the previous example:
    
    **msip_labels: MSIP_Label_0e421e6d-ea17-4fdb-8f01-93a3e71333b8_Enabled=True;**
    
    Then, for the message header in the rule, specify **msip_labels** for the header, and the remainder of this string for the header value. For example:
    
    ![Example Exchange Online transport rule that sets the message header for a specific Azure Information Protection label](../media/exchange-rule-for-message-header.png)

Before you test this, remember that there is often a delay when you create or edit transport rules (for example, wait an hour). When the rule is in effect, the following now happens when users use Outlook on the web or a mobile device client that supports Rights Management protection: 

- Users select the Exchange message classification and send the email.

- The Exchange rule detects the Exchange classification and accordingly modifies the message header to add the Azure Information Protection classification.

- 
- the email in Outlook, they see the Azure Information Protection label assigned and any corresponding email header, footer, or watermark. 

If your Azure Information Protection labels apply rights management protection, add this to the rule configuration by selecting the option to modify the message security, apply rights protection, and then select the RMS template or Do Not Forward option.

You can also configure transport rules to do the reverse mapping: When an Azure Information Protection label is detected, set a corresponding Exchange message classification. To do this:

- For each Azure Information Protection label, create a transport rule that is applied when the **msip_labels** header includes the name of your label (for example, **General**), and apply a message classification that maps to this label.


## Next steps
Now that you've customized the Azure Information Protection client, see the following for additional information that you might need to support this client:

- [Client files and usage logging](client-admin-guide-files-and-logging.md)

- [Document tracking](client-admin-guide-document-tracking.md)

- [File types supported](client-admin-guide-file-types.md)

- [PowerShell commands](client-admin-guide-powershell.md)


[!INCLUDE[Commenting house rules](../includes/houserules.md)]
