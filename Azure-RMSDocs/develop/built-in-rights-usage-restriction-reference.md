---
# required metadata

title: How to&#58; Use built-in rights | Azure RMS
description: Outlines the built-in rights that the RMS SDK 4.2 provides and usage restrictions that an app should enforce in honoring those restrictions.
keywords:
author: msmbaldwin
ms.author: mbaldwin
manager: barbkess
ms.date: 02/23/2017
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 9142dd29-f1f4-4c2f-82ac-534f14b8bba1
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: dev
experimental: true
experiment_id: "priyamo-TableVsFlatList-20160805"

---

# How to: Use built-in rights

This topic outlines the built-in rights that the Microsoft Rights Management SDK 4.2 provides and usage restrictions that an app should enforce in honoring those restrictions. The following shows the built-in rights; common rights, editable document rights and email rights follwed by a description and their values by operating system.

**Note** - For the Linux SDK, see the *rights.h* source file for details.

## Common Rights

**All** - A collection of all common rights.
- Android: [CommonRights.All](/previous-versions/windows/desktop/msipcthin2/commonrights-class-java)
- iOS and OS X: [MSCommonRights](/previous-versions/windows/desktop/msipcthin2/mscommonrights-interface-objc) - user owner and view to implement **All**
- Windows Store and Windows Phone: [CommonRights.All</strong>](/previous-versions/windows/desktop/msipcthin2/commonrights-all)
- Linux: [CommonRights::All](https://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1CommonRights.html)

**Owner** - The Owner right grants full control over the protected content.
- Android: [<strong>CommonRights.Owner](/previous-versions/windows/desktop/msipcthin2/commonrights-class-java)
- iOS and OS X: [MSCommonRights owner](/previous-versions/windows/desktop/msipcthin2/mscommonrights-interface-objc)
- Windows Store and Windows Phone: [CommonRights.Owner](/previous-versions/windows/desktop/msipcthin2/commonrights-owner)
- Linux: [CommonRights::Owner](https://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1CommonRights.html)

**View** - The right to view protected content. Typically, when this right is granted, the application enables the user to open and view protected content; however, additional rights are required to modify, extract, forward, or save the content.

- Android: [CommonRights.View](/previous-versions/windows/desktop/msipcthin2/commonrights-class-java)
- iOS and OS X: [MSCommonRights view](/previous-versions/windows/desktop/msipcthin2/mscommonrights-interface-objc)
- Windows Store and Windows Phone: [CommonRights.View](/previous-versions/windows/desktop/msipcthin2/commonrights-view)
- Linux: [CommonRights::View](https://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1CommonRights.html)</li>

 

## Editable Document Rights
**All** - A collection that contains all of the editable document rights.
- Android: [EditableDocumentRights.All](/previous-versions/windows/desktop/msipcthin2/editabledocumentrights-class-java)
- iOS and OS X: [MSEditableDocumentRights all](/previous-versions/windows/desktop/msipcthin2/mseditabledocumentrights-interface-objc)
- Windows Store and Windows Phone: [EditableDocumentRights.All](/previous-versions/windows/desktop/msipcthin2/editabledocumentrights-all)
- Linux: [EditableDocumentRights::All](https://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EditableDocumentRights.html)

**Comment** - The right to make comments on the document.
- Android: [EditableDocumentRights.Comment](/previous-versions/windows/desktop/msipcthin2/editabledocumentrights-class-java)
- iOS and OS X: [MSEditableDocumentRights comment](/previous-versions/windows/desktop/msipcthin2/mseditabledocumentrights-interface-objc)
- Windows Store and Windows Phone: [EditableDocumentRights.Comment](/previous-versions/windows/desktop/msipcthin2/editabledocumentrights--comment)
- Linux: [EditableDocumentRights::Comment](https://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EditableDocumentRights.html)

**Edit** - The right to edit protected content and save it in the same protected format. Typically, when this right is granted, the app enables the user to change protected content and then save it to the same file.
- Android: [EditableDocumentRights.Edit](/previous-versions/windows/desktop/msipcthin2/editabledocumentrights-class-java)
- iOS and OS X: [MSEditableDocumentRights edit](/previous-versions/windows/desktop/msipcthin2/mseditabledocumentrights-interface-objc)
- Windows Store and Windows Phone: [EditableDocumentRights.Edit](/previous-versions/windows/desktop/msipcthin2/editabledocumentrights-edit)
- Linux: [EditableDocumentRights::Edit](https://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EditableDocumentRights.html)

**Export** - The right to extract content from a protected format and place it in a different AD RMS-protected format. Typically, when this right is granted, the app enables the user to save protected content to other AD RMS-protected formats; for example, if the application implements a *Save As* functionality.

- Android: [EditableDocumentRights.Export](/previous-versions/windows/desktop/msipcthin2/editabledocumentrights-class-java)
- iOS and OS X: [MSEditableDocumentRights exportable](/previous-versions/windows/desktop/msipcthin2/mseditabledocumentrights-interface-objc)
- Windows Store and Windows Phone: [EditableDocumentRights.Export](/previous-versions/windows/desktop/msipcthin2/editabledocumentrights-export)
- Linux: [EditableDocumentRights::Export](https://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EditableDocumentRights.html)

**Extract** - The right to extract content from a protected format and place it in an unprotected format. Typically, when this right is granted, the app enables the user to copy and paste information from protected content. If the app implements a <em>Save As</em> functionality, the application might also enable the user to save protected content to unprotected formats and other protected formats. This right has the same value as the Extract right for email.

- Android: [EditableDocumentRights.Extract](/previous-versions/windows/desktop/msipcthin2/editabledocumentrights-class-java)
- iOS and OS X: [MSEditableDocumentRights extract](/previous-versions/windows/desktop/msipcthin2/mseditabledocumentrights-interface-objc)
- Windows Store and Windows Phone: [EditableDocumentRights.Extract](/previous-versions/windows/desktop/msipcthin2/editabledocumentrights-extract)
- Linux: [EditableDocumentRights::Extract](https://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EditableDocumentRights.html)

**Print** - The right to print protected content. Typically, when this right is granted, the app enables the user to print protected content. This right has the same value as the Print right for email.

- Android: [EditableDocumentRights.Print](/previous-versions/windows/desktop/msipcthin2/editabledocumentrights-class-java)
- iOS and OS X: [MSEditableDocumentRights print](/previous-versions/windows/desktop/msipcthin2/mseditabledocumentrights-interface-objc)
- Windows Store and Windows Phone: [EditableDocumentRights.Print](/previous-versions/windows/desktop/msipcthin2/editabledocumentrights-print)
- Linux: [EditableDocumentRights::Print](https://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EditableDocumentRights.html)

 

## Email Rights

**All** - A collection that contains all of the email rights.
- Android: [EmailRights.All](/previous-versions/windows/desktop/msipcthin2/emailrights-class-java)
- iOS and OS X: [MSEmailRights all](/previous-versions/windows/desktop/msipcthin2/msemailrights-interface-objc)
- Windows Store and Windows Phone: [EmailRights.All](/previous-versions/windows/desktop/msipcthin2/emailrights-all)
- Linux: [EmailRights::All](https://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EmailRights.html)

**Extract** - The right to extract content from a protected format and place it in an unprotected format. Typically, when this right is granted, the app enables an email recipient to copy and paste information from a protected message. If the app implements a <em>Save As</em> functionality, the application might also enable the recipient to save protected content to unprotected formats and other protected formats. This right has the same value as the Extract right for editable documents.

- Android: [EmailRights.Extract](/previous-versions/windows/desktop/msipcthin2/emailrights-class-java)
- iOS and OS X: [MSEmailRights extract](/previous-versions/windows/desktop/msipcthin2/msemailrights-interface-objc)
- Windows Store and Windows Phone: [EmailRights.Extract</strong>](/previous-versions/windows/desktop/msipcthin2/emailrights-extract)
- Linux: [EmailRights::Extract](https://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EmailRights.html)

**Forward** - The right to forward a protected message. Typically, when this right is granted, the app enables an email recipient to forward a protected message.
- Android: [<strong>EmailRights.Forward</strong>](/previous-versions/windows/desktop/msipcthin2/emailrights-class-java)
- iOS and OS X: [MSEmailRights forward](/previous-versions/windows/desktop/msipcthin2/msemailrights-interface-objc)
- Windows Store and Windows Phone: [EmailRights.Forward](/previous-versions/windows/desktop/msipcthin2/emailrights-forward)
- Linux: [EmailRights::Forward](https://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EmailRights.html)

**Print** - The right to print protected content. Typically, when this right is granted, the app enables an email recipient to print a protected message. This right has the same value as the Print right for editable documents.

- Android: [EmailRights.Print](/previous-versions/windows/desktop/msipcthin2/emailrights-class-java)
- iOS and OS X: [MSEmailRights print](/previous-versions/windows/desktop/msipcthin2/msemailrights-interface-objc)
- Windows Store and Windows Phone: [EmailRights.Print](/previous-versions/windows/desktop/msipcthin2/emailrights-print)
- Linux: [EmailRights::Print](https://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EmailRights.html)

**Reply** - Typically, when this right is granted, the app enables an email recipient to reply to a protected message and include a copy of the original message.

- Android: [EmailRights.Reply](/previous-versions/windows/desktop/msipcthin2/emailrights-class-java)
- iOS and OS X: [MSEmailRights reply](/previous-versions/windows/desktop/msipcthin2/msemailrights-interface-objc)
- Windows Store and Windows Phone: [EmailRights.Reply](/previous-versions/windows/desktop/msipcthin2/emailrights-reply)
- Linux: [EmailRights::Reply](https://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EmailRights.html)

**ReplyAll** - Typically, when this right is granted, the app enables an email recipient to reply to all recipients of a protected message and include a copy of the original message.

- Android: [EmailRights.ReplyAll</strong>](/previous-versions/windows/desktop/msipcthin2/emailrights-class-java)
- iOS and OS X: [MSEmailRights replyAll](/previous-versions/windows/desktop/msipcthin2/msemailrights-interface-objc)
- Windows Store and Windows Phone: [EmailRights.ReplyAll](/previous-versions/windows/desktop/msipcthin2/emailrights-replyall)
- Linux: [EmailRights::ReplyAll](https://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EmailRights.html)