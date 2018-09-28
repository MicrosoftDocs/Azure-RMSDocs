---
title: Concepts - Using Python to acquire an access token.
description: This article will help you understand how to use Python to acquire an OAuth2 access token. This is required by the implementation of the authentication delegate.
author: BryanLa
ms.service: information-protection
ms.topic: conceptual
ms.date: 09/27/2018
ms.author: bryanla
---

# Acquire an access token (Python)

This example demonstrates how to call an external Python script to obtain an OAuth2 token. This is required by the implementation of the authentication delegate.

This code is not intended for production use, but may be used for development and understanding auth concepts. The sample is cross-platform.

## Prerequisites

To run the sample below, the following must be complete:

- Install Python 2.7
- Implement [utils.h/cpp]() in your project 
- [auth.py]() should be added to your project and exist in same directory as the binaries at build.

## sample::auth::AcquireToken()

In the [simple authentication example](), we demonstrated a simple `AcquireToken()` function that took no parameters and returned a hard coded token value. In this example, we'll overload AcquireToken() to accept authentication parameters and call an external Python script to return the token.

### auth.h

In auth.h, `AcquireToken()` is overloaded and the overloaded function and updated parameters are as follows:

```cpp
//auth.h
#include <string>

namespace sample {
  namespace auth {
    std::string AcquireToken();

    std::string AcquireToken(
        const std::string& userName, //A string value containing the user's UPN.
        const std::string& password, //The user's password in plaintext
        const std::string& clientId, //The AAD client ID of your application.
        const std::string& resource, //The resource URL for which an OAuth2 token is required. Provided by challenge object.
        const std::string& authority); //The authentication authority endpoint. Provided by challenge object.
    }
}
```

The first three parameters will be provided by user input or hard coded in to your application. The last two parameters are provided by the SDK to the auth delegate. 


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

    string AcquireToken() { //ignore in this sample
    }

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
    cmd += (!clientId.empty() ? clientId : "6b069eef-9dde-4a29-b402-8ce866edc897");

    string result = sample::Execute(cmd.c_str());
    if (result.empty())
        throw runtime_error("Failed to acquire token. Ensure Python is installed correctly.");

    return result;
    }
    }
}

```

## Python Script

This script acquires authentication tokens directly via a simple http request. This is included only as a means to acquire auth tokens for use by the sample apps and is not intended for use in production code. The script works only against tenants that support plain old username/password http authentication. MFA or certificate-based authentication will fail.

```python
import getopt
import sys
import json
import urllib
import urllib2
import re

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

  # Find everything after the last '/' and replace it with 'token'
  if not authority.endswith('token'):
    regex = re.compile('^(.*[\/])')
    match = regex.match(authority)
    authority = match.group()
    authority = authority + 'token'

  # Build REST call
  headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Accept': 'application/json'
  }

  params = {
    'resource': resource,
    'client_id': clientId,
    'grant_type': 'password',
    'username': username,
    'password': password
  }

  req = urllib2.Request(
    url = authority,
    headers = headers,
    data = urllib.urlencode(params))

  f = urllib2.urlopen(req)
  response = f.read()
  f.close()
  sys.stdout.write(json.loads(response)['access_token'])

if __name__ == '__main__':
  main(sys.argv[1:])
```

## Update AcquireOAuth2Token

Finally, update the `AcquireOAuth2Token` function in `AuthDelegateImpl` to call the overloaded `AcquireToken` function. The resource and authority URLs are obtained by reading `challenge.GetResource()` and `challenge.GetAuthority()`. The `OAuth2Challenge` is passed in to the auth delegate when the engine is added. This work is done by the SDK and requires no additional work on the part of the developer. 

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

When the `engine` is added, the SDK will call the `AcquireOAuth2Token function, passing in the challenge, executing the Python script, receiving a token, then presenting the token to the service.


