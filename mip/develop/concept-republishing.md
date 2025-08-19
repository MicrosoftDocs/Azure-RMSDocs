---
title: Republishing in Microsoft Information Protection (MIP) SDK
description: This article helps you understand the scenario of how to re-use protection handler for republishing scenarios.
author: msmbaldwin
ms.service: information-protection
ms.topic: conceptual
ms.date: 04/10/2025
ms.author: mbaldwin
---

# Republishing (C++)

This overview focuses on Republishing in MIP SDK. Republishing is required when an application needs to allow a user to edit the file, but must maintain the original [publishing license](https://techcommunity.microsoft.com/t5/enterprise-mobility-security/licenses-and-certificates-and-how-ad-rms-protects-and-consumes/ba-p/247309) information about owner, rights, content key, and so on.

The pattern may look something like:

- A user opens a protected document for editing.
- The user must only be permitted to edit the file if they have the appropriate rights.
- The user edits and then saves the document.

The MIP SDK pseudocode to accomplish this task may look like:

- Create an `mip::FileHandler` that points to the target file.
- Store the `mip::ProtectionHandler` exposed by the `mip::FileHandler`'s `GetProtection()` method.
- Check that the user has **EDIT** rights by calling `AccessCheck()` method.
- Use `mip::FileHandler`'s `GetDecryptedTemporaryFileAsync()` or `GetDecryptedTemporaryStreamAsync()` to get a temporary decrypted output.
- Edit the temp file or stream contents and save.
- Create a new `mip::FileHandler` instance pointing to the temp file and use the `SetProtection()` method, providing the stored `mip::ProtectionHandler` as the parameter.
- Commit the change.

Using the `mip::ProtectionHandler` from the original file, the owner, content ID, and content key are maintained on the edited document. This republishing scenario requires that the application maintains a reference to the original `mip::ProtectionHandler`.

## Implementation

As discussed earlier, the `mip::FileHandler` class, exposes methods for reading, writing, and removing both labels and protection information. For the full list of supported operations, review the reference for [mip::FileHandler](https://microsoftdocs.github.io/mip-sdk-docs/cpp/classFileHandler.html).

This scenario uses the following methods of `mip::FileHandler`:

- `GetProtection()`
- `CommitAsync()`
- `GetDecryptedTemporaryFileAsync()`
- `SetProtection()`

The scenario also uses `mip::ProtectionHandler`, which exposes the functions for encrypting and decrypting protected streams and buffers, performing access checks, obtaining the publishing license, and getting attributes from the protected information. The `AccessCheck()` method will be used to validate that the user has rights to edit the file.

To successfully complete this reprotection scenario, review the Quick starts under 'Next steps' and ensure that the application builds and can successfully list labels.

## Create a Protection Handler from the file and decrypt the file

`mip::ProtectionHandler` exposes the functions for encrypting and decrypting protected streams and buffers, performing access checks, obtaining the publishing license, and getting attributes from the protected information. `mip::ProtectionHandler` objects are constructed by providing either a ProtectionDescriptor or a serialized publishing license. For this use case, the publishing license is used when decrypting already-protected content or when protecting content where the license has already been constructed.

`mip::FileHandler` exposes a method named `GetProtection()` that retrieves `mip::ProtectionHandler` from the file associated with the `mip::FileHandler`. Once the `mip::ProtectionHandler` object is retrieved the same can be used to validate user's access levels for the file, decrypt the file and later encrypt the file once it is edited.

`mip::ProtectionHandler`'s `AccessCheck()` is used to validate that the user has a specific right to the file and returns a boolean response, depending on the result. For example, to verify that the user has rights to edit, call the method passing in the value "EDIT". If the result is *true*, permit the user to edit the file. Once the **EDIT** right is verified, use `mip::FileHandler`'s `GetDecryptedTemporaryFileAsync()` to retrieve the temporary decrypted file.

For more information, see [Restrict access to content by using sensitivity labels to apply encryption](/purview/encryption-sensitivity-labels).

 > [!IMPORTANT]
 > Access checks and enforcement are purely up to the application developer. A user with VIEW rights is capable of decrypting the protected information. It's up to the application to validate the set of rights the user is granted and to enforce those rights via information protection controls such as preventing copy, editing, or taking screenshots. 
 > Failure to properly implement protection controls may result in sensitive information exposure.

## Save and publish the edited file by applying Protection

The file can be edited after the file is decrypted. Once the edit operation is completed, the changes can be committed. Create a `IFileHandler` object using the temporary file for handling the committed file. The temporary file can then be protected using the `IProtectionHandler` object retrieved from the original file.

## Next Steps

- [Review the Republishing quickstart for C++](quick-file-republishing-cpp.md)
- [Review the Republishing quickstart for C#](quick-file-republishing-csharp.md)