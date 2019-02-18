using System;
using System.Collections.Generic;

namespace PatientCare.Models
{
    public partial class Category
    {
        public Category()
        {
            Diagnosis = new HashSet<Diagnosis>();
        }

        public int CategoryId { get; set; }
        public string Name { get; set; }

        public ICollection<Diagnosis> Diagnosis { get; set; }
    }
}
