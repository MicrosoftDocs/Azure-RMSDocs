---
# required metadata

title: Quick start tutorial step 3 - AIP
description: Step 3 of an introduction tutorial to quickly try out Azure Information Protection - Install the client.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 08/28/2018
ms.topic: conceptual
ms.service: information-protection
ms.assetid: 209815b9-81c9-430c-a82f-32cac991449b

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Step 3: Install the client

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*

In this step, you'll install the Azure Information Protection client so that the policy you've just configured will download to a Windows PC, and display the labels in Office applications.


## Install the Azure Information Protection client

1. On a PC that has Office installed (but Word is not currently open), go to the [Microsoft download center](https://www.microsoft.com/en-us/download/details.aspx?id=53018) and download **AzInfoProtection.exe**.
    
2. Run the executable that you've just downloaded, and follow the prompts to install the client.
    
    For this tutorial, it doesn't matter whether you select the option to install a demo policy, because our policy that we've just configured will be downloaded from Azure and replace the demo policy if installed. However, you could use the demo policy option if you just wanted to experience the default labels without connecting to Azure Information Protection. 

## Verify the installation

Verify that the installation was successful by opening Word and a new, blank document (do not save it at this time). If you are prompted to enter your user name and password, enter the details for your global administrator account. 

If this is the first time that you've installed the client, you'll see a **Congratulations** page with basic instructions. After you have read it, click **Close**.

When the document loads, you should see two new things:

![Azure Information Protection quick start tutorial step 3 - client installed](./media/word2016-calloutsv2.png)

- On the **Home** tab, a new **Protection** group, with a button named **Protect**.
    
    Click **Protect** > **Help and Feedback**, and in the **Microsoft Azure Information Protection** dialog box, confirm your client status. It should display **Connected as** and your user name. In addition, you should also see a recent time and date for the last connection and when the Information Protection policy was installed. Verify that your displayed user name is correct for your tenant.

- A new bar under the ribbon; the Information Protection bar. It displays the title of **Sensitivity**, and the labels that we saw in the Azure portal. 

You’re now ready to see Azure Information Protection in action.

|If you want more information|Additional information|
|--------------------------------|--------------------------|
|About installing the Azure Information Protection client|[Download and install the Azure Information Protection client](./rms-client/install-client-app.md)|
|Admin instructions for the Azure Information Protection client|[Azure Information Protection client administrator guide](./rms-client/client-admin-guide.md)|


>[!div class="step-by-step"]
[&#171; Step 2](infoprotect-tutorial-step2.md)
[Step 4 &#187;](infoprotect-tutorial-step4.md)
