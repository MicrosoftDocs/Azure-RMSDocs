---
title: Download and install the Rights Management sharing application
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 2bf09690-9dba-43b7-9e0a-0110915d4081
author: Cabailey
---
# Download and install the Rights Management sharing application
You do not have to be a local administrator to install the RMS sharing application. However, if you are not and you use Office 2010, there are some limitations. For more information, see the [If you are not a local administrator and use Office 2010](#BKMK_SetupOffice2010) section in this topic.

### To download and install the Rights Management sharing application

1.  Go to the [Microsoft Rights Management](http://go.microsoft.com/fwlink/?LinkId=303970) page on the Microsoft website.

2.  In the **Computers** section, click the icon for the **RMS app for Windows** and save the **Setup.exe** file to install Microsoft Rights Management sharing application.

3.  Double-click the Setup.exe file that was downloaded. If you are prompted to continue, click **Yes**.

4.  On the **Setup Microsoft RMS** page, click **Next**, and wait for the installation to finish.

    > [!NOTE]
    > The RMS sharing application requires the Microsoft .NET Framework, minimum version 4.0. Setup checks to see whether this is installed and if it is not, you will see a message with a link to install it.

5.  When the installation finishes, click **Restart** to restart your computer and complete the installation. Or, click **Close** and restart your computer later to complete the installation.

You’re now ready to start protecting your files or read files that others have protected.

## <a name="BKMK_SetupOffice2010"></a>If you are not a local administrator and use Office 2010
If you sign in to your computer and do not have local administrative rights, and Setup detects that you have Office 2010 installed, you will see a warning message that some scenarios will not work with this configuration. The scenarios are:

-   If your organization uses Azure RMS rather than an on-premises version of RMS:

    -   The Information Rights Management (IRM) features of Office will not be available. For example, the **Do Not Forward** option for emails, and the **Restrict Access** permissions that you can set from the **File** menu in Word and Excel. You can use the Share Protected option on the ribbon, and the right-click options from File Explorer.

-   If your organization uses an on-premises version of RMS rather than Azure RMS:

    -   You won’t be able to read a protected document sent to you by somebody from another organization that’s using Azure RMS.

If you are not a local administrator and use Office 365 or Office 2013, you do not see this message and these scenarios are supported.

You can continue the installation with these known limitations. Or you can stop the installation and either rerun it with the **Run as administrator** option when you run Setup.exe in step 3, or ask an administrator to install it for you. Administrators can [script this installation](https://technet.microsoft.com/library/dn339003.aspx) for you so that it installs automatically.

## Examples and other instructions
For examples for how you might use the Rights Management sharing application, and how-to instructions, see the following sections from the Rights Management sharing application user guide:

-   [Examples for using the RMS sharing application](../Topic/Rights_Management_sharing_application_user_guide.md#BKMK_SharingExamples)

-   [What do you want to do?](../Topic/Rights_Management_sharing_application_user_guide.md#BKMK_SharingInstructions)

## See Also
[Rights Management sharing application user guide](../Topic/Rights_Management_sharing_application_user_guide.md)

