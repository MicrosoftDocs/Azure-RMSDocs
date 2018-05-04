# class mip::UserRoles 
Represents a group of users and the roles associated with them.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public MIP_EXPORT UserRoles(const UserList& users, const RoleList& roles)  |  [UserRoles](#classmip_1_1_user_roles) constructor.
public inline const UserList& Users() const  |  Gets users associated with a set of roles.
public inline const RoleList& Roles() const  |  Gets roles associated with a group of users.
  
## Members
  
### UserRoles
[UserRoles](#classmip_1_1_user_roles) constructor.
  
#### Parameters
* users Group of users that share the same roles 
* roles [Roles](#classmip_1_1_roles) shared by group of users
  
### UserList
Gets users associated with a set of roles.
  
#### Returns
Users associated with a set of roles
  
### RoleList
Gets roles associated with a group of users.
  
#### Returns
[Roles](#classmip_1_1_roles) associated with a group of users