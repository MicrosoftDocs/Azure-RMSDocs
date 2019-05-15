---
# required metadata

title: Migrate AD RMS-Azure Information Protection - Phase 2
description: Phase 2 of migrating from AD RMS to Azure Information Protection, covering steps 4 though 6 from Migrating from AD RMS to Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 11/14/2018
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
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

# Migration phase 2 - server-side configuration for AD RMS

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

Use the following information for Phase 2 of migrating from AD RMS to Azure Information Protection. These procedures cover steps 4 though 6 from [Migrating from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md).


## Step 4. Export configuration data from AD RMS and import it to Azure Information Protection
This step is a two-part process:

1. Export the configuration data from AD RMS by exporting the trusted publishing domains (TPDs) to an .xml file. This process is the same for all migrations.

2. Import the configuration data to Azure Information Protection. There are different processes for this step, depending on your current AD RMS deployment configuration and your preferred topology for your Azure RMS tenant key.

### Export the configuration data from AD RMS

Do the following procedure on all AD RMS clusters, for all trusted publishing domains that have protected content for your organization. You do not need to run this procedure on licensing-only clusters.

#### To export the configuration data (trusted publishing domain information)

1. Log on the AD RMS cluster as a user with AD RMS administration permissions.

2. From the AD RMS management console (**Active Directory Rights Management Services**), expand the AD RMS cluster name, expand **Trust Policies**, and then click **Trusted Publishing Domains**.

3. In the results pane, select the trusted publishing domain, and then, from the Actions pane, click **Export Trusted Publishing Domain**.

4. In the **Export Trusted Publishing Domain** dialog box:

    - Click **Save As** and save to path and a file name of your choice. Make sure to specify **.xml** as the file name extension (this is not appended automatically).

    - Specify and confirm a strong password. Remember this password, because you will need it later, when you import the configuration data to Azure Information Protection.

    - Do not select the checkbox to save the trusted domain file in RMS version 1.0.

When you have exported all the trusted publishing domains, you’re ready to start the procedure to import this data to Azure Information Protection.

Note that the trusted publishing domains include the Server Licensor Certificate (SLC) keys to decrypt previously protected files, so it's important that you export (and later import into Azure) all the trusted publishing domains and not just the currently active one.

For example, you will have multiple trusted publishing domains if you upgraded your AD RMS servers from Cryptographic Mode 1 to Cryptographic Mode 2. If you do not export and import the trusted publishing domain that contains your archived key that used Cryptographic Mode 1, at the end of the migration, users will not be able to open content that was protected with the Cryptographic Mode 1 key.


### Import the configuration data to Azure Information Protection
The exact procedures for this step depend on your current AD RMS deployment configuration, and your preferred topology for your Azure Information Protection tenant key.

Your current AD RMS deployment is using one of the following configurations for your server licensor certificate (SLC) key:

- Password protection in the AD RMS database. This is the default configuration.

- HSM protection by using a nCipher hardware security module (HSM).

- HSM protection by using a hardware security module (HSM) from a supplier other than nCipher.

- Password protected by using an external cryptographic provider.

