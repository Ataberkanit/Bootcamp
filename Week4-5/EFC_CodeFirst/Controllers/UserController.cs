using Hafta4.Entities;
using Microsoft.AspNetCore.Mvc;
using RabbitMQ.Client;
using Services;
using System.Text;

namespace Hafta4.Controllers
{
    public class UserController : ControllerBase

    {
        private readonly IUserService service;

        [HttpPost("AddUser")] //kullanici eklendiğinde event gönder
        public IActionResult AddUser([FromQuery] string key)
        {
            var result = service.FilterUsers(key);

            if (result is not null)
            {
                var connectioFactory = new ConnectionFactory()
                {
                    HostName = "localhost",
                    VirtualHost = "/",
                    Port = 5672,
                    UserName = "guest",
                    Password = "guest"
                };

                using var connection = connectioFactory.CreateConnection();
                using var channel = connection.CreateModel();
                channel.ExchangeDeclare("fanout.test", "fanout", false, false);

                channel.QueueDeclare("fanout.queue1", false, false, true);

                channel.QueueBind("fanout.queue1", "fanout.test", string.Empty);

                channel.BasicPublish("fanout.test", string.Empty, null, Encoding.UTF8.GetBytes("Kullanici Eklendi"));

                Console.WriteLine("Gönderildi");

                channel.Close();
                connection.Close();

                Console.Read();
            }
            return Ok(result);
        }

        //Pagging search ve filtreleme
        [HttpGet]
        [Route("UsersQuery")]
        public IActionResult GetUsers([FromQuery] Users users)
        {

            var metadata = new
            {
                users.Id,
                users.Name,
                users.Surname
            };

            Response.Headers.Add("Paging", System.Text.Json.JsonSerializer.Serialize(metadata));
            return Ok(users);
        }
    }
}
