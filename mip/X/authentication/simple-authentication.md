# Simple Authentication Example

## Summary

This sample is not intended for production use, but rather to highlight what is happening with the [authentication delegate implementation]() and the `AcquireToken()` call.

The auth::AcquireToken() method implemented is intentionally over-simplified. The purpose is to demonstrate that no matter how the token is obtained, it must be returned and provided to `token.SetAccessToken()`.

## sample::auth::AcquireToken()

### auth.h

We create a single function called AcquireToken. Since the return value will be hard coded for this tutorial, we accept no parameters and simply return a string (the token).

```cpp
//auth.h
#include <string>

namespace sample {
  namespace auth {
    std::string AcquireToken();
  }
}
```

### auth.cpp

Our source file returns a token value that will be hard coded in a future step.

```cpp
//auth.cpp
#include <string>
#include "auth.h"

namespace sample {
  namespace auth {
    string AcquireToken() {
      std::string mToken = "your token here";
      return mToken;
    }
  }
}
```

## Mint a token

Finally, mint a token to put in the mToken variable. The example below demonstrates a PowerShell script that can be used to quickly obtain the OAuth2 token via ADAL and PowerShell on Windows. This token is granted for the Office 365 Security and Compliance Center endpoint only. Consequently, protection actions will fail unless the resource URL is updated. It's recommended to skip to the [next steps](#next-steps) section if you would like to test with both labeling and protection at this point.

### Install [ADAL.PS](https://www.powershellgallery.com/packages/ADAL.PS/3.19.4.2) from PS Gallery

```PowerShell
Install-Module -Name ADAL.PS
```

### Use Get-ADALToken to Obtain the Access Token

```PowerShell
#Install the ADAL.PS package if it's not installed.
if(!(Get-Package adal.ps)) { Install-Package -Name adal.ps }

$authority = "https://login.windows.net/common/oauth2/authorize" 
#this is the security and compliance center endpoint
$resourceUrl = "https://dataservice.o365filtering.com"
#clientId and redirectUri are from the RMS Sharing Application. 
#Once custom app registration is supported, a custom id and uri will be required. 
$clientId = "6b069eef-9dde-4a29-b402-8ce866edc897"
$redirectUri = "com.microsoft.rms-sharing-for-win://authorize"

$response = Get-ADALToken -Resource $resourceUrl -ClientId $clientId -RedirectUri $redirectUri -Authority $authority -PromptBehavior:Always
$response.AccessToken | clip
```

Copy the token from the clipboard in to auth.cpp as the value for `string mToken`, replacing "your token here" above. Running the script again may be required, depending on how long the following steps take.

## Creating the AuthDelegateImpl object.

Using the auth delegate 

## Next Steps

With the authentication delegate implemented, even in this simple form, it's now possible to add a profile and engine using `authDelegateImpl` and perform engine operations using the SDK, as long as those operations are labeling-only. 

- Download and run the simple auth sample code from GitHub
- [Python Authentication Example]()
- [Node.js Authentication Example]()
- [Add a File Profile Example]()
- [Add a Policy Profile Example]()
- [Add a Protection Profile Example]()