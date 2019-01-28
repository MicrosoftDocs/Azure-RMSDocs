---
# required metadata

title: Development environment files | Azure RMS
description: This topic shows the development environment files and their relative installation locations on your computer.
keywords:
author: bryanla
ms.author: bryanla
manager: mbaldwin
ms.date: 02/23/2017
ms.topic: conceptual
ms.service: information-protection
ms.assetid: B57AC6F3-733C-42A8-AF83-0E15FBF27C99
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Development environment files

This topic shows the development environment files and their relative installation locations on your computer.

The Rights Management Services SDK 2.1 includes the following files, installed on your computer at the default location or the one you have specified: %MsipcSDKDir%.

|File|Path|Description|
|----|----|-----------|
|ReadMe.htm| \ | Contains link to RMS help and [Release notes](release-notes-rtm.md).|
|Isvtier5appsigningprivkey.dat|\bin|Contains the private key used to generate a manifest for use during development of an RMS–enabled application.|
|Isvtier5appsigningpubkey.dat|\bin|Contains the public key used to generate a manifest for use during development of an RMS–enabled application.|
|Isvtier5appsignsdk_client.xml|\bin|Used to generate a manifest for use during development of an RMS–enabled application.|
|YourAppName.isv.mcf|\bin|A boilerplate manifest configuration file you can use to generate a manifest during development of an RMS–enabled application.|
|Ipcsecproc_isv.dll|\bin\x86|DLL used internally, for x86 applications, by the Active Directory Rights Management Services Client 2.1 when operating in the ISV hierarchy.|
|Ipcsecproc_ssp_isv.dll|\bin\x86|DLL used internally, for x86 applications, by the AD RMS 2.1 when operating in the ISV hierarchy.|
|Ipcsecproc_isv.dll|\bin\x64|DLL used internally, for x64 applications, by the AD RMS Client 2.1 when operating in the ISV hierarchy.|
|Ipcsecproc_ssp_isv.dll|\bin\x64|DLL used internally, for x64 applications, by the AD RMS Client 2.1 when operating in the ISV hierarchy.|
|Msipc.h|\inc|Main include file for the RMS SDK 2.1.|
|Ipcprot.h|\inc|Contains the public interface exported by the RMS SDK 2.1.|
|Ipcbase.h|\inc|Contains basic types and helper functions exported by the RMS SDK 2.1.|
|Ipcerror.h|\inc|Contains public error codes exported by RMS SDK 2.1.|
|Ipcfile.h|\inc|Contains the File API interfaces exported by the RMS SDK 2.1|
|Msipc.lib|\lib|Library to link with when using the RMS SDK 2.1 to build x86 applications.|
|Msipc_s.lib|\lib|Provides entry point for [IpcInitialize](https://msdn.microsoft.com/library/jj127295.aspx) for x86 applications.|
|Msipc.lib|\lib\x64|Library to link with when using the RMS SDK 2.1 to build x64 applications.|
|Msipc_s.lib|\lib\x64|Provides entry point for [IpcInitialize](https://msdn.microsoft.com/library/jj127295.aspx) for x64 applications.|
|Genmanifest.exe|\tools|Generates a manifest for use during development of an RMS-enabled application.|
