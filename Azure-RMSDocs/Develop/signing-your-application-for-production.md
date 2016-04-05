
# Signing your application for production

This topic leads you through the process of signing your application for production mode.

## Sign your rights-enabled application

These steps assume that you have already signed your application for a pre-production hierarchy. If you have not already done so, go through the process described in [Testing your rights-enabled application](running_your_first_application.md).

Once you have received the production certificate from Microsoft, you have the following files with you:

-   YourPrivateKey.dat
-   YourPublicKey.dat
-   ProductionCertificate.xml

Place them in the same directory with *GenManifest.exe* and your application binary (.exe).

-   The process below takes you through creating a new MCF file with production certificate:

    -   Create a new directory and place files in that new directory. Use Notepad.exe to create an MCF file for your application. The file should have the following contents.

        ``` syntax
        AUTO-GUID
        .\\YourPrivateKey.dat
        modulelist
        req     .\\<yourappname>.exe
        POLICYLIST
        INCLUSION
        PUBLICKEY .\\YourPublicKey.dat
        EXCLUSION
        ```

    -   Run the following command to sign your application:

        **genmanifest.exe -chain ProductionCertificate.xml** *YourAppName***.mcf** *YourAppName***.exe.man**

        If Genmanifest was successful, you'll see only the following text:

        If Genmanifest failed, you'll see an error message.

    -   Your *YourAppName*.exe.man should always be placed in the same directory as *YourAppName*.exe.

### Related topics

* [How-to use](how_to_use_msipc.md)
* [Testing your rights-enabled application](running_your_first_application.md)
 

 



