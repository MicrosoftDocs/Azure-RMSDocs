# How to: Use built-in rights #

This topic outlines the built-in rights that the Microsoft Rights Management SDK 4.2 provides and usage restrictions that an app should enforce in honoring those restrictions. The following shows the built-in rights; common rights, editable document rights and email rights follwed by a description and their values by operating system.

**Note** - For the Linux SDK, see the *rights.h* source file for details.

## Common Rights ##

**All** - A collection of all common rights.
- Android: [CommonRights.All](xref:msipcthin2.commonrights_class_java.ALL)
- iOS and OS X: [MSCommonRights owner](xref:msipcthin2.mscommonrights_interface_objc)
- Windows Store and Windows Phone: [CommonRights.All</strong>](xref:msipcthin2.commonrights_all)
- Linux: [CommonRights::All](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1CommonRights.html)

** Owner** - The Owner right grants full control over the protected content.
- Android: [<strong>CommonRights.Owner](xref:msipcthin2.commonrights_class_java.Owner)
- iOS and OS X: [MSCommonRights owner](xref:msipcthin2.mscommonrights_interface_objc)
- Windows Store and Windows Phone: [CommonRights.Owner](xref:msipcthin2.commonrights_owner)
- Linux: [CommonRights::Owner](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1CommonRights.html)

**View** - The right to view protected content. Typically, when this right is granted, the application enables the user to open and view protected content; however, additional rights are required to modify, extract, forward, or save the content.

- Android: [CommonRights.View](xref:msipcthin2.commonrights_class_java.View)
- iOS and OS X: [MSCommonRights view](xref:msipcthin2.mscommonrights_interface_objc)
- Windows Store and Windows Phone: [CommonRights.View](xref:msipcthin2.commonrights_view)
- Linux: [CommonRights::View](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1CommonRights.html)</li>

 

## Editable Document Rights ##
**All** - A collection that contains all of the editable document rights.
- Android:[EditableDocumentRights.All](xref:msipcthin2.editabledocumentrights_class_java.ALL)
- iOS and OS X: [MSEditableDocumentRights all](xref:msipcthin2.mseditabledocumentrights_interface_objc)
- Windows Store and Windows Phone: [EditableDocumentRights.All](xref:msipcthin2.editabledocumentrights_all)
- Linux: [EditableDocumentRights::All](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EditableDocumentRights.html)

**Comment** - The right to make comments on the document.
- Android: [EditableDocumentRights.Comment](xref:msipcthin2.editabledocumentrights_class_java.Comment)
- iOS and OS X: [MSEditableDocumentRights comment](xref:msipcthin2.mseditabledocumentrights_interface_objc)
- Windows Store and Windows Phone: [EditableDocumentRights.Comment](xref:msipcthin2.editabledocumentrights__comment)
- Linux: [EditableDocumentRights::Comment](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EditableDocumentRights.html)

**Edit** - The right to edit protected content and save it in the same protected format. Typically, when this right is granted, the app enables the user to change protected content and then save it to the same file.
- Android: [EditableDocumentRights.Edit](xref:msipcthin2.editabledocumentrights_class_java.Edit)
- iOS and OS X: [MSEditableDocumentRights edit](xref:msipcthin2.mseditabledocumentrights_interface_objc)
- Windows Store and Windows Phone: [EditableDocumentRights.Edit](xref:msipcthin2.editabledocumentrights_edit)
- Linux: [EditableDocumentRights::Edit](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EditableDocumentRights.html)

**Export** - The right to extract content from a protected format and place it in a different AD RMS-protected format. Typically, when this right is granted, the app enables the user to save protected content to other AD RMS-protected formats; for example, if the application implements a *Save As* functionality.

- Android: [EditableDocumentRights.Export](xref:msipcthin2.editabledocumentrights_class_java.Export)
- iOS and OS X: [MSEditableDocumentRights exportable](xref:msipcthin2.mseditabledocumentrights_interface_objc)
- Windows Store and Windows Phone: [EditableDocumentRights.Export](xref:msipcthin2.editabledocumentrights_export)
- Linux: [EditableDocumentRights::Export](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EditableDocumentRights.html)

**Extract** - The right to extract content from a protected format and place it in an unprotected format. Typically, when this right is granted, the app enables the user to copy and paste information from protected content. If the app implements a <em>Save As</em> functionality, the application might also enable the user to save protected content to unprotected formats and other protected formats. This right has the same value as the Extract right for email.

