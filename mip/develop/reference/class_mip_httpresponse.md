# class mip::HttpResponse 
Interface that describes a single HTTP response, implemented by client app when overriding [HttpDelegate](class_mip_httpdelegate.md).
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public int32_t GetStatusCode() const  |  Get response status code.
 public const std::string& GetBody() const  |  Get request body.
public const std::map<std::string, std::string, CaseInsensitiveComparator>& GetHeaders() const  |  Get request headers.
  
## Members
  
### GetStatusCode
Get response status code.

  
**Returns**: Status code
  
### GetBody
Get request body.

  
**Returns**: Request body
  
### GetHeaders
Get request headers.

  
**Returns**: Request headers