# Protection Handler Operations

## Summary

The `mip::ProtectionHandler` implements the core encryption and decryption functionality in the MIP SDK. The `ProtectionHandler` can:

- Create protected streams
- Encrypt and decrypt buffers
- Get information about the protected information such as size, owner, content ID, etc.
- Perform access checks on protected information

### Protection Handler Functions

### Requirements

The following assumes a `mip::ProtectionHandler` was already created and stored in an object called `handler`.

### Generating a Protected Stream

`mip::Stream`

#### Encrypt Protected Stream

#### Decrypt Protected Stream

### Working with Buffers

#### Encrypt a Buffer

```cpp
std::vector<uint8_t> inputBuffer(plaintext.begin(), plaintext.end());
std::vector<uint8_t> outputBuffer;

outputBuffer.resize(static_cast<size_t>(handler->GetProtectedContentLength(plaintext.size())));

handler->EncryptBuffer(0,
    &inputBuffer[0],
    static_cast<int64_t>(inputBuffer.size()),
    &outputBuffer[0],
    static_cast<int64_t>(outputBuffer.size()),
    true);
```

#### Store the Publishing License

#### Decrypt a Buffer using Publishing License

```cpp
std::vector<uint8_t> outputBuffer(static_cast<size_t>(ciphertext.size()));
std::vector<uint8_t> inputBuffer(ciphertext.begin(), ciphertext.end());

int64_t decryptedSize = handler->DecryptBuffer(
    0,
    &inputBuffer[0],
    static_cast<int64_t>(inputBuffer.size()),
    &outputBuffer[0],
    static_cast<int64_t>(outputBuffer.size()),
    true);
outputBuffer.resize(static_cast<size_t>(decryptedSize)); //Needed? 
```

### Perform an Access Check

### Get Metadata