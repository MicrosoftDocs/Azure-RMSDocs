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
# Azure RMS Quickstart Step 4: Ask your recipients to open the emailed document

Jump to: 
> [AZURE.SELECTOR]
- [Introduction](rms-quickstart-intro.md)
- [Step 1](rms-quickstart-step1.md)
- [Step 2](rms-quickstart-step2.md)
- [Step 3](rms-quickstart-step3.md)
- [Step 5](rms-quickstart-step5.md)

![](../media/AzRMS_QuickStartSteps4.PNG)

Your recipients can use many devices to read the protected document that you sent as an email attachment. The devices include iPads, iPhones, Android tablets and phones, Mac computers, as well as Windows computers.

Ask them to read the email message that you sent. They will see your email message and before that, the following text:

**The sender has protected the attachments with Microsoft RMS. You must** [sign in](http://aka.ms/rms)
      **to open them.**

When they click the link, it takes them to instructions to install the RMS sharing app and if necessary, sign up for a free account. The free account grants them a subscription for RMS for individuals, which ensures that authorized users can always read a protected document, even if their organization does not have Azure RMS. They are then ready to read the protected attachment by using the following instructions.

![](../media/AzRMS_Tutorial_4_Screenshots.png)

#### To view the protected document attachment

1.  Because Azure Rights Management protected a Word document, there are two attachments for the email message. These are actually two versions of the same file but with different file name extensions. Open the version that has the **.ppdf** file name extension (**Confidential.ppdf**).

    If you have a version of [Office on your device that supports Rights Management](https://technet.microsoft.com/library/dn655136.aspx), you can open the other version of the file (**Confidential.docx**), so that it opens in Word.

2.  If you are prompted for your user name and password, enter your user name in the same format as the email address that was used to send you the email and attachment. For example, **janetm@contoso.com** or **p.dover@fabrikam.com**. For your password, type the password that you supplied when you signed up for RMS for individuals. Or, if your organization has Azure RMS, enter your usual work password.

The document opens and you can now read the contents. For example, it might say **If you can read this from your email attachment, the sender has successfully shared a file that was protected with Azure RMS.** Because it’s read-only, you cannot change the contents.

As an optional step, you could ask your recipient to forward the email to other people that you didn’t include in your original email. Even if those other people work for an organization that has Azure Rights Management or they apply for their own RMS for individuals subscription, they won’t be able to open the attachment. When they are promoted for their user name, access to the document will be denied.

Now that the recipient has opened the attachment and optionally, forwarded it to somebody else, expect to get an email notification that reports this activity. But email messages are easy to lose over time, so a better way to track who accessed your document is to use the document tracking site, which is covered in the final step.

|If you want more information|Additional information|
|--------------------------------|--------------------------|
|Full instructions for viewing files that are protected by Azure Rights Management   →|[View and use files that have been protected by Rights Management](https://technet.microsoft.com/library/dn574741.aspx)|
|About the free subscription, RMS for individuals   →|[RMS for Individuals and Azure Rights Management](rms-for-individuals-and-azure-rights-management.md)|
|About the two versions of the file that you see attached to the email message   →|[What’s the .ppdf file that’s automatically created?](https://technet.microsoft.com/library/dn574738.aspx)|

>[!div class="step-by-step"]
[Step 3](rms-quickstart-step3.md)
[Step 5](rms-quickstart-step5.md)