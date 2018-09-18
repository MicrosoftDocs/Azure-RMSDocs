# Profiles

- [Profiles](#profiles)
    - [Summary](#summary)
    - [Profile Settings](#profile-settings)
    - [Next Steps](#next-steps)

## Summary

The profile is the root class for all operations in the MIP SDK. Before using any of the three APIs, a profile must be created and all future operations will be performed by the profile or by other objects *added* to the profile.

There are three types of profile in the MIP SDK:

- [`Profile`](https://docs.microsoft.com/en-us/azure/information-protection/develop/mip/class_mip_profile): The profile class for the MIP Policy API.
- [`ProtectionProfile`](https://docs.microsoft.com/en-us/azure/information-protection/develop/mip/class_mip_protectionprofile): The profile class for the MIP Protection API.
- [`FileProfile`](https://docs.microsoft.com/en-us/azure/information-protection/develop/mip/class_mip_fileprofile): The profile class for the MIP File API.

The API used in the consuming application will determine which profile class should be used.

The profile itself provides the following functionality:

- Defines storage location for SDK state. State data includes user details, downloaded user policies, logs, and telemetry data.
- Defines whether state should be loaded in memory or persisted to disk.
- Handles authentication by accepting a `mip::AuthDelegate`.
- Sets application ID and friendly name of the app consuming the SDK.

## Profile Settings

- `Path`: File path under which logging, telemetry, and other persistent state is stored.
- `useInMemoryStorage`: A bool that defines whether or not all state should be stored in memory as opposed to on disk.
- `authDelegate`: A shared pointer of class `mip::AuthDelegate` (See [Auth Section]())
- `consentDelegate`: A shared pointer of class `mip::ConsentDelegate`.
- `observer`: A shared pointer to the [`Profile::Observer`]() implementation.
- `applicationInfo`: A `mip::ApplicationInfo` object. Used to define info regarding application that is consuming the SDK.

## Next Steps

The next important MIP SDK concept to understand is the [`Engine.`]()