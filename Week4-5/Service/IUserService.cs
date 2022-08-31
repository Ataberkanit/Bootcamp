using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services
{
    public interface IUserService
    {
        List<GetAllUserDto> GetAllUsers();
        List<PagedListUserDto> PagedListUsers(int page, int count);
        List<FilterUserDto> FilterUsers(string key);
    }
}
