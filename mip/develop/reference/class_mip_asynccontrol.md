---
title: class AsyncControl 
description: Documents the asynccontrol::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/15/2021
---

# class AsyncControl 
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
Do not hold a strong reference to an AsyncControl object in a task completion block.k.