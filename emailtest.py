import smtplib
from email.message import EmailMessage
email_address = 'ltchi23101999@gmail.com'
email_password = 'n23t10n1999'
msg = EmailMessage()
msg['Subject'] = 'This is my first Python email'
msg['From'] = email_address
msg['To'] = ['ltchi23101999@gmail.com'] #Gửi đến 1-* nhận cụ thể
msg.set_content('And it actually works')
#Gửi 1 tệp đính kèm.pdf
with open('avata.pdf', 'rb') as pdf:
    msg.add_attachment(pdf.read(), maintype='application', subtype='octet-stream', filename=pdf.name)
#Gửi file zip
with open('avata.pdf.zip', 'rb') as file:
    msg.add_attachment(file.read(), maintype='application', subtype='octet-stream', filename=file.name)
with smtplib.SMTP_SSL('smtp.gmail.com',465) as smtp:
    smtp.login(email_address, email_password)
    smtp.send_message(msg)
