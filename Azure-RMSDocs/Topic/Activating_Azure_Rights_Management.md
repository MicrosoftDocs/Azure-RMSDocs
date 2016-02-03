---
title: Activating Azure Rights Management
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: f8707e01-b239-4d1a-a1ea-0d1cf9a8d214
author: Cabailey
---
# Activating Azure Rights Management
When you activate [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] (Azure RMS), your organization can start to protect important data by using applications and services that support this information protection solution. Administrators can also manage and monitor protected files and emails that your organization owns. You must enable [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)] before you can begin to use the information rights management (IRM) features within Office, SharePoint, and Exchange, and protect any sensitive or confidential file.

If you want to learn more about Azure Rights Management before you activate the service—for example, what business problems it solves, some typical use cases, and how it works—see [What is Azure Rights Management?](../Topic/What_is_Azure_Rights_Management_.md)

> [!IMPORTANT]
> Before you activate [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)], make sure that your organization has a service plan that includes [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)] services. If not, you will not be able to activate Azure RMS.
> 
> For more information, see the [Cloud subscriptions that support Azure RMS](../Topic/Requirements_for_Azure_Rights_Management.md#BKMK_SupportedSubscriptions) section in the [Requirements for Azure Rights Management](../Topic/Requirements_for_Azure_Rights_Management.md) topic.

After you have activated Azure RMS, all users in your organization can apply information protection to their files, and all users can open (consume) files that have been protected by Azure RMS. However, if you prefer, you can restrict who can apply information protection, by using onboarding controls for a phased deployment. For more information, see the [Configuring onboarding controls for a phased deployment](../Topic/Activating_Azure_Rights_Management.md#BKMK_OnboardingControls) section in this topic.

## Activating Rights Management
Use one of the following procedures to activate [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)].

> [!TIP]
> You can also use the Windows PowerShell cmdlet, [Enable-Aadrm](http://msdn.microsoft.com/library/windowsazure/dn629412.aspx), to activate [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)].

#### To activate Rights Management from the Office 365 admin center

1.  After you have signed up for an Office 365 plan that includes Rights Management, [sign in to Office 365 with your work or school account](https://portal.office.com/) that is an administrator for your Office 365 deployment.

2.  If the Office 365 admin center does not automatically display, select the app launcher icon in the upper-left and choose **Admin**. The **Admin** tile appears only to Office 365 administrators.

    > [!TIP]
    > For admin center help, see [About the Office 365 admin center - Admin Help](https://support.office.com/article/About-the-Office-365-admin-center-Admin-Help-58537702-d421-4d02-8141-e128e3703547).

3.  In the left pane, expand **SERVICE SETTINGS**.

4.  Click **Rights Management**.

    > [!NOTE]
    > If you do not see this option, it might be because your service plan or product version cannot support Rights Management, or it has not yet been upgraded to support Rights Management.
    > 
    > Use the information in the [Cloud subscriptions that support Azure RMS](../Topic/Requirements_for_Azure_Rights_Management.md#BKMK_SupportedSubscriptions) section in the [Requirements for Azure Rights Management](../Topic/Requirements_for_Azure_Rights_Management.md) topic to confirm support. If your service plan or product version is supported but you do not see the Rights Management option, it might be because the service is not yet upgraded. For help with this issue, send an email message to [askipteam](mailto:askipteam@microsoft.com?subject=I%20cannot%20activate%20RMS).

5.  On the **RIGHTS MANAGEMENT** page, click **Manage**.

6.  On the **rights management** page, click **activate**.

7.  When prompted **Do you want to activate Rights Management?**, click **activate**.

You should now see **Rights management is activated** and the option to deactivate.

#### To activate Rights Management from the Azure classic portal

1.  After you have signed up for your Azure account, [sign in to the Azure classic portal](http://go.microsoft.com/fwlink/p/?LinkID=275081).

2.  In the left pane, click **ACTIVE DIRECTORY**.

3.  From the **active directory** page, click **RIGHTS MANAGEMENT**.

4.  Select the directory to manage for [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)], click **ACTIVATE**, and then confirm your action.

    > [!NOTE]
    > If you see an activation error, it might be because your service plan or product version cannot support [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)].
    > 
    > Use the information in the [Cloud subscriptions that support Azure RMS](../Topic/Requirements_for_Azure_Rights_Management.md#BKMK_SupportedSubscriptions) section in the [Requirements for Azure Rights Management](../Topic/Requirements_for_Azure_Rights_Management.md) topic to confirm RMS support. For help with this issue, send an email message to [askipteam](mailto:askipteam?subject=I%20cannot%20activate%20RMS).

The **RIGHTS MANAGEMENT STATUS** should now display **Active** and the **ACTIVATE** option is replaced with **DEACTIVATE**.

### Rights Management status values and descriptions in the Azure classic portal
In addition to the **Active** status, which indicates that the Rights Management service is enabled and ready to use, you might also see **Inactive**, **Unavailable**, or **Unauthorized**.

|Status value|Description|
|----------------|---------------|
|**Active**|[!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)] is enabled and ready for use.|
|**Inactive**|[!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)] is disabled and must be activated before your organization can protect files.|
|**Unavailable**|The [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)] service is down. Try again later.|
|**Unauthorized**|You do not have permissions to view the status of the [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)] service. For example, your account is locked out or you are not the global administrator for the selected tenant.|

## <a name="BKMK_OnboardingControls"></a>Configuring onboarding controls for a phased deployment
If you don’t want all users to be able to protect files immediately by using Azure RMS, you can configure user onboarding controls by using the [Set-AadrmOnboardingControlPolicy](http://msdn.microsoft.com/library/azure/dn857521.aspx) Windows PowerShell command. You can run this command before or after you activate Azure RMS.

> [!IMPORTANT]
> To use this command, you must have at least version **2.1.0.0** of the [Azure RMS Windows PowerShell module](http://go.microsoft.com/fwlink/?LinkId=257721).
> 
> To check the version you have installed, run: **(Get-Module aadrm –ListAvailable).Version**

For example, if you initially want only administrators in the “IT department” group (that has an object ID of fbb99ded-32a0-45f1-b038-38b519009503) to be able to protect content for testing purposes, use the following command:

```
Set-AadrmOnboardingControlPolicy – SecurityGroupObjectId fbb99ded-32a0-45f1-b038-38b519009503
```
Note that for this configuration option, you must specify a group; you cannot specify individual users.

Or, if you want to ensure that only users who are correctly licensed to use Azure RMS can protect content:

```
Set-AadrmOnboardingControlPolicy -UseRmsUserLicense $true
```
When you use these onboarding controls, all users in the organization can always consume protected content that has been protected by your subset of users, but they won’t be able to apply information protection themselves from client applications. For example, they won’t see in their Office clients the default templates that are automatically published when Azure RMS is activated, or custom templates that you might configure.  Server-side applications, such as Exchange, can implement their own per-user controls for RMS-integration to achieve the same result.

## Next steps
Now that you’ve activated [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] for your organization, use the [Azure Rights Management Deployment Roadmap](../Topic/Azure_Rights_Management_Deployment_Roadmap.md) to check whether there are other configuration steps that you might need to do before you roll out [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] to users and administrators. For example, you might want to use [custom templates](http://technet.microsoft.com/library/dn642472.aspx) to make it easier for users to apply information protection to files, connect your on-premises servers to use [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] by installing the [RMS connector](http://technet.microsoft.com/library/dn375964.aspx), and deploy the [Rights Management sharing application](http://technet.microsoft.com/library/jj585031.aspx) that supports protecting all file types on all devices. Office services,  such as Exchange Online and SharePoint Online require additional configuration before you can use their Information Rights Management (IRM) features. However, if there are no other configuration steps that you need to do, see [Using Azure Rights Management](../Topic/Using_Azure_Rights_Management.md) for operational guidance to support a successful deployment for your organization.

For information about how your applications work with [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)], see [How Applications Support Azure Rights Management](../Topic/How_Applications_Support_Azure_Rights_Management.md).

## See Also
[Configuring Azure Rights Management](../Topic/Configuring_Azure_Rights_Management.md)

