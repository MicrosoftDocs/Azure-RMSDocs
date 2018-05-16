# class mip::Consent 
Represents a user's acceptance/refusal to allow an action.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public const mip::ConsentResult& Result() const  |  Gets the result of a consent request.
 public void Result(const ConsentResult& value)  |  Sets the result of a consent request.
 public mip::ConsentType Type() const  |  Gets the type of consent.
public const std::vector<std::string> Urls() const  |  Gets the URLs involved in the consent request.
 public const std::string User() const  |  Gets the user (email address) from whom consent is requested.
 public const std::string Domain() const  |  Gets the domain associated with the user from whom consent is requested.
  
## Members
  
### mip::ConsentResult
Gets the result of a consent request.

  
**Returns**: Result of consent request
  
### Result
Sets the result of a consent request.

Parameters:  
* **value**: Result of consent request


  
### mip::ConsentType
Gets the type of consent.

  
**Returns**: Type of consent
  
### Urls
Gets the URLs involved in the consent request.

  
**Returns**: URLs involved in the consent request
  
### User
Gets the user (email address) from whom consent is requested.

  
**Returns**: User from whom consent is requested
  
### Domain
Gets the domain associated with the user from whom consent is requested.

  
**Returns**: Domain associated with the user from whom consent is requested