# class mip::RMSStreamException 
RMS stream exception.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public RMSStreamException(const std::string& message)  |  [RMSStreamException](class_mip_rmsstreamexception.md) constructor.
 public RMSStreamException(const char*const& message)  |  [RMSStreamException](class_mip_rmsstreamexception.md) constructor.
 public virtual const char* what() const  |  Gets exception message.
 public virtual ExceptionTypes type() const  |  Gets exception type.
 public virtual int error() const  |  Gets error code.
  
## Members
  
### RMSStreamException
[RMSStreamException](class_mip_rmsstreamexception.md) constructor.

Parameters:  
* **message**: Exception message


  
### RMSStreamException
[RMSStreamException](class_mip_rmsstreamexception.md) constructor.

Parameters:  
* **message**: Exception message


  
### what
Gets exception message.

  
**Returns**: Exception message
  
### ExceptionTypes
Gets exception type.

  
**Returns**: Exception type
  
### error
Gets error code.

  
**Returns**: [Error](class_mip_error.md) code