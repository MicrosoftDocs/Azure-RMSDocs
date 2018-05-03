# class mip::ConsentResult 
Describes result of consent request after user interaction.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public inline ConsentResult(bool accepted, bool showAgain, const std::string& userId)  |  [ConsentResult](#classmip_1_1_consent_result) constructor.
public inline bool Accepted() const  |  Gets whether or not user consented to action.
public inline bool ShowAgain() const  |  Gets whether or not explicit consent is required for future requests.
public inline const std::string& UserId() const  |  Gets user (email address) from whom consent was requested.
  
## Members
  
### ConsentResult
[ConsentResult](#classmip_1_1_consent_result) constructor.
  
#### Parameters
* accepted Whether or not user consented to action 
* showAgain Whether or not explicit consent is required for future action requests 
* userId User (email address) from whom consent was requested
  
### Accepted
Gets whether or not user consented to action.
  
#### Returns
Whether or not user contented to action
  
### ShowAgain
Gets whether or not explicit consent is required for future requests.
  
#### Returns
Whether or not explicit consent is required for future requests
If this is true, the SDK will remember the result of this consent and not prompt the client application for consent in the future.
  
### UserId
Gets user (email address) from whom consent was requested.
  
#### Returns
User from whom consent was requested