---
# required metadata

title: How to activate Azure Rights Management from the Azure classic portal | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 06/26/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
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

*Applies to: Azure Rights Management*


Use these instructions if you have access to the Azure portal. For example, you have a subscription for the Enterprise Mobility Suite.

> [!TIP]
> Watch a 2-minute video: [How to activate Azure RMS](https://channel9.msdn.com/series/pit-stop-enterprise-mobility-suite/activate-azure-rms)

1.  After you have signed up for your Azure account, [sign in to the Azure classic portal](http://go.microsoft.com/fwlink/p/?LinkID=275081). Use a global administrator account such as the account you used to get the subscription that includes Azure Rights Management.

2.  In the left pane, click **ACTIVE DIRECTORY**.

3.  From the **active directory** page, click **RIGHTS MANAGEMENT**.

4.  Select the directory to manage for [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)], click **ACTIVATE**, and then confirm your action.

    > [!NOTE]
    >If you see an activation error, it might be because your service plan or product version does not include [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)].
    >
    >Use the information in [Cloud subscriptions that support Azure RMS](../get-started/requirements-subscriptions.md) to confirm RMS support. For help with this issue, send an email message to [askipteam](mailto:askipteam?subject=I%20cannot%20activate%20RMS).


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