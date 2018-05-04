# class mip::GetUserPolicyResult 
Describes the results of a user policy acquisition request.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public GetUserPolicyResultStatus GetResultStatus()  |  Gets the status of the policy acquisition request.
public std::shared_ptr<std::string> GetReferrer()  |  Gets the referrer address of the policy.
public std::shared_ptr<UserPolicy> GetPolicy()  |  Gets a [UserPolicy](#classmip_1_1_user_policy) instance.
  
## Members
  
### GetUserPolicyResultStatus
Gets the status of the policy acquisition request.
  
#### Returns
Status of the policy acquisition request
  
### GetReferrer
Gets the referrer address of the policy.
  
#### Returns
Referrer address of the policy
The referrer is a URI that can be displayed to the user upon failed policy acquisition that contains information on how that user can gain permission to access the content.
  
### UserPolicy
Gets a [UserPolicy](#classmip_1_1_user_policy) instance.
  
#### Returns
[UserPolicy](#classmip_1_1_user_policy) instance if acquisition was successful, else `nullptr`.