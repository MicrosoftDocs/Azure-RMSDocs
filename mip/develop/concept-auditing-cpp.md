# Auditing in the MIP SDK

## Summary

The Azure Information Protection administration portal provides access to reports that give the administrator visibilty in to which labels users are apply, manually or automatically, across any applications any services that have integrated the MIP SDK. Development partners leveraging the SDK can easily enable this functionality so that information from their applications will surface in customer reports.

### Auditing in File API

Audit events are submitted to the Azure Information Protection audit pipeline simply by setting the `AuditDiscoveryEnabled` parameter to true. Additionally, a content identifier that identifies the file in some human-readable format is provided. It's recommended to use the file path for this identifier.

The `CreateFileHandler()` method is called on the `mip::FileEngine` and `AuditDiscoveryEnabled` set to true. The result is that the file being read or updated by the handlers

```cpp
fileEngine->CreateFileHandlerAsync(filePath, filePath, contentState, true /*AuditDiscoveryEnabled*/, make_shared<FileHandlerObserver>(), createFileHandlerPromise); 
```

Because the File API works directly with files, there's no need to implement any specific behavior to surface audit events. Setting the **AuditDiscoveryEnabled** flag in `CreateFileHandlerAsync()` and then committing and changes via that handler will send the event to the audit pipeline. 

### Auditing in Policy API

Auditing in the Policy API is performed by setting a bool flag when creating the `mip::PolicyHandler` object via the `mip::PolicyEngine`. As seen in the example below, the value for **isAuditDiscoveryEnabled** is set to true. When the `mip::ExecutionState` is passed in to ComputeActions, that state will be sent through the audit pipeline, including details such as file name, content disposition, the user who performed the action, and justification for the action, if required.  

Review the `mip::ExecutionState` concepts documentation for more details on execution state.

```cpp
// Create PolicyHandler, passing in true for isAuditDiscoveryEnabled
auto handler = mEngine->CreatePolicyHandler(true);
auto actions = handler->ComputeActions(state);
```

In practice, the policy handler should be created with this field set to true only when it's desired that an audit event should be generated. Typically, this would be done when the file modification or data is persisted to storage.

For example, if you're building an application that exposes labels to a user, and the user clicks the label while working, **but doesn't save the file**, the `mip::PolicyHandler` should be created with **isAuditDiscoveryEnabled** set to `false`. When the user saves the active file, it's then desirable to generate an audit event. At that time, possibly as part of the save routine, the `mip::PolicyHandler` is created with **isAuditDiscoveryEnabled** set to `true`, then `mip::ProtectionHandler->ComputeActions()` is run with the provided execution state. The result is that the data surfaced as part of the execution state will land in the Azure Information Protection audit reports.

### Audit Dashboard

Events submitted to the Azure Information Protection audit pipeline will surface in reports. The value provided to `mip::ApplicationInfo.applicationName` will be displayed in the report

> Screenshot here