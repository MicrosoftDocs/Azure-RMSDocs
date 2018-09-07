---
# required metadata

title: Quick start tutorial step 1 - AIP
description: Step 1 of an introduction tutorial to quickly try out Azure Information Protection - Activate the protection service.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 05/28/2018
ms.topic: conceptual
ms.service: information-protection
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

# Step 1: Activate protection
 
>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*

> [!NOTE]
>Even if protection is activated for your tenant, complete this step to confirm the activation status. The instructions include signing in to the Azure portal and creating the Azure Information Protection blade, so that you're ready for step 2.

When protection is activated for Azure Information Protection, you can protect your organization's most sensitive documents and emails. You can also track how these protected documents are used when you share them with others. 

There are different ways that you can activate protection. You can use PowerShell and the admin portals. But for this tutorial, we use the Azure portal, which is where you also configure labels for users. 

## To activate protection

1. Sign in to the [Azure portal](https://portal.azure.com) by using the global admin account for your tenant. 
    
    If you are not the global admin, you can use one of the following [administrative roles](/azure/active-directory/active-directory-assign-admin-roles-azure-portal): **Information Protection Administrator** or **Security Administrator**.

2. On the hub menu, select **Create a resource**, and then, from the search box for the Marketplace, type **Azure Information Protection**. 
    
3. From the results list, select **Azure Information Protection**. On the **Azure Information Protection** blade, click **Create**.
    
    > [!TIP] 
    > Optionally, select **Pin to dashboard** to create an **Azure Information Protection** tile on your dashboard, so that you can skip browsing to the service the next time you sign in to the portal.
    
    Click **Create** again.

4. Note the information on the **Quick start** page that automatically opens the first time you connect to the service. You can come back to this later. For this tutorial, select **MANAGE** > **Protection activation**. 

5. You now see whether protection is activated for your tenant. 
    
    - If protection is activated, you see the following confirmation:
        
        ![Azure Information Protection status for Azure RMS](./media/info-protect-azurerms-activated.png)
        
    - If protection is not activated, you see this reflected in the status information, and the option to activate:
        
        ![Azure Information Protection status for Azure RMS](./media/info-protect-azurerms-deactivated.png)

6. If protection isn't activated, select **Activate**. 

    When activation is complete, the information bar displays **Activation finished successfully**.

That's all you need to do for this first step to complete this tutorial. You're ready to go to step 2.

|If you want more information|Additional information|
|--------------------------------|--------------------------|
|About activating protection|[Activating Azure Rights Management](activate-service.md)|


>[!div class="step-by-step"]
[&#171; Introduction](infoprotect-quick-start-tutorial.md)
[Step 2 &#187;](infoprotect-tutorial-step2.md)