- Android: [EditableDocumentRights.Extract](xref:msipcthin2.editabledocumentrights_class_java.Extract)
- iOS and OS X: [MSEditableDocumentRights extract](xref:msipcthin2.mseditabledocumentrights_interface_objc)
- Windows Store and Windows Phone: [EditableDocumentRights.Extract](xref:msipcthin2.editabledocumentrights_extract)
- Linux: [EditableDocumentRights::Extract](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EditableDocumentRights.html)

**Print** - The right to print protected content. Typically, when this right is granted, the app enables the user to print protected content. This right has the same value as the Print right for email.

- Android: [EditableDocumentRights.Print](xref:msipcthin2.editabledocumentrights_class_java.Print)
- iOS and OS X: [MSEditableDocumentRights print](xref:msipcthin2.mseditabledocumentrights_interface_objc)
- Windows Store and Windows Phone: [EditableDocumentRights.Print](xref:msipcthin2.editabledocumentrights_print)
- Linux: [EditableDocumentRights::Print](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EditableDocumentRights.html)

 

## Email Rights ##

**All** - A collection that contains all of the email rights.
- Android: [EmailRights.All](xref:msipcthin2.emailrights_class_java.ALL)
- iOS and OS X: [MSEmailRights all](xref:msipcthin2.msemailrights_interface_objc)
- Windows Store and Windows Phone: [EmailRights.All](xref:msipcthin2.emailrights_all)
- Linux: [EmailRights::All](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EmailRights.html)

**Extract** - The right to extract content from a protected format and place it in an unprotected format. Typically, when this right is granted, the app enables an email recipient to copy and paste information from a protected message. If the app implements a <em>Save As</em> functionality, the application might also enable the recipient to save protected content to unprotected formats and other protected formats. This right has the same value as the Extract right for editable documents.

- Android: [EmailRights.Extract](xref:msipcthin2.emailrights_class_java.Extract)
- iOS and OS X: [MSEmailRights extract](xref:msipcthin2.msemailrights_interface_objc)
- Windows Store and Windows Phone: [EmailRights.Extract</strong>](xref:msipcthin2.emailrights_extract)
- Linux: [EmailRights::Extract](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EmailRights.html)

**Forward** - The right to forward a protected message. Typically, when this right is granted, the app enables an email recipient to forward a protected message.
- Android: [<strong>EmailRights.Forward</strong>](xref:msipcthin2.emailrights_class_java.Forward)
- iOS and OS X: [MSEmailRights forward](xref:msipcthin2.msemailrights_interface_objc)
- Windows Store and Windows Phone: [EmailRights.Forward](xref:msipcthin2.emailrights_forward)
- Linux: [EmailRights::Forward](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EmailRights.html)

**Print** - The right to print protected content. Typically, when this right is granted, the app enables an email recipient to print a protected message. This right has the same value as the Print right for editable documents.

- Android: [EmailRights.Print](xref:msipcthin2.emailrights_class_java.Print)
- iOS and OS X: [MSEmailRights print](xref:msipcthin2.msemailrights_interface_objc)
- Windows Store and Windows Phone: [EmailRights.Print](xref:msipcthin2.emailrights_print)
- Linux: [EmailRights::Print](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EmailRights.html)

**Reply** - Typically, when this right is granted, the app enables an email recipient to reply to a protected message and include a copy of the original message.

- Android: [EmailRights.Reply](xref:msipcthin2.emailrights_class_java.Reply)
- iOS and OS X: [MSEmailRights reply](xref:msipcthin2.msemailrights_interface_objc)
- Windows Store and Windows Phone: [EmailRights.Reply](xref:msipcthin2.emailrights_reply)
- Linux: [EmailRights::Reply](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EmailRights.html)

**ReplyAll** - Typically, when this right is granted, the app enables an email recipient to reply to all recipients of a protected message and include a copy of the original message.

- Android: [EmailRights.ReplyAll</strong>](xref:msipcthin2.emailrights_class_java.ReplyAll)
- iOS and OS X: [MSEmailRights replyAll](xref:msipcthin2.msemailrights_interface_objc)
- Windows Store and Windows Phone: [EmailRights.ReplyAll](xref:msipcthin2.emailrights_replyall)
- Linux: [EmailRights::ReplyAll](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EmailRights.html)

 

 

 
