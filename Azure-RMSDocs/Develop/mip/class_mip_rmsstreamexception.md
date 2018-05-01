# class mip::RMSStreamException 
RMS stream exception.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public inline RMSStreamException(const std::string& message)  |  [RMSStreamException](#classmip_1_1_r_m_s_stream_exception) constructor.
public inline RMSStreamException(const char*const& message)  |  [RMSStreamException](#classmip_1_1_r_m_s_stream_exception) constructor.
public inline virtual const char* what() const  |  Gets exception message.
public inline virtual ExceptionTypes type() const  |  Gets exception type.
public inline virtual int error() const  |  Gets error code.
  
## Members
  
### RMSStreamException
[RMSStreamException](#classmip_1_1_r_m_s_stream_exception) constructor.
  
#### Parameters
* message Exception message
  
### RMSStreamException
[RMSStreamException](#classmip_1_1_r_m_s_stream_exception) constructor.
  
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