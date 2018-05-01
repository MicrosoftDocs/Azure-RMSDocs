# class mip::RMSOfficeFileException 
RMS Office file exception.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public inline RMSOfficeFileException(const std::string& message, Reason reason)  |  [RMSOfficeFileException](#classmip_1_1_r_m_s_office_file_exception) constructor.
public inline RMSOfficeFileException(const char*const& message, Reason reason)  |  [RMSOfficeFileException](#classmip_1_1_r_m_s_office_file_exception) constructor.
public inline virtual Reason reason() const  |  Gets Office file failure classification.
public inline virtual const char* what() const  |  Gets exception message.
public inline virtual ExceptionTypes type() const  |  Gets exception type.
public inline virtual int error() const  |  Gets error code.
  
## Members
  
### RMSOfficeFileException
[RMSOfficeFileException](#classmip_1_1_r_m_s_office_file_exception) constructor.
  
#### Parameters
* message Exception message 
* reason Office file failure classification
  
### RMSOfficeFileException
[RMSOfficeFileException](#classmip_1_1_r_m_s_office_file_exception) constructor.
  
#### Parameters
* message Exception message 
* reason Office file failure classification
  
### Reason
Gets Office file failure classification.
  
#### Returns
Office file failure classification
  
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