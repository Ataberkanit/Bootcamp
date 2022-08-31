namespace EFC_DBFirst.Entities
{
    public class Student
    {
        public int StudentID { get; set; }

        public string StudentName { get; set; }

        public int SchoolID { get; set; }

        public int ClassID { get; set; }

        public List<Lesson> Lessons { get; set; }
    }
}
