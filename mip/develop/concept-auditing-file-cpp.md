# Auditing in the MIP SDK File API

The Azure Information Protection administration portal provides access to reports that give the administrator visibility in to which labels users are applying, manually or automatically, across any applications any services that have integrated the MIP SDK. Development partners using the SDK can easily enable this functionality so that information from their applications will surface in customer reports.

## Discovery Events

Audit events are submitted to the Azure Information Protection audit pipeline simply by setting the `AuditDiscoveryEnabled` parameter to true. Additionally, a content identifier that identifies the file in some human-readable format is provided. It's recommended to use the file path for this identifier.

The `CreateFileHandler()` method is called on the `mip::FileEngine` and `AuditDiscoveryEnabled` set to true. The example below creates a new `mip::FileHandler` with audit discovery enabled. The function will fire an audit event that indicates a `mip::FileHandler` for a specified *contentId* was created.

```cpp
auto handlerPromise = std::make_shared<std::promise<std::shared_ptr<FileHandler>>>();
auto handlerFuture = handlerPromise->get_future();
fileEngine->CreateFileHandlerAsync(filePath, contentId, mip::ContentState::REST, true /*AuditDiscoveryEnabled*/, make_shared<FileHandlerObserver>(), createFileHandlerPromise);
auto handler = handlerFuture.get();
```

## Commit Events

Once the application has committed an action to the file, the last step is to call `NotifyCommitSuccessful()` to submit metadata from the handler to the audit pipeline.

```cpp
// Create labeling options, set label
string contentId = "C:\users\billg\Documents\MyPlan.docx";
mip::LabelingOptions labelingOptions(mip::AssignmentMethod::PRIVILEGED, mip::ActionSource::MANUAL);
handler->SetLabel(labelId, labelingOptions);
auto commitPromise = std::make_shared<std::promise<bool>>();
auto commitFuture = commitPromise->get_future();

// CommitAsync() returns a bool. If the change was successful, call NotifyCommitSuccessful().
fileHandler->CommitAsync(outputFile, commitPromise);
if(commitFuture.get()) {

    // Submit audit event.
    handler->NotifyCommitSuccessful(contentId);
}
```

## Audit Dashboard

Events submitted to the Azure Information Protection audit pipeline will surface in reports. The client ID provided 

## Next Steps

For more details on the auditing experience in Azure Information Protection, take a look at the [preview announcement blog on Tech Community](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/Data-discovery-reporting-and-analytics-for-all-your-data-with/ba-p/253854).
