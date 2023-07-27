#' Get csv of states to fill out
#'
#' @param file Path to save file to
#' @param overwrite Overwrite file if it already exists
#'
#' @return
#' @export
fetch_states_file <- function(file = "states.csv", overwrite = FALSE) {
  source <- system.file("state_visits.csv", package = "mapme")
  invisible(file.copy(source, file, overwrite = overwrite))
}

#' Get csv of cities to fill out
#'
#' @param file Path to save file to
#' @param overwrite Overwrite file if it already exists
#'
#' @return
#' @export
fetch_cities_file <- function(file = "cities.csv", overwrite = FALSE) {
  source <- system.file("cities.csv", package = "mapme")
  invisible(file.copy(source, file, overwrite = overwrite))
}

#' Create necessary files to generate map
#'
#' @param dir Directory to save files to
#'
#' @return
#' @export
init <- function(dir, overwrite = FALSE) {
  fetch_cities_file(file.path(dir, "cities.csv", overwrite = overwrite))
  fetch_states_file(file.path(dir, "states.csv", overwrite = overwrite))
  print(paste0("Please fill out both files in the directory: ", dir))
}

get_cities <- function(city_status) {
  geocode <- AOI::geocode(city_status$location)
  sf::st_as_sf(
    geocode,
    coords = c("lon", "lat"),
    crs = 4326,
    agr = "constant"
  )
}

#' Generate a map of places you have been/lived
#'
#' @param state_file Path to state file (see `fetch_states_file`)
#' @param city_file Path to city file (see `fetch_cities_file`)
#' @param border_color Border color
#' @param city_color City color
#' @param status_fill State color (length 2: never, visited, lived)
#'
#' @return
#' @export
mapme <- function(state_file, city_file, border_color = "#F2F1F1", city_color = "#EA3223",
                  status_fill = c("#E5E5E5", "#afb6d2", "#A0BEA5")) {

  visit_status <- read.csv(state_file, colClasses = c(GEOID = "character"))
  city_status <- read.csv(city_file)

  unique_state_status <- unique(visit_status$status)

  for (value in unique_state_status) {
    if (!value %in% c("visited", "lived", "never")) {
      stop(
        paste0(
          "All statuses in state file must be 'visited', 'lived', or 'never'. Found: ",
          value
        )
      )
    }
  }

  visit_status$status = factor(
    visit_status$status,
    c("never", "visited", "lived")
  )

  cities_sf <- get_cities(city_status)

  tmp <- tidycensus::state_laea

  tmp <- dplyr::left_join(tmp, visit_status, by = "GEOID")
  tmp <- dplyr::filter(tmp, !GEOID %in% c("15", "02"))
  ggplot2::ggplot(tmp) +
    ggplot2::geom_sf(ggplot2::aes(fill = status), color = border_color) +
    ggplot2::geom_sf(data = cities_sf, size = 3, color = city_color) +
    ggplot2::scale_fill_manual(values = status_fill) +
    ggplot2::theme_void() +
    ggplot2::theme(legend.position = "none")
}


