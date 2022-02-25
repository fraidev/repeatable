open Lwt

let cron_time = Find_envs.cron_time ()
let command = Find_envs.command ()

let job () =
  let _ = Sys.command command in
  ()
;;

let rec cronjob () =
  let jobLoop () =
    job ();
    cronjob ()
  in
  Lwt_unix.sleep 1. >>= jobLoop
;;

Lwt_main.run (cronjob ())
