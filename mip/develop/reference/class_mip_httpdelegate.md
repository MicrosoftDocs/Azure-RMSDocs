# class mip::HttpDelegate 
Interface for overriding http handling.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::shared_ptr<HttpResponse> Send(const std::shared_ptr<HttpRequest>& request, const std::shared_ptr<void>& context)  |  Send http request.
  
## Members
  
### HttpResponse
Send http request.

Parameters:  
* **request**: Http request 


* **context**: The same opaque client context that was passed to the API that resulted in this http request



  
**Returns**: Http response