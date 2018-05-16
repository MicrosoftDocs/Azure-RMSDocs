# class mip::UserRoles 
Represents a group of users and the roles associated with them.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public MIP_EXPORT UserRoles(const UserList& users, const RoleList& roles)  |  [UserRoles](class_mip_userroles.md) constructor.
 public const UserList& Users() const  |  Gets users associated with a set of roles.
 public const RoleList& Roles() const  |  Gets roles associated with a group of users.
  
## Members
  
### UserRoles
[UserRoles](class_mip_userroles.md) constructor.

Parameters:  
* **users**: Group of users that share the same roles 


* **roles**: [Roles](class_mip_roles.md) shared by group of users


  
### UserList
Gets users associated with a set of roles.

  
**Returns**: Users associated with a set of roles
  
### RoleList
Gets roles associated with a group of users.

  
**Returns**: [Roles](class_mip_roles.md) associated with a group of users