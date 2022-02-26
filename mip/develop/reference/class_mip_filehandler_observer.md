---
title: class FileHandler::Observer 
description: Documents the filehandler::observer class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/15/2021
---

# class FileHandler::Observer 
Observer interface for clients to get notifications events related to file handler.
All errors inherit from mip::Error. 
Client should not call the engine back on the thread that calls the observer.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public virtual void OnCreateFileHandlerSuccess(const std::shared_ptr\<FileHandler\>& fileHandler, const std::shared_ptr\<void\>& context)  |  Called when the handler is created successfully.
public virtual void OnCreateFileHandlerFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when creating the handler failed.
public virtual void OnClassifySuccess(const std::vector\<std::shared_ptr\<Action\>\>& actions, const std::shared_ptr\<void\>& context)  |  Called when classify success.
public virtual void OnClassifyFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when classify failed.
public virtual void OnGetDecryptedTemporaryFileSuccess(const std::string& decryptedFilePath, const std::shared_ptr\<void\>& context)  |  Called when getting the decrypted temporary file success.
public virtual void OnGetDecryptedTemporaryFileFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when getting the decrypted temporary file failed.
public virtual void OnGetDecryptedTemporaryStreamSuccess(const std::shared_ptr\<Stream\>& decryptedStream, const std::shared_ptr\<void\>& context)  |  Called when getting the decrypted temporary stream success.
public virtual void OnGetDecryptedTemporaryStreamFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when getting the decrypted temporary stream failed.
public virtual void OnCommitSuccess(bool committed, const std::shared_ptr\<void\>& context)  |  Called when committing the changes to the file were successful.
public virtual void OnCommitFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when committing the changes to the file failed.
public virtual void OnInspectSuccess(const std::shared_ptr\<FileInspector\>& fileInspector, const std::shared_ptr\<void\>& context)  |  Called when inspect success.
public virtual void OnInspectFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when inspect failed.
  
## Members
  
### OnCreateFileHandlerSuccess function
Called when the handler is created successfully.
  
### OnCreateFileHandlerFailure function
Called when creating the handler failed.
  
### OnClassifySuccess function
Called when classify success.
  
### OnClassifyFailure function
Called when classify failed.
  
### OnGetDecryptedTemporaryFileSuccess function
Called when getting the decrypted temporary file success.
  
### OnGetDecryptedTemporaryFileFailure function
Called when getting the decrypted temporary file failed.
  
### OnGetDecryptedTemporaryStreamSuccess function
Called when getting the decrypted temporary stream success.
  
### OnGetDecryptedTemporaryStreamFailure function
Called when getting the decrypted temporary stream failed.
  
### OnCommitSuccess function
Called when committing the changes to the file were successful.
  
### OnCommitFailure function
Called when committing the changes to the file failed.
  
### OnInspectSuccess function
Called when inspect success.
  
### OnInspectFailure function
Called when inspect failed.d.