iOS/OS X code examples
==========================================================================

This topic will introduce you to important code elements for the iOS/OS X version of the RMS SDK.

**Note**  In the example code and descriptions that follow, we use the term MSIPC (Microsoft Information Protection and Control) to reference the client process.

 

<span id="Using_the_Microsoft_Rights_Management_SDK_4.2_-_key_scenarios"></span><span id="using_the_microsoft_rights_management_sdk_4.2_-_key_scenarios"></span><span id="USING_THE_MICROSOFT_RIGHTS_MANAGEMENT_SDK_4.2_-_KEY_SCENARIOS"></span>Using the Microsoft Rights Management SDK 4.2 - key scenarios
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Following are **Objective C** code examples from a larger sample application representing development scenarios important to your orientation to this SDK. These demonstrate; use of Microsoft Protected File format referred to as protected file , use of custom protected file formats, and use of custom UI controls.

<span id="Scenario__Consume_an_RMS_protected_file"></span><span id="scenario__consume_an_rms_protected_file"></span><span id="SCENARIO__CONSUME_AN_RMS_PROTECTED_FILE"></span>**Scenario**: Consume an RMS protected file
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-   **Step 1**: Create an [**MSProtectedData**](xref:msipcthin2.msprotecteddata_interface_objc) object

    **Description**: Instantiate an [**MSProtectedData**](xref:msipcthin2.msprotecteddata_interface_objc) object, through its create method which implements service authentication using the [**MSAuthenticationCallback**](xref:msipcthin2.msauthenticationcallback_protocol_objc) to get a token by passing an instance of **MSAuthenticationCallback**, as the parameter *authenticationCallback*, to the MSIPC API. See the call to [**protectedDataWithProtectedFile**](xref:msipcthin2.msprotecteddata_protecteddatawithprotectedfile_completionblock_method_objc) in the following example code section.

    <span codelanguage=""></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code>+ (void)consumePtxtFile:(NSString *)path authenticationCallback:(id&lt;MSAuthenticationCallback&gt;)authenticationCallback
    {
          // userId can be provided as a hint for authentication
        [MSProtectedData protectedDataWithProtectedFile:path 
                                                 userId:nil 
                                 authenticationCallback:authenticationCallback 
                                                options:Default 
                                        completionBlock:^(MSProtectedData *data, NSError *error) {
            //Read the content from the ProtectedData, this will decrypt the data
            NSData *content = [data retrieveData];
        }];
    }</code></pre></td>
    </tr>
    </tbody>
    </table>

