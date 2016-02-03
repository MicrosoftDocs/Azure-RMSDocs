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

Use this topic to help you configure the usage rights you want for the application you’re using and understand how these rights are interpreted by applications.

## Usage Rights and Descriptions
The following table lists and describes the usage rights that Rights Management supports, and how they are used and interpreted. In this table, the **Common name** is typically how you might see the usage right displayed or referenced, as a more friendly version of the single-word value that is used in the code (the **Encoding in policy** value). The **API Constant or Value** is the SDK name for an MSIPC API call, used when you write an RMS-enlightened application that checks for a usage right, or adds a usage right to a policy.

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
|Copy|EXTRACT|Enables options to copy data from the document into the same or another document.|As the **Allow users with Read access to copy content** custom policy option.|**Copy and Extract content**|**Extract**|IPC_GENERIC_EXTRACTL"EXTRACT"|In some applications it also allows the whole document to be saved in unprotected form.|
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
[Configuring Azure Rights Management](../Topic/Configuring_Azure_Rights_Management.md)

