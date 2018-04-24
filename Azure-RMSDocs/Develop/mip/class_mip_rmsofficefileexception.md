# class mip::RMSOfficeFileException 
RMS Office file exception.
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public inline  RMSOfficeFileExceptionReason reason)
public inline  RMSOfficeFileExceptionReason reason)
public inline virtual Reason reason | Gets Office file failure classification.
public inline virtual const char * what | Gets exception message.
public inline virtual ExceptionTypes type | Gets exception type.
public inline virtual int error | Gets error code.
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