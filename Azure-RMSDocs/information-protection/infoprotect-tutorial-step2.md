---
# required metadata

title: Azure Information Protection quick start tutorial step 2 | Azure Rights Management
description: Step 2 of an introduction tutorial to quickly try out Microsoft Azure Information Protection for your organization with just 4 steps that should take you less than 15 minutes.
author: cabailey
manager: mbaldwin
ms.date: 09/07/2016
ms.topic: article
ms.prod:
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 3bc193c2-0be0-4c8e-8910-5d2cee5b14f7

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Step 2: Configure and publish the Azure Information Protection policy

>*Applies to: Azure Information Protection preview*

**[ This information is preliminary and subject to change. ]**

Although Azure Information Protection comes with a default policy that you can use without configuration, we're going to have a look at that policy and make some changes.

1. Sign in to the [Azure portal](https://portal.azure.com). If you want to test protection as well as classification and labeling, sign in as a global admin so that you can retrieve the Azure Rights Management templates.
 
2. On the hub menu: Click **New** > **Security + Identity** > **Azure Information Protection (preview)** > **Create**.

    This creates the **Azure Information Protection** blade so that the next time you sign in to the portal, you can select the service from the hub **Browse** list. 

    > [!TIP] 
    > Select **Pin to dashboard** to create an **Azure Information Protection** tile on your dashboard, so that you can skip the browse step next time you sign in to the portal.

3.  Explore the main **Azure Information Protection** blade, which shows the default Information Protection policy that's automatically created:
    
    - Labels for classification: **Personal**, **Public**, **Internal**, **Confidential**, and **Secret**. Read the tooltip for each to understand how the labels are intended to be used. Note that **Secret** has two sub-labels: **All-Employees** and **My-Group**, which provides an example of how a classification can have subcategories.

    - With the default settings, the **Internal**, **Confidential**, and **Secret** labels have visual markings configured (such as footer, header, watermark) and none of the labels have protection set. In addition, the three global settings are not set so that all documents and emails are not required to have a label, there is no default label, and users do not have to provide justification when lowering the classification level.

    ![Azure Information Protection quick start tutorial step 3 - default policy](../media/info-protect-policy.png)

For our tutorial, we'll change a couple of those global settings so that you can see how they work:

-  **Select the default label**: Set this to **Internal**.

- **Users must provide justification to set a lower classification label, remove a label, or remove protection**: Set this to **On**.

We'll now change the settings of one of the labels, **Confidential**:

1. Click the **Confidential** label.

2. In the **Label: Confidential** blade, you'll now see the settings that are available for each label. Make the following changes:

    a. If you have activated Azure Rights Managment: In the **Set RMS template for protecting documents and emails containing this label** section, if you see **Select RMS template from**, keep the default of **Azure RMS**. Then, for **Select RMS template**, click the drop down box and select the default template **\<your organization name> - Confidential**. For example, if your organization name is VanArsdel, Ltd, you will see and select **VanArsdel, Ltd - Confidential**. If you have disabled this default Azure Rights Management template, select an alternative template. However, if you select a departmental template, make sure that your account is included in the scope.
    
    If you have not activated Azure Rights Management, you cannot use this option.
    
    b. **Documents with this label have a watermark**: Click **On** and for the **Text** box, type your organization name. For example, **VanArsdel, Ltd**. 
    
    c. Click **Add a new condition** and then, in the **Condition** blade, select the following:
    
    - **Choose the type of condition**: **Built-in**
    
    - **Select built-in**: **Credit Card Number**
    
    - **Minimum number of occurrences**: **1**
    
    - **Count occurrences with unique values only**: **On**
    
    - Click **Save** to return to the **Label: Confidential** blade.

3. In the **Label: Confidential** blade, you'll see that **Credit Card Number** is displayed as the **CONDITION NAME**, with **1** **OCCURRENCES**.

4. Leave **Select how this label is applied**: **Recommended**

5. In the **Enter notes for internal housekeeping** box, type **For testing purposes only**.

6. Click **Save** on this **Label: Confidential** blade, and on the main **Azure Information Protection** blade, click **Save** again.

7. Now we've made our changes and saved them, we want to make them available to users, so click **Publish**, and click **Yes** to confirm.

![Azure Information Protection quick start tutorial step 3 - default policy configured](../media/info-protect-policy-configured.png)

You can either close the Azure portal, or leave it open to try additional configuration options after you have finished this tutorial.

Now that you've had a look at the default policy and made some changes, the next step is to install the Azure Information Protection client.

|If you want more information|Additional information|
|--------------------------------|--------------------------|
|About the configuration options for the policy|[Configuring Azure Information Protection policy](configure-policy.md)|


>[!div class="step-by-step"]
[&#171; Step 1](infoprotect-tutorial-step1.md)
[Step 3 &#187;](infoprotect-tutorial-step3.md)