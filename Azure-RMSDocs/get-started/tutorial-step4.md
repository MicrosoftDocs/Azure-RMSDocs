---
# required metadata

title: Azure RMS quick start tutorial - Step 4 | Azure RMS
description: The fourth step of a tutorial to quickly try out Microsoft Azure Rights Management for your organization with just 5 steps that should take you less than 15 minutes.
keywords:
author: cabailey
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: f8340056-87a1-4daa-8b63-3d95fc381b9c

# optional metadata

ROBOTS: 
audience:
ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
ms.tgt_pltfrm:
ms.technology:
ms.custom:

---


# Azure RMS quick start Step 4: Ask your recipients to open the emailed document

Jump to: 
> [!div class="op_single_selector"]
- [Introduction](quick-start-tutorial.md)
- [Step 1: Activate Azure RMS](tutorial-step1.md)
- [Step 2: Install RMS sharing app](tutorial-step2.md)
- [Step 3: Email the confidential doc](tutorial-step3.md)
- [Step 4: Recipient reads the doc](tutorial-step4.md)
- [Step 5: Track your doc](tutorial-step5.md)


![Azure RMS quick start tutorial step 4](../media/AzRMS_QuickStartSteps4.PNG)

Your recipients can use many devices to read the protected document that you sent as an email attachment. The devices include iPads, iPhones, Android tablets and phones, Mac computers, as well as Windows computers.

Ask them to read the email message that you sent. They will see your email message and before that, the following text:

**The sender has protected the attachments with Microsoft RMS. You must** [sign in](http://aka.ms/rms)
      **to open them.**

When they click the link, it takes them to instructions to install the RMS sharing app and if necessary, sign up for a free account. The free account grants them a subscription for RMS for individuals, which ensures that authorized users can always read a protected document, even if their organization does not have Azure RMS. They are then ready to read the protected attachment by using the following instructions.

![Tutorial step 4 screenshots](../media/AzRMS_Tutorial_4_Screenshots.png)

### To view the protected document attachment

1.  Because Azure Rights Management protected a Word document, there are two attachments for the email message. These are actually two versions of the same file but with different file name extensions. Open the version that has the **.ppdf** file name extension (**Confidential.ppdf**).

    If you have a version of [Office on your device that supports Rights Management](https://technet.microsoft.com/library/dn655136.aspx), you can open the other version of the file (**Confidential.docx**), so that it opens in Word.

2.  If you are prompted for your user name and password, enter your user name in the same format as the email address that was used to send you the email and attachment. For example, **janetm@contoso.com** or **p.dover@fabrikam.com**. For your password, type the password that you supplied when you signed up for RMS for individuals. Or, if your organization has Azure RMS, enter your usual work password.

The document opens and you can now read the contents. For example, it might say **If you can read this from your email attachment, the sender has successfully shared a file that was protected with Azure RMS.** Because it’s read-only, you cannot change the contents.

As an optional step, you could ask your recipient to forward the email to other people that you didn’t include in your original email. Even if those other people work for an organization that has Azure Rights Management or they apply for their own RMS for individuals subscription, they won’t be able to open the attachment. When they are promoted for their user name, access to the document will be denied.

Now that the recipient has opened the attachment and optionally, forwarded it to somebody else, expect to get an email notification that reports this activity. But email messages are easy to lose over time, so a better way to track who accessed your document is to use the document tracking site, which is covered in the final step.

|If you want more information|Additional information|
|--------------------------------|--------------------------|
|Full instructions for viewing files that are protected by Azure Rights Management|[View and use files that have been protected by Rights Management](../rms-client/sharing-app-view-use-files.md)|
|About the free subscription, RMS for individuals|[RMS for Individuals and Azure Rights Management](../understand-explore/rms-for-individuals.md)|
|About the two versions of the file that you see attached to the email message|[What’s the .ppdf file that’s automatically created?](../rms-client/sharing-app-dialog-box.md#what-s-the-ppdf-file-that-s-automatically-created-)|


>[!div class="step-by-step"]
[« Step 3](tutorial-step3.md)
[Step 5 »](tutorial-step5.md)