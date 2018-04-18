# class mip::ConsentCallback 
Interface for consent request notifications.
This callback is implemented by a client application to know when a consent notification should be displayed to the user.
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public ConsentList ConsentsConsentList & consents) | Called when SDK requires user consent for an operation.
## Members
### ConsentList
Called when SDK requires user consent for an operation.
#### Parameters
* consents The list of consents requested by SDK
#### Returns
[Consent](#classmip_1_1_consent) results
When consents are requested by the SDK, the client application should obtain consent from the user, the results of each consent should be stored via [Consent::Result(const ConsentResult&)](#classmip_1_1_consent_1ad6c17d9af548a40b2fe854fe0d9bca64), and a list of the resolved consents should be returned.