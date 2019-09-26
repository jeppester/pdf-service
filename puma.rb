threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count
port        ENV.fetch("PORT") { 8080 }
environment "production"
plugin :tmp_restart
