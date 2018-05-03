# class mip::RMSNetworkException 
RMS Network exception.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public inline RMSNetworkException(const std::string& message, Reason reason)  |  [RMSNetworkException](#classmip_1_1_r_m_s_network_exception) constructor.
public inline RMSNetworkException(const char*const& message, Reason reason)  |  [RMSNetworkException](#classmip_1_1_r_m_s_network_exception) constructor.
public inline virtual Reason reason() const  |  Gets network failure classification.
public inline virtual const char* what() const  |  Gets exception message.
public inline virtual ExceptionTypes type() const  |  Gets exception type.
public inline virtual int error() const  |  Gets error code.
  
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