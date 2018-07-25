# Policy API Actions

## Summary

The MIP SDK Policy API exposes an `Action` class that describes the action or actions that an application should perform when a label is selected. 

`mip::PolicyEngine::ComputeActions()`, using `mip::ExecutionState` calculates the set of actions that should be taken. Available action types are described by `mip::ActionType` and map to a specific derived `Action` class.

## Action Types and Classes

Obtaining the action metadata from each returned mip::Action requires that the `mip::ActionType` is read from the object and then that the object is cast in to the corresponding derived class. The map of mip::ActionType to derived class is below.

| mip::ActionType        | Class                          | Description                                                                                                                                   |
|------------------------|--------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| ADD_CONTENT_FOOTER     | mip::AddContentFooterAction    | Specifies a content footer to be added to the document.                                                                                       |
| ADD_CONTENT_HEADER     | mip::AddContentHeaderAction    | Specifies a content header to be added to the document                                                                                        |
| ADD_WATERMARK          | mip::AddWatermarkAction        | Specifices a watermark to be added to the document.                                                                                           |
| CUSTOM                 | mip::CustomAction              | A generic action class. More details [here](https://docs.microsoft.com/en-us/azure/information-protection/develop/mip/class_mip_customaction) |
| JUSTIFY                | mip::JustifyAction             | Requires providing a justification to downgrade label.                                                                                        |
| METADATA               | mip::MetadataAction            | Specifies metadata to be added to the document.                                                                                               |
| PROTECT_ADHOC          | mip::ProtectAdhocAction        | Specifies ad-hoc protection to be added to the document.                                                                                      |
| PROTECT_BY_TEMPLATE    | mip::ProtectByTemplateAction   | Specifies template protection to be added to the document.                                                                                    |
| PROTECT_DO_NOT_FORWARD | mip::ProtectDoNotForwardAction | Specifies Do Not Forward protection to be added to the email.                                                                                 |
| REMOVE_CONTENT_FOOTER  | mip::RemoveContentFooterAction | Specifies a content footer to be removed from the document.                                                                                   |
| REMOVE_CONTENT_HEADER  | mip::RemoveContentHeaderAction | Specifies a content header to be removed from the document.                                                                                   |
| REMOVE_PROTECTION      | mip::RemoveProtectionAction    | Specifies that protection should be removed from the document.                                                                                |
| REMOVE_WATERMARK       | mip::RemoveWatermarkAction     | Specifies a watermark to be removed from the document.                                                                                        |
| APPLY_LABEL            | mip::ApplyLabelAction          | Specifies that the calling application should apply a specific label.                                                                         |
| RECOMMEND_LABEL        | mip::RecommendLabelAction      | Specifies that the calling application should suggest a specific label.                                                                       |

## Computing an Action

Computing an action requires the following:

- A `mip::Profile` has been created.
- A `mip::PolicyEngine` has been added to the `Profile`
- The `mip::ExecutionState` abstract class has been implemented, with `ExecutionStateOptions` struct.
- The `mip::ProtectionDescriptor` class has been implemented

With these items in place, the collection of actions can be obtained by:

```cpp
sample::policy::ExecutionStateOptions options; //Custom struct to store option to pass to ExecutionStateImpl constructor
options.newLabelId = "d7b93a40-4df3-47e4-b2fd-7862fc6b095c"; //hard coded GUID for demo. LabelID must be valid. 

std::unique_ptr<ExecutionStateImpl> state;

state.reset(new ExecutionStateImpl(options));       //Construct ExecutionStateImpl from ExecutionStateOptions.
auto actions = mEngine->ComputeActions(*state);     //Compute actions from execution state
```

The snip above will result in the SDK computing the actions for the provided label ID.

## Iterating through the set of Actions

Now that the collection of mip::Actions has been obtained, we can iterate through and cast each to the specific derived class.

```cpp
//Foreach mip::Action in std::vector<std::shared_ptr<mip::Action>> object
for (const auto action : actions )
{
    //Get the "type" for the action
    switch(action->GetType())
    {
        
    case mip::ActionType::METADATA: {
        //Cast mip::Action to mip::MetadataAction
        auto derivedAction = static_cast<mip::MetadataAction*>(action.get());

        //Get metadata and print
        for (const std::pair<std::string, std::string>& prop : derivedAction->GetMetadataToAdd())
        {
            cout << prop.first << " : " << prop.second << endl;
        }
        break;
    }

    case mip::ActionType::PROTECT_BY_TEMPLATE: {
        //Cast mip::Action to mip::ProtectbyTemplateAction
        auto derivedAction = static_cast<mip::ProtectByTemplateAction*>(action.get());

        //Print template ID
        cout << "TemplateId: " << derivedAction->GetTemplateId() << endl;
        break;
    }

    //TODO: Implement case statements for other mip::ActionType actions

    default:
    {
        //Implement default
    }
    }
}