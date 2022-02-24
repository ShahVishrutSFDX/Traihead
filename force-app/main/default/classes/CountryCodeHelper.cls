public class CountryCodeHelper {
    public static string getCountryCode(String country) {
        String s = 'Invalid country code';
        if(country.length() > 3){
            system.debug('Length of the country is -->' + country.length() );
            return s;
            
        }else
        {
            Country_Code__mdt countryCode = Country_Code__mdt.getInstance(country);
            //system.debug('CountryCode-->'+ countryCode.Label);
            return countryCode.Country_Code__c;
        }
        
        
    }
}