using EFC_DBFirst.Entities;
using Microsoft.EntityFrameworkCore;

namespace EFC_DBFirst
{
    public class ScDBContext : DbContext
    {
        public ScDBContext(DbContextOptions<ScDBContext> options) : base(options)
        {

        }

        public DbSet<School> Schools { get; set; }
        public DbSet<Teacher> Teachers { get; set; }
        public DbSet<Lesson> Lessons { get; set; }
        public DbSet<Student> Students { get; set; }
        public DbSet<Class> Classes { get; set; }
    }
}
