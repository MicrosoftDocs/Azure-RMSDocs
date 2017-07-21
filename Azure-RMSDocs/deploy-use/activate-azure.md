---
# required metadata

title: Activate Azure RMS with the Azure portal - AIP
description: Activation instructions for the Azure Rights Management service to start protecting documents and emails.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 07/19/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 4e886f5a-f535-4207-b8c4-8e0376c0758e

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# How to activate Azure Rights Management from the Azure portal

>*Applies to: Azure Information Protection*


Use these instructions if you want to activate the Azure Rights Management service (Azure RMS) from the Azure portal. This functionality is currently in preview.

1. If you haven't already done so, open a new browser window and sign in to the [Azure portal](https://portal.azure.com) as a security admin or global admin, and then navigate to the **Azure Information Protection** blade.
    
    For example, on the hub menu, click **More services** and start typing **Information** in the Filter box. Select **Azure Information Protection**.
    
    To open the Azure Information Protection balde, you must have either an [Azure Information Protection Premium plan](https://www.microsoft.com/cloud-platform/azure-information-protection-pricing) or an [Office 365 plan that includes Rights Management](http://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf). For help with this issue, send an email message to [askipteam](mailto:askipteam@microsoft.com?subject=I%20cannot%20activate%20RMS)

2. When Azure Rights Management is not activated for your tenant, you are prompted to activate the service. Click **Activate**, and then confirm your action.


The **RIGHTS MANAGEMENT STATUS** should now display **Active** and the **ACTIVATE** option is replaced with **DEACTIVATE**.



## Next steps
Back to [Activating Azure Rights Management](activate-service.md).

For information about configuring Azure Information Protection for labels that apply protection, see [Configuring Azure Information Protection policy](configure-policy.md).

For information about configuring Azure Rights Management templates, see [Configuring and managing templates in the Azure Information Protection policy](configure-policy-templates.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]