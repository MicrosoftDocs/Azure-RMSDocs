# class mip::JustificationRequiredError 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public inline JustificationRequiredError()  |  
public inline virtual std::shared_ptr<Error> Clone() const  |  Clone the error.
public inline char const* what() const  |  Get a cstring error message.
public inline virtual ErrorType GetErrorType() const  |  Get the error type.
public inline virtual const std::string& GetErrorName() const  |  Get the error name.
public inline virtual const std::string& GetMessage() const  |  Get the error message.
public inline virtual void SetMessage(const std::string& msg)  |  Set the error message.
  
## Members
  
### JustificationRequiredError
  
### Error
Clone the error.
  
#### Returns
a clone of the error.
  
### what
Get a cstring error message.
  
#### Returns
a cstring err message
  
### ErrorType
Get the error type.
  
#### Returns
the error type.
  
### GetErrorName
Get the error name.
  
#### Returns
the error name.
  
### GetMessage
Get the error message.
  
#### Returns
the error message.
  
### SetMessage
Set the error message.
  
#### Parameters
* msg the error message.