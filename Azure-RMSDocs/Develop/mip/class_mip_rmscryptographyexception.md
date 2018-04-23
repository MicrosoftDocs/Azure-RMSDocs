# class mip::RMSCryptographyException 
RMS cryptography exception.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public inline RMSCryptographyException(const std::string& message)  |  [RMSCryptographyException](#classmip_1_1_r_m_s_cryptography_exception) constructor.
public inline RMSCryptographyException(const char*const& message)  |  [RMSCryptographyException](#classmip_1_1_r_m_s_cryptography_exception) constructor.
public inline virtual const char* what() const  |  Gets exception message.
public inline virtual ExceptionTypes type() const  |  Gets exception type.
public inline virtual int error() const  |  Gets error code.
  
## Members
  
### RMSCryptographyException
[RMSCryptographyException](#classmip_1_1_r_m_s_cryptography_exception) constructor.
  
#### Parameters
* message Exception message
  
### RMSCryptographyException
[RMSCryptographyException](#classmip_1_1_r_m_s_cryptography_exception) constructor.
  
#### Parameters
* message Exception message
  
### what
Gets exception message.
  
#### Returns
Exception message
  
### ExceptionTypes
Gets exception type.
  
#### Returns
Exception type
  
### error
Gets error code.
  
#### Returns
[Error](#classmip_1_1_error) code