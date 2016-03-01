---
title: Quick start tutorial for Azure Rights Management
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 1db923bf-7d19-4fdd-a413-bfeb58af5e03
author: Cabailey
---

# Azure RMS Quickstart Step 2: Install the Rights Management sharing application

![](../media/AzRMS_QuickStartSteps2.PNG)

The Rights Management sharing application (also known as the “RMS sharing app”) isn’t a requirement for Azure Rights Management, but we recommend it for all computers and mobile devices that support Azure Rights Management. The RMS sharing application integrates with Office applications by installing an Office add-in so that users can easily protect files directly from the ribbon. It also makes it possible to protect all files types by applying generic protection for files that are not natively supported by Azure Rights Management, and a document tracking site for users to track and revoke files that they have protected. We’ll be using the document tracking site later in this tutorial.

This application is free to download and offers a scripted install for production environments. But for this tutorial, we’ll install it locally.

![](../media/AzRMS_Tutorial_2_Screenshots.png)

#### To download and install the Rights Management sharing application

1.  Go to the [Microsoft Rights Management](http://go.microsoft.com/fwlink/?LinkId=303970) page on the Microsoft website.

2.  In the **Computers** section, click the icon for the **RMS app for Windows** and save the **Setup.exe** file to install the Microsoft Rights Management sharing application.

3.  For a local install, you must use an administrator account to run the Setup.exe file that was downloaded. If you are prompted to continue, click **Yes**.

4.  On the **Setup Microsoft RMS** page, click **Next**, and wait for the installation to finish.

5.  When the installation finishes, click **Restart** if prompted to restart your computer, or click  **Close** to complete the installation.

You’re now ready to start protecting files that contain information that you want to share but only with the people that you specify.

|If you want more information|Additional information|
|--------------------------------|--------------------------|
|About a local installation of the Rights Management sharing application for Windows and user instructions   →|[Rights Management sharing application user guide](http://technet.microsoft.com/library/dn339006.aspx)|
|About the scripted installation of the Rights Management sharing application for Windows and more technical information   →|[Rights Management sharing application administrator guide](http://technet.microsoft.com/library/dn339003.aspx)|
|To understand the difference between native protection and generic protection   →|[What’s the difference between generic protection and built-in (native) protection?](https://technet.microsoft.com/library/dn574738.aspx)|

>[!div class="step-by-step"]
[Pre](rms-quickstart-step1.md)
[Next](rms-quickstart-step3.md)