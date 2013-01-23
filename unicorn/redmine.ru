working_directory "/srv/http/redmine.archwomen.org"
pid "/tmp/redmine.pid"

preload_app true
timeout 60
worker_processes 2
listen 4000
stderr_path('/var/log/unicorn/unicorn.log')

GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true

after_fork do |server, worker|
    # start the worker on port 4000, 4001, 4002, etc...
    addr = "0.0.0.0:#{4000 + worker.nr}"
    # infinite tries to start the worker
    server.listen(addr, :tries => -1, :delay => -1, :backlog => 128)

    # Drop priveleges if running as root
    worker.user('http', 'http') if Process.euid == 0
end
