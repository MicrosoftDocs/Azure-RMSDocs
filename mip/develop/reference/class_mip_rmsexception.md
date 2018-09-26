# class mip::RMSException 
Base RMS exception.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public RMSException(const ExceptionTypes type, const int error, const std::string& message)  |  [RMSException](class_mip_rmsexception.md) constructor.
 public RMSException(const ExceptionTypes type, const int error, const char*const& message)  |  [RMSException](class_mip_rmsexception.md) constructor.
 public virtual const char* what() const  |  Gets exception message.
 public virtual ExceptionTypes type() const  |  Gets exception type.
 public virtual int error() const  |  Gets error code.
  
## Members
  
### RMSException
[RMSException](class_mip_rmsexception.md) constructor.

Parameters:  
* **type**: Type of exception 


* **error**: [Error](class_mip_error.md) code 


* **message**: Exception message


  
### RMSException
[RMSException](class_mip_rmsexception.md) constructor.

Parameters:  
* **type**: Type of exception 


* **error**: [Error](class_mip_error.md) code 


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