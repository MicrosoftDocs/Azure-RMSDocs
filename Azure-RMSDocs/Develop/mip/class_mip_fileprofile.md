# class mip::FileProfile 
[FileProfile](#classmip_1_1_file_profile) class is the root class for using the Microsoft Information Protection operations.
A typical application will only need one [Profile](#classmip_1_1_profile) but it can create multiple profiles if needed.
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public inline virtual  ~FileProfile | 
public const Settings & GetSettings | Returns the profile settings.
public void ListEnginesAsync | Starts list engines operation.
public void UnloadEngineAsync | Starts unloading the file engine with the given id.
public void AddEngineAsyncFileEngine::Settings & settings,const std::shared_ptr< void > & context) | Starts adding a new file engine to the profile.
public void DeleteEngineAsync | Starts deleting the file engine with the given id. All data for the given profile will be completely deleted.
protected inline  FileProfile | 
## Members
### ~FileProfile
### Settings
Returns the profile settings.
### ListEnginesAsync
Starts list engines operation.
[FileProfile::Observer](#classmip_1_1_file_profile_1_1_observer) will be called upon success or failure.
### UnloadEngineAsync
Starts unloading the file engine with the given id.
[FileProfile::Observer](#classmip_1_1_file_profile_1_1_observer) will be called upon success or failure.
### AddEngineAsync
Starts adding a new file engine to the profile.
[FileProfile::Observer](#classmip_1_1_file_profile_1_1_observer) will be called upon success or failure.
### DeleteEngineAsync
Starts deleting the file engine with the given id. All data for the given profile will be completely deleted.
[FileProfile::Observer](#classmip_1_1_file_profile_1_1_observer) will be called upon success or failure.
### FileProfile