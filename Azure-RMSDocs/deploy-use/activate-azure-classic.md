---
# required metadata

title: Activate Azure RMS with the Azure classic portal - AIP
description: Activation instructions for the Azure Rights Management service when you have access to the Azure portal. For example, you have a subscription for the Enterprise Mobility Suite or have the Azure Information Protection Premium subscription.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 04/07/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 9b0a0227-88ce-44b8-ba3f-31eeaab27ff7

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# How to activate Azure Rights Management from the Azure classic portal

>*Applies to: Azure Information Protection*


Use these instructions if you have access to the Azure portal. For example, you have a subscription for the Enterprise Mobility Suite or have the Azure Information Protection Premium subscription.

> [!TIP]
> Watch a 2-minute video: [How to activate Azure RMS](https://channel9.msdn.com/series/pit-stop-enterprise-mobility-suite/activate-azure-rms)

1.  After you have signed up for your Azure account, [sign in to the Azure classic portal](http://go.microsoft.com/fwlink/p/?LinkID=275081). Use a global administrator account such as the account you used to get the subscription that includes Azure Rights Management.

2.  In the left pane, click **ACTIVE DIRECTORY**.

3.  From the **active directory** page, click **RIGHTS MANAGEMENT**.

4.  Select the directory to manage for [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)], click **ACTIVATE**, and then confirm your action.

    > [!NOTE]
    >If you see an activation error, it might be because your service plan or product version does not include the Azure Rights Management service for Azure Information Protection.
    >
    >To activate the Azure Rights Management service, you must have either an [Azure Information Protection Premium plan](https://www.microsoft.com/cloud-platform/azure-information-protection-pricing) or an [Office 365 plan that includes Rights Management](http://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf). For help with this issue, send an email message to [askipteam](mailto:askipteam?subject=I%20cannot%20activate%20RMS).


The **RIGHTS MANAGEMENT STATUS** should now display **Active** and the **ACTIVATE** option is replaced with **DEACTIVATE**.

## Rights Management status values and descriptions in the Azure classic portal
In addition to the **Active** status, which indicates that the Rights Management service is enabled and ready to use, you might also see **Inactive**, **Unavailable**, or **Unauthorized**.

|Status value|Description|
|----------------|---------------|
|**Active**|[!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)] is enabled and ready for use.|
|**Inactive**|[!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)] is disabled and must be activated before your organization can protect files.|
|**Unavailable**|The [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)] service is down. Try again later.|
|**Unauthorized**|You do not have permissions to view the status of the [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)] service. For example, your account is locked out or you are not the global administrator for the selected tenant.|

## Next steps
Back to [Activating Azure Rights Management](activate-service.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]