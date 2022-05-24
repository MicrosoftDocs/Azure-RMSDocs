---
title: MIP SDK for C Reference
description: MIP SDK for C Reference
author: msmbaldwin
ms.service: information-protection
ms.topic: reference

ms.author: mbaldwin
ms.date: 9/22/2020
---

# MIP SDK for C Reference

The Microsoft Purview Information Protection SDK for C allows developers to manage and apply data protection policies to data and other digital assets.

The MIP SDK for C includes

- [Enumerations](enumerations.md)
- [Structures](structures.md)
- The following functions:

Function | Brief description |
|---|---|
| [mip_cc_auth_callback](functions.md#mip_cc_auth_callback) | callback function definition for acquiring OAuth2 token |
| [mip_cc_consent_callback](functions.md#mip_cc_consent_callback) | callback function definition for consent from user to access external service endpoint |
| [MIP_CC_CreateDictionary](functions.md#mip_cc_createdictionary) | Create a dictionary of string keys/values |
| [MIP_CC_Dictionary_GetEntries](functions.md#mip_cc_dictionary_getentries) | Get key/value pairs that compose a dictionary |
| [MIP_CC_ReleaseDictionary](functions.md#mip_cc_releasedictionary) | Release resources associated with a dictionary |
| [mip_cc_http_send_callback_fn](functions.md#mip_cc_http_send_callback_fn) | Callback function definition for issuing an HTTP request |
| [mip_cc_http_cancel_callback_fn](functions.md#mip_cc_http_cancel_callback_fn) | Callback function definition for cancelling an HTTP request |
| [MIP_CC_CreateHttpDelegate](functions.md#mip_cc_createhttpdelegate) | Creates an HTTP delegate which can be used to override MIP's default HTTP stack |
| [MIP_CC_NotifyHttpDelegateResponse](functions.md#mip_cc_notifyhttpdelegateresponse) | Notifies an HTTP delegate that an HTTP response is ready |
| [MIP_CC_ReleaseHttpDelegate](functions.md#mip_cc_releasehttpdelegate) | Release resources associated with an HTTP delegate handle |
| [mip_cc_logger_init_callback_fn](functions.md#mip_cc_logger_init_callback_fn) | Callback function definition for initialization of logger |
| [mip_cc_logger_write_callback_fn](functions.md#mip_cc_logger_write_callback_fn) | Callback function definition for writing a log statement |
| [MIP_CC_CreateLoggerDelegate](functions.md#mip_cc_createloggerdelegate) | Creates a logger delegate which can be used to override MIP's default logger |
| [MIP_CC_ReleaseLoggerDelegate](functions.md#mip_cc_releaseloggerdelegate) | Release resources associated with an logger delegate handle |
| [MIP_CC_CreateMipContext](functions.md#mip_cc_createmipcontext) | Create a MIP context to manage state shared across all profile instances |
| [MIP_CC_CreateMipContextWithCustomFeatureSettings](functions.md#mip_cc_createmipcontextwithcustomfeaturesettings) | Create a MIP context to manage state shared across all profile instances |
| [MIP_CC_ReleaseMipContext](functions.md#mip_cc_releasemipcontext) | Release resources associated with a MIP context |
| [MIP_CC_ProtectionDescriptor_GetProtectionType](functions.md#mip_cc_protectiondescriptor_getprotectiontype) | Gets type of protection, whether it is defined by an RMS template or not |
| [MIP_CC_ProtectionDescriptor_GetOwnerSize](functions.md#mip_cc_protectiondescriptor_getownersize) | Gets size of buffer required to store owner |
| [MIP_CC_ProtectionDescriptor_GetOwner](functions.md#mip_cc_protectiondescriptor_getowner) | Gets protection owner |
| [MIP_CC_ProtectionDescriptor_GetNameSize](functions.md#mip_cc_protectiondescriptor_getnamesize) | Gets size of buffer required to store name |
| [MIP_CC_ProtectionDescriptor_GetName](functions.md#mip_cc_protectiondescriptor_getname) | Gets protection name |
| [MIP_CC_ProtectionDescriptor_GetDescriptionSize](functions.md#mip_cc_protectiondescriptor_getdescriptionsize) | Gets size of buffer required to store description |
| [MIP_CC_ProtectionDescriptor_GetDescription](functions.md#mip_cc_protectiondescriptor_getdescription) | Gets protection description |
| [MIP_CC_ProtectionDescriptor_GetTemplateId](functions.md#mip_cc_protectiondescriptor_gettemplateid) | Gets template ID |
| [MIP_CC_ProtectionDescriptor_GetLabelId](functions.md#mip_cc_protectiondescriptor_getlabelid) | Gets label ID |
| [MIP_CC_ProtectionDescriptor_GetContentId](functions.md#mip_cc_protectiondescriptor_getcontentid) | Gets content ID |
| [MIP_CC_ProtectionDescriptor_DoesContentExpire](functions.md#mip_cc_protectiondescriptor_doescontentexpire) | Gets whether or not content has an expiration time or not |
| [MIP_CC_ProtectionDescriptor_GetContentValidUntil](functions.md#mip_cc_protectiondescriptor_getcontentvaliduntil) | Gets protection expiration time (in seconds since epoch) |
| [MIP_CC_ProtectionDescriptor_DoesAllowOfflineAccess](functions.md#mip_cc_protectiondescriptor_doesallowofflineaccess) | Gets whether or not offline access is allowed |
| [MIP_CC_ProtectionDescriptor_GetReferrerSize](functions.md#mip_cc_protectiondescriptor_getreferrersize) | Gets size of buffer required to store referrer |
| [MIP_CC_ProtectionDescriptor_GetReferrer](functions.md#mip_cc_protectiondescriptor_getreferrer) | Gets protection referrer |
| [MIP_CC_ProtectionDescriptor_GetDoubleKeyUrlSize](functions.md#mip_cc_protectiondescriptor_getdoublekeyurlsize) | Gets size of buffer required to store double key URL |
| [MIP_CC_ProtectionDescriptor_GetDoubleKeyUrl](functions.md#mip_cc_protectiondescriptor_getdoublekeyurl) | Gets double key URL |
| [MIP_CC_ReleaseProtectionDescriptor](functions.md#mip_cc_releaseprotectiondescriptor) | Release resources associated with a protection descriptor |
| [MIP_CC_CreateStringList](functions.md#mip_cc_createstringlist) | Create a string list |
| [MIP_CC_StringList_GetStrings](functions.md#mip_cc_stringlist_getstrings) | Get strings that compose a string list |
| [MIP_CC_ReleaseStringList](functions.md#mip_cc_releasestringlist) | Release resources associated with a string list |
| [mip_cc_dispatch_task_callback_fn](functions.md#mip_cc_dispatch_task_callback_fn) | Callback function definition for dispatching an async task |
| [mip_cc_cancel_task_callback_fn](functions.md#mip_cc_cancel_task_callback_fn) | Callback function for canceling a background tasks |
| [MIP_CC_CreateTaskDispatcherDelegate](functions.md#mip_cc_createtaskdispatcherdelegate) | Creates a task dispatcher delegate which can be used to override MIP's default async task handling |
| [MIP_CC_ExecuteDispatchedTask](functions.md#mip_cc_executedispatchedtask) | Notifies a TaskDispatcher delegate that a task is scheduled to execute now on the current thread |
| [MIP_CC_ReleaseTaskDispatcherDelegate](functions.md#mip_cc_releasetaskdispatcherdelegate) | Release resources associated with an task dispatcher delegate handle |
| [MIP_CC_CreateTelemetryConfiguration](functions.md#mip_cc_createtelemetryconfiguration) | Create a settings object used to create a protection profile |
| [MIP_CC_TelemetryConfiguration_SetHostName](functions.md#mip_cc_telemetryconfiguration_sethostname) | Set a telemetry host name which will override internal telemetry settings |
| [MIP_CC_TelemetryConfiguration_SetLibraryName](functions.md#mip_cc_telemetryconfiguration_setlibraryname) | Set a telemetry shared library override |
| [MIP_CC_TelemetryConfiguration_SetHttpDelegate](functions.md#mip_cc_telemetryconfiguration_sethttpdelegate) | Override default telemetry HTTP stack with client's own |
| [MIP_CC_TelemetryConfiguration_SetTaskDispatcherDelegate](functions.md#mip_cc_telemetryconfiguration_settaskdispatcherdelegate) | Override default async task dispatcher with client's own |
| [MIP_CC_TelemetryConfiguration_SetIsNetworkDetectionEnabled](functions.md#mip_cc_telemetryconfiguration_setisnetworkdetectionenabled) | Sets whether or not the telemetry component is allowed ping network status on a background thread |
| [MIP_CC_TelemetryConfiguration_SetIsLocalCachingEnabled](functions.md#mip_cc_telemetryconfiguration_setislocalcachingenabled) | Sets whether or not the telemetry component is allowed to write caches to disk |
| [MIP_CC_TelemetryConfiguration_SetIsTraceLoggingEnabled](functions.md#mip_cc_telemetryconfiguration_setistraceloggingenabled) | Sets whether or not the telemetry component is allowed to write logs to disk |
| [MIP_CC_TelemetryConfiguration_SetIsTelemetryOptedOut](functions.md#mip_cc_telemetryconfiguration_setistelemetryoptedout) | Sets whether or not an application/user has opted out of optional telemetry |
| [MIP_CC_TelemetryConfiguration_SetCustomSettings](functions.md#mip_cc_telemetryconfiguration_setcustomsettings) | Sets custom telemetry settings |
| [MIP_CC_TelemetryConfiguration_AddMaskedProperty](functions.md#mip_cc_telemetryconfiguration_addmaskedproperty) | Sets a telemetry property to mask |
| [MIP_CC_ReleaseTelemetryConfiguration](functions.md#mip_cc_releasetelemetryconfiguration) | Release resources associated with a protection profile settings |
| [MIP_CC_TemplateDescriptor_GetId](functions.md#mip_cc_templatedescriptor_getid) | Gets template ID |
| [MIP_CC_TemplateDescriptor_GetNameSize](functions.md#mip_cc_templatedescriptor_getnamesize) | Gets size of buffer required to store name |
| [MIP_CC_TemplateDescriptor_GetName](functions.md#mip_cc_templatedescriptor_getname) | Gets Template name |
| [MIP_CC_TemplateDescriptor_GetDescriptionSize](functions.md#mip_cc_templatedescriptor_getdescriptionsize) | Gets size of buffer required to store description |
| [MIP_CC_TemplateDescriptor_GetDescription](functions.md#mip_cc_templatedescriptor_getdescription) | Gets Template description |
| [MIP_CC_ReleaseTemplateDescriptor](functions.md#mip_cc_releasetemplatedescriptor) | Release resources associated with a template descriptor |
| [MIP_CC_ActionResult_GetActions](functions.md#mip_cc_actionresult_getactions) | Get actions that compose an action result |
| [MIP_CC_ReleaseActionResult](functions.md#mip_cc_releaseactionresult) | Release resources associated with an action result |
| [MIP_CC_AddContentFooterAction_GetUIElementNameSize](functions.md#mip_cc_addcontentfooteraction_getuielementnamesize) | Gets size of buffer required to store an "add content footer" action's UI element name |
| [MIP_CC_AddContentFooterAction_GetUIElementName](functions.md#mip_cc_addcontentfooteraction_getuielementname) | Gets an "add content footer" action's UI element name |
| [MIP_CC_AddContentFooterAction_GetTextSize](functions.md#mip_cc_addcontentfooteraction_gettextsize) | Gets size of buffer required to store an "add content footer" action's text |
| [MIP_CC_AddContentFooterAction_GetText](functions.md#mip_cc_addcontentfooteraction_gettext) | Gets an "add content footer" action's text |
| [MIP_CC_AddContentFooterAction_GetFontNameSize](functions.md#mip_cc_addcontentfooteraction_getfontnamesize) | Gets size of buffer required to store an "add content footer" action's font name |
| [MIP_CC_AddContentFooterAction_GetFontName](functions.md#mip_cc_addcontentfooteraction_getfontname) | Gets an "add content footer" action's font name |
| [MIP_CC_AddContentFooterAction_GetFontSize](functions.md#mip_cc_addcontentfooteraction_getfontsize) | Gets the integer font size |
| [MIP_CC_AddContentFooterAction_GetFontColorSize](functions.md#mip_cc_addcontentfooteraction_getfontcolorsize) | Gets size of buffer required to store an "add content footer" action's font color |
| [MIP_CC_AddContentFooterAction_GetFontColor](functions.md#mip_cc_addcontentfooteraction_getfontcolor) | Gets an "add content footer" action's font color (for example, "#000000") |
| [MIP_CC_AddContentFooterAction_GetAlignment](functions.md#mip_cc_addcontentfooteraction_getalignment) | Gets the alignment |
| [MIP_CC_AddContentFooterAction_GetMargin](functions.md#mip_cc_addcontentfooteraction_getmargin) | Gets the margin size |
| [MIP_CC_AddContentHeaderAction_GetUIElementNameSize](functions.md#mip_cc_addcontentheaderaction_getuielementnamesize) | Gets size of buffer required to store an "add content header" action's UI element name |
| [MIP_CC_AddContentHeaderAction_GetUIElementName](functions.md#mip_cc_addcontentheaderaction_getuielementname) | Gets an "add content header" action's UI element name |
| [MIP_CC_AddContentHeaderAction_GetTextSize](functions.md#mip_cc_addcontentheaderaction_gettextsize) | Gets size of buffer required to store an "add content header" action's text |
| [MIP_CC_AddContentHeaderAction_GetText](functions.md#mip_cc_addcontentheaderaction_gettext) | Gets an "add content header" action's text |
| [MIP_CC_AddContentHeaderAction_GetFontNameSize](functions.md#mip_cc_addcontentheaderaction_getfontnamesize) | Gets size of buffer required to store an "add content header" action's font name |
| [MIP_CC_AddContentHeaderAction_GetFontName](functions.md#mip_cc_addcontentheaderaction_getfontname) | Gets an "add content header" action's font name |
| [MIP_CC_AddContentHeaderAction_GetFontSize](functions.md#mip_cc_addcontentheaderaction_getfontsize) | Gets the integer font size |
| [MIP_CC_AddContentHeaderAction_GetFontColorSize](functions.md#mip_cc_addcontentheaderaction_getfontcolorsize) | Gets size of buffer required to store an "add content header" action's font color |
| [MIP_CC_AddContentHeaderAction_GetFontColor](functions.md#mip_cc_addcontentheaderaction_getfontcolor) | Gets an "add content header" action's font color (for example, "#000000") |
| [MIP_CC_AddContentHeaderAction_GetAlignment](functions.md#mip_cc_addcontentheaderaction_getalignment) | Gets the alignment |
| [MIP_CC_AddContentHeaderAction_GetMargin](functions.md#mip_cc_addcontentheaderaction_getmargin) | Gets the margin size |
| [MIP_CC_AddWatermarkAction_GetUIElementNameSize](functions.md#mip_cc_addwatermarkaction_getuielementnamesize) | Gets size of buffer required to store an "add watermark" action's UI element name |
| [MIP_CC_AddWatermarkAction_GetUIElementName](functions.md#mip_cc_addwatermarkaction_getuielementname) | Gets an "add watermark" action's UI element name |
| [MIP_CC_AddWatermarkAction_GetLayout](functions.md#mip_cc_addwatermarkaction_getlayout) | Gets the watermark layout |
| [MIP_CC_AddWatermarkAction_GetTextSize](functions.md#mip_cc_addwatermarkaction_gettextsize) | Gets size of buffer required to store an "add watermark" action's text |
| [MIP_CC_AddWatermarkAction_GetText](functions.md#mip_cc_addwatermarkaction_gettext) | Gets an "add watermark" action's text |
| [MIP_CC_AddWatermarkAction_GetFontNameSize](functions.md#mip_cc_addwatermarkaction_getfontnamesize) | Gets size of buffer required to store an "add watermark" action's font name |
| [MIP_CC_AddWatermarkAction_GetFontName](functions.md#mip_cc_addwatermarkaction_getfontname) | Gets an "add watermark" action's font name |
| [MIP_CC_AddWatermarkAction_GetFontSize](functions.md#mip_cc_addwatermarkaction_getfontsize) | Gets the integer font size |
| [MIP_CC_AddWatermarkAction_GetFontColorSize](functions.md#mip_cc_addwatermarkaction_getfontcolorsize) | Gets size of buffer required to store an "add watermark" action's font color |
| [MIP_CC_AddWatermarkAction_GetFontColor](functions.md#mip_cc_addwatermarkaction_getfontcolor) | Gets an "add watermark" action's font color (for example, "#000000") |
| [MIP_CC_ReleaseContentLabel](functions.md#mip_cc_releasecontentlabel) | Release resources associated with a content label |
| [MIP_CC_ContentLabel_GetCreationTime](functions.md#mip_cc_contentlabel_getcreationtime) | Gets time when label was applied |
| [MIP_CC_ContentLabel_GetAssignmentMethod](functions.md#mip_cc_contentlabel_getassignmentmethod) | Gets label assignment method |
| [MIP_CC_ContentLabel_GetExtendedProperties](functions.md#mip_cc_contentlabel_getextendedproperties) | Gets extended properties |
| [MIP_CC_ContentLabel_IsProtectionAppliedFromLabel](functions.md#mip_cc_contentlabel_isprotectionappliedfromlabel) | Gets whether or not a protection was applied by a label. |
| [MIP_CC_ContentLabel_GetLabel](functions.md#mip_cc_contentlabel_getlabel) | Gets generic label properties from a content label instance |
| [MIP_CC_CustomAction_GetNameSize](functions.md#mip_cc_customaction_getnamesize) | Gets size of buffer required to store a "custom" action's name |
| [MIP_CC_CustomAction_GetName](functions.md#mip_cc_customaction_getname) | Gets a "custom" action's name |
| [MIP_CC_CustomAction_GetProperties](functions.md#mip_cc_customaction_getproperties) | Gets a "custom" action's properties |
| [MIP_CC_ReleaseLabel](functions.md#mip_cc_releaselabel) | Release resources associated with a label |
| [MIP_CC_Label_GetId](functions.md#mip_cc_label_getid) | Gets label ID |
| [MIP_CC_Label_GetNameSize](functions.md#mip_cc_label_getnamesize) | Gets size of buffer required to store name |
| [MIP_CC_Label_GetName](functions.md#mip_cc_label_getname) | Gets label name |
| [MIP_CC_Label_GetDescriptionSize](functions.md#mip_cc_label_getdescriptionsize) | Gets size of buffer required to store description |
| [MIP_CC_Label_GetDescription](functions.md#mip_cc_label_getdescription) | Gets label description |
| [MIP_CC_Label_GetColorSize](functions.md#mip_cc_label_getcolorsize) | Gets size of buffer required to store color |
| [MIP_CC_Label_GetColor](functions.md#mip_cc_label_getcolor) | Gets label color |
| [MIP_CC_Label_GetSensitivity](functions.md#mip_cc_label_getsensitivity) | Gets sensitivity level of label. Higher value means more sensitive. |
| [MIP_CC_Label_GetTooltipSize](functions.md#mip_cc_label_gettooltipsize) | Gets size of buffer required to store tooltip |
| [MIP_CC_Label_GetTooltip](functions.md#mip_cc_label_gettooltip) | Gets label tooltip |
| [MIP_CC_Label_GetAutoTooltipSize](functions.md#mip_cc_label_getautotooltipsize) | Gets size of buffer required to store auto-classification tooltip |
| [MIP_CC_Label_GetAutoTooltip](functions.md#mip_cc_label_getautotooltip) | Gets label auto-classification tooltip |
| [MIP_CC_Label_IsActive](functions.md#mip_cc_label_isactive) | Gets whether or not a label is active |
| [MIP_CC_Label_GetParent](functions.md#mip_cc_label_getparent) | Gets the parent label, if any |
| [MIP_CC_Label_GetChildrenSize](functions.md#mip_cc_label_getchildrensize) | Gets the number of children labels |
| [MIP_CC_Label_GetChildren](functions.md#mip_cc_label_getchildren) | Gets the children labels |
| [MIP_CC_Label_GetCustomSettings](functions.md#mip_cc_label_getcustomsettings) | Gets policy-defined custom settings of a label |
| [MIP_CC_MetadataAction_GetMetadataToRemove](functions.md#mip_cc_metadataaction_getmetadatatoremove) | Gets a "metadata" action's metadata to remove |
| [MIP_CC_MetadataAction_GetMetadataToAdd](functions.md#mip_cc_metadataaction_getmetadatatoadd) | Gets a "metadata" action's metadata to add |
| [MIP_CC_CreateMetadataDictionary](functions.md#mip_cc_createmetadatadictionary) | Create a dictionary of string keys/values |
| [MIP_CC_MetadataDictionary_GetEntries](functions.md#mip_cc_metadatadictionary_getentries) | Get metadata entries that compose a dictionary |
| [MIP_CC_ReleaseMetadataDictionary](functions.md#mip_cc_releasemetadatadictionary) | Release resources associated with a dictionary |
| [MIP_CC_ReleasePolicyHandler](functions.md#mip_cc_releasepolicyhandler) | Release resources associated with a policy handler |
| [MIP_CC_PolicyHandler_GetSensitivityLabel](functions.md#mip_cc_policyhandler_getsensitivitylabel) | Gets a document's current label |
| [MIP_CC_PolicyHandler_ComputeActions](functions.md#mip_cc_policyhandler_computeactions) | Executes policy rules based on the provided state and determines corresponding actions |
| [MIP_CC_PolicyHandler_NotifyCommittedActions](functions.md#mip_cc_policyhandler_notifycommittedactions) | Called by application after computed actions have been applied and data committed to disk |
| [MIP_CC_ProtectAdhocDkAction_GetDoubleKeyEncryptionUrlSize](functions.md#mip_cc_protectadhocdkaction_getdoublekeyencryptionurlsize) | Gets size of buffer required to store the double key encryption url. |
| [MIP_CC_ProtectAdhocDkAction_GetDoubleKeyEncryptionUrl](functions.md#mip_cc_protectadhocdkaction_getdoublekeyencryptionurl) | Gets double key encryption url |
| [MIP_CC_ProtectDoNotForwardDkAction_GetDoubleKeyEncryptionUrlSize](functions.md#mip_cc_protectdonotforwarddkaction_getdoublekeyencryptionurlsize) | Gets size of buffer required to store the double key encryption url. |
| [MIP_CC_ProtectDoNotForwardDkAction_GetDoubleKeyEncryptionUrl](functions.md#mip_cc_protectdonotforwarddkaction_getdoublekeyencryptionurl) | Gets double key encryption url |
| [MIP_CC_RemoveContentFooterAction_GetUIElementNames](functions.md#mip_cc_removecontentfooteraction_getuielementnames) | Gets a "remove content footer" action's UI element names to remove |
| [MIP_CC_RemoveContentHeaderAction_GetUIElementNames](functions.md#mip_cc_removecontentheaderaction_getuielementnames) | Gets a "remove content header" action's UI element names to remove |
| [MIP_CC_RemoveWatermarkAction_GetUIElementNames](functions.md#mip_cc_removewatermarkaction_getuielementnames) | Gets a "remove watermark" action's UI element names to remove |
| [MIP_CC_ReleaseSensitivityType](functions.md#mip_cc_releasesensitivitytype) | Release resources associated with a sensitivity type |
| [MIP_CC_SensitivityType_GetRulePackageIdSize](functions.md#mip_cc_sensitivitytype_getrulepackageidsize) | Gets size of buffer required to store a sensitivity type's rule package ID |
| [MIP_CC_SensitivityType_GetRulePackageId](functions.md#mip_cc_sensitivitytype_getrulepackageid) | Gets a sensitivity type's rule package ID |
| [MIP_CC_SensitivityType_GetRulePackageSize](functions.md#mip_cc_sensitivitytype_getrulepackagesize) | Gets size of buffer required to store a sensitivity type's rule package |
| [MIP_CC_SensitivityType_GetRulePackage](functions.md#mip_cc_sensitivitytype_getrulepackage) | Gets a sensitivity type's rule package |
