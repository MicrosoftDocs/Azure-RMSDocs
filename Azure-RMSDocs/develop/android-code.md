---
# required metadata

title: Android code examples | Azure RMS
description: This topic will introduce you to important code elements for the Android version of the RMS SDK.
keywords:
author: bryanla
ms.author: bryanla
manager: barbkess
ms.date: 12/10/2018
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 58CC2E50-1E4D-4621-A947-25312C3FF519
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Android code examples

This article shows how to code elements for the Android version of the RMS SDK.

**Note** In this article, The term _MSIPC_ (Microsoft Information Protection and Control) refers to the client process.


## Using the Microsoft Rights Management SDK 4.2 - key scenarios

These code samples are taken from a larger sample application representing development scenarios important to your orientation to this SDK. They show how to use:

- The Microsoft Protected File format, also called a _protected file_.
- Custom protected file formats
- Custom user interface (UI) controls

The *MSIPCSampleApp* sample application is available for use with this SDK for the Android operating system. To learn more, see [rms-sdk-ui-for-android](https://github.com/AzureAD/rms-sdk-ui-for-android).

### Scenario: Consume an RMS protected file

- **Step 1**: Create a [ProtectedFileInputStream](https://msdn.microsoft.com/library/dn790851.aspx).

    **Source**: *MsipcAuthenticationCallback.java*

    **Description**: Instantiate a [ProtectedFileInputStream](https://msdn.microsoft.com/library/dn790851.aspx) object and implement service authentication.  Use the [AuthenticationRequestCallback](https://msdn.microsoft.com/library/dn758250.aspx) to get a token by passing an instance of **AuthenticationRequestCallback**, as the parameter *mRmsAuthCallback*, to the MSIPC API. See the call to [ProtectedFileInputStream.create](https://msdn.microsoft.com/library/dn790851.aspx) near the end of the following example code section.

    ``` java
        public void startContentConsumptionFromPtxtFileFormat(InputStream inputStream)
        {
            CreationCallback<ProtectedFileInputStream> protectedFileInputStreamCreationCallback =
              new CreationCallback<ProtectedFileInputStream>()
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
        }
    ```

- **Step 2**: Set up authentication using the Active Directory Authentication Library (ADAL).

    **Source**: *MsipcAuthenticationCallback.java*.

    **Description**: This step uses ADAL to implement an [AuthenticationRequestCallback](https://msdn.microsoft.com/library/dn758255.aspx) with example authentication parameters. To learn more, see the [Azure AD Authentication Library (ADAL)](https://msdn.microsoft.com/library/jj573266.aspx).


~~~
``` java
    class MsipcAuthenticationCallback implements AuthenticationRequestCallback
    {

    …

    @Override
    public void getToken(Map<String, String> authenticationParametersMap,
                         final AuthenticationCompletionCallback authenticationCompletionCallbackToMsipc)
    {
        String authority = authenticationParametersMap.get("oauth2.authority");
        String resource = authenticationParametersMap.get("oauth2.resource");
        String userId = authenticationParametersMap.get("userId");
        final String userHint = (userId == null)? "" : userId;
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
                       "&USERNAME=" + userHint, new AuthenticationCallback<AuthenticationResult>()
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
                        }

                        );
                  }
```
~~~

- **Step 3**: Check if the **Edit** right exists for this user with this content via the [UserPolicy.accessCheck](https://msdn.microsoft.com/library/dn790885.aspx) method.

    **Source**: *TextEditorFragment.java*

    ``` java
         //check if user has edit rights and apply enforcements
                if (!mUserPolicy.accessCheck(EditableDocumentRights.Edit))
                {
                    mTextEditor.setFocusableInTouchMode(false);
                    mTextEditor.setFocusable(false);
                    mTextEditor.setEnabled(false);
                    …
                }
    ```


### Scenario: Create a new protected file using a template

This scenario begins with getting a list of templates, selecting the first one to create a policy, then creates and writes to the new protected file.

- **Step 1**: Get list of templates via a [TemplateDescriptor](https://msdn.microsoft.com/library/dn790871.aspx) object.

    **Source**: *MsipcTaskFragment.java*

    ``` java
    CreationCallback<List<TemplateDescriptor>> getTemplatesCreationCallback = new CreationCallback<List<TemplateDescriptor>>()
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
          public void onSuccess(List<TemplateDescriptor> templateDescriptors)
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
      }
    ```

- **Step 2**: Create a [UserPolicy](https://msdn.microsoft.com/library/dn790887.aspx) using the first template in the list.

    **Source**: *MsipcTaskFragment.java*

    ``` java
      CreationCallback<UserPolicy> userPolicyCreationCallback = new CreationCallback<UserPolicy>()
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
      }
    ```

-  **Step 3**: Create a [ProtectedFileOutputStream](https://msdn.microsoft.com/library/dn790855.aspx) and write content to it.

    **Source**: *MsipcTaskFragment.java*

    ``` java
    private void createPTxt(final byte[] contentToProtect)
        {
             …
            CreationCallback<ProtectedFileOutputStream> protectedFileOutputStreamCreationCallback = new CreationCallback<ProtectedFileOutputStream>()
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
        }
    ```


### Scenario: Open a custom protected file

- **Step 1**: Create a [UserPolicy](https://msdn.microsoft.com/library/dn790887.aspx) from a *serializedContentPolicy*.

    **Source**: *MsipcTaskFragment.java*

    ``` java
    CreationCallback<UserPolicy> userPolicyCreationCallbackFromSerializedContentPolicy = new CreationCallback<UserPolicy>()
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


~~~
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
```
~~~


- **Step 2**: Create a [CustomProtectedInputStream](https://msdn.microsoft.com/library/dn758271.aspx) using the [UserPolicy](https://msdn.microsoft.com/library/dn790887.aspx) from **Step 1**.

    **Source**: *MsipcTaskFragment.java*

    ``` java
      CreationCallback<CustomProtectedInputStream> customProtectedInputStreamCreationCallback = new CreationCallback<CustomProtectedInputStream>()
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

      updateTaskStatus(new TaskStatus(TaskState.Starting, "Consuming content", true));

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
    }
    ```

- **Step 3**: Read content from the [CustomProtectedInputStream](https://msdn.microsoft.com/library/dn758271.aspx) into *mDecryptedContent* then close.

    **Source**: *MsipcTaskFragment.java*

    ``` java
    @Override
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
        mDecryptedContent = new String(buffer.toByteArray(), Charset.forName("UTF-8"));

        buffer.close();
        customProtectedInputStream.close();
      }
      catch (IOException e)
      {
        ...
      }
    }
    ```

### Scenario: Create a custom protected file using a custom policy

- **Step 1**: With an email address provided by the user, create a policy descriptor.

    **Source**: *MsipcTaskFragment.java*

    **Description**: In practice, the following objects would be created by using user inputs from the device interface; [UserRights](https://msdn.microsoft.com/library/dn790911.aspx) and [PolicyDescriptor](https://msdn.microsoft.com/library/dn790843.aspx).

    ``` java
      // create userRights list
      UserRights userRights = new UserRights(Arrays.asList("consumer@domain.com"),
        Arrays.asList( CommonRights.View, EditableDocumentRights.Print));
      ArrayList<UserRights> usersRigthsList = new ArrayList<UserRights>();
      usersRigthsList.add(userRights);

      // Create PolicyDescriptor using userRights list
      PolicyDescriptor policyDescriptor = PolicyDescriptor.createPolicyDescriptorFromUserRights(
                                                             usersRigthsList);
      policyDescriptor.setOfflineCacheLifetimeInDays(10);
      policyDescriptor.setContentValidUntil(new Date());
    ```


- **Step 2**: Create a custom [UserPolicy](https://msdn.microsoft.com/library/dn790887.aspx) from the policy descriptor, *selectedDescriptor*.

    **Source**: *MsipcTaskFragment.java*

    ``` java
       mIAsyncControl = UserPolicy.create((PolicyDescriptor)selectedDescriptor,
         mEmailId, mRmsAuthCallback, UserPolicyCreationFlags.NONE, userPolicyCreationCallback);
    ```


- **Step 3**: Create and write content to the [CustomProtectedOutputStream](https://msdn.microsoft.com/library/dn758274.aspx) and then close.

    **Source**: *MsipcTaskFragment.java*

    ``` java
    File file = new File(filePath);
        final OutputStream outputStream = new FileOutputStream(file);
        CreationCallback<CustomProtectedOutputStream> customProtectedOutputStreamCreationCallback = new CreationCallback<CustomProtectedOutputStream>()
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
        }
    ```
