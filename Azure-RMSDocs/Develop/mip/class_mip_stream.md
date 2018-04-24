# class mip::Stream 
A class that defines the interface between the mip sdk and stream based content.
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public int64_t Read | Read into a buffer from the stream.
public int64_t Write | Write ino the stream from a buffer.
public bool Flush | flush the stream.
public void Seek | Seek specific position within the stream.
public bool CanRead | A check if stream is readable.
public bool CanWrite | A check if stream is writeable.
public uint64_t Position | Get the current position within the stream.
public uint64_t Size | Get the size of the content within the stream.
public void Size | Set the stream size.
public std::shared_ptr< Stream > Clone | Clone the stream.
## Members
### Read
Read into a buffer from the stream.
#### Parameters
* buffer pointer to a buffer 
* bufferLength buffer size. 
#### Returns
number of bytes actually read.
### Write
Write ino the stream from a buffer.
#### Parameters
* buffer pointer to a buffer 
* bufferLength buffer size. 
#### Returns
number of bytes actually read.
### Flush
flush the stream.
#### Returns
true if successful else false.
### Seek
Seek specific position within the stream.
#### Parameters
* position to seek into stream.
### CanRead
A check if stream is readable.
#### Returns
true if readable else false.
### CanWrite
A check if stream is writeable.
#### Returns
true if writeable else false.
### Position
Get the current position within the stream.
#### Returns
position within the stream.
### Size
Get the size of the content within the stream.
#### Returns
the stream size.
### Size
Set the stream size.
#### Parameters
* stream size.
### Stream
Clone the stream.
#### Returns
new stream.