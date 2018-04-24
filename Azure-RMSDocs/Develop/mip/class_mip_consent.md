# class mip::Consent 
Represents a user's acceptance/refusal to allow an action.
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const mip::ConsentResult & Result | Gets the result of a consent request.
public void ResultConsentResult & value) | Sets the result of a consent request.
public mip::ConsentType Type | Gets the type of consent.
public const std::vector< std::string > Urls | Gets the URLs involved in the consent request.
public const std::string User | Gets the user (email address) from whom consent is requested.
public const std::string Domain | Gets the domain associated with the user from whom consent is requested.
## Members
### mip::ConsentResult
Gets the result of a consent request.
#### Returns
Result of consent request
### Result
Sets the result of a consent request.
#### Parameters
* value Result of consent request
### mip::ConsentType
Gets the type of consent.
#### Returns
Type of consent
### Urls
Gets the URLs involved in the consent request.
#### Returns
URLs involved in the consent request
### User
Gets the user (email address) from whom consent is requested.
#### Returns
User from whom consent is requested
### Domain
Gets the domain associated with the user from whom consent is requested.
#### Returns
Domain associated with the user from whom consent is requested