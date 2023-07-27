## code to prepare `states` dataset goes here

visit_status <- tibble::tribble(
  ~name, ~postal_code, ~GEOID, ~status,
  "Alabama",         "AL",  "01", "visited",
  "Alaska",         "AK",  "02", "visited",
  "Arizona",         "AZ",  "04", "visited",
  "Arkansas",         "AR",  "05", "visited",
  "California",         "CA",  "06", "visited",
  "Colorado",         "CO",  "08", "lived",
  "Connecticut",         "CT",  "09", "never",
  "Delaware",         "DE",  "10", "never",
  "Florida",         "FL",  "12", "lived",
  "Georgia",         "GA",  "13", "visited",
  "Hawaii",         "HI",  "15", "never",
  "Idaho",         "ID",  "16", "visited",
  "Illinois",         "IL",  "17", "visited",
  "Indiana",         "IN",  "18", "visited",
  "Iowa",         "IA",  "19", "visited",
  "Kansas",         "KS",  "20", "visited",
  "Kentucky",         "KY",  "21", "visited",
  "Louisiana",         "LA",  "22", "visited",
  "Maine",         "ME",  "23", "never",
  "Maryland",         "MD",  "24", "never",
  "Massachusetts",         "MA",  "25", "never",
  "Michigan",         "MI",  "26", "never",
  "Minnesota",         "MN",  "27", "lived",
  "Mississippi",         "MS",  "28", "visited",
  "Missouri",         "MO",  "29", "visited",
  "Montana",         "MT",  "30", "visited",
  "Nebraska",         "NE",  "31", "visited",
  "Nevada",         "NV",  "32", "visited",
  "New Hampshire",         "NH",  "33", "never",
  "New Jersey",         "NJ",  "34", "never",
  "New Mexico",         "NM",  "35", "visited",
  "New York",         "NY",  "36", "never",
  "North Carolina",         "NC",  "37", "never",
  "North Dakota",         "ND",  "38", "never",
  "Ohio",         "OH",  "39", "never",
  "Oklahoma",         "OK",  "40", "visited",
  "Oregon",         "OR",  "41", "lived",
  "Pennsylvania",         "PA",  "42", "never",
  "Rhode Island",         "RI",  "44", "never",
  "South Carolina",         "SC",  "45", "never",
  "South Dakota",         "SD",  "46", "visited",
  "Tennessee",         "TN",  "47", "visited",
  "Texas",         "TX",  "48", "visited",
  "Utah",         "UT",  "49", "visited",
  "Vermont",         "VT",  "50", "never",
  "Virginia",         "VA",  "51", "never",
  "Washington",         "WA",  "53", "visited",
  "West Virginia",         "WV",  "54", "never",
  "Wisconsin",         "WI",  "55", "visited",
  "Wyoming",         "WY",  "56", "visited",
  "American Samoa",         "AS",  "60", "never",
  "Guam",         "GU",  "66", "never",
  "Northern Mariana Islands",         "MP",  "69", "never",
  "Puerto Rico",         "PR",  "72", "never",
  "Virgin Islands",         "VI",  "78", "never"
)

usethis::use_data(visit_status, overwrite = TRUE)

visit_status$status <- "never"

cities <- tibble::tribble(
  ~location,
  "Minneapolis, MN"
)


write.csv(visit_status, "inst/state_visits.csv", row.names = F)
write.csv(cities, "inst/cities.csv", row.names = F)



