---
title: class mip::TaskDispatcherDelegate 
description: Documents the mip::taskdispatcherdelegate class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 07/16/2019
---

# class mip::TaskDispatcherDelegate 
A class that defines the interface to the MIP SDK task dispatcher.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public void DispatchTask(const std::string& taskId, std::function\<void()\> task)  |  Execute a task on a background thread.
public void DispatchTask(const std::string& taskId, std::function\<void()\> task, int64_t delay)  |  Execute a task on a background thread with the given delay.
public void ExecuteTaskOnIndependentThread(const std::string& taskId, std::function\<void()\> task)  |  Immediately execute a task on an independent thread.
public bool CancelTask(const std::string& taskId)  |  Cancel a background task.
public void CancelAllTasks()  |  Cancel all background tasks.
  
## Members
  
### DispatchTask function
Execute a task on a background thread.

Parameters:  
* **taskId**: ID to uniquely identify a task 


* **task**: Function to be executed


  
### DispatchTask function
Execute a task on a background thread with the given delay.

Parameters:  
* **taskId**: ID to uniquely identify a task 


* **task**: Function to be executed 


* **delay**: Delay (in seconds) before executing task


  
### ExecuteTaskOnIndependentThread function
Immediately execute a task on an independent thread.

Parameters:  
* **taskId**: ID to uniquely identify a task 


* **task**: Function to be executed


  
### CancelTask function
Cancel a background task.

Parameters:  
* **taskId**: ID of task to cancel



  
**Returns**: True if task was successfully cancelled, else false
  
### CancelAllTasks function
Cancel all background tasks.