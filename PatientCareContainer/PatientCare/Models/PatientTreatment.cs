using System;
using System.Collections.Generic;

namespace PatientCare.Models
{
    public partial class PatientTreatment
    {
        public PatientTreatment()
        {
            PatientMedication = new HashSet<PatientMedication>();
        }

        public int PatientTreatmentId { get; set; }
        public int? PatientId { get; set; }
        public int? TreatmentId { get; set; }
        public DateTime DatePrescribed { get; set; }
        public string Comments { get; set; }

        public Patient Patient { get; set; }
        public Treatment Treatment { get; set; }
        public ICollection<PatientMedication> PatientMedication { get; set; }
    }
}
