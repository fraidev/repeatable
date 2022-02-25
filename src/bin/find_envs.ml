let cron_time () =
  match Sys.getenv_opt "CRON_TIME" with
  | Some env -> int_of_string env
  | None -> 30
;;

let command () =
  match Sys.getenv_opt "COMMAND" with
  | Some env -> env
  | None -> failwith "COMMAND not set"
;;