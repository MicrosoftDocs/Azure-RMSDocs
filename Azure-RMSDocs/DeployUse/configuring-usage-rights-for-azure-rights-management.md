---
title: Configuring Usage Rights for Azure Rights Management
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 97ddde38-b91b-42a5-8eb4-3ce6ce15393d
author: Cabailey
---
# Configuring Usage Rights for Azure Rights Management
When you set protection on files or emails by using Azure Rights Management (Azure RMS) and you do not use a template, you must configure the usage rights yourself. In addition, when you configure custom templates for Azure RMS, you select the usage rights that will then be automatically applied when the template is selected by users, administrators, or configured services. For example, in the Azure  classic portal you can select roles that configure a logical grouping of usage rights, or you can configure the individual rights.

Use this article to help you configure the usage rights you want for the application you’re using and understand how these rights are interpreted by applications.

## Usage Rights and Descriptions
The following sections list and describes the usage rights that Rights Management supports, and how they are used and interpreted. In these sections, the **Common name** is typically how you might see the usage right displayed or referenced, as a more friendly version of the single-word value that is used in the code (the **Encoding in policy** value). The **API Constant or Value** is the SDK name for an MSIPC API call, used when you write an RMS-enlightened application that checks for a usage right, or adds a usage right to a policy.

### Common name: Edit Content, Edit

**Encoding in policy:**

- DOCEDIT

**Description:**

- Allows the user to modify, rearrange, format or filter the content inside the application. It does not grant the right to save the edited copy.

**Implementation in Office custom rights:**

- As part of the **Change** and **Full Control** options.

**Name in the Azure classic portal:**

- **Edit Content**

**Name in AD RMS templates:**

- **Edit**

**API constant or value:**

- Not applicable

**Additional information:**

- In Office applications, this right also allows the user to save the document.

___

### Common name: Save

**Encoding in policy:**

- EDIT

**Description:**

- Allows the user to save the document in its current location.

**Implementation in Office custom rights:**

- As part of the **Change** and **Full Control** options.

**Name in the Azure classic portal:**

- **Save File**

**Name in AD RMS templates:**

- Save

**API constant or value:**

- IPC_GENERIC_WRITEL"EDIT"

**Additional information:**

- In Office applications, this right also allows the user to modify the document.

___

### Common name: Comment

**Encoding in policy:**

- COMMENT

**Description:**

- Enables the option to add annotations or comments to the content.

**Implementation in Office custom rights:**

- Not implemented.

**Name in the Azure classic portal:**

- Not implemented.

**Name in AD RMS templates:**

- Not implemented.

**API constant or value:**

- IPC_GENERIC_COMMENTL"COMMENT

**Additional information:**

- This right is available in the SDK, is available as an ad-hoc policy in the RMS Protection module for Windows PowerShell, and has been implemented in some software vendor applications. However, it is not widely used and is not currently supported by Office applications.

___

### Common name: Save As, Export

**Encoding in policy:**

- EXPORT

**Description:**

- Enables the option to save the content to a different file name (Save As). Depending on the application, the file might be saved without protection.

**Implementation in Office custom rights:**

- As part of the **Change** and **Full Control** options.

**Name in the Azure classic portal:**

- **Export Content (Save As)**

**Name in AD RMS templates:**

- **Export (Save As)**

**API constant or value:**

- IPC_GENERIC_EXPORTL"EXPORT"

**Additional information:**

- This right also allows the user to perform other export options in applications, such as **Send to OneNote**.

___

### Common name: Forward

**Encoding in policy:**

- FORWARD

**Description:**

- Enables the option to forward an email message and to add recipients to the **To** and **Cc** lines.

**Implementation in Office custom rights:**

- Denied when using the **Do Not Forward** standard policy.

**Name in the Azure classic portal:**

- **Forward**

**Name in AD RMS templates:**

- **Forward**

**API constant or value:**

- IPC_EMAIL_FORWARDL"FORWARD"

**Additional information:**

- Does not allow the forwarder to grant rights to other users as part of the forward action.

___

### Common name: Full Control

**Encoding in policy:**

- OWNER

**Description:**

- Grants all rights to the document and all available actions can be performed.

**Implementation in Office custom rights:**

- As the **Full Control** custom option.

**Name in the Azure classic portal:**

- **Full Control**

**Name in AD RMS templates:**

- **Full Control**

**API constant or value:**

- IPC_GENERIC_ALLL"OWNER"

**Additional information:**

- Includes the ability to remove protection.

___

### Common name: Print

**Encoding in policy:**

- PRINT

**Description:**

- Enables the options to print the content.

**Implementation in Office custom rights:**

- As the **Print Content** option in custom permissions. Not a per-recipient setting.

**Name in the Azure classic portal:**

- **Print**

**Name in AD RMS templates:**

- **Print**

**API constant or value:**

- IPC_GENERIC_PRINTL"PRINT

___

