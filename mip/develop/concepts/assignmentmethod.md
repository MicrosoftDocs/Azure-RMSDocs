# Assignment Method

## Summary 

In the MIP SDK the `AssignmentMethod` indicates the authority level of the assigned label. Labels set with a certain level of authority (by a human), cannot be overridden by an automated process, depending on how the application authors have written their code.


## Assignment Methods

- **Standard**
  - A label was applied by a rule or by a service using some logic.
  - Equivalent to the AIPv1 _Automatic_ method
- **Privileged**
  - A label was applied by a user taking an action.
  - Equivalent to the AIPv1 _Manual_ method
- **Auto**
  - New. Allows override of any existing label. Justification will still be required if downgrading.
  - Results in the document being labeled as _Standard_

The `AssignmentMethod` value determines the authority level of an action and by that, the authority level of the label that was created by that action. A label that was created when the method was set to _Privileged_, will be marked as privileged and can be changed by an action with method set to _Standard_ or _Auto_.
