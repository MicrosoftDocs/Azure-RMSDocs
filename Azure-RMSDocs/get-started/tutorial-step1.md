---
# required metadata

title: Azure RMS quick start tutorial - Step 1 | Azure RMS
description: The first step of a tutorial to quickly try out Microsoft Azure Rights Management for your organization with just 5 steps that should take you less than 15 minutes.
keywords:
author: Cabailey
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: get-started-article
ms.prod: azure
ms.service: rights-management
ms.assetid: 7c4798e6-34a0-4c3f-a47f-505764ddf322

# optional metadata

ROBOTS: 
audience:
ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
ms.tgt_pltfrm:
ms.technology:
ms.custom:

---



# Azure RMS quick start Step 1: Activate the Rights Management service

Jump to: 
> [!div class="op_single_selector"]
- [Introduction](quick-start-tutorial.md)
- [Step 1: Activate Azure RMS](tutorial-step1.md)
- [Step 2: Install RMS sharing app](tutorial-step2.md)
- [Step 3: Email the confidential doc](tutorial-step3.md)
- [Step 4: Recipient reads the doc](tutorial-step4.md)
- [Step 5: Track your doc](tutorial-step5.md)


![](../media/AzRMS_QuickStartSteps1.PNG)

Even though you might have a subscription that supports Azure Rights Management, the service is disabled by default. To activate it, you can use either the Office 365 admin center, or the Azure classic portal:

-   If you have an Office 365 subscription that includes Azure Rights Management, or an Office 365 subscription that excludes Azure Rights Management but you have a subscription for Azure RMS Premium: **Use the Office 365 admin center**.

-   If you do not have an Office 365 subscription: **Use the Azure classic portal**.

![](../media/AzRMS_Tutorial_1_Screenshots.png)

### To activate Rights Management from the Office 365 classic admin center

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

### To activate Rights Management from the Azure classic portal

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
|About activating Rights Management and controlling who can protect files and email when the service is activated|[Activating Azure Rights Management](../deploy-use/activate-service.md)|
|About the default templates and how to create new, custom templates|[Configuring custom templates for Azure Rights Management](../deploy-use/configure-custom-templates.md)|


>[!div class="step-by-step"]
[« Intro](quick-start-tutorial.md)
[Step 2 »](tutorial-step2.md)