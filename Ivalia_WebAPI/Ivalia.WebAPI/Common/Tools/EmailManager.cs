using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;

namespace Ivalia.WebAPI.Common.Tools
{
    public class EmailManager
    {
        private IConfiguration Configuration;

        public EmailManager(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        private EmailConfig GetDefaultConfig()
        {
            return new EmailConfig
            {
                Email = Configuration.GetSection("EmailConfig:Email").Value,
                Password = Configuration.GetSection("EmailConfig:Password").Value,
                SMTP = Configuration.GetSection("EmailConfig:SMTP").Value,
                Port = int.Parse(Configuration.GetSection("EmailConfig:Port").Value),
                SSL = bool.Parse(Configuration.GetSection("EmailConfig:SSL").Value)
            };
        }

        public void SendAsync(Email email)
        {
            var EmailConfig = GetDefaultConfig();
            var Message = new MailMessage();

            Message.From = new MailAddress(EmailConfig.Email);

            foreach (var Recipient in email.To)
                Message.To.Add(new MailAddress(Recipient));

            Message.Subject = email.Subject;
            Message.Body = email.Body;
            Message.IsBodyHtml = true;

            if (email.HasAttachments())
            {
                foreach (var Path in email.Attachments)
                {
                    Attachment AttachedFile = new Attachment(Path);
                    Message.Attachments.Add(AttachedFile);
                }
            }

            SmtpClient Client = new SmtpClient(EmailConfig.SMTP);
            Client.Credentials = new NetworkCredential(EmailConfig.Email, EmailConfig.Password);
            Client.EnableSsl = EmailConfig.SSL;
            Client.Port = EmailConfig.Port;

            Client.SendAsync(Message, "Recovery Mail");
        }

        class EmailConfig
        {
            public string Email { get; set; }
            public string Password { get; set; }
            public string SMTP { get; set; }
            public int Port { get; set; }
            public bool SSL { get; set; }
        }
    }

    public class Email
    {
        public List<string> To { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }
        public List<string> Attachments { get; set; }

        public bool HasAttachments()
        {
            return Attachments?.Count > 0;
        }
    }
}
