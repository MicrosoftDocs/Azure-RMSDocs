# class mip::HttpDelegate 
Interface for overriding HTTP handling.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::shared_ptr<HttpResponse> Send(const std::shared_ptr<HttpRequest>& request, const std::shared_ptr<void>& context)  |  Send HTTP request.
  
## Members
  
### HttpResponse
Send HTTP request.

Parameters:  
* **request**: HTTP request 


* **context**: The same opaque client context that was passed to the API that resulted in this HTTP request



  
**Returns**: HTTP response