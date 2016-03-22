#welcome to docs.microsoft.com

---
title: This is page title
---

# Outlook Calendar REST API reference

# Include syntax
[!INCLUDE [Introduction md](introduction.md)]

This is include text: [!INCLUDE [Introduction md](introduction.md)] hello world

## <a id="Code_table"> </a>Code table

## <a id="ABCCodefasdfasdf_table" />ABCCode table

> [!div class="tabbedCodeSnippets" data-resources="OutlookServices.Calendar"]
```cs-i
var outlookClient = await CreateOutlookClientAsync("Calendar");
var events = await outlookClient.Me.Events
  .Take(10)
  .ExecuteAsync();
foreach(var calendarEvent in events.CurrentPage)
{
  System.Diagnostics.Debug.WriteLine("Event '{0}'.", calendarEvent.Subject);
}
```
```javascript-i
outlookClient.me.events.getEvents().fetch().then(function (result) {
    result.currentPage.forEach(function (event) {
console.log('Event "' + event.subject + '"')
    });
}, function(error) {
    console.log(error);
});
```

##NOTE
> [!NOTE]
> This is NOTE

The above is NOTE text

> [!WARNING]
> This is WARNING

The above is WARNING text

> [!TIP]
> This is TIP

The above is TIP text

> [!IMPORTANT]
> This is IMPORTANT

The above is IMPORTANT text

> [!CAUTION]
> This is CAUTION

The above is CAUTION text

If any question, please contact me~

## <a> </a>Responsive Table
Scenario  |Permission
------------- | ------------- |
Password Sync| <ul><li>Replicate Directory Changes.</li>  <li>Replicate Directory Changes All.</li></ul>
Exchange Hybrid Deployment|See [Office 365 Exchange Hybrid AAD Sync write-back attributes and permissions](https://msdn.microsoft.com/library/azure/dn757602.aspx#exchange).
Password Write-back | <ul><li>Change Password</li><li>Reset password</li></ul>
User, Group, and Device Write-back|Write permissions to the directory objects and attributes that you wish to 'write-back'
Single Sign-On and AD FS| Domain admin permissions in the domain in which your federated servers are located. 

## Azure selector
The following content contains azure single and multi selectors
### Azure single selector
> [!div class="op_single_selector"]
> * [Universal Windows](../articles/notification-hubs-windows-store-dotnet-get-started/.md)
> * [Windows Phone](../articles/notification-hubs-windows-phone-get-started/.md)
> * [iOS](../articles/notification-hubs-ios-get-started/.md)
> * [Android](../articles/notification-hubs-android-get-started/.md)
> * [Kindle](../articles/notification-hubs-kindle-get-started/.md)
> * [Baidu](../articles/notification-hubs-baidu-get-started/.md)
> * [Xamarin.iOS](../articles/partner-xamarin-notification-hubs-ios-get-started/.md)
> * [Xamarin.Android](../articles/partner-xamarin-notification-hubs-android-get-started/.md)
> 
> 

### Azure multi selectors
> [!div class="op_multi_selector" title1="Platform" title2="Backend"]
> * [(iOS | .NET)](./mobile-services-dotnet-backend-ios-get-started-push.md)
> * [(iOS | JavaScript)](./mobile-services-javascript-backend-ios-get-started-push.md)
> * [(Windows universal C# | .NET)](./mobile-services-dotnet-backend-windows-universal-dotnet-get-started-push.md)
> * [(Windows universal C# | Javascript)](./mobile-services-javascript-backend-windows-universal-dotnet-get-started-push.md)
> * [(Windows Phone | .NET)](./mobile-services-dotnet-backend-windows-phone-get-started-push.md)
> * [(Windows Phone | Javascript)](./mobile-services-javascript-backend-windows-phone-get-started-push.md)
> * [(Android | .NET)](./mobile-services-dotnet-backend-android-get-started-push.md)
> * [(Android | Javascript)](./mobile-services-javascript-backend-android-get-started-push.md)
> * [(Xamarin iOS | Javascript)](./partner-xamarin-mobile-services-ios-get-started-push.md)
> * [(Xamarin Android | Javascript)](./partner-xamarin-mobile-services-android-get-started-push.md)
> 
> 
