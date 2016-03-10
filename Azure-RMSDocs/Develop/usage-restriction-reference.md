Usage restriction reference
===============================================================================

Usage restrictions are defined by the constants listed in this topic.

Each user right, listed in the AD RMS right column, has a description, an enforcement point, and suggested methods for enforcement.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">AD RMS right/description</th>
<th align="left">How to enforce</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>IPC_GENERIC_ALL</p>
<p>Grants all rights to the user.</p>
<p><strong>Common enforcement points</strong>:</p>
<p>None</p></td>
<td align="left"><p>This right is used by the system and generally should not be checked directly.</p>
<p>[<strong>IpcAccessCheck</strong>](xref:msipc.ipcaccesscheck) uses this right to determine whether to grant the user other rights as in this example.</p>
<div class="code">
<span codelanguage="ManagedCPlusPlus"></span>
<table>
<colgroup>
<col width="100%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">C++</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><pre><code>// fAccessGranted is set to TRUE if either the IPC_GENERIC_WRITE
// or the IPC_GENERIC_ALL right is granted
IpcAccessCheck(hKey, IPC_GENERIC_WRITE, &amp;fAccessGranted);</code></pre></td>
</tr>
</tbody>
</table>
</div></td>
</tr>
<tr class="even">
<td align="left"><p>IPC_GENERIC_READ</p>
<p>The right to read document contents.</p>
<p><strong>Common enforcement points</strong>:</p>
<p>Document load</p></td>
<td align="left"><p>Don't load or present document contents</p></td>
</tr>
<tr class="odd">
<td align="left"><p>IPC_GENERIC_WRITE</p>
<p>The right to edit document contents.</p>
<p><strong>Common enforcement points</strong>:</p>
<p>Document modification</p></td>
<td align="left"><p>Make any UI controls that can be used to modify document contents non-editable.</p>
<p>Disable any menu items that trigger document changes. <strong>Edit</strong> &gt; <strong>Cut</strong>, <strong>Edit</strong> &gt; <strong>Paste</strong>, and <strong>Insert</strong> are typical examples.</p>
<p>Disable any shortcut menu items that trigger document changes.</p></td>
</tr>
<tr class="even">
<td align="left"><p>No AD RMS right</p>
<p>No description</p>
<p><strong>Common enforcement points</strong>:</p>
<p><strong>Save</strong></p></td>
<td align="left"><p>Disable the <strong>File</strong> &gt; <strong>Save</strong> menu.</p>
<div class="alert">
<strong>Note</strong>  This right does not control <strong>File</strong> &gt; <strong>Save As</strong> because that right does not represent a change to the original document.
</div>
<div>
 
</div>
<p>Disable any keyboard shortcut that can be used to trigger a save (for example, Ctrl+S).</p>
<div class="alert">
<strong>Tip</strong>  A best practice is to update your core <strong>File</strong> &gt; <strong>Save</strong> code to fail if the user doesn't have this right. This acts as a safety net if you miss any UX mechanisms that can be used to trigger a save.
</div>
<div>
 
