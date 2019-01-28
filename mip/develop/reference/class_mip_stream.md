---
title: class mip::Stream 
description: Documents the mip::stream class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/28/2019
---

# class mip::Stream 
A class that defines the interface between the MIP SDK and stream-based content.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public int64_t Read(uint8_t* buffer, int64_t bufferLength)  |  Read into a buffer from the stream.
public int64_t Write(const uint8_t* buffer, int64_t bufferLength)  |  Write into the stream from a buffer.
public bool Flush()  |  flush the stream.
public void Seek(int64_t position)  |  Seek specific position within the stream.
public bool CanRead() const  |  A check if stream can be read from.
public bool CanWrite() const  |  A check if stream can be written to.
public int64_t Position()  |  Get the current position within the stream.
public int64_t Size()  |  Get the size of the content within the stream.
public void Size(int64_t value)  |  Set the stream size.
  
## Members
  
### Read function
Read into a buffer from the stream.

Parameters:  
* **buffer**: pointer to a buffer 


* **bufferLength**: buffer size. 



  
**Returns**: Number of bytes read.
  
### Write function
Write into the stream from a buffer.

Parameters:  
* **buffer**: pointer to a buffer 


* **bufferLength**: buffer size. 



  
**Returns**: Number of bytes written.
  
### Flush function
flush the stream.

  
**Returns**: True if successful else false.
  
### Seek function
Seek specific position within the stream.

Parameters:  
* **position**: to seek into stream.


  
### CanRead function
A check if stream can be read from.

  
**Returns**: True if readable else false.
  
### CanWrite function
A check if stream can be written to.

  
**Returns**: True if writeable else false.
  
### Position function
Get the current position within the stream.

  
**Returns**: Position within the stream.
  
### Size function
Get the size of the content within the stream.

  
**Returns**: The stream size.
  
### Size function
Set the stream size.

Parameters:  
* **stream**: size.

