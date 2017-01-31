---
# required metadata

title: Use PowerShell for Active Directory Rights Management Services | Azure Information Protection
description: Information to get started using PowerShell with the Azure Information Protection client when your organization uses Active Directory Rights Management Services (AD RMS)
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 02/08/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: b8974efc-6e9e-42db-9672-bddbd19702a1

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: eymanor
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# How to use the PowerShell commands for the Azure Information Protection client and Active Directory Rights Management Services

>*Applies to: Active Directory Rights Management Services, Azure Information Protection*

Read this information before you start using the PowerShell commands to protect or unprotect files when your organization uses Active Directory Rights Management Services.

The PowerShell cmdlets install with the Azure Information Protection module, **AIP**. For more information, see [Using PowerShell with the Azure Information Protection client](Using PowerShell with the Azure Information Protection client.md)


## Prerequisites

In addition to the prerequisites for installing the AIP module, your account must have Read and Execute permissions to access ServerCertification.asmx:

1. Log on to an AD RMS server.

2. Click **Start**, and then click **Computer**.

3. In File Explorer, navigate to %systemdrive%\Initpub\wwwroot\_wmsc\Certification.

4. Right-click **ServerCertification.asmx**, then click **Properties**.

5. In the **ServerCertification.asmx Properties** dialog box, click the **Security** tab. 

6. Click the **Continue** button or the **Edit** button. 

7. In the **Permissions for ServerCertification.asmx** dialog box, click **Add**. 

8. Add your account name. If other AD RMS administrators will also use these cmdlets to protect and unprotect files, add their names as well.

9. In the **Allow** column, make sure that the **Read and Execute**, and the **Read** checkboxes are selected.

10.Click **OK** twice.

## Example scenarios for using the cmdlets for Active Directory Rights Management Services

A typical scenario for these cmdlets is to protect all files in a folder by using a rights policy template, or to unprotect a file. 

First, if you have more than one deployment of AD RMS, you will need the names of your AD RMS servers, which you do by using the Get-RMSServer cmdlet to display a list of available servers:

	Get-RMSServer

Your output might look similar to the following:

**Number of RMS Servers that can provide templates: 2** 
**ConnectionInfo             DisplayName          AllowFromScratch**
**--------------             -------------        ----------------**
**Microsoft.InformationAnd…  RmsContoso                       True**
**Microsoft.InformationAnd…  RmsFabrikam                      True**

Before you can protect files, you need to get a list of RMS templates to identify which one to use and its corresponding ID number. Only when you have more than one AD RMS deployment will you need to specify the  RMS server as well. 

From the output, you can then copy the template ID:

	Get-RMSTemplate -RMSServer RmsContoso

Your output might look similar to the following:

**TemplateId        : {82bf3474-6efe-4fa1-8827-d1bd93339119}**
**CultureInfo       : en-US**
**Description       : This content is proprietary information intended for internal users only. This content cannot be modified.**
**Name              : Contoso, Ltd - Confidential View Only**
**IssuerDisplayName : Contoso, Ltd**
**FromTemplate      : True**


**TemplateId        : {e6ee2481-26b9-45e5-b34a-f744eacd53b0}**
**CultureInfo       : en-US**
**Description       : This content is proprietary information intended for internal users only. This content can be modified but cannot be copied and printed.**
**Name              : Contoso, Ltd - Confidential**
**IssuerDisplayName : Contoso, Ltd**
**FromTemplate      : True**
**FromTemplate      : True**

Now you know the template ID, you can use it with the Protect-RMSFile cmdlet to protect a single file or all files in a folder. For example, if you want to protect a single file only and replace the original, by using the "Contoso, Ltd - Confidential" template:

	Protect-RMSFile -File C:\Test.docx -InPlace -TemplateId e6ee2481-26b9-45e5-b34a-f744eacd53b0

Your output might look similar to the following:

**InputFile             EncryptedFile**
**---------             -------------**
**C:\Test.docx          C:\Test.docx**   

To protect all files in a folder, use the -Folder parameter with a drive letter and path, or UNC path. For example:

	Protect-RMSFile -Folder \\Server1\Documents -InPlace -TemplateId e6ee2481-26b9-45e5-b34a-f744eacd53b0

And your output might look similar to the following:

**InputFile                          EncryptedFile**
**---------                          -------------**
**\\Server1\Documents\Test1.docx     \\Server1\Documents\Test1.docx**   
**\\Server1\Documents\Test2.docx     \\Server1\Documents\Test2.docx**   
**\\Server1\Documents\Test3.docx     \\Server1\Documents\Test3.docx**   
**\\Server1\Documents\Test4.docx     \\Server1\Documents\Test4.docx**   

When the file name extension does not change after RMS protection is applied, you can always use the Get-RMSFileStatus cmdlet later to check whether the file is protected. For example: 

	Get-RMSFileStatus -File \\Server1\Documents\Test1.docx

And your output might look similar to the following:

**FileName                              Status**
**--------                              ------**
**\\Server1\Documents\Test1.docx         Protected**

To unprotect a file, you must have Owner or Extract rights from when the  file was protected, or be super user for AD RMS. Then, use the Unprotect cmdlet. For example:

	Unprotect-RMSFile C:\test.docx -InPlace

And your output might look similar to the following:

**InputFile                             DecryptedFile**
**---------                             -------------**
**C:\Test.docx                          C:\Test.docx**


## Next steps

For more information about any of the cmdlets in this module, use the Get-Help <cmdlet name> cmdlet, where <cmdlet name> is the name of the cmdlet
that you want to research. For example: 

	Get-Help Get-RMSTemplate

Not all the cmdlets are applicable for AD RMS. The applicable cmdlets are the following:


- [Get-RMSFileStatus](/powershell/rmsprotection/vlatest/Get-RMSFileStatus)

- [Get-RMSServer](/powershell/rmsprotection/vlatest/Get-RMSServer)

- [Get-RMSTemplate](/powershell/rmsprotection/vlatest/Get-RMSTemplate)

- [New-RMSProtectionLicense](/rmsprotection/aadrm/vlatest/New-RMSProtectionLicense)

- [Protect-RMSFile](/powershell/rmsprotection/vlatest/Protect-RMSFile)

- [Unprotect-RMSFile](/powershell/rmsprotection/vlatest/Unprotect-RMSFile)

