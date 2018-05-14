# class mip::RMSNetworkException 
RMS Network exception.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public RMSNetworkException(const std::string& message, Reason reason)  |  [RMSNetworkException](class_mip_rmsnetworkexception.md) constructor.
 public RMSNetworkException(const char*const& message, Reason reason)  |  [RMSNetworkException](class_mip_rmsnetworkexception.md) constructor.
 public virtual Reason reason() const  |  Gets network failure classification.
 public virtual const char* what() const  |  Gets exception message.
 public virtual ExceptionTypes type() const  |  Gets exception type.
 public virtual int error() const  |  Gets error code.
  
## Members
  
### RMSNetworkException
[RMSNetworkException](class_mip_rmsnetworkexception.md) constructor.

Parameters:  
* **message**: Exception message 


* **reason**: Network failure classification


  
### RMSNetworkException
[RMSNetworkException](class_mip_rmsnetworkexception.md) constructor.

Parameters:  
* **message**: Exception message 


* **reason**: Network failure classification


  
### Reason
Gets network failure classification.

  
**Returns**: Network failure classification
  
### what
Gets exception message.

  
**Returns**: Exception message
  
### ExceptionTypes
Gets exception type.

  
**Returns**: Exception type
  
### error
Gets error code.

  
**Returns**: [Error](class_mip_error.md) code