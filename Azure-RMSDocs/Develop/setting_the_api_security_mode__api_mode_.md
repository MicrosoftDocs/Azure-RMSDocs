Setting the API security mode
==============================================================================================

You can choose which security mode your File API application runs in by using the [**IpcSetGlobalProperty**](xref:msipc.ipcsetglobalproperty) function.

To initialize your application to run in *server mode*, call the [**IpcSetGlobalProperty**](xref:msipc.ipcsetglobalproperty) function and set the security mode to [**IPC\_API\_MODE\_SERVER**](xref:msipc.api_mode_values). By default, your application will run in *client mode*, **IPC\_API\_MODE\_CLIENT**.

For more information on *server mode*, see [Application types](application_types.md).

**Important**  The security mode should be set before any other Rights Management Services SDK 2.1 function is called. After the security mode has been set, it cannot be changed for the current process.

 

<span id="related_topics"></span>Related topics
-----------------------------------------------

* [Application types](application_types.md)
* [Developer concepts](ad_rms_concepts-nav.md)
* [**API mode values**](xref:msipc.api_mode_values)
* [**IpcSetGlobalProperty**](xref:msipc.ipcsetglobalproperty)
 

 



