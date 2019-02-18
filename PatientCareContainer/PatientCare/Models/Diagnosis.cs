using System;
using System.Collections.Generic;

namespace PatientCare.Models
{
    public partial class Diagnosis
    {
        public Diagnosis()
        {
            Treatment = new HashSet<Treatment>();
        }

        public int DiagnosisId { get; set; }
        public string Name { get; set; }
        public int CategoryId { get; set; }

        public Category Category { get; set; }
        public ICollection<Treatment> Treatment { get; set; }
    }
}
