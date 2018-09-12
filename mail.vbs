Set objArgs = WScript.Arguments 

ipKKM = objArgs(0)
countDocs = objArgs(1)
email = objArgs(2)

Set emailObj      = CreateObject("CDO.Message")

emailObj.From     = "OFDMonitoring@web.ru"
emailObj.To       = email

emailObj.Subject  = "Мониторинг ОФД IP "&ipKKM&"; количество неотправленных документов: "&countDocs
emailObj.BodyPart.CharSet = "utf-8"
emailObj.TextBody = "IP ККМ: "&ipKKM&"; количество неотправленных документов: "&countDocs
emailObj.BodyPart.CharSet = "utf-8"
Set emailConfig = emailObj.Configuration

emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "server"
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing")    = 2  

emailConfig.Fields.Update

emailObj.Send
