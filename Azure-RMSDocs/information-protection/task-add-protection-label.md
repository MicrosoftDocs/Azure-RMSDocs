---
# required metadata

title: Adding protection to a label | Azure Rights Management
description: [PROVIDE A DESCRIPTION]
author: cabailey
manager: mbaldwin
ms.date: 07/15/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: e5a4a242-da71-4ca8-9136-8b4a65f74a73

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Task: Adding protection to a label

>[!div class="step-by-step"]
[Prev task: Adding an automatic labeling rule](task-add-automatic-labeling-rule.md)
[Return to quick start tutorial](api-quickstart-tutorial.md)

In this task, you will configure the label Confidential to add protection of a particular RMS template to every document on which it is applied. 

To add protection to the Confidential label:
1. Select the `Confidential` label. The label editing screen opens on the left.  
2. In the `Set RMS protection for documents and emails containing this label` area, select the relevant RMS template from the list. 
  > [!NOTE]
  > This option will only be available if Azure Rights Management is enabled in your tenant.
3. Click `Save` and `Publish`. 

The user sees: 

When selecting this label, the document will be automatically protected with the selected template.
To see that this template is applied, click **File &rarr; info** and note that the "document protected" section is highlighted and contains the template's name.

You can also save the document and reopen to view the protection information in the information bar.
