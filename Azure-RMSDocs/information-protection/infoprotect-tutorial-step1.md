---
# required metadata

title: Azure Information Protection quick start tutorial step 1 | Azure Information Protection
description: Step 1 of an introduction tutorial to quickly try out Microsoft Azure Information Protection for your organization with just 4 steps that should take you less than 15 minutes.
author: cabailey
manager: mbaldwin
ms.date: 07/291/2016
ms.topic: article
ms.prod:
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: f6dbb143-96f7-4a9c-8208-be9280d69de9

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Step 1: Activate the Rights Management service
 
>*Applies to: Azure Information Protection preview*

**[ This information is preliminary and subject to change. ]**

> [!NOTE]
>If you only want to classify your data and not protect it with Azure Rights Management, or if you have already activated Azure Rights Management for your tenant - go straight to the [next step](infoprotect-tutorial-step2.md). 

When Azure Rights Management is activated, you can protect your most sensitive documents and files after they have been classified. To activate Azure Rights Management, you can use either the Office 365 admin center, or the Azure classic portal:

-   If you have an Office 365 subscription that includes Azure Rights Management, or an Office 365 subscription that excludes Azure Rights Management but you have a subscription for Azure RMS Premium: **Use the Office 365 admin center**.

-   If you do not have an Office 365 subscription: **Use the Azure classic portal**.

### To activate Rights Management from the Office 365 classic admin center

> [!NOTE]
> If you are using the **Office 365 admin center preview** rather than the Office 365 classic admin center, you can either use the instructions from [How to activate Azure Rights Management from the Office 365 admin center preview](../deploy-use/activate-office365-preview.md), or switch to the classic version to use these instructions. To switch, click **Go to the old admin center** on the **Home** page, after you have signed in.

1.  Go to the [Office 365 portal](https://portal.office.com/) and sign in with your Office 365 global administrator account.

2.  If the Office 365 admin center does not automatically display, select the app launcher icon in the upper-left and choose **Admin**. The **Admin** tile appears only to Office 365 administrators.

  > [!TIP]
  > For admin center help, see [About the Office 365 admin center - Admin Help](https://support.office.com/article/About-the-Office-365-admin-center-Admin-Help-58537702-d421-4d02-8141-e128e3703547).

3.  In the left pane, expand **SERVICE SETTINGS**.

4.  Click **Rights Management**.

5.  On the **RIGHTS MANAGEMENT** page, click **Manage**.

6.  On the **rights management** page, click **activate**.

7.  When prompted **Do you want to activate Rights Management?**, click **activate**.

You should now see **Rights management is activated** and the option to deactivate (you might need to manually refresh the page)

At this time, do not click **advanced features**. This takes you to the Azure classic portal where you can configure custom templates, which are not needed for this tutorial. Instead, you can close the Office 365 admin center.

### To activate Rights Management from the Azure classic portal

1.  Go to the [Azure classic portal](http://go.microsoft.com/fwlink/p/?LinkID=275081) and sign in with your Azure Active Directory global administrator account.

2.  In the left pane, click **ACTIVE DIRECTORY**.

3.  From the **active directory** page, click **RIGHTS MANAGEMENT**.

4.  Select the directory to manage for [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)], click **ACTIVATE**, and then confirm your action.

The **RIGHTS MANAGEMENT STATUS** should now display **Active** and the **ACTIVATE** option is replaced with **DEACTIVATE**.

Although you can configure other options for Rights Management in the portal, these are not needed for this tutorial, so you can close the Azure classic portal.

That's all you need to do for this first step. The Azure Rights Management service is activated so that later on in the tutorial, you can select one of the default Azure Rights Management templates to protect documents and emails that are classified as Confidential.

For a production deployment, you probably will want to configure custom templates in addition to, or instead of the two default Azure Rights Management templates. But custom templates are not needed for this tutorial, so you're ready to go to step 2.

|If you want more information|Additional information|
|--------------------------------|--------------------------|
|About activating Rights Management|[Activating Azure Rights Management](../deploy-use/activate-service.md)|
|About the default templates and how to create new, custom templates|[Configuring custom templates for Azure Rights Management](../deploy-use/configure-custom-templates.md)|

>[!div class="step-by-step"]
[&#171; Introduction](infoprotect-quick-start-tutorial.md)
[Step 2 &#187;](infoprotect-tutorial-step2.md)
