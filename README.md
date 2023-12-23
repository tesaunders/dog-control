# Dog Control

Analysis of Auckland Council Animal Management data relating to dogs.

## Data

I compiled the data from [annual reports](https://www.aucklandcouncil.govt.nz/plans-projects-policies-reports-bylaws/our-policies/Pages/policy-on-dogs.aspx) released by Animal Management, starting in 2014. Note: The presentation of data changes over time, so that some variables are missing in some years, while others are added that were previously not reported.

Within the 'Requests for service' section, I have combined the following variables:
- 'Roaming dogs - General' and 'Roaming Dogs - Risk to public' have been combined under 'roaming-dogs'.
- 'Dog attack - Animals' and 'Dog attack - stock' have been combined under 'dog-attack-animals' in earlier years before Animal Management started to do this.
- 'Miscellaneous' also incorporates 'Dog traps'.

## Licence

The compiled dataset `dog-control.csv` is licensed under Creative Commons Attribution 4.0.

All code in this repository is licensed under the [MIT License](LICENSE).