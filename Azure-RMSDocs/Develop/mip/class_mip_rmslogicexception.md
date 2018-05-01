# class mip::RMSLogicException 
RMS logic exception.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public inline RMSLogicException(const ErrorTypes error, const std::string& message)  |  [RMSLogicException](#classmip_1_1_r_m_s_logic_exception) constructor.
public inline RMSLogicException(const ErrorTypes error, const char*const& message)  |  [RMSLogicException](#classmip_1_1_r_m_s_logic_exception) constructor.
public inline virtual const char* what() const  |  Gets exception message.
public inline virtual ExceptionTypes type() const  |  Gets exception type.
public inline virtual int error() const  |  Gets error code.
  
## Members
  
### RMSLogicException
[RMSLogicException](#classmip_1_1_r_m_s_logic_exception) constructor.
  
#### Parameters
* error [Error](#classmip_1_1_error) code 
* message Exception message
  
### RMSLogicException
[RMSLogicException](#classmip_1_1_r_m_s_logic_exception) constructor.
  
#### Parameters
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