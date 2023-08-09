library(pins)
library(ntdr)



ntdr_board <- board_s3(bucket = "ntdr-pins",
         versioned = TRUE,
         access_key = Sys.getenv("PINS_S3_KEY"), 
         secret_access_key = Sys.getenv("PINS_S3_PASSWORD"),
         region = "us-west-2")

upt_adjusted <- get_ntd(data_type = "adjusted", ntd_variable = "UPT", cache = TRUE)
upt_raw <- get_ntd(data_type = "raw", ntd_variable = "UPT", cache = TRUE)
vrm_adjusted <- get_ntd(data_type = "adjusted", ntd_variable = "VRM", cache = TRUE)
vrm_raw <- get_ntd(data_type = "raw", ntd_variable = "VRM", cache = TRUE)
vrh_adjusted <- get_ntd(data_type = "adjusted", ntd_variable = "VRH", cache = TRUE)
vrh_raw <- get_ntd(data_type = "raw", ntd_variable = "VRH", cache = TRUE)
voms_adjusted <- get_ntd(data_type = "adjusted", ntd_variable = "VOMS", cache = TRUE)
voms_raw <- get_ntd(data_type = "raw", ntd_variable = "VOMS", cache = TRUE)

pin_write(board = ntdr_board, x = upt_adjusted)
pin_write(board = ntdr_board, x = upt_raw)
pin_write(board = ntdr_board, x = vrm_adjusted)
pin_write(board = ntdr_board, x = vrm_raw)
pin_write(board = ntdr_board, x = vrh_adjusted)
pin_write(board = ntdr_board, x = vrh_raw)
pin_write(board = ntdr_board, x = voms_adjusted)
pin_write(board = ntdr_board, x = voms_raw)

write_board_manifest("ntdr-pins")
