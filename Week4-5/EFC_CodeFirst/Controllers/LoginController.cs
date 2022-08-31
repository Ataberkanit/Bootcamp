using Hafta4.Data;
using Hafta4.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace Hafta4.Controllers
{
    public class LoginController : ControllerBase
    {
        private readonly SocialmediaDbContext _context;
        private readonly UserManager<Users> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly IConfiguration _configuration;

        public LoginController(UserManager<Users> userManager, RoleManager<IdentityRole> roleManager, IConfiguration configuration, SocialmediaDbContext context)
        {
            _userManager = userManager;
            _roleManager = roleManager;
            _configuration = configuration;
            _context = context;
        }


        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginModel login)
        {
            List<Claim> claims = new List<Claim>();
            var user = await _userManager.FindByEmailAsync(login.Email);
            if (user == null) throw new Exception("");

            var result = await _userManager.CheckPasswordAsync(user, login.Password);
            if (result)
            {

                var roles = await _userManager.GetRolesAsync(user);
                foreach (var role in roles)
                {
                    claims.Add(new Claim(ClaimTypes.Role, role));
                }

                claims.Add(new Claim(ClaimTypes.Name, user.Surname));
                claims.Add(new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()));

                var token = GetToken(claims);

                var handler = new JwtSecurityTokenHandler(); // Token ı stringe çevirmek için
                string jwt = handler.WriteToken(token);

                return Ok(new
                {
                    token = jwt,
                    expiration = token.ValidTo
                });
            }

            return Unauthorized();
        }


        private JwtSecurityToken GetToken(List<Claim> claims) //token üretildi
        {

            var signinKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["JWT:Key"]));

            var token = new JwtSecurityToken(

                 signingCredentials: new SigningCredentials(signinKey, SecurityAlgorithms.HmacSha256),
                 issuer: _configuration["JWT:Issuer"],
                 audience: _configuration["JWT:Audience"],
                 expires: DateTime.Now.AddDays(1),
                 claims: claims
                );

            return token;

        }
        public class LoginModel
        {
            public string Email { get; set; }
            public string Password { get; set; }
        }
    }
}
