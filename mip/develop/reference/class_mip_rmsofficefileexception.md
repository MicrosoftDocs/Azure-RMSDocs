# class mip::RMSOfficeFileException 
RMS Office file exception.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public RMSOfficeFileException(const std::string& message, Reason reason)  |  [RMSOfficeFileException](class_mip_rmsofficefileexception.md) constructor.
 public RMSOfficeFileException(const char*const& message, Reason reason)  |  [RMSOfficeFileException](class_mip_rmsofficefileexception.md) constructor.
 public virtual Reason reason() const  |  Gets Office file failure classification.
 public virtual const char* what() const  |  Gets exception message.
 public virtual ExceptionTypes type() const  |  Gets exception type.
 public virtual int error() const  |  Gets error code.
  
## Members
  
### RMSOfficeFileException
[RMSOfficeFileException](class_mip_rmsofficefileexception.md) constructor.

Parameters:  
* **message**: Exception message 


* **reason**: Office file failure classification


  
### RMSOfficeFileException
[RMSOfficeFileException](class_mip_rmsofficefileexception.md) constructor.

Parameters:  
* **message**: Exception message 


* **reason**: Office file failure classification


  
### Reason
Gets Office file failure classification.

  
**Returns**: Office file failure classification
  
### what
Gets exception message.

  
**Returns**: Exception message
  
### ExceptionTypes
Gets exception type.

  
**Returns**: Exception type
  
### error
Gets error code.

  
**Returns**: [Error](class_mip_error.md) code