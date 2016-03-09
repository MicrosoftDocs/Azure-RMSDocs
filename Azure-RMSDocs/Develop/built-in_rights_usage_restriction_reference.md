How to: Use built-in rights
====================================================================================================

This topic outlines the built-in rights that the Microsoft Rights Management SDK 4.2 provides and usage restrictions that an app should enforce in honoring those restrictions.

**Note**  For the Linux SDK, see the *rights.h* source file for details.

 

<span id="Common_Rights"></span><span id="common_rights"></span><span id="COMMON_RIGHTS"></span>Common Rights
-------------------------------------------------------------------------------------------------------------

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p><strong>Right</strong></p></td>
<td align="left"><p><strong>Values</strong></p></td>
<td align="left"><p><strong>Description</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>All</p></td>
<td align="left"><ul>
<li>Android: [<strong>CommonRights.All</strong>](xref:msipcthin2.commonrights_class_java.ALL)</li>
<li>iOS and OS X: [<strong>[MSCommonRights owner]</strong>](xref:msipcthin2.mscommonrights_interface_objc)</li>
<li>Windows Store and Windows Phone: [<strong>CommonRights.All</strong>](xref:msipcthin2.commonrights_all)</li>
<li>Linux: [CommonRights::All](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1CommonRights.html)</li>
</ul></td>
<td align="left"><p>A collection of all common rights.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Owner</p></td>
<td align="left"><ul>
<li>Android: [<strong>CommonRights.Owner</strong>](xref:msipcthin2.commonrights_class_java.Owner)</li>
<li>iOS and OS X: [<strong>[MSCommonRights owner]</strong>](xref:msipcthin2.mscommonrights_interface_objc)</li>
<li>Windows Store and Windows Phone: [<strong>CommonRights.Owner</strong>](xref:msipcthin2.commonrights_owner)</li>
<li>Linux: [CommonRights::Owner](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1CommonRights.html)</li>
</ul></td>
<td align="left"><p>The Owner right grants full control over the protected content.</p></td>
</tr>
<tr class="even">
<td align="left"><p>View</p></td>
<td align="left"><ul>
<li>Android: [<strong>CommonRights.View</strong>](xref:msipcthin2.commonrights_class_java.View)</li>
<li>iOS and OS X: [<strong>[MSCommonRights view]</strong>](xref:msipcthin2.mscommonrights_interface_objc)</li>
<li>Windows Store and Windows Phone: [<strong>CommonRights.View</strong>](xref:msipcthin2.commonrights_view)</li>
<li>Linux: [CommonRights::View](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1CommonRights.html)</li>
</ul></td>
<td align="left"><p>The right to view protected content. Typically, when this right is granted, the application enables the user to open and view protected content; however, additional rights are required to modify, extract, forward, or save the content.</p></td>
</tr>
</tbody>
</table>

 

