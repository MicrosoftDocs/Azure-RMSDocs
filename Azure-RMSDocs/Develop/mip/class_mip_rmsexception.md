# class mip::RMSException 
Base RMS exception.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public inline RMSException(const ExceptionTypes type, const int error, const std::string& message)  |  [RMSException](#classmip_1_1_r_m_s_exception) constructor.
public inline RMSException(const ExceptionTypes type, const int error, const char*const& message)  |  [RMSException](#classmip_1_1_r_m_s_exception) constructor.
public inline virtual const char* what() const  |  Gets exception message.
public inline virtual ExceptionTypes type() const  |  Gets exception type.
public inline virtual int error() const  |  Gets error code.
  
## Members
  
### RMSException
[RMSException](#classmip_1_1_r_m_s_exception) constructor.
  
#### Parameters
* type Type of exception 
* error [Error](#classmip_1_1_error) code 
* message Exception message
  
### RMSException
[RMSException](#classmip_1_1_r_m_s_exception) constructor.
  
#### Parameters
* type Type of exception 
* error [Error](#classmip_1_1_error) code 
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