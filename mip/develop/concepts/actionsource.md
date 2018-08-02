# Action Source

## Summary 

In the MIP SDK the `ActionSource` indicates the source of the assigned label. The source is useful as it indicates whether the label was set by a human, either manually or through an accepted recommendation, if the label was applied by a rule or service (automatic), or if the user simply accepted the default.

## Action Source Values

`mip::ActionSource` is in enum that describes the following values:

- **Manual**
  - The user manually selected the label.
- **Automatic**
  - The label was automatically set by a policy condition.
- **Recommended**
  - The label was recommended by a policy condition and the user accepted that recommendation.
- **Default**
  - The user applied no label, and no policy conditions were satisfied and the default was applied.
- **Mandatory**
  - The user applied no label, no policy conditions were satisfied, and the document had no existing label, therefore the user was prompted to select a label due because mandatory labeling is enabled.

This value must be supplied when writing a new label, or updating an existing label, on any document.