-   **Step 2**: Setup authentication using the Active Directory Authentication Library (ADAL).

    **Description**: In this step you will see ADAL used to implement an [**MSAuthenticationCallback**](xref:msipcthin2.msauthenticationcallback_protocol_objc) with example authentication parameters. For more information on using ADAL, see the Azure AD Authentication Library (ADAL).

    <span codelanguage=""></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code>// AuthenticationCallback holds the necessary information to retrieve an access token.
    @interface MsipcAuthenticationCallback : NSObject&lt;MSAuthenticationCallback&gt;
     
    @end
     
    @implementation MsipcAuthenticationCallback
     
    - (void)accessTokenWithAuthenticationParameters:
             (MSAuthenticationParameters *)authenticationParameters 
                                    completionBlock:
             (void(^)(NSString *accessToken, NSError *error))completionBlock
    {
        ADAuthenticationError *error;
        ADAuthenticationContext* context = [
           ADAuthenticationContext authenticationContextWithAuthority:authenticationParameters.authority 
                                                                error:&amp;error
        ];
        NSString *appClientId = @”com.microsoft.sampleapp”;
        NSURL *redirectURI = [NSURL URLWithString:@&quot;local://authorize&quot;];
        // Retrieve token using ADAL
        [context acquireTokenWithResource:authenticationParameters.resource
                                 clientId:appClientId
                              redirectUri:redirectURI
                                   userId:authenticationParameters.userId
                          completionBlock:^(ADAuthenticationResult *result) {
                              if (result.status != AD_SUCCEEDED)
                              {
                                  NSLog(@&quot;Auth Failed&quot;);
                                  completionBlock(nil, result.error);
                              }
                              else
                              {
                                  completionBlock(result.accessToken, result.error);
                              }
                          }];
    }</code></pre></td>
    </tr>
    </tbody>
    </table>

-   **Step 3**: Check if the Edit right exists for this user with this content via the [**accessCheck**](xref:msipcthin2.msuserpolicy_accesscheck_method_objc) method of a [**MSUserPolicy**](xref:msipcthin2.msuserpolicy_interface_objc) object.
    <span codelanguage=""></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code>- (void)accessCheckWithProtectedData:(MSProtectedData *)protectedData
    {
        //check if user has edit rights and apply enforcements
        if (!protectedData.userPolicy.accessCheck(EditableDocumentRights.Edit))
        {
            // enforce on the UI
            textEditor.focusableInTouchMode = NO;
            textEditor.focusable = NO;
            textEditor.enabled = NO;
        }
    }</code></pre></td>
    </tr>
    </tbody>
    </table>

<span id="Scenario__Create_a_new_protected_file_using_a_template"></span><span id="scenario__create_a_new_protected_file_using_a_template"></span><span id="SCENARIO__CREATE_A_NEW_PROTECTED_FILE_USING_A_TEMPLATE"></span>**Scenario**: Create a new protected file using a template
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

This scenario begins with getting a list of templates, [**MSTemplateDescriptor**](xref:msipcthin2.mstemplatedescriptor_interface_objc), selecting the first one to create a policy, then creating and writing to the new protected file.

-   **Step 1**: Get list of templates
    <span codelanguage=""></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code>+ (void)templateListUsageWithAuthenticationCallback:(id&lt;MSAuthenticationCallback&gt;)authenticationCallback
    {
        [MSTemplateDescriptor templateListWithUserId:@&quot;user@domain.com&quot;
                              authenticationCallback:authenticationCallback
                                     completionBlock:^(NSArray/*MSTemplateDescriptor*/ *templates, NSError *error)
         {
             // use templates array of MSTemplateDescriptor (Note: will be nil on error)
         }];
    }</code></pre></td>
    </tr>
    </tbody>
    </table>

-   **Step 2**: Create a[**MSUserPolicy**](xref:msipcthin2.msuserpolicy_interface_objc) using the first template in the list.
    <span codelanguage=""></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code> + (void)userPolicyCreationFromTemplateWithAuthenticationCallback:(id&lt;MSAuthenticationCallback&gt;)authenticationCallback
    {
        [MSUserPolicy userPolicyWithTemplateDescriptor:[templates objectAtIndex:0]
                                            userId:@&quot;user@domain.com&quot;
                                     signedAppData:nil
                            authenticationCallback:authenticationCallback
                                           options:None
                                   completionBlock:^(MSUserPolicy *userPolicy, NSError *error)
        {
            // use userPolicy (Note: will be nil on error)
        }];
    }</code></pre></td>
    </tr>
    </tbody>
    </table>

-   **Step 3**: Create a [**MSMutableProtectedData**](xref:msipcthin2.msmutableprotecteddata_interface_objc) and write content to it.
    <span codelanguage=""></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code>   
    + (void)createPtxtWithUserPolicy:(MSUserPolicy *)userPolicy contentToProtect:(NSData *)contentToProtect
    {
        // create an MSMutableProtectedData to write content
        [contentToProtect protectedDataInFile:filePath
                        originalFileExtension:kDefaultTextFileExtension
                               withUserPolicy:userPolicy
                              completionBlock:^(MSMutableProtectedData *data, NSError *error)
         {
             // use data (Note: will be nil on error)
         }];
    }</code></pre></td>
    </tr>
    </tbody>
    </table>

<span id="Scenario__Open_a_custom_protected_file"></span><span id="scenario__open_a_custom_protected_file"></span><span id="SCENARIO__OPEN_A_CUSTOM_PROTECTED_FILE"></span>**Scenario**: Open a custom protected file
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-   **Step 1**: Create a [**MSUserPolicy**](xref:msipcthin2.mspolicydescriptor_interface_objc)from a *serializedContentPolicy*.
    <span codelanguage=""></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code>+ (void)userPolicyWith:(NSData *)protectedData 
    authenticationCallback:(id&lt;MSAuthenticationCallback&gt;)authenticationCallback
    {
        // Read header information from protectedData and extract the  PL
        /*-------------------------------------------
         | PL length | PL | ContetSizeLength |
         -------------------------------------------*/
        NSUInteger serializedPolicySize;
        NSMutableData *serializedPolicy;
        [protectedData getBytes:&amp;serializedPolicySize length:sizeof(serializedPolicySize)];
        [protectedData getBytes:[serializedPolicy mutableBytes] length:serializedPolicySize];
        
        // Get the user policy , this is an async method as it hits the REST service
        // for content key and usage restrictions
         // userId provided as a hint for authentication
        [MSUserPolicy userPolicyWithSerializedPolicy:serializedPolicy
                                              userId:@&quot;user@domain.com&quot;
                              authenticationCallback:authenticationCallback
                                             options:Default
                                     completionBlock:^(MSUserPolicy *userPolicy, 
                                                       NSError *error)
         {
             
         }];
    }</code></pre></td>
    </tr>
    </tbody>
    </table>

-   **Step 2**: Create a [**MSCustomProtectedData**](xref:msipcthin2.mscustomprotecteddata_interface_objc) using the [**MSUserPolicy**](xref:msipcthin2.mspolicydescriptor_interface_objc) from **Step 1** and read from it.
    <span codelanguage=""></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code> + (void)customProtectedDataWith:(NSData *)protectedData
    {
        // Read header information from protectedData and extract the  protectedContentSize
        /*-------------------------------------------
         | PL length | PL | ContetSizeLength |
         -------------------------------------------*/
        NSUInteger protectedContentSize;
        [protectedData getBytes:&amp;protectedContentSize 
                         length:sizeof(protectedContentSize)];
        
        // Create the MSCustomProtector used for decrypting the content
        // The content start position is the header length
        [MSCustomProtectedData customProtectedDataWithPolicy:userPolicy
                                               protectedData:protectedData
                                        contentStartPosition:sizeof(NSUInteger) + serializedPolicySize
                                                 contentSize:protectedContentSize
                                             completionBlock:^(MSCustomProtectedData *customProtector,
                                                               NSError *error)
         {
             //Read the content from the custom protector, this will decrypt the data
             NSData *content = [customProtector retrieveData];
             NSLog(@&quot;%@&quot;, content);
         }];
    }</code></pre></td>
    </tr>
    </tbody>
    </table>

<span id="Scenario__Create_a_custom_protected_file_using_a_custom__ad-hoc__policy"></span><span id="scenario__create_a_custom_protected_file_using_a_custom__ad-hoc__policy"></span><span id="SCENARIO__CREATE_A_CUSTOM_PROTECTED_FILE_USING_A_CUSTOM__AD-HOC__POLICY"></span>**Scenario**: Create a custom protected file using a custom (ad-hoc) policy
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-   **Step 1**: With an email address provided by the user, create a policy descriptor.

    **Description**: In practice the following objects would be created by using user inputs from the device interface; [**MSUserRights**](xref:msipcthin2.msuserrights_interface_objc) and [**MSPolicyDescriptor**](xref:msipcthin2.mspolicydescriptor_interface_objc).

    <span codelanguage=""></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code>+ (void)policyDescriptor
    {
        MSUserRights *userRights = [[MSUserRights alloc] initWithUsers:[NSArray arrayWithObjects: @&quot;user1@domain.com&quot;, @&quot;user2@domain.com&quot;, nil] rights:[MSEmailRights all]];
        
        MSPolicyDescriptor *policyDescriptor = [[MSPolicyDescriptor alloc] initWithUserRights:[NSArray arrayWithObjects:userRights, nil]];
        policyDescriptor.contentValidUntil = [[NSDate alloc] initWithTimeIntervalSinceNow:NSTimeIntervalSince1970 + 3600.0];
        policyDescriptor.offlineCacheLifetimeInDays = 10;
    }</code></pre></td>
    </tr>
    </tbody>
    </table>

-   **Step 2**: Create a custom [**MSUserPolicy**](xref:msipcthin2.mspolicydescriptor_interface_objc) from the policy descriptor, *selectedDescriptor*.

    **Source**: *filename*

    <span codelanguage=""></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code>+ (void)userPolicyWithPolicyDescriptor:(MSPolicyDescriptor *)policyDescriptor
    {
        [MSUserPolicy userPolicyWithPolicyDescriptor:policyDescriptor
                                          userId:@&quot;user@domain.com&quot;
                          authenticationCallback:authenticationCallback
                                         options:None
                                 completionBlock:^(MSUserPolicy *userPolicy, NSError *error)
        {
         // use userPolicy (Note: will be nil on error)
        }];
    }</code></pre></td>
    </tr>
    </tbody>
    </table>

-   **Step 3**: Create and write content to the [**MSMutableCustomProtectedData**](xref:msipcthin2.msmutablecustomprotecteddata_interface_objc) and then close.
    <span codelanguage=""></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code>+ (void)mutableCustomProtectedData:(NSMutableData *)backingData policy:(MSUserPolicy *)policy contentToProtect:(NSString *)contentToProtect
    {
        //Get the serializedPolicy from a given policy
        NSData *serializedPolicy = [policy serializedPolicy];
        
        // Write header information to backing data including the PL
        // ------------------------------------
        // | PL length | PL | ContetSizeLength |
        // -------------------------------------
        NSUInteger serializedPolicyLength = [serializedPolicy length];
        [backingData appendData:[NSData dataWithBytes:&amp;serializedPolicyLength length:sizeof(serializedPolicyLength)]];
        [backingData appendData:serializedPolicy];
         NSUInteger protectedContentLength = [MSCustomProtectedData getEncryptedContentLengthWithPolicy:policy contentLength:unprotectedData.length];
        [backingData appendData:[NSData dataWithBytes:&amp;protectedContentLength length:sizeof(protectedContentLength)]];
        
        NSUInteger headerLength = sizeof(serializedPolicyLength) + serializedPolicyLength + sizeof(protectedContentLength);
        
        // Create the MSMutableCustomProtector used for encrypting content
        // The content start position is the current length of the backing data
        // The encryptedContentSize content size is 0 since there is no content yet
        [MSMutableCustomProtectedData customProtectorWithUserPolicy:policy
                                                        backingData:backingData
                                             protectedContentOffset:headerLength
                                                    completionBlock:^(MSMutableCustomProtectedData *customProtector,
                                                                      NSError *error)
         {
             //Append data to the custom protector, this will encrypt the data and write it to the backing data
             [customProtector appendData:[contentToProtect dataUsingEncoding:NSUTF8StringEncoding] error:&amp;error];
             
             //close the custom protector so it will flush and finalise encryption
             [customProtector close:&amp;error];
             
         }];
    }
       </code></pre></td>
    </tr>
    </tbody>
    </table>

 

 



