---
# required metadata

title: Custom configurations for the Azure Information Protection client
description: Information about customizing the Azure Information Protection client for Windows.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 05/18/2017
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

Use the following information for advanced configurations that you might need for specific scenarios or a subset of users. 

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

- If you are using single sign-on, you will need to sign out from Windows and sign in with your different user account after editing the registry. The Azure Information Protection client will automatically authenticate by using your currently signed in user account.

- If you want to reinitialize the environment for the Azure Rights Management service (also known as bootstrapping), you can do this by using the **Reset** option from the [RMS Analyzer tool](https://www.microsoft.com/en-us/download/details.aspx?id=46437).

- If you want to delete the currently downloaded Azure Information Protection policy, delete the **Policy.msip** file from the **%localappdata%\Microsoft\MSIP** folder.

## Hide the Classify and Protect menu option in Windows File Explorer

You can configured this advanced configuration by editing the registry when you have a version of the Azure Information Protection client that is 1.3.0.0 or higher. 

Create the following DWORD value name (with any value data):

**HKEY_CLASSES_ROOT\AllFilesystemObjects\shell\Microsoft.Azip.RightClick\LegacyDisable**

## Support for disconnected computers

By default, the Azure Information Protection client automatically tries to connect to the Azure Information Protection service to download the latest Azure Information Protection policy. If you have computer that you know will not be able to connect to the Internet for a period of time, you can prevent the client from attempting to connect to the service by editing the registry. 
Locate the following value name and set the value data to **0**:

**HKEY_CURRENT_USER\SOFTWARE\Microsoft\MSIP\EnablePolicyDownload** 

Make sure that the client has a valid policy file named **Policy.msip**, in the **%localappdata%\Microsoft\MSIP** folder. If necessary, you can export the policy from the Azure portal and copy the exported file to the client computer. You can also use this method to replace an out of date policy file with the latest, published policy.


## Next steps
Now that you've customized the Azure Information Protection client, see the following for additional information that you might need to support this client:

- [Client files and usage logging](client-admin-guide-files-and-logging.md)

- [Document tracking](client-admin-guide-document-tracking.md)

- [File types supported](client-admin-guide-file-types.md)

- [PowerShell commands](client-admin-guide-powershell.md)


[!INCLUDE[Commenting house rules](../includes/houserules.md)]
