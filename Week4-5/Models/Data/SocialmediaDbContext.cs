using Hafta4.Entities;
using Microsoft.EntityFrameworkCore;

namespace Hafta4.Data
{
    public class SocialmediaDbContext : DbContext
    {
        public SocialmediaDbContext(DbContextOptions<SocialmediaDbContext> options  ) : base( options )
        {

        }

        public DbSet<Comments> Comments { get; set; }
        public DbSet<Friendship_status> Friendship_Statuses { get; set; }   
        public DbSet<Friendships> Friendships { get; set; }
        public DbSet<Group_messages> Group_Messages { get; set; }
        public DbSet<Groupmsg_history> Groupmsg_Histories { get; set; }
        public DbSet<Groups> Groups { get; set; }
        public DbSet<Memberships> Memberships { get; set; }
        public DbSet<Posts> Posts { get; set; }
        public DbSet<Types> Types { get; set; }
        public DbSet<User_messages> User_Messages { get; set; }
        public DbSet<Usermsg_histories> Usermsg_Histories { get; set; }
        public DbSet<Users> Users { get; set; }

    }
}
