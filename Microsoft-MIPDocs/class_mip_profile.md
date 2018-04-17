# class mip::Profile 
[Profile](#classmip_1_1_profile) class is the root class for using the Microsoft Information Protection operations. A typical application will only need one [Profile](#classmip_1_1_profile) but it can create multiple profiles if needed.
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const Settings & GetSettings | Get the settings set on the profile.
public void ListEnginesAsync | Starts list engines operation.
public void UnloadEngineAsync | Starts unloading the policy engine with the given id.
public void AddEngineAsyncPolicyEngine::Settings & settings,const std::shared_ptr< void > & context) | Starts adding a new policy engine to the profile.
public void DeleteEngineAsync | Starts deleting the policy engine with the given id. All data for the given profile will be completely deleted.
## Members
### Settings
Get the settings set on the profile.
#### Returns
settings set on the profile.
### ListEnginesAsync
Starts list engines operation.
#### Parameters
* context a parameter that will be passed into the observer functions. 
[Profile::Observer](#classmip_1_1_profile_1_1_observer) will be called upon success or failure.
### UnloadEngineAsync
Starts unloading the policy engine with the given id.
#### Parameters
* id the unique engine id. 
* context a parameter that will be passed into the observer functions. 
[Profile::Observer](#classmip_1_1_profile_1_1_observer) will be called upon success or failure.
### AddEngineAsync
Starts adding a new policy engine to the profile.
#### Parameters
* settings the [mip::PolicyEngine::Settings](#classmip_1_1_policy_engine_1_1_settings) objet that specifies the engines parameters. 
* context a parameter that will be passed into the observer functions. 
[Profile::Observer](#classmip_1_1_profile_1_1_observer) will be called upon success or failure.
### DeleteEngineAsync
Starts deleting the policy engine with the given id. All data for the given profile will be completely deleted.
#### Parameters
* id the unique engine id. 
* context a parameter that will be passed into the observer functions. 
[Profile::Observer](#classmip_1_1_profile_1_1_observer) will be called upon success or failure.