<span id="Editable_Document_Rights"></span><span id="editable_document_rights"></span><span id="EDITABLE_DOCUMENT_RIGHTS"></span>Editable Document Rights
---------------------------------------------------------------------------------------------------------------------------------------------------------

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p><strong>Right</strong></p></td>
<td align="left"><p><strong>Values</strong></p></td>
<td align="left"><p><strong>Restrictions</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>All</p></td>
<td align="left"><ul>
<li>Android: [<strong>EditableDocumentRights.All</strong>](xref:msipcthin2.editabledocumentrights_class_java.ALL)</li>
<li>iOS and OS X: [<strong>[MSEditableDocumentRights all]</strong>](xref:msipcthin2.mseditabledocumentrights_interface_objc)</li>
<li>Windows Store and Windows Phone: [<strong>EditableDocumentRights.All</strong>](xref:msipcthin2.editabledocumentrights_all)</li>
<li>Linux: [EditableDocumentRights::All](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EditableDocumentRights.html)</li>
</ul></td>
<td align="left"><p>A collection that contains all of the editable document rights.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Comment</p></td>
<td align="left"><ul>
<li>Android: [<strong>EditableDocumentRights.Comment</strong>](xref:msipcthin2.editabledocumentrights_class_java.Comment)</li>
<li>iOS and OS X: [<strong>[MSEditableDocumentRights comment]</strong>](xref:msipcthin2.mseditabledocumentrights_interface_objc)</li>
<li>Windows Store and Windows Phone: [<strong>EditableDocumentRights.Comment</strong>](xref:msipcthin2.editabledocumentrights__comment)</li>
<li>Linux: [EditableDocumentRights::Comment](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EditableDocumentRights.html)</li>
</ul></td>
<td align="left"><p>The right to make comments on the document.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Edit</p></td>
<td align="left"><ul>
<li>Android: [<strong>EditableDocumentRights.Edit</strong>](xref:msipcthin2.editabledocumentrights_class_java.Edit)</li>
<li>iOS and OS X: [<strong>[MSEditableDocumentRights edit]</strong>](xref:msipcthin2.mseditabledocumentrights_interface_objc)</li>
<li>Windows Store and Windows Phone: [<strong>EditableDocumentRights.Edit</strong>](xref:msipcthin2.editabledocumentrights_edit)</li>
<li>Linux: [EditableDocumentRights::Edit](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EditableDocumentRights.html)</li>
</ul></td>
<td align="left"><p>The right to edit protected content and save it in the same protected format. Typically, when this right is granted, the app enables the user to change protected content and then save it to the same file.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Export</p></td>
<td align="left"><ul>
<li>Android: [<strong>EditableDocumentRights.Export</strong>](xref:msipcthin2.editabledocumentrights_class_java.Export)</li>
<li>iOS and OS X: [<strong>[MSEditableDocumentRights exportable]</strong>](xref:msipcthin2.mseditabledocumentrights_interface_objc)</li>
<li>Windows Store and Windows Phone: [<strong>EditableDocumentRights.Export</strong>](xref:msipcthin2.editabledocumentrights_export)</li>
<li>Linux: [EditableDocumentRights::Export](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EditableDocumentRights.html)</li>
</ul></td>
<td align="left"><p>The right to extract content from a protected format and place it in a different AD RMS-protected format. Typically, when this right is granted, the app enables the user to save protected content to other AD RMS-protected formats; for example, if the application implements a <em>Save As</em> functionality.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Extract</p></td>
<td align="left"><ul>
<li>Android: [<strong>EditableDocumentRights.Extract</strong>](xref:msipcthin2.editabledocumentrights_class_java.Extract)</li>
<li>iOS and OS X: [<strong>[MSEditableDocumentRights extract]</strong>](xref:msipcthin2.mseditabledocumentrights_interface_objc)</li>
<li>Windows Store and Windows Phone: [<strong>EditableDocumentRights.Extract</strong>](xref:msipcthin2.editabledocumentrights_extract)</li>
<li>Linux: [EditableDocumentRights::Extract](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EditableDocumentRights.html)</li>
</ul></td>
<td align="left"><p>The right to extract content from a protected format and place it in an unprotected format. Typically, when this right is granted, the app enables the user to copy and paste information from protected content. If the app implements a <em>Save As</em> functionality, the application might also enable the user to save protected content to unprotected formats and other protected formats. This right has the same value as the Extract right for email.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Print</p></td>
<td align="left"><ul>
<li>Android: [<strong>EditableDocumentRights.Print</strong>](xref:msipcthin2.editabledocumentrights_class_java.Print)</li>
<li>iOS and OS X: [<strong>[MSEditableDocumentRights print]</strong>](xref:msipcthin2.mseditabledocumentrights_interface_objc)</li>
<li>Windows Store and Windows Phone: [<strong>EditableDocumentRights.Print</strong>](xref:msipcthin2.editabledocumentrights_print)</li>
<li>Linux: [EditableDocumentRights::Print](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EditableDocumentRights.html)</li>
</ul></td>
<td align="left"><p>The right to print protected content. Typically, when this right is granted, the app enables the user to print protected content. This right has the same value as the Print right for email.</p></td>
</tr>
</tbody>
</table>

 

