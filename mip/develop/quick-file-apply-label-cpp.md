---
title: Quickstart - Apply a sensitivity label to a file using the C++ MIP SDK
description: A quickstart showing you how to use the Microsoft Information Protection C++ SDK to apply a sensitivity label to a file.
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

- Complete the [Quickstart: Read sensitivity labels (C++)](quick-file-read-label-cpp.md) first, shows you how to read a sensitivity label that was assigned to a file.
- Optionally: Review [Classification labels](concept-classification-labels.md) concepts.

============== WIP BELOW THIS LINE ======================

## Add logic to apply a sensitivity label

Add logic to a sensitivity label to a file, using the File engine object. 

1. Open the Visual Studio solution you worked on in the previous "Quickstart: Read sensitivity labels (C++)" Quickstart.

2. Using **Solution Explorer**, open the .cpp file in your project that contains the implementation of the `main()` method. It defaults to the same name as the project containing it, which you specified during project creation. 

3. Add the following `using` directive after `using std::endl;`, near the top of the file:

   ```cpp
   using std::endl;
   ```

4. In the body of `main()`, between the `profile->AddEngineAsync(engineSettings, enginePromise);` and `return 0;` statements (where you left off in the previous Quickstart), insert the following code:


