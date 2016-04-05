---
# required metadata

title: Add explicit owner rights | Azure RMS
description:
keywords:
author: bruceperlerms
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: b2cd9dd4-6590-488e-9efb-27bdab41eff6

# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

﻿
# Add explicit owner rights

Your application should explicitly add "Owner" rights when creating a license from scratch ([**IpcCreateLicenseFromScratch**](xref:msipc.ipccreatelicensefromscratch)).

## Prerequisites

When your application is creating a license handle using [**IpcCreateLicenseFromScratch**](xref:msipc.ipccreatelicensefromscratch), it must also grant the owner full rights (permissions) explicitly.

**Note**  Setting a user as "owner" using [**IpcSetLicenseProperty**](xref:msipc.ipcsetlicenseproperty) with the **IPC\_LI\_OWNER** property does not grant the owner full permissions.

 
## Scenario - assigning rights to a license

In this C++ example, needed rights are added to a license created with [**IpcCreateLicenseFromScratch**](xref:msipc.ipccreatelicensefromscratch). The example shows the creation and assignment of the rights to the license through a rights list.

The following two rights are added to these users:

-   *Read* permissions assigned to joe@contoso.com
-   *Full* permissions assigned to mary\_kay@contoso.com

**NOTE** - This code example only shows the steps involved in creating and adding specific rights to a given license.

    // Create User Rights structure
    IPC_USER_RIGHTS ownerRightForOwner = {0};

    // Create rights
    LPCWSTR rgwszOwnerRights[1] = {IPC_GENERIC_ALL};

    // Assign values to members of Rights structure
    ownerRightForOwner.User.dwType = IPC_USER_TYPE_IPC;
    ownerRightForOwner.User.wszID = IPC_USER_ID_OWNER;
    ownerRightForOwner.rgwszRights = rgwszOwnerRights;
    ownerRightForOwner.cRights = 1;

    // Create User Rights structure for Joe with Read permissions
    IPC_USER_RIGHTS joeReadRight = {0};
    LPCWSTR rgwszReadRights[1] = {IPC_GENERIC_READ};

    // Assign values to members of Rights structure for Joe
    joeReadRight.User.dwType = IPC_USER_TYPE_EMAIL;
    joeReadRight.User.wszID = "joe@contoso.com";
    joeReadRight.rgwszRights = rgwszReadRights;
    joeReadRight.cRights = 1;

    // Create User Rights structure for Mary Kay with Full permissions
    IPC_USER_RIGHTS mary_kayFullRight = {0};
    LPCWSTR rgwszFullRights[1] = {IPC_GENERIC_ALL};

    // Assign values to members of Rights structure for Mary Kay
    mary_kayFullRight.User.dwType = IPC_USER_TYPE_EMAIL;
    mary_kayFullRight.User.wszID = L"mary_kay@contoso.com";
    mary_kayFullRight.rgwszRights = rgwszFullRights;
    mary_kayFullRight.cRights = 1;

    // Create User Rights List and assign the above rights
    size_t uNoOfUserRights = 3;
    PIPC_USER_RIGHTS_LIST pUserRightsList = NULL;
    pUserRightsList = reinterpret_cast<PIPC_USER_RIGHTS_LIST>
    (new BYTE[ sizeof(IPC_USER_RIGHTS_LIST) + uNoOfUserRights * sizeof(IPC_USER_RIGHTS)]);

    if(pUserRightsList == NULL)
    {
      // Handle error
    }

    // Assign values to members of Rights List structure for Joe and Mary Kay
    (*pUserRightsList).cbSize = sizeof(IPC_USER_RIGHTS_LIST);
    (*pUserRightsList).cUserRights = uNoOfUserRights;
    (*pUserRightsList).rgUserRights[0] = ownerRightForOwner;
    (*pUserRightsList).rgUserRights[1] = joeReadRight;
    (*pUserRightsList).rgUserRights[2] = mary_kayFullRight;

    // Set the Rights List property on the license via its handle
    // hLicense is a license handle created with IpcCreateLicenseFromScratch
    hr = IpcSetLicenseProperty(hLicense, FALSE, IPC_LI_USER_RIGHTS_LIST, pUserRightsList);

    if(FAILED(hr))
    {
      // Handle the error
    }



## Related topics

* [Developer notes](developer_notes.md)
* [**IpcCreateLicenseFromScratch**](xref:msipc.ipccreatelicensefromscratch)
* [**IpcSetLicenseProperty**](xref:msipc.ipcsetlicenseproperty)
 

 
