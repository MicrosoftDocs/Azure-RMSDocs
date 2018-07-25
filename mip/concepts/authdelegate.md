# MIP SDK Authentication Delegate

- [MIP SDK Authentication Delegate](#mip-sdk-authentication-delegate)
  - [Summary](#summary)
  - [Next Steps](#next-steps)

## Summary

Authentication in the MIP SDK is performed by extending the class `mip::AuthDelegate` to implement your preferred method of authentication.

`mip::AuthDelegate` contains two classes:

- `mip::AuthDelegate::OAuth2Challenge`
- `mip::AuthDelegate::OAuth2Token`

`AuthDelegate` has a virtual function called `mip::AuthDelegate::AcquireOAuth2Token`. This virtual function should be extended by developers to use their preferred method of access token acquisition. 

`mip::AuthDelegate::AcquireOAuth2Token` accepts three parameters:

- `mip::Identity`: The identity of the user or service to be authenticated, if known.
- `mip::AuthDelegate::OAuth2Challenge`: Accepts two parameters, **authority** and **resource**. **Authority** is the service the token will be generated against. **Resource** is the service we're trying to access. The SDK will handle passing these parameters in to the delegate when called.
- `mip::AuthDelegate::OAuth2Token`: We will write the token result to this object. It will be consumed by the SDK when the engine is loaded. Outside of our authentication implementation, it shouldn't be necessary to get or set this value anywhere.

`AcquireOAuth2Token` returns a bool that indicates whether token acquisition was successful.

**Important:** Applications won't ever have to call `AcquireOAuth2Token` directly. The SDK will call this on the auth delegate implementation when required.

## Next Steps

For simplicity, samples demonstrating the delegate will implement token acquisition by calling an external Python or Node.js script. This script can be replaced by any other type of script, an open source OAuth2 library, or a custom OAuth2 library.

- [Implementing AuthDelegateImpl]()