### Common name: Reply

**Encoding in policy:**

- REPLY

**Description:**

- Enables the Reply option in an email client, without allowing changes in the **To** or **Cc** lines.

**Implementation in Office custom rights:**

- Not applicable

**Name in the Azure classic portal:**

- **Reply**

**Name in AD RMS templates:**

- **Reply**

**API constant or value:**

- IPC_EMAIL_REPLY

___

### Common name: Reply All

**Encoding in policy:**

- REPLYALL

**Description:**

- Enables the **Reply All** option in an email client, but doesn’t allow the user to add recipients to the **To** or **Cc** lines.

**Implementation in Office custom rights:**

- Not applicable

**Name in the Azure classic portal:**

- **Reply All**

**Name in AD RMS templates:**

- **Reply All**

**API constant or value:**

- IPC_EMAIL_REPLYALLL"REPLYALL"

___

### Common name: View, Open, Read

**Encoding in policy:**

- VIEW

**Description:**

- Allows the user to open the document and see the content.

**Implementation in Office custom rights:**

- As the **Read** custom policy, **View** option.

**Name in the Azure classic portal:**

- **View Content**

**Name in AD RMS templates:**

- **View**

**API constant or value:**

- IPC_GENERIC_READL"VIEW"

___

### Common name: View Rights

**Encoding in policy:**

- VIEWRIGHTSDATA

**Description:**

- Allows the user to see the policy that is applied to the document.

**Implementation in Office custom rights:**

- Not implemented.

**Name in the Azure classic portal:**

- **View Assigned Rights**

**Name in AD RMS templates:**

- **View Rights**

**API constant or value:**

- IPC_READ_RIGHTSL"VIEWRIGHTSDATA"

___

### Common name: View Rights

**Encoding in policy:**

- VIEWRIGHTSDATA

**Description:**

- Allows the user to see the policy that is applied to the document.

**Implementation in Office custom rights:**

- Not implemented.

**Name in the Azure classic portal:**

- **View Assigned Rights**

**Name in AD RMS templates:**

- **View Rights**

**API constant or value:**

- IPC_READ_RIGHTSL"VIEWRIGHTSDATA"

**Additional information:**

- Ignored by some applications.

___

### Common name: Change Rights

**Encoding in policy:**

- EDITRIGHTSDATA

**Description:**

- Allows the user to change the policy that is applied to the document. Includes including removing protection.

**Implementation in Office custom rights:**

- Not implemented.

**Name in the Azure classic portal:**

- **Change Rights**

**Name in AD RMS templates:**

- **Edit Rights**

**API constant or value:**

- IPC_WRITE_RIGHTSL"EDITRIGHTSDATA"

___

### Common name: Allow Macros

**Encoding in policy:**

- OBJMODEL

**Description:**

- Enables the option to run macros or perform other programmatic or remote access to the content in a document.

**Implementation in Office custom rights:**

- As the **Allow Programmatic Access** custom policy option. Not a per-recipient setting.

**Name in the Azure classic portal:**

- **Allow Macros**

**Name in AD RMS templates:**

- **Allow Macros**

**API constant or value:**

- Not applicable

___


