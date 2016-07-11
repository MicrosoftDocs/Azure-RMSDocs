---
# required metadata

title: Azure Information Protection quick start tutorial | Azure Rights Management
description: An introduction tutorial to quickly try out Microsoft Azure Information Protection for your organization with just 4 steps that should take you less than 15 minutes.
author: cabailey
manager: mbaldwin
ms.date: 07/11/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 1260b9e5-dba1-41de-84fd-609076587842

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Quick start tutorial for Azure Information Protection 

Use this tutorial to quickly try out Azure Information Protection preview for your organization, with just 4 steps that should take you less than 15 minutes. You’ll activate the Azure Rights Management service (if you haven't already done so), look at and modify the default Azure Information Protection policy, install the Azure Information Protection client, and then use a Word document to see classification, labeling, and protection in action.

This tutorial is aimed at IT administrators and consultants, to help them evaluate Azure Information Protection as an enterprise information protection solution for an organization. In a production environment, the instructions to activate the service, configure the Information Protection policy, and install the client for users would be done by an administrator. The instructions to label the document would be done by end users. Both sets of instructions are included in this tutorial, to demonstrate the end-to-end scenario of classifying, labeling, and protecting your organization's data. If you have any problems completing this tutorial, send an email message to [AskIPTeam](mailto:askipteam@microsoft.com?subject=Having%20problems%20with%20the%20Information%20Protection%20Quick%20Start%20tutorial) and we will help you out.

To complete this tutorial, you will need the following:

- Any subscription that includes Azure Rights Management, which will give you access to the preview release of Azure Information Protection. Azure Information Protection is available in all regions. For more information about the available subscriptions and links to free trials, see [Azure RMS requirements: Cloud subscriptions that support Azure RMS](requirements-subscriptions.md).

- A subscription for Azure, so you can access the Azure portal, to configure the Azure Information Protection policy. If you do not already have an Azure subscription for your organization, you can get one by signing up for a free trial: Go to the [Azure Get started page](https://account.windowsazure.com/organization) and follow the instructions.


    Tip: If you need to get one or both of these subscription, do this in advance because this process can sometimes take a while to complete.

-   A global administrator account to sign in to the Office 365 admin center or the Azure classic portal, so that you can activate the Rights Management service. This account must also have an email address and a working email service (for example, Exchange Online or Exchange Server).

-   A computer running Windows (minimum of Windows 7 with Service Pack 1), and which has installed either Office 2016, Office 2013 with Service Pack 1. You can use Office 2010 if you also have the Rights Management sharing application installed and your PC is not running Windows 10.

Let's get started.

## Step 1: Activate the Rights Management service
 
If you have already activated Azure Rights Management - for example, you have already evaluated or deployed Azure Rights Management in your organization - go straight to the next step. 

If you haven't yet activated Azure Rights Management, do this step first so that you can protect your most sensitive documents and files after they have been classified. To activate Azure Rights Management, you can use either the Office 365 admin center, or the Azure classic portal:

-   If you have an Office 365 subscription that includes Azure Rights Management, or an Office 365 subscription that excludes Azure Rights Management but you have a subscription for Azure RMS Premium: **Use the Office 365 admin center**.

-   If you do not have an Office 365 subscription: **Use the Azure classic portal**.

### To activate Rights Management from the Office 365 classic admin center

> [!NOTE]
> If you are using the **Office 365 admin center preview** rather than the Office 365 classic admin center, you can either use the instructions from [How to activate Azure Rights Management from the Office 365 admin center preview](../deploy-use/activate-office365-preview.md), or switch to the classic version to use these instructions. To switch, click **Go to the old admin center** on the **Home** page, after you have signed in.

1.  Go to the [Office 365 portal](https://portal.office.com/) and sign in with your Office 365 global administrator account.

2.  If the Office 365 admin center does not automatically display, select the app launcher icon in the upper-left and choose **Admin**. The **Admin** tile appears only to Office 365 administrators.

  > [!TIP]
  > For admin center help, see [About the Office 365 admin center - Admin Help](https://support.office.com/article/About-the-Office-365-admin-center-Admin-Help-58537702-d421-4d02-8141-e128e3703547).

3.  In the left pane, expand **SERVICE SETTINGS**.

4.  Click **Rights Management**.

5.  On the **RIGHTS MANAGEMENT** page, click **Manage**.

6.  On the **rights management** page, click **activate**.

7.  When prompted **Do you want to activate Rights Management?**, click **activate**.

You should now see **Rights management is activated** and the option to deactivate (you might need to manually refresh the page)

At this time, do not click **advanced features**. This takes you to the Azure classic portal where you can configure custom templates, which are not needed for this tutorial. Instead, you can close the Office 365 admin center.

### To activate Rights Management from the Azure classic portal

1.  Go to the [Azure classic portal](http://go.microsoft.com/fwlink/p/?LinkID=275081) and sign in with your Azure Active Directory global administrator account.

2.  In the left pane, click **ACTIVE DIRECTORY**.

3.  From the **active directory** page, click **RIGHTS MANAGEMENT**.

4.  Select the directory to manage for [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)], click **ACTIVATE**, and then confirm your action.

The **RIGHTS MANAGEMENT STATUS** should now display **Active** and the **ACTIVATE** option is replaced with **DEACTIVATE**.

Although you can configure other options for Rights Management in the portal, these are not needed for this tutorial, so you can close the Azure classic portal.

That’s all you need to do for this first step. The Azure Rights Management service is activated so that later on in the tutorial, you can select one of the default Azure Rights Management templates to protect documents and emails that are classified as Confidential.

For a production deployment, you probably will want to configure custom templates in addition to, or instead of the two default Azure Rights Management templates. But custom templates are not needed for this tutorial, so you’re ready to go to the next step.

|If you want more information|Additional information|
|--------------------------------|--------------------------|
|About activating Rights Management|[Activating Azure Rights Management](../deploy-use/activate-service.md)|
|About the default templates and how to create new, custom templates|[Configuring custom templates for Azure Rights Management](../deploy-use/configure-custom-templates.md)|

## Step 2: Configure and publish the Azure Information Protection policy

Although Azure Information Protection comes with a default policy that you can use without configuration, we're going to have a look at that policy and make some changes.

1. Sign in to the Azure portal by using this special link for Azure Information Protection: https://portal.azure.com/?microsoft_azure_informationprotection=true
 
2. On the hub menu, click **Browse** and start typing **Information** in the Filter box. Select **Azure Information Protection PREVIEW**.

- You'll now see the Azure Information Protection page, showing the default Information Protection policy that's automatically created. This default policy contains the following labels for classification: **Personal**, **Public**, **Internal**, **Confidential**, and **Secret**. Read the tooltip for each, and note that Secret has two sub-labels: **All-Employees** and **My-Group**, which provides an example of how a classification can have subcategories.

- With its default settings, **Internal**, **Confidential**, and **Secret** have visual markings configured (such as footer, header, watermark) and none of the polices have protection set. In addition, the three global settings are not set so that all documents and emails are not required to have a label, there is no default label, and users do not have to provide justification when lowering the sensitivity level.

For our tutorial, we'll change a couple of those global settings:

-  **Select the default label**: Set this to **Internal**.

- **Users must provide justification when lowering the sensitivity level**: Set this to **On**.

We'll now change the settings of one of the labels, **Confidential**:

1. Click the **Confidential** label entry.

2. In the **Label: Confidential** blade, you'll now see the settings that are available for each label. Make the following changes:

    a. For **Select RMS template**: Click the drop down box and select the default template **\<your organization name> - Confidential**. For example, if your organization name is Contoso, Ltd, you will see and select **Contoso, Ltd - Confidential**. If you have disabled this default Azure Rights Management template, select an alternative template.  

    b. **Documents with this label have a watermark**: Click **On** and for the **Text** box, type your organization name. For example, **Contoso, Ltd**. 

    c. Click **Add a new condition** and then, in the **Condition** blade, select the following:

    - **Choose the type of condition**: **Built-in**

    - **Select built-in**: **Credit Card Number**

    - **Minimum number of occurrences**: **1**

    - Click **Save** to return to the **Label: Confidential** blade.

3. In the **Label: Confidential** blade, you'll see that **Credit Card Number** is displayed as the **CONDITION NAME**, with **1** **OCCURRENCES**.

4. Leave **Select how this label is applied**: **Recommended**

5. In the **Enter notes for internal housekeeping** box, type **For testing purposes only**.

6. Click **Save**.

7. Now we've made our changes and saved them, we want to make them available to users, so click **Publish**, and click **Yes** to confirm.

You can either close the Azure portal, or leave it open to try additional configuration options after you have finished this tutorial.

Now that you've had a look at the default policy and made some changes, the next step is to install the Azure Information Protection client.


## Step 3: Install the Azure Information Protection client 

In this step, you'll install the Azure Information Protection client so that the policy you've just configured will download to a Windows PC, and display the labels in Office applications. 

1. On a PC that has Office installed (but not currently loaded), download the Azure Information Protection client from the Microsoft download center.  //Need link// 

2. Run **AZInfoProtection.exe** and follow the prompts to install the client.

- For this tutorial, it doesn't matter whether you select the option to install a demo policy, because our policy that we've just configured will be downloaded from Azure and replace the demo policy if installed. However, you could use the demo policy option if you just wanted to experience the default labels without connecting to Azure Information Protection. 

3. Verify that the client has installed by opening Word and a new, blank document (do not save it at this time). If you are prompted to enter your user name and password, enter the details for your global administrator account. When the document loads, you should see two new things:

    - On the **File** tab, a new **Protection** group, with a button labeled **Protect**.

        Click **Protect** > **Help and feedback**, and in the **Microsoft Azure Information Protection** dialog box, confirm your client status. It should display **Information Protection policy is installed** and a recent connection time.

    - A new bar displays under the ribbon; the Information Protection bar. It displays the title of **Sensitivity**, and the default label that we configured of **Internal**. 


## Step 4: See classification, labeling, and protection in action 

Now that you've got a Word document open, you're ready to see how easy it is to start labeling and protecting it, using the policy that we configured.

Classification and protection happens when you save the document, but before we do that, we'll use our unsaved document to see how easy it is to apply and change labels.

To manually change our default label:

- On the Information Protection bar, click the Edit label icon next to **Internal**. This displays the available labels. Choose **Personal** and you are prompted to justify why are lowering the classification level. Select **This file no longer requires that classification**, and click **Confirm**.  

    You'll see the **Sensitivity** value change to **Personal**.

To remove the classification completely:

- On the Information Protection bar, click the Edit label icon next to **Personal**. This displays the available labels. But instead of choosing one of the labels, this time, click the Remove label icon. Click **OK** to confirm and provide justification for this action.  

    You'll see the **Sensitivity** value display **Not set**, which is what users see initially if you don't set a default label.

To see a recommendation prompt for labeling and automatic protection:

1. In the Word document, type a fake credit card number: 4242-4242-4242-4242. 

2. Save the document (use any file name, any location). 

3. You now see the prompt: **It is recommended to label this file as Confidential**. Click **Change now**.

    Immediately, you'll see the watermark of your organization name across the page, in addition to the footer of **Sensitivity: Confidential**. 

    The document is also protected with the Azure Rights Management template you specified, which you can confirm when you click the **File** tab and view the information for **Protect Document**. If you used the default Confidential template, you'll see the information that the document is restricted to internal users (users outside your organization will not be able to open the document) and its contents cannot be copied or printed. As the owner of the document, you can copy from it and print it, but if you email it to another user in your organization, they won't be do these actions.

##  Next steps

Now you've seen the default Azure Information Protection policy and how to customize it, and how labeling works for a Word document, try some of the other settings and see how they work in the other Office applications that support Azure Information Protection: Excel, PowerPoint, Outlook. 

For example, you can change the default title of **Sensitivity** on the Information Protection bar to a title of your own choice. You can change the tooltips, the label colors, the order of the labels, and their names. You can create new labels and define your own automatic rules.

Each time you change any settings in the Azure portal for the Information Protection policy, remember to save the policy and then publish it. If your Office application is open after you made policy changes, close it and reopen it to download the latest policy.

When you've finished your own testing, you might find it useful to look over the frequently asked questions for Azure Information Protection.
