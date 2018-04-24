# class mip::RMSNetworkException 
RMS Network exception.
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public inline  RMSNetworkExceptionReason reason)
public inline  RMSNetworkExceptionReason reason)
public inline virtual Reason reason | Gets network failure classification.
public inline virtual const char * what | Gets exception message.
public inline virtual ExceptionTypes type | Gets exception type.
public inline virtual int error | Gets error code.
## Members
### RMSNetworkException
[RMSNetworkException](#classmip_1_1_r_m_s_network_exception) constructor.
#### Parameters
* message Exception message 
* reason Network failure classification
### RMSNetworkException
[RMSNetworkException](#classmip_1_1_r_m_s_network_exception) constructor.
#### Parameters
* message Exception message 
* reason Network failure classification
### Reason
Gets network failure classification.
#### Returns
Network failure classification
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