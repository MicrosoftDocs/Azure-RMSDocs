---
# required metadata

title: Configure your app for ADAL authentication - AIP
description: Steps for configuring Azure Information Protection app to use Azure ADAL based authentication
keywords: authentication, RMS, ADAL, Informatin Protection,
author: msmbaldwin
ms.author: mbaldwin
manager: barbkess
ms.date: 03/13/2017
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: f89f59b7-33d1-4ab3-bb64-1e9bda269935

# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Configure your app for ADAL authentication

This topic describes the steps for configuring your app for Azure Active Directory Authentication Library (ADAL) based authentication.

## Azure authentication setup

You will need the following:

- A [subscription for Microsoft Azure](https://azure.microsoft.com/) (a free trial is sufficient). For more information, see [How users sign up for RMS for individuals](../rms-for-individuals-user-sign-up.md)
- A subscription for Microsoft Azure Rights Management (a free [RMS for Individuals](https://technet.microsoft.com/library/dn592127.aspx) account is sufficient).

> [!NOTE]
> Ask your IT Admin whether or not you have a subscription for Microsoft Azure Rights Management and, have your IT Admin perform the steps below. If your organization does not have a subscription, you should have your IT admin create one. Also, your IT Admin should subscribe with a *Work or school account*, rather than a *Microsoft account* (i.e. Hotmail).

After signing up for Microsoft Azure:

- Login to the [Azure Management Portal](https://manage.windowsazure.com) for your organization using an account with administrative privileges.

![Azure login](../media/AzurePortalLogin.png)

- Browse down to the **Active Directory** application on the left side of the portal.

![Select Active Directory](../media/AzureADPick.png)

- If you haven’t created a directory already, choose the **New** button located in the bottom left corner of the portal.

![Select NEW](../media/AzureNewBtn.png)

- Select the **Rights Management** tab and ensure that the **Rights Management Status** is either **Active**, **Unknown** or **Unauthorized**. If the status is **Inactive**, choose the **Activate** button at the bottom, center portion of the portal and confirm your selection.

![Choose ACTIVATE](../media/RMTab.png)

- Now, create a new *Native Application* in your directory by selecting your directory, choosing Applications.

![Select APPLICATIONS](../media/CreateNativeApp.png)

- Then choose the **Add** button located in the bottom, center portion of the portal.

![Select ADD](../media/AddAppBtn.png)

- At the prompt choose **Add an application my organization is developing**.

![Select Add an application my organization is developing](../media/AddAnAppPick.png)

- Name your application by selecting **NATIVE CLIENT APPLICATION** and choosing the **Next** button.

![Name your app](../media/TellUsInput.png)

- Add a redirection URI and choose next.
  The redirection URI needs to be a valid URI and unique to your directory. For example, you could use something like `https://contoso.azurewebsites.net/.auth/login/done`.

![Add redirect URI](../media/RedirectURI.png)

- Select your application in the directory and choose **CONFIGURE**.

![Choose CONFIGURE](../media/ConfigYourApp.png)

>[!NOTE]
> Copy the **CLIENT ID** and **REDIRECT URI** and store them for future use when configuring the RMS client.

- Browse to the bottom of your application settings and choose the **Add application** button under **permissions to other applications**.

>[!NOTE]
> The **Delegated Permissions** that are shown for Windows Azure Active Directory are correct by default – only one option should be selected and that option is **Sign in and read user profile**.

![Select Add application](../media/PermissionsToOtherBtn.png)

- Choose the plus button next to **Microsoft Rights Management**.

![Select the + button](../media/ChoosePlusBtn.png)

- Now, choose the check mark located on the bottom left corner of the dialog.

![Choose check mark](../media/choosecheck01.png)

- You’re now ready to add a dependency to your application for Azure RMS. To add the dependency, select the new **Microsoft Rights Management Services** entry under **permissions to other applications** and choose the **Create and access protected content for users** checkbox under the **Delegated Permissions:** drop box.

![Setup permissions](../media/AddDependency.png)

- Save your application to persist the changes by choosing the **Save** icon located on the bottom, center of the portal.

![Select SAVE](../media/SaveApplication.png)

