namespace EFC_DBFirst.Entities
{
    public class Class
    {
        public int ClassID { get; set; }

        public string ClassName { get; set; }

        public List<Lesson> Lessons { get; set; }

        public List<Student> Students { get; set; }
    }
}
