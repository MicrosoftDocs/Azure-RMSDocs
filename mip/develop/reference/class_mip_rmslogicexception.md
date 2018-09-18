# class mip::RMSLogicException 
RMS logic exception.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public RMSLogicException(const ErrorTypes error, const std::string& message)  |  [RMSLogicException](class_mip_rmslogicexception.md) constructor.
 public RMSLogicException(const ErrorTypes error, const char*const& message)  |  [RMSLogicException](class_mip_rmslogicexception.md) constructor.
 public virtual const char* what() const  |  Gets exception message.
 public virtual ExceptionTypes type() const  |  Gets exception type.
 public virtual int error() const  |  Gets error code.
  
## Members
  
### RMSLogicException
[RMSLogicException](class_mip_rmslogicexception.md) constructor.

Parameters:  
* **error**: [Error](class_mip_error.md) code 


* **message**: Exception message


  
### RMSLogicException
[RMSLogicException](class_mip_rmslogicexception.md) constructor.

Parameters:  
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