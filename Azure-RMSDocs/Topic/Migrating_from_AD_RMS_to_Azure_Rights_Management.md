---
title: Migrating from AD RMS to Azure Rights Management
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 828cf1f7-d0e7-4edf-8525-91896dbe3172
author: Cabailey
---
# Migrating from AD RMS to Azure Rights Management
Use the following set of instructions to  migrate your Active Directory Rights Management Services (AD RMS) deployment to Azure Rights Management (Azure RMS). After the migration, users will still have access to documents and email messages that your organization protected by using AD RMS, and newly protected content will use Azure RMS.

Not sure whether this AD RMS migration is right for your organization?

-   For an introduction to Azure RMS,  the business problems that it can solve, what it looks like to administrators and users, and how it works, see [What is Azure Rights Management?](../Topic/What_is_Azure_Rights_Management_.md)

-   For a comparison of Azure RMS with AD RMS, see [Comparing Azure Rights Management and AD RMS](../Topic/Comparing_Azure_Rights_Management_and_AD_RMS.md).

## Prerequisites for migrating AD RMS to Azure RMS
Before you start the migration to Azure RMS, make sure that the following prerequisites are in place and that you understand any limitations.

|Requirement|More information|
|---------------|--------------------|
|A supported RMS deployment|All releases of AD RMS from Windows Server 2008 through Windows Server 2012 R2 support a migration to Azure RMS:<br /><br />Windows Server 2008 (x86 or x64)<br /><br />Windows Server 2008 R2 (x64)<br /><br />Windows Server 2012 (x64)<br /><br />Windows Server 2012 R2 (x64)<br /><br />All valid AD RMS topologies are supported:<br /><br />Single forest, single RMS cluster<br /><br />Single forest, multiple licensing-only RMS clusters<br /><br />Multiple forests, multiple RMS clusters<br /><br />**Note**: By default, multiple RMS clusters migrate to a single Azure RMS tenant. If you want different RMS tenants, you must treat them as different migrations. A key from one RMS cluster cannot be imported to more than one Azure RMS tenant.|
|All requirements to run Azure RMS, including an Azure RMS tenant (not activated)|See [Requirements for Azure Rights Management](../Topic/Requirements_for_Azure_Rights_Management.md).<br /><br />Although you must have an Azure RMS tenant before you can migrate from AD RMS, we recommend that you do not activate the Rights Management service before the migration. The migration process includes this step after you have exported keys and templates from AD RMS and imported them to Azure RMS. However, if Azure RMS is already activated, you can still migrate from AD RMS.|
|Preparation for Azure RMS:<br /><br />Directory synchronization between your on-premises directory and Azure Active Directory<br /><br />Mail-enabled groups in Azure Active Directory|See [Preparing for Azure Rights Management](../Topic/Preparing_for_Azure_Rights_Management.md).|
|If you have used the Information Rights Management (IRM) functionality of Exchange Server (for example, transport rules and Outlook Web Access) or SharePoint Server with AD RMS:<br /><br />Plan for a short period of time when IRM will not be available on these servers|You can continue to use IRM on these servers with Azure RMS after the migration. However, one of the migration steps is to temporarily disable the IRM service, install and configure a connector, reconfigure the servers, and then re-enable IRM.<br /><br />This is the only interruption to service during the migration process.|
Limitations:

