default_run_options[:pty]= true

set :user, "ando"
set :use_sudo, true

role :web, "v157-7-152-67.z1d1.static.cnode.jp"