|Common name|Encoding in policy|Description|Implementation in Office custom rights|Name in the Azure  classic portal|Name in AD RMS templates|API constant or value|Additional information|
|---------------|----------------------|---------------|------------------------------------------|-------------------------------------|----------------------------|-------------------------|--------------------------|
|Edit Content, Edit|DOCEDIT|Allows the user to modify, rearrange, format or filter the content inside the application. It does not grant the right to save the edited copy.|As part of the **Change** and **Full Control** options.|**Edit Content**|**Edit**|Not applicable|In Office applications, this right also allows the user to save the document.|
|Save|EDIT|Allows the user to save the document in its current location.|As part of the **Change** and **Full Control** options.|**Save File**|**Save**|IPC_GENERIC_WRITEL"EDIT"|In Office applications, this right also allows the user to modify the document.|
|Comment|COMMENT|Enables the option to add annotations or comments to the content.|Not implemented|Not implemented|Not implemented|IPC_GENERIC_COMMENTL"COMMENT"|This right is available in the SDK, is available as an ad-hoc policy in the RMS Protection module for Windows PowerShell, and has been implemented in some software vendor applications. However, it is not widely used and is not currently supported by Office applications.|
|Save As, Export|EXPORT|Enables the option to save the content to a different file name (Save As). Depending on the application, the file might be saved without protection.|As part of the **Change** and **Full Control** options.|**Export Content (Save As)**|**Export (Save As)**|IPC_GENERIC_EXPORTL"EXPORT"|This right also allows the user to perform other export options in applications, such as **Send to OneNote**.|
|Forward|FORWARD|Enables the option to forward an email message and to add recipients to the **To** and **Cc** lines.|Denied when using the **Do Not Forward** standard policy.|**Forward**|**Forward**|IPC_EMAIL_FORWARDL"FORWARD"|Does not allow the forwarder to grant rights to other users as part of the forward action.|
|Full Control|OWNER|Grants all rights to the document and all available actions can be performed.|As the **Full Control** custom option.|**Full Control**|**Full Control**|IPC_GENERIC_ALLL"OWNER"|Includes the ability to remove protection.|
|Print|PRINT|Enables the options to print the content.|As the **Print Content** option in custom permissions. Not a per-recipient setting.|**Print**|**Print**|IPC_GENERIC_PRINTL"PRINT|No additional information|
|Reply|REPLY|Enables the Reply option in an email client, without allowing changes in the **To** or **Cc** lines.|Not applicable|**Reply**|**Reply**|IPC_EMAIL_REPLY|No additional information|
|Reply All|REPLYALL|Enables the **Reply All** option in an email client, but doesn’t allow the user to add recipients to the **To** or **Cc** lines.|Not applicable|**Reply All**|**Reply All**|IPC_EMAIL_REPLYALLL"REPLYALL"|No additional information|
|View, Open, Read|VIEW|Allows the user to open the document and see the content.|As the **Read** custom policy, **View** option.|**View Content**|**View**|IPC_GENERIC_READL"VIEW"|No additional information|
|Copy|EXTRACT|Enables options to copy data (includes screen captures) from the document into the same or another document.|As the **Allow users with Read access to copy content** custom policy option.|**Copy and Extract content**|**Extract**|IPC_GENERIC_EXTRACTL"EXTRACT"|In some applications it also allows the whole document to be saved in unprotected form.|
|View Rights|VIEWRIGHTSDATA|Allows the user to see the policy that is applied to the document.|Not implemented|**View Assigned Rights**|**View Rights**|IPC_READ_RIGHTSL"VIEWRIGHTSDATA"|Ignored by some applications.|
|Change Rights|EDITRIGHTSDATA|Allows the user to change the policy that is applied to the document. Includes including removing protection.|Not implemented|**Change Rights**|**Edit Rights**|IPC_WRITE_RIGHTSL"EDITRIGHTSDATA"|No additional information|
|Allow Macros|OBJMODEL|Enables the option to run macros or perform other programmatic or remote access to the content in a document.|As the **Allow Programmatic Access** custom policy option. Not a per-recipient setting.|**Allow Macros**|**Allow Macros**|Not applicable|No additional information|

## Rights included in permissions  levels
Some applications group usage rights together into permissions levels, to make it easier to select usage rights that are typically used together. These permisisons levels help to abstract a level of complexity from users, so they can choose options that are role-based.  For example, **Reviewer** and **Co-Author**. Although these options often show users a summary of the rights, they might not include every right that is listed in the previous table.

Use the following table for a list of these permissions levels and a complete list of the rights that they contain.

|Permissions Level|Applications|Rights included (common name)|
|---------------------|----------------|---------------------------------|
|Viewer|Azure classic portal<br /><br />Rights Management sharing application for Windows|View, Open, Read<br /><br />Reply<br /><br />Reply All|
|Reviewer|Azure classic portal<br /><br />Rights Management sharing application for Windows|View, Open, Read<br /><br />Save<br /><br />Edit Content, Edit<br /><br />Reply [footnote 1]<br /><br />Reply All [footnote 1]<br /><br />Forward [footnote 1]|
|Co-Author|Azure classic portal<br /><br />Rights Management sharing application for Windows|View, Open, Read<br /><br />Save<br /><br />Edit Content, Edit<br /><br />Copy<br /><br />View Rights<br /><br />Change Rights<br /><br />Allow Macros<br /><br />Save As, Export<br /><br />Print<br /><br />Reply [footnote 1]<br /><br />Reply All [footnote 1]<br /><br />Forward [footnote 1]|
|Co-Owner|Azure classic portal<br /><br />Rights Management sharing application for Windows|View, Open, Read<br /><br />Save<br /><br />Edit Content, Edit<br /><br />Copy<br /><br />View Rights<br /><br />Change Rights<br /><br />Allow Macros<br /><br />Save As, Export<br /><br />Print<br /><br />Reply [footnote 1]<br /><br />Reply All [footnote 1]<br /><br />Forward [footnote 1]<br /><br />Full Control|
Footnote 1: Not applicable to the Rights Management sharing application for Windows

## Rights included in the default templates
The rights that are included with the default templates are as follows:

|Display Name|Rights included (common name)|
|----------------|---------------------------------|
|&lt;organization name&gt; - Confidential View Only|View, Open, Read|
|&lt;organization name&gt; - Confidential|View, Open, Read<br /><br />Save<br /><br />Edit Content, Edit<br /><br />View Rights<br /><br />Allow Macros<br /><br />Forward<br /><br />Reply<br /><br />Reply All|

## See Also
[Configuring Azure Rights Management](configuring-azure-rights-management.md)

