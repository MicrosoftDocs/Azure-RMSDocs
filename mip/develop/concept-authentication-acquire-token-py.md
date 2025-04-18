---
title: Concepts - Using Python to acquire an access token.
description: This article helps you understand how to use Python to acquire an OAuth2 access token. 
author: msmbaldwin
ms.service: information-protection
ms.topic: conceptual
ms.date: 04/10/2025
ms.author: mbaldwin
---

# Acquire an access token (Python)

This example demonstrates how to call an external Python script to obtain an OAuth2 token. A valid OAuth2 access token is required by the implementation of the authentication delegate.

## Prerequisites

To run the sample:

- Install Python 3.10 or newer.
- Implement utils.h/cpp in your project.
- Auth.py should be added to your project and exist in same directory as the binaries at build.
- Complete [Microsoft Information Protection (MIP) SDK setup and configuration](setup-configure-mip.md). Among other tasks, you register your client application in your Microsoft Entra tenant. Microsoft Entra ID provides an application ID, also known as client ID, which is used in your token acquisition logic.

This code isn't intended for production use. It may only be used for development and understanding auth concepts. The sample is cross-platform.

## sample::auth::AcquireToken()

In the simple authentication example, we demonstrated a simple `AcquireToken()` function that took no parameters and returned a hard-coded token value. In this example, we overload AcquireToken() to accept authentication parameters and call an external Python script to return the token.

### auth.h

In auth.h, `AcquireToken()` is overloaded and the overloaded function and updated parameters are as follows:

```cpp
//auth.h
#include <string>

namespace sample {
  namespace auth {
    std::string AcquireToken(
        const std::string& userName, //A string value containing the user's UPN.
        const std::string& password, //The user's password in plaintext
        const std::string& clientId, //The Azure AD client ID (also known as Application ID) of your application.
        const std::string& resource, //The resource URL for which an OAuth2 token is required. Provided by challenge object.
        const std::string& authority); //The authentication authority endpoint. Provided by challenge object.
    }
}
```

The first three parameters are provided by user input or hard coded in to your application. The last two parameters are provided by the SDK to the auth delegate.


### auth.cpp

In auth.cpp, we add the overloaded function definition, then define the code necessary to call the Python script. The function accepts all of the provided parameters and passes them to the Python script. The script executes and returns the token in string format.

```cpp
#include "auth.h"
#include "utils.h"

#include <fstream>
#include <functional>
#include <memory>
#include <string>

using std::string;
using std::runtime_error;

namespace sample {
    namespace auth {

    //This function implements token acquisition in the application by calling an external Python script.
    //The Python script requires username, password, clientId, resource, and authority.
    //Username, Password, and ClientId are provided by the user/developer
    //Resource and Authority are provided as part of the OAuth2Challenge object that is passed in by the SDK to the AuthDelegate.
    string AcquireToken(
        const string& userName,
        const string& password,
        const string& clientId,
        const string& resource,
        const string& authority) {

    string cmd = "python";
    if (sample::FileExists("auth.py"))
        cmd += " auth.py -u ";

    else
        throw runtime_error("Unable to find auth script.");

    cmd += userName;
    cmd += " -p ";
    cmd += password;
    cmd += " -a ";
    cmd += authority;
    cmd += " -r ";
    cmd += resource;
    cmd += " -c ";
    // Replace <application-id> with the Application ID provided during your Azure AD application registration.
    cmd += (!clientId.empty() ? clientId : "<application-id>");

    string result = sample::Execute(cmd.c_str());
    if (result.empty())
        throw runtime_error("Failed to acquire token. Ensure Python is installed correctly.");

    return result;
    }
    }
}

```

## Python Script

This script acquires authentication tokens directly via [Microsoft Authentication Library (MSAL) for Python](https://github.com/AzureAD/microsoft-authentication-library-for-python). This code is included only as a means to acquire auth tokens for use by the sample apps and isn't intended for use in production. The script works only against tenants that support plain old username/password authentication. MFA or certificate-based authentication aren't supported via this script.

> [!NOTE]
> Prior to running this sample, you must install MSAL for Python by running one of the following commands:

```shell
pip install msal
pip3 install msal
```

```python
import getopt
import sys
import json
import re
from msal import PublicClientApplication

def printUsage():
  print('auth.py -u <username> -p <password> -a <authority> -r <resource> -c <clientId>')

def main(argv):
  try:
    options, args = getopt.getopt(argv, 'hu:p:a:r:c:')
  except getopt.GetoptError:
    printUsage()
    sys.exit(-1)

  username = ''
  password = ''
  authority = ''
  resource = ''

  clientId = ''
    
  for option, arg in options:
    if option == '-h':
      printUsage()
      sys.exit()
    elif option == '-u':
      username = arg
    elif option == '-p':
      password = arg
    elif option == '-a':
      authority = arg
    elif option == '-r':
      resource = arg
    elif option == '-c':
      clientId = arg

  if username == '' or password == '' or authority == '' or resource == '' or clientId == '':
    printUsage()
    sys.exit(-1)

  # ONLY FOR DEMO PURPOSES AND MSAL FOR PYTHON
  # This shouldn't be required when using proper auth flows in production.  
  if authority.find('common') > 1:
    authority = authority.split('/common')[0] + "/organizations"
   
  app = PublicClientApplication(client_id=clientId, authority=authority)  
  
  result = None  

  if resource.endswith('/'):
    resource += ".default"    
  else:
    resource += "/.default"
  
  # *DO NOT* use username/password authentication in production system.
  # Instead, consider auth code flow and using a browser to fetch the token.
  result = app.acquire_token_by_username_password(username=username, password=password, scopes=[resource])  
  print(result['access_token'])

if __name__ == '__main__':  
  main(sys.argv[1:])
```

## Update AcquireOAuth2Token

Finally, update the `AcquireOAuth2Token` function in `AuthDelegateImpl` to call the overloaded `AcquireToken` function. The resource and authority URLs are obtained by reading `challenge.GetResource()` and `challenge.GetAuthority()`. The `OAuth2Challenge` is passed in to the auth delegate when the engine is added. This work is done by the SDK and requires no extra work on the part of the developer.

```cpp
bool AuthDelegateImpl::AcquireOAuth2Token(
    const mip::Identity& /*identity*/,
    const OAuth2Challenge& challenge,
    OAuth2Token& token) {

    //call our AcquireToken function, passing in username, password, clientId, and getting the resource/authority from the OAuth2Challenge object
    string accessToken = sample::auth::AcquireToken(mUserName, mPassword, mClientId, challenge.GetResource(), challenge.GetAuthority());
    token.SetAccessToken(accessToken);
    return true;
}
```

When the `engine` is added, the SDK calls the `AcquireOAuth2Token function, passing in the challenge, executing the Python script, receiving a token, then presenting the token to the service.
