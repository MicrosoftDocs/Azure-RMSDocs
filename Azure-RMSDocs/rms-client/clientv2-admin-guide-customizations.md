---
# required metadata

title: Custom configurations for the Azure Information Protection unified labeling client
description: Information about customizing the Azure Information Protection unified labeling client for Windows.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 04/17/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
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

# Admin Guide: Custom configurations for the Azure Information Protection unified labeling client

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*
>
> *Instructions for: [Azure Information Protection unified labeling client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-client-and-the-azure-information-protection-unified-labeling-client)*

Use the following information for advanced configurations that you might need for specific scenarios or a subset of users when you manage the Azure Information Protection unified labeling client.

These settings require editing the registry.  

## Sign in as a different user

In a production environment, users wouldn't usually need to sign in as a different user when they are using the Azure Information Protection unified labeling client. However, as an administrator, you might need to sign in as a different user during a testing phase. 

You can verify which account you're currently signed in as by using the **Microsoft Azure Information Protection** dialog box: Open an Office application and on the **Home** tab, select the **Sensitivity** button, and then select **Help and feedback**. Your account name is displayed in the **Client status** section.

Be sure to also check the domain name of the signed in account that's displayed. It can be easy to miss that you're signed in with the right account name but wrong domain. A symptom of using the wrong account includes failing to download the labels, or not seeing the labels or behavior that you expect.

To sign in as a different user:

1. Navigate to **%localappdata%\Microsoft\MSIP** and delete the **TokenCache** file.

2. Restart any open Office applications and sign in with your different user account. If you do not see a prompt in your Office application to sign in to the Azure Information Protection service, return to the **Microsoft Azure Information Protection** dialog box and select **Sign in** from the updated **Client status** section.

Additionally:

- If the Azure Information Protection unified labeling client is still signed in with the old account after completing these steps, delete all cookies from Internet Explorer, and then repeat steps 1 and 2.

- If you are using single sign-on, you must sign out from Windows and sign in with your different user account after deleting the token file. The Azure Information Protection unified labeling client then automatically authenticates by using your currently signed in user account.

- This solution is supported for signing in as another user from the same tenant. It is not supported for signing in as another user from a different tenant. To test Azure Information Protection with multiple tenants, use different computers.

- You can use the **Reset settings** option from **Help and Feedback** to sign out and delete the currently downloaded labels and policy settings from the Office 365 Security & Compliance Center, the Microsoft 365 Security center, or the Microsoft 365 Compliance center.


## Change the local logging level

By default, the Azure Information Protection unified labeling client writes client log files to the **%localappdata%\Microsoft\MSIP** folder. These files are intended for troubleshooting by Microsoft Support.
 
To change the logging level for these files, locate the following value name in the registry and set the value data to the required logging level:

**HKEY_CURRENT_USER\SOFTWARE\Microsoft\MSIP\LogLevel**

Set the logging level to one of the following values:

- **Off**: No local logging.

- **Error**: Errors only.

- **Info**: Minimum logging, which includes no event IDs.

- **Debug**: Full information.

- **Trace**: Detailed logging (the default setting for clients).

This registry setting does not change the information that's sent to Azure Information Protection for [central reporting](../reports-aip.md).


## Next steps
Now that you've customized the Azure Information Protection unified labeling client, see the following resources for additional information that you might need to support this client:

- [Client files and usage logging](client-admin-guide-files-and-logging.md)

- [File types supported](client-admin-guide-file-types.md)

- [PowerShell commands](client-admin-guide-powershell.md)
