# class mip::RMSPFileException 
RMS PFile exception.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public RMSPFileException(const std::string& message, Reason reason)  |  [RMSPFileException](class_mip_rmspfileexception.md) constructor.
 public RMSPFileException(const char*const& message, Reason reason)  |  [RMSPFileException](class_mip_rmspfileexception.md) constructor.
 public virtual Reason reason() const  |  Gets PFile error classification.
 public virtual const char* what() const  |  Gets exception message.
 public virtual ExceptionTypes type() const  |  Gets exception type.
 public virtual int error() const  |  Gets error code.
  
## Members
  
### RMSPFileException
[RMSPFileException](class_mip_rmspfileexception.md) constructor.

Parameters:  
* **message**: Exception message 


* **reason**: PFile error classification


  
### RMSPFileException
[RMSPFileException](class_mip_rmspfileexception.md) constructor.

Parameters:  
* **message**: Exception message 


* **reason**: PFile error classification


  
### Reason
Gets PFile error classification.

  
**Returns**: PFile error classification
  
### what
Gets exception message.

  
**Returns**: Exception message
  
### ExceptionTypes
Gets exception type.

  
**Returns**: Exception type
  
### error
Gets error code.

  
**Returns**: [Error](class_mip_error.md) code