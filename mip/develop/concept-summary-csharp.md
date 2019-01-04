---
title: Microsoft Information Protection SDK C# Wrapper Overview
description: A quick overview on how to get started with the MIP SDK C# wrapper, and the differences between the C# wrapper and C++ SDK.
author: tommoser
ms.service: information-protection
ms.topic: conceptual
ms.date: 01/04/2019
ms.author: tommos
---
# Getting Started with the Microsoft Information Protection C# Wrapper

The Microsoft Information Protection SDK C# Wrapper enables developers to build applications that integrate the classification, labeling, and protection features of the Microsoft Information Protection SDK in to their .NET (C#), applications, and services.

The managed wrapper and all dependencies can be installed via NuGet in Visual Studio.

## Supported Platforms

The Microsoft Information Protection C# Wrapper is supported on the following .NET platforms:

* .NET Standard 2.0
* .NET 4.0

## Installing the Package

From the Package Manager Console in Visual Studio 2017, install the package by running:

`install-package Microsoft.InformationProtection.File`

No additional packages are required. All of the third party libraries are included and will copy to the output folder on build.

## Wrapper Details

The .NET wrapper is a [SWIG](swig.org/) generated managed wrapper. The wrapper uses compiled C++ libraries from the Microsoft Information Protection SDK. These DLLs are the same DLLs that are included with the C++ version of the SDK.

## Concept Overlap

There are a few fundamental differences between the C++ version of the SDK and the managed wrapper. 

* The C# wrapper doesn't require the use of Observers for async operations. Any asynchronous operations are implemented via the [Task-based Asynchronous Pattern](https://docs.microsoft.com/en-us/dotnet/standard/asynchronous-programming-patterns/task-based-asynchronous-pattern-tap).
* The C# wrapper does require the delegates that are part of the C++ SDK: AuthDelegate and ConsentDelegate. These delegates are implemented via the interfaces `IAuthDelegate` and `IConsentDelegate`

## Next Steps

Next, review [Quickstart - Initialization for Microsoft Information Protection (MIP) SDK C#](mip/develop/quick-app-initialization-csharp.md) to get started on building a basic, MIP-enabled console application.
