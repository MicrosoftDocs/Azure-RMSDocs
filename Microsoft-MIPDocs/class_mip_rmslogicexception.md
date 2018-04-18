# class mip::RMSLogicException 
RMS logic exception.
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public inline  RMSLogicExceptionErrorTypes error,const std::string & message)
public inline  RMSLogicExceptionErrorTypes error,const char *const & message)
public inline virtual const char * what | Gets exception message.
public inline virtual ExceptionTypes type | Gets exception type.
public inline virtual int error | Gets error code.
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