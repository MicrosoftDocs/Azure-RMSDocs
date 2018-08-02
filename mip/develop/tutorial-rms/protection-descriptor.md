# Protection Descriptors

- [Protection Descriptors](#protection-descriptors)
    - [Summary](#summary)
        - [Protection Descriptor Types](#protection-descriptor-types)
            - [Template-Based Protection](#template-based-protection)
            - [Ad-hoc Protection](#ad-hoc-protection)
        - [Requirements](#requirements)
        - [Create a Protection Descriptor](#create-a-protection-descriptor)
            - [Create from Template](#create-from-template)
            - [Create from User Roles](#create-from-user-roles)
            - [Create from User Rights](#create-from-user-rights)
    - [Next Steps](#next-steps)

## Summary

`ProtectionDescriptor` describes the protection that will be applied to a stream or buffer. `ProtectionDescriptor` stores information such as the policy name, descriptions, content lifetime, template ID, and user rights or roles mappings. Protection cannot be applied to information without a `ProtectionDescriptor`.

### Protection Descriptor Types

There are two methods to create a `PolicyDescriptor`.

- Template-based
- Ad-hoc

#### Template-Based Protection

Template-based protection uses **protection templates** provided by the AIP service to build the `ProtectionDescriptor`. These templates are configure on Azure Information Protection templates in the AIP admin portal. Protection templates have an identifier that can be passed in to the API to build the descriptor automatically.

The benefit of using protection templates rather than ad-hoc protection is that the template can be modified after the fact. Users can be added or removed, permissions changed, and those changes will impact the existing document.

[Details on Label Protection Settings]()

#### Ad-hoc Protection

*Ad-hoc protection* descriptors are defined the time of protection. These policies are applied for a specific set of users or groups and grant those users or groups, or multiple users/groups, a specific set of roles or rights.

Ad-hoc descriptors are **static**. The groups and users can be changed only by generating a new publishing license and decrypting/encrypting the information.

- Link to Roles
- Link to Permissions
- Link to AAD Info
- Link to Groups?

### Requirements

Creating a `ProtectionHandler` to work with a specific file requires one of the following:

- A template ID from an existing template in the AIP service
- A set of users and/or groups and the rights they should each have to the information
- A set of users and/or groups and the roles they should possess for the protected information

With any of these three items, a template descriptor can be created.

### Create a Protection Descriptor

The Protection API containers a builder class that assists in the creation of policy descriptors: `mip::PolicyDescriptorBuilder`. The descriptor builder can build a `ProtectionDescriptor` from template ID, user/role mapping, or user/rights mapping.

#### Create from Template

The quickest way to create a `ProtectionDescriptor` is by using a template. Users and groups with their matching roles and rights, as well as other protection related details, are already defined in the service. Creating the descriptor is as easy as passing in a template ID.

`mip::PolicyDescriptorBuilder` has a static function called `CreateFromTemplate()` which accepts a single `std::string` representing the template ID. Once the `ProtectionDescriptorBuilder` has been constructed with the template ID provided, the `Build()` method will output the actual descriptor object.

```cpp
std::shared_ptr<mip::ProtectionDescriptorBuilder> descriptorBuilder = 
    mip::ProtectionDescriptorBuilder::CreateFromTemplate("188c8c28-b537-458d-b61e-b1ed7cd82e79");
std::shared_ptr<mip::ProtectionDescriptor> descriptor =  descriptorBuilder->Build();
```

#### Create from User Roles

One method of creating an ad-hoc descriptor is to map a set of users to a set of roles. Details on available roles [can be found here]().

The list of users and roles are stored in two `std::vector<std::string>` objects. When passed to the `mip::UserRoles` constructor, the two are matched based on index.

| Index | `std::vector<std::string>` users              | `std::vector<std::string>` roles                   |
|-------|-------------------|------------------------|
|   0   | Alice@Contoso.com | mip::roles::Reviewer() |
|   1   | Bob@Contoso.com   | mip::roles::Author()   |
|   2   | Sally@Contoso.com | mip::roles::Reviewer() |


```cpp
std::vector<std::string> users;
std::vector<std::string> roles;

//Make Bob@Contoso.com a Reviewer
users.push_back("Bob@Contoso.com");
roles.push_back(mip::roles::Reviewer());

//Create UserRoles object, associating Bob and Reviewer
std::vector<mip::UserRoles> userRoles;
userRoles.emplace_back(users, roles);

//Provide UserRoles to ProtectionDescriptorBuilder
std::shared_ptr<mip::ProtectionDescriptorBuilder> descriptorBuilder = 
mip::ProtectionDescriptorBuilder::CreateFromUserRoles(userRoles);

//Build Descriptor
std::shared_ptr<ProtectionDescriptor> descriptor =  descriptorBuilder->Build();
```

#### Create from User Rights

The last method for creating an ad-hoc descriptor from the `ProtectionDescriptorBuilder()` is to map a set of users or groups to a set of rights. 

The list of users and rights are stored in two `std::vector<std::string>` objects. When passed to the `mip::UserRights` constructor, the two are matched by index.

| Index | `std::vector<std::string>` users              | `std::vector<std::string>` rights                   |
|-------|-------------------|------------------------|
|   0   | Alice@Contoso.com | mip::rights::View() |
|   1   | Alice@Contoso.com | mip::rights::Edit()   |
|   2   | Alice@Contoso.com | mip::rights::Reply() |

```cpp
std::vector<std::string> users;
std::vector<std::string> rights;

//Give Bob@Contoso.com View and Reply
std::string user = "Bob@Contoso.com";
users.push_back(user);
rights.push_back(mip::rights::View());
users.push_back(user);
rights.push_back(mip::rights::Reply());

//Create UserRoles object, associating Bob and Reviewer
std::vector<mip::UserRights> userRights;
userRights.emplace_back(users, rights);

//Provide UserRoles to ProtectionDescriptorBuilder
std::shared_ptr<mip::ProtectionDescriptorBuilder> descriptorBuilder =
mip::ProtectionDescriptorBuilder::CreateFromUserRights(userRights);

//Build Descriptor
std::shared_ptr<ProtectionDescriptor> descriptor =  descriptorBuilder->Build();
```

## Next Steps
