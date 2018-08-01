# class mip::BadInputError 
Bad input error, thrown when the input to an sdk api is invalid.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public char const* what() const  |  Get a cstring error message.
public std::shared_ptr<Error> Clone() const  |  Clone the error.
 public virtual ErrorType GetErrorType() const  |  Get the error type.
 public virtual const std::string& GetErrorName() const  |  Get the error name.
 public virtual const std::string& GetMessage() const  |  Get the error message.
 public virtual void SetMessage(const std::string& msg)  |  Set the error message.
  
## Members
  
### what
Get a cstring error message.

  
**Returns**: A cstring err message
  
### Error
Clone the error.

  
**Returns**: A clone of the error.
  
### ErrorType
Get the error type.

  
**Returns**: The error type.
  
### GetErrorName
Get the error name.

  
**Returns**: The error name.
  
### GetMessage
Get the error message.

  
**Returns**: The error message.
  
### SetMessage
Set the error message.

Parameters:  
* **msg**: the error message.

