# class mip::UserRights 
Represents a group of users and the rights associated with them.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public UserRights(const UserList& users, const RightList& rights)  |  [UserRights](class_mip_userrights.md) constructor.
 public const UserList& Users() const  |  Gets users associated with a set of rights.
 public const RightList& Rights() const  |  Gets rights associated with a group of users.
  
## Members
  
### UserRights
[UserRights](class_mip_userrights.md) constructor.

Parameters:  
* **users**: Group of users that share the same rights 


* **rights**: Rights shared by group of users


  
### UserList
Gets users associated with a set of rights.

  
**Returns**: Users associated with a set of rights
  
### RightList
Gets rights associated with a group of users.

  
**Returns**: Rights associated with a group of users