---
# required metadata

title: How to&#58; Enable error and performance logging | Azure RMS
description: The Microsoft Rights Management SDK 4.2 manages diagnosis and performance logs upload through a single device property.
keywords:
author: msmbaldwin
ms.author: mbaldwin
manager: barbkess
ms.date: 02/23/2017
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: F5AD3826-2292-4A25-AF5C-D17D083F5742
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: dev

---

# How to: Enable error and performance logging
The Microsoft Rights Management SDK 4.2 manages diagnosis and performance logs upload through a single device property.

## Overview ##
You can improve your users' experience and troubleshooting by enabling automatic diagnostics, performance, and telemetry logging data upload to Microsoft. 

> [!IMPORTANT] 
> In order to honor user privacy, you as the app developer, must ask the user to consent before enabling the automatic logging.

> [!NOTE]
> As example, here is a standard message Microsoft uses for logging notification: 
>
> *By turning on Error and Performance Logging, you are agreeing to send Error and Performance Data to Microsoft.  Microsoft will collect error and performance data over the internet (“Data”).  Microsoft uses this Data to provide and improve the quality, security and integrity of Microsoft products and services.  For example, we analyze performance and reliability, such as what features you use, how quickly the features respond, device performance, user interface interactions, and any problems you experience with the product.  Data will also include information about the configuration of your software like the software you are currently running, and the IP address.*  

You will manager logging control through two properties.

-   Enable logging through the **IpcCustomerExperienceDataCollectionEnabled** property. The setting is persistent across device resets.
-   Control the logging level through the **IpcLogLevel** property using the following settings.

    * 1 - Verbose
    * 2 - Informational
    * 3 - Warning
    * 4 - Error
    * 5 - Critical

In each of the example code snippets following, the calling application can set or query the property.

### Android ###
Enable automatic logging

    SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(context);
    SharedPreferences.Editor editor = preferences.edit();
    editor.putBoolean(&quot;IpcCustomerExperienceDataCollectionEnabled&quot;, true);
    editor.commit();

Get current logging control flag setting

    SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(context);
    Boolean isLogUploadEnabled = preferences.getBoolean(&quot;IpcCustomerExperienceDataCollectionEnabled&quot;, false);

## iOS ##
Enable automatic logging

    NSUserDefaults \*prefs = [NSUserDefaults standardUserDefaults];
        [prefs setBool:FALSE forKey:@&quot;IpcCustomerExperienceDataCollectionEnabled”];
        [[NSUserDefaults standardUserDefaults] synchronize];

Get current logging control flag setting

    [[NSUserDefaults standardUserDefaults] boolForKey:@&quot;IpcCustomerExperienceDataCollectionEnabled&quot;];

Set log level control

    NSUserDefaults \*prefs = [NSUserDefaults standardUserDefaults];
      [prefs setInteger:1 forKey:@&quot;IpcLogLevel”];
      [[NSUserDefaults standardUserDefaults] synchronize];

Get log level control setting

    [[NSUserDefaults standardUserDefaults] boolForKey:@&quot;IpcLogLevel&quot;];
 

## Windows ##
Enable automatic logging

    CustomerExperienceConfiguration::Option = CustomerExperienceOptions::LoggingEnabledNow;

For more information on optional settings, see [CustomerExperienceOptions](https://msdn.microsoft.com/library/microsoft.rightsmanagement.customerexperienceoptions.aspx).

Get current logging control flag setting

    CustomerExperienceOptions loggingOption = CustomerExperienceConfiguration::Option;


**Note** - The Windows code snips above are in C++. For C\#, update the syntax with ‘.’ in place of ‘::’.

**Linux / C++** - This SDK has some basic logging that is not as extensive as that of the other platforms. For more information see the **Troubleshooting** section of the "README.md" at [RMS SDK for portable C++](https://github.com/AzureAD/rms-sdk-for-cpp#troubleshooting).
