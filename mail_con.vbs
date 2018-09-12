Set objArgs = WScript.Arguments 

ipKKM = objArgs(0)
email = objArgs(1)

Set emailObj      = CreateObject("CDO.Message")

emailObj.From     = "OFDMonitoring@web.ru"
emailObj.To       = email

emailObj.Subject  = "Мониторинг ОФД IP "&ipKKM&"; касса недоступна"
emailObj.BodyPart.CharSet = "utf-8"
emailObj.TextBody = "IP ККМ: "&ipKKM&"; касса недоступна"
emailObj.BodyPart.CharSet = "utf-8"
Set emailConfig = emailObj.Configuration

emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "server"
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing")    = 2  

emailConfig.Fields.Update

emailObj.Send
