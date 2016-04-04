Tracking content
=========================================================

\[Some information relates to pre-released product which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.\]

This topic covers basic guidance for implementing document tracking of content protected with Rights Management Services SDK 2.1.

Document tracking is a feature of the Rights Management system. By adding specific metadata during the document protection process, a document can be registered with the tracking service portal which then provides several options for tracking.

Use these APIs to add/update a content license with document tracking metadata.

-   [**IpcCreateLicenseMetadataHandle**](xref:msipc.ipccreatelicensemetadatahandle)
-   [**IpcSetLicenseMetadataProperty**](xref:msipc.ipcsetlicensemetadataproperty)

    We expect that you will set all of the metadata properties. Here they are, listed by type.

    For more information, see [**License metadata property types**](xref:msipc.license_metadata_property_types).

    -   **IPC\_MD\_CONTENT\_PATH**

        Use this to identify the tracked document. In cases where a full path is not possible, just provide the file name.

    -   **IPC\_MD\_CONTENT\_NAME**

        Use this to identify the tracked document name.

    -   **IPC\_MD\_NOTIFICATION\_TYPE**

        Use to specify when notification will be sent. For more information, see [**Notification type**](xref:msipc.notification_type).

    -   **IPC\_MD\_NOTIFICATION\_PREFERENCE**

        Use to specify the type of notification. For more information, see [**Notification preference**](xref:msipc.notification_preference).

    -   **IPC\_MD\_DATE\_MODIFIED**

        We suggest that you set this date each time the user clicks **Save**.

    -   **IPC\_MD\_DATE\_CREATED**

        The origination date of the file.

-   [**IpcSerializeLicenseWithMetadata**](xref:msipc.ipcserializelicensemetadata)

Use the appropriate one of these APIs to add the metadata to your file or stream.

-   [**IpcfEncryptFileWithMetadata**](xref:msipc.ipcfencryptfilewithmetadata)
-   [**IpcfEncryptFileStreamWithMetadata**](xref:msipc.ipcfencryptfilestreamwithmetadata)

Lastly, use this API to register your tracked document with the tracking system.

-   [**IpcRegisterLicense**](xref:msipc.ipcregisterlicense)

Here's a code snippet showing an example of setting document tracking metadata and the call to register with the tracking system.



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

    LOGSTATUS_EX(L&quot;Encrypt file with official template...&quot;);

    hr =IpcfEncryptFileWithMetadata(  wszWorkingFile.c_str(),
                                       m_wszTestTemplateID.c_str(),
                                       IPCF_EF_TEMPLATE_ID,
                                       0,
                                       NULL,
                                       NULL,
                                       &amp;md,
                                       &amp;wszOutputFile);

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


### Related topics


* [**License metadata property types**](xref:msipc.license_metadata_property_types)
* [**Notification preference**](xref:msipc.notification_preference)
* [**Notification type**](xref:msipc.notification_type)
* [**IpcCreateLicenseMetadataHandle**](xref:msipc.ipccreatelicensemetadatahandle)
* [**IpcSetLicenseMetadataProperty**](xref:msipc.ipcsetlicensemetadataproperty)
* [**IpcSerializeLicenseWithMetadata**](xref:msipc.ipcserializelicensemetadata)
* [**IpcfEncryptFileWithMetadata**](xref:msipc.ipcfencryptfilewithmetadata)
* [**IpcfEncryptFileStreamWithMetadata**](xref:msipc.ipcfencryptfilestreamwithmetadata)
* [**IpcRegisterLicense**](xref:msipc.ipcregisterlicense)
 

 