<span id="Email_Rights"></span><span id="email_rights"></span><span id="EMAIL_RIGHTS"></span>Email Rights
---------------------------------------------------------------------------------------------------------

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p><strong>Right</strong></p></td>
<td align="left"><p><strong>Values</strong></p></td>
<td align="left"><p><strong>Restrictions</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>All</p></td>
<td align="left"><ul>
<li>Android: [<strong>EmailRights.All</strong>](xref:msipcthin2.emailrights_class_java.ALL)</li>
<li>iOS and OS X: [<strong>[MSEmailRights all]</strong>](xref:msipcthin2.msemailrights_interface_objc)</li>
<li>Windows Store and Windows Phone: [<strong>EmailRights.All</strong>](xref:msipcthin2.emailrights_all)</li>
<li>Linux: [EmailRights::All](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EmailRights.html)</li>
</ul></td>
<td align="left"><p>A collection that contains all of the email rights.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Extract</p></td>
<td align="left"><ul>
<li>Android: [<strong>EmailRights.Extract</strong>](xref:msipcthin2.emailrights_class_java.Extract)</li>
<li>iOS and OS X: [<strong>[MSEmailRights extract]</strong>](xref:msipcthin2.msemailrights_interface_objc)</li>
<li>Windows Store and Windows Phone: [<strong>EmailRights.Extract</strong>](xref:msipcthin2.emailrights_extract)</li>
<li>Linux: [EmailRights::Extract](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EmailRights.html)</li>
</ul></td>
<td align="left"><p>The right to extract content from a protected format and place it in an unprotected format. Typically, when this right is granted, the app enables an email recipient to copy and paste information from a protected message. If the app implements a <em>Save As</em> functionality, the application might also enable the recipient to save protected content to unprotected formats and other protected formats. This right has the same value as the Extract right for editable documents.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Forward</p></td>
<td align="left"><ul>
<li>Android: [<strong>EmailRights.Forward</strong>](xref:msipcthin2.emailrights_class_java.Forward)</li>
<li>iOS and OS X: [<strong>[MSEmailRights forward]</strong>](xref:msipcthin2.msemailrights_interface_objc)</li>
<li>Windows Store and Windows Phone: [<strong>EmailRights.Forward</strong>](xref:msipcthin2.emailrights_forward)</li>
<li>Linux: [EmailRights::Forward](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EmailRights.html)</li>
</ul></td>
<td align="left"><p>The right to forward a protected message. Typically, when this right is granted, the app enables an email recipient to forward a protected message.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Print</p></td>
<td align="left"><ul>
<li>Android: [<strong>EmailRights.Print</strong>](xref:msipcthin2.emailrights_class_java.Print)</li>
<li>iOS and OS X: [<strong>[MSEmailRights print]</strong>](xref:msipcthin2.msemailrights_interface_objc)</li>
<li>Windows Store and Windows Phone: [<strong>EmailRights.Print</strong>](xref:msipcthin2.emailrights_print)</li>
<li>Linux: [EmailRights::Print](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EmailRights.html)</li>
</ul></td>
<td align="left"><p>The right to print protected content. Typically, when this right is granted, the app enables an email recipient to print a protected message. This right has the same value as the Print right for editable documents.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Reply</p></td>
<td align="left"><ul>
<li>Android: [<strong>EmailRights.Reply</strong>](xref:msipcthin2.emailrights_class_java.Reply)</li>
<li>iOS and OS X: [<strong>[MSEmailRights reply]</strong>](xref:msipcthin2.msemailrights_interface_objc)</li>
<li>Windows Store and Windows Phone: [<strong>EmailRights.Reply</strong>](xref:msipcthin2.emailrights_reply)</li>
<li>Linux: [EmailRights::Reply](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EmailRights.html)</li>
</ul></td>
<td align="left"><p>Typically, when this right is granted, the app enables an email recipient to reply to a protected message and include a copy of the original message.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>ReplyAll</p></td>
<td align="left"><ul>
<li>Android: [<strong>EmailRights.ReplyAll</strong>](xref:msipcthin2.emailrights_class_java.ReplyAll)</li>
<li>iOS and OS X: [<strong>[MSEmailRights replyAll]</strong>](xref:msipcthin2.msemailrights_interface_objc)</li>
<li>Windows Store and Windows Phone: [<strong>EmailRights.ReplyAll</strong>](xref:msipcthin2.emailrights_replyall)</li>
<li>Linux: [EmailRights::ReplyAll](http://azuread.github.io/rms-sdk-for-cpp/classrmscore_1_1modernapi_1_1EmailRights.html)</li>
</ul></td>
<td align="left"><p>Typically, when this right is granted, the app enables an email recipient to reply to all recipients of a protected message and include a copy of the original message.</p></td>
</tr>
</tbody>
</table>

 

 

 



