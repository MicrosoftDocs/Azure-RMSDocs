---
# required metadata

title: Adding an automatic labeling rule | Azure Rights Management
description: [PROVIDE A DESCRIPTION]
author: cabailey
manager: mbaldwin
ms.date: 07/15/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 7391b61c-6ac5-4563-8fa9-b856425df875

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Task: Adding an automatic labeling rule

>[!div class="step-by-step"]
[Prev task: Adding a default label and downgrade justification](task-add-default-label-downgrade-justification.md)
[Next task: Adding protection to a label](task-add-protection-label.md)

In this task, you will configure a rule that automatically applies the label Confidential when credit card information is detected in the document. 

To configure the condition:
1. In the Label screen, click `Add a new condition`.
2. In the `Condition` screen on the right, leave the default `Built-in` condition type on, and select the Credit card number condition from the list. 
3. In the `minimum number of occurrences` field, enter "1".
4. In the Label screen, set the `Select how label is applied` to "Automatic". 
5. Click `Add policy tip` and enter the message: "This file contains credit card information therefore it was automatically labeled Confidential".
6. Click `Save` and `Publish`. 

The user sees: 
1. Open a document in Office Word, Excel, or PowerPoint. 
2. Enter the phrase “Credit card” AND a valid credit card number in the following format: 16 digits, either formatted (dddd-dddd-dddd-dddd) or unformatted (dddddddddddddddd). Valid card numbers include all major brands worldwide, including Visa, MasterCard, Discover Card, American Express and Diners.
3. Save the document. When opened, the label will appear automatically and a message will be displayed in the Information bar. 

![An excel spreadhseet with an automatic label applied](azip-automatic-label.png)


> [!div class="button"]
[Next: Adding protection to a label](task-add-protection-label.md)