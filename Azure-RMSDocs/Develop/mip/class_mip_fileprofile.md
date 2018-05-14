# class mip::FileProfile 
[FileProfile](class_mip_fileprofile.md) class is the root class for using the Microsoft Information Protection operations.
A typical application will only need one [Profile](class_mip_profile.md) but it can create multiple profiles if needed.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public virtual ~FileProfile()  | _Not yet documented._
 public const Settings& GetSettings() const  |  Returns the profile settings.
public void ListEnginesAsync(const std::shared_ptr<void>& context)  |  Starts list engines operation.
public void UnloadEngineAsync(const std::string& id, const std::shared_ptr<void>& context)  |  Starts unloading the file engine with the given id.
public void AddEngineAsync(const FileEngine::Settings& settings, const std::shared_ptr<void>& context)  |  Starts adding a new file engine to the profile.
public void DeleteEngineAsync(const std::string& id, const std::shared_ptr<void>& context)  |  Starts deleting the file engine with the given id. All data for the given profile will be completely deleted.
 protected FileProfile()  | _Not yet documented._
  
## Members
  
### ~FileProfile
_Not documented yet._

  
### Settings
Returns the profile settings.
  
### ListEnginesAsync
Starts list engines operation.
[FileProfile::Observer](class_mip_fileprofile_observer.md) will be called upon success or failure.
  
### UnloadEngineAsync
Starts unloading the file engine with the given id.
[FileProfile::Observer](class_mip_fileprofile_observer.md) will be called upon success or failure.
  
### AddEngineAsync
Starts adding a new file engine to the profile.
[FileProfile::Observer](class_mip_fileprofile_observer.md) will be called upon success or failure.
  
### DeleteEngineAsync
Starts deleting the file engine with the given id. All data for the given profile will be completely deleted.
[FileProfile::Observer](class_mip_fileprofile_observer.md) will be called upon success or failure.
  
### FileProfile
_Not documented yet._
