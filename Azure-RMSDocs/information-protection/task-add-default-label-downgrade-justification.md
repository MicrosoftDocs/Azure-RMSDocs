---
# required metadata

title: Adding a default label and downgrade justification | Azure Rights Management
description: [PROVIDE A DESCRIPTION]
author: cabailey
manager: mbaldwin
ms.date: 07/15/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 2c028389-c165-44ef-8fb8-58a1c65e667e

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Task: Adding a default label and downgrade justification

In this task, you set the default label of every newly created document to "Internal", and ask the user to provide justification when downgrading the label to a less sensitive one.

## To set the Internal label as default and require justification upon downgrade

1. Select the `Internal` label.  
2. Set `All document and emails must have a label` to "On".
3. In the `Select the default label` list, select "Internal".  
4. Set `Users must provide justification when lowering the sensitivity level` to "On". 
5. Click `Save` and `Publish`. 

## The user sees

1. When creating a new document or email, the Internal label will be automatically selected.  
2. To downgrade the label, click the pencil icon, and select Personal. The following message will be displayed: 
  
  ![Downgrade justification dialog box](azip-downgrade-justification.png)
 
  The justification is written into the local computer's event logs. To view the justification, open the event viewer application. The log appears under **Windows logs &rarr; Application &rarr; Microsoft Azure Information Protection**. When selected, the justification text is displayed on the screen. 

>[!div class="step-by-step"]
[Prev task: Adding watermarks to a label](task-add-watermark-label.md)
[Next task: Adding an automatic labeling rule](task-add-automatic-labeling-rule.md)

