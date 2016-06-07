---
# required metadata

title: Configuring usage rights for Azure Rights Management | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 06/03/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 97ddde38-b91b-42a5-8eb4-3ce6ce15393d

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Configuring usage rights for Azure Rights Management

*Applies to: Azure Rights Management, Office 365*

When you set protection on files or emails by using Azure Rights Management (Azure RMS) and you do not use a template, you must configure the usage rights yourself. In addition, when you configure custom templates for Azure RMS, you select the usage rights that will then be automatically applied when the template is selected by users, administrators, or configured services. For example, in the Azure  classic portal you can select roles that configure a logical grouping of usage rights, or you can configure the individual rights.

Use this article to help you configure the usage rights you want for the application you’re using and understand how these rights are interpreted by applications.

## Usage rights and descriptions
The following sections list and describes the usage rights that Rights Management supports, and how they are used and interpreted. They are listed by the **Common name**, which is typically how you might see the usage right displayed or referenced, as a more friendly version of the single-word value that is used in the code (the **Encoding in policy** value). The **API Constant or Value** is the SDK name for an MSIPC API call, used when you write an RMS-enlightened application that checks for a usage right, or adds a usage right to a policy.


### Edit Content, Edit

Allows the user to modify, rearrange, format or filter the content inside the application. It does not grant the right to save the edited copy.

**Encoding in policy**: DOCEDIT

**Implementation in Office custom rights**: As part of the *Change* and *Full Control* options.

**Name in the Azure classic portal**: *Edit Content*

**Name in AD RMS templates**: *Edit*

**API constant or value**: *Not applicable*

---

### Save

Allows the user to save the document in its current location.

**Encoding in policy**: EDIT

**Implementation in Office custom rights**: As part of the *Change* and *Full Control* options.

**Name in the Azure classic portal**: *Save File*

**Name in AD RMS templates**: *Save*

**API constant or value**: IPC_GENERIC_WRITEL"EDIT"

In Office applications, this right also allows the user to modify the document.

---

### Comment

Enables the option to add annotations or comments to the content.

**Encoding in policy**: COMMENT

**Implementation in Office custom rights**: Not implemented.

**Name in the Azure classic portal**: Not implemented.

**Name in AD RMS templates:** Not implemented.

**API constant or value:** IPC_GENERIC_COMMENTL"COMMENT

This right is available in the SDK, is available as an ad-hoc policy in the RMS Protection module for Windows PowerShell, and has been implemented in some software vendor applications. However, it is not widely used and is not currently supported by Office applications.

---

### Save As, Export

Enables the option to save the content to a different file name (Save As). For Office documents, the file can be saved without protection.

**Encoding in policy:** EXPORT

**Implementation in Office custom rights:** As part of the *Change* and *Full Control* options.

**Name in the Azure classic portal:** *Export Content (Save As)*

**Name in AD RMS templates:** *Export (Save As)*

**API constant or value:** IPC_GENERIC_EXPORTL"EXPORT"

This right also allows the user to perform other export options in applications, such as *Send to OneNote*.

---

### Forward

Enables the option to forward an email message and to add recipients to the *To* and *Cc* lines. This right does not apply to documents; only email messages.

**Encoding in policy:** FORWARD

**Implementation in Office custom rights:** Denied when using the *Do Not Forward* standard policy.

**Name in the Azure classic portal:** *Forward*

**Name in AD RMS templates:** *Forward*

**API constant or value:** IPC_EMAIL_FORWARDL"FORWARD"

Does not allow the forwarder to grant rights to other users as part of the forward action.

---

### Full Control

Grants all rights to the document and all available actions can be performed.

**Encoding in policy:** OWNER

**Implementation in Office custom rights:** As the *Full Control* custom option.

**Name in the Azure classic portal:** *Full Control*

**Name in AD RMS templates:** *Full Control*

**API constant or value:** IPC_GENERIC_ALLL"OWNER"

Includes the ability to remove protection.

---

### Print

Enables the options to print the content.

**Encoding in policy:** PRINT

**Implementation in Office custom rights:** As the *Print Content* option in custom permissions. Not a per-recipient setting.

**Name in the Azure classic portal:** *Print*

**Name in AD RMS templates:** *Print*

**API constant or value:** IPC_GENERIC_PRINTL"PRINT

---

### Reply

Enables the Reply option in an email client, without allowing changes in the *To* or *Cc* lines.

**Encoding in policy:** REPLY

**Implementation in Office custom rights:** Not applicable

**Name in the Azure classic portal:** *Reply*

**Name in AD RMS templates:** *Reply*

**API constant or value:** IPC_EMAIL_REPLY

---

### Reply All

Enables the *Reply All* option in an email client, but doesn’t allow the user to add recipients to the *To* or *Cc* lines.

**Encoding in policy:** REPLYALL

**Implementation in Office custom rights:** Not applicable

**Name in the Azure classic portal:** *Reply All*

**Name in AD RMS templates:** *Reply All*

**API constant or value:** IPC_EMAIL_REPLYALLL"REPLYALL"

---

### View, Open, Read

Allows the user to open the document and see the content.

**Encoding in policy:** VIEW

**Implementation in Office custom rights:** As the *Read* custom policy, *View* option.

