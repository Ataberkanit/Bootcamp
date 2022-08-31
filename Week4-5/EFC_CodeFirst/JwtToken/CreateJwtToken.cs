using Hafta4.Entities;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace Hafta4.JwtToken
{
    public class TokenGenarator
    {
        private readonly IConfiguration _configuration;
        public TokenGenarator(IConfiguration configuration){  _configuration = configuration; }
        public string GetToken(Users user)
        {
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["JWT:Secret"]));

            var userClaims = new List<Claim>
            {
                new Claim(type: ClaimTypes.Name,user.Name),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
            };
            var token = new JwtSecurityToken(
           issuer: _configuration["JWT:ValidIssuer"],
           audience: _configuration["JWT:ValidAudience"],
           expires: DateTime.Now.AddHours(1),
           claims: userClaims,
           signingCredentials: new SigningCredentials(key, SecurityAlgorithms.HmacSha256)
           );
            var tokenHandler = new JwtSecurityTokenHandler();
            var jwt = tokenHandler.WriteToken(token);
            return jwt;
        }
    }
}
