---
# required metadata

title: How to enable document tracking and revocation | Azure RMS
description: Basic guidance for implementing document tracking
keywords:
author: bruceperlerms
manager: mbaldwin
ms.date: 09/25/2016
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: F5089765-9D94-452B-85E0-00D22675D847
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:
experiment_id: "priyamo-test-20160729"

---

# How-to: enable document tracking and revocation

This topic covers the basic guidance for implementing document tracking of content as well as example code for metadata updates and for creating a [**Track Usage button**](#add-a-track-usage-button-to-your-app) for your app.

## Steps to implement document tracking

Steps 1 and 2 enable the document to be tracked. Step 3 enables your app users to reach the document tracking site in order to track and revoke your protected documents.

1. Add document tracking metadata
2. Register the document with the RMS service
3. Add Track Usage button to your app

The implementation details for these steps follow.

## 1. Add document tracking metadata

Document tracking is a feature of the Rights Management system. By adding specific metadata during the document protection process, a document can be registered with the tracking service portal which then provides several options for tracking.

Use these APIs to add/update a content license with document tracking metadata.


Operationally, only the **content name** and the **notification type** properties are required for document tracking.


- [IpcCreateLicenseMetadataHandle](/information-protection/sdk/2.1/api/win/functions#msipc_ipccreatelicensemetadatahandle)
- [IpcSetLicenseMetadataProperty](/information-protection/sdk/2.1/api/win/functions#msipc_ipcsetlicensemetadataproperty)

  We expect that you will set all of the metadata properties. Here they are, listed by type.

  For more information, see [License metadata property types](/information-protection/sdk/2.1/api/win/constants#msipc_license_metadata_property_types).

  - **IPC_MD_CONTENT_PATH**

    Use to identify the tracked document. In cases where a full path is not possible, just provide the file name.

  - **IPC_MD_CONTENT_NAME**

    Use to identify the tracked document name.

  - **IPC_MD_NOTIFICATION_TYPE**

    Use to specify when notification will be sent. For more information, see Notification type.

  - **IPC_MD_NOTIFICATION_PREFERENCE**

    Use to specify the type of notification. For more information, see Notification preference.

  - **IPC_MD_DATE_MODIFIED**

    We suggest that you set this date each time the user clicks Save.

  - **IPC_MD_DATE_CREATED**

    Use to set the origination date of the file

- [IpcSerializeLicenseWithMetadata](/information-protection/sdk/2.1/api/win/functions#msipc_ipcserializelicensemetadata)

Use the appropriate one of these APIs to add the metadata to your file or stream.

- [IpcfEncryptFileWithMetadata](/information-protection/sdk/2.1/api/win/functions#msipc_ipcfencryptfilewithmetadata)
- [IpcfEncryptFileStreamWithMetadata](/information-protection/sdk/2.1/api/win/functions#msipc_ipcfencryptfilestreamwithmetadata)

Lastly, use this API to register your tracked document with the tracking system.

- [IpcRegisterLicense](/information-protection/sdk/2.1/api/win/functions#msipc_ipcregisterlicense)


## 2. Register the document with the RMS service

Here's a code snippet showing an example of setting document tracking metadata and the call to register with the tracking system.

      C++
      HRESULT hr = S_OK;
      LPCWSTR wszOutputFile = NULL;
      wstring wszWorkingFile;
      IPC_LICENSE_METADATA md = {0};

      md.cbSize = sizeof(IPC_LICENSE_METADATA);
      md.dwNotificationType = IPCD_CT_NOTIFICATION_TYPE_ENABLED;
      md.dwNotificationPreference = IPCD_CT_NOTIFICATION_PREF_DIGEST;
      //file origination date, current time for this example
      md.ftDateCreated = GetCurrentTime();
      md.ftDateModified = GetCurrentTime();

      LOGSTATUS_EX(L"Encrypt file with official template...");

      hr =IpcfEncryptFileWithMetadata( wszWorkingFile.c_str(),
                               m_wszTestTemplateID.c_str(),
                               IPCF_EF_TEMPLATE_ID,
                               0,
                               NULL,
                               NULL,
                               &md,
                               &wszOutputFile);

     /* This will contain the serialized license */
     PIPC_BUFFER pSerializedLicense;

     /* the context to use for the call */
     PCIPC_PROMPT_CTX pContext;

     wstring wstrContentName(“MyDocument.txt”);
     bool sendLicenseRegistrationNotificationEmail = FALSE;

     hr = IpcRegisterLicense( pSerializedLicense,
                        0,
                        pContext,
                        wstrContentName.c_str(),
                        sendLicenseRegistrationNotificationEmail);

## Add a **Track Usage** button to your app

Adding a **Track Usage** UI item to your app is as simple as using one of the following URL formats:

- Using Content ID
  - Get the content ID by using [IpcGetLicenseProperty](/information-protection/sdk/2.1/api/win/functions#msipc_ipcgetlicenseproperty) or [IpcGetSerializedLicenseProperty](/information-protection/sdk/2.1/api/win/functions#msipc_ipcgetserializedlicenseproperty) if the license is serialized and use the license property **IPC_LI_CONTENT_ID**. For more information, see [License property types](/information-protection/sdk/2.1/api/win/constants#msipc_license_property_types).
  - With the **ContentId** and **Issuer** metadata, use the following format: `https://track.azurerms.com/#/{ContentId}/{Issuer}`

    Example - `https://track.azurerms.com/#/summary/05405df5-8ad6-4905-9f15-fc2ecbd8d0f7/janedoe@microsoft.com`

- If you don’t have access to that metadata (i.e. you are examining the unprotected version of the document), you can use the **Content_Name** in the following format: `https://track.azurerms.com/#/?q={ContentName}`

  Example - https://track.azurerms.com/#/?q=Secret!.txt

The client simply needs to open a browser with the appropriate URL. The RMS Document Tracking portal will handle authentication and any required redirection.

## Related topics

* [License metadata property types](/information-protection/sdk/2.1/api/win/constants#msipc_license_metadata_property_types)
* [Notification preference](/information-protection/sdk/2.1/api/win/constants#msipc_notification_preference)
* [Notification type](/information-protection/sdk/2.1/api/win/constants#msipc_notification_type)
* [IpcCreateLicenseMetadataHandle](/information-protection/sdk/2.1/api/win/functions#msipc_ipccreatelicensemetadatahandle)
* [IpcSetLicenseMetadataProperty](/information-protection/sdk/2.1/api/win/functions#msipc_ipcsetlicensemetadataproperty)
* [IpcSerializeLicenseWithMetadata](/information-protection/sdk/2.1/api/win/functions#msipc_ipcserializelicensemetadata)
* [IpcfEncryptFileWithMetadata](/information-protection/sdk/2.1/api/win/functions#msipc_ipcfencryptfilewithmetadata)
* [IpcfEncryptFileStreamWithMetadata](/information-protection/sdk/2.1/api/win/functions#msipc_ipcfencryptfilestreamwithmetadata)
* [IpcRegisterLicense](/information-protection/sdk/2.1/api/win/functions#msipc_ipcregisterlicense)

 
