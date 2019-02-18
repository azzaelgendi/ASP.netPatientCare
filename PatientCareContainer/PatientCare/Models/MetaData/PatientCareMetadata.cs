using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace PatientCare.Models
{   [ModelMetadataType(typeof(PatientCareMetadata))]

    public partial class Patient : IValidatableObject
    {
        // PatientCareContext _context = new PatientCareContext();
        PatientCareContext _context = PatientCareContext.Context;
        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            Province province = new Province();
            string PostalCodePattern="";
            string phonePattern="";
            string CapitalFirst(string line)
            {
                string[] toSplit;


                toSplit = line.Split();

                line = "";
                foreach (var item in toSplit)
                {
                    line += item.Substring(0, 1).ToUpper() + item.Substring(1).ToLower();
                }
                return line.Trim();
            }
            if (!string.IsNullOrEmpty(FirstName))
            {
                FirstName = FirstName.Trim();
                FirstName =CapitalFirst(FirstName);
            }
            else
            {
                yield return new ValidationResult("first name cant be empty", new[] { "FirstName" });
            }
            if (!string.IsNullOrEmpty(LastName))
            {
                LastName = CapitalFirst(LastName).Trim();
            }
            else
            {
                yield return new ValidationResult("last name cant be empty", new[] { "lastName" });
            }
            if (!string.IsNullOrEmpty(City))
            {
                City = City.Trim();
            }
            if (!string.IsNullOrEmpty(Address))
            {
                Address = Address.Trim();
            }
            if (!string.IsNullOrEmpty(ProvinceCode))
            {
                ProvinceCode = ProvinceCode.Trim().ToUpper();
                province = _context.Province.FirstOrDefault(p => p.ProvinceCode == ProvinceCode);
                if (province==null)
                {
                    yield return new ValidationResult("ProvinceCode is not in file", new[] { "ProvinceCode" });
                }
                else
                {
                    Country country = _context.Country
                        .FirstOrDefault(c => c.CountryCode == province.CountryCode);
                    PostalCodePattern = country.PostalPattern;
                    phonePattern = country.PhonePattern;
                }
            }
            if (string.IsNullOrEmpty(ProvinceCode) && !string.IsNullOrEmpty(PostalCode))
            {
                yield return new ValidationResult("you need to enter province code to validate", new[] {"PostalCode"});
            }
            else if (!string.IsNullOrEmpty(PostalCode))
            {
                Regex regex = new Regex(PostalCodePattern, RegexOptions.IgnoreCase);
                if (!regex.IsMatch(PostalCode))
                {
                    yield return new ValidationResult(" provincecode is not match", new[] { "PostalCode" });
                }
            }
            yield return ValidationResult.Success;
        }
    }
    
    public class PatientCareMetadata
    {
        public int PatientId { get; set; }
        [Required]
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
