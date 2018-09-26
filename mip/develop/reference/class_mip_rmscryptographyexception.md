# class mip::RMSCryptographyException 
RMS cryptography exception.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public RMSCryptographyException(const std::string& message)  |  [RMSCryptographyException](class_mip_rmscryptographyexception.md) constructor.
 public RMSCryptographyException(const char*const& message)  |  [RMSCryptographyException](class_mip_rmscryptographyexception.md) constructor.
 public virtual const char* what() const  |  Gets exception message.
 public virtual ExceptionTypes type() const  |  Gets exception type.
 public virtual int error() const  |  Gets error code.
  
## Members
  
### RMSCryptographyException
[RMSCryptographyException](class_mip_rmscryptographyexception.md) constructor.

Parameters:  
* **message**: Exception message


  
### RMSCryptographyException
[RMSCryptographyException](class_mip_rmscryptographyexception.md) constructor.

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