﻿using System;
using System.Collections.Generic;

namespace PatientCare.Models
{
    public partial class Patient
    {
        public Patient()
        {
            PatientTreatment = new HashSet<PatientTreatment>();
        }

        public int PatientId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string ProvinceCode { get; set; }
        public string PostalCode { get; set; }
        public string Ohip { get; set; }
        public DateTime? DateOfBirth { get; set; }
        public bool Deceased { get; set; }
        public DateTime? DateOfDeath { get; set; }
        public string HomePhone { get; set; }
        public string Gender { get; set; }

        public Province ProvinceCodeNavigation { get; set; }
        public ICollection<PatientTreatment> PatientTreatment { get; set; }
    }
}
