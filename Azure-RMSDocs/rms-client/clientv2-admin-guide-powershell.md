---
# required metadata

title: Use PowerShell with the Azure Information Protection unified labeling client
description: Instructions and information for admins to manage the Azure Information Protection unified labeling client by using PowerShell.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 05/18/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---


# Admin Guide: Using PowerShell with the Azure Information Protection unified client

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*
>
> *Instructions for: [Azure Information Protection unified labeling client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-client-and-the-azure-information-protection-unified-labeling-client)*

When you install the Azure Information Protection unified labeling client, PowerShell commands are automatically installed. This lets you manage the client by running commands that you can put into scripts for automation.

The cmdlets are installed with the PowerShell module **AzureInformationProtection**, which has cmdlets for labeling. For example:

|Labeling cmdlet|Example usage|
|----------------|---------------|
|[Get-AIPFileStatus](/powershell/module/azureinformationprotection/get-aipfilestatus)|For a shared folder, identify all files with a specific label.|
|[Set-AIPFileClassification](/powershell/module/azureinformationprotection/set-aipfileclassification)|For a shared folder, inspect the file contents and then automatically label unlabeled files, according to the conditions that you have specified.|
|[Set-AIPFileLabel](/powershell/module/azureinformationprotection/set-aipfilelabel)|For a shared folder, apply a specified label to all files that do not have a label.|
|[Set-AIPAuthentication](/powershell/module/azureinformationprotection/set-aipauthentication)|Label files interactively, by using a different user account to your own.|

> [!TIP]
> To use cmdlets with path lengths greater than 260 characters, use the following [group policy setting](https://blogs.msdn.microsoft.com/jeremykuhne/2016/07/30/net-4-6-2-and-long-paths-on-windows-10/) that is available starting Windows 10, version 1607:<br /> **Local Computer Policy** > **Computer Configuration** > **Administrative Templates** > **All Settings** > **Enable Win32 long paths** 
> 
> For Windows Server 2016, you can use the same group policy setting when you install the latest Administrative Templates (.admx) for Windows 10.
>
> For more information, see the [Maximum Path Length Limitation](https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file#maximum-path-length-limitation) section from the Windows 10 developer documentation.

This module installs in **\ProgramFiles (x86)\Microsoft Azure Information Protection** and adds this folder to the **PSModulePath** system variable. The .dll for this module is named **AIP.dll**.

### Prerequisites for using the AzureInformationProtection module

In addition to the prerequisites for installing the AzureInformationProtection module, there are additional prerequisites for when you use the labeling cmdlets for Azure Information Protection:

1. The Azure Rights Management service must be activated.

2. To remove protection from files for others using your own account: 

    - The super user feature must be enabled for your organization and your account must be configured to be a super user for Azure Rights Management.

#### Prerequisite 1: The Azure Rights Management service must be activated

If your Azure Information Protection tenant is not activated to apply protection, see the instructions for [Activating Azure Rights Management](../activate-service.md).

#### Prerequisite 2: To remove protection from files for others using your own account

Typical scenarios for removing protection from files for others include data discovery or data recovery. If you are using labels to apply the protection, you could remove the protection by setting a new label that doesn't apply protection or by removing the label.

You must have a Rights Management usage right to remove protection from files, or be a super user. For data discovery or data recovery, the super user feature is typically used. To enable this feature and configure your account to be a super user, see [Configuring super users for Azure Rights Management and Discovery Services or Data Recovery](../configure-super-users.md).


## Next steps
For cmdlet help when you are in a PowerShell session, type `Get-Help <cmdlet name> -online`. For example: 

    Get-Help Set-AIPFileLabel -online

See the following for additional information that you might need to support the Azure Information Protection client:

- [Customizations](clientv2-admin-guide-customizations.md)

- [Client files and usage logging](clientv2-admin-guide-files-and-logging.md)

- [File types supported](clientv2-admin-guide-file-types.md)
