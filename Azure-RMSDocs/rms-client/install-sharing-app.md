---
# required metadata

title: Download & install the RMS sharing app - AIP
description: Instructions to interactively install the RMS sharing application for Windows, so that you can safely share documents with others. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 01/23/2017
ms.topic: conceptual
ms.service: information-protection
ms.assetid: 2bf09690-9dba-43b7-9e0a-0110915d4081

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Download and install the Rights Management sharing application

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 7 with SP1, Windows 8, Windows 8.1*

> [!IMPORTANT]
> **End of support notification**: The Rights Management sharing application for Windows is being replaced by the [Azure Information Protection client](aip-client.md). Support for this older application will stop January 31, 2019.

You do not have to be a local administrator to install the RMS sharing application. However, if you are not and you use Office 2010, there are some limitations. For more information, see the [If you are not a local administrator and use Office 2010](#if-you-are-not-a-local-administrator-and-use-office-2010) section on this page.

## To download and install the Rights Management sharing application

1.  Go to the [Microsoft Rights Management](https://go.microsoft.com/fwlink/?LinkId=303970) page on the Microsoft website.

2.  In the **Computers** section, click the icon for the **RMS app for Windows** and save the **Setup.exe** file to install Microsoft Rights Management sharing application.

3.  Double-click the Setup.exe file that was downloaded. If you are prompted to continue, click **Yes**.

4.  On the **Setup Microsoft RMS** page, click **Next**, and wait for the installation to finish.

    > [!NOTE]
    > The RMS sharing application requires the Microsoft .NET Framework, minimum version 4.0. Setup checks to see whether this is installed and if it is not, you will see a message with a link to install it.

5.  When the installation finishes, click **Restart** to restart your computer and complete the installation. Or, click **Close** and restart your computer later to complete the installation.

You’re now ready to start protecting your files or read files that others have protected.

## If you are not a local administrator and use Office 2010
If you sign in to your computer and do not have local administrative rights, and Setup detects that you have Office 2010 installed, you will see a warning message that some scenarios will not work with this configuration. The scenarios are:

-   If your organization uses the Azure Rights Management service from Azure Information Protection rather than an on-premises version of Rights Management:

    -   The Information Rights Management (IRM) features of Office will not be available. For example, the **Do Not Forward** option for emails, and the **Restrict Access** permissions that you can set from the **File** menu in Word and Excel. You can use the Share Protected option on the ribbon, and the right-click options from File Explorer.

-   If your organization uses an on-premises version of Rights Management rather than the Azure Rights Management service from Azure Information Protection:

    -   You won’t be able to read a protected document sent to you by somebody from another organization that’s using the Azure Rights Management service.

If you are not a local administrator and use Office 365 or Office 2013, you do not see this message and these scenarios are supported.

You can continue the installation with these known limitations. Or you can stop the installation and either rerun it with the **Run as administrator** option when you run Setup.exe in step 3, or ask an administrator to install it for you. Administrators can [script this installation](sharing-app-admin-guide.md#automatic-deployment-for-the-microsoft-rights-management-sharing-application) for you so that it installs automatically.

## Examples and other instructions
For examples for how you might use the Rights Management sharing application, and how-to instructions, see the following sections from the Rights Management sharing application user guide:

-   [Examples for using the RMS sharing application](sharing-app-user-guide.md#examples-for-using-the-rms-sharing-application)

-   [What do you want to do?](sharing-app-user-guide.md#what-do-you-want-to-do)

## See Also
[Rights Management sharing application user guide](sharing-app-user-guide.md)

