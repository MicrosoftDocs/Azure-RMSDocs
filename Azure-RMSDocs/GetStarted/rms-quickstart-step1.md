---
title: Quick start tutorial for Azure Rights Management
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 1db923bf-7d19-4fdd-a413-bfeb58af5e03
author: Cabailey
---

# Azure RMS Quickstart Step 1: Activate the Rights Management service

Jump to: 
> [AZURE.SELECTOR]
- [Introduction](rms-quickstart-intro.md)
- [Step 2](rms-quickstart-step2.md)
- [Step 3](rms-quickstart-step3.md)
- [Step 4](rms-quickstart-step4.md)
- [Step 5](rms-quickstart-step5.md)

![](../media/AzRMS_QuickStartSteps1.PNG)

Even though you might have a subscription that supports Azure Rights Management, the service is disabled by default. To activate it, you can use either the Office 365 admin center, or the Azure classic portal:

-   If you have an Office 365 subscription that includes Azure Rights Management, or an Office 365 subscription that excludes Azure Rights Management but you have a subscription for Azure RMS Premium: **Use the Office 365 admin center**.

-   If you do not have an Office 365 subscription: **Use the Azure classic portal**.

![](../media/AzRMS_Tutorial_1_Screenshots.png)

#### To activate Rights Management from the Office 365 admin center

1.  Go to the [Office 365 portal](https://portal.office.com/) and sign in with your work or school account.

2.  If the Office 365 admin center does not automatically display, select the app launcher icon in the upper-left and choose **Admin**. The **Admin** tile appears only to Office 365 administrators.

    > [!TIP]
    > For admin center help, see [About the Office 365 admin center - Admin Help](https://support.office.com/article/About-the-Office-365-admin-center-Admin-Help-58537702-d421-4d02-8141-e128e3703547).

3.  In the left pane, expand **SERVICE SETTINGS**.

4.  Click **Rights Management**.

5.  On the **RIGHTS MANAGEMENT** page, click **Manage**.

6.  On the **rights management** page, click **activate**.

7.  When prompted **Do you want to activate Rights Management?**, click **activate**.

You should now see **Rights management is activated** and the option to deactivate (you might need to manually refresh the page)

At this time, do not click **advanced features**. This takes you to the Azure classic portal where you can configure templates, which are not needed for this tutorial. Instead, you can close the Office 365 admin center.

#### To activate Rights Management from the Azure portal

1.  Go to the [Azure classic portal](http://go.microsoft.com/fwlink/p/?LinkID=275081) and sign in.

2.  In the left pane, click **ACTIVE DIRECTORY**.

3.  From the **active directory** page, click **RIGHTS MANAGEMENT**.

4.  Select the directory to manage for [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)], click **ACTIVATE**, and then confirm your action.

The **RIGHTS MANAGEMENT STATUS** should now display **Active** and the **ACTIVATE** option is replaced with **DEACTIVATE**.

Although you can configure other options for Rights Management in the portal, these are not needed for this tutorial, so you can close the Azure classic portal.

That’s all you need to do for this first step. The service is activated so all users in your organization can now start to protect important and sensitive documents. In a production environment, you might want to restrict who can do this initially, for a phased rollout. But it’s not necessary for this tutorial.

Although not included here, for a production deployment, you probably will also probably want to configure custom templates. Templates make it easier for users to quickly apply the right settings when they need to protect files. When you activate Rights Management, you automatically get 2 default templates and it’s likely you will want to supplement these with your own custom templates in a production environment. But templates are not needed for this tutorial, so you’re ready to go to the next step.

|If you want more information|Additional information|
|--------------------------------|--------------------------|
|About activating Rights Management and controlling who can protect files and email when the service is activated   →|[Activating Azure Rights Management](activating-azure-rights-management.md)|
|About the default templates and how to create new, custom templates   →|[Configuring Custom Templates for Azure Rights Management](configuring-custom-templates-for-azure-rights-management.md)|

>[!div class="step-by-step"]
[Intro](rms-quickstart-intro.md)
[Step 2](rms-quickstart-step1.md)