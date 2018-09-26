# class mip::CustomProtectedStream 
Wraps a stream to provide transparent encryption and decryption on read and write.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::shared_future<int64_t> ReadAsync(uint8_t* pbBuffer, int64_t cbBuffer, int64_t cbOffset, std::launch launchType)  |  Reads a block of data from stream asynchronously.
public std::shared_future<int64_t> WriteAsync(const uint8_t* cpbBuffer, int64_t cbBuffer, int64_t cbOffset, std::launch launchType)  |  Writes a block of data into stream asynchronously.
public std::future<bool> FlushAsync(std::launch launchType)  |  Flushes output stream buffer asynchronously.
 public int64_t Read(uint8_t* pbBuffer, int64_t cbBuffer)  |  Reads a block of data from stream synchronously.
public virtual std::vector<uint8_t> Read(uint64_t u64size)  |  Reads a block of data from stream synchronously.
 public int64_t Write(const uint8_t* cpbBuffer, int64_t cbBuffer)  |  Writes a block of data into stream synchronously.
 public bool Flush()  |  Flushes output stream buffer synchronously.
 public SharedStream Clone()  |  Clones stream.
 public void Seek(uint64_t u64Position)  |  Seeks to a position within the stream.
 public bool CanRead() const  |  Gets whether or not stream can be read.
 public bool CanWrite() const  |  Gets whether or not stream can be written.
 public uint64_t Position()  |  Gets current position of stream from beginning (in bytes)
 public uint64_t Size()  |  Gets size of stream (in bytes)
 public void Size(uint64_t u64Value)  |  Sets size of stream (in bytes)
  
## Members
  
### ReadAsync
Reads a block of data from stream asynchronously.

Parameters:  
* **pbBuffer**: Buffer into which stream should be read 


* **cbBuffer**: Size of buffer 


* **cbOffset**: Offset from beginning of input stream where reading should begin 


* **launchType**: Async launch type



  
**Returns**: Async future containing actual number of bytes read
Ensure buffer exists until result is retreived from std::future
  
### WriteAsync
Writes a block of data into stream asynchronously.

Parameters:  
* **cpbBuffer**: Buffer of data to write 


* **cbBuffer**: Size of buffer 


* **cbOffset**: Offset from beginning of output stream to where writing should begin 


* **launchType**: Async launch type



  
**Returns**: Async future containing actual number of bytes written
Ensure buffer exists until result is retreived from std::future
  
### FlushAsync
Flushes output stream buffer asynchronously.

Parameters:  
* **launchType**: Async launch type



  
**Returns**: Async future containing whether or not flush was successful
  
### Read
Reads a block of data from stream synchronously.

Parameters:  
* **pbBuffer**: Buffer into which stream should be read 


* **cbBuffer**: Size of buffer



  
**Returns**: Actual number of bytes read
  
### Read
Reads a block of data from stream synchronously.

Parameters:  
* **u64size**: Size of data to read (in bytes)



  
**Returns**: Vector of actual read data
  
### Write
Writes a block of data into stream synchronously.

Parameters:  
* **cpbBuffer**: Buffer of data to write 


* **cbBuffer**: Size of buffer



  
**Returns**: Actual number of bytes written
  
### Flush
Flushes output stream buffer synchronously.

  
**Returns**: Whether or not flush was successful
  
### SharedStream
Clones stream.

  
**Returns**: Cloned stream
  
### Seek
Seeks to a position within the stream.

Parameters:  
* **u64Position**: Byte offset from beginning of stream


  
### CanRead
Gets whether or not stream can be read.

  
**Returns**: Whether or not stream can be read
  
### CanWrite
Gets whether or not stream can be written.

  
**Returns**: Whether or not stream can be written
  
### Position
Gets current position of stream from beginning (in bytes)

  
**Returns**: Current positition of stream from beginning (in bytes)
  
### Size
Gets size of stream (in bytes)

  
**Returns**: Size of stream (in bytes)
  
### Size
Sets size of stream (in bytes)

Parameters:  
* **u64Value**: Size of stream (in bytes)

