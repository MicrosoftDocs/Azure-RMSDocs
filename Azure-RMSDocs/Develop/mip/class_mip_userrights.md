# class mip::UserRights 
Represents a group of users and the rights associated with them.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public inline UserRights(const UserList& users, const RightList& rights)  |  [UserRights](#classmip_1_1_user_rights) constructor.
public inline const UserList& Users() const  |  Gets users associated with a set of rights.
public inline const RightList& Rights() const  |  Gets rights associated with a group of users.
  
## Members
  
### UserRights
[UserRights](#classmip_1_1_user_rights) constructor.
  
#### Parameters
* users Group of users that share the same rights 
* rights Rights shared by group of users
  
### UserList
Gets users associated with a set of rights.
  
#### Returns
Users associated with a set of rights
  
### RightList
Gets rights associated with a group of users.
  
#### Returns
Rights associated with a group of users