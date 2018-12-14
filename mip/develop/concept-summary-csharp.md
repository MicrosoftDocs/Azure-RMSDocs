---
title: 
description: 
author: tommoser
ms.service: information-protection
ms.topic: conceptual
ms.date: 11/08/2018
ms.author: tommos
---
# Getting Started with the Microsoft Information Protection C# Wrapper

The Microsoft Information Protection SDK C# Wrapper enables developers to build applications that integrate the classification, labeling, and protection features of the Microsoft Information Protection SDK in to their .NET (C#), applications and services. 

The managed wrapper and all dependencies can be installed via NuGet in Visual Studio.

## Supported Platforms

The Microsoft Information Protection C# Wrapper is supported on the following .NET platforms:

* .NET Standard 2.0


## Installing the Package

TODO: Include screenshots of VS2017?

From the Package Manager Console in Visual Studio 2017, install the package by running:

`install-package Microsoft.InformationProtection.File`

No additional packages are required. All of the 3rd party libraries 

## Wrapper Details

The .NET wrapper is a [SWIG](swig.org/) generated managed wrapper. The wrapper uses compiled C++ libraries from the Microsoft Information Protection SDK. These DLLs are the same DLLs that are included with the C++ version of the SDK.

## Concept Overlap

Observers not required.
Delegates (auth, consent) are required

## Next Steps

link to quick start