---
title: class TaskDispatcherDelegate 
description: Documents the taskdispatcherdelegate::undefined class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 11/15/2021
---

# class TaskDispatcherDelegate 
A class that defines the interface to the MIP SDK task dispatcher.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public void DispatchTask(const std::string& taskId, std::function\<void()\> task)  |  Execute a task on a background thread.
public virtual void DispatchTask(const std::string& taskId, std::function\<void()\> task, const std::shared_ptr\<void\> &)  |  Execute a task on a background thread.
public void DispatchTask(const std::string& taskId, std::function\<void()\> task, int64_t delaySeconds)  |  Execute a task on a background thread with the given delay.
public virtual void DispatchTask(const std::string& taskId, std::function\<void()\> task, int64_t delaySeconds, const std::shared_ptr\<void\> &)  |  Execute a task on a background thread with the given delay.
public void ExecuteTaskOnIndependentThread(const std::string& taskId, std::function\<void()\> task)  |  Immediately execute a task on an independent thread.
public virtual void ExecuteTaskOnIndependentThread(const std::string& taskId, std::function\<void()\> task, const std::shared_ptr\<void\> &)  |  Immediately execute a task on an independent thread.
public bool CancelTask(const std::string& taskId)  |  Cancel a background task.
public virtual bool CancelTask(const std::string& taskId, const std::shared_ptr\<void\> &)  |  Cancel a background task.
public void CancelAllTasks()  |  Cancel all background tasks.
  
## Members
  
### DispatchTask function
Execute a task on a background thread.

Parameters:  
* **taskId**: ID to uniquely identify a task 


* **task**: Function to be executed


  
### DispatchTask function
Execute a task on a background thread.

Parameters:  
* **taskId**: ID to uniquely identify a task 


* **task**: Function to be executed 


* **loggerContext**: logger context that should be used with the logger delegate before the task is run


  
### DispatchTask function
Execute a task on a background thread with the given delay.

Parameters:  
* **taskId**: ID to uniquely identify a task 


* **task**: Function to be executed 


* **delaySeconds**: Delay (in seconds) before executing task


  
### DispatchTask function
Execute a task on a background thread with the given delay.

Parameters:  
* **taskId**: ID to uniquely identify a task 


* **task**: Function to be executed 


* **delaySeconds**: Delay (in seconds) before executing task 


* **loggerContext**: logger context that should be used with the logger delegate before the task is run


  
### ExecuteTaskOnIndependentThread function
Immediately execute a task on an independent thread.

Parameters:  
* **taskId**: ID to uniquely identify a task 


* **task**: Function to be executed


  
### ExecuteTaskOnIndependentThread function
Immediately execute a task on an independent thread.

Parameters:  
* **taskId**: ID to uniquely identify a task 


* **task**: Function to be executed 


* **loggerContext**: logger context that should be used with the logger delegate before the task is run


  
### CancelTask function
Cancel a background task.

Parameters:  
* **taskId**: ID of task to cancel



  
**Returns**: True if task was successfully cancelled, else false
  
### CancelTask function
Cancel a background task.

Parameters:  
* **taskId**: ID of task to cancel 


* **loggerContext**: logger context that should be used with the logger delegate for cancelation logging



  
**Returns**: True if task was successfully cancelled, else false
  
### CancelAllTasks function
Cancel all background tasks.