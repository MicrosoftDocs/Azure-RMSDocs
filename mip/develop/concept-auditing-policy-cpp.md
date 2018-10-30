# Auditing in the MIP SDK

The Azure Information Protection administration portal provides access to reports that give the administrator visibility in to which labels users are applying, manually or automatically, across any applications any services that have integrated the MIP SDK. Development partners leveraging the SDK can easily enable this functionality so that information from their applications will surface in customer reports.

## Event Types

There are three types of events that can be submitted via the SDK to Azure Information Protection Analytics. **Heartbeat events**, **discovery events**, and **change events**

### Heartbeat Events

Heartbeat events are generated automatically for any application that has integrated the Policy API. Heartbeat events include:

* TenantId
* Time Generated
* User Principal Name
* Name of the machine where the audit was generated
* Process Name
* Platform
* Application Id - Corresponds to the Azure AD Application ID.

These events are useful in detecting applications across your enterprise that are using the Microsoft Information Protection SDK.

### Discovery Events

Discovery events provide information on labeled information that is read or consumed by the Policy API. These events are useful as they surface the devices, location, and users who are accessing information across an organization.

Discovery events are generated in the Policy API by setting a bool flag when creating the `mip::PolicyHandler` object via the `mip::PolicyEngine`. As seen in the example below, the value for **isAuditDiscoveryEnabled** is set to true. When the `mip::ExecutionState` is passed in to ComputeActions, with existing metadata information, that discovery information will be submitted to Azure Information Protection Analytics.  

Review the `mip::ExecutionState` concepts documentation for more details on execution state.

```cpp
// Create PolicyHandler, passing in true for isAuditDiscoveryEnabled
auto handler = mEngine->CreatePolicyHandler(true);

```

In practice, the policy handler should be created with this field set to true only when it's desired that an audit event should be generated. Typically, this would be done when the file modification or data is persisted to storage.

For example, if you're building an application that exposes labels to a user, and the user clicks the label while working, **but doesn't save the file**, the `mip::PolicyHandler` should be created with **isAuditDiscoveryEnabled** set to `false`. When the user saves the active file, it's then desirable to generate an audit event. At that time, possibly as part of the save routine, the `mip::PolicyHandler` is created with **isAuditDiscoveryEnabled** set to `true`, then `mip::ProtectionHandler->ComputeActions()` is run with the provided execution state. The result is that the data surfaced as part of the execution state will land in the Azure Information Protection audit reports.

## Change Event

```cpp
auto actions = handler->ComputeActions(state);
handler->NotifyCommittedActions(*state);
```

## Audit Dashboard

Events submitted to the Azure Information Protection audit pipeline will surface in reports at https://portal.azure.com. Azure Information Protection Analytics is in public preview and features/functionality are subject to change.

## Next Steps

For more details on the auditing experience in Azure Information Protection, take a look at the [preview announcement blog on Tech Community](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/Data-discovery-reporting-and-analytics-for-all-your-data-with/ba-p/253854).

