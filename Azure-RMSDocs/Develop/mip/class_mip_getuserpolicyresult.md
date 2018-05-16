# class mip::GetUserPolicyResult 
Describes the results of a user policy acquisition request.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public GetUserPolicyResultStatus GetResultStatus()  |  Gets the status of the policy acquisition request.
public std::shared_ptr<std::string> GetReferrer()  |  Gets the refererrer address of the policy.
public std::shared_ptr<UserPolicy> GetPolicy()  |  Gets a [UserPolicy](class_mip_userpolicy.md) instance.
  
## Members
  
### GetUserPolicyResultStatus
Gets the status of the policy acquisition request.

  
**Returns**: Status of the policy acquisition request
  
### GetReferrer
Gets the refererrer address of the policy.

  
**Returns**: Referrerer address of the policy
The referrer is a URI that can be displayed to the user upon failed policy acquisition that contains information on how that user can gain permission to access the content.
  
### UserPolicy
Gets a [UserPolicy](class_mip_userpolicy.md) instance.

  
**Returns**: [UserPolicy](class_mip_userpolicy.md) instance if acquisition was successful, else nullptr