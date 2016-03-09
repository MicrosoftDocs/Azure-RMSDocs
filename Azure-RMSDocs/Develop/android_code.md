Android code examples
===============================================================

This topic will introduce you to important code elements for the Android version of the RMS SDK.

**Note**  In the example code and descriptions that follow, we use the term MSIPC (Microsoft Information Protection and Control) to reference the client process.

 

<span id="Using_the_Microsoft_Rights_Management_SDK_4.2_-_key_scenarios"></span><span id="using_the_microsoft_rights_management_sdk_4.2_-_key_scenarios"></span><span id="USING_THE_MICROSOFT_RIGHTS_MANAGEMENT_SDK_4.2_-_KEY_SCENARIOS"></span>Using the Microsoft Rights Management SDK 4.2 - key scenarios
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Following are code examples from a larger sample application representing development scenarios important to your orientation to this SDK. These demonstrate; use of Microsoft Protected File format referred to as protected file , use of custom protected file formats, and use of custom UI controls.

The sample application, *MSIPCSampleApp*, is available for use with this SDK for the Android operating system. See [rms-sdk-ui-for-android](https://github.com/AzureAD/rms-sdk-ui-for-android) on GitHub for access to this sample application.

<span id="Scenario__Consume_an_RMS_protected_file"></span><span id="scenario__consume_an_rms_protected_file"></span><span id="SCENARIO__CONSUME_AN_RMS_PROTECTED_FILE"></span>**Scenario**: Consume an RMS protected file
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-   **Step 1**: Create a [**ProtectedFileInputStream**](xref:msipcthin2.protectedfileinputstream_class_java)

    **Source**: *MsipcAuthenticationCallback.java*

    **Description**: Instantiate a [**ProtectedFileInputStream**](xref:msipcthin2.protectedfileinputstream_class_java) object, through its create method which implements service authentication using the [**AuthenticationRequestCallback**](xref:msipcthin2.authenticationrequestcallback_interface_java) to get a token by passing an instance of **AuthenticationRequestCallback**, as the parameter *mRmsAuthCallback*, to the MSIPC API. See the call to [**ProtectedFileInputStream.create**](xref:msipcthin2.protectedfileinputstream_create_method) near the end of the following example code section.

    <span codelanguage="Java"></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">Java</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code>public void startContentConsumptionFromPtxtFileFormat(InputStream inputStream)
        {
            CreationCallback&lt;ProtectedFileInputStream&gt; protectedFileInputStreamCreationCallback = 
              new CreationCallback&lt;ProtectedFileInputStream&gt;()
            {
                @Override
                public Context getContext()
                {
                   …
               }

                @Override
                public void onCancel()
                {
                   …
                }

                @Override
                public void onFailure(ProtectionException e)
                {
                   …
                }

                @Override
                public void onSuccess(ProtectedFileInputStream protectedFileInputStream)
                {
                   …
                   …
                    byte[] dataChunk = new byte[16384];
                    try
                    {
                        while ((nRead = protectedFileInputStream.read(dataChunk, 0, 
                                dataChunk.length)) != -1)
                        {
                            …
                        }
                         …
                        protectedFileInputStream.close();
                    }
                    catch (IOException e)
                    {
                      …
                    }  
              }
            };
            try
            {
               …
                ProtectedFileInputStream.create(inputStream, null, mRmsAuthCallback, 
                                                PolicyAcquisitionFlags.NONE, 
                                                protectedFileInputStreamCreationCallback);
            }
            catch (com.microsoft.rightsmanagement.exceptions.InvalidParameterException e)
            {
                …
            }
        }</code></pre></td>
    </tr>
    </tbody>
    </table>

-   **Step 2**: Setup authentication using the Active Directory Authentication Library (ADAL).

    **Source**: *MsipcAuthenticationCallback.java*.

    **Description**: In this step you will see ADAL used to implement an [**AuthenticationRequestCallback**](xref:msipcthin2.authenticationrequestcallback_interface_java) with example authentication parameters. For more information on using ADAL, see the [Azure AD Authentication Library (ADAL)](https://msdn.microsoft.com/en-us/library/jj573266.aspx).

    <span codelanguage="Java"></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">Java</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code>class MsipcAuthenticationCallback implements AuthenticationRequestCallback
    {

        ...
        ...

        @Override
        public void getToken(Map&lt;String, String&gt; authenticationParametersMap,
                             final AuthenticationCompletionCallback authenticationCompletionCallbackToMsipc)
        {
            String authority = authenticationParametersMap.get(&quot;oauth2.authority&quot;);
            String resource = authenticationParametersMap.get(&quot;oauth2.resource&quot;);
            String userId = authenticationParametersMap.get(&quot;userId&quot;);
            final String userHint = (userId == null)? &quot;&quot; : userId; 
            AuthenticationContext authenticationContext = App.getInstance().getAuthenticationContext();
            if (authenticationContext == null || !authenticationContext.getAuthority().equalsIgnoreCase(authority))
            {
                try
                {
                    authenticationContext = new AuthenticationContext(App.getInstance().getApplicationContext(), authority, …);
                    App.getInstance().setAuthenticationContext(authenticationContext);
                }
                catch (NoSuchAlgorithmException e)
                {
                    …
                    authenticationCompletionCallbackToMsipc.onFailure();
                }
                catch (NoSuchPaddingException e)
                {
                    …
                    authenticationCompletionCallbackToMsipc.onFailure();
                }
           }
            App.getInstance().getAuthenticationContext().acquireToken(mParentActivity, resource, mClientId, mRedirectURI, userId, mPromptBehavior,
                           &quot;&amp;USERNAME=&quot; + userHint, new AuthenticationCallback&lt;AuthenticationResult&gt;()
                            {
                                @Override
                                public void onError(Exception exc)
                                {
                                    …
                                    if (exc instanceof AuthenticationCancelError)
                                    {
                                         …
                                        authenticationCompletionCallbackToMsipc.onCancel();
                                    }
                                    else
                                    {
                                         …
                                        authenticationCompletionCallbackToMsipc.onFailure();
                                    }
                                }

                                @Override
                                public void onSuccess(AuthenticationResult result)
                                {
                                    …
                                    if (result == null || result.getAccessToken() == null
                                            || result.getAccessToken().isEmpty())
                                    {
                                         …
                                    }
                                    else
                                    {
                                        // request is successful
                                        …
                                        authenticationCompletionCallbackToMsipc.onSuccess(result.getAccessToken());
                                    }
                                }
                            });
                             }
    </code></pre></td>
    </tr>
    </tbody>
    </table>

-   **Step 3**: Check if the **Edit** right exists for this user with this content via the [**accessCheck**](xref:msipcthin2.userpolicy_accesscheck_method_java) method of [**UserPolicy**](xref:msipcthin2.userpolicy_class_java).

    **Source**: *TextEditorFragment.java*

    <span codelanguage="Java"></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">Java</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code>         //check if user has edit rights and apply enforcements
                if (!mUserPolicy.accessCheck(EditableDocumentRights.Edit))
                {
                    mTextEditor.setFocusableInTouchMode(false);
                    mTextEditor.setFocusable(false);
                    mTextEditor.setEnabled(false);
                    …
                }</code></pre></td>
    </tr>
    </tbody>
    </table>

<span id="Scenario__Create_a_new_protected_file_using_a_template"></span><span id="scenario__create_a_new_protected_file_using_a_template"></span><span id="SCENARIO__CREATE_A_NEW_PROTECTED_FILE_USING_A_TEMPLATE"></span>**Scenario**: Create a new protected file using a template
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

This scenario begins with getting a list of templates, selecting the first one to create a policy, then creates and writes to the new protected file.

-   **Step 1**: Get list of templates via a [**TemplateDescriptor**](xref:msipcthin2.templatedescriptor_class_java) object.

    **Source**: *MsipcTaskFragment.java*

    **Description**: TBD

    <span codelanguage="Java"></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">Java</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code>CreationCallback&lt;List&lt;TemplateDescriptor&gt;&gt; getTemplatesCreationCallback = new CreationCallback&lt;List&lt;TemplateDescriptor&gt;&gt;()
      {
          @Override
          public Context getContext()
          {
              …
          }

          @Override
          public void onCancel()
          {
              …
          }

          @Override
          public void onFailure(ProtectionException e)
          {
              …
          }

          @Override
          public void onSuccess(List&lt;TemplateDescriptor&gt; templateDescriptors)
          {
             …
          }
      };
      try
      {
              …
          mIAsyncControl = TemplateDescriptor.getTemplates(emailId, mRmsAuthCallback, getTemplatesCreationCallback);
      }
      catch (com.microsoft.rightsmanagement.exceptions.InvalidParameterException e)
      {
              …
      }</code></pre></td>
    </tr>
    </tbody>
    </table>

    **Step 2**: Create a [**UserPolicy**](xref:msipcthin2.userpolicy_class_java) using the first template in the list.

    **Source**: *MsipcTaskFragment.java*

    **Description**: TBD

    <span codelanguage="Java"></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">Java</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code> CreationCallback&lt;UserPolicy&gt; userPolicyCreationCallback = new CreationCallback&lt;UserPolicy&gt;()
     {
          @Override
          public Context getContext()
          {
              …
          }

          @Override
          public void onCancel()
          {
              …
          }

          @Override
          public void onFailure(ProtectionException e)
          {
              …
          }

          @Override
          public void onSuccess(final UserPolicy item)
          {
              …
          }
      };
      try
      {
           …
          mIAsyncControl = UserPolicy.create((TemplateDescriptor)selectedDescriptor, mEmailId, mRmsAuthCallback,
                            UserPolicyCreationFlags.NONE, userPolicyCreationCallback);
           …
      }
      catch (InvalidParameterException e)
      {
              …
      }</code></pre></td>
    </tr>
    </tbody>
    </table>

    **Step 3**: Create a [**ProtectedFileOutputStream**](xref:msipcthin2.protectedfileoutputstream_class_java) and write content to it.

    **Source**: *MsipcTaskFragment.java*

    **Description**: TBD

    <span codelanguage="Java"></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">Java</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code>   private void createPTxt(final byte[] contentToProtect)
        {
             …
            CreationCallback&lt;ProtectedFileOutputStream&gt; protectedFileOutputStreamCreationCallback = new CreationCallback&lt;ProtectedFileOutputStream&gt;()
            {
                @Override
                public Context getContext()
                {
                 …
                }

                @Override
                public void onCancel()
                {
                 …
                }

                @Override
                public void onFailure(ProtectionException e)
                {
                 …
                }

                @Override
                public void onSuccess(ProtectedFileOutputStream protectedFileOutputStream)
                {
                    try
                    {
                        // write to this stream
                        protectedFileOutputStream.write(contentToProtect);
                        protectedFileOutputStream.flush();
                        protectedFileOutputStream.close();
                        …
                    }
                    catch (IOException e)
                    {
                        …
                    }
                }
            };
            try
            {
                File file = new File(filePath);
                outputStream = new FileOutputStream(file);
                mIAsyncControl = ProtectedFileOutputStream.create(outputStream, mUserPolicy, originalFileExtension,
                        protectedFileOutputStreamCreationCallback);
            }
            catch (FileNotFoundException e)
            {
                 …
            }
            catch (InvalidParameterException e)
            {
                 …
            }
        }</code></pre></td>
    </tr>
    </tbody>
    </table>

<span id="Scenario__Open_a_custom_protected_file"></span><span id="scenario__open_a_custom_protected_file"></span><span id="SCENARIO__OPEN_A_CUSTOM_PROTECTED_FILE"></span>**Scenario**: Open a custom protected file
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-   **Step 1**: Create a [**UserPolicy**](xref:msipcthin2.userpolicy_class_java) from a *serializedContentPolicy*.

    **Source**: *MsipcTaskFragment.java*

    <span codelanguage="Java"></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">Java</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code>CreationCallback&lt;UserPolicy&gt; userPolicyCreationCallbackFromSerializedContentPolicy = new CreationCallback&lt;UserPolicy&gt;()
            {
                @Override
                public void onSuccess(UserPolicy userPolicy)
                {
                  …
                }

                @Override
                public void onFailure(ProtectionException e)
                {
                  …
                }

                @Override
                public void onCancel()
                {
                  …
                }

                @Override
                public Context getContext()
                {
                  …
                }
            };


    try
    {
      ...

      // Read the serializedContentPolicyLength from the inputStream.
      long serializedContentPolicyLength = readUnsignedInt(inputStream);

      // Read the PL bytes from the input stream using the PL size.
      byte[] serializedContentPolicy = new byte[(int)serializedContentPolicyLength];
      inputStream.read(serializedContentPolicy);

      ...
                
      UserPolicy.acquire(serializedContentPolicy, null, mRmsAuthCallback, PolicyAcquisitionFlags.NONE,
              userPolicyCreationCallbackFromSerializedContentPolicy);
    }
    catch (com.microsoft.rightsmanagement.exceptions.InvalidParameterException e)
    {
      ...
    }
    catch (IOException e)
    {
      ...
    }
      </code></pre></td>
    </tr>
    </tbody>
    </table>

    **Step 2**: Create a [**CustomProtectedInputStream**](xref:msipcthin2.customprotectedinputstream_class_java) using the [**UserPolicy**](xref:msipcthin2.userpolicy_class_java) from **Step 1**.

    **Source**: *MsipcTaskFragment.java*

    <span codelanguage="Java"></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">Java</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code> CreationCallback&lt;CustomProtectedInputStream&gt; customProtectedInputStreamCreationCallback = new CreationCallback&lt;CustomProtectedInputStream&gt;()
     {
         @Override
         public Context getContext()
         {
             …
         }

         @Override
         public void onCancel()
         {
             …
         }

         @Override
         public void onFailure(ProtectionException e)
         {
             …
         }

         @Override
         public void onSuccess(CustomProtectedInputStream customProtectedInputStream)
         {
            …

             byte[] dataChunk = new byte[16384];
             try
             {
                 while ((nRead = customProtectedInputStream.read(dataChunk, 0, dataChunk.length)) != -1)
                 {
                      …
                 }
                  …
                 customProtectedInputStream.close();
             }
             catch (IOException e)
             {
                …
             }
             …
         }
     };

    try
    {
      ...
                        
      // Retrieve the encrypted content size.
      long encryptedContentLength = readUnsignedInt(inputStream);
                        
      updateTaskStatus(new TaskStatus(TaskState.Starting, &quot;Consuming content&quot;, true));
                        
      CustomProtectedInputStream.create(userPolicy, inputStream, 
                                     encryptedContentLength,
                                     customProtectedInputStreamCreationCallback);
    }
    catch (com.microsoft.rightsmanagement.exceptions.InvalidParameterException e)
    {
      ...
    }
    catch (IOException e)
    {
      ...
    }</code></pre></td>
    </tr>
    </tbody>
    </table>

    **Step 3**: Read content from the [**CustomProtectedInputStream**](xref:msipcthin2.customprotectedinputstream_class_java) into *mDecryptedContent* then close.

    **Source**: *MsipcTaskFragment.java*

    <span codelanguage="Java"></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">Java</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code>@Override
    public void onSuccess(CustomProtectedInputStream customProtectedInputStream)
    {
      mUserPolicy = customProtectedInputStream.getUserPolicy();
      ByteArrayOutputStream buffer = new ByteArrayOutputStream();
                            
      int nRead;                      
      byte[] dataChunk = new byte[16384];

      try
      {
        while ((nRead = customProtectedInputStream.read(dataChunk, 0, 
                                                            dataChunk.length)) != -1)
        {
           buffer.write(dataChunk, 0, nRead);
        }
                                
        buffer.flush();
        mDecryptedContent = new String(buffer.toByteArray(), Charset.forName(&quot;UTF-8&quot;));
        
        buffer.close();
        customProtectedInputStream.close();
      }
      catch (IOException e)
      {
        ...
      }
    }</code></pre></td>
    </tr>
    </tbody>
    </table>

<span id="Scenario__Create_a_custom_protected_file_using_a_custom__ad-hoc__policy"></span><span id="scenario__create_a_custom_protected_file_using_a_custom__ad-hoc__policy"></span><span id="SCENARIO__CREATE_A_CUSTOM_PROTECTED_FILE_USING_A_CUSTOM__AD-HOC__POLICY"></span>**Scenario**: Create a custom protected file using a custom (ad-hoc) policy
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-   **Step 1**: With an email address provided by the user, create a policy descriptor.

    **Source**: *MsipcTaskFragment.java*

    **Description**: In practice the following objects would be created by using user inputs from the device interface; [**UserRights**](xref:msipcthin2.userrights_class_java) and [**PolicyDescriptor**](xref:msipcthin2.policydescriptor_interface_java).

    <span codelanguage="Java"></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">Java</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code>
      ...

      // create userRights list
      UserRights userRights = new UserRights(Arrays.asList(&quot;consumer@domain.com&quot;), 
        Arrays.asList( CommonRights.View, EditableDocumentRights.Print));
      ArrayList&lt;UserRights&gt; usersRigthsList = new ArrayList&lt;UserRights&gt;();
      usersRigthsList.add(userRights);
           
      // Create PolicyDescriptor using userRights list
      PolicyDescriptor policyDescriptor = PolicyDescriptor.createPolicyDescriptorFromUserRights(
                                                             usersRigthsList);
      policyDescriptor.setOfflineCacheLifetimeInDays(10);
      policyDescriptor.setContentValidUntil(new Date());
      
      ...</code></pre></td>
    </tr>
    </tbody>
    </table>

    **Step 2**: Create a custom [**UserPolicy**](xref:msipcthin2.userpolicy_class_java) from the policy descriptor, *selectedDescriptor*.

    **Source**: *MsipcTaskFragment.java*

    <span codelanguage="Java"></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">Java</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code>  
       ...
       mIAsyncControl = UserPolicy.create((PolicyDescriptor)selectedDescriptor, 
                                              mEmailId, mRmsAuthCallback,
                                              UserPolicyCreationFlags.NONE, 
                                              userPolicyCreationCallback);
       ...
    </code></pre></td>
    </tr>
    </tbody>
    </table>

-   **Step 3**: Create and write content to the [**CustomProtectedOutputStream**](xref:msipcthin2.customprotectedoutputstream_class_java) and then close.

    **Source**: *MsipcTaskFragment.java*

    <span codelanguage="Java"></span>
    <table>
    <colgroup>
    <col width="100%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">Java</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><pre><code>    File file = new File(filePath);
        final OutputStream outputStream = new FileOutputStream(file);
        CreationCallback&lt;CustomProtectedOutputStream&gt; customProtectedOutputStreamCreationCallback = new CreationCallback&lt;CustomProtectedOutputStream&gt;()
        {
            @Override
            public Context getContext()
            {
              …
            }

            @Override
            public void onCancel()
            {
              …
            }

            @Override
            public void onFailure(ProtectionException e)
            {
              …
            }

            @Override
            public void onSuccess(CustomProtectedOutputStream protectedOutputStream)
            {
                try
                {
                    // write serializedContentPolicy
                    byte[] serializedContentPolicy = mUserPolicy.getSerializedContentPolicy();
                    writeLongAsUnsignedIntToStream(outputStream, serializedContentPolicy.length);
                    outputStream.write(serializedContentPolicy);
                    // write encrypted content
                    if (contentToProtect != null)
                    {
                        writeLongAsUnsignedIntToStream(outputStream,
                                CustomProtectedOutputStream.getEncryptedContentLength(contentToProtect.length,
                                        protectedOutputStream.getUserPolicy()));
                        protectedOutputStream.write(contentToProtect);
                        protectedOutputStream.flush();
                        protectedOutputStream.close();
                    }
                    else
                    {
                        outputStream.flush();
                        outputStream.close();
                    }
                    …
                }
                catch (IOException e)
                {
                  …
                }
            }
        };
        try
        {
            mIAsyncControl = CustomProtectedOutputStream.create(outputStream, mUserPolicy,
                    customProtectedOutputStreamCreationCallback);
        }
        catch (InvalidParameterException e)
        {
          …
        }</code></pre></td>
    </tr>
    </tbody>
    </table>

 

 



