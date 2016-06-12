---
# required metadata

title: Migrating from AD RMS to Azure Rights Management - Phase 1 | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 05/20/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 5a189695-40a6-4b36-afe6-0823c94993ef

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Migration phase 1 - server-side configuration for AD RMS

*Applies to: Active Directory Rights Management Services, Azure Rights Management*

Use the following information for Phase 1 of migrating from AD RMS to Azure Rights Management (Azure RMS). These procedures cover steps 1 though 4 from [Migrating from AD RMS to Azure Rights Management](migrate-from-ad-rms-to-azure-rms.md).


## Step 1: Download the Azure Rights Management Administration Tool
Go to the Microsoft Download Center and download the [Azure Rights Management Administration Tool](https://go.microsoft.com/fwlink/?LinkId=257721), which contains the Azure RMS administration module for Windows PowerShell.

Install the tool. For instructions, see [Installing Windows PowerShell for Azure Rights Management](../deploy-use/install-powershell.md).

> [!NOTE]
> If you have previously downloaded this Windows PowerShell module, run the following command to check that your version number is at least 2.5.0.0: `(Get-Module aadrm -ListAvailable).Version`

## Step 2. Export configuration data from AD RMS and import it to Azure RMS
This step is a two-part process:

1.  Export the configuration data from AD RMS by exporting the trusted publishing domains (TPDs) to an .xml file. This process is the same for all migrations.

2.  Import the configuration data to Azure RMS. There are different processes for this step, depending on your current AD RMS deployment configuration and your preferred topology for your Azure RMS tenant key.

### Export the configuration data from AD RMS

> [!IMPORTANT]
> Before you do this procedure, first confirm that your AD RMS servers are running in Cryptographic Mode 2, which is a requirement for Azure RMS.

Do the following procedure on all AD RMS clusters, for all trusted publishing domains that have protected content for your organization. You do not need to run this on licensing-only clusters.

#### To export the configuration data (trusted publishing domain information)

1.  Log on the AD RMS cluster as a user with AD RMS administration permissions.

2.  From the AD RMS management console (**Active Directory Rights Management Services**), expand the AD RMS cluster name, expand **Trust Policies**, and then click **Trusted Publishing Domains**.

3.  In the results pane, select the trusted publishing domain, and then, from the Actions pane, click **Export Trusted Publishing Domain**.

4.  In the **Export Trusted Publishing Domain** dialog box:

    -   Click **Save As** and save to path and a file name of your choice. Make sure to specify **.xml** as the file name extension (this is not appended automatically).

    -   Specify and confirm a strong password. Remember this password, because you will need it later, when you import the configuration data to Azure RMS.

    -   Do not select the checkbox to save the trusted domain file in RMS version 1.0.

When you have exported all the trusted publishing domains, you’re ready to start the procedure to import this data to Azure RMS.

### Import the configuration data to Azure RMS
The exact procedures for this step depend on your current AD RMS deployment configuration, and your preferred topology for your Azure RMS tenant key.

Your current AD RMS deployment will be using one of the following configurations for your server licensor certificate (SLC) key:

-   Password protection in the AD RMS database. This is the default configuration.

-   HSM protection by using a Thales hardware security module (HSM).

-   HSM protection by using a hardware security module (HSM) from a supplier other than Thales.

-   Password protected by using an external cryptographic provider.

> [!NOTE]
> For more information about using hardware security modules with AD RMS, see [Using AD RMS with Hardware Security Modules](http://technet.microsoft.com/library/jj651024.aspx).

The two Azure RMS tenant key topology options are: Microsoft manages your tenant key (**Microsoft-managed**) or you manage your tenant key (**customer-managed**) in Azure Key Vault. When you manage your own Azure RMS tenant key, it’s sometimes referred to as “bring your own key” (BYOK) and requires a hardware security module (HSM) from Thales. For more information, see [Planning and implementing your Azure Rights Management tenant key](plan-implement-tenant-key.md) article.

> [!IMPORTANT]
> Exchange Online is not currently  compatible with BYOK in Azure RMS.  If you want to use BYOK after your migration and plan to use Exchange Online, make sure that you understand how this configuration reduces IRM functionality for Exchange Online. Review  the information in [BYOK pricing and restrictions](byok-price-restrictions.md) to help you choose the best Azure RMS tenant key topology for your migration.

Use the following table to identify which procedure to use for your migration. Combinations that are not listed are not supported.

|Current AD RMS deployment|Chosen Azure RMS tenant key topology|Migration instructions|
|-----------------------------|----------------------------------------|--------------------------|
|Password protection in the AD RMS database|Microsoft-managed|See the **Software-protected key to software-protected key** migration procedure after this table.<br /><br />This is the simplest migration path and requires only that you transfer your configuration data to Azure RMS.|
|HSM protection by using a Thales nShield hardware security module (HSM)|Customer-managed (BYOK)|See the **HSM-protected key to HSM-protected key** migration procedure after this table.<br /><br />This requires the Azure Key Vault BYOK toolset and three set of steps to first transfer the key from your on-premises HSM to the Azure Key Vault HSMs, then authorize Azure RMS to use your tenant key, and finally to transfer your configuration data to Azure RMS.|
|Password protection in the AD RMS database|Customer-managed (BYOK)|See the **Software-protected key to HSM-protected key** migration procedure after this table.<br /><br />This requires the Azure Key Vault BYOK toolset and four sets of steps to first extract your software key and import it to an on-premises HSM, then transfer the key from your on-premises HSM to the Azure RMS HSMs, next transfer your Key Vault data to Azure RMS, and finally to transfer your configuration data to Azure RMS.|
|HSM protection by using a hardware security module (HSM) from a supplier other than Thales|Customer-managed (BYOK)|Contact the supplier for you HSM for instructions how to transfer your key from this HSM to a Thales nShield hardware security module (HSM). Then follow the instructions for the **HSM-protected key to HSM-protected key** migration procedure after this table.|
|Password protected by using an external cryptographic provider|Customer-managed (BYOK)|Contact the supplier for you cryptographic provider for instructions how to transfer your key to a Thales nShield hardware security module (HSM). Then follow the instructions for the **HSM-protected key to HSM-protected key** migration procedure after this table.|
Before you start these procedures, make sure that you can access the .xml files that you created earlier when you exported the trusted publishing domains. For example, these might be saved to a USB thumb drive that you move from the AD RMS server to the Internet-connected workstation.

> [!NOTE]
> However you store these files, use security best practices to protect them because this data includes your private key.


To complete Step 2, choose and select the instructions for your migration path: 


- [Software key to software key](migrate-softwarekey-to-softwarekey.md)
- [HSM key to HSM key](migrate-hsmkey-to-hsmkey.md)
- [Software key to HSM key](migrate-softwarekey-to-hsmkey.md)


## Step 3. Activate your RMS tenant
Instructions for this step are fully covered in the [Activating Azure Rights Management](../deploy-use/activate-service.md) article.


> [!TIP]
> If you have an Office 365 subscription, you can activate Azure RMS from the Office 365 admin center or the Azure classic portal. We recommend that you use the Azure classic portal because you will use this management portal to complete the next step.

**What if your Azure RMS tenant is already activated?** If the Azure RMS service is already activated for your organization, users might have already used Azure RMS to protect content with an automatically generated tenant key (and the default templates) rather than your existing keys (and templates) from AD RMS. This is unlikely to happen on computers that are well-managed on your intranet, because they will be automatically configured for your AD RMS infrastructure. But it can happen on workgroup computers or computers that infrequently connect to your intranet. Unfortunately, it’s also difficult to identify these computers, which is why we recommend you do not activate the service before you import the configuration data from AD RMS.

If your Azure RMS tenant is already activated and you can identify these computers, make sure that you run the CleanUpRMS_RUN_Elevated.cmd script on these computers, as described in Step 5. Running this script forces them to reinitialize the user environment, so that they download the updated tenant key and imported templates.

## Step 4. Configure imported templates
Because the templates that you imported have a default state of **Archived**, you must change this state to be **Published** if you want users to be able to use these templates with Azure RMS.

In addition, if your templates in AD RMS used the **ANYONE** group, this group is automatically removed  when you import the templates to Azure RMS; you must manually add the equivalent group or users and the same rights to the imported templates. The equivalent group for Azure RMS is named **AllStaff-7184AB3F-CCD1-46F3-8233-3E09E9CF0E66@<tenant_name>.onmicrosoft.com**. For example, this group might look like the following for Contoso: **AllStaff-7184AB3F-CCD1-46F3-8233-3E09E9CF0E66@contoso.onmicrosoft.com**.

If  you're not sure whether your AD RMS templates include the ANYONE group, you can use the sample Windows PowerShell script to identify these templates. For more information about using Windows PowerShell with AD RMS, see  [Using Windows PowerShell to Administer AD RMS](https://technet.microsoft.com/library/ee221079%28v=ws.10%29.aspx).

You can see your organization's automatically created group if you copy one of the default rights policy templates in the Azure classic portal, and then identify the **USER NAME** on the **RIGHTS** page. However, you cannot use the classic portal to add this group to a template that was manually created or imported and instead must use one of the following Azure RMS PowerShell options:

-   Use the [New-AadrmRightsDefinition](https://msdn.microsoft.com/library/azure/dn727080.aspx) PowerShell cmdlet to define the  "AllStaff" group and rights as a rights definition object, and run this command again for each of the other groups or users already granted rights in the original template in addition to the ANYONE group. Then add all these rights definition objects to the templates by using the  [Set-AadrmTemplateProperty](https://msdn.microsoft.com/en-us/library/azure/dn727076.aspx) cmdlet.

-   Use the [Export-AadrmTemplate](https://msdn.microsoft.com/library/azure/dn727078.aspx) cmdlet to export the template to a .XML file that you can edit to add the "AllStaff" group and rights to the existing groups and rights, and then use the [Import-AadrmTemplate](https://msdn.microsoft.com/library/azure/dn727077.aspx) cmdlet to import this change back into Azure RMS.

> [!NOTE]
> This "AllStaff" equivalent group isn't exactly the same as the ANYONE group in AD RMS:  The "AllStaff" group includes all users in your Azure tenant, whereas the ANYONE group includes all authenticated users, who could be outside your organization.
> 
> Because of this difference between the two groups, you might need to also add external users in addition to the "AllStaff" group. External email addresses for groups are not currently supported.

Templates that you import from AD RMS look and behave just like custom templates that you can create in the Azure classic portal. To change imported templates to be published so that users can see them and select them from applications, or to make other changes to the templates, see [Configuring custom templates for Azure Rights Management](../deploy-use/configure-custom-templates.md).

> [!TIP]
> For a more consistent experience for users during the migration process, do not make changes to the imported templates other than these two changes; and do not publish the two default templates that come with Azure RMS, or create new templates at this time. Instead, wait until the migration process is complete and you have decommissioned the AD RMS servers.

### Sample Windows PowerShell script to identify AD RMS templates that include the ANYONE group
This section contains the sample script to help you identify AD RMS templates that have the ANYONE group defined, as described in the preceding section.

**Disclaimer:** This sample script is not supported under any Microsoft standard support program or service. This sample script is provided AS IS without warranty of any kind.*

```
import-module adrmsadmin 

New-PSDrive -Name MyRmsAdmin -PsProvider AdRmsAdmin -Root https://localhost -Force 

$ListofTemplates=dir MyRmsAdmin:\RightsPolicyTemplate

foreach($Template in $ListofTemplates) 
{ 
                $templateID=$Template.id

                $rights = dir MyRmsAdmin:\RightsPolicyTemplate\$Templateid\userright

     $templateName=$Template.DefaultDisplayName 

        if ($rights.usergroupname -eq "anyone")

                         {
                           $templateName = $Template.defaultdisplayname

                           write-host "Template " -NoNewline

                           write-host -NoNewline $templateName -ForegroundColor Red

                           write-host " contains rights for " -NoNewline

                           write-host ANYONE  -ForegroundColor Red
                         }
 } 
Remove-PSDrive MyRmsAdmin -force
```


## Next steps
Go to [phase 2 - client-side configuration](migrate-from-ad-rms-phase2.md).

