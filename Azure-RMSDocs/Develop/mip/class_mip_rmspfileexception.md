# class mip::RMSPFileException 
RMS PFile exception.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public inline RMSPFileException(const std::string& message, Reason reason)  |  [RMSPFileException](#classmip_1_1_r_m_s_p_file_exception) constructor.
public inline RMSPFileException(const char*const& message, Reason reason)  |  [RMSPFileException](#classmip_1_1_r_m_s_p_file_exception) constructor.
public inline virtual Reason reason() const  |  Gets PFile error classification.
public inline virtual const char* what() const  |  Gets exception message.
public inline virtual ExceptionTypes type() const  |  Gets exception type.
public inline virtual int error() const  |  Gets error code.
  
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