**Name in the Azure classic portal:** *View Content*

**Name in AD RMS templates:** *View*

**API constant or value:** IPC_GENERIC_READL"VIEW"

---

### Copy

Enables options to copy data (including screen captures) from the document into the same or another document.

**Encoding in policy:** EXTRACT

**Implementation in Office custom rights:** As the *Allow users with Read access to copy content* custom policy option.

**Name in the Azure classic portal:** *Copy and Extract content*

**Name in AD RMS templates:** *Extract*

**API constant or value:** IPC_GENERIC_EXTRACTL"EXTRACT"

In some applications it also allows the whole document to be saved in unprotected form.

---


### Allow Macros

Enables the option to run macros or perform other programmatic or remote access to the content in a document.

**Encoding in policy:** OBJMODEL

**Implementation in Office custom rights:** As the *Allow Programmatic Access* custom policy option. Not a per-recipient setting.

**Name in the Azure classic portal:** *Allow Macros*

**Name in AD RMS templates:** *Allow Macros*

**API constant or value:** Not applicable


## Rights included in permissions levels

Some applications group usage rights together into permissions levels, to make it easier to select usage rights that are typically used together. These permissions levels help to abstract a level of complexity from users, so they can choose options that are role-based.  For example, **Reviewer** and **Co-Author**. Although these options often show users a summary of the rights, they might not include every right that is listed in the previous table.

Use the following table for a list of these permissions levels and a complete list of the rights that they contain.

|Permissions Level|Applications|Rights included (common name)|
|---------------------|----------------|---------------------------------|
|Viewer|Azure classic portal<br /><br />Rights Management sharing application for Windows|View, Open, Read; Reply; Reply All|
|Reviewer|Azure classic portal<br /><br />Rights Management sharing application for Windows|View, Open, Read; Save; Edit Content, Edit; Reply [[1]](#footnote-1); Reply All [[1]](#footnote-1); Forward [[1]](#footnote-1)|
|Co-Author|Azure classic portal<br /><br />Rights Management sharing application for Windows|View, Open, Read; Save; Edit Content, Edit; Copy; View Rights; Change Rights; Allow Macros; Save As, Export; Print; Reply [[1]](#footnote-1); Reply All [[1]](#footnote-1); Forward [[1]](#footnote-1)|
|Co-Owner|Azure classic portal<br /><br />Rights Management sharing application for Windows|View, Open, Read; Save; Edit Content, Edit; Copy; View Rights; Change Rights; Allow Macros; Save As, Export; Print; Reply [[1]](#footnote-1); Reply All [[1]](#footnote-1); Forward [[1]](#footnote-1); Full Control|

----

###### Footnote 1
Not applicable to the Rights Management sharing application for Windows.

## Rights included in the default templates
The rights that are included with the default templates are as follows:

|Display Name|Rights included (common name)|
|----------------|---------------------------------|
|&lt;*organization name*&gt; *- Confidential View Only*|View, Open, Read|
|&lt;*organization name*&gt; *- Confidential*|View, Open, Read; Save; Edit Content, Edit; View Rights; Allow Macros; Forward; Reply; Reply All|

## Do Not Forward option for emails

In addition to the individual usage rights, Office has their own option for emails: **Do Not Forward**. 

Although this option appears to users (and Exchange administrators) as if it's a default template that they can select, **Do Not Forward** is not a template. That explains why you cannot see it in the Azure classic portal when you view and manage templates for Azure RMS. Instead, the **Do Not Forward** options is a set of rights that is dynamically applied by users to their email recipients.

When the **Do Not Forward** option is applied to an email, the recipients cannot forward it, or print it, copy from it, or save attachments or save as a different name. For example, in the Outlook client, the Forward button is not available, the **Save As**, **Save Attachment**, and **Print** menu options are not available, and you cannot add or change recipients in the **To**, **Ccc**, or **Bcc** boxes.

There's an important distinction between applying the **Do Not Forward** option and applying a template that doesn't grant the Forward right to an email: The **Do Not Forward** option uses a dynamic list of authorized users that is based on the user's chosen recipients of the original email; whereas the rights in the template have a static list of authorized users that the administrator has previously specified. What's the difference? Let's take an example: 

A user wants to email some information to specific people in the Marketing department that shouldn't be shared with anybody else. Should she protect the email with a template that restricts rights (viewing, replying, and saving) to the Marketing department?  Or should she choose the **Do Not Forward** option? Both choices would result in the recipients not able to forward the email. 

- If she applied the template, the recipients could still share the information with others in the marketing department. For example, a recipient could use Explorer to drag and drop the email to a shared location or a USB drive. Now, anybody from the marketing department (and the email owner) who has access to this location can view the information in the email.
 
- If she applied the **Do Not Forward** option, the recipients will not be able to share the information with anybody else in the marketing department by moving the email to another location. In this scenario, only the original recipients (and the email owner) will be able to view the information in the email.

> [!NOTE] 
> Use **Do Not Forward** when it's important that only the recipients that the sender chooses should see the information in the email. Use a template for emails to restrict rights to a group of people that the administrator specifies in advance, independently from the sender's chosen recipients.




## See Also
[Configuring custom templates for Azure Rights Management](configure-custom-templates.md)

