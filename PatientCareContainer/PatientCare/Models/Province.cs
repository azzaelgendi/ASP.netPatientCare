using System;
using System.Collections.Generic;

namespace PatientCare.Models
{
    public partial class Province
    {
        public Province()
        {
            Patient = new HashSet<Patient>();
        }

        public string ProvinceCode { get; set; }
        public string Name { get; set; }
        public string CountryCode { get; set; }

        public Country CountryCodeNavigation { get; set; }
        public ICollection<Patient> Patient { get; set; }
    }
}
