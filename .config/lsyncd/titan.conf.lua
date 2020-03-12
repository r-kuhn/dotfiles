settings {
  logfile = "/tmp/lsyncd.log",
  statusFile = "/tmp/lsyncd-status.log",
  nodaemon   = true,
  statusInterval = 20
}

-- backup nvme to spinning disk array
sync {
  default.rsync,
  source = "/noibu",
  target = "/backups/noibu",
  delay = 5,
}

-- Send websessions and rawws to rhea
sync {
  default.rsyncssh,
  source = "/noibu/websessions",
  host = "10.0.0.5",
  targetdir = "/noibu/websessions",
  delay = 5,
  rsync = {
    rsh="/usr/bin/ssh -l dan -i /home/dan/.ssh/id_rsa -o StrictHostKeyChecking=no",
    chmod=0750,
    compress=true,
    owner=true,
    perms=true
  }
}
sync {
  default.rsyncssh,
  source = "/noibu/rawws",
  host = "10.0.0.5",
  targetdir = "/noibu/rawws",
  delay = 5,
  rsync = {
    rsh="/usr/bin/ssh -l dan -i /home/dan/.ssh/id_rsa -o StrictHostKeyChecking=no",
    chmod=0750,
    compress=true,
    owner=true,
    perms=true
  }
}

-- Send websessions and rawws to lapetus
sync {
  default.rsyncssh,
  source = "/noibu/websessions",
  host = "10.0.0.6",
  targetdir = "/noibu/websessions",
  delay = 5,
  rsync = {
    rsh="/usr/bin/ssh -l dan -i /home/dan/.ssh/id_rsa -o StrictHostKeyChecking=no",
    chmod=0750,
    compress=true,
    owner=true,
    perms=true
  }
}
sync {
  default.rsyncssh,
  source = "/noibu/rawws",
  host = "10.0.0.6",
  targetdir = "/noibu/rawws",
  delay = 5,
  rsync = {
    rsh="/usr/bin/ssh -l dan -i /home/dan/.ssh/id_rsa -o StrictHostKeyChecking=no",
    chmod=0750,
    compress=true,
    owner=true,
    perms=true
  }
}
