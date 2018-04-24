# class mip::FileIOError 
File IO error.
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public inline char const  * what | Get a cstring error message.
public std::shared_ptr< Error > Clone | Clone the error.
public inline virtual ErrorType GetErrorType | Get the error type.
public inline virtual const std::string & GetErrorName | Get the error name.
public inline virtual const std::string & GetMessage | Get the error message.
public inline virtual void SetMessage | Set the error message.
## Members
### what
Get a cstring error message.
#### Returns
a cstring err message
### Error
Clone the error.
#### Returns
a clone of the error.
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