> [!NOTE]
> For more information about using hardware security modules with AD RMS, see [Using AD RMS with Hardware Security Modules](https://technet.microsoft.com/library/jj651024.aspx).

The two Azure Information Protection tenant key topology options are: Microsoft manages your tenant key (**Microsoft-managed**) or you manage your tenant key (**customer-managed**) in Azure Key Vault. When you manage your own Azure Information Protection tenant key, it’s sometimes referred to as “bring your own key” (BYOK). For more information, see [Planning and implementing your Azure Information Protection tenant key](plan-implement-tenant-key.md) article.

Use the following table to identify which procedure to use for your migration. 

|Current AD RMS deployment|Chosen Azure Information Protection tenant key topology|Migration instructions|
|-----------------------------|----------------------------------------|--------------------------|
|Password protection in the AD RMS database|Microsoft-managed|See the **Software-protected key to software-protected key** migration procedure after this table.<br /><br />This is the simplest migration path and requires only that you transfer your configuration data to Azure Information Protection.|
|HSM protection by using a nCipher nShield hardware security module (HSM) |Customer-managed (BYOK)|See the **HSM-protected key to HSM-protected key** migration procedure after this table.<br /><br />This requires the Azure Key Vault BYOK toolset and three sets of steps to first transfer the key from your on-premises HSM to the Azure Key Vault HSMs, then authorize the Azure Rights Management service from Azure Information Protection to use your tenant key, and finally to transfer your configuration data to Azure Information Protection.|
|Password protection in the AD RMS database|Customer-managed (BYOK)|See the **Software-protected key to HSM-protected key** migration procedure after this table.<br /><br />This requires the Azure Key Vault BYOK toolset and four sets of steps to first extract your software key and import it to an on-premises HSM, then transfer the key from your on-premises HSM to the Azure Information Protection HSMs, next transfer your Key Vault data to Azure Information Protection, and finally to transfer your configuration data to Azure Information Protection.|
|HSM protection by using a hardware security module (HSM) from a supplier other than nCipher |Customer-managed (BYOK)|Contact the supplier for your HSM for instructions how to transfer your key from this HSM to a nCipher nShield hardware security module (HSM). Then follow the instructions for the **HSM-protected key to HSM-protected key** migration procedure after this table.|
|Password protected by using an external cryptographic provider|Customer-managed (BYOK)|Contact the supplier for your cryptographic provider for instructions how to transfer your key to a nCipher nShield hardware security module (HSM). Then follow the instructions for the **HSM-protected key to HSM-protected key** migration procedure after this table.|

If you have an HSM-protected key that you cannot export, you can still migrate to Azure Information Protection by configuring your AD RMS cluster for a read-only mode. In this mode, previously protected content can still be opened but newly protected content uses a new tenant key that is managed by you (BYOK) or managed by Microsoft. For more information, see [An update is available for Office to support migrations from AD RMS to Azure RMS](https://support.microsoft.com/help/4023955/an-update-is-available-for-office-to-support-migrations-from-ad-rms-to).

Before you start these key migration procedures, make sure that you can access the .xml files that you created earlier when you exported the trusted publishing domains. For example, these might be saved to a USB thumb drive that you move from the AD RMS server to the Internet-connected workstation.

> [!NOTE]
> However you store these files, use security best practices to protect them because this data includes your private key.

To complete Step 4, choose and select the instructions for your migration path: 

- [Software-protected key to software-protected key](migrate-softwarekey-to-softwarekey.md)
- [HSM-protected key to HSM-protected key](migrate-hsmkey-to-hsmkey.md)
- [Software-protected key to HSM-protected key](migrate-softwarekey-to-hsmkey.md)

## Step 5. Activate the Azure Rights Management service

Open a PowerShell session and run the following commands:

1. Connect to the Azure Rights Management service and when prompted, specify your global admin credentials:
    
        Connect-Aadrmservice

2. Activate the Azure Rights Management service:
    
        Enable-Aadrm

**What if your Azure Information Protection tenant is already activated?** If the Azure Rights Management service is already activated for your organization, and you have created custom templates that you want to use after the migration, you must export and import these templates. This procedure is covered in the next step. 

## Step 6. Configure imported templates

Because the templates that you imported have a default state of **Archived**, you must change this state to be **Published** if you want users to be able to use these templates with the Azure Rights Management service.

Templates that you import from AD RMS look and behave just like custom templates that you can create in the Azure portal. To change imported templates to be published so that users can see them and select them from applications, see [Configuring and managing templates for Azure Information Protection](./configure-policy-templates.md).

In addition to publishing your newly imported templates, there are just two important changes for the templates that you might need to make before you continue with the migration. For a more consistent experience for users during the migration process, do not make additional changes to the imported templates and do not publish the two default templates that come with Azure Information Protection, or create new templates at this time. Instead, wait until the migration process is complete and you have deprovisioned the AD RMS servers.

The template changes that you might need to make for this step:

- If you created Azure Information Protection custom templates before the migration, you must manually export and import them.

- If your templates in AD RMS used the **ANYONE** group, you might need to manually add users or groups. 
    
    In AD RMS, the ANYONE group granted rights to all users authenticated by your on-premises Active Directory, and this group is not supported by Azure Information Protection. The closet equivalent is a group that's automatically created for all users in your Azure AD tenant. If you were using the ANYONE group for your AD RMS templates, you might need to add users and the rights that you want to grant them.

### Procedure if you created custom templates before the migration

If you created custom templates before the migration, either before or after activating the Azure Rights Management service, templates will not be available to users after the migration, even if they were set to **Published**. To make them available to users, you must first do the following: 

1. Identify these templates and make a note of their template ID, by running the [Get-AadrmTemplate](/powershell/aadrm/vlatest/get-aadrmtemplate). 

2. Export the templates by using the Azure RMS PowerShell cmdlet, [Export-AadrmTemplate](/powershell/aadrm/vlatest/export-aadrmtemplate).

3. Import the templates by using the Azure RMS PowerShell cmdlet, [Import-AadrmTemplate](/powershell/module/aadrm/import-aadrmtemplate).

You can then publish or archive these templates as you would any other template that you create after the migration.

### Procedure if your templates in AD RMS used the **ANYONE** group

If your templates in AD RMS used the **ANYONE** group, the closest equivalent group in Azure Information Protection is named **AllStaff-7184AB3F-CCD1-46F3-8233-3E09E9CF0E66@\<tenant_name>.onmicrosoft.com**. For example, this group might look like the following for Contoso: <strong>AllStaff-7184AB3F-CCD1-46F3-8233-3E09E9CF0E66@contoso.onmicrosoft.com</strong>. This group contains all users from your Azure AD tenant.

When you manage templates and labels in the Azure portal, this group displays as your tenant's domain name in Azure AD. For example, this group might look like the following for Contoso: **contoso.onmicrosoft.com**. To add this group, the option displays **Add \<organization name> - All members**.

If you're not sure whether your AD RMS templates include the ANYONE group, you can use the following sample Windows PowerShell script to identify these templates. For more information about using Windows PowerShell with AD RMS, see [Using Windows PowerShell to Administer AD RMS](https://technet.microsoft.com/library/ee221079%28v=ws.10%29.aspx).

You can easily add external users to templates when you convert these templates to labels in the Azure portal. Then, on the **Add permissions** blade, choose **Enter details** to manually specify the email addresses for these users. 

For more information about this configuration, see [How to configure a label for Rights Management protection](./configure-policy-protection.md).

#### Sample Windows PowerShell script to identify AD RMS templates that include the ANYONE group
This section contains the sample script to help you identify any AD RMS templates that have the ANYONE group defined, as described in the preceding section.

**Disclaimer:** This sample script is not supported under any Microsoft standard support program or service. This sample script is provided AS IS without warranty of any kind.

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
Go to [phase 3 - client-side configuration](migrate-from-ad-rms-phase3.md).
