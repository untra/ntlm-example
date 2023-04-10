# ntlm-example

How to run in IIS

Based on this article: https://learn.microsoft.com/en-us/aspnet/core/security/authentication/windowsauth?view=aspnetcore-7.0&tabs=visual-studio

1. Go to "Windows turn off/on features" in Control Panel
  a. Enable .NET 4.8 Frameowrk
<img width="414" alt="Screenshot 2023-04-10 at 1 24 54 PM" src="https://user-images.githubusercontent.com/98342720/230980706-ecb76e2b-3e02-4ed3-9a8c-e18aa76c4bdc.png">
  b. Enable IIS settings and World Wide Web services underneath IIS (make sure Windows Authentication is checked)
  <img width="272" alt="Screenshot 2023-04-10 at 1 27 13 PM" src="https://user-images.githubusercontent.com/98342720/230981292-e59b2b8b-f68d-4973-9d00-42bf21de58d0.png">
<img width="426" alt="Screenshot 2023-04-10 at 1 28 20 PM" src="https://user-images.githubusercontent.com/98342720/230981310-cdf78cc9-287d-4ef0-8c49-5d21cea701b8.png">
2. Install .net core hosting with Windows
  https://learn.microsoft.com/en-us/aspnet/core/host-and-deploy/iis/?view=aspnetcore-7.0

2. Add your site to IIS 
  a. Publish to IIS: https://learn.microsoft.com/en-us/aspnet/core/tutorials/publish-to-iis?source=recommendations&view=aspnetcore-7.0&tabs=visual-studio
  b. Make sure Windows Authenticaiton is enabled in your security settings
  <img width="549" alt="Screenshot 2023-04-10 at 2 13 01 PM" src="https://user-images.githubusercontent.com/98342720/230989442-73f97ff4-6b22-48a3-a5ab-b1eae40fd547.png">