</div></td>
</tr>
<tr class="odd">
<td align="left"><p>IPC_GENERIC_EXTRACT</p>
<p>The right to extract content from a protected format and place it in an unprotected format.</p>
<p><strong>Common enforcement points</strong>:</p>
<p>Copy-to-clipboard</p></td>
<td align="left"><p>Disable the <strong>Edit</strong> &gt; <strong>Copy</strong> menu. Disable the <strong>Edit</strong> &gt; <strong>Cut</strong> menu.</p>
<p>Disable <strong>Copy</strong> and <strong>Cut</strong> from any shortcut menus.</p>
<p>Disable any keyboard shortcut that can be used to trigger a copy (for example, Ctrl+C or Ctrl+X).</p>
<p>Update window message handlers for [<strong>WM_CUT</strong>](https://msdn.microsoft.com/library/windows/desktop/ms649023) to reject copying of data if the user does not have this right. If the window is using the default Windows-provided message handler, subclass this window and provide your own handlers for <strong>WM_COPY</strong> and <strong>WM_CUT</strong>.</p></td>
</tr>
<tr class="even">
<td align="left"><p>No AD RMS right</p>
<p>No description</p>
<p><strong>Common enforcement points</strong>:</p>
<p><strong>Save As</strong></p></td>
<td align="left"><p>In your <strong>Save As</strong> dialog box, disable any file formats that would result in the document being saved without RMS protection.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>No AD RMS right</p>
<p>No description</p>
<p><strong>Common enforcement points</strong>:</p>
<p>Alt+PrtScn</p></td>
<td align="left"><p>Call [<strong>IpcProtectWindow</strong>](xref:msipc.ipcprotectwindow) on any windows that render document contents.</p></td>
</tr>
<tr class="even">
<td align="left"><p>IPC_GENERIC_EXPORT</p>
<p>The right to extract content from a protected format and place it in a different AD RMS-protected format.</p>
<p><strong>Common enforcement points</strong>:</p>
<p><strong>Save As</strong></p></td>
<td align="left"><p>In your <strong>Save As</strong> dialog box, disable the ability to save to any other file formats.</p>
<div class="alert">
<strong>Tip</strong>  A best practice is to update your core <strong>File</strong> &gt; <strong>Save As</strong> code to fail if the user attempts to save this file to a different format and doesn't have this right. This acts as a safety net if you miss any UX mechanisms that can be used to trigger a save as.
</div>
<div>
 
</div></td>
</tr>
<tr class="odd">
<td align="left"><p>IPC_GENERIC_PRINT</p>
<p>The right to print document contents.</p>
<p><strong>Common enforcement points</strong>:</p>
<p><strong>Print</strong></p></td>
<td align="left"><p>Disable the <strong>File</strong> &gt; <strong>Print</strong> menu.</p>
<p>Disable any keyboard shortcut that could be used to trigger a print (for example, Ctrl+P).</p>
<p>Disable shortcut menu items that could be used to trigger a print.</p>
<div class="alert">
<strong>Tip</strong>  A best practice is to update your core <strong>File</strong> &gt; <strong>Print</strong> code to fail if the user doesn't have this right. This acts as a safety net if you miss any UX mechanisms that can be used to trigger a print.
</div>
<div>
 
</div></td>
</tr>
<tr class="even">
<td align="left"><p>IPC_GENERIC_COMMENT</p>
<p>Some applications support the ability to add comments and annotations to the document without updating core document contents.</p>
<p>This right grants the user access to this capability.</p>
<p><strong>Common enforcement points</strong>:</p>
<p><strong>Review</strong> &gt; <strong>Insert comment</strong></p>
<p><strong>Review</strong> &gt; <strong>Delete Comment</strong></p></td>
<td align="left"><p>Disable any menu items that can be used to modify document comments or annotations. <strong>Review</strong> &gt; <strong>Insert comment</strong> and <strong>Review</strong> &gt; <strong>Delete Comment</strong> are examples.</p>
<p>Disable any keyboard shortcut that could trigger modification of document comments.</p>
<div class="alert">
<strong>Note</strong>  A default implementation requires both <strong>IPC_GENERIC_COMMENT</strong> and <strong>IPC_GENERIC_WRITE</strong> to persist new comments to a file. Applications may choose to add support for the case where the <strong>IPC_GENERIC_COMMENT</strong> right is granted and the <strong>IPC_GENERIC_WRITE</strong> right is not. In this case, it is permitted to allow <strong>Save</strong>, as long as document modifications are restricted to comments only.
</div>
<div>
 
</div></td>
</tr>
<tr class="odd">
<td align="left"><p>IPC_VIEW_RIGHTS</p>
<p>No description</p>
<p><strong>Common enforcement points</strong>:</p>
<p>N/A</p></td>
<td align="left"><p>Enforced by the system. The system will not allow the developer to query the [<strong>user rights list</strong>](xref:msipc.ipc_user_rights_list) from a license unless this right is granted.</p></td>
</tr>
<tr class="even">
<td align="left"><p>IPC_EDIT_RIGHTS</p>
<p>Some applications allow users to modify the set of users and rights for AD RMS-protected content.</p>
<p>This right grants the user access to this capability.</p>
<p><strong>Common enforcement points</strong>:</p>
<p>Application rights editing UI control</p></td>
<td align="left"><p>Disable user access to any UI that can be used to edit the RMS policy for a document.</p></td>
</tr>
</tbody>
</table>

 

 

 



