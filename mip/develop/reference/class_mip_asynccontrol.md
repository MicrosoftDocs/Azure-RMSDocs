---
title: class mip::AsyncControl 
description: Documents the mip::asynccontrol class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 02/14/2020
---

# class mip::AsyncControl 
Class used to cancel async operation.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public bool Cancel()  |  Calling cancel will result in a attempt to cancel the task, in case of success the appropriate onFailure callback will be called with mip::OperationCancelledError. This feature is dependent on the task dispatcher delegate (.
  
## Members
  
### Cancel function
Calling cancel will result in a attempt to cancel the task, in case of success the appropriate onFailure callback will be called with mip::OperationCancelledError. This feature is dependent on the task dispatcher delegate (.
  
**See also**: mip::TaskDispatcherDelegate),

  
**Returns**: False if cancel signal cannot be dispatched, true otherwise.
Do not hold a strong reference to an AsyncControl object in a task completion block.