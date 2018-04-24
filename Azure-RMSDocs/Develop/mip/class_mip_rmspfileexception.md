# class mip::RMSPFileException 
RMS PFile exception.
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public inline  RMSPFileExceptionReason reason)
public inline  RMSPFileExceptionReason reason)
public inline virtual Reason reason | Gets PFile error classification.
public inline virtual const char * what | Gets exception message.
public inline virtual ExceptionTypes type | Gets exception type.
public inline virtual int error | Gets error code.
## Members
### RMSPFileException
[RMSPFileException](#classmip_1_1_r_m_s_p_file_exception) constructor.
#### Parameters
* message Exception message 
* reason PFile error classification
### RMSPFileException
[RMSPFileException](#classmip_1_1_r_m_s_p_file_exception) constructor.
#### Parameters
* message Exception message 
* reason PFile error classification
### Reason
Gets PFile error classification.
#### Returns
PFile error classification
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