-   Although the migration process supports migrating your server licensing certificate (SLC) key to a hardware security module (HSM) for Azure RMS, Exchange Online does not currently support this configuration. If you want full IRM functionality with Exchange Online after you migrate to Azure RMS, your Azure RMS tenant key must be [managed by Microsoft](http://technet.microsoft.com/library/dn440580.aspx). Alternatively, you can run IRM with reduced functionality in Exchange Online  when your Azure RMS tenant is managed by you (BYOK). For more information about using Exchange Online with Azure RMS, see [Step 6. Configure IRM integration for Exchange Online](#BKMK_Step6Migration) in these instructions.

-   If you have software and clients that are not supported with Azure RMS, they will not be able to protect or consume content that is protected by Azure RMS. Be sure to check the supported applications and clients section in the [Requirements for Azure Rights Management](../Topic/Requirements_for_Azure_Rights_Management.md) topic.

-   If you import your on-premises key to Azure RMS as archived (you do not set the TPD to be the active during the import process) and you migrate users in batches for a phased migration, content that is newly protected by the migrated users will not be accessible to users who remain on AD RMS. In this scenario, whenever  possible, keep the migration time short and migrate users in logical batches such that if they collaborate with one another, they are migrated together.

    This limitation does not apply when you set the TPD to active during the import process, because all users will protect content by using the same key. We recommend this configuration because it lets you migrate all users independently and at your own pace.

-   If you collaborate with external partners (for example, by using trusted user domains or federation), they must also migrate to Azure RMS either at the same time as your migration, or as soon as possible afterwards. To continue to access content that your organization previously protected by using AD RMS, they must make client configuration changes that are similar to those that you make, and included in this document.

    Because of the possible configuration variations that your partners might have, exact instructions for this reconfiguration are out of scope for this document. For help, contact Microsoft Customer Support Services (CSS).

## Steps for migrating AD RMS to Azure RMS

|Migration step|More information|
|------------------|--------------------|
|**1. Download the Azure RMS Management Administration Tools**|For instructions, see [Step 1: Download the Azure Rights Management Administration Tool](../Topic/Migrating_from_AD_RMS_to_Azure_Rights_Management.md#BKMK_Step1Migration).|
|**2. Export configuration data from AD RMS and import it to Azure RMS**|You export the configuration data (keys, templates, URLs) from AD RMS to an XML file, and then upload that file to Azure RMS by using the Import-AadrmTpd Windows PowerShell cmdlet. Additional steps might be needed, depending your on AD RMS key configuration:<br /><br />**Software-protected key to software-protected key migration**: Centrally managed, password-based keys in AD RMS to Microsoft-managed Azure RMS tenant key. This is the simplest migration path and no additional steps are required.<br /><br />**HSM-protected  key to HSM-protected key migration**: Keys that are stored by an HSM for AD RMS to customer-managed Azure RMS tenant key (the “bring your own key” or BYOK scenario). This requires additional steps to transfer the key from your on-premises Thales HSM to the Azure RMS HSM.<br /><br />**Software-protected key to HSM-protected key migration**: Centrally managed, password-based keys in AD RMS to customer-managed Azure RMS tenant key (the “bring your own key” or BYOK scenario). This requires the most configuration because you must first extract your software key and import it to an on-premises HSM, and then do the additional steps to transfer the key from your on-premises Thales HSM to the Azure RMS HSM.<br /><br />For instructions, see [Step 2. Export configuration data from AD RMS and import it to Azure RMS](../Topic/Migrating_from_AD_RMS_to_Azure_Rights_Management.md#BKMK_Step2Migration).|
|**3. Activate your RMS tenant**|If possible, do this step after the import process and not before.<br /><br />For more information and instructions, see [Step 3. Activate your RMS tenant](../Topic/Migrating_from_AD_RMS_to_Azure_Rights_Management.md#BKMK_Step3Migration).|
|**4. Configure imported templates**|When you import your rights policy templates, their status is archived. If you want users to be able to see and use them, you must change the template status to published in the Azure classic portal.<br /><br />For instructions, see [Step 4. Configure imported templates](../Topic/Migrating_from_AD_RMS_to_Azure_Rights_Management.md#BKMK_Step4Migration).|
|**5. Reconfigure clients to use Azure RMS**|Existing Windows computers must be reconfigured to use the Azure RMS service instead of AD RMS. This step applies to computers in your organization, and to computers in partner organizations if you have collaborated with them while you were running AD RMS.<br /><br />In addition, if you have deployed the [mobile device extensions](http://technet.microsoft.com/library/dn673574.aspx) to support mobile devices such as iOS phones and iPads, Android phones and tablets, Windows phone, and Mac computers, you must remove the SRV records in DNS that redirected these clients to use AD RMS.<br /><br />For instructions, see [Step 5. Reconfigure clients to use Azure RMS](../Topic/Migrating_from_AD_RMS_to_Azure_Rights_Management.md#BKMK_Step5Migration).|
|**6. Configure IRM integration with Exchange Online**|This step is required if you want to use Exchange Online with Azure RMS.<br /><br />For instructions, see [Step 6. Configure IRM integration for Exchange Online](#BKMK_Step6Migration).|
|**7. Deploy the RMS connector**|This step is required if you want to use any of the following on-premises services with Azure RMS:<br /><br />Exchange Server (for example, transport rules and Outlook Web Access)<br /><br />SharePoint Server<br /><br />Windows Server that runs File Classification Infrastructure<br /><br />For instructions, see [Step 7. Deploy the RMS connector](#BKMK_Step7Migration).|
|**8. Decommission AD RMS**|When you have confirmed that all clients are using Azure RMS and no longer accessing the AD RMS servers, you can decommission your AD RMS deployment.<br /><br />For instructions, see [Step 8. Decommission AD RMS](#BKMK_Step8Migration).|
|**9. Re-key your Azure RMS tenant key**|This step is required if you were not running in Cryptographic Mode 2 before the migration, and optional but recommended for all migrations to help safeguard the security of your Azure RMS tenant key.<br /><br />For instructions, see [Step 9. Re-key your Azure RMS tenant key](#BKMK_Step9Migration).|

### <a name="BKMK_Step1Migration"></a>Step 1: Download the Azure Rights Management Administration Tool
Go to the Microsoft Download Center and download the [Azure Rights Management Administration Tool](http://go.microsoft.com/fwlink/?LinkId=257721), which contains the Azure RMS administration module for Windows PowerShell.

### <a name="BKMK_Step2Migration"></a>Step 2. Export configuration data from AD RMS and import it to Azure RMS
This step is a two-part process:

1.  Export the configuration data from AD RMS by exporting the trusted publishing domains (TPDs) to an .xml file. This process is the same for all migrations.

2.  Import the configuration data to Azure RMS. There are different processes for this step, depending on your current AD RMS deployment configuration and your preferred topology for your Azure RMS tenant key.

#### Export the configuration data from AD RMS
Do the following procedure on all AD RMS clusters, for all trusted publishing domains that have protected content for your organization. You do not need to run this on licensing-only clusters.

> [!NOTE]
> If you are using Windows Server 2003 Rights Management, instead of these instructions, follow the procedure [Export SLC, TUD, TPD and RMS private key](http://technet.microsoft.com/library/jj835767%28v=ws.10%29.aspx) from the [Migrating from Windows RMS to AD RMS in a Different Infrastructure](http://technet.microsoft.com/library/jj835767%28v=ws.10%29.aspx) topic.

###### To export the configuration data (trusted publishing domain information)

1.  Log on the AD RMS cluster as a user with AD RMS administration permissions.

2.  From the AD RMS management console (**Active Directory Rights Management Services**), expand the AD RMS cluster name, expand **Trust Policies**, and then click **Trusted Publishing Domains**.

3.  In the results pane, select the trusted publishing domain, and then, from the Actions pane, click **Export Trusted Publishing Domain**.

4.  In the **Export Trusted Publishing Domain** dialog box:

    -   Click **Save As** and save to path and a file name of your choice. Make sure to specify **.xml** as the file name extension (this is not appended automatically).

    -   Specify and confirm a strong password. Remember this password, because you will need it later, when you import the configuration data to Azure RMS.

    -   Do not select the checkbox to save the trusted domain file in RMS version 1.0.

When you have exported all the trusted publishing domains, you’re ready to start the procedure to import this data to Azure RMS.

#### Import the configuration data to Azure RMS
The exact procedures for this step depend on your current AD RMS deployment configuration, and your preferred topology for your Azure RMS tenant key.

Your current AD RMS deployment will be using one of the following configurations for your server licensor certificate (SLC) key:

-   Password protection in the AD RMS database. This is the default configuration.

-   HSM protection by using a Thales hardware security module (HSM).

-   HSM protection by using a hardware security module (HSM) from a supplier other than Thales.

-   Password protected by using an external cryptographic provider.

> [!NOTE]
> For more information about using hardware security modules with AD RMS, see [Using AD RMS with Hardware Security Modules](http://technet.microsoft.com/library/jj651024.aspx).

The two Azure RMS tenant key topology options are: Microsoft manages your tenant key (**Microsoft-managed**) or you manage your tenant key (**customer-managed**). When you manage your own Azure RMS tenant key, it’s sometimes referred to as “bring your own key” (BYOK) and requires a hardware security module (HSM) from Thales. For more information, see the [Choose your tenant key topology: Managed by Microsoft (the default) or managed by you (BYOK)](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_ChooseTenantKey) section in the [Planning and Implementing Your Azure Rights Management Tenant Key](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md) topic.

> [!IMPORTANT]
> Exchange Online is not currently  compatible with Azure RMS BYOK.  If you want to use BYOK after your migration and plan to use Exchange Online, make sure that you understand how this configuration reduces IRM functionality for Exchange Online. Review  the information in the [BYOK pricing and restrictions](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_Pricing) section in the  [Planning and Implementing Your Azure Rights Management Tenant Key](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md) topic to help you choose the best Azure RMS tenant key topology for your migration.

Use the following table to identify which procedure to use for your migration. Combinations that are not listed are not supported.

|Current AD RMS deployment|Chosen Azure RMS tenant key topology|Migration instructions|
|-----------------------------|----------------------------------------|--------------------------|
|Password protection in the AD RMS database|Microsoft-managed|See the **Software-protected key to software-protected key migration** procedure after this table.<br /><br />This is the simplest migration path and requires only that you transfer your configuration data to Azure RMS.|
|HSM protection by using a Thales nShield hardware security module (HSM)|Customer-managed (BYOK)|See the **HSM-protected key to HSM-protected key migration** procedure after this table.<br /><br />This requires the BYOK toolset and two set of steps to transfer the key from your on-premises HSM to the Azure RMS HSMs and then transfer your configuration data to Azure RMS.|
|Password protection in the AD RMS database|Customer-managed (BYOK)|See the **Software-protected key to HSM-protected key migration** procedure after this table.<br /><br />This requires the BYOK toolset and three sets of steps to first extract your software key and import it to an on-premises HSM, then transfer the key from your on-premises HSM to the Azure RMS HSMs, and finally transfer your configuration data to Azure RMS.|
|HSM protection by using a hardware security module (HSM) from a supplier other than Thales|Customer-managed (BYOK)|Contact the supplier for you HSM for instructions how to transfer your key from this HSM to a Thales nShield Hardware Security Module (HSM). Then follow the instructions for the **HSM-protected key to HSM-protected key migration** procedure after this table.|
|Password protected by using an external cryptographic provider|Customer-managed (BYOK)|Contact the supplier for you cryptographic provider for instructions how to transfer your key to a Thales nShield hardware security module (HSM). Then follow the instructions for the **HSM-protected key to HSM-protected key migration** procedure after this table.|
Before you start these procedures, make sure that you can access the .xml files that you created earlier when you exported the trusted publishing domains. For example, these might be saved to a USB thumb drive that you move from the AD RMS server to the Internet-connected workstation.

> [!NOTE]
> However you store these files, use security best practices to protect them because this data includes your private key.

##### Software-protected key to software-protected key migration
Use this procedure to import the AD RMS configuration to Azure RMS, to result in your Azure RMS tenant key that is managed by Microsoft.

###### To import the configuration data to Azure RMS

1.  On an Internet-connected workstation, download and install the Windows PowerShell module for Azure RMS (minimum version 2.1.0.0), which includes the [Import-AadrmTpd](http://msdn.microsoft.com/library/azure/dn857523.aspx) cmdlet.

    > [!TIP]
    > If you have previously downloaded and installed the module, check the version number by running: `(Get-Module aadrm -ListAvailable).Version`

    For installation instructions, see [Installing Windows PowerShell for Azure Rights Management](../Topic/Installing_Windows_PowerShell_for_Azure_Rights_Management.md).

2.  Start Windows PowerShell with the **Run as administrator** option and use the [Connect-AadrmService](http://msdn.microsoft.com/library/azure/dn629415.aspx) cmdlet to connect to the Azure RMS service:

    ```
    Connect-AadrmService
    ```
    When prompted, enter your [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] tenant administrator credentials (typically, you will use an account that is a global administrator for Azure Active Directory or Office 365).

3.  Use the [Import-AadrmTpd](http://msdn.microsoft.com/library/azure/dn857523.aspx) cmdlet to upload the first exported trusted publishing domain (.xml) file. If you have more than one .xml file because you had multiple trusted publishing domains, choose the file that contains the exported trusted publishing domain that you want to use in Azure RMS to protect content after the migration. Use the following command:

    ```
    Import-AadrmTpd -TpdFile <PathToTpdPackageFile> -ProtectionPassword -Active $True -Verbose
    ```
    For example: **Import-AadrmTpd -TpdFile E:\contosokey1.xml -ProtectionPassword -Active $true -Verbose**

    When prompted, enter the password that you specified earlier, and confirm that you want to perform this action.

4.  When the command completes, repeat step 3 for each remaining  .xml file that you created by exporting your trusted publishing domains. But for these files, set **-Active** to **false** when you run the Import command. For example: **Import-AadrmTpd -TpdFile E:\contosokey2.xml -ProtectionPassword -Active $false -Verbose**

5.  Use the [Disconnect-AadrmService](http://msdn.microsoft.com/library/azure/dn629416.aspx) cmdlet to disconnect from the Azure RMS service:

    ```
    Disconnect-AadrmService
    ```

You’re now ready to go to [Step 3. Activate your RMS tenant](../Topic/Migrating_from_AD_RMS_to_Azure_Rights_Management.md#BKMK_Step3Migration).

##### HSM-protected key to HSM-protected key migration
It’s a two-part procedure to import your HSM key and AD RMS configuration to Azure RMS, to result in your Azure RMS tenant key that is managed by you (BYOK).

You must first package your HSM key so it's ready to transfer to Azure RMS, and then import it with the configuration data.

###### Part 1: Package your HSM key so it's ready to transfer to Azure RMS

1.  Follow the steps in the [Implementing bring your own key (BYOK)](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_ImplementBYOK) section of the [Planning and Implementing Your Azure Rights Management Tenant Key](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md), using the procedure **Generate and transfer your tenant key – over the Internet** with the following exceptions:

    -   Do not follow the steps for **Generate your tenant key**, because you already have the equivalent from your AD RMS deployment. You must identify the key used by your AD RMS server from the Thales installation and use this key during the migration. Thales encrypted key files are usually named **key_(keyAppName)_(keyIdentifier)** locally on the server.

    -   Do not follow the steps for **Transfer your tenant key to Azure RMS**, which uses the  Add-AadrmKey command.  Instead, you will transfer your prepared HSM key when you upload your exported trusted publishing domain, by using the Import-AadrmTpd command.

2.  On the Internet-connected workstation, in Windows PowerShell session, reconnect to the Azure RMS service.

Now that you’ve prepared your HSM key for Azure RMS, you’re ready to import your HSM key file and AD RMS configuration data.

###### Part 2: Import the HSM key and configuration data to Azure RMS

1.  Still on the Internet-connect workstation and in the Windows PowerShell session, upload the first exported trusted publishing domain (.xml) file. If you have more than one .xml file because you had multiple trusted publishing domains, choose the file that contains the exported trusted publishing domain that corresponds to the HSM key you want to use in Azure RMS to protect content after the migration. Use the following command:

    ```
    Import-AadrmTpd -TpdFile <PathToTpdPackageFile> -ProtectionPassword -HsmKeyFile <PathToBYOKPackage> -Active $True -Verbose
    ```
    For example: **Import -TpdFile E:\no_key_tpd_contosokey1.xml  -HsmKeyFile E:\KeyTransferPackage-contosokey.byok -ProtectionPassword -Active $true -Verbose**

    When prompted, enter the password that you specified earlier, and confirm that you want to perform this action.

2.  When the command completes, repeat step 1 for each remaining  .xml file that you created by exporting your trusted publishing domains. But for these files, set **-Active** to **false** when you run the Import command.  For example: **Import -TpdFile E:\contosokey2.xml -HsmKeyFile E:\KeyTransferPackage-contosokey.byok -ProtectionPassword -Active $false -Verbose**

3.  Use the [Disconnect-AadrmService](http://msdn.microsoft.com/library/windowsazure/dn629416.aspx) cmdlet to disconnect from the Azure RMS service:

    ```
    Disconnect-AadrmService
    ```

You’re now ready to go to [Step 3. Activate your RMS tenant](../Topic/Migrating_from_AD_RMS_to_Azure_Rights_Management.md#BKMK_Step3Migration).

##### Software-protected key to HSM-protected key migration
It’s a three-part procedure to import the AD RMS configuration to Azure RMS, to result in your Azure RMS tenant key that is managed by you (BYOK).

You must first extract your server licensor certificate (SLC) key from the configuration data and transfer the key to an on-premises Thales HSM, then package and transfer your HSM key to Azure RMS, and then import the configuration data.

###### Part 1: Extract your SLC from the configuration data and import the key to your on-premises HSM

1.  Use the following steps in the [Implementing bring your own key (BYOK)](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_ImplementBYOK) section of the [Planning and Implementing Your Azure Rights Management Tenant Key](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md) topic:

    -   **Generate and transfer your tenant key – over the Internet**: **Prepare your Internet-connected workstation**

    -   **Generate and transfer your tenant key – over the Internet**: **Prepare your disconnected workstation**

    Do not follow the steps to generate your tenant key, because you already have the equivalent in the exported configuration data (.xml) file. Instead, you will run a command to extract this key from the file and import it to your on-premises HSM.

2.  On the disconnected workstation, run the following command:

    ```
    KeyTransferRemote.exe -ImportRmsCentrallyManagedKey -TpdFilePath <TPD> -ProtectionPassword -KeyIdentifier <KeyID> -ExchangeKeyPackage <BYOK-KEK-pka-Region> -NewSecurityWorldPackage <BYOK-SecurityWorld-pkg-Region>
    ```
    For example, for North America: **KeyTransferRemote.exe -ImportRmsCentrallyManagedKey -TpdFilePath E:\contosokey1.xml -ProtectionPassword -KeyIdentifier contosorms1key –- -ExchangeKeyPackage &lt;BYOK-KEK-pka-NA-1&gt; -NewSecurityWorldPackage &lt;BYOK-SecurityWorld-pkg-NA-1&gt;**

    Additional information:

    -   The ImportRmsCentrallyManagedKey parameter indicates that the operation is to import the SLC key.

    -   If you don’t specify the password in the command, you will be prompted to specify it.

    -   The KeyIdentifier parameter is for a key friendly name that creates the key file name. You must use only lower-case ASCII characters.

    -   The ExchangeKeyPackage parameter specifies a region-specific key exchange key (KEK) package that has a name beginning with BYOK-KEK-pkg-.

    -   The NewSecurityWorldPackage parameter specifies a region-specific security world package that has a name beginning with BYOK-SecurityWorld-pkg-.

    This command results in the following:

    -   An HSM key file: %NFAST_KMDATA%\local\key_mscapi_&lt;KeyID&gt;

    -   RMS configuration data file with the SLC removed: %NFAST_KMDATA%\local\no_key_tpd_&lt;KeyID&gt;.xml

3.  If you have more than one RMS configuration data files, repeat step 2 for the remainder of these files.

Now that your SLC has been extracted so that it’s an HSM-based key, you’re ready to package and transfer it to Azure RMS.

###### Part 2: Package and transfer your HSM key to Azure RMS

1.  Use the following steps from the [Implementing bring your own key (BYOK)](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_ImplementBYOK) section of the [Planning and Implementing Your Azure Rights Management Tenant Key](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md):

    -   **Generate and transfer your tenant key – over the Internet**: **Prepare your tenant key for transfer**

    -   **Generate and transfer your tenant key – over the Internet**: **Transfer your tenant key to Azure RMS**

Now that you’ve transferred your HSM key to Azure RMS, you’re ready to import your AD RMS configuration data, which contains only a pointer to the newly transferred tenant key.

###### Part 3: Import the configuration data to Azure RMS

1.  Still on the Internet-connected workstation and in the Windows PowerShell session, copy over the RMS configuration files with the SLC removed (from the disconnected workstation, %NFAST_KMDATA%\local\no_key_tpd_&lt;KeyID&gt;.xml)

2.  Upload the first file. If you have more than one .xml file because you had multiple trusted publishing domains, choose the file that contains the exported trusted publishing domain that corresponds to the HSM key you want to use in Azure RMS to protect content after the migration. Use the following command:

    ```
    Import-AadrmTpd -TpdFile <PathToNoKeyTpdPackageFile> -ProtectionPassword -HsmKeyFile <PathToKeyTransferPackage> -Active $true -Verbose
    ```
    For example: **Import -TpdFile E:\no_key_tpd_contosorms1key.xml -ProtectionPassword -HsmKeyFile E:\KeyTransferPackage-contosorms1key.byok -Active $true -Verbose**

    When prompted, enter the password that you specified earlier, and confirm that you want to perform this action.

3.  When the command completes, repeat step 2 for each remaining  .xml file that you created by exporting your trusted publishing domains. But for these files, set **-Active** to **false** when you run the Import command. For example: **Import -TpdFile E:\no_key_tpd_contosorms2key.xml -ProtectionPassword -HsmKeyFile E:\KeyTransferPackage-contosorms1key.byok -Active $false -Verbose**

4.  Use the [Disconnect-AadrmService](http://msdn.microsoft.com/library/windowsazure/dn629416.aspx) cmdlet to disconnect from the Azure RMS service:

    ```
    Disconnect-AadrmService
    ```

You’re now ready to go to [Step 3. Activate your RMS tenant](../Topic/Migrating_from_AD_RMS_to_Azure_Rights_Management.md#BKMK_Step3Migration).

### <a name="BKMK_Step3Migration"></a>Step 3. Activate your RMS tenant
Instructions  for this step are fully covered in the [Activating Azure Rights Management](../Topic/Activating_Azure_Rights_Management.md) topic.

> [!TIP]
> If you have an Office 365 subscription, you can activate Azure RMS from the Office 365 admin center or the Azure classic portal. We recommend that you use the Azure classic portal because you will use this management portal to complete the next step.

**What if your Azure RMS tenant is already activated?** If the Azure RMS service is already activated for your organization, users might have already used Azure RMS to protect content with an automatically generated tenant key (and the default templates) rather than your existing keys (and templates) from AD RMS. This is unlikely to happen on computers that are well-managed on your intranet, because they will be automatically configured for your AD RMS infrastructure. But it can happen on workgroup computers or computers that infrequently connect to your intranet. Unfortunately, it’s also difficult to identify these computers, which is why we recommend you do not activate the service before you import the configuration data from AD RMS.

If your Azure RMS tenant is already activated and you can identify these computers, make sure that you run the CleanUpRMS_RUN_Elevated.cmd script on these computers, as described in Step 5. Running this script forces them to reinitialize the user environment, so that they download the updated tenant key and imported templates.

### <a name="BKMK_Step4Migration"></a>Step 4. Configure imported templates
Because the templates that you imported have a default state of **Archived**, you must change this state to be **Published** if you want users to be able to use these templates with Azure RMS.

In addition, if your templates in AD RMS used the **ANYONE** group, this group is automatically removed  when you import the templates to Azure RMS; you must manually add the equivalent group or users and the same rights to the imported templates. The equivalent group for Azure RMS is named **AllStaff-&lt;tenant_GUID&gt;@&lt;tenant_name&gt;.onmicrosoft.com**. For example, this group might look like the following for Contoso: **AllStaff-9c11c87a-ac8b-46a3-8d5c-f4d0b72ee29a@contoso.onmicrosoft.com**.

If  you're not sure whether your AD RMS templates include the ANYONE group, expand the  [Sample Windows PowerShell script to identify AD RMS templates that include the ANYONE group](#BKMK_ScriptForANYONE) section in this step to copy and use the sample PowerShell script to identify these templates. For more information about using Windows PowerShell with AD RMS, see  [Using Windows PowerShell to Administer AD RMS](https://technet.microsoft.com/library/ee221079%28v=ws.10%29.aspx).

You can see your organization's automatically created group if you copy one of the default rights policy templates in the Azure classic portal, and then identify the **USER NAME** on the **RIGHTS** page. However, you cannot use the classic portal to add this group to a template that was manually created or imported and instead must use one of the following Azure RMS PowerShell options:

-   Use the [New-AadrmRightsDefinition](https://msdn.microsoft.com/library/azure/dn727080.aspx) PowerShell cmdlet to define the  "AllStaff" group and rights as a rights definition object, and run this command again for each of the other groups or users already granted rights in the original template in addition to the ANYONE group. Then add all these rights definition objects to the templates by using the  [Set-AadrmTemplateProperty](https://msdn.microsoft.com/en-us/library/azure/dn727076.aspx) cmdlet.

-   Use the [Export-AadrmTemplate](https://msdn.microsoft.com/library/azure/dn727078.aspx) cmdlet to export the template to a .XML file that you can edit to add the "AllStaff" group and rights to the existing groups and rights, and then use the [Import-AadrmTemplate](https://msdn.microsoft.com/library/azure/dn727077.aspx) cmdlet to import this change back into Azure RMS.

> [!NOTE]
> This "AllStaff" equivalent group isn't exactly the same as the ANYONE group in AD RMS:  The "AllStaff" group includes all users in your Azure tenant, whereas the ANYONE group includes all authenticated users, who could be outside your organization.
> 
> Because of this difference between the two groups, you might need to also add external users in addition to the "AllStaff" group. External email addresses for groups are not currently supported.

Templates that you import from AD RMS look and behave just like custom templates that you can create in the Azure classic portal. To change imported templates to be published so that users can see them and select them from applications, or to make other changes to the templates, see [Configuring Custom Templates for Azure Rights Management](../Topic/Configuring_Custom_Templates_for_Azure_Rights_Management.md).

> [!TIP]
> For a more consistent experience for users during the migration process, do not make changes to the imported templates other than these two changes; and do not publish the two default templates that come with Azure RMS, or create new templates at this time. Instead, wait until the migration process is complete and you have decommissioned the AD RMS servers.

#### <a name="BKMK_ScriptForANYONE"></a>Sample Windows PowerShell script to identify AD RMS templates that include the ANYONE group
This section contains the sample script to help you identify AD RMS templates that have the ANYONE group defined, as described in the preceding section.

***Disclaimer:** This sample script is not supported under any Microsoft standard support program or service. This sample script is provided AS IS without warranty of any kind.*

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

### <a name="BKMK_Step5Migration"></a>Step 5. Reconfigure clients to use Azure RMS
For Windows clients:

1.  [Download the migration scripts](http://go.microsoft.com/fwlink/?LinkId=524619):

    -   CleanUpRMS_RUN_Elevated.cmd

    -   Redirect_OnPrem.cmd

    These scripts reset the configuration on Windows computers so that they will use the Azure RMS service rather than AD RMS.

2.  Follow the instructions in the redirection script (Redirect_OnPrem.cmd) to modify the script to point to your new Azure RMS tenant.

3.  On the Windows computers, run these scripts with elevated privileges in the user’s context.

For mobile device clients and Mac computers:

-   Remove the DNS SRV records that you created when you deployed the [AD RMS mobile device extension](http://technet.microsoft.com/library/dn673574.aspx).

#### Changes made by the migration scripts
This section documents the changes that the migration scripts make. You can use this information for reference purposes only, or for troubleshooting, or if you prefer to make these changes yourself.

CleanUpRMS_RUN_Elevated.cmd:

-   Delete the contents of the %userprofile%\AppData\Local\Microsoft\DRM and %userprofile%\AppData\Local\Microsoft\MSIPC folders, including any subfolders and any files with long file names.

-   Delete the contents of the following registry keys:

    -   HKEY_LOCAL_MACHINE\Software\Microsoft\Office\(11.0|12.0|14.0)\Common\DRM

    -   HKEY_CURRENT_USER\Software\Microsoft\Office\(11.0|12.0|14.0)\Common\DRM

    -   HKEY_LOCAL_MACHINE\Software\WoW6432Node\Microsoft\Office\(11.0|12.0|14.0)\Common\DRM

    -   HKEY_CURRENT_USER\Software\WoW6432Node\Microsoft\Office\(11.0|12.0|14.0)\Common\DRM

    -   HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSIPC\ServiceLocation

    -   HKEY_LOCAL_MACHINE\SOFTWARE\WoW6432Node\Microsoft\MSIPC\ServiceLocation

    -   HKEY_LOCAL_MACHINE\Software\Microsoft\MSDRM\ServiceLocation

-   Delete the following registry values:

    -   HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Common\DRM\DefaultServerURL

    -   HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Common\DRM\DefaultServer

Redirect_OnPrem.cmd:

-   Create the following registry values for each URL supplied as a parameter under each of the following locations:

    -   HKEY_CURRENT_USER\Software\Microsoft\Office\(11.0|12.0|14.0)\Common\DRM\LicenseServerRedirection

    -   HKEY_CURRENT_USER\Software\WoW6432Node\Microsoft\Office\(11.0|12.0|14.0)\Common\DRM\LicenseServerRedirection

    -   HKEY_LOCAL_MACHINE\Software\Microsoft\Office\(11.0|12.0|14.0)\Common\DRM\LicenseServerRedirection

    -   HKEY_LOCAL_MACHINE\Software\WoW6432Node\Microsoft\Office\(11.0|12.0|14.0)\Common\DRM\LicenseServerRedirection

    -   HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\MSIPC\LicensingRedirection

    Each entry has a REG_SZ value of **https://OldRMSserverURL/_wmcs/licensing** with the data in the following format: **https://&lt;YourTenantURL&gt;/_wmcs/licensing**.

    > [!NOTE]
    > *&lt;YourTenantURL&gt;* has the following format: **{GUID}.rms.[Region].aadrm.com**.
    > 
    > For example:  5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com
    > 
    > You can find this value by identifying the **RightsManagementServiceId** value when you run the [Get-AadrmConfiguration](http://msdn.microsoft.com/library/windowsazure/dn629410.aspx) cmdlet for Azure RMS.

### <a name="BKMK_Step6Migration"></a>Step 6. Configure IRM integration for Exchange Online
If you have previously imported your TDP from AD RMS to Exchange Online, you must remove this TDP to avoid conflicting templates and policies after you have migrated to Azure RMS. To do this, use the [Remove-RMSTrustedPublishingDomain](https://technet.microsoft.com/en-us/library/jj200720%28v=exchg.150%29.aspx) cmdlet from Exchange Online.

If you chose an Azure RMS tenant key topology of **Microsoft managed**:

-   See the [Exchange Online: IRM Configuration](../Topic/Configuring_Applications_for_Azure_Rights_Management.md#BKMK_ExchangeOnline) section in the [Configuring Applications for Azure Rights Management](../Topic/Configuring_Applications_for_Azure_Rights_Management.md) topic. This section includes typical commands to run that connects to the Exchange Online service, imports the tenant key from Azure RMS,  and enables IRM functionality for Exchange Online. After you complete these steps, you will have full RMS functionality with Exchange Online.

If you chose an Azure RMS tenant key topology of **customer-managed (BYOK)**:

-   You will  have reduced RMS functionality with Exchange Online, as described in the [BYOK pricing and restrictions](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_Pricing) section in the [Planning and Implementing Your Azure Rights Management Tenant Key](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md) topic.

### <a name="BKMK_Step7Migration"></a>Step 7. Deploy the RMS connector
If you have used the Information Rights Management (IRM) functionality of Exchange Server or SharePoint Server with AD RMS, you must first disable IRM on these servers and remove AD RMS configuration. Then, deploy the Rights Management (RMS) connector, which acts as a communications interface (a relay) between the on-premises servers and Azure RMS.

Finally for this step, if you have imported multiple TPDs into Azure RMS that were used to protect email messages, you must manually edit the registry on the Exchange Server computers to redirect all TPDs URLs to the RMS connector.

> [!NOTE]
> Before you start, check the supported versions of the on-premises servers that the RMS connector supports in “On-premises servers that support Azure RMS” in the [Applications that support Azure RMS](../Topic/Requirements_for_Azure_Rights_Management.md#BKMK_SupportedApplications) section of the [Requirements for Azure Rights Management](../Topic/Requirements_for_Azure_Rights_Management.md) topic.

##### Disable IRM on Exchange Servers and remove AD RMS configuration

1.  On each Exchange server, locate the following folder and delete all the entries in that folder: \ProgramData\Microsoft\DRM\Server\S-1-5-18

2.  From one of the Exchange servers, use the Exchange [Set_IRMConfiguration](http://technet.microsoft.com/library/dd979792.aspx) cmdlet to first disable IRM features for messages that are sent to internal recipients:

    ```
    Set-IRMConfiguration -InternalLicensingEnabled $false
    ```

3.  Then use the same cmdlet to disable IRM features for messages that are sent to external recipients:

    ```
    Set-IRMConfiguration -ExternalLicensingEnabled $false
    ```

4.  Next, use the same cmdlet to disable IRM in Microsoft Office Outlook Web App and in Microsoft Exchange ActiveSync:

    ```
    Set-IRMConfiguration -ClientAccessServerEnabled $false
    ```

5.  Finally, use the same cmdlet to clear any cached certificates:

    ```
    Set-IRMConfiguration -RefreshServerCertificates
    ```

6.  On each Exchange Server, now reset IIS, for example, by running a command prompt as an administrator and typing **iisreset**.

##### Disable IRM on SharePoint Servers and remove AD RMS configuration

1.  Make sure that there are no documents checked out from RMS-protected libraries. If there are, they will be become inaccessible at the end of this procedure.

2.  On the SharePoint Central Administration Web site, in the **Quick Launch** section, click **Security**.

3.  On the **Security** page, in the **Information Policy** section, click **Configure information rights management**.

4.  On the **Information Rights Management** page, in the **Information Rights Management** section, select **Do not use IRM on this server**, then click **OK**.

5.  On each of the SharePoint Server computers, delete the contents of the folder \ProgramData\Microsoft\MSIPC\Server\*&lt;SID of the account running SharePoint Server&gt;*.

##### Install and configure the RMS connector

-   Use the instructions in the [Deploying the Azure Rights Management Connector](../Topic/Deploying_the_Azure_Rights_Management_Connector.md) topic.

##### For Exchange only and multiple TPDs: Edit the registry

-   On each Exchange Server, manually add the following registry keys for each additional TPD that you imported, to redirect the TPD URLs to the RMS connector. These registry entries are specific to migration and are not added by the server configuration tool for Microsoft RMS connector.

    When you make these registry edits, use the following instructions:

    -   Replace *ConnectorFQDN* with the name that you defined in DNS for the connector. For example, **rmsconnector.contoso.com**.

    -   Use the HTTP or HTTPS prefix for the connector URL, depending on whether you have configured the connector to use HTTP or HTTPS to communicate with your on-premises servers.

    **For Exchange 2013:**

    |Registry path|Type|Value|Data|
    |-----------------|--------|---------|--------|
    |HKLM\SOFTWARE\Microsoft\ExchangeServer\v15\IRM\LicenseServerRedirection|Reg_SZ|https://&lt;AD RMS Intranet Licensing URL&gt;/_wmcs/licensing|One of the following, depending on whether you are using HTTP or HTTPS from your Exchange server to the RMS connector:<br /><br />http://&lt;connectorFQDN&gt;/_wmcs/licensing<br /><br />https://&lt;connectorName&gt;/_wmcs/licensing|
    |HKLM\SOFTWARE\Microsoft\ExchangeServer\v15\IRM\LicenseServerRedirection|Reg_SZ|https://&lt;AD RMS Extranet Licensing URL&gt;/_wmcs/licensing|One of the following, depending on whether you are using HTTP or HTTPS from your Exchange server to the RMS connector:<br /><br />http://&lt;connectorFQDN&gt;/_wmcs/licensing<br /><br />https://&lt;connectorFQDN&gt;/_wmcs/licensing|
    **For Exchange Server 2010:**

    |Registry path|Type|Value|Data|
    |-----------------|--------|---------|--------|
    |HKLM\SOFTWARE\Microsoft\ExchangeServer\v14\IRM\LicenseServerRedirection|Reg_SZ|https://&lt;AD RMS Intranet Licensing URL&gt;/_wmcs/licensing|One of the following, depending on whether you are using HTTP or HTTPS from your Exchange server to the RMS connector:<br /><br />http://&lt;connectorName&gt;/_wmcs/licensing<br /><br />https://&lt;connectorName&gt;/_wmcs/licensing|
    |HKLM\SOFTWARE\Microsoft\ExchangeServer\v14\IRM\LicenseServerRedirection|Reg_SZ|https://&lt;AD RMS Extranet Licensing URL&gt;/_wmcs/licensing|One of the following, depending on whether you are using HTTP or HTTPS from your Exchange server to the RMS connector:<br /><br />http://&lt;connectorName&gt;/_wmcs/licensing<br /><br />https://&lt;connectorName&gt;/_wmcs/licensing|

After you have completed these procedures, be sure to read the **Next steps** section in the [Deploying the Azure Rights Management Connector](../Topic/Deploying_the_Azure_Rights_Management_Connector.md) topic.

### <a name="BKMK_Step8Migration"></a>Step 8. Decommission AD RMS
Optional: Remove the Service Connection Point (SCP) from Active Directory to prevent computers from discovering your on-premises Rights Management infrastructure. This is optional because of the redirection that you configured in the registry (for example, by running the migration script). To remove the Service Connection Point, use the AD SCP Register tool from the [Rights Management Services Administration Toolkit](http://www.microsoft.com/download/details.aspx?id=1479).

Monitor your AD RMS servers for activity, for example, by checking the [requests in the System Health report](https://technet.microsoft.com/library/ee221012%28v=ws.10%29.aspx), the [ServiceRequest table](http://technet.microsoft.com/library/dd772686%28v=ws.10%29.aspx) or [auditing of user access to protected content](http://social.technet.microsoft.com/wiki/contents/articles/3440.ad-rms-frequently-asked-questions-faq.aspx). When you have confirmed that RMS clients are no longer communicating with these servers and that clients are successfully using Azure RMS, you can remove the AD RMS server role from these server. If you’re using dedicated servers, you might prefer the cautionary step of first shutting down the servers for a period of time to make sure that there are no reported problems that might require restarting these servers to ensure service continuity while you investigate why clients are not using Azure RMS.

After decommissioning your AD RMS servers, you might want to take the opportunity to review your templates in the Azure classic portal and consolidate them so that users have fewer to choose between, or reconfigure them, or even add new templates. This would be also a good time to publish the default templates. For more information, see [Configuring Custom Templates for Azure Rights Management](../Topic/Configuring_Custom_Templates_for_Azure_Rights_Management.md).

### <a name="BKMK_Step9Migration"></a>Step 9. Re-key your Azure RMS tenant key
This step is required when migration is complete if your AD RMS deployment was using RMS Cryptographic Mode 1, because re-keying creates a new tenant key that uses RMS Cryptographic Mode 2. Using Azure RMS with Cryptographic Mode 1 is supported only during the migration process.

This step is optional but recommended when migration is complete even if you were running in RMS Cryptographic Mode 2, because it helps to secure your Azure RMS tenant key from potential security breaches to your AD RMS key. When you re-key your Azure RMS tenant key (also known as “rolling your key”), a new key is created and the original key is archived. However, because moving from one key to another doesn’t happen immediately but over a few weeks, do not wait until you suspect a breach to your original key but re-key your RMS tenant key as soon as the migration is complete.

To re-key your Azure RMS tenant key:

-   If your RMS tenant key is managed by Microsoft: Call Microsoft Customer Support Services (CSS) and prove that you are the RMS tenant administrator.

-   If your RMS tenant key is managed by you (BYOK): Repeat the BYOK procedure to generate and create a new key over the Internet or in person.

For more information about managing your RMS tenant key, see [Operations for Your Azure Rights Management Tenant Key](../Topic/Operations_for_Your_Azure_Rights_Management_Tenant_Key.md).

## See Also
[Configuring Azure Rights Management](../Topic/Configuring_Azure_Rights_Management.md)

