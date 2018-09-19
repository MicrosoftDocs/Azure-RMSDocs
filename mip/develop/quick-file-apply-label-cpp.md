---
title: Quickstart - Apply a sensitivity label to a file using the C++ MIP SDK
description: A quickstart showing you how to use the Microsoft Information Protection C++ SDK to apply a sensitivity label to a filo.
services: information-protection
author: BryanLa
ms.service: information-protection
ms.topic: quickstart
ms.date: 09/27/2018
ms.author: bryanla
---

# Quickstart: Apply a sensitivity labels (C++)

This Quickstart shows you how to use the MIP File API, to apply a sensitivity label to a file.

## Prerequisites

If you haven't already, be sure to complete the following prerequisites before continuing:

- Complete the [Quickstart: List sensitivity labels (C++)](quick-app-initialization-cpp.md) first, which builds a starter Visual Studio solution, to list an organization's sensitivity labels.
- Optionally: Review [Classification labels](concept-classification-labels.md) concepts.

## Add logic to apply a sensitivity label

Add logic to a sensitivity label to a file, using the File engine object. 

1. Open the Visual Studio solution you created in the previous "Quickstart: List sensitivity lables (C++)" Quickstart.

2. Using **Solution Explorer**, open the .cpp file in your project that contains the implementation of the `main()` method. It defaults to the same name as the project containing it, which you specified during project creation. 

3. Add the following `using` directive after `using mip::FileEngine;`, near the top of the file:

   ```cpp
   using std::endl;
   ```

4. In the body of `main()`, between the `profile->AddEngineAsync(engineSettings, enginePromise);` and `return 0;` statements (where you left off in the previous Quickstart), insert the following code:



Also: https://github.com/MicrosoftDocs/Azure-RMSDocs-pr/blob/release-mip/mip/develop/tutorial-file/engine.md
Also: https://github.com/MicrosoftDocs/Azure-RMSDocs-pr/blob/release-mip/mip/develop/tutorial-file/file-handler.md 