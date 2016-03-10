Supported file formats
=====================================================================

The File API supports native and Pfile formats.

<span id="Supported_File_Formats"></span><span id="supported_file_formats"></span><span id="SUPPORTED_FILE_FORMATS"></span>Supported File Formats
-------------------------------------------------------------------------------------------------------------------------------------------------

The current version of the File API supports native protection for Microsoft Office files, Portable Document Files (PDF) and PFile protection for all other file formats. PDF files can optionally have PFile protection applied.

-   **Native protection**. In native protection, the file is encrypted to an AD RMS file format that is based its MIME type (file name extension). Files that are natively protected using File API are consistent with the format expected by AD RMS enabled applications that use native protection; for example, Office 2013, Office 2010, and FoxIt PDF reader. Native protection is supported only on Office files, PDF files, and a select number of other file types. For more information about the file types on which native protection is supported, see [File API configuration](file_api_configuration.md).
-   **PFile protection**. In PFile protection, files are encrypted using AD RMS Protected File (PFile) format. The file is encrypted to a file with an extension of .pfile. PFile protection is supported for all file formats except Office files.

Administrators can set registry keys to configure whether and how files should be protected based on their file name extension. For more information about how to configure file protection when using File API, see [File API configuration](file_api_configuration.md).

<span id="related_topics"></span>Related topics
-----------------------------------------------

* [Developer notes](developer_notes.md)
* [File API configuration](file_api_configuration.md)